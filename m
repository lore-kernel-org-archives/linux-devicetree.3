Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C7255820A
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873162; cv=none; b=u4XSJUT6Qg/R1i1SCytlGGD33etBgnL3Ni/fafbxNbCe9xBPR6nEKjKDUM+U1Vc86rIy8vslcST0uz95CNE8wRsYw/wQ7CRS+G0Dk2gCXQRBmIWNW8JrUs3ItG/Um9ojcp8sjEX8bJaBD/SK2A1PF3s9wi/EM1LF9vEIBYXLG3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873162; c=relaxed/simple;
	bh=I5bgQLL3mOz2emhCrq/9rK0IrbEOOeUKQmpFrejvUao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3Ngurb3X6BjEHu9lUnDI62Sb/RpA1z8auwfCsJlQQupu4g5Vz6x83hPVSWptmzCgRA5r75ruf/OEedrEeJrxNDlQak+5FSBlBCd/9x3UdbALdyYXMYBE2VbxVq63IBGBlaBu5sQFR4Prz4JuN30E9VeRa5VNgXFKSsK9zk/IYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T81wdDxo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T81wdDxo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F9C1F00A3E
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788873155;
	bh=m5aqyxE6+jxmKoeT0KNsiR9Pz7T3xO0C00yyx8tqkHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T81wdDxoEeFusn7KNahrxnUhA0L+QqXtdQv9MkdSA6g1Ee3TRP+ss0Cf8FhA/JzcI
	 hpPw49nIqChzGSiXCTyb9pxD9A0ZJEKPMLNq7ggK2TN8edk4k+uOS5GwRyxv6c6IRw
	 BQdmW/sjW5oavcHJdFAivqOsC7TasF5wLbZ6QGTlVB0V6Bmz4uPmXFtp4SHnqkx4PX
	 8+BJQq8Iy8Z6QGGjI+Z7M1Hlm8cVy3Pzw5EBjY75SzWH7IkfFeG3C1b84g1TcGgE/j
	 +hdzBbY44bQm9MPe3/HShw/viBUT60vvpRc1uNOlGk04Ml4pkynrl4FPzZqz8Zt4MM
	 pbt8+KCQtY9FA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so5776728a12.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:12:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz85eDL20fuSFHv3ApieI9hHRgSquJDBg5niTWllgDWRCCIut7VUFVmJMOB6530MOM2JXpvmiYP0MBe@vger.kernel.org
X-Gm-Message-State: AFuF++lEkX9NaF0SKQOvIRSq+/S8IavRRw80dA7KJniYLeDjCz+ejwsw
	RRylPK+spRjiwtmK31pSrXqb20riYjleb/oXtAk2/bcDPkCe4ex+fjNfe80V2V3NGL0HcbSlISk
	YK0zWHYf6WIUzV6Sno+8N/btzJUNBOQ==
X-Received: by 2002:a17:906:478f:b0:c26:19de:9ad5 with SMTP id
 a640c23a62f3a-c2619dea727mr1058176066b.45.1788873150708; Tue, 08 Sep 2026
 06:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907062017.5881-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907062017.5881-1-hemanth.selam@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 8 Sep 2026 08:12:19 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+qAyYKDSFy1DiOMvdQu9ENK1gCa2tp2SMZiAE5yQpRQQ@mail.gmail.com>
X-Gm-Features: AcwNN1Veb5dPZANx3rRgo31FccZ0cifgahXe8-HGm3cwQxAGhNhQLOqQFSSk2GM
Message-ID: <CAL_Jsq+qAyYKDSFy1DiOMvdQu9ENK1gCa2tp2SMZiAE5yQpRQQ@mail.gmail.com>
Subject: Re: [PATCH] of: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 1:20=E2=80=AFAM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/of/base.c        | 2 +-
>  drivers/of/fdt_address.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d71ae0449360..9e249286be71 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -700,7 +700,7 @@ static struct device_node *__of_get_next_child(const =
struct device_node *node,
>              child =3D __of_get_next_child(parent, child))
>
>  /**
> - * of_get_next_child - Iterate a node childs
> + * of_get_next_child - Iterate a node children

Still does not make sense.

Rob
