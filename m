Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917107;
	b=453/3udOKnGRdQokgBjCGjuZLwJNy6ziExzXKZJy3sNlx2Uvw3bXNm9MPWAqewLIpmST
	 w0CgkSms/68tkaJDLqRpLDbs6HbxCLyrZsHWAJZp6nBfSHbqDRfIhsFtMxSmh+L16FTA2
	 3ZVnuINFaMzYi3b9VItsI9Dc7CXOgHjlrakTfJ8mJ0HlhaLAZm97P66hfc3CXpCAzrODG
	 KL7mEIRmycMVZ4zznwa6Rj0vlgUWMdiKvA04OA6S7xLWq6YvVMrSV0NdQjx+T/607NjvH
	 f3q5SeDzOY0vzLzzzxG3rENjSBjFQz8sHImXmtW7fIBUMOlGqq1CLelA/Qds1j//6Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
	b=CHY9XMCOCh74cDNTZYsvz2oG+kK3WL7zCalQYBjuX0s4cO7yjZUy9rIwRl+41Zqi1JGm
	 DsAxgbxnu7OHs5RAQIgKUa6+QQiQpHewpB0LQ7z0gRBbYypVT7RB6LludZUEbCUGidpYQ
	 ZZnO5QImxHrhq6ScgXI1WAj+HDi6XYt7vnGjw787xo/2k8EfY0U5iO+CjGerVuQ1tP/tx
	 PC0kjXF+KAnNv6bJpdypXhZY1IGlY9MMQYCil5kapZHWhCSX6+Y/XcSWPoxGACLzM3NpW
	 QcCfcn/QF3Qrq5LMDFx4QJsdzdsdTwEQUiimUmZrnMpqmUNQZ68ud417WOw7rUT5Jyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=ORxEYea6;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2EA606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB2EA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=ORxEYea6
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso436084466b.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917105; x=1795521905; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
        b=ORxEYea6MFxGoUK0zCYHQMQ4RmiSZrwT7i9g46mYc6HzJwZYI6lz91n7MsJPSHP8L2
         VZgyKrSF81qlVHLJ87tuNd6qYCMfEm3kU+5hfW7eWUWEhoNOgJE3l6jJrMlMOPS5TnJg
         0p3rrr9O54Vmmq4wZXZ5jqs1z97LwcxxAAlZarRSVP1RgYMfRBjx/5PUjw4eRa8nH9qz
         56Bj2ghXjjD4cRETMZxMeK6F5BYd6JVmrmeDY8qcXqfRZqEosxGBHsCddrljWXR/OuM/
         tOWx2c7TEhSq9DR86A3bC3rjr1gVceVg4mDHCZoN5A1SWGE0B7Y0HcPOAkzSO/vs0NpX
         2VnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917105; x=1795521905;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
        b=DQMOMwE68MS3JxtLtovSTGagZwTzOm8o6vxjSx6NeCFx8vRBsbvyvz2vzxZOnIyZs1
         lkGl51lCdZ7mz3vvrgWkP9EmUsVflMj5V9zB/amt6hzdmj7TdlfGLBFUsd5tj5XtNGKS
         sFbMjAKVtUdFZfqCkAmpwBJkuy7ZTKa6mIhgrM1XmoprXIgZU9K9suP4Tawq4Iq6PnKE
         xX8g2dA3a4BY9NaZ+gQp9mQLEoVlQy4c6bf09igxRTbFurU1HiSsKOiImxEU0+qGwO4K
         RPcSCm7sUV0eg1N0a1tVvWAap4sNVdiY0aSRxPyNdypZRQe/0tQFE53PedqfHAkmbPig
         kzzA==
