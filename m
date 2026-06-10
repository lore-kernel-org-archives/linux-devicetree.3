Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB49382393
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074680; cv=none; b=lE0xCL9o7tXJIsDTJiauAdsyHvjtD3hBFb1FrJ5R5oy+qR9MbEaZG5wf2CUyl63tabWbAtAP8JISGoT/Y04Vm3iMZGQILF9GltqSXXQUnzgBlp2MwEGEFlAtz0F4vUeFbJPltYvOZfLWZtIGCZ+i1OHn2e1sMkCZrWNshf7hBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074680; c=relaxed/simple;
	bh=rOfm6lPkU1YKozEVN/3dPmg68gLbBqXTCiwIkH4LjvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9I43uAueSzXHt0hQxpKuAyedPYDGB5YBI41/Cte1mY+iYIuwL5TkSH+K5UWXuDmgEDj1fzKRQxW9e1Zb1Lngmkr0nhkAGy2T6F8apGUmsgsJtGEFDsciiNcckG4adpKkIJTRu3OFq4OoEVOkRVI6QVl90A7lSyg0J8NL1/BwaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTdBrrFy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+BlfoET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTdBrrFy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+BlfoET"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ek8e282715
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOfm6lPkU1YKozEVN/3dPmg68gLbBqXTCiwIkH4LjvU=; b=UTdBrrFy49ApKAOV
	vPw/GBatGZzCWf/OPkwBMAFm/lDmmC09KUaLfeKinb8C/SDeT374j8VmpIfy1WcQ
	uD+u8qiM3xAAMunaBoPcb+2oRiMk2Rxqmqk5yP5yvjSKyZvaya4UY92OzcTkGNwo
	SDrnje3PhCtf30brYQsj5QFAhdrRaMd2FOXmUPqnzusacqZiCzQE42dYJfTcRfpp
	KdXldO7/hRkYoP7NaVlFK50bUONL3nv2mm1aARu/TB90/W9nIRUZviOCjueRxJJD
	DDtMbXG4QolXE2UfQaoYQdVoWwGf+eSl91WmK1gTYyD5UCnWZ46irTGkbeim9oL8
	9sZG1A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnns5me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:57:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36baed94772so1406879a91.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781074677; x=1781679477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOfm6lPkU1YKozEVN/3dPmg68gLbBqXTCiwIkH4LjvU=;
        b=b+BlfoETeE0yYcRF9FlNOjp+37MHuEvjZO/b6eA4ZLJxQr4oO9Bngbp1Gl0zdAnqJM
         t2zm56RW+58Q+s+J5Nt72FQo8s8t72CgBIwATRFDDiwP6pVA2/rlvJCgSybLligOMQ+x
         y1fkDE06vuWbI2kiTFU6AiY7FnMjv6KwQbTxslpwyCZdE6umxJcAubXJI1gSOueiAbzq
         km+EGaueyim+JUu4SEQ9yWTtnXcSOah+p0gFV0xk9sQ5FaSLyITLApHuFc+tTacKsHsy
         yiEGsIr6gvSTU13nLnr5Pz7bDzzOMs3VrlcXzsAq92oD8Xv2AkAAqCP+iLA0Frkk3s13
         hrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781074677; x=1781679477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOfm6lPkU1YKozEVN/3dPmg68gLbBqXTCiwIkH4LjvU=;
        b=HA1Dz5R5GapQjBn6fSrIOwvxrkskSew53EGeF23PC6I7bnieWmew4065fpNL/5pe8n
         lxyR+pVo36KtHXpwBje94HjQju6mY6t3GxXXdc/Of7NWO5lUyrEjNaP8ETr9fedXGQBQ
         U0Cz+omabHErmcwEKT8VkzUHrLaYpGrbck8A5KcOIHrIkUVY0QEUCaZV+FPwUOXoKDaq
         REhYRzi5FznodEKz9kMSMaxBqhYWk2b6WnOfBTX/5BYA5HyJ1h25wM5n6wF84EidWQRd
         5apNEuXukgVcI5Y1yCn2eUBGtpJT62qBBDhxW9ARsMFN/0oZ7M63YdYqdBG0WxYmpFUN
         +ubQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sx3EGR7RONGz20yKFVZqwAVDbH9D7eDZwSy5C2j6/NjwPUvPz68H3SAmaieGZoS6j8AUjHfAM0hoo@vger.kernel.org
