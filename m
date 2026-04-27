Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C6637D110
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327056; cv=none; b=YZ+1d1S0FyzoKixERnAq2ePCHY5PJx1kjxThxDjQAGOte4j8gn/0OfuvFJM5BZ9/ugDW03C+1OV3tPAmhz87ab5vcGRZWW2oakRZd5tBSVl3JVcXntJXDz3vxr7hDGG7DdgbeY+z9Ea5vrkdl7fmL22+8FImod7eS793XouzJ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327056; c=relaxed/simple;
	bh=OFgtGCn1mfUaoCP8LhdAyM8uQwb3Te8gLBE/Ti+VRMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6ZDWjg1reI9mXyEtZEYPnxsR+7IcGJaQqqQtZxsNmSfAvnECfyZgOg5fCdbnA+/NcnLhbiguZLoY6MQa6ODWVyhMyag/KFfTdjPxIB8aa7WO/zfBiDm44F8d6RKP469kyKwrCftTmX9ZRSQcOgpG0/DeUVuBja3CDRVSMmN4/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMyQxbao; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMyQxbao"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so73546615e9.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777327053; x=1777931853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kV+WIZsj9AmJtT9rTaHxlweLR0VMyPyAnS2ki5QOUJg=;
        b=sMyQxbaoFGJX/irParUdWhOOocCeUXvxFueNP6tsUkKMDA09z0L27fpY339j5ZCWOJ
         eVzCjDzD7vnD2t2iCuSoLzQnv8USvbSt3L5MxtOEvVMMsKRrHEN7CIJ7Ulxt3yKHD9rU
         ztw18e5W+kSqQHS/HYUdoXTEBfEYL5cNNw50k/MGVAFE2645Bh6ZHm8MLFtuOZPFXKs2
         K8cp10m4Ix5aYnNASAg3qCMpay1gY4706zIWd6QX752KDNbqy1i0ZvFqGRtaPrll93QD
         gr9BHek6wJpEQzL+mHVhiOaVsUl6npQ8cQJpWbOeGOtPrZG87br/DgVk19I4KrDSDGtY
         eTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327053; x=1777931853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV+WIZsj9AmJtT9rTaHxlweLR0VMyPyAnS2ki5QOUJg=;
        b=CeZmBWtTdC73kX3ddD8cMONR4YqkBS932B7qPYu19rYSmfqa2WsPJtsIpeBE9CE75J
         DK69WUt6tM1LRZXsPGo+MwVdXXTi2SNWR3eFEchNrjfAbeR/kui2tiDGpsK+Wa3XNiU0
         M4w8A0tudhtaeJsThN0PD3A/J75A5KHwWddYRLfSVQV+Bx0RWBXOmxViYv5E8fNiMbNa
         0ZGJtp0eOdD/W4S40pqD5HwXk4IfbM5ExB4fFwg4mNhBHyW450YkSDa7VSmIuf5xN3SK
         RYIsLBOC0D3zvAQEMn2k2BvnIItyIYrt8cWgCCWUOS5bWsKpMH2M9m787VEDU70z7V/4
         +oyA==
X-Forwarded-Encrypted: i=1; AFNElJ9huNGdvT4xkk89VnK+jZMkrmIgkDZBdvLfbHV8iQ5xVr3oYLXVoqQfEH+Eao32nDIo9b4xJf9BXrlv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ifrg1czICrH19H3bVD6PoB/v++KXoTgPReIlLjGhWgI/6PwE
	s5HDqAetiEJSy19Z6Y1znsmdzdNQd12a+gCMbl2uWp3ZpjJCosCQZEPChNoz+Wi11hk=
X-Gm-Gg: AeBDietjwxHEawaenuN6q/FEFmT8fJhnAapABTh3jEYDUPEOVw8DGSRXu6T8/AS+9lV
	BJxXirtmo+9KVIu2xkKm69TPveb30jQjrMgtbkTn7F957BM63E2Ww/BhYeRGuYdwDXGy4a3sMOq
	sMfTEMJgVmBmuLjmggXbrGcJN2H2tlocRUP7aWdxsky3GJoC648mU6o2N8+9UdEGXMnZ/5Ssy3J
	y9wWhZ48uglwmQUza+9Og4mjJPO/kZmFjJ/xXx2CvGHO6tZEU80/moy8ThIzUKmPSo3U81DipTi
	BlcWZ8NjOQ6fJOxrNs/JCHcMVjhUzNKGPhfJ9qc0u22u0SxUsrIbKJCqe7wmhjLS0nI1ynFWrUU
	HwzfqoYDAYHoa4ZI0rcOJKS0m6+eMNABTYVo8wP5WKdmLF/cd7zjwCpYIDIBZT0hyJHCSHNlUM4
	JoxucP6O6j/XebPWMxXTUP74JUyHcUUX+FZ5+Tr0nibgeVCL0VpoCeZA==
X-Received: by 2002:a05:600c:4f0b:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48a77ae6477mr5384895e9.9.1777327052826;
        Mon, 27 Apr 2026 14:57:32 -0700 (PDT)
Received: from [10.156.67.45] ([89.101.53.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77609a82sm3993585e9.36.2026.04.27.14.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:57:32 -0700 (PDT)
Message-ID: <1b914585-4c27-4f4d-8264-181340c27791@linaro.org>
Date: Mon, 27 Apr 2026 22:57:26 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/04/2026 13:43, Loic Poulain wrote:
> +/**
> + * struct camss_params_wb_gain - White Balance gains
> + *
> + * @header:   generic block header; @header.type = CAMSS_PARAMS_WB_GAIN
> + * @g_gain:   green channel gain (15uQ10)
> + * @b_gain:   blue channel gain (15uQ10)
> + * @r_gain:   red channel gain (15uQ10)
> + */
> +struct camss_params_wb_gain {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 g_gain;
> +	__u16 b_gain;
> +	__u16 r_gain;
> +	__u16 _pad;
> +} __attribute__((aligned(8)));

So I published a comprehensive list of these structures a few days ago.

https://lore.kernel.org/linux-media/20260426000418.1158716-1-bryan.odonoghue@linaro.org/T/#u

See:

struct camss_params_wb_gain - White balance gains and offsets

The ICP/HFI structures - at least for the stats I believe are how 
hardware writes data to memory.

OTOH on the way in, the params ought to be pretty uniform as again 
HFI/ICP needs to take that representation and either

- Hand it over to CDM or
- Pass it over HFI so that ICP can hand it over to CDM

The ordering and precision is a resolved thing. I'm ~ sure OPE must 
write and consume in the same format.

---
bod
