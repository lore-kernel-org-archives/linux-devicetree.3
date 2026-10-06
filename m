Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C463E49C0
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285229; cv=pass; b=lgWhwn31QodTxULWc4imRShVKXBlc0hUht9wRCxmiKqS7AFfKtVBWAST4g6Ji4kCv4yZqOFs/SBskG8khLxyF1mTPJnpnpG8PBvGm8NUwS7mlBTxigfknmq5zpjUznk/FE4dgRIz5Rcf2vS7bNtWN0p9itesWZRBvcwI55CfJT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285229; c=relaxed/simple;
	bh=xNyDpAmR5FGwhysiQJeqiOkY4NC2Si7kbY4uEVulYIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arKPtMJTj+mTrJOz082lCxkqQgG5BEENSaeiMw+O1dZg75sF/qc2IW+17xtEkVrk00vAbmk5Iyb9QxfO4PzXRZEdJKHsNUh6pm/826lZDktm9jsFzQp2mUzI54ydZD3UtUYGJdybYWjlFXP9/LuDSvsfDvXew5meFIPooCWTMYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7zt8yU/; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7zt8yU/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so5744995e9.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285226; cv=none;
        d=google.com; s=arc-20260327;
        b=eDA2Ncm9D6F5sSanOEdOH7Sze5vIktG1/jw71Flfc0YtzZ2sb8ZvQIuRbg2cP9696H
         MFLh4jfQm4Fcl9ckWHgSKcwr9dHay4dm26rsBuVohutKW6LQL/mv9tcl89+JPQTzt4vw
         uafPieJmU/MO94pgNppiuhq9tlHvaYuV7g9OxhSuq5WnwY6BA9MB1f8nth8xPyC86fHX
         b4auEDBn6wro6ux4TZ096bxHNqmPwAU8P4ViMJDocHdgBeIhA4yB5Y1lMpklD3YcqJPy
         3cnKxK6Zhw8hElEY/wcO7AwhQfKGcaaupKCHdbd1bjRuMikIO5Wgm1PCKjA0afzqaEZA
         yhWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hj9KaKUC+O6S/8IjU9bhafDGIosRHpO/TG6hD/80Dks=;
        fh=id4XpAR4tieRubUFy14WufIxoHvmLSPuQxA5ctWXh6s=;
        b=TblL0iD3yBNBbxrzHUlR5+2fFXmbk8k4Al5y77fnSVo+Jx5vfxaDYS+A5yL1JpWCPY
         dunoSHsqALU7OuR03KmKHsQ1L6feSVkHoKRIPRmGndUKI8Yusdot19YKBAnleeojlUva
         ggDxsuXGbwgU3Jv85O0LaoYRgDSg2AZdPIYRm+6GuxOEcl8ldh+VYpcb8yDlgs+ZYNHR
         fACN5nM9KFu1eXBZaEja0m8gWWGl5lo2oV5z50eVrkk+++/wwFBM3wKRiaEJk+lIGGxj
         4IuAvJ1IqPwJcPDHgtUKtFU2QXWxuy/ncqharB1/BNzUDu+za48sN0zpjyOnKNuwmEBm
         JO+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285226; x=1791890026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hj9KaKUC+O6S/8IjU9bhafDGIosRHpO/TG6hD/80Dks=;
        b=C7zt8yU/Dr1uFq1oZpQuvKwQ9NBTNzA9jmFC9W5KhcHZjxApR03UeFJQDcJol09SB6
         i2K1HPpx8WiE3BQAFAGDjF2W0ufyBde+7+U3sSph68j9G5ij2rjdzoH7Vcmvqy0QvaZz
         ChlTJX7qEcBz2ZyDFALRphl3dyP1oO8vrmj0THdEf1najn/BWO/yuVxm8fC9Wxif1sLv
         Ki/7hqc7L3E6UgWFhExjz6p6vcyV7WpmmJtyDc8dINMwdjvgrvehodyAFeekWCVncNNI
         Uvrcq9UlCzb9toTkpTqoVs+picWgzybrR3/FektgdyFDuf44n7VAmRj4NXqzHip70qmr
         KzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285226; x=1791890026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hj9KaKUC+O6S/8IjU9bhafDGIosRHpO/TG6hD/80Dks=;
        b=m3/pt++Ms7oxepq2ZdMitHuGAbig8fujm2Ii2CRTlz2k8slmg1ckTcGbxzPzr011kC
         P2pmlhJ/wenVcgio4G2wU3cmbhOn3WU3QWEAIBPLcdHsbb5xF2VbLBYKez9DJw9iTopF
         5mCIZay7DrDypXtky+x01DpJNUZqjB3dWxJNXx4MYXh4OivU42zSAg7+Cr0Ynze/ASWX
         MsKaQ65Ok73ufHTOb9yIjKBmDFfTgTKLd/rgqMbouJNn1Mo1LGNQXzuLP1pHToaAjpgy
         SDZu/x8be9mSmRvetLC/SSugaLl6RykHjuDbwh6Cq24Er48Rr1Sl47ryaOtmuEhXFDH3
         kgHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8+cbaxi3dfCjCx2K1DM766sScO+NoO+CDarY9BDOinOCc7SNmZxP6kLKniBJO22g15KvDVwrlwFkf@vger.kernel.org