X-Gm-Message-State: AOJu0YwYvg5Y/mnQWnEtwk4TMjwGVuRThFtx97tkc632FqkpRZMdkGHU
	AmHrntCQj7ledCi/WaQ8Vgr1BqP1NLcfAgdk0dUC3h+RvGW7G7+y1osShWMf/y5UDWzAXefNGxv
	z1DUCIEMPTr38giYKcB2XqNj1xqV9vOozqssBDs32sq+FETt0+E657NrRoFkbLkv8
X-Gm-Gg: Acq92OEILZfyVn2qk29GGtvqWWPvQGr5Z1ni9HkZMlNnjCSmm9X98EipPU3JeDJRlU6
	tCVv/T9WvPrMjMSUizdQM0tty30FZdqEV+d3CKJm4fRijX/EceVt/t6Lc++B4T5byo9DXtucMYl
	uTIA5RKKyndbULwv7Pw6FeClL2RgS46Ybml3L+kzNBImBx+W+Aohe09O9m1PuDqSVTi4ZYovuE9
	iaSLPLJ1MMGNIJQAwspALgMr8atqK1ps/1exTaNboTU0YA/TnehA2Asnq81oIQMPq6+sWEOxN82
	gIENcEq9z96IP7I8x4IiNLw7BQ7MFWg8/qr54WwlgV3e+A8HLd7oK30xRQy6p9C4l2s/ZAHbjXo
	dAniXdpXCH4+Mo627vcpTyDMNaX5erinlLbe//RWZ92BkcF3oPtm6e+L5qNV+3g==
X-Received: by 2002:a05:6a21:46c9:b0:3a3:18d4:2590 with SMTP id adf61e73a8af0-3b53b9eb2e1mr4251873637.3.1781074677017;
        Tue, 09 Jun 2026 23:57:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:46c9:b0:3a3:18d4:2590 with SMTP id adf61e73a8af0-3b53b9eb2e1mr4251856637.3.1781074676606;
        Tue, 09 Jun 2026 23:57:56 -0700 (PDT)
Received: from [10.92.214.149] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a63b3sm19996385a12.21.2026.06.09.23.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 23:57:56 -0700 (PDT)
Message-ID: <751d1fd2-4f34-40bb-9175-bff749feef6c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 12:27:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
 <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
 <uxklfc663dzdjxd5e7gd6mftddty2nxqypoandbwakydgrjhaa@s5mskp2tlfch>
 <7461207d-aa05-4272-a9c0-360e6abfb0a6@oss.qualcomm.com>
 <vnax3dacoobn3hsx3xf7dnfloxv7qbjxqjwkwnxc3ux6jbqo2w@3zroc5uxgfg5>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <vnax3dacoobn3hsx3xf7dnfloxv7qbjxqjwkwnxc3ux6jbqo2w@3zroc5uxgfg5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: swyOtyYvvRBygvFpsVtsjm_8ri61mu_6
X-Proofpoint-ORIG-GUID: swyOtyYvvRBygvFpsVtsjm_8ri61mu_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2MyBTYWx0ZWRfX4g7oecOp+Iu6
 OuWGgNglbNW0ncoGlK5LBG55N0VxDdAUFbHL2hnU+m9Jpw11gIv4CA7NREWEHMWU6mxpo0boNoG
 cMPs8gwR0G24dNKmPt/eOF1mZNdUTM1920+0CyhzC9vShDVYgeZjxyfpdvGMV0DYGDzhq7/pQlS
 3OJknHqgveuLtyuX8oeDyGaXVXPzohs8+nToERYrWGUgqfRQUYS7MTgqnj1GptY+u0sVAFRG1iv
 USbQUHdvc45wNpm5rG9wpu+Z+vrSdDQkBFXQuypAP59sRRRYVebblUlUfD+R09YC5vSLt/FO686
 Jdx45TJsXIBopzD0LPruzM1xSthDEacYk5TJ9nctXsW3GWAEYMLDDMBfy3Giy31CQeUoSKHrbZe
 Ny3rl4Az/Sn2BTiIZW25vLYTC7HrypRIjhtkz3uLtaj2f8lX89sD0kzZ/JHFH0CfTv+Do3qE0Yg
 yBdS1FXEczEHFjUIvVA==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a290af6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=vaLkkUhX-MW6LBW3rbgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100063

Hi Dmitry,

On 5/13/2026 8:03 PM, Dmitry Baryshkov wrote:
> Judged on the previous suggestions by DT maintainers, there should be
> separate DTS files.

Ack, I will post the next version of series with seperate DT for this
board similar to v2.

Thanks,
Umang

