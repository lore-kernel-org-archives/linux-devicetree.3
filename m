Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED4D37F8A5
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 04:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781323812; cv=none; b=MJi87qDmuv7aXNUa9gufhURga02yG3EgsWDJX2V7i+jHIVuwegJEJTlzPVfGNUurdhN1c9B0uyGv6yFC9CYL6M8cL5X+dwwEFZRp+vSeNgryJPSqd6kTv/+40e7U70O9+FemEhFhG3w+AVyO2H4KdAK960BkzZ6AKSmziKkQ1CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781323812; c=relaxed/simple;
	bh=d+CuOuf3ybPVo31Duy+EpOGsQqxm8eNmSXH5RxEr1bY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/nR5iWa/AuO6+MWYwDRY6ezm2Dl23niZH6nUVK5Ny81y9CdtRlVXnutATiihXFp3akvD1M8dkLKi9LCSv1Jim/u2vhSrVgI7h70M4cjrY5t4R/6pWrR+6BbaH7OVfGZrrWoPOoMQUXiKBLwWPTptrwNa5fBM2feH06dc0Ar4QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjX4XkRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXBEytuf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjX4XkRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXBEytuf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3P0KF1396586
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 04:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=; b=EjX4XkRZpygOmsXy
	GVaiA5BwdOv/Yb3hrVzwo6/qftVVOstDIcAxtEZgO+E6ImFeQ+bzCsFcfTccR6AV
	kHimL7q90XgU6hSIS5504E9F96Z8mGjWkvrsDI+3BgZdXNC38eNugMbNzH+BSRSw
	e/Xt5yLFD16MFYPFBWIBifvMhxWx6VuMBVe1jvY8SIV3WI33lCE8RwF2ER0/lFhX
	2s4krj6Sno4qlFdEvF+nUNz0wpzBdaY0KrhVSCAT7m5J3YoyYU5sgQkU30lACJWS
	tjLeDzFbaV3WB9e/tV8PvwndhzNmm1ARSDRGQfsBFBPa1kONhe2RwHWAK+UZoqi+
	e90dQA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wr2fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 04:10:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422ca754d8so1242639b3a.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 21:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781323810; x=1781928610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=;
        b=QXBEytufWuzTfB4cD/RXyRcDF+MBHUjsNNMLzEBnLHKsB80nwDFufN/J4V0YXrEOpB
         KSTQ1hYnz1vAtAfzCQWnni8e9Uj5bbfeLZDcBONCVos2Q1+Td++AvoOC8UUW/mjAmf2L
         CWSFbTBQ0pUTDAWNSow+NLbw7s2dvi56WzGZgZpQ9WG7hfMdtV99DSOR2HP569kk4MoE
         1DVOPFUZD3LLOXJPZGCrS7DZxJF8ra3QF196B/Fi3F8okY3gp6fW/dG1TW//U9Q27ngz
         shkTR1RHYs2Dw2il6o5W3OSc3Gv6MnvjeE8F29N62I+i0V6T+jy+l47rW77Q+X8akJpI
         9d4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781323810; x=1781928610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=;
        b=XGLfJJWkvz6ktp0/C0pQ669i+7cf7YuZU3UhjlZcKuiC2R3xB6N9DuRU1ckosiXmsR
         5JAtbhzNbQH4x0ZnFYqE95viTdRO3sbjUaShz8+kpeMkcNjwbY463c3Ig7OaMVtswMwn
         tFeY2ylqFUikVZx5AwBgzNsgKd/sOMYGRiQqmYDmQJSkquWKIGq2267ZRF3QAWI7OSDr
         da//pwMXKt0Dyg96tLZi7zCUeAKRvtug1a6EbX1SfavMytnZypm1HGXY+GiW5JW1pI3O
         fPG7nxSdTFfKvv/9+JASZqvI8mrCmyFZVw05FJTbXYHAEdr2HVJrgB/LeoBYme00Kf1Q
         /ZZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hxyEhyPRFmcbYZh2BiYjJPUMWiE+Pm2UuUjzUenTcrQkHtmJJTstdF2kQCDxd8i7GWOEF5W8+2ZSd@vger.kernel.org
