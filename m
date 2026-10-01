Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD03BFAD9
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832553; cv=pass; b=mTTmvymZBzCrcUedLms1sm38flM/7/18HqVGVLGuZ0JG4hocpf1AMKvpVTKXXkyIxR6LwI8i4lyvan7zX1AC1pqCz8G1L2G179WARrkIYRPOtFjvkzgWJdKcbBA7CYI5yhrDdyH2b2l0FJmyUt7RKJPNnGgB8ig6TCBVWtzSeQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832553; c=relaxed/simple;
	bh=iyH4XmChuCIrSHjq17pUFOv3IOKIb+u7oFkVPS6lsQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=OomDUpbzv7zYiN4k6reXK9e8ZunQmbCujqxIRlqVO7Y+MlxdkQw/jQ3YtBmyTBrMr5rHzaV5/mnWOJJC39IycbFhrO7n1F3bKRhzg3tmBP54BFBIUIyABxFQzBkQMroMFedhQtCDnS2zttrzmolfM0qBLGnxhheOGmZh+cChHJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osDYJEBd; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osDYJEBd"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so936407966b.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 22:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790832550; cv=none;
        d=google.com; s=arc-20260327;
        b=HG1AqK32hHBt/2zw/VoGX9utPNDiAJFgXqvwkjv8uUIVm/KsKuITazVLrDHyvo/J39
         0hfQsAtw4IUyDJr64pQXRWofrBFX19Qlfyb9mXfi3w9BbkNv09KpMB9xbeJX6xoc5Khl
         U3S0O6iYFPEGI83hoQZ9Yvm9IR2crG2S3oo6l7qmIHrf85l9RxKz3FEESD3ulhEND2jn
         i1pGNzY8v494qNn8gL7o4tMo9SGaJ8RB5A7JRKwVeN1W331KvbHRk2+C+jQQFWoOsXKo
         wbBpulS7K5TjWfMxz4Qh2rX4UZd07GIa0SLFRimqQK7bQahA1xiJDQHbmwtUaCNc29bV
         aPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=XGarxBDiXUXvFqBOUfn28UY9mkYR4GFN16+AwUpnjOA=;
        fh=RhQ/xLuOqzdbAOuqGTPUaN6rJqpxot4h//2Y/DXXhWU=;
        b=q9O7GcL6hLUTLA4QYcgtEg+/6gKqLCu6RM4m6dcUOfJjIurHPoJESIILph88/cIBGo
         GSEojyQSpRqwLqDew4Er2iyrGOzfWtqEk0mNimhhwW+ouyknWlHVYahGGJYp1uB+1xb6
         wowl0C/IrpJZUNR0RKigLoL3QUHxIb436bJPY7eeHXyIQXAjGzWlkUyV+rZeR7ZT3E4Z
         azmbMNPm3emDXFEiaax0H3lQJvKy/lKY7S7wklv8zNTKPi2Fo/Dv1q1i2mKFYv5mtfvw
         UVxdS5jnm1J/7Nk/1tPHP6qqu4l2B+ufMO6rfPX8KuClXW9g78qUE/afLacnuCE2TCl3
         xLBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790832550; x=1791437350; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGarxBDiXUXvFqBOUfn28UY9mkYR4GFN16+AwUpnjOA=;
        b=osDYJEBdSquqTH4ZFXpMUHX2XBr3nOEgG1h8rZyrujLdLCVNRxl9RPOdGTRH9DmyPz
         l3ITIkRVULsPCqWaADStaEPoZoUY442sUyEh3MUoEBZ/dlPpdiXKf+PbY3N6dFOwtzsi
         jPtKhfP1YbdErbdskHmZkFDbE5BYOfsL8/ZZT8Vw0X8SXZ7qJkuq6/b9s7L3r7qWdmPT
         90aS+lptcxezM5U/C4ni4Cl8hoxNfY/UXpJodKYKzlLhXyyKKth82yeJH4K25tZKUlqD
         TtssVuIXRsIAP4l5SrN4Gah2XAuVCE75YbjpqamLDpXjtDj27m2fjwmHm5teYeGFEf26
         MOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832550; x=1791437350;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGarxBDiXUXvFqBOUfn28UY9mkYR4GFN16+AwUpnjOA=;
        b=Tc3HDxRuoEAo+6mjtL534Qw1vzQzM5uXU5IEeaYjRXCxGjLy0Gy6o14LpDI8mnMhGq
         swmDadWJowheuQvx0V7Hx+R+iUtl8hJNsKw08w2pWn4dKZjmWFqFMF8WDwmbExC1wqqH
         q11FfjRBI3KtYGv1sY7bawEJlsfR/THF+rVSswxeDzTHofrqJ06EdoJMH+EKjzkNsTam
         oBxhJJ/6YTL46DUr3s3V9OpRdSlEoYji9OI291PaoDqwRS7lhXXvHbo7fRd5Gc7RREPP
         2TSp47Vv/msKHf2A4XsKcj6TB1RtijaXNftPwmMd2WkDHN+t6gACj2digEYmRVoeFHCJ
         Omxw==
