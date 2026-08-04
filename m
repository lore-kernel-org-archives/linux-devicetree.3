Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEDA46C4A2;
	Tue,  4 Aug 2026 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785855446; cv=none; b=ARg6U4gDu2Vzb4P76Ov8G759APDt4ORcr8qRQwkyigmPi9/5U303TJao1KHppmKbZCH8b0W6sdx2CX8X+WX9W8HGyRwKz6SOehk9FpGkcptrTsVQ3QErfelVhEOIcuSvfSoT/2SDpZAMiq7OP0pTsiVJOPTCWa18JsccEYm46IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785855446; c=relaxed/simple;
	bh=9+JcugKN1Hlu595PlrjRezWrWX+ORLZbJpzylyBEuU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8amzVhM8EdkIeGqwClc2CTmb6EGXri1ZZ2LdaVUJOOjCa6r8QiA4vrVWi5+F0QVy4T1zMIgJp/bsofSQbMsomeVaJsW2xDCRkleibQdPlCxPPntbG2ieYh1vz2GZoyWf5flEyuUa5HYeAAVuuQnd0gp2YMZ+gH5Dh0G3G2kzTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=WldYauCm; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="WldYauCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1785855431; x=1786460231; i=wahrenst@gmx.net;
	bh=PTJyzc/zMCZOX2O75cjdUrm8CpljF+Yy2jrwQvp1lV4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WldYauCmxi4D0Ra6MqhdJlY8rfSP92c2y5prGmQaHsj3UG8zjCIkjKrh3qW3slw+
	 TBTUk15iHG7M1Fjs9omqBjrg1mEHlZXn+y9fR+2eoS057Ycsbysw1KytXsJQKS2nO
	 MaSSLJFrj7z8qGv+7wUR9xrDEJdU06H8OnwLA19wikW866Uq8BZpSiTBs044+Xr8T
	 5rp/r31j2AKFQjSIXKJVHLUlGFZViuVfC9gt6bF4o0mbKDWxmcmJ/eOJ7Os3hedM2
	 JjhHx5YSthvCv2ZgCVRFyWWtrQ9NysmdqF4hrddBZfrgMMC4smd5prSsxhcEItBz7
	 +D/yg/ToODp2bil/oQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvPJ-1wRaIE05kj-00ONvS; Tue, 04
 Aug 2026 16:57:11 +0200
Message-ID: <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
Date: Tue, 4 Aug 2026 16:57:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P4hylk2BckQnMYZ8JZKL1DnIWZy/oosvtCUSb34v3gHvWDceUUt
 ToOaWO3e3gFgLOZ+IAJb1ZR4Ztjg5zxfsci6MzRoXPgBkehpYTL7yN2gAvohPeVDfMAKkQ9
 AjpHxp4VRveBWeW+PFzzItsxByJfuVa+j2qsShg2SkhHuseEgkd7l9IzgithR4h+nkeCwUk
 gQEQg2gnXIyP4ebMM2OXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yQekX0fCiDQ=;2OmTjpudUngZF7Y+N8hR/X5dIlo
 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

Hi Gregor,

sorry for my late reply.

Am 04.08.26 um 15:13 schrieb Gregor Herburger:
> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> and in a c Stepping. There are two separate dts files. The
> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> the d Stepping. The d stepping does not set its own compatible/model
> string but uses "raspberrypi,5-model-b".
In case the SoC and not the board has a D stepping, why do just change=20
the board compatible without the SoC compatible like "brcm,bcm2712-d0"?
>
> These two steppings are not compatible. Booting with the wrong dtb file
> causes a crash at boot.
This sounds like the patch should have a fixes tag?
>
> Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
> distinguish between those two steppings.
>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/a=
rm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> index 127be0fc27c22..5a86ad69645c3 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> @@ -3,6 +3,11 @@
>  =20
>   #include "bcm2712-rpi-5-b.dts"
>  =20
> +/ {
> +	compatible =3D "raspberrypi,5-model-b-d0", "brcm,bcm2712";
> +	model =3D "Raspberry Pi 5 d0 Stepping";
> +};
> +
>   &gio_aon {
>   	brcm,gpio-bank-widths =3D <15 6>;
>  =20
>

