Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A139989D
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780112; cv=none; b=I69+tZCA0zPWckkYSkHU8nnaQ0SIXHs8mfPUjOE9dsrk3iWMSs9otxAbT7cclPw31PTht/Z8EUQI+O5f7jOOGS5xMbST7ZurpXWfvmGcoejQBjeO7z5PoNBmAQg8eQhnv7LJ1LCm3hpGr8KKMMLHxhI7E0jphI0vKRC686EmxbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780112; c=relaxed/simple;
	bh=yPnvErrqXBAM9kN/vmlkz5PWxwisj1jDyO5XCubBbEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZSvrkyPbrkFe6EC4PNIGofKmbI3ms5OD/BhOY5m58vxPkz0iI1WNy7+OBQQvdG+ZN6T1Luu5BsUcxKMX3fn7F207n54544UC98ytih4l6+f+1UVNxghe9lPNvaTqmttNCtXvO0SlSEI7dJEhBYSRkdi1Gq7kBe/ldF4rbtfWMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nuFOoZi3; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nuFOoZi3"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa6145f230so36388e87.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781780108; x=1782384908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3751NHdLINpNfdI6QXdsatthsD5ovGh7dPON3Lsflgo=;
        b=nuFOoZi3snYT6nN7D3lhlT7PD96kACj6mmPAzabk6SK2C3/tu0H45/KjR3x0IeuelQ
         N6ex+fhQL+lLp+9G/w8crKJOnnLc2IbvsIv0uz4w0/jowXx8nNb6h0kjKbi6rw9sNNzM
         1kHY0jSpYF89qd8bchpZZNrY/sdAcPBOzVkg138ICBryIs7s9DIdT/qVbNehhf+8SQ/Y
         8hK+t9JsVDc5rP+IQ9PFHasJSdSPMUmx1eBzcRVGYoISKEBWbOQmXkDEhVepBJaw2oKK
         TRGuZsbjMEl6ECnxbAgVYdVPXJ9n6V+A+VEq99cTfd19wrCz8ms03TMqWLlu6NdasnCM
         9Mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780108; x=1782384908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3751NHdLINpNfdI6QXdsatthsD5ovGh7dPON3Lsflgo=;
        b=IJ3fxPj9glDdDyskGNtCnH8gGN+KdKjIEWX50TcqNO+ZFBQMskG3hhgW0aAsYWcAa2
         u4dzB+rv2kSO2uGP+7xVpzU5yMj0urRENZse5SDBxOjxuta3I4n0dV7zHn86Xx2pPfz2
         Z5iRUnqhg7J1CBe8J4jgIsc7dsp98QoFssm0De6+SxvBO8RmWdzmWLlBdomR6+fYoXgJ
         0EC7EYhBnmTTpio0PY/BkP6tWAvgzs68wJ1bktV0SSF/wcJ/JGXuFgqQ/XlvimmTC1hr
         2c8mHiudKtGg/Hkabxrt8oF4f4uR487Fi47Zy+AZTCdOHPP8lXlYVNchMBMzFsQbs941
         Zidw==
X-Forwarded-Encrypted: i=1; AFNElJ/wProG6mxSKpQgQAmIB4LQ5roL/8fp14+D5rClrsiQ/AHyIAvtAAVnSTHYokv8SRca0dp/orlx1bm2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ls7wpTedsTse9jppMWhoEmU53EbwrOnl+3FWa4vkE3B6PVF7
	Ua3ne64rNRVnI3ptcHgLgQ2RAoXIpb9d6euZrIh8MuC1GVoGgbucsH0wDX66b3PebBk=
X-Gm-Gg: AfdE7cmOHs5q3s/XFBahXHIPuLJzlxIKlWMTHMZeqK0tnt3lpfVK9+KCi+xqcJJylr/
	xSQrAEhCWweiIYqccgworziWlKXIJhC5nyoB4QiT084t+i/ZqTLuRCg6DwOErmndjTtlME8D86U
	KN51nuURshU4G192N9VMmL2LahNZOhJnHFJvPs9rpjoy5w4xNjU9+F7yUmW6gZu4FSK7zBwbPPH
	IlbOul39CfMhPnHS4zmToZzDnuEpkwsF5zN5AofatiNPchn0xAvXaHxIJQd+SDxAwBbYjQNuDv+
	hvYaSvyrU/Witu8XQwS8XxXFRc1iKUcawEOOQtUs3JwrHKyvfOztAz9v9tWsgNq6IDPVc93GPp0
	ICE1mJvf7Jnl9dUjwGciXJjKJZm1tEGCe1TPHZiER1zAR/MrGxJYhP4ZN5SGC1BwbVUkZIMT/Oa
	yuFUV4TpXXLJ8qHzhcmoXtauZSRuZZi8N43Ho47OWlNwNXOkGGse2c8IWKkCt1oI3TNz8=
X-Received: by 2002:a05:6512:b02:b0:5aa:62df:cd0a with SMTP id 2adb3069b0e04-5ad4dab6cb3mr467889e87.4.1781780108044;
        Thu, 18 Jun 2026 03:55:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a72acsm5344686e87.53.2026.06.18.03.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:55:07 -0700 (PDT)
Message-ID: <239af89d-baec-4a14-844d-639aaba370ff@linaro.org>
Date: Thu, 18 Jun 2026 13:55:07 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OG0VA1B
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
 <20260618-og0va1b-v1-1-dda71bb83009@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260618-og0va1b-v1-1-dda71bb83009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Wenmeng.

On 6/18/26 13:37, Wenmeng Liu wrote:
> Add devicetree binding for OmniVision OG0VA1B image sensor.
> OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
> raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
> the 640x480 (VGA) resolution.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   .../bindings/media/i2c/ovti,og0va1b.yaml           | 104 +++++++++++++++++++++
>   MAINTAINERS                                        |   6 ++
>   2 files changed, 110 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..302afc41bb776f75c08b26ac2f04014f8cbea4fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,og0va1b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OG0VA1B Image Sensor
> +
> +maintainers:
> +  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> +
> +description:
> +  The OmniVision OG0VA1B is a 1/10-inch black and white CMOS VGA (640x480)
> +  image sensor. It is controlled over an I2C-compatible SCCB bus and transmits
> +  images on a 1-lane MIPI CSI-2 output interface.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,og0va1b

So far I don't see a difference from the neighbouring ovti,og0ve1b.yaml,
most likely it is just the same device, and even if it is not, it'd make
sense to consider and add OG0VE1B support into the existing dt binding
documentation.

-- 
Best wishes,
Vladimir
