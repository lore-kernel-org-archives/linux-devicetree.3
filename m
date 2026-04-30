Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7948C377553
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533577; cv=none; b=hc+WaAQsGNrZ68CibQGUvuqIro1Vf6Tegtn5wiMDmePnex4sKEaEhmxJm5sXIzv1EBsRb3FJmULw2slaoUGMhcpy8HcRISk8kk7jJTrdbNHaERSTFSqnO7o0Bq6X7e+rEwjxE66Mh1TfJBFUBOmMFzwJkpSoJD864bymprpRRYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533577; c=relaxed/simple;
	bh=2CZHL0AmzK16VlClqBj66ljG2LuPL+2WV5YuZohxbno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNwHy47xoYYP/9eifGIE1gRREsystLGYXC0kP2WmS40F5Gh3SeHjzg3i43vKyADdkiiOjDexXGsr197Hcp+5KOyDVxZ1L3px3mElDrT1a67IDk3Vsf0t22HvSB7zvylfAXDnvavyUyXiSmwnJkaGzIltEsgww+t+RBxe8sBLEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VbBogj45; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VbBogj45"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so5298595e9.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777533575; x=1778138375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUWvXOwC5Q3RC/87QRqX0hG7frPM9oXSsp9FaQvwQcU=;
        b=VbBogj453qbAxhL3j262p3Ds35RfYL9PfJhhmwRZc5+FjfB+kmPmji9XsdPYn5Nr7g
         zyOfl5oUvGYM3t3pJNRyNetj2r9o5cnE60UOOvYgZa7BxCT9uDCawQ9EPJYPQNteQPb7
         ERT28QCdDSs0SLPuNDGvGgVxbFM998vnd4GjAdwrk4t6QpVptUrklv/8+dnJU86El9b1
         E3I1zp+fWTz9ulAZbOufVUrt9oL1mcCS+xq89HnQujvVP0tsXXeSc8BaOIvDXwnz9tGb
         m3+YDs/81gA//dMhhBcwHNXTfscajFXDXKAE/BmExsN6h31HHjdHOQFFA7g7z04ef9ST
         Y3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533575; x=1778138375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUWvXOwC5Q3RC/87QRqX0hG7frPM9oXSsp9FaQvwQcU=;
        b=Tpd6qTbtmNUxlqUw71IzRvyaITOu7o8jLKF/4JcgpvRw5fzWUl2B8JIsRGvdMSXXK5
         0sjDdtw/28zBgWJ0TAZHu+9hJ52QXxBTczcVTgTaA5o+jC/Ja8SGT2ko6izZw1Q1v6fo
         42hX3buB5BCH5SFw4VV82RQAzyd823rWQPk0+3DvrxnRBmEOJ4673VJs2LQFYWZYY8uq
         7NbxZZFOChiw9AimMzyz69m/6cf3j6dhyJgO8IS7Gpt0wbHfCkVLK2+BjkjcNg43+/tZ
         GFiUYSbZNGKp/dnYThB2cxjSqMA3SMIoYjSQ/SRGW2/goxp4WBQmMgjK4qcrWXFudB+8
         J2xA==
X-Forwarded-Encrypted: i=1; AFNElJ+B/9Sh3uI3pbOyOY/1cuvUgmpKV46yA6O4QEKeC4pcBCXJ9PMOrzmJ2DbmaiJm3zhD5KEAmpEmxYqC@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfXdF9XcQhRsPT5HYz19J24TPxlsOPexCwy4PafpmuDj4tUN7
	VmIiLZij/WmI3ns/8/hy6A0U+oWbOs09XIAfoEp1LRhH+8/btgAy9dEPse34txqx3xs=
X-Gm-Gg: AeBDiesXpwnaisr4SdzsGnL+PJbUonWD/Hosd0wyw3sZPedtCna0ibm8cu8k2Bn2twf
	mraF9viUhaDw54PnFU4jbdfkbwPww4B/Dn1/EVF79q67a0Oj0e4pTfYVI4D4RH356SDUpoHkjus
	BDaESlwy4iwMvFYmOVhO+cYDuh/XVXCjnNLt27Y8ChZ+50k2CljZCma7ooFPLoNakamko8Y9kII
	DVoOm6f/vkHcD3K3CNFA9o+VqE5StY/xE28fm8IKHZJwSlPnJiIIKRwQO3mxwnW36AIsVtfGLo4
	dL6eiEtejZ6pmlIpEqU81FcNxWr6OHpG7QrHCWSNGy/pc1NDrJCbeUpxpFylVQK6fLwHfXPKdKQ
	F9abzBFiqZOZgrX94pv7bg3v+ipfb9Kc0z4i5zqVzQLouCeXmBSGwP+J8Ta9lWDn5La3uIo9v4D
	wMSmtTExO5JuVr+2RYIj5jwZE7X9S8zITkZL1M/JT2oEE2gdu6jv23YY3NBvE=
X-Received: by 2002:a05:600c:81ca:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48a8445eabamr29121285e9.26.1777533574947;
        Thu, 30 Apr 2026 00:19:34 -0700 (PDT)
Received: from [192.168.42.159] ([83.240.169.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b65sm74225145e9.3.2026.04.30.00.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:19:34 -0700 (PDT)
Message-ID: <7aa439cc-02a6-4b80-84be-1358ba8a6d60@linaro.org>
Date: Thu, 30 Apr 2026 08:19:32 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-2-0c3fd1977869@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260429-glymur_camcc-v2-2-0c3fd1977869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2026 15:14, Jagadeesh Kona wrote:
> +/* 1200.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll0_config = {
> +	.l = 0x3e,
> +	.alpha = 0x8000,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8060e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00008408,
> +	.user_ctl_hi_val = 0x00000002,
> +};

Could we start defining these bits intead of stuffing magic numbers ?

I can't imagine a PLL setting is commercially sensitive and even if it is..

There's a difference between someone in the community doing a port of a 
downstream configuration where the bits aren't documented and a vendor 
doing upstreaming where it the vendor has control.

What does 0x0a8060e0 actually mean and - yes its more work but, why 
can't we define those bits and bit-fields ?

---
bod