X-Gm-Message-State: AFuF++lLWeE+kD5I1J4Z3fXJ0VNaSebQ5rYMaFcK8/4yTRq4nfUUTBpI
	g1BAupyCGR3kSUyWuWZuF6g3jfF6zvVZPXmh3Fb+ZX+ipVfNgJs4zClZFkxwhskAOF6duGDQ9OM
	iH1ocmQdwaxjjHsVYSWXFFQ25BwVV60o=
X-Gm-Gg: AYBFou0fyKq3ofLSbrdBU+ONek+8jDrNL752afLhla7tmgMi0QD5otSqmw0qxwGor2T
	rn2C1PeInSPGTDuCAjV65ZRsIe8xjgHqaBJs+s9vCxEHeuROu5iI7xpVpqkWmujO5rm2NihZSrj
	6Y5RU6l9/jrv3rZJ4QXebT4SdT/LMg19oInu+TGa7AmwsssZjynqDeY+VC/6y1LUIFLYig2dSor
	FdTUFbqqu3AH0gQq1NgC2CF6WnqSs8a/5YsnWQJATmJwHsKbhIQLi5S+pg0O+qvfvtIo+ZHXk7Z
	cBMcAT+YUxs6QIOOyZjrzL4cxMcIfp0Be+ddhp6iTk6bDZ1G+KNUHMubwB8DHRz0s4i6eNJ/vkX
	UzQJPwWUHvon4xEF+CA2tYoZ0x/G3TP4VDlBkBBrncIVfX0PHXm2FEtaj9yoJ8KPQt3ZCH8jN
X-Received: by 2002:a05:600c:3510:b0:49f:ffdc:939d with SMTP id
 5b1f17b1804b1-4a17b536662mr17476405e9.9.1791285225506; Tue, 06 Oct 2026
 04:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:13:18 +0100
X-Gm-Features: AclHuK9BPf3cilBqj7nThWhC8BNihFPb8g0An5CConkIqmbm3l2wQk6-UbbqXpI
Message-ID: <CA+V-a8sJgTEFB77V=UUXf2d=GLfbEvCbmk8ueGWPsPipr8Dj_w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: media: arm,mali-c55: Add power domain
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:54=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Some Mali-C55 integrations place the ISP in a power domain. In
> particular, RZ/V2H uses the CPG domain to manage its module clocks
> through runtime PM.
>
> Allow a single power domain and describe it in the example. Keep the
> property optional for integrations that do not expose a power domain.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/=
Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> index 8fcc46660b75..3a11d3f8488a 100644
> --- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -36,6 +36,9 @@ properties:
>        - const: aclk
>        - const: hclk
>
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      items:
>        - description: vclk domain reset
> @@ -77,6 +80,7 @@ examples:
>        reg =3D <0x400000 0x200000>;
>        clocks =3D <&clk 0>, <&clk 1>, <&clk 2>;
>        clock-names =3D "vclk", "aclk", "hclk";
> +      power-domains =3D <&power>;
>        resets =3D <&resets 0>, <&resets 1>, <&resets 2>;
>        reset-names =3D "vresetn", "aresetn", "hresetn";
>        /* Example interrupt numbers. */
>
> --
> 2.55.0
>
>
