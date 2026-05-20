Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C1C2BD0B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278989; cv=none; b=RTyOmbYJ38jykRDT89b7qCWWoiG8x339jYu3IpT44oF6WyZHeCI1a4Yz8c4cfcJ/BMG9gZoyOukVdkLkGZgXZLIBWP0NdfMc8bbt09/EIVczJyM8DV18bPBlQaJOdMWyBhOS8JCTSaUmWywM5u5wVUf7i4bjhb0Kt9cNIHcr/28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278989; c=relaxed/simple;
	bh=apP4bHK9o8kKM1AATKJRJEhNmgYIjEwrlA6dPIL2hwE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qsr/ajSJnQ5nFzBJXw31Aucky7Jjf1D9Op6iFPiGVcOYz/vWDF8lbnasZj/XBcupNWgkdCgsMz6IcgCV5yKkcSbfv6eUD8DIEKPHlYIIEs/xolZO0FwHwdmoVPT7vG/C48BMVN6hORZCRmRDWFhYeC9bz5QNu43sW7VEnHv/NCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bfDJqHLB; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bfDJqHLB"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67bce1840f1so8281366a12.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779278986; x=1779883786; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0f3m0GIe6VwwygrGPUchXC8YWWLmWU3POOz3A5MK3WQ=;
        b=bfDJqHLBaUClsr6ITOpH0RLPvxZawuXlCbnb3Kdl58qw5pJnicJInvFLshHyiMNEUF
         JsGgOWUrOLznYJ8vDXG7mhahqq+RkJb4EMsVptGLvE7BLl0nzpHjck1wb767kW7ILRLp
         c2F4u5eh6niNCNVJi72NWi6rBUGA4opgoIuljbhWvelqDGGjcKLePEImc4cQQ0y3kPnZ
         6K1GQMi9hNcEfBjcmAMzb93QSLXzfj/I3JYjijOF80i46GUfWHuozx5wPbi/MUAXe4WI
         DGcQxF0pDG1R72bYp5Vm9gPSeSD39FxCYMZNQIEEhI5rqNbfL5JM2qM6mhR34KRNLqu/
         c/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278986; x=1779883786;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0f3m0GIe6VwwygrGPUchXC8YWWLmWU3POOz3A5MK3WQ=;
        b=el1MuCFSyg8hMXxT8GXLcequRAsY8GT6VaE4okm8bGtIuJNJostdmZKdz/5nzwelTt
         7vplYdna+Jgwg2Y+15kpbClVfT+Bn6jCOuW+u4ugGCFz9AQH4YaoXy1bdz8k0FjS8+Xv
         Ja9+FY5ebaslXBcKpjVVeYcoySVoxJcYXja0vHDRTst7dvI0GAyP1k2Pdm48SXKqLje9
         nho45oY3XXIvcGr9QdA5fxLpgKo2RA7SRN/UZbDDnqWkicWYRlgId2Z7tthDIKkJxpzn
         lkBWVUZQYTaD1YyWTpGEn9Wi1spiLfajug4EZQ+JBR3Hw3JhTQEcC0Gr0qgV3ilXsolW
         CqOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/a2IxM0UnYtt94L/oDm4W5ZKincidhTX5k5Tu3NY07wIxEQrVnc29Gw93a0056A1eftKylcm6Ic7TH@vger.kernel.org
X-Gm-Message-State: AOJu0YwIMldTtelF0vtLMP3IhcV5Ni88U2Gatax3ttCasc2ZhDv464ne
	fY3DLj8G2rT/Hcdx3tWgloJ5X/rkAuk1QEOKdKxdBtMcSPGaN+RLRKTLorixyE1Px04=
