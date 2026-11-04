Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834180;
	b=zxhSu07nTFzd1sdt/wJ5H3jeD4zJ3NUxJqB15iXQcGv/APaiRLFKAbcQbhBJ+LvFCqf6
	 00vELiBZup5Reb19GEDhYu1V25Y6CC/xlbnYun7dj/3Kan+uQXLVSD5OH+qcNsx4BCXW/
	 ZZ7Q0Ne5jk8TluPRaQ9LndbNjBa5fQbtHarbdP+QfkhtE4TJX8es5RjeZmWWhuJ82jkGg
	 pfvqwgRbMtrjsyC7M6Ff2eukMZxMQ8Y0GDu4F5amf4Q1ko1jtxn9G7QuQT/D9CD4Q0Vv3
	 caAq5BgsRucqiq1dH23DuvAR4diXxjfOaXxMP+J2ynWq7rDw8be8g4OOnmFWWpWZXUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
	b=et+YxMdj68pT0tQlEqKKf3clCaQD39c0XQ4c15vWfz+10GGZQ/gMwffgBASyJutGZi+D
	 1kNEnXXOGx/qsh9ndoxk47OPAPeUwogu1SMvjhlCBcFMhUxn3FjhA2ee6zPfrV+QCE8fy
	 5XgJMORGXbTtyLXkwpe/2frtbOX5x5pVMDxk71ef4tsayAKiiH/aSth4xtTMVMPWex19i
	 Wgv/a4qvDc25pVO2uFWELvmTPWu9W1Z4AlPsVyRwa5fIoIjwgiP674pIG2dwAQvNEPAXu
	 szgkgOaK7jbhcttKMT9kgmhIbC8H2MW0ykHn7GmYRMRYnFM275z7VEcLF5SRlI0r1fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MaYfUrSx;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDE9606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 23:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EDE9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MaYfUrSx
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab1a37faaeso2240341fa.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793834178; x=1794438978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
        b=MaYfUrSxNAlGHW/moCDpL5dx1KkBp8SvB1mgsR5RSl3YCfz5pCNFJbBf95jzougjqY
         3K4uhPqKWhwHat31Ew6snmPNkN226ndz+bHT3x4mViR/RCa0pNpli+Sfj6yN+SeiNjYK
         lpY2CwrLM3kleG8LY9Qehd92WyD0u4NVaFktuJaXrf9FWYkRkUAE9P2A/W5lM95uAEFi
         hrH8ohl5VS2MRP5wz7D6Jq2bWrtcU0u0+xfkSKTFALPKSsH0aZK2BwRVMt2XPQJw8vor
         9icmWQSGsHKjuzumqm+SnEE+qUUbtVXw96HJ+WRwpmlQahi+iSWSCXss5UQ0zNKRhFST
         +3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834178; x=1794438978;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
        b=fbvBXF9EGaQ9Qo/hmOb3HYDytX9GHhcIJ1zOsSaFfvB0onfDgak28WrSq3o57d8pTY
         ntWg7q2u/WGD+sX3mIOSIy275C7HObiLHA5Iye2Ligb0BUzgI8yDhig4XZm3s51xKkLl
         gmP8ToJn8yptNsrd9jyBfRJp6qsl1LK4FLIXwdkV02W1jn4qRoXHtLzpf08pajJDXDAq
         4A80efjvElM4Xb6UWBYkRspD+QFJ/kSEcR+FJimwEK+paILH9sqnnFoFVCP5fqhW8Ha5
         O31V3Sw3E5QH36Ocn64UWPTrCUF4cLoVcKHpXM/WrP+nRFB4B4nvwkFIz5ZIJ9G8KuPP
         DkWA==
X-Forwarded-Encrypted: i=1; AKwUvBzw8Gxs9c64gmn4LSnqIR1Aa2NvC22jC+Ya4SvE4rhaBMdONfUJ89vK12hsKCLBDvRlzwboJF5bwYBI@vger.kernel.org
X-Gm-Message-State: APuU4Z9RYjvxKdjyMx6W2Dz2WcsFQ6py0QX0rHFVAJFmPiY/lEs9NRUU
	APYh+c4xonBlicT2T/mMcH5A+5HnkxsD5D2znEdJb29n5mCHSLRw/m0bhwg1hm5rc1cTMZSbpmZ
	iOI4wxUM=
X-Gm-Gg: AYBFou2bXaRNDOK/ZNWJcdidRhGnwaWm2IvbNgSZ1/csonflydHeNpOla+EsCVR3/eR
	DsrHVuMkvMZ2Mq5Oi4aq0EyD8IoXSIcYB9esZ6neZFni+x+uUnGFGNC3J39LluZTGOaKBS/aome
	w1jjKFeDytl4x9YV0QSZS0oujrQi/Z3UflZwkB/X3Q5aK0szM+IpJSYfm2hztSGjApropRMTXTx
	NS8UKotPK9i11MkjzKUvkrUTtr98P2UccCrnNbRn7yX5fxAtZrx4E/H5l2wT9esPMUmss6Ahg3X
	iSje9LD2f+5NNlaIa9dhPb5pNGjVJDusmOzDCR0r74g8XWIPDRAgMxnu7J5mPPWctm2kO4gh804
	BBDnsJjN/q1Cvj+CTjodgdOCcnB5sxjDSdvuuSC25DQmjaPvW8DEGLkZGlMEglcA1bJBeGfSkVa
	nGqSe6GX8vLvjpgL3tcpD/G3OJQ2LgVVLNbtuncoBS0pYcxU8xt1rpkl5N+fqCFsgnB9/QGikEt
	qG+9Up+Hr6isIatqI4txWaJ8M/bln6+qQ7XFfCyPp2ldFeduGOJGzC4weBdQuN8VIki8YnT0EvK
	iEqLAWx18HOxTmnqpCaWYkuC4RzJODc0tEr7uI4WIZfrjFVQZxID821teUtYwVjpx8Vqt/I5SVj
	C3NfotA==
X-Received: by 2002:a05:6512:39d1:b0:5bf:d00a:b6c0 with SMTP id 2adb3069b0e04-5bfd95510cdmr7238038e87.3.1793834177876;
        Wed, 04 Nov 2026 15:16:17 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38de44bsm580359e87.84.2026.11.04.15.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:16:17 -0800 (PST)
Message-ID: <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
Date: Thu, 5 Nov 2026 01:16:16 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 22:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> instances, with 42 clocks, 12 interrupts, eight IOMMU streams, four
> interconnect paths and three power domains.
> 
> SM8150 has a different register layout, clock tree and power domain
> topology from SM8250, so describe it in a dedicated schema instead of
> using qcom,sm8250-camss as a fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/media/qcom,sm8150-camss.yaml          | 477 +++++++++++++++++++++
>   1 file changed, 477 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 000000000000..a65067352b58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,477 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8150-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8150 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Andrew Gigena <mail@andrewgigena.dev>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-camss
> +
> +  clocks:
> +    minItems: 42
> +    maxItems: 42
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: camnoc_axi_src
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy3_timer_src

Please switch to the new model of describing and exploiting
the stand-alone CSI2 PHY devices.

Any CAMSS drivers based on the legacy description of CSIPHYs
should not be accepted into the upstream.

-- 
Best wishes,
Vladimir
