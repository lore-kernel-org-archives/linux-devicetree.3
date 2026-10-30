Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382813;
	b=s/0nrUcQSl6neX9IsiywbAPy0/364jcBMC9m1JlhesK6rkQIrVxK7Fv74e1AKc+Nuhtq
	 BAxNro4TCkPGUaa4XCsTmkLB4tsRxF58Vg8VhI6zXDRCpblKUg/tdVnyGT5NBlZSR/zGT
	 yUmXWYcPC65ujIQfTjOX1KV3IwVHyappm8hB6K5MCzK1OwBaA3NWptKVhAN8ZNc5BsW2A
	 5TOFapPLYbaCDaQkhwmbGW6ruhf/p1E+H9Bmc3ZSbpduxA87cHNeqap8Uc5/oB2KdjUVC
	 OLvutv6DI3jcEWr+7t866F0xc0iU+G9qbLyhz+Wioya0ZYnzHwQhe6Dh57KwoHjpnXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=f1PVTEPEeT+k0NIsjo13PPlcE4G2CKOtf71KBMqhCMg=;
	b=sWWUPfO9sDSa2M4ojKEvLr0GviD9YB1hvDY/J3jemYMy49lvhrSo840I0Hchc7o2RBJ/
	 LDQMG0/Aw2mDSmrjjmrulsdg0dYeOv6Xz81NmaqwQCH8g75O5jpy3tpiVLOJzgzkWWZ1L
	 rzeVCv/a1whcKCum3mgevN6sFr0EwpnnkAwb7i74FnrXxXBHpVyzMmknW8MuFio/U665o
	 zgGH+0RNf6M5WSo/KWl5ZyPEyARlOxQ7JAzsnNdHuhMYv8O5itWWNXw0mZ6loaDhRMfiF
	 NBA9JllROdxh7urQjb5m/3y86VF02xUtC/2tqLxBQ0Gridz9hwlqoPZibpQ7s7pF8lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wzDp6GPN;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14025606A324
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 17:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14025606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wzDp6GPN
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b042c0759so567757f8f.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793382811; x=1793987611; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f1PVTEPEeT+k0NIsjo13PPlcE4G2CKOtf71KBMqhCMg=;
        b=wzDp6GPNHiLA6U2AH7HioFjN2adLnu/BusziS8Vf6kSlEHrhwbvIemMzm0kKiPFGxP
         YKOpjEJ3iWcJcPtubYdNW1O3CYCqd/LJtpY+4jp8NNRln9L2oqAvBOiyWk/4CkW2cD2t
         W0t3wWXlDxm3rVFCyE+mvdlvUJpOV9Ybunxa7T4X37OPTVbA9GcrFaWGquoXTGeK9ApI
         KZGUh+ZPjF13ywQjmcPJ1iOKoMJDyp9/+MjhR3O5AcSLFM9VnRXeiOv1blbszTC5krR4
         OUzaC7FiON6YhQ/+mcI7jQF+UdLxVU2+wHT22EyImkj/X1CRTYtdxEaGOJDenZJBXAWE
         MO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382811; x=1793987611;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1PVTEPEeT+k0NIsjo13PPlcE4G2CKOtf71KBMqhCMg=;
        b=jRekiD/R12ixf4lO1vF7+JiHFAbfHEvtsCr4OezMM8aR9maoOQVgU9fWrPR7wWzi9/
         Rfh1T/AnCcrZ7XR1OW+k4LoV/4xKdvEogh27LDPZAeD/sRi+d3Bi2Q/la+v+XoFgJxJN
         PtYrQQ2scYaf0Bad43qRgr8KTPrpDt1ILfGq1ZIatLyEr1KMOP2bLEQPF0L+flYhd6S2
         hmAhEgqsuEqX4W1Wez9xOBZRf+2jQj0ACYLFvyOxWsZ6dursBXk7DoPxBk/Rj/F5wL4O
         8myZtJV+2JrYzngFS5o8wF7aEq6/pJw2rw7OKv/tSPIXBPufspkgQJNatupN0/WRB1cl
         fnmQ==
X-Forwarded-Encrypted: i=1; AKwUvByeMyg2Ea8DYe2wKcP8CW+Thm9CRHx/ukrqnvWovXudEEMHmDX4X3AZ+PpCICG1Padms463Jsubx6SL@vger.kernel.org
X-Gm-Message-State: AFq9FYKzxxAN5cVbTmIvbgVomqfaY7vR4ljRrNa5Ovn0Ckohr9e4SJKh
	b/xfocSbzbsQmqEcb27Srnwwd8WGHodgfLUpgfTp8cWVKMoQOrjWMgQJAS/G3tTeYrgxF8jH2J0
	pM+lPfMZAyNue
