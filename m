Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE23597B
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779547225; cv=none; b=FKX0/9FszZbUfYqgMttdBQj0bM/ADRj1WmCSdSrYFSsb3hVBOls/GepgQnf4wrY8Efml41weFZcDKuCZ/dkQEjFFYm1aEpj9dTGkXUZMFC+OVgdUov2S1aOkpETBoeoB3evlMCSlDlGwDPrxkjbIAxgjWo8Z3wQRpZx2tTVvOwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779547225; c=relaxed/simple;
	bh=ThYNALx8YHTuYe4HUa5pQ/oDaIc1hpuH40vNhvSJp+8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V2hKmOzJggfIEZcHb+mmwOLw1wrgxTRt3Dic15j93PQLpy6N6SClXMePQFWLUcgzRlHsXXTxH2n2meBZsfIRhhiRBW6c3SA2cJJMc3ReunC8OLkiERpkLc2k+lITLg2byESsK+qwssD2ftvvw+ZUa9we3Hkgc2vrBI3osrUYoDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoFOZLCH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoFOZLCH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999BB1F000E9;
	Sat, 23 May 2026 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779547223;
	bh=jW7d5vyRrT4yGUYuplfqxsyZ5Egu1cjXPhqhtsK9ig8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DoFOZLCHG3GqH349tJflOgL2Z7MV6Gol8ghv70/qNiMWvQ9w80+XRkTh2Cbn5o2qY
	 v8W69uXVYUiVBaO2K9TgZ8yp+6G6FFTWRpKu4lujjlMCAt0PwqIgybB6NKI0mP/KrY
	 BCDPAcAMUMS+5sEksBdrDydbLJ14c18MzKR9LeHoYTa+UK7kzFghoMuZf8lzmEn2F1
	 05ZX3rdyvnATY3uztWjEoyZFLCV6mCGZjqBI++McSFu6hio2h12LBkt4ewCW1j5cyr
	 NDBqjSvHboINz9Voe9aV9Dfd/533dq8MBZo+X4j/MqsxsuOlmkU+3iapifeX5RzGmI
	 RMrfKR1IGQHwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/17] ACPI: GTDT: Account for GTDTv3 size when
 walking the platform timer descriptors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Zyngier" <maz@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260523140242.586031-2-maz@kernel.org>
References: <20260523140242.586031-2-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 14:40:22 +0000
Message-Id: <20260523144023.999BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing minimum length validation for platform timer subtables can=
 lead to out-of-bounds memory accesses when parsing malformed ACPI tables.
- [High] The patch adds size validation for GTDT revisions 2 and 3, but mis=
ses length validation for GTDT revision 1 tables.
--

commit 6795242683ef78c0e32a77285ea86c559ab6c178
Author: Marc Zyngier <maz@kernel.org>

ACPI: GTDT: Account for GTDTv3 size when walking the platform timer descrip=
tors

This commit updates the GTDT table parsing to support the expanded size of
GTDT revision 3, which includes an EL2-private virtual timer. It adjusts
the platform timer start offset based on the revision and adds a length
validation check for the base table.

> diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
> --- a/drivers/acpi/arm64/gtdt.c
> +++ b/drivers/acpi/arm64/gtdt.c
> @@ -34,14 +34,25 @@ struct acpi_gtdt_descriptor {

[ ... ]

>  static __init bool platform_timer_valid(void *platform_timer)
>  {
>  	struct acpi_gtdt_header *gh =3D platform_timer;
> +	void *platform_timer_begin;
> =20
> -	return (platform_timer >=3D (void *)(acpi_gtdt_desc.gtdt + 1) &&
> -		platform_timer < acpi_gtdt_desc.gtdt_end &&
> +	if (acpi_gtdt_desc.gtdt->header.revision >=3D 3)
> +		platform_timer_begin =3D container_of(acpi_gtdt_desc.gtdt, struct gtdt=
_v3, gtdt_v2) + 1;
> +	else
> +		platform_timer_begin =3D acpi_gtdt_desc.gtdt + 1;
> +
> +	return (platform_timer >=3D platform_timer_begin &&
> +		platform_timer + sizeof(*gh) <=3D acpi_gtdt_desc.gtdt_end &&
>  		gh->length !=3D 0 &&
>  		platform_timer + gh->length <=3D acpi_gtdt_desc.gtdt_end);
>  }

[Severity: High]
This is a pre-existing issue, but does this validation fully protect against
malformed ACPI tables?

While it checks that the subtable's declared length fits within the main
GTDT table, it does not verify that the length is large enough to contain
the specific subtable structure being parsed.

If a malformed GTDT table provides a subtable with a truncated length,
parser functions like is_non_secure_watchdog() might read fields past the
end of the provided table data. Could this lead to out-of-bounds memory
accesses when reading fields like wd->timer_flags?

[ ... ]

> @@ -166,6 +177,13 @@ int __init acpi_gtdt_init(struct acpi_table_header *=
table,
>  	u32 cnt =3D 0;
> =20
>  	gtdt =3D container_of(table, struct acpi_table_gtdt, header);
> +
> +	if ((gtdt->header.revision >=3D 3 && gtdt->header.length < sizeof(struc=
t gtdt_v3)) ||
> +	    (gtdt->header.revision =3D=3D 2 && gtdt->header.length < sizeof(*gt=
dt))) {
> +		pr_err(FW_BUG "GTDT with invalid size %d\n", gtdt->header.length);
> +		return -EINVAL;
> +	}
> +

[Severity: High]
This isn't a bug introduced by this patch, but since we are adding length
validation for revisions 2 and 3, should we also validate the length for
revision 1 tables?

If a system provides a malformed revision 1 GTDT table that is smaller than
its baseline required size, the initialization could succeed. Later accesses
to fields in acpi_gtdt_map_ppi() might read out-of-bounds memory.

Would it be safer to ensure all supported revisions meet their minimum
required sizes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523140242.5860=
31-1-maz@kernel.org?part=3D1
