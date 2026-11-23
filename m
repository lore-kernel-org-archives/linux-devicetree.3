Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436020;
	b=hoeThyDLK3vdReRfdrrZQ2OiaV+SybWTBMX8W+qwpp5LTCK3c907Mziel/P4Bbq7AHRU
	 +tj2aapogHcmh3wogPME0+rkZ8QQ4FW/P7njMWfhgUKiToRjccBirulH5jcIPKqn6mznK
	 vIgOU1AK6L6/0rPlG06vkchfBU0O/Wi4mbCOEPo50+PdfHnCcfGxkq9gVpEuWTolWm7SN
	 JyPAA/VotwTgGgleo5kN1dSV9uXrm8ZYYpDTdeF7sB+SRSoo38N8gcyYVEFkVNyIntcIC
	 cL83BiEyFpWSC6i4b7eeOJ+8WsOEUhjzylYxGUB3tSixHmyA7jI5fc23UgBHnLWE3yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=;
	b=tfvTDRDJg83twjhm18oYkwmXyHjkgQwKcGnhO9FB4LlncOPK96icHvK2IHk4jg426UVy
	 QyVXIO/7+Y0HJ5RWidykjGiXoXC9TL2gujj6eQsi2NuE2FxbX5S2LCYKYe5IyoMnx5P7d
	 gSQ1CXpzKJYbC9AH4YK2c0o2JKHEo82IOSTgOKHYlQDuFo0/yr0KqQFxJBSkUAZQa6u7b
	 izQlMY5/omlpruXf5s74LqIfib2rgt7H6Dfr7P2DqUwWF5xqNRZVojHBN4u2FRaaGyaQ5
	 LxWVGGCOG56C53LKHOON/U/qSmXbKXcAPmxO8zq0CYjNU2Q4UEzRHQvdFGbm3Cf7yLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHGR44PV;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35D1606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35D1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHGR44PV
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so4594435a12.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436018; x=1796040818; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=;
        b=bHGR44PVxLG3t2B14cgDrCo2Ck5i4EHcesQaHIz5JBjtcP4OZc8U6jPhFWjT255fPF
         M/vxlBLGjHpAPsUYF3SFhZRN+CCcCiihtxgsQRCSUy8X0aV0Ar9JuF1BOLXQ/71JGRYA
         F4oagLvjNqr0ieuo8CzMea/RE9OIf2BjLN36ltLUGVOkjasfGSd5CMlWaje3MSbBQpXu
         iqAXurSOGSmmFrQqgsOohgmvEGEHrD5MDSVfvDCIbe3+kHp65puY8xMEyoN9wuSWN0+p
         BdYKvquP78cHpuW7MK47qI1IlVOPkVP/7YgnnglfHQLmjU4jcikc1utMqT8zJaHLVTro
         DB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436018; x=1796040818;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=;
        b=15c3MpQur28MLGlbSDoKWuu58GT/cf5DvqteHPPonmolnnnjilfGe5t5vrSBEKyKOo
         n7+mHAntXi+aQZFeE642hB//1mgCzWM4zmWCwQBWAmvBExwAvEgilB7Ksu3KFAYgfb+l
         5NmXZD5SNys6T03XMpLpQ8Ho5WvMKu9k992lqFUxXxgrfv5vp7VdVB0VLipAN9NCcEp4
         lxY3kgcyOBGlGShz/vajy/vDmkUcTcZ9QxDpSJm0DFF8QyQgV3za/NMwxz4/th5JfkJV
         79OXTc47aw7BiN1dwXp8Tsu6huL8i6JoLR2gnX6zWsk8+lxPmgmTqaOonnXuflXM7plP
         /M1w==
X-Forwarded-Encrypted: i=1; AL+hErH6zelipL8sifX5boNcrvnOxxq1urpT/Q03cSnCDduYOnyUOlqm60jkrQW5liwDH74qFMDXiEXQ71R7@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xcg+fgs0C0as0OKzSe4G6P7542uPVH6VKP4oscN06bf1iv5G7
	+x6SrTnHxf1wU4FsGLuDHUgM4C27i2Ycnkjp6ub/X9rPLEsCO8UpA1RL
X-Gm-Gg: AZFdTZfiuTvw1PoOuMUvoEMY7ju4vfi5lUxJPVsVVQ5G1v4TTSXAyHDcqT7nT4yOVjb
	JAIFHIIlkEwSgSR/fuwaTTM1p7tSojZHqs3Cp7mctUrbAS6GXIT44YHfsvkXIu8PXdNEctuPbPW
	P/tGMrF+DyIfiq9spmc5a++iHVKrCZVgen356MlFhmiKpPnwe5aWln2TRsD0JEPUbiYcvnMRdfx
	YPRwoPGEKXxqihBPKfNjNUU+b1s1nOA7SWBBAgW0IeLSjNk/mDCPduRXltupfN0QXrERoVk0N/l
	bolpXk88QSsTZlrg5eheN78hckqaDAnTN0kvCh5NdjOtEaqIzwA97YFpCfoF5CYtXhU5it06/BR
	ActC2U626znLtt6/N59q2eQ5Q/y/31xqwQn8m3noijgKWB0gHDDfOE1+XYPA3LG30xKizGau0bh
	y9kwgkYoibIzjH7cX716+SxFzx1ca7MxPo32iTLUBRXO+0r1D8620fx/9iVwtTpq41IptXIWnfq
	BLaKDcStj/6SUwZ2pAoHAew0ssfs1E7k3jy0odO6rIuYdgQ01I4fhoggw99HG5VEaQC4W1MgGqe
	yCPOZsSl8gfy7xN+Dr2Lr9NSH2tyw1ENLhcAh8+VjwLinZaE0IgABd5f