X-Gm-Message-State: AOJu0YxfpSegJ/itXNBWg2fUbOQeyqXNBUaFHiwKMpihpEJ7FLiLjdjp
	+P330/xIPJA2ERrNbHKm5hSZUg2WoKcWmUAnkk2sdNul0xDtcrU338u4D+WBwL8sPK3CcRmzH9j
	rUmoTFWsjS+yG7cuQRtJHUVLNIW86+5WqFrdJIi/tPJlJDKq/rUq/AJP00eyu8YsU
X-Gm-Gg: Acq92OFQB9qD53ofCeMLoJzJdkGDS9SniYtWClGrFHnL7iqBjhZi8fcHXCg0NZ8WYiX
	ytSOzqCfVH9bRmFMjfGVS1xuaicx2wiiXqBIz6RywJDVs/7PwSci0bnLtUVhj4iGj1oWZWbZWsZ
	NmFJvVbCQzTleI84hzh1jB4HAjZ1M2elYBxGoJvX/K87z6SFzMkaTI/CV8cZP2PFMNh/XreewWc
	0gHfJh8eRgPN7NagMmtTR8WQQCDKZQlfSyBp7ccBFfBkFvfzQovwdByrMDEfuM+DkqnaiSFGvdH
	OC+ZUG3dNCPXyxZFnnlmJW8x1HD/EYvQbzoCsetXzVkwSU5IVEF1s/geBZymAjVC+Rt4nTGG7R0
	cX/FrDoq7lOV2GzN8dMFMqlC/QAsH4HsmEAuNCAt+iL624gTaJcI=
X-Received: by 2002:a05:6a00:1483:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8434ce95f96mr5902244b3a.10.1781323809815;
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1483:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8434ce95f96mr5902220b3a.10.1781323809366;
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm4480992b3a.34.2026.06.12.21.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
Message-ID: <fbb00150-e3bd-45b8-a87a-100ecd235a46@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 09:40:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
 <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SZYxmv6c-bIUDDC7fChCFxQZ0rm4IBd-
X-Proofpoint-GUID: SZYxmv6c-bIUDDC7fChCFxQZ0rm4IBd-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDAzNyBTYWx0ZWRfXxIN87vHkLz9X
 alAZ1p/cRy/1xfPxGiBL879uEj8vbFp6SSTavvg96P3hUO3I/O14Bz1OUM7wmich29pIwgkTfyw
 TAZAdzDdCrrbOzHRZrDaZgNSALCP62E=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2cd822 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HRvYZQSnNB20PN4mEw4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDAzNyBTYWx0ZWRfX4IIw9839iU43
 kZcqp3c2XtjJ7BGD5cCEkjOkW3sHvjbybK7b9E2n050hdfFKSxZgjO8KqmjUc8YGgDugFsl5ZXW
 Z8Kzz+lzPFGlMmjo8AdNPSGhEDp3I6lduoo6gZ1uU5K1vyaKtLIQMghSfGchhF4avJgiyu48toT
 ff9a1KAUEsCLR08SQcQQegZxe3LuOvPJlkae4dDjyKCrGel+4loXjyZ2QxjmSrGmj7Z1M+aJpiX
 NMpQsRLGKIBHUJnXMhQqH/fG8k9N9nTNmHknrlN5THeNwjdILOTVpsuVjsNLY+3JAWCEMmajBO4
 hQvGAfPOdXs2JuRPlnp9ADH5NirHZX8T/MDBYsq2V58AkdnTgNppBYvfUAJRomjwtd66jsrBeor
 nHB7nCPlC4Mr75aNCYdHTS0O1vFP7aC8BQMODI6k0R8S1wvQ3beffvyZxlg0inEjGbXLev1UYj8
 ZSp7gXwsxsbT5fL/VKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130037



On 12-06-2026 13:26, Vladimir Zapolskiy wrote:
>> +            iommus = <&apps_smmu 0x400 0x0>;
>> +            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> 
> Please add an empty line between the properties above.
> 
>> + 
ACK

--
Regards,
Nihal Kumar Gupta
