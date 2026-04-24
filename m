Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1631E5724
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030491; cv=none; b=kMfFzRjrKdAsYj6Sk4LhnyHGH0wU0V3jNtTv47gl1FTqwuzXwm52oUuRjohzqSHY0616zqZ6vJ/JWo2CFmFiDYwGMw2rvdQXmerM5/rAUiCYgiaeOi8HKM4VkIIFyjirZ5DdRoqMcxZAxdKTqo2Sh09WtII1TrrLfKcH89K8cRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030491; c=relaxed/simple;
	bh=cuCKH6YcmagYwOZiieg6yMey10pmTjCyRaw2ZACHAMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvuUTBllPZZPcgvmyNXhUMsFPwgUHLQsiPCi0nUrTduB6XRTl7cMZcOosWUR6ibzfKu4GBDk+Xgb+jhbhmpKmUmXxLliS+nxAlSaEqeQNtcFbwbVP5fzXGptgLSjfKJ8MwkV6Ce7m8TjeHw/pivF3yZezHqZ/autkB0SOXf+A+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aK+gM500; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HY0Qjreq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK+gM500";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HY0Qjreq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O86Sor4012120
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XBKKALhIGEeAOKEFlIPER1AMTIsq25/lJaVNg9OX6sg=; b=aK+gM500uC1nE7rD
	C8U8z5JWrWxP8zn5wrVfn3GxeNsJRmsNDpnDhwUiaOn56+xQ489aRlq8h4Lnv4hD
	cvpr5Wq8Ix/HFcqzvLqW0C43uxhz9hnGKDWL4FIW/dpO9beTaf4+CYac4PRfgVNV
	nZdV5lOtmBLLmHgHW9w37Ui+ReGC9in0nCHshPbakWMjSMaDZD7MzDQZAw5uFFZr
	lSjlu1rvQgsJr9nMlIO6Bm3vNwZhulKH5i67V4ipLGy1MiWFd/0m+TjjFLYNizrW
	zvfr6U18W3euZXVHcxhwlyGkF5CNRzYFPVD3OkenFo+cl+7EaQhyDe7rSHwybAm4
	MfTE8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9v5au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:34:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faec938fcso12273161cf.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030486; x=1777635286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBKKALhIGEeAOKEFlIPER1AMTIsq25/lJaVNg9OX6sg=;
        b=HY0Qjreq3YRGcGwGndkBPS4hB5Olgfw/qBMhL4sH2+oHovI5eEJlhPCS/P0yrBNL/M
         qKV+OjrJ4kkiX+dQ5jycG2mEaVA0S+0Tk28ILO+AMKbr9linKbq1iZ1aId05E2P2YVAX
         tGbyMZyPH5cu5ri55fnemilF7AXbaJSb/pQeiu2ac9EZMrZcXUOyyexneXSu0Fj9GYbO
         KfY9pPkJS84RMvaerkK5REX7bomuofYrp6UwuHcfp1xNS00PhRba9+JyA+AQ82EpMq8r
         HSmfustQH3DaeNN3A1kmj/Z2+nY2XO3c6TGtYfZO/rvTZcowwPnURIllrgnVzdkv1Wus
         dNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030486; x=1777635286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBKKALhIGEeAOKEFlIPER1AMTIsq25/lJaVNg9OX6sg=;
        b=KRkRjsaxg1wL1rAGynpgzrZt6k0Pab2ets6yLR721k9BxHKkSFg3J33E/voydYfiRN
         +ECH4OdYwG3mFilV1DtGmD3+40nDtyuZTflicxY0sjYbqhXGmE0pcMCA3bsBYNmJBwTS
         rMpoCaxN0JHJiyDOwteVFnuq6iGS0VyCn1jZnE8kNfV4EFu+LPQ0wvv5mu16qSBS788/
         bZeO2JSB2tWvSe5ZH/LL8Vd0on3vty2xRR+40QjaM1kFv+u6KUKY/U3O9CT7FSMG6ZpN
         puQE6PqRkDpQInYboWHP7pOpP2xD2Ba1pTFS8NcRdai/dia8vxkEqVQUh893CTBzTzKI
         HG5g==
