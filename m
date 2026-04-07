Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2173399342
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555408; cv=pass; b=hDE8FOp8RDT2EBZ3IpBC3yngSrrNRT53nSgvcy/FxRp9jjTGdOubVzUlqKc9MEl+XkSwu1iDjFek1/TZfif/Zv4+OwTr9mJbm52Nz7NV3e5fOglVkvqHHcr5CReaMRlw71hiYcv3cSln7ZjJZYfTwHKU82ejP96K+x0U8b/tOLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555408; c=relaxed/simple;
	bh=97UWIPqM844FoFFO9G2TTuAy5vOhw2svUbJZXfGxgzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atzNLLAkGfFjJu/t95zM2bkOmkHPVVusqhR7/qR4deVY+UmRY7+vS/cctDCzdTcCHawP8zJwvrgkOe9FNFdtZtludmFz7TGj75VbLAHL5pVjGVLKLf63rR3S9E7YZEqlGh2nRgYsYhAqYgnXoTjkrdkNExHEcLacYziHgjkCsTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbUVJjLR; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbUVJjLR"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c76b9efc299so1944197a12.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775555407; cv=none;
        d=google.com; s=arc-20240605;
        b=JP3UOngvg9KUoXOT4+h7KWcJwzpAu9+IUbulm2tq+d98myoDOtlcExMCA2v31jkkqC
         aXF2qiY3HZRgEk20whFZLc6x5zAwWocZcXbD0VNS97QR8iswY8mjTgfJ3x5l0vnUpQyC
         Sslaoxtdy3oPXOaHtP+ajgj+oC8dFD20IyMzeT7TMQaO7X3dcAheyY4d9R0JAiNNb/te
         3d0YgH3zeZ56l6JUq5f0vP5695PAWQKuNLLxaAFhhSZtY+nmq8ufXWHKtQanGxD1oJDE
         RA+ch2EullMjXJP8Vi+sb5v0V6eAr92g1IJPNpGCfiIrSruWX5Cg/xq1TdTMB1BsKyiI
         68gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=376jX0gFHlCYVWXCTvgc/4jS/LPYKaeyewgyhax41kY=;
        fh=fP5NWmgQXtEgsyGEZ+9FUMwh1Nifxn8Isu8r5QCZuPw=;
        b=SZt2Ed1CMOHqtJDK+kjR/4ExRrgeJv9bJGEE8K1yvPOuou3793ohmbuin8NZIxf1EJ
         /QJ+C5xR+YqwvR282gPCjUIHICvQxOX5X1EX6FoI5hVJUZl69kWQ+5enNVeeg6zO5dVN
         JKpkbC/OLdnGhK0NjkiL75SHic6f6uDe0T604D5IubmsiCzaSvwRcI0vv/gR78Lb+qpT
         Ep+D0WsCFcjGdjFNHPxbABuihSAMrFdJwAJAQbdAe0W04fGcYc4W2xZPdWJdtLeJ9lxm
         P2oOI1ZHgbgU2eWGTjew8Ybh2kXuaBQdfq20PEMRZYZarCGUrYXkPLberGoomW6mmt1j
         771g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775555407; x=1776160207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=376jX0gFHlCYVWXCTvgc/4jS/LPYKaeyewgyhax41kY=;
        b=YbUVJjLRW5P/uPBJME2QFwElczvioBQcPoBEQBXT8bXGHU+fpBjqtIkrZg/TE8+JKF
         nYC5XbOGzd9+DzMg3jFZ1fYrneuk03e35Vepl28/NHEXfRu6enJ1KElgL/LV+ZHAJXQ0
         JYxX4Os1DmJGqJJsG5H98RXtvQvZ3PgV9upjUxEJ0IpeeM4cwPHDm4mp0Uj+fukqlnEQ
         CwznbH7H63omM3jGIjdZFRaCZpSgDDHtyTOIEzbpAnELm+92rpYyKcycpLkiUKR7Ll6K
         WY5u762PFZ5orDqML0eGLxd9uZEjAt2urrJsr43R/ETjhbbmg0xqohrjv1pO1zpGNnai
         QUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775555407; x=1776160207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=376jX0gFHlCYVWXCTvgc/4jS/LPYKaeyewgyhax41kY=;
        b=HpnNdtofTPZK7BRTNt2vqTQZhcv8hCO5sdEJQT7gV2OINOqHOm4CIsXTB8SVw34xZ+
         XFVQt+PnOuOs7WhzcVW7BcrxUyMozhh66s8YTMYt82cMRCq1wTyXmWFvDBLr9fLiOr5C
         FZ2VmrstgRAR2UNzB7iRs1IkstTIlVHTVJFITHJXpwsBRJFJr82y5u6B4DfBewr1H+s+
         ti+WzZngTQOW0exBwTwOB1kFYRPYl1fVxO2JgRHH9ueRR2iSKb08SMLqXBQ56hZQcodn
         2gJlldvevtrOS6mS9T9Bs3tIcqKoMQk6atkdaAGhmFhQ4YW/NjzdVmNab7VcrtQ1laUn
         TD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWc1Zn1Mf/5/RoziZHcjrXL0PIFrBphQOBeJhFexuiM6D05zVFjZN5w1fnYTouluntN6bkSvRHyGj+V@vger.kernel.org