X-Gm-Gg: Acq92OGnxDrsEu3m6swQMhPNjeGf9K1DI28YW3MK4KpqdnjAA3RZtqH+Eau8MourCJ2
	zUKsMJAenrx6x52+cDhwn4oX3ktb30vADnz5ni1kB3A7SB8ph7JEN3XEtNVqkroESq/yCk9L8ki
	wxUxsM3bLKO7lAtyXQDBjO/tLYDJydXCy41egiwq8Senx7slbFNM1cjMg0uwLQpcnpqIcBwdf5C
	paF65HLr4F7GXi2kWrkde04csWy9niEjQmI60IL1ubFaiwI9FQ4GWtjPIJHh1nsAPLFFw3u+Kd7
	fm+dVBOC/9Pbr+ECgDrFXZtPjkTWTDPbwf+fnYdp2bJxscS5s87HYpGq2tXluu7DBPfYOFdrpL8
	M25/RFsH0/NRkMWuDKBSUC6G8ux+VFfjmUqk3btcrVJ5O2VDifSmTXoRsWMXM0ahtqCIjlS5BRN
	YgAHHXcJ9qOP+OIrNoB8FK7y4icUxf+CxPM0ILigH86GqJsHMMEdMYTy2c0TM6JUCj8ddy
X-Received: by 2002:a17:906:eece:b0:bd8:5ef9:9b38 with SMTP id a640c23a62f3a-bd85ef9a0b5mr744077666b.33.1779278985602;
        Wed, 20 May 2026 05:09:45 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e5eef9sm836855066b.51.2026.05.20.05.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 05:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 14:09:44 +0200
Message-Id: <DINHRDC35RER.Q143U5P4ZV9O@fairphone.com>
Cc: "Hardevsinh Palaniya" <hardevsinh.palaniya@siliconsignals.io>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Elgin Perumbilly"
 <elgin.perumbilly@siliconsignals.io>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Xiaolei Wang"
 <xiaolei.wang@windriver.com>, "Walter Werner Schneider"
 <contact@schnwalter.eu>, "Kate Hsuan" <hpa@redhat.com>, "Svyatoslav Ryhel"
 <clamor95@gmail.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add imx576 sensor
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Himanshu Bhavani" <himanshu.bhavani@siliconsignals.io>,
 <sakari.ailus@linux.intel.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>

Hi Himanshu,

On Wed May 20, 2026 at 1:56 PM CEST, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
>
> Add bindings for Sony IMX576 sensor
>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>

This patch is missing your Signed-off-by I believe since you sent the
patch.

> ---
>  .../bindings/media/i2c/sony,imx576.yaml       | 111 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx5=
76.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> new file mode 100644
> index 000000000000..b74253004fae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx576.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX576 Image Sensor
> +
> +maintainers:
> +  - Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> +
> +description:
> +  IMX576 sensor is a Sony CMOS active pixel digital image sensor with an=
 active
> +  array size of 5760(H) =C3=97 4312(V). It is programmable through an I2=
C interface.
> +  Image data is transmitted through MIPI CSI-2. It supports RAW10/RAW8, =
COMP8
> +  output formats.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx576
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: INCLK clock
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply (2.8v)
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply (1.05v)
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply (1.8v)

Sony calls them vana, vdig and vif.

Regards
Luca

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active low)
> +
> +  port:
> +    description: MIPI CSI-2 transmitter port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dovdd-supply
> +  - dvdd-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera-sensor@10 {
> +            compatible =3D "sony,imx576";
> +            reg =3D <0x10>;
> +            clocks =3D <&imx576_clk>;
> +            reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply =3D <&vreg_l3p>;
> +            dovdd-supply =3D <&vreg_l6p>;
> +            dvdd-supply =3D <&vreg_32m_cam_dvdd_1p05>;
> +
> +            orientation =3D <0>;
> +            rotation =3D <90>;
> +
> +            port {
> +                cam_out: endpoint {
> +                   remote-endpoint =3D <&csiphy3_ep>;
> +                   data-lanes =3D <1 2 3 4>;
> +                   link-frequencies =3D /bits/ 64 <600000000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ff935e197c21..1b15fa355e8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24856,6 +24856,13 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:	drivers/media/i2c/imx415.c
>
> +SONY IMX576 SENSOR DRIVER
> +M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> +M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>
> --
> 2.34.1

