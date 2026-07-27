Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF003C944A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152954; cv=none; b=N+uRrmXerfZ+1NnFtCl2QmDn+4ZHLDcUUrxevhFIw8E1uZudSNu3rUVXEEM+brPyDZJapuZFSUou0DRYKtTKFScJzzYai9gFh1ybYIcRDs4Rez5WdYpJkoeFaIC5Oeveqmk9Ozphb0O/NN8K4tf/dOzbYu2b97S7UZ1dskiQLYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152954; c=relaxed/simple;
	bh=kfmDrO+qQlD0U/EqeMAcJh53UY92+0qZwmO7dWbUNYU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=GPTg4iMLDq0Eo4pvZQqtEtgn1lViQbC4CikGjA+vgxJOrX0bVAOhJpx9xbMbwOnFlD4S+ABzIPw99jtDvpJSLOthW0A3yFqvPJblIiaZaHfMTrmMLcgdSLu5IeUU9K+C1vRPLak14IDmfPouhGJZ5TFkxXF2W03bUBtFYlz3tAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=icXP0jzp; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="icXP0jzp"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so4093373a12.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785152950; x=1785757750; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U2B5+ZNIbt5wpYmMhwGwrVTQ9DhkKPd2GAMOogsvhGQ=;
        b=icXP0jzpZCVAwrnq4xRnfV633Ty+jsBPTHIqSJILzrqHgP4no3EpT/JcBwOiqd0TOl
         tNS0lUlUUEQjEKJgzD1Vz8kJRgMYAZY8kPKqozpKvyTjFpBxTMw/Eqvbfl5F4URuGl1q
         K1i4+SAzRhtLRgQgRspcvE/Zy7yZpfhF2Oyx3R7z3KQZs4ZKt9UHY0qrIsGOL6EecOij
         Kh3Uxg1Q/b+kHG3t1GGkMxUjKe48aDvHoawjO7maC1RrooEOuQdzcmfvxdwuh0RY25NX
         hhZXLgjpEpj29J5xBpldbGsH4aGRSkyMfmdOPJ/BPMht1TQz2uhLgU7WPM7p/twWe2BJ
         zaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785152950; x=1785757750;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2B5+ZNIbt5wpYmMhwGwrVTQ9DhkKPd2GAMOogsvhGQ=;
        b=RlATZOWBplHvkHnCDdRu42b3yL91HrJsoRbDA5dfGHa01i7nLVz4gyptlYPGXNKeOr
         kfdHooWu2inXz7GfemJsMGsXZWQOVKwNRLeM4bf79zXNpGdIQHRglgVplrvwAxy63wqC
         +qpgHVOpqyq+0RE3SCC/V3Fn/xsD5D16kwo8AwKJQVxNwwZ9jIWtUDfemyypQPMCr9y0
         E4MzXusVl16zpp/gMuzkchmuk3K9hyyENOPfq0tYi4xB2jd5A3QwZ952CTHFSIvoig80
         V3ft8VRfF65YiJFikhd2GGapGCtjeE4Kgwtzd7HCDILlnVFvuII515FE4DE8MbIasSmK
         vClg==
X-Gm-Message-State: AOJu0Yw4IMdkwt8gGBlMISbiVmaoCwtj8wpNuOWzkaYQM/vLZSNbo/VG
	Je5w9F1ZBWOUaEj0l2+6VnnAR2QiPMGKqALqWaSTEyU8sUIsfs01hy/NSioEvW4IRgs=
X-Gm-Gg: AR+sD11jJTKp3B8wv49uH5GLjMkpaxSayt6N9rIxS77/QGtLMNLke55Qqal+vkAT4Gu
	J/XWIf0yFaYCmyv7mE70QvJ8+X5eDEz9wuy6Pys1pVNKAPQDiUluEEy5mc7J89zyrujzoipAMGY
	gRLsTL//d455+Pgv5szquqTx00Gy8Sctlec1nbemRP6UpbNQEuGSlvke9GxKD8HLHw5hn3ObzwS
	MDIwnqCT+2ptrAkoyNLRHHES11Y8AdCjpJKBCSvsLSVQ4b32Z6or0Lz1RxG5aQiSIoOR5o8tmJF
	/PdxyfPABw5zvM6gnAIKCzNv4yTLZ7tqbKhALGmhXfQJubgZRjqdyTfsiRdcS79HSiKQUgfaxsA
	AW52DhtPO/TXw+qPKnU+XUnKeaLsUmTU3sQWxv4wIvI8Qx9J0ep/twICEZlIM0T8LpdO326D2zo
	vrRclHJ/1R3FkmVPEECiSGVDT6nzVvpHAs8slRAuPHK+hexJxtQEHctQT0
X-Received: by 2002:a05:6402:44d4:b0:698:c1d9:8134 with SMTP id 4fb4d7f45d1cf-69fc0ff874bmr2476224a12.9.1785152949730;
        Mon, 27 Jul 2026 04:49:09 -0700 (PDT)
Received: from localhost (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5958ea0sm2526661a12.31.2026.07.27.04.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 04:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 13:49:06 +0200
Message-Id: <DK9BWMDFMNK0.K7MAJJAZVKM0@baylibre.com>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <dlechner@baylibre.com>, <jstephan@baylibre.com>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Carlo Caione" <ccaione@baylibre.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Jiri Slaby"
 <jirislaby@kernel.org>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: alias all enabled serial
 ports
X-Mailer: aerc 0.21.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com> <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com> <a3298120-f5be-4a8a-bb71-1d6923a28d6c@collabora.com>
In-Reply-To: <a3298120-f5be-4a8a-bb71-1d6923a28d6c@collabora.com>

On Mon Jul 27, 2026 at 1:30 PM CEST, AngeloGioacchino Del Regno wrote:
> On 7/27/26 09:38, Carlo Caione wrote:
>> On most MediaTek boards only serial0 is aliased, so the remaining
>> enabled uarts get first-free ttyS line numbers from the 8250 core in
>> probe order. When the console uart defers on its clocks another uart can
>> win line 0: console=3DttyS0 then ends up on the wrong port and the boot
>> looks like a hang on the serial console, depending on probe order.
>>=20
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
>>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
>>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
>>   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++
>>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts              | 1 +
>>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts               | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi     | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi     | 1 +
>>   12 files changed, 21 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/ar=
ch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> index 0e086dd487d9..63659e240b1d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> @@ -20,6 +20,7 @@ aliases {
>>   		mmc2 =3D &mmc2;
>>   		serial0 =3D &uart0;
>>   		serial1 =3D &uart1;
>> +		serial2 =3D &uart2;
>>   	};
>>  =20
>>   	backlight_lcd0: backlight {
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/b=
oot/dts/mediatek/mt7622-rfb1.dts
>> index 8c3e2e2578bc..7bccad118d24 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
>> @@ -20,6 +20,7 @@ / {
>>  =20
>>   	aliases {
>>   		serial0 =3D &uart0;
>> +		serial2 =3D &uart2;
>
> Why is that serial2 and not serial1 =3D &uart2?

To tie the alias number to the SoC uart index instead of to the set of
currently-enabled ports.

The problem is that uart1 exists on mt7622 but is disabled. With serial1
=3D &uart2, the day uart1 gets enabled the aliases have to be renumbered
and uart2 silently moves from ttyS1 to ttyS2 (or we have to again mix
serial and uart number).

Also in general it keeps ttyS<N> matching the schematics' UART<N>.

Ciao,

--
Carlo Caione