X-Gm-Message-State: AOJu0YwkATC7b1ahXUuX0e3dZDqmnLc7F8IgvggBXqcoEqH98sh5U/mm
	w1jQEzaLkEtPXu9XxLBFkSyKT+VcjvoL91VrO9GDLF/6vyE6FA2fW4Tiw2ZQ3K0BUkDYZQmkgyn
	TExKmEpj0p68sTMPsZQqmDaN5yZFABMI=
X-Gm-Gg: AeBDieuTszc5hD3NSUMHt9pX9dPrp24/VltThmajza0O9yFayXMfMvWsIZ4Nkcl/xsM
	NzITdNGD5mWegZIQx4t2j0xILKS9Pt8yDqa1i5/lMuyaIfjHigoH7gfPjptNL9jR9uB7N0d5ACq
	bwRDRiy49p4XNjpKeSlTCm3djY+1K/PvWvD36Bbx71JIVRIt5DHAIXlJGxjqJlmMbARqU810k9a
	jHMIuBVJUj75dCqGUviwzoeFBW/HlUYEYUlegjXkBBvLG9lZsxzEDUDXnYjbsNOBwCdendH6dR2
	sr3YNcI=
X-Received: by 2002:a17:903:3b8c:b0:2b2:ade7:820d with SMTP id
 d9443c01a7336-2b2ade7a263mr29495345ad.22.1775555407014; Tue, 07 Apr 2026
 02:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com> <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 7 Apr 2026 17:49:55 +0800
X-Gm-Features: AQROBzBDsI8MMkaElAEIhn9Rq7nCFmivdfNIApAyidNH2a8-Ops7NCH-H1ksaJQ
Message-ID: <CAA+D8ANg9CEpaGGpUQ8D7AWuMkk-A_+HKtedFAp+ZYxHMV_MZA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: imx8mp-ab2: Correct interrupt flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>, Peng Fan <peng.fan@nxp.com>, 
	Fedor Ross <fedor.ross@ifm.com>, Shawn Guo <shawnguo@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Viorel Suman <viorel.suman@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 2:39=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning:
> 1. GPIO_ACTIVE_HIGH =3D 0 =3D> IRQ_TYPE_NONE
> 2. GPIO_ACTIVE_LOW  =3D 1 =3D> IRQ_TYPE_EDGE_RISING
>
> Correct the interrupt flags, assuming the author of the code wanted the
> same logical behavior behind the name "ACTIVE_xxx", this is:
> ACTIVE_LOW  =3D> IRQ_TYPE_LEVEL_LOW
>
> Fixes: bf68c18150ef ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP=
 audio board (version 2)")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for the fix.

Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Best regards
Shengjiu Wang
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-ab2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mp-ab2.dts
> index dbbc0df0e3d1..443e4fd5b9bf 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
> @@ -281,7 +281,7 @@ pca9450: pmic@25 {
>                 compatible =3D "nxp,pca9450c";
>                 reg =3D <0x25>;
>                 interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <3 GPIO_ACTIVE_LOW>;
> +               interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
>                 pinctrl-0 =3D <&pinctrl_pmic>;
>
>                 regulators {
> --
> 2.51.0
>
>
