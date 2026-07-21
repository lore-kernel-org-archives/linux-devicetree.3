Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1776F3C1400
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673619; cv=none; b=StYz8rkTZIvwkjhNYtqfGgR3RBiAr79CjuzKUDZ1cwF/p4cPXzH3YMKRyJWShG6nEha1NnDFg0MB7Y99YEXj1tcTFn8hGyY7g+GIDlW6al0dPOmUZVHXG52kLr4OkS6oqTHJzSuWz1aZC93O+I4Y2IbQhvjfaHYp4FXAk5eXk4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673619; c=relaxed/simple;
	bh=86+FFVf2RJXCDge481xc40j9yQcZbXPzCSDbKxjMSQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkLZV/2bur1WSNk82u507yT9bcoo6LeSLVbtev2FMQxiwU6LbEVb7sqA7WVJ6rBhgOm/m9oSVCHsxuess+xGkvZcc4PUv8GT3gz+H3SuG/8jpYlnrqHC6RD5MegJHJucZAcS5zF4kxfgE+6XJ+usp7Sg2tZqxiKUxBzEyw4v6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVqIG5mP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVqIG5mP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47de0093c42so6838529f8f.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784673616; x=1785278416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RskP6QT1dpaQK7qfXd+bxkNm79lnYJ2LdMNrXnjHeIs=;
        b=IVqIG5mPge4kyxaEU3iL1xqOKSXgvrOTGk9GR5/koVoRSn8/lrEYcwdbaXEZD6d9y/
         ZpCsMjousZtMAJ5Kg78w0IWAbM4++jsnzlVTir75PCDAfkGh9sjZ8BiF0a7vaIKd0fVq
         RJmmWUjW6LUvuZDxw3nEtU4PLupoW4jXrX8bmw+jNXoRVFxlKnp5ieSGInXX4/k4UxEk
         ZKdb/0lRUHvJFDvsbjaNCAy8mMp73gP1SZxWaUqZq8+fKWY9KC2ogN/gtj0mdkovNpz8
         el/eMIkw6u2/N0rB6TsOGTW1NkHEW8XogucJq8sMv6EYbgTw0/thk+0sLWZn766mUvaT
         vwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673616; x=1785278416;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RskP6QT1dpaQK7qfXd+bxkNm79lnYJ2LdMNrXnjHeIs=;
        b=MWqS8fENZ0YEEA00Q8Q4GYTHIFpusiSPIIDobzUk7NfMPHLcrA1ogp5U8M31rmQbAV
         SNMZjep1cWX3c2zpuVcoX/SNLkLExsiNSIwMTMK9QAIF5kHAfJF0BAZmo+IdFdVus2KI
         towsN+OO85RoxLuOA2XhMBirvumIqNXNl6319Pl++xEqC4RoS46zg5WcujsaX8m6it4h
         T77Vd3uTdp3whnEkaY9S7+i8tJXGQxv1JtgRDpoU9c6ieo/ahg5EjpLwkLg2P9EPE5pt
         aIopy4MbGPkmwyzxb+AWvvFLAffjJiGwqXNZozEWY7PEAWhRLQDPk6qod/D8gn9y2t0I
         6pRQ==
X-Forwarded-Encrypted: i=1; AHgh+RptVwULO2QCsiuJvz5t4XOYFsEPNdoTs+IDtHm1AuAG/W32NMuOH69E4jPrkOv+MHjwJjUjB6wlvXPv@vger.kernel.org
X-Gm-Message-State: AOJu0YwymvqMa3SRJrOipzkuG7+0ZKBLo3lIkxH5dNIBS8rskftemVE8
	xGNV1KNfIbwb55zXejorHcUXdfBE4QAfmt1K7kCFktMGrL8IhBtgEu8L3jQKLtKpCXM=
X-Gm-Gg: AR+sD10EESPxW/nNYYYNZfyVfGPgRBXaac0lmT8qGcXivJVtjjNVP/uGUT2emE8+mX+
	FRGqi1g4tBt46x2WZV1vWZJ57j06BdxuWJdZMDsfXjKYIiWU+OTnfdl8zyGbCvL1DT2RtZru6nD
	UGNTSk85+VmJAObYOSATD/bqzQAaIp3ce0w59GGOypBGjBlxQ/pSZ2694NPVuUZGJsacXpo0IK8
	W3shd6i/o0QIBSrDe+CoES9SHUWI0Cq6r+CkrjMfyPD4blzFYdQdJuyPmxm3FoFGH3QziwfiztM
	9yqJ5Uvo3/zeniDc1yutmJC7cew6hhvGsNilIut7kmnQzU3S6o5YR+aXwR+u4uPsSSedJN8bZHc
	DIyhP628pnmUSvWjBGZQVGjGLylyzmsTX32Y9dHMwRO1aWxldSlWLB0qET2aGevC7HPjP0serh0
	/yVCq8I8L/Ss6OyuOpXwdcX3beMw==
X-Received: by 2002:a05:6000:712:b0:47f:6f2c:7303 with SMTP id ffacd0b85a97d-47f6f2c73c3mr17096854f8f.33.1784673616312;
        Tue, 21 Jul 2026 15:40:16 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm249830f8f.11.2026.07.21.15.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:40:15 -0700 (PDT)
Message-ID: <b14b7ead-d063-42d4-92cb-1299ef0a81e8@linaro.org>
Date: Tue, 21 Jul 2026 23:40:14 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 05:50, Hangxiang Ma wrote:
> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 880fe602945c..7943049834f9 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -16,7 +16,9 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    enum:
> +      - qcom,kaanapali-csi2-phy
> +      - qcom,x1e80100-csi2-phy
>   
>     reg:
>       maxItems: 1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
