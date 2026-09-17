Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5244063E
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633848; cv=pass; b=k1gBBiChB8/f8XfXgRke3BmhqfETj5oTENCw0H/H1KzDguaO/eL1a+RGWxQny4igWcRdfyPHLqQ1IurxPA/m4JVfMwk4g5tPEF/EcmQf0AJdiYQg+TcckH+bsez5gX3m+l//065bqugW6gFac0bn3Cop2+KDwfZof4TPR5eZRms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633848; c=relaxed/simple;
	bh=G5FOvTerYV+i+bh5EByuYps3MCibaVHg+MJbwyAppPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljyIbgvxQnG+TjgfOaFngIx4dB6wYUBe2XieG/hItJ0JCpyWa01vHQagIfWtfnDMfWdM7266yhdIWZhQ2qtSPpRYjrv3j1T3oJXTk253QE2P06H0Zvx3PyjG8RehXiWP4/ZR1fB5L2cXZmSSUAmuHkeM5hKu05akhS5F8uJMPP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmQ2MvM5; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmQ2MvM5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so401046f8f.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789633834; cv=none;
        d=google.com; s=arc-20260327;
        b=sW23JCgPM5W0V0YRdor5vyJTeW3rmyvaXd0v+/aDY8DgE0kHOnyb6ZZ4ZTPM4nM1V2
         lcOqXS3mby9zSRCzKk1/oDoaaItcXcLtbdqalt8akwoHAnWekLZVzgt20z2Osl4tzZ9D
         BWcvZ20QoTM/VaAahnkMtSFi/fmsr+DSRmiO/deLiniDJHwQDocKN2Hby/1QD3W0dv7H
         DZgGOK7Hmbus013hcX/bf2w7dQC9tKvSgAHNFEE8HaQ9SIWgbnHVugz/giyyb0M3SY5n
         c7OgSz1fAgU7XVKoEBWZ7W9D0YsGmLPyviZDyDK3pS9HJYDX3q0GNSSGxwQLvzn6cjHf
         oHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dKETHQ/f5XJ/hL1DtWxBym7ccO70VFb5IjdqZcf6Fq4=;
        fh=lcbFoUjRuZGCXFxgcqakrC8aYhOGSEBDso4fB8bNqEY=;
        b=Dfh+XbMswDtnE8O9P6WXHhdf/Ns1KFncjcCdpgqi8wBYGmA0nWyHHCltk3sslLr0Gq
         Rwt0ER9s3u+decRLsVTZ5pGdNPiPjCIpjxjdSpTm8VnnKhlj+sg1Rsi/yVkH/hc0qp8b
         zn3qbPu0+V7ikJNUXYzH/6sifKxUSzMOq7c5FKPkx2uNoAYvzbgE7DKV8JPIYo1VX1+6
         yApwvf25gns6DjvWE6LoPsBAmCyBZgw/gauZzCTVpPfWp4/BCD5j4tlJh8+muOnl+Jaa
         GaI2BM8MX+SDSQe99cO2TAnfdXSwHlw/NXvudKTEK6kovdniu+kB31tIiLp4VBr4QvAB
         DGgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633834; x=1790238634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dKETHQ/f5XJ/hL1DtWxBym7ccO70VFb5IjdqZcf6Fq4=;
        b=KmQ2MvM5bbBAGigzXw/dD/EiH0Mu1NCZwNaW7R5G+nrN12e7KBsJrSgBJe8spSu1tI
         Y9hzg9wvPbydmuNFYtUj121MIqBdaATOR8dv2TtbN/GUZZxi/2I/QRDVRozd2uCjGkeY
         0AW2/4USIlZfsNIqRJm1SZJyvSjt5ah4t9SpGMAyK6R8/l/CGPOTbtOFQOWX8IO4avu/
         yGc6wzbmGiGtb/4UR1o0LZuxe46XSjXfy8OyHYmInzP7tFQ55ZewTmYQ/WXd2XPbSYZp
         vyYWXmZTJaQOwl99jriSF1w0blnppsCja5ccDmzJ1xKdMgOCXeR4x7Hidd0Ci9X4Hca8
         bIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633834; x=1790238634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKETHQ/f5XJ/hL1DtWxBym7ccO70VFb5IjdqZcf6Fq4=;
        b=TAsWo37BEnzFiyL0RCIzqZyb41ENChnsNvYf9LufzVsZ2sXg2Q6Q7+XFMxWfS9gY/Q
         pYhMkvKU+H+PV6xWh36TiufedQx7iKyLiEehknBXbowkfBCSfamCgijyoqcAQ6JyFMAH
         kVzE8HQgvAVMmkSukPoT0ouMGgTKvQHNPwrzE+FIEB8ZVo5+GaATvCZLawrZ+J2NWwcl
         FO/mAZEaDbm+NS6vRPqA7Tu194khQ/r3zqPexxmrOaqaCGYNiHiKU2D2DlIC2CswxNJO
         zp07kH0zgJgQNingdYhxW0RXv4CLqTibiMMVY1q2QR/dUthMXJX5YKPd46V0z1PRMjma
         fDzA==
