Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C75D5AE43A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421551; cv=none; b=Vb6WERyC4Jiav9eMLBXM7lP5+bF0vebCF9tuLBwbtwLUnhfLYVbonf7b8WfKsIOLz+ulphlsRG7MkkE9XFfzKIOzFFuJpd9wdXr3PeAfbgXQZK05gN+bTm4jY7kAb8+iGS8kpPfn5CAnFqnYvfodkTb61deTbHBOnh7aaeWnElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421551; c=relaxed/simple;
	bh=1K5H105kxuN+ZVKT6leBzx4HfbQpcRrSq0RyZndHnM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgAn8EHCRNkZqqw1LHJPKetQFiBpkr+Vuxp0SBi/H9TdO28+/35MPLcX2AyNE6TrSAx2TUERTjrWbpWNwXn/hc1aQdMqUqzwSzWCrtkKhjdpXT/r7pcKT7r/dAY/DdxQaH4NWJ7jkDzQWRM1yZ8uetsCBxPsZue89d9Nc5R3sZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcj4Pdhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0XaDEqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcj4Pdhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a0XaDEqi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0OrS3488313
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=; b=bcj4PdhbvwkmQAwO
	asgKt1TDvUmcXWN6CUn2RC4pNw/poL4hDAAc//4xFP6t4HMQwYLiyVGlRkNg88u6
	IN0YTl/lfyBbes3BBjo16WuQGXYLHG3ZWB58d8uzu3j5M41WR/FlRQkXHTfKuW7X
	aeoG7seNQzShQ4PomUdkeR1Vj2PXqizfentckUQh+4ml/2pCy8/J3GWptU9f7n3J
	bVFb51EvsNlj6eIA1j0OVWt7wSgYXCByyP3Wex5TRK4PrYvY3qF8ghH891pMBZ1L
	NU64Aakiune2ofifbHeZ/wAi4rjSWkaWbw1mNiiIN4IAIan65qhY4LCpjlAwvAIh
	PFXPug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48hq5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:52:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso43684185a.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421548; x=1793026348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=;
        b=a0XaDEqiBJ7orIjLFn+08ohxZzapooO4lmjz98MgLPa+X8OdIwcnkk7XBtdqOrWTMC
         IhJurdx7cJhlQkireW7A8ul9t7hKd8IEP9F1c1C2g6S6wfXzSOOsjRBlqHA2oYzCETSP
         1S7vbTd/weJGOSCUI/tL/ErJZjZ/UMuomt9XukarmwOj4fKrlqv/bRnSPgcOKRJqLTLC
         jIY9faYmKN2Ckfqy3IfnDzmZ/hUzRUcG6u1eybizybnG8sGHYEz0OxN7GwUziXe6T6qA
         I46RHjLLpmQ328jcom9wtHuxWcscQRe8j1fvyqJSiYpvYa0h6lqDVVtfhopybzATLYMy
         Ffvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421548; x=1793026348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=;
        b=e6BZwK1LRVf9tKjxpp7SJ3bs08XHtThpOzDA9WzD2gb4H/qZwh7QMXt716qf0ZcWpd
         d30j8kBcWOHPDJKvXuyPUw8JyoZWfESuawEgRkKXN4E4uLtCzaDZhuqf9hqSq1AYQXnH
         P9GABvuzYd4ZoWlfQp28WJcRM79neAi0qgQRMvvXbhHXYLmSuB7rGA46cGV5kJc8g6KB
         PyhMNvUExXwNGX4UtScUexozukj1zYrZW4eEFYE9NftTEp5+X8UZr/PxZutAMzLacL7D
         2QpiZe7uNrnx7NuHQ2dXfI1Vo4jbvgBTcG2GO05Qdw+UtX0RTnvUey8pl5lmPx7iOlTq
         PKCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu7B6iq/Kr54OH1vF2nu6CP0anMUDMS2r19TtyfuBY+TaTuXm4c4cbWXiBzY+YzMsuJDxpO2iEQlBZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLpY3V6F8PKv95jqXMkTnbdsDnRWey5pooZvZqT3iJrnLUC8S+S
	xHAan9IABSpwazlF2dqev8Y3goydJeAgAiODbkcXSUF18S/prFprK0tfrO9uGdDmBKrmszDV8Cc
	AUi4n089hTs7c+ya6cqdjTjptGiwcZAxnvLt/aUdmbC0kLvCIRV8jRMwBQHqJiLt0H51p5yUD
X-Gm-Gg: AYBFou0V8XymtukiEHoxg5tV6agp4orrUZmxUCKDSZSjDev1DnCPFRCoryou9YzLZuP
	pRifFdUNKLV4+JTGU1c2KwMXQonuPziOx9T9hGNwyU91tg35hr0jkJBFPnid066rlJPm8JyZ1qN
	6BzSe+7r6TOTrorCyz2jetIVW2kXA6XyB8RQlWX63z3xjUqRjZnC4cXyhZOphXunAJyLUF4NQbU
	GPmccEnNdRYCrntz2f6Zp4+ZAXUFMUyaD43v9ILXgU7j0L5kk+ZNMAhTNegF/TXFUwoxX9uu3jZ
	RluQU0ixRt7lHqK32/h76RY9ruV4wngeGyL2+iLMTeiH3xahXnEA91W/Ns4UPpEB7SVE0sZqwd9
	CkQxdAzCkG4jPRJ08WQJn5w==
X-Received: by 2002:a05:620a:40d2:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f299e5cf2mr1473239185a.0.1792421547773;
        Mon, 19 Oct 2026 07:52:27 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f299e5cf2mr1473233085a.0.1792421547217;
        Mon, 19 Oct 2026 07:52:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf335sm373853966b.29.2026.10.19.07.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:26 -0700 (PDT)
Message-ID: <2aea5502-d9ae-4df1-abbb-9c5ae812b80a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX6tO98TH1gney
 Z1mOQXI3GlhwnFhhD/PeCCpeHIlG+2eeKt94Sug37FI9R3ANyh99G5Zp+fvItQ3ySL8DKwTG8hP
 rYbUJONfhLYfT6gIJcc1CWizdlu7Wt4fCaKbSEKP8pUiX3WN+EVKWshQT1cL6EN0/6Zd1X4khdJ
 nEhoXpA63zHegEaH/rxdEqzhHNGmVnnJhrXQSDorcyv7KqaCfgd0afWw623fzfATp9vdHfPwVBd
 a2DF8k+/rXP4cNFPfr4ZybAYixzvTr12GIY4lUeinI7RcITS9Md+sFUX9pqKHii4ZoRLLiLZEh+
 nysb+8YyT8O5PnJjzuhsJNgcKCSOnokiVnljR1BYBfk3rPY/E9l/cLKHS6Hnb+GY0aPtD+rqRO6
 /JDZ4BDaGg9B7pKvt3Z7ufAnXOQm5+O/ZJ/Lus+F4mMO3gIxdqh/cvsqUByt/ffduSwc8kXHiGZ
 YbD+grFBcLGWG9UInQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX1XZxWPHkXVTM
 bL9Xu6xMPNCPz3A+5UpayCgWrrFbgC/SMSDqWzHbk+uCM/iWaT96GxsdtUGzQj4u7ssPBkRf0xm
 NsrQJLHiCZsYwlL3FAFcy5afEHulEUw=
X-Proofpoint-ORIG-GUID: Qtuo7BHKgybCpfngGMpJMPissefT4Mnc
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad62eac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_82NC3t17uPQdkoQo54A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Qtuo7BHKgybCpfngGMpJMPissefT4Mnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