X-Forwarded-Encrypted: i=1; AFNElJ8l2/St4LUNLBi+k0y2rP737ZJrHqjT1zZfxncexQ2qp/VShE4C+NcT1qv98uujnPFwv8FQsUQ5qBbl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3i0Rkxb57q15BBWs8Q6ikE410aEeg4LQR8qQvfnnVnrNFMhdl
	/7ZRpz26apCuDSG6GPoU2Yaq8g4irAyQp3ulwGEMQfSTcwbGnRFYUYSUp14MBt1PCWOm9g7VZ5N
	JFgtAN+Q3lVNjJPrpZz/JQauf1fw9m8OX7ILLLTw4zvsgUlMiF2Eul2Bb1ZNXY9rI
X-Gm-Gg: AeBDieuMPtf8/mfYkSd94GYer4SE44cNY7quVLL/OEyaTNdeidqxp/ajwguHKyTGCi4
	awVPsYNWSFpJ9BHG573og1YrZXiOnD1R89FHYcLO7vw97v/o9hBaweS7ps/jmHH7mPhrGkNzoz4
	A0VbnQBr0QjV/u6IWfgu4fLmPTNYHsIVexCAPnvG+99GjC288wOFWy8nAeG+e6JyF2XfPg6zkvq
	4PXyNThP5vBIpnIYK9SV15j7jTYGelKrsxeKefIEpa0RjGtzdXcLtU5uJPucYxFHHyQSBmI+uOm
	jhHmiyWj6PTaODidDeLn6RVIfpy41uZAANXM8ejNebjjOiDzXrGM1ZlogFH6lh8yBMsMJlXa1F+
	UNFpj3DYKLWmU66DA0DTNSqYI4qnrjX1EPHi4NR0Li2a1HDPHEwOBXfKzgFIwHAnYj36rgpk/1x
	PlHYOfhRj8Zjj0FA==
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr223601021cf.8.1777030486062;
        Fri, 24 Apr 2026 04:34:46 -0700 (PDT)
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr223600651cf.8.1777030485653;
        Fri, 24 Apr 2026 04:34:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d5d8f9sm4701356a12.25.2026.04.24.04.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:34:44 -0700 (PDT)
Message-ID: <c93df63b-6544-47d2-92a5-d6f2995e736c@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:34:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: camcc-glymur: Add camera clock controller
 driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
 <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfX3BzDgVqQO9pE
 OW+j+6sE6bokGlGuSKpCYIsI3SXMhOMZZoXppBcmmfMG8eoRQaMoQ2TjnLoZBqAsQiMf/6Bmiz8
 DzY+165IzFJxrCdZoDTvqFxSv5G9Q0MXk+NgUBiIE/zCaSOTK2Bl9TBMXqbo2LSb3f5h6lpzbaR
 qAH0TxJl7B4ZI4S/1BpC/FOlvqzd9IVDWN4qWzS4YYK262kZ66P2uLe8XWNYkD5g0jix/wwSF3x
 lpnyfv7JhIWY9fmZOF6pcvP8zLxWvOpjI3hbXJ/pUvWbwkpIlpSMHCkEmn729ddPNMm9F0eGywt
 GCHoE9guQYhSGsBr9aLP+SKmLEloBnVpN3ru3+UxHJebNuRPfT9GnNU14L+42y04gAH9kf6At93
 4hkJOayqTnkhgamZ01vFSfMuO0pu4sQt81eKJ+AbRrqCI4x80cUmmeQC5JZT9HWrq9Vo1myk0c0
 Ef7SowFwJmXgVbcEgYg==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb5556 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=i2Go3QXZGRdFdhsXBMQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vGQsMvd6Hy9L5yi6wT70ykA2IyRM_omZ
X-Proofpoint-ORIG-GUID: vGQsMvd6Hy9L5yi6wT70ykA2IyRM_omZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240110

On 4/2/26 8:15 AM, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients
> to be able to request for camcc clocks on Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