X-Forwarded-Encrypted: i=1; AL+hErEKauAV1FDoTt74oZXij22lnN3BcDP5koS+jNCgV7XVsYCxwb0ooITHzv9+58TJKsvmLKTJxL/iCFZO@vger.kernel.org
X-Gm-Message-State: APuU4Z+KuVIfiCLp/sEwRo+HixtHGwmF78Cd2cO0n61m0J3eaVC8ypbP
	s/Rqp94Cq9lmpq5eCwBP5s+d0HTY/Oy/3/Mt5fEyzgBFnV3mvFSnCO/V7LOHlgXUxMM=
X-Gm-Gg: AYBFou1XloHD8uBy+Hd4Rg5+DXziLNVyhPJo9Pb0yl6gPhHzVFdOhwQ0bhvD2PrIo3p
	qOYKfO3tVa7ON5slEi+AAT/ru4dw23TaV0ZKJr/WaZPwamnhI1TiK0LEc+Ir8Y+gcjaurblZCzJ
	37WSGs7LE6sVE/k0ZopMn1PNrtjqMdK2A2VZcBfBL9nm2PQvjH06Enjg7giEZdn0faSRxBeMFdw
	zjncxjBbAoDcKMjhLvVzTBZJNqRLdAsGs42kiTq8nXBDxk8PoS0yHQ5Ba9DDk2xA6U0/bwcJTt6
	O8UvV1sk/3VYIwSY+OS7e8XcIXiZqTTqPLukQiUQblbP10TGhift3NMhykEXBOxzjiqnbeQYt5z
	xSsvbqs3MAa6LkMYiW8F7lw9DYu8n6qtXmd2O2Skfo6QCsyBsGtH7Mp3OoLbgpjztSvKICgeCJW
	SrTIjWFceqhSI/A+Wct/BVXy1k7jB+JMOMAmUDfzJ7AupZJkJVgqvhMC/FtoTjkxXjXdSFbrXN3
	B0m14+0Q/EGNoMcWwXgrm1SmK2IUViIx1qdocoavml+/bcIQMUw2rNFuyieCdJB16yijZM534nG
	LftK+yV4m6sS4ArdCu3k+Wslh5VaCO6gxRGYawFKcyeDUAC6xX4No1S1OAL+58P02nXspstLGs1
	GA5BxV0ljPYjHQFzxEDs=
X-Received: by 2002:a17:907:84b:b0:c35:3880:773b with SMTP id a640c23a62f3a-c50963f11f7mr1200537766b.45.1794917105150;
        Tue, 17 Nov 2026 04:05:05 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm473472666b.11.2026.11.17.04.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:05:04 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:05:03 +0100
Message-Id: <DMXH0E5U7WSG.W427836YQJIS@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable PM7250B and some components on it for the Xperia 10 III.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 48 ++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 9d880f6baa531..697e1cfae72e0 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,6 +4,10 @@
>   */
>  /dts-v1/;
> =20
> +/* PM7250B is configured to use SID2/3 */
> +#define PM7250B_SID 2
> +#define PM7250B_SID1 3
> +
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> @@ -11,6 +15,7 @@
>  #include "sm6350.dtsi"
>  #include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
> +#include "pm7250b.dtsi"
> =20
>  / {
>  	model =3D "Sony Xperia 10 III";
> @@ -372,6 +377,49 @@ &pm6350_resin {
>  	status =3D "okay";
>  };
> =20
> +&pm7250b_adc {
> +	channel@4d {
> +		reg =3D <ADC5_AMUX_THM1_100K_PU>;
> +		label =3D "charger_skin_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@4f {
> +		reg =3D <ADC5_AMUX_THM3_100K_PU>;
> +		label =3D "conn_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +};
> +
> +&pm7250b_adc_tm {
> +	status =3D "okay";
> +
> +	charger-skin-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pm7250b_adc ADC5_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	conn-therm@1 {
> +		reg =3D <1>;
> +		io-channels =3D <&pm7250b_adc ADC5_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +};
> +
> +&pm7250b_vbus {
> +	regulator-min-microamp =3D <500000>;
> +	regulator-max-microamp =3D <1000000>;
> +
> +	status =3D "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status =3D "okay";
>  };