X-Forwarded-Encrypted: i=1; AKwUvByJByL7A4+PpvdqemBBt/qwaGfpZ9JS2vOykBE6wypz/ma9qMNsd37Z+OrWb53C/ZvU4Dfy/c4NplIJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJQO0KLiTgBxU9WSlu9Ij2orsEnCB7BdaTJd2Tg0tMHmsoKFkho
	40piRizJOv4XuYjs9B1U9652LjG0fNxrTFesTF4JF6IKSquRIVCgsBRi6IiFhXIQGMsiR0LxUOc
	DCtOaSqTIaNSv86Rt8FYjm8JXJQdN/Xg=
X-Gm-Gg: AYBFou2F00x9dXrdFqEy7SfoVgDtbaPkqNb82oisbmvzMBltoP2LU8RD5zels7c0W5I
	CfuO7jWQrWakS2ayooCSFvrYrmZPorcN9W+N0lMuiizCRPIjzbCRsUXFk3IoB+A+csLQWr9CD3p
	EioMTclzVYOpz17FU3+tjV64oOS+o8XI+08oPFN5eHveamel0VEoi8CUKwmSZ8LtO8D6o4HVUeG
	y3MLhzkL7wNihSMXJAep45wzZjcd9hAR2HuPl4LmsRP1uzak1COAoFdzaJ5Xbm9+xAGLrMj6Vi7
	d1oC2nSVFFINopfOAucUYqGZU5LoGyROeu8PzTLieL4X8U5YsrG1LBqDL8H8oyQ+OQ==
X-Received: by 2002:a05:6402:1906:b0:6ac:73f8:2e5a with SMTP id
 4fb4d7f45d1cf-6ae199853d6mr2960704a12.41.1790832549463; Wed, 30 Sep 2026
 22:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923211816.89954-1-lsa.uz@pm.me> <20260923211816.89954-2-lsa.uz@pm.me>
 <CAKNG7X8CTnp2UNYEKOt6r==WdP2v7oxW0nUZ_MANtCCgpghP+A@mail.gmail.com>
In-Reply-To: <CAKNG7X8CTnp2UNYEKOt6r==WdP2v7oxW0nUZ_MANtCCgpghP+A@mail.gmail.com>
From: Andre Gilerson <andre.gilerson@gmail.com>
Date: Thu, 1 Oct 2026 07:28:57 +0200
X-Gm-Features: AclHuK-VbD2xvscLLOhBugu82UCpNYQ2zHUF3TP2o0zojNR6k3K4mn-rv3V3V-A
Message-ID: <CAKNG7X9NkbXSnWGR4-79akJ7WiVeGa7D0mC=p1Pz2gTFO4npZw@mail.gmail.com>
Subject: Fwd: [PATCH v7 1/3] dt-bindings: media: Add Sony IMX681
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi everybody,

sorry for the late reponse, I was away on holiday. I was originally
working on the IMX681 driver as part of my efforts for running linux
of the surface 11 pro intel. Thanks for Sergey to bringing this to
mainline. As Krzysztof asked on v3: I am fine with being listed as a
maintainer here, but i would include Sergey as a Maintainer as well,
since he contributed as much work by now.

Acked-by: Andre Gilerson <andre.gilerson@gmail.com>

Thanks,
Andre

PS. sorry for the doubling the email, the first one was rejected due
to HTML formatting

On Wed, 23 Sept 2026 at 23:18, Sergey Lebedev <lsa.uz@pm.me> wrote:
>
> The Sony IMX681 is a CMOS image sensor used as the user-facing camera on
> several Microsoft Surface devices. It operates from analog 2.8 V, digital
> 1.05 V and interface 1.8 V supplies, is programmable over I2C, and outputs
> 10-bit Bayer data over a two-lane MIPI CSI-2 D-PHY interface.
>
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/media/i2c/sony,imx681.yaml       | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> new file mode 100644
> index 00000000000..6d2e4ddcee9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx681.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX681 CMOS Image Sensor
> +
> +maintainers:
> +  - Andre Gilerson <andre.gilerson@gmail.com>
> +
> +description:
> +  The Sony IMX681 is a CMOS active pixel image sensor with a square pixel
> +  array, used as the user-facing camera on several Microsoft Surface devices.
> +  It operates from analog 2.8 V, digital 1.05 V and interface 1.8 V supplies,
> +  is programmable over I2C, and outputs 10-bit Bayer data over a two-lane
> +  MIPI CSI-2 D-PHY interface.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx681
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Input clock (19.2 MHz)
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply (2.8 V)
> +
> +  dvdd-supply:
> +    description: Digital power supply (1.05 V)
> +
> +  dovdd-supply:
> +    description: Interface power supply (1.8 V)
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO, active low
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dvdd-supply
> +  - dovdd-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera-sensor@10 {
> +            compatible = "sony,imx681";
> +            reg = <0x10>;
> +            clocks = <&clock_cam>;
> +            avdd-supply = <&vcc2v8_cam>;
> +            dvdd-supply = <&vcc1v05_cam>;
> +            dovdd-supply = <&vcc1v8_cam>;
> +            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
> +            orientation = <0>;
> +            rotation = <0>;
> +
> +            port {
> +                imx681_ep: endpoint {
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <969600000>;
> +                    remote-endpoint = <&csi_in>;
> +                };
> +            };
> +        };
> +    };
> +...
> --
> 2.54.0 (Apple Git-157)
>
>
