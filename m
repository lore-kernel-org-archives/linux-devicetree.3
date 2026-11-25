Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616481;
	b=BVxdQzbpRxewWIPlgIltvr6LS46XDDBlI0++OaFoctGmjLl/P34u5oL81ZCoUcGpSUha
	 2o75f+kdAPWLi8LhTgK5L0Ouly5p20JI+ayQGt1FOOuIrAY5zuRsL9EniIKjD+y8soedz
	 MQ2YWQv3bmXBN17fhJ5aa7x0XtULZW/q7Fjrfp3W8UH07Iq/FywlJOba8K3mZhEJzMlXF
	 RiFayEqlCPXbIzgyXWEMDYAPcno3EQ2YkO5l+EtBhrKlRVUfjMqkH7Kx10BT9uqjy4+9/
	 1007ydUPzhSSRnTAIi+QK1YCIsOg5A7YP+5dzLVRAjirs3V0bumxQX4v8qgndJKn4Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
	b=K9P3rB1t43nOQvaJ1ehFwo2eYPWRAWWaVNR7AQScJCUzlW9OBF118/sA7GlrWxnXh/iN
	 n26DypSOJHvaOtqTqakjyQJ8jy/YXmmjgjbq1VCq+eXIr59zdpxdDixjYMGRDHns0Juvm
	 HwNBE+Jn1GPAF2XAAj8Cn3c+VtNzsXZKYing0XXLoWUxK8gcUaJfSFmSJvwnav1psnNv1
	 2bq+6vwpC3HkJFv6gRDyHb5u279wy6wfsCs9VOH3/IW9Oy1+azaQHktt5DbxNK32jRm1m
	 jTueIZuP7ZIelSjT8eozGTMKRZDvTHPJrk5mrTL/L32FguDmcM/asUAoC0eTaDd06NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZP4cszJX;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B96F606A33C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B96F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZP4cszJX
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so4149711fa.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616479; x=1796221279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
        b=ZP4cszJXmUZlMGJtbZ8PlmAsjUZ6rzmMVf8KPM3mYZ3Ns9WTxIMJQFQ7gtv10yYVG4
         0CgaUMFucTfAEE1Z4x4SfeIuKqa+CwB0FrnIcJXHvuoyNam+aUvUnr0KvwPsaVr6jMon
         Vlj2PwIRSIOSXGX8j4rWov2YJUxkCnEz5ccDZGiL5SIXVD0qq8U0mX2CFCaGlMRXYiGn
         FsxDARH41XcEj/7c1tAsIlU4D+CpX0lyDuht4nfDjc+6TDwfa1eAazA+yBsoEIMjPdNg
         bQAZYuKxqdpjQJpGRMg5n/uJIGq3fKGuH5GgqD7KJEyg9c/meRTlLh+beVP0lZQ+8LC8
         fzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616479; x=1796221279;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
        b=K4CR5yEBVjIF+QL2u7pIQDDuzAfVfPc953bGNqQodsmsLcyrtwpP3V0UI7FE1cVX9r
         7cF48RiKa8aZUHG3FbqeJUSAJ9dvMPVWJ3uPO5l3ON5ZRK2RHRGB7nVAp6xncqXkL7cB
         W1a1zVVIJ7qupc+awlPjQbNCs4g5w7a9+m3lbmabfpLfcg5yiYzFs+MSUfoPwAOTk02M
         FfoqpiKXmdtsIHgT81gMSYpwH8EZWxE3XJ7o68k7Sb3vxawbd0LjrCVLYlUX+EX3CERc
         DtxWC/YUgMHxCE0wTDPc68Vlpr/yaIc9m9mZWdiXMj7gsUe2lwFGKHNij73ZCUN4mN8a
         iuDQ==
X-Forwarded-Encrypted: i=1; AL+hErHTmpNG04n8ubTLn9oqv6MAUEkENCrRzK+nvTdEqGG3TVymA2Om2YuL/4oZACgiBqu1GG6l7JMhdoNe@vger.kernel.org
X-Gm-Message-State: APuU4Z9C8wlYqwDyru/Bn/Mbm4G2F+TIim9sYbQi91+39D3oMi0CxdbE
	+1BAorRyT+SF6KyqLztW2PzUGYEhgE9XO047n1aDPYOsq4rJEOGXFjE/L0FbzJsQrOU=
X-Gm-Gg: AZFdTZf8E74j6xVPE3+vEj1CMEFQOpJxvcYBCFoZ2v8lqEUDBqiXWlaZZuyuvuIh2w0
	JaXR1ZMsnqY5KEaGICJtTgmPqEylqCedo8DPAks5D0UlvE/+a0wukM+FRsHQPrzJkpqNLYCDguZ
	EMwgGd9f5E1blx1EXeVwhcblOEnY+QnTsZYo9yYxSAIWrEo1IYBBTvGz1ctrC7kTYvq2RjxbOph
	rsq52Egceirb69e5jYXjaTOZWEGWxtK/C1aP9LW3bOQu4aDbMyKX4zr7RUWsFHcWe+fvQlQ2fqw
	UoGCnJcWLBJdCIJaRjSH18pCYoeOaYJxhjJfGrgShH+r97IaRRMa0oHhzThxcIFxICZ1HlwX+dt
	1L3IoQmth5AZjjG+fNuMBKEXKBfig6kW3qnpnJrpTU86wfvf7xIrMpTOfC4czFdyU+U33etKD3F
	Lz2hrlSDyKf2T4t0xHDJIDzeI1REUut32PVRh20ctbdSk6XvWmqUT/Hw/e9ONekOAgQghMqXhyv
	hlhKz2oFt45oiomsWyxpv7eHJh8+4NpQ5yndj0vzLVzrJbhQE+Cdx4njX/c0eqIdbPjxTiEfWD9
	rRcE7kxfKsjkWkejlitbJZ/mMhjhZUmXBPVJY7+jy8fHFY1AgfatehMIyUjbcXIcm2X/Jy/wN8c
	tu7mk56SgoCUGNsQS73CsxIpiTJte
X-Received: by 2002:a05:6512:31d5:b0:5bf:f87e:3d25 with SMTP id 2adb3069b0e04-5c1bc6b22b3mr6618657e87.2.1795616479393;
        Wed, 25 Nov 2026 06:21:19 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0171c7sm4541303e87.31.2026.11.25.06.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:21:18 -0800 (PST)
Message-ID: <aa0a99e8-1c49-4417-9a1a-8653cfb3585f@linaro.org>
Date: Wed, 25 Nov 2026 16:21:18 +0200
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur integrates the same CSI2 PHY IP as X1E80100. Add
> qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -16,7 +16,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    oneOf:
> +      - const: qcom,x1e80100-csi2-phy
> +      - items:
> +          - const: qcom,glymur-csi2-phy
> +          - const: qcom,x1e80100-csi2-phy
>   
>     reg:
>       maxItems: 1
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