X-Gm-Gg: AYBFou0DSiw1SkVSMr8PGLjZkCrKIgV8dGFIjTs1TtiBvcFFLq7Vt5gCgzKNHS1EjFH
	TqgOy4KHZ0vDGJunDvj0Ymyob9P6bvWGEbPw75O4dkyAnVcgwOJ2/rVZysO5MlMb6UdSxWoKm/l
	PWQbE7ekc3+nnpqoCtQ37WGxRrcs3i1B8cb1Zo0k5LIG1wvG2VYZTyRsZ8ymHXL9JoSpdcp4f6Q
	jMyHc27Gay2jc2XYGFgDTaAf/rqSFSv7OBf0wGGzH72Jf1kuw/z14ybCgJoCM0qUq/74wKPDIq0
	Hn4aAvWHH7zKkeOWnqSt+DlxV9fThfKy90LwM0BY4iqk45VWsIAqPpvqDK3kxxjInsEETLrEVNQ
	iIgZDNaU42WCOnbh/9Dcj/ppJRuUj8uBLjx3KYDP0JMisnDoVAcKHrbDUoxYTLhWG+r6tEUejIP
	sd5/MD6hiHhR7NyxrYAonIrPLvBruw8I79iDywEZqRui3bRi9yZZDMbgzeXRsFGYaasWcZtPGqT
	CPHHgHY19nfFzdQtZns0wJwYMqZ1NOd0uZCd6ORMc4ZEh2aLlcUgo0kDMnpmmEfOMsypOcX3MI5
	F88QQFvMx0ksFjDMokAlIlRKOVDDRytbuwx1jyNQhqmHB0Eg3ETvpGG+22Qr/96F3U2DBOKRDyA
	QKuvrTkRYRtPYyAO49F77
X-Received: by 2002:a5d:4e05:0:b0:48e:21f7:79ff with SMTP id ffacd0b85a97d-48e6e50575emr5450463f8f.33.1793382811276;
        Fri, 30 Oct 2026 10:53:31 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm4656186f8f.30.2026.10.30.10.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:53:30 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 18:53:29 +0100
Message-Id: <DMID5D64EBS2.3IDHDRJOWK3W1@linaro.org>
Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Christopher Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Russell
 King" <linux@armlinux.org.uk>, "Rouven Czerwinski"
 <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: omap: dm816x: refactor and align MMC
 node
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
 <20261028-patch-ektor5-dm8168-dts-v2-4-4544429251e2@linaro.org>
 <20261030113032.51b92b19@kemnade.info>
In-Reply-To: <20261030113032.51b92b19@kemnade.info>

Hi Andreas,

On Fri Oct 30, 2026 at 11:30 AM CET, Andreas Kemnade wrote:
> On Wed, 28 Oct 2026 17:06:05 +0100
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
>
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>=20
>> Update the MMC node in the TI Sitara DM816x device tree to align with
>> the structure used in other similar SoCs. The changes include
>> refactoring the node to better describe the target module and its
>> sub-nodes.
>>=20
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>  arch/arm/boot/dts/ti/omap/dm816x.dtsi | 33 +++++++++++++++++++++++++++-=
-----
>>  1 file changed, 27 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/t=
i/omap/dm816x.dtsi
>> index fc124f9ecfa1..e3d49651b44e 100644
>> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> @@ -423,13 +423,34 @@ &edma 20 0 &edma 21 0
>>  				    "tx2", "rx2", "tx3", "rx3";
>>  		};
>> =20
>> -		mmc1: mmc@48060000 {
>> -			compatible =3D "ti,omap4-hsmmc";
>> -			reg =3D <0x48060000 0x11000>;
>> +		mmc1_target: target-module@48060000 {
>> +			compatible =3D "ti,sysc-omap2", "ti,sysc";
>>  			ti,hwmods =3D "mmc1";
>
> do we still need this?

No, we don't. I'll remove that in v3.=20

As per the comment for patch 7 (USB node update), I'll send two separate
patches, one for DTS and one for the hwmod removal, making sure the
hwmod removal is applied last.

Thanks for your review,
Ettore
