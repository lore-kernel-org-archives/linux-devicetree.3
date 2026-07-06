Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF802BE7A7
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345719; cv=none; b=dPytYR6NfMyWj4NMdasmleTfezag43jsCtnl8ARZwNGmEGKHshhi/3k7eCwO9NEcYQlmmWdPvlDSL00cRQxQpmOuzPtz0mCA8wFHmKWJlkIUsy6PPHoCr83UJtiojrI+49OCMIFv1ie5R6YMkCAVRaP64AM7HVq8Q0c2q7aqw98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345719; c=relaxed/simple;
	bh=ibnrBHSTV6YrMSb8FOXrZzy2nwQTPbRf2kWs/xG2sQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItfUeD0dGEyBZ4S/QJOkiKHXi5Z/UVz6AeT7xOD654dFnc3Y6dJkVLF3twoOZ+vjj9mdV15IBVqMR8qXH0pKtKJWZoisppMEqWS5mv2bYtXQlhqrpVw4qdQdejxqJEYTtzOjxc/lXthKxt0RCo1qDHWQG7XM8Wb2lub0w8RJpIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5s7ClcH; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5s7ClcH"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso4654277a12.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783345716; x=1783950516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjiqVTsfvn8YqAihbqyvY/iUlGY8yjdbz0rz3LGCJoU=;
        b=J5s7ClcH8FOAgOBNzlOnO1vROhK+l2CJqQTI+kBN9srZOgL7SJPpW0BrlCqn2ekbut
         wilQ8Kl8rzQklVb6lVxYjH9C+kKfLTLDTUeqiLs6XWuBnts4IWUnFyki3iw+DE1YhpHy
         tOiRGxIEmdL76U14bsH+uGDKp9b7+i1mxj/WRNrdLMrv/HTBu+GcQon9Sk2SJLfmv8Ms
         fZRBHDRpXHJDtj9zYVaHFCwXWfXBzOWIuAEbTHM9yawOshBE/tNMrl08WfUs23mK/BzG
         nO9o0KO6pQAEToSI7AI1FO7ocmRmE4kpuOcJBGxt6XiIRC+5GCDqLY5E20iucvPFqKhI
         q9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345716; x=1783950516;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjiqVTsfvn8YqAihbqyvY/iUlGY8yjdbz0rz3LGCJoU=;
        b=p+X/tZPjKmjgRcpbwfy57mBIEzPMJkKkrAFeob8zMBcEuzKeA5dk25CeMUC/qft05o
         ftJyhKmEtXwpPFLb6KvvzOoSMa4macB6hPemlGFfKoioaWxF3zFIXs6Np7FLt8vboEZ6
         XH1oUav5g9YicggSuRKHmLAEwsZdCRdi/cc8KGi1iQdBXH9fBfd/knRk9nDUR40muXR+
         H0r1E+ec0LucGJyiTF7oiVkIuOp71VaXa7ZhrWqKLZ6pVsIZ+5fzgRc2Ip83/1bFZQM1
         fsh2IdF70K8Y4+cWoka46zCCrurVl/zx8qGyPHFOZYqriHY3X+KscGDMgaHcb0XZU8Hb
         G6/A==
X-Forwarded-Encrypted: i=1; AHgh+RoGPn5gQ/dOHSqEPpCAdCdrwxvZAVSYScvh5sSoqwKVGVmsboYLI4hHbnCBeylSDqiH7HphL23VwGXr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2KhepcI/v/dOHBqy+amtwc+WqF488MXSp1a5xmPI6tKRFOFlr
	tRb25STIKV3cb+Dzk+Vn0HHdhvTPsZZH92bTADSz9QryI+VEOuXwJNeBFhBeK5waPp0=
X-Gm-Gg: AfdE7cm1iPyfyLGfLciWtgMDSC4E4aKMx46clEBL/DfM+tY6UH8D4Jk38qYqqObI4SQ
	Mhgah9v7n4MKogCf3sjDE1vU8XgmGV3asCFcll0dfpTDIHiBNjNcHE7venzVksztnBV55cn9LMG
	/rDffQ9fACyjDgLC3bj/YGjcNphWdC0AKGWiRZyEc3YsR4Jb6QulLHAh8cKa5TgXj/qf7QgJujo
	liUZuBv5wHw9VigrLr7YoM0GWuCm994YUB3GS1AQT5CWnzrgkV6nbv82Zvy2YnFO53M/XKyEQrj
	O3F5JDj+q+qGtc63VVBuulWM0gIjam6ZA1XAXpuy1JlCl4yJgxiyVHPHc7oJFx78PwpuF2NW156
	holYp/yHhixr4YHuxpe2np+/pLeONmkS39pTJgeUpq1UQdTuqDmpfjl++9ru7nEy+ufNfvdiuO3
	b5sidHX5rTyY0uuO5iojMDzlkibw==
X-Received: by 2002:a17:906:26d1:b0:c12:5192:23ed with SMTP id a640c23a62f3a-c15a69d9d8dmr25824666b.56.1783345715677;
        Mon, 06 Jul 2026 06:48:35 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f38f3sm771328066b.57.2026.07.06.06.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:48:35 -0700 (PDT)
Message-ID: <dea84207-27da-4ae8-a3d2-1c37aed0096b@linaro.org>
Date: Mon, 6 Jul 2026 14:48:33 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
 kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <ei7QBvzi3ppMJstCkVu_P-NrpZAVnEk65hBizRPRTzaBJ_NVEI0LobKCwCcLTPbWPPA5GAtO9w7sl7j10Cxrbg==@protonmail.internalid>
 <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 13:31, Rakesh Kota wrote:
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector.
> 
> Add pm4125_data using the abstraction introduced for PM8150B, along with
> dedicated voltage-selector ops and the pm4125_vboost_table covering the
> four supported boost voltages: 4.25 V, 4.5 V, 4.75 V, and 5.0 V.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