X-Forwarded-Encrypted: i=1; AKwUvByorqtENyHPC+/f9PGSgXPrqxdmrmwNoMkDcOSEnSvfYE8Gehv/VSv+0AnaeE023JWYRLoZ0GniMy8x@vger.kernel.org
X-Gm-Message-State: AFuF++mfSVN2SENdefS/MoZMGzcCObFpdo17W17JGNfbDnKktCFwbrId
	g1DcpaQdUE1hEudcXHuSo/PwFEAwpLltRTIzbk/TKL+4h9GsWKohOK3DdIMMtB4tvddIW5inCRu
	4hrUlHO5/j+NG4L1yKx5e6eL37gmcP8A=
X-Gm-Gg: AYBFou3LJbbDGHiz2mq/4o+qNZHzewaob/nUUjLDrQwAe3K3Gv9Ml1qEb5TbMTQ6F8e
	WBTbwduRi1N4964cbP4O17qN2SPeKtI5zoE2omdKriwd5tiFQ7UHA09RGjUdKIlgFKvaRDhowla
	EiJkcmH4WgIau1XQ+4wnihnZc1TEl7uvtZLBGPclib3+JqoWonWOYMdxNDVvhZgBV1CSE96J3dQ
	vieVzRmQ6T3XpCULaXO7PcFe/O6VuQXjWceZxL4QsJ3B84XSYC8lagJN+9UzGVQaUjwWfogGqLD
	mKZHJUgPTe6R6m5aZbt77UaIQp6qOjP/C5LIIkVMkTMYns6UABSgzJAyJB0V936WKIwyP2Y6BSb
	Gz41WY7aeYH3ia/+OpjXeAWSd7w==
X-Received: by 2002:a05:6000:2c02:b0:487:7fd:734 with SMTP id
 ffacd0b85a97d-4870cf2bab0mr7400506f8f.18.1789633833682; Thu, 17 Sep 2026
 01:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCPR01MB748139F059DF2459B9813416A4B92@TYCPR01MB7481.jpnprd01.prod.outlook.com>
 <TYCPR01MB748157ECB6B92D8E3FFD433BA4B82@TYCPR01MB7481.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB748157ECB6B92D8E3FFD433BA4B82@TYCPR01MB7481.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Sep 2026 09:30:07 +0100
X-Gm-Features: AcwNN1U8vjkIrSzMqHnYBmAsTNjSFszApsXoNAyb_ZFCyUrlOZkMUDMj9NBc6DY
Message-ID: <CA+V-a8vZZB0vwdgOxWm30_Jzv2FCrtNTna7PWMGeyEKcNK8otw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: pcs: rzn1-miic: Reset PRCMD state before
 unprotect sequence
To: Yoshihisa Yamamoto <yoshihisa.yamamoto.xn@renesas.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoshihisa-san,

Thank you for the patch.

On Thu, Sep 17, 2026 at 3:55=E2=80=AFAM Yoshihisa Yamamoto
<yoshihisa.yamamoto.xn@renesas.com> wrote:
>
> On RZ/T2H MIIC, writing 0x0000 to PRCMD resets the command state
> machine to the IDLE state.
>
> Reset PRCMD before issuing the unprotect sequence so that it always
> starts from a known state, regardless of any previous PRCMD activity.
>
Please add the Fixes tag; the rest looks good to me.

Cheers,
Prabhakar

> Signed-off-by: Yoshihisa Yamamoto <yoshihisa.yamamoto.xn@renesas.com>
> ---
>
> v2:
> - Fix indentation
>
>  drivers/net/pcs/pcs-rzn1-miic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 2b72fa98d..818756bb8 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -270,6 +270,9 @@ static struct miic_port *phylink_pcs_to_miic_port(str=
uct phylink_pcs *pcs)
>
>  static void miic_unlock_regs(struct miic *miic)
>  {
> +       /* Reset PRCMD state before unprotect sequence */
> +       writel(0x0000, miic->base + MIIC_PRCMD);
> +
>         /* Unprotect register writes */
>         writel(0x00A5, miic->base + MIIC_PRCMD);
>         writel(0x0001, miic->base + MIIC_PRCMD);
> --
> 2.34.1