X-Received: by 2002:a05:6402:3207:b0:6ba:9cea:5bdf with SMTP id 4fb4d7f45d1cf-6ba9cea5dbfmr2715988a12.8.1795436017691;
        Mon, 23 Nov 2026 04:13:37 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fe162sm5443990a12.26.2026.11.23.04.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:13:36 -0800 (PST)
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
Date: Mon, 23 Nov 2026 15:13:32 +0300
Message-Id: <DN2KY5MGERWB.3DN1SFL7JZDLO@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-7-95c46597e63d@gmail.com>
 <cYX8v2leizSJfWjS_2dbkU2i6ApgjEKmgar6xjZopFQipSXW6YZNgjexWomHucqKghaTzW7oO5GN_jeNBM1MBy0u7aEDR2ygQ1s7x_L2jpA=@protonmail.com>
In-Reply-To: <cYX8v2leizSJfWjS_2dbkU2i6ApgjEKmgar6xjZopFQipSXW6YZNgjexWomHucqKghaTzW7oO5GN_jeNBM1MBy0u7aEDR2ygQ1s7x_L2jpA=@protonmail.com>

On Mon Nov 23, 2026 at 3:00 PM MSK, Roman Vivchar wrote:
> On Monday, November 23rd, 2026 at 1:20 PM, Alexander Letuchiy <asalde.le1=
@gmail.com> wrote:
>
>> Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
>> Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
>> console on UART0 and the volume down key on the SoC keypad. The power
>> and volume up keys are connected to the MT6363 PMIC, which isn't
>> supported yet.
>>=20
>> The DT only describes the memory that Linux itself uses, which is the
>> ramoops region. The bootloader updates the /memory node and adds the
>> firmware carveouts to /reserved-memory, so their addresses are not
>> hardcoded here. This DT must not be booted with a bootloader that does
>> not do this, as Linux would then use memory owned by the firmware.
>>=20
>> The ramoops zone sizes place the console zone at the offset where the
>> bootloader expects to find it.
>>=20
>> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
>> ---
>>  arch/arm64/boot/dts/mediatek/Makefile              |  1 +
>>  .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts | 87 +++++++++++++++=
+++++++
>>  2 files changed, 88 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts=
/mediatek/Makefile
>> index a86fb313b1a9..d73489149ab5 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-evb.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-sony-xperia-m5.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-evb.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-x20-dev.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6895-xiaomi-xaga.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-r64.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7981b-cudy-wr3000-v1.dtb
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/=
arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
>> new file mode 100644
>> index 000000000000..7bfe0d438803
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
>> @@ -0,0 +1,87 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +
>> +#include "mt6895.dtsi"
>> +
>> +/ {
>> +	model =3D "Xiaomi Poco X4 GT";
>> +	compatible =3D "xiaomi,xaga", "mediatek,mt6895";
>> +	chassis-type =3D "handset";
>> +
>> +	aliases {
>> +		serial0 =3D &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:921600n8";
>> +	};
>> +
>> +	memory@40000000 {
>> +		device_type =3D "memory";
>> +		/* The size will be filled in by the bootloader */
>> +		reg =3D <0x0 0x40000000 0 0>;
>> +	};
>> +
>> +	reserved-memory {
>> +		ranges;
>> +		#address-cells =3D <2>;
>> +		#size-cells =3D <2>;
>> +
>> +		/* The firmware carveouts are added by the bootloader. */
>> +
>> +		ramoops@48090000 {
>> +			compatible =3D "ramoops";
>> +			reg =3D <0 0x48090000 0 0xe0000>;
>> +			no-map;
>> +			console-size =3D <0x40000>;
>> +			ftrace-size =3D <0x10000>;
>> +			pmsg-size =3D <0x10000>;
>> +			record-size =3D <0x10000>;
>> +		};
>> +	};
>> +};
>> +
>> +&keypad {
>> +	debounce-delay-ms =3D <32>;
>> +	keypad,num-columns =3D <1>;
>> +	keypad,num-rows =3D <1>;
>> +	linux,keymap =3D <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
>> +	pinctrl-0 =3D <&keypad_pins>;
>> +	pinctrl-names =3D "default";
>> +
>> +	status =3D "okay";
>> +};
>
> Nit: vendor,property should go after pinctrl.
>
> debounce-delay-ms
> pinctrl-0
> pinctrl-names
> keypad,*
> linux,keymap
>
> status
>
> P.S. scripts/dtc/dt-check-style --mode stricter can be handy.
>
> Best regards,
> Roman

Thanks, I followed the ordering Angelo suggested in v2, so I missed
this.

Best regards,
Alexander
