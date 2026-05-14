Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDEB3939C9
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788454; cv=none; b=SukOogHt1++Q7raq7HCdSSax30vZ/46xLGw6rJpVjFkS4Lu+cvjFwQuO1dX0c/JSbcSO3ddSh/SFqfwg6VWjdRT7S+WylftnGGrtZSmB4wRnHsmxu/e6a3k73/Bui0EMPGiZaxcCA/6AM1FFl1PSUUV/Gqh2cu6KVd7KZc4UqJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788454; c=relaxed/simple;
	bh=eBzHZTi+V2Ynb+WQfMi+YwkVO8JBmh9nWgJQItW4/Tk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lNA8qG1IvSjaFG/PP+xnV4wBJaFGLFol0pHZr6vP/0PFa8caAAEWPKIK0neIe0pckDMte9zwbAnxam2nXAW37PME2N/1rRB2iM9VjrO454h+aszjthb0KdCbxhsjNGd1OcDMUHPmfj1UpqZLpVH6QDnNSeA3UhpV3PaY0xyU0fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXFQSiuf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXFQSiuf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FB0C2BCB3;
	Thu, 14 May 2026 19:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778788454;
	bh=eBzHZTi+V2Ynb+WQfMi+YwkVO8JBmh9nWgJQItW4/Tk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rXFQSiufcKKBrpEnWgko2iI8vBG6t7tRkalbBKDqLYjy0vQBkScjD/ppRW6ljGhRs
	 KElHQqISOraDJS63UqsRlLqcyFQFqo0xbqwC0Ca2MMR+Bqdc4sLpw4hkBf3u13Zzon
	 TU89/OXCy25TCCqprFYgti0sd5kwRuRP2n0GkxzmKqtMG+XR6fhdKoXVRCLr4pvTj8
	 g2ohq/P6HGfJBSAQWuEZ9Uq6Ywiub72mmmdF91Fwiv3WmLkn+vojtIW7fszvQ7If8L
	 ykyoYgSUGglF2OGb1AENW7jeCymmUSiEIMaE5lWHr4SuP7EjVeFkqKHvQLXmi90hZ/
	 QDZLIhBrDIizg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/17] ACPI: GTDT: Account for GTDTv3 size when
 walking the platform timer descriptors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Zyngier" <maz@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514150945.3917510-2-maz@kernel.org>
References: <20260514150945.3917510-2-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:54:13 +0000
Message-Id: <20260514195413.C6FB0C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Insufficient bounds checking in `platform_timer_valid()` allows re=
ading past the end of the ACPI table.
- [High] Missing base table length validation in `acpi_gtdt_init()` allows =
an out-of-bounds read of the GTDT table.
--

commit 4d6d9fd7f79fd90d8c3bbeefd718d1658523dfab
Author: Marc Zyngier <maz@kernel.org>

ACPI: GTDT: Account for GTDTv3 size when walking the platform timer descrip=
tors

This commit updates the GTDT table parsing to correctly account for the exp=
anded
size of the base table when dealing with GTDT revision 3. It adds support f=
or
the additional EL2 virtual timer structure when walking the platform timer
descriptors.

> diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
> index ffc867bac2d60..b9d9b8edf2df7 100644
> --- a/drivers/acpi/arm64/gtdt.c
> +++ b/drivers/acpi/arm64/gtdt.c
> @@ -39,8 +45,14 @@ static struct acpi_gtdt_descriptor acpi_gtdt_desc __in=
itdata;
>  static __init bool platform_timer_valid(void *platform_timer)
>  {
>  	struct acpi_gtdt_header *gh =3D platform_timer;
> +	void *platform_timer_begin;
> +
> +	if (acpi_gtdt_desc.v3)
> +		platform_timer_begin =3D container_of(acpi_gtdt_desc.gtdt, struct gtdt=
_v3, gtdt_v2) + 1;
> +	else
> +		platform_timer_begin =3D acpi_gtdt_desc.gtdt + 1;
> =20
> -	return (platform_timer >=3D (void *)(acpi_gtdt_desc.gtdt + 1) &&
> +	return (platform_timer >=3D platform_timer_begin &&
>  		platform_timer < acpi_gtdt_desc.gtdt_end &&
>  		gh->length !=3D 0 &&

Is there an out-of-bounds read regression here where the code allows reading
past the end of the ACPI table?

The condition platform_timer < acpi_gtdt_desc.gtdt_end only ensures that at
least 1 byte remains within the mapped table limits. If a malformed table
positions platform_timer exactly 1 or 2 bytes before gtdt_end, evaluating
gh->length reads a 16-bit integer at offset 1 from platform_timer.

This causes a read of 1 to 2 bytes past gtdt_end. Should this enforce
platform_timer + sizeof(struct acpi_gtdt_header) <=3D acpi_gtdt_desc.gtdt_e=
nd
before dereferencing gh->length?

>  		platform_timer + gh->length <=3D acpi_gtdt_desc.gtdt_end);
>  }

[ ... ]

> @@ -169,6 +181,7 @@ int __init acpi_gtdt_init(struct acpi_table_header *t=
able,
>  	acpi_gtdt_desc.gtdt =3D gtdt;
>  	acpi_gtdt_desc.gtdt_end =3D (void *)table + table->length;
>  	acpi_gtdt_desc.platform_timer =3D NULL;
> +	acpi_gtdt_desc.v3 =3D gtdt->header.revision >=3D 3 && gtdt->header.leng=
th >=3D sizeof(struct gtdt_v3);

Could the lack of base table length validation lead to an out-of-bounds read
regression?

While this patch adds a size check for V3 tables, it doesn't appear to veri=
fy
that the base V2 table meets the minimum length requirement
(table->length >=3D sizeof(struct acpi_table_gtdt)).

If firmware provides a truncated GTDT table containing only the standard
36-byte ACPI header, accessing gtdt->platform_timer_count later in this
function reads out-of-bounds memory.

>  	if (platform_timer_count)
>  		*platform_timer_count =3D 0;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514150945.3917=
510-1-maz@kernel.org?part=3D1
