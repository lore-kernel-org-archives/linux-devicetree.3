Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00D337187E
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424145; cv=none; b=WgBEszQTJNItrsRBC3LNkDrkbBOzs7+I8HPdhm05gcRbJCkGfloA/438Q/eaFcqxZV6VufbisVMIy+q0JXaWieVQF27rD+cPapO9Xf26U4y2EsJHsTfDHMAgRKXFTvmefGERgtVp2qc3njpYAA0vymOtPinMgQk26O8xZApyji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424145; c=relaxed/simple;
	bh=j/YkXCRb+DA7nNO9q31K7pBUxD0nnB4tRARb3P9panw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=l9NYxxWs3Yc4YXjiL45WGPACNnb/pOdVtpRCDjUgSaS+Nn56iwPGoscVeuxcxJwxJR4yTephZDnukdpCiVQpuCEkCRqgRNOD5W/9DANppjVeEwlvvGRyp5k1I5tL2v4haaeRVi35GHP5uO0ef5j4TNsBZ1ehZF9V2lKM31T9q40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mRFGQaQd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mRFGQaQd"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843e9c5960so2009878f8f.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788424141; x=1789028941; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G4vKdHGO8+zOlAPBdoXMqgNoiUhAKGdphTDuXcL4XSA=;
        b=mRFGQaQde7qdWnv+c98cI5KLyy/7vLcC8qeD9geIQc+8meImGBg7E2P6M+RiM5FP8Y
         znQoySRkWarZkGMDGV93PPL6m4iXWuy74nkscUMmRYaaTpY35QUwXa2vm+ovvm1fCnU3
         k+0mLyNheymZn6BYr7bg1qZwpX5vFSy815omfyPycxGMyrhQ91pcVFIocR9NWZQdLE/a
         1+zbTYsgEl6M60qQeXjBhd7eo8fQQmA2D5cOaBPEhAVFg1t1Pxov+pcwCChLqMLPkaA1
         3LRKwntbu4qUyV5VOZeL1Tbh45EgGZN2d9zLp5qAeVbV8OfCZDy0w04WP9ktkTpc2wQZ
         ohWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424141; x=1789028941;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G4vKdHGO8+zOlAPBdoXMqgNoiUhAKGdphTDuXcL4XSA=;
        b=DsAQLn+CWGRYm32xXvGEChPazOMe6g5S9YDnyvavxeSkKJqUlVD1httukaCz62wa8B
         aVAQ6v2oZqKvtBBa8Zjexf3pi0AtCnXDbfFM3cmsrr1hrVj4Q6z+WtSFbFlTpawtXSvj
         tXht3AJqC/Uas1Y/1faDjJ3TM0GpR/s3e/wjL0uWDdrUagpx0/wHntlh/XdYi3ppPcEj
         HBmzkkg1Zd2vYdBrm2kwTRNWh8iRTSRcZi9XpXr1US0OI5Njcds7Unpsj4m3/sBy2546
         Ve09NpTpMUj0uHTcpl03imkrZUSEZl0aLuwB0afnuahj/ox5G7N8nTvXU7CDrDUnYhli
         sChA==
X-Forwarded-Encrypted: i=1; AKwUvBxZf2twE1L9KpTEfzJdr/2pSzaReNbb7CCYrDbr7s2n1dT4pbMASPefY+pGP1lCdTQcd0piGPmLV2R/@vger.kernel.org
X-Gm-Message-State: AFuF++nppgGfuyx7r0ZlWTPrcavSCKegnN5BlD+nNaHgkxVQG9sbFKQl
	sQiJmIJIglmkPVI/Knba4rM3jWTvCGIwff8j2rVemIp9IY7idpvFQL50mSVIft0Iqn0=
X-Gm-Gg: AYBFou0VrZaOr6RwjA9ZI46NFXk4yMfFR1+t42F/ksJLtE7Sv9Ws25AyVSLoFPV+0Mg
	LGHbRQ6vE0r4T90yRt3WWcGPhzB/N8sMHe8+q/E19S6PcVHIhFnGftE7Wyi/YQtr9KxgzjwpLYM
	XP7l8hlsyrtDNvyl0FS4Wy8p/D7HK66/XF+lLXG5YEaoYO93iATAHrDV6xU0Z3iZZbsKEyJ4Eyb
	CKm5EpnpjeWM4CU4vTd+AsGjNe22xs9eslfiM4+BWs9T1retHJ8uJMx8K0Y0iwkaNI7RHyjZqKk
	UGwr+8D71GYOysGkaiTP+peGiZLNsArOO3yrwoLVY4cGIBy9OiY718OzDaiqKjThEkgrL+1Yi0O
	V/P0kySDUnXqigEldfFWfU7i2pPF4t/OwRftT3C30BQgyvBtcQ7ovBWNUerEFBK9dCLMKkAxyIW
	vQH8QBESTlBPTs3M9kY8zHpcZKt4zFhI6yH0LV1M7FsODHBcm0Wdu7OTFr
X-Received: by 2002:a05:6000:186e:b0:47f:8b24:ef01 with SMTP id ffacd0b85a97d-48488deedd2mr18283862f8f.1.1788424140416;
        Thu, 03 Sep 2026 01:29:00 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm12497978f8f.27.2026.09.03.01.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a15e01d85f8a611c40ff4ae9385bc153f1f9fa83a0571b2a8a2491377b30;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 03 Sep 2026 10:28:51 +0200
Message-Id: <DL5JFZPXGYZF.2JXFWOJHEMWAF@baylibre.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: can: m_can: add ti,am62-m_can
 compatible
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "Marc Kleine-Budde" <mkl@pengutronix.de>, "Vincent
 Mailhol" <mailhol@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Chandrasekar Ramakrishnan" <rcsekar@samsung.com>
Cc: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
 <vishalm@ti.com>, <linux-can@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260902-temp-v4-0-3896f7d16ce8@ti.com>
 <20260902-temp-v4-1-3896f7d16ce8@ti.com>
In-Reply-To: <20260902-temp-v4-1-3896f7d16ce8@ti.com>

--a15e01d85f8a611c40ff4ae9385bc153f1f9fa83a0571b2a8a2491377b30
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Kendall,

On Wed Sep 2, 2026 at 11:03 PM CEST, Kendall Willis wrote:
> Add "ti,am62-m_can" to the list of compatible strings for the M_CAN
> controller binding. This compatible identifies TI AM62 SoCs which
> support out-of-band wakeup capability.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b=
/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> index 2c9d37975bedd652b3060ab11ba75c37565edaad..89e5a44453372c57506e9cf3a=
009b55a70cc4446 100644
> --- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> +++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> @@ -16,7 +16,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: bosch,m_can
> +    enum:
> +      - bosch,m_can
> +      - ti,am62-m_can

I think you should use oneOf here to allow the use of

  compatible =3D "ti,am62-m_can", "bosch,m_can";

Best
Markus

--a15e01d85f8a611c40ff4ae9385bc153f1f9fa83a0571b2a8a2491377b30
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapkvwxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMr
dwD+KU6CuPk9zJ8NzOMyi92mXbApr4jbJz7igogpPtqaSJMBAOSyx5B9ln3sgQco
EmRUOaRu3BgZAwDtaQM5wfBkUNEF
=6Jsh
-----END PGP SIGNATURE-----

--a15e01d85f8a611c40ff4ae9385bc153f1f9fa83a0571b2a8a2491377b30--
