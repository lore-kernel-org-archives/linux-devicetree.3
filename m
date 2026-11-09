Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214265;
	b=uvWfPLG/3hEw/KbReR8Pzwa5o84SxxsInG1Q9gQ0zeA58BPce6mIsBhVgaK8FliWH1LF
	 n1JZPTln7VEnBAy03TTDQ2+ufhjx6Gv9Ih357EQFg44/+y0NpRLdh90K+i2qYrEGkQeYW
	 YblJF+JaeIX83YwhcWTlik2xDa2GCzmG/ZNhiGjn12JtZYp2gSmb+ZK4xJRzZWblChqpJ
	 gPXOJPQW6/G8ZWjXYhZuo/Phmp4e7zdfFx9AluF/kukefjPaD0JO9oSNSe2DKt+DB6/VB
	 jBzOfdd/RVuofM6QCTVAtQOiWUclV3pk+jUJqmFnxe/bL1Uo+Q2GXHSrMeZgCTbqHuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
	b=ZcoATkWMFv25OYJzuBrz5lirh9G7LfjzBO8hH5rqVSPQYQ56m5fwscPRJonMasg3sBpL
	 vyzANhbzioIbeCaYXZozj1SxlR4Mx7vxWF6kIF1H7tnZxaQ/SafdpsNujld+bKPmjshVw
	 vbrkyRXIkU4qSfpNBZ3obNyIaosT+4KxrUq5prZQUJMe/KWhPWmYgkFC7qHA31DSHRRwF
	 zTzgJAtEU6AFIfWGL5JmQZUwPdigD7DLAunVcSmgKRPG+Q6IxYnZZ7RL7bAPanysRtBMh
	 wxS7WptZ+BS2j+BLgXDUCAu0DL74+CBaqZs21yt7lr2h6tjHSsKL2Kd4RzxfkhWyheA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjrSw68y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP7EsUHX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46561606D81F
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46561606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjrSw68y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP7EsUHX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A6Rw3581948
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=; b=cjrSw68yVIWyLr/e
	xwi4uJeVc9sKtHO2Xr1mYmIH7z5SlQE7UxfRuNJs9f9tvHYNZ1YItIbo/mB/V3+Y
	r1Ztf36xojPxSquwT5XIpkJzpVL+7W5IguF1hckFJtVxPYWG82pSA2Nq/q4on1cK
	5wwkarHShHogSjHBittWPna3/BMZt49ns3QHBpYNixfjFm5u6u1FXt6XezwDRXsg
	ptskg9C5EwJSFo9bCpTTYXt1Jmjbvnhgf9YECn96QMFuX7JFmJ8GKdZY1NQYPW3u
	bz+lu+ZJaalA8mHfH3r6h0BknwNXeRZRIsuLr9o1CO+Ue4O9wDXOvc1IGo2W4XA3
	U9iXkg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735f30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:51:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so809636eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214264; x=1794819064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
        b=UP7EsUHXjxAcRBKAOoYsVd+lU1C8nKSBhoGcKyHouS6aedfgJyQ9vEAFNRDag64F+p
         WjdfHa8yd/sH2luNCUiMI6sNI1nlyHURl4nAUlXVcZYz6FsDybgoj+ur9CcmoWqOkKSm
         ykPNUSs1oedb3gttjjxNIaXpLb6QJRFzjIBccr1gXE2w63q7r3/M90mf1vbna8Sqv1ih
         GYIMJoWcoY7n9tPHc17nauv8brGEJTM/K/DkZLqr2DNyWU6++20IjoN1APRM4aGLTm4b
         R4SRy50Rx6Cq0KkA8O1IC4wOtSzhWG2qRWJmSS91L6IjcWFn7iUeaAdPQHqFo5wxypPB
         ao0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214264; x=1794819064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
        b=tW3y42vWBLEs/WSWlzCqyGDAMUYVTZB8RqlJeQfpZdMwFrw4K8LhGK9GL1j/tciyaL
         83VCFfLYFlItPftHpxn+NkvTUJc1nYyGh5OV/z8aDniEfdUpYfWExKwBKghhEd9ecs1z
         UvReCFEeUb+Q1GwJRzRUXUjnPyJn3ERccSjevBho4ObY+hP6FbeRdvMGF2h7zCvt5QAN
         1t5BthqU2PzkCCZPbmU1HNBdz7HJpRLhOypAap9As8NioQxR/McantKFGpYx7z5enVOo
         xAF5Wt0S8sCUqpaGQ1M2EuQIsLT4eMH/8k/sTWyRM4DkKGsCJujKa/DMg77Pd/tE4QOr
         WAOA==
X-Forwarded-Encrypted: i=1; AL+hErGKl4ONUcRNCfQ2iqIsmqV2nhtmSY30BjqapnsllzpJMY2pesi99ejoodjzF7cdEu1IpQDrh9C1wLE7@vger.kernel.org
X-Gm-Message-State: APuU4Z/4dlPX+TDtmx4cHLQ6kp0q4QNHOvesDUr9iBJeM3HWlaLA8EoM
	R6xVrrat4rt8nKdHq+OUTF1YjVi45hwztUF7VXXx+0MovbT8HrS8mkY7Ei1RkM3Rfw6SbLb0378
	w3Y50M96OkaCrxrb97GzSMYeL8U4DFsZptrX8kFgBYNtrs7JcnzRZr/5iM6ej5zTc
X-Gm-Gg: AYBFou2LQzh9x7T0c+8SQR2LFvs5nf979j1entNje2vY4IPct5pQ7Ohj4k9enF86xhB
	mnfnkbjofg+wOMIW+isaXr7jzB9iq3E3tM0e6tmdG9EDGgQJjQLhZI7ZqMmMp44Dd70LfqXu8Ws
	zdaPgNFBj4segrGPz+Eo6RkdOkbLEWclG/GMbiMZFEozvpBEEmbWSua7AFK4gqGMgeINR8Vg3p6
	eLgCfBdWBA2AJakEsxDXvrFJ3xS7JWuQiiA+lDu7DmgKnl2xP7HD83SeF30lpVq0E6+L0t5tReg
	SWzdxMZrhAmM2WqsO4sc669divlUhw+Tf1c2I8zfjOAyJEMm8I8KmtOCmqArB7gof1VNmWqEZJT
	DGSn0OUKtFSb6i2JVSudgR0EIOw9KMSRFV0Y5d+G0vhQBXrJaBUa+Wxhh/PwfKxLlbevqT8fLxD
	Zc
X-Received: by 2002:a05:693c:87c7:20b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37256614e85mr6020753eec.11.1794214263843;
        Mon, 09 Nov 2026 00:51:03 -0800 (PST)
X-Received: by 2002:a05:693c:87c7:20b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37256614e85mr6020716eec.11.1794214263258;
        Mon, 09 Nov 2026 00:51:03 -0800 (PST)
Received: from [192.168.0.195] ([124.123.199.27])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372656187f8sm10575336eec.5.2026.11.09.00.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:51:02 -0800 (PST)
Message-ID: <a7228569-c78c-4262-a9ba-d355101a48d0@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:20:50 +0530
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <20261027-inescapable-rough-viper-6cd56d@quoll>
 <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
 <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfXxHfvDAbJJ4Dh
 1yuuqUXBw6NJY4Vk9HgYVCdNY8u8hp9YR0aIf03l03n9kRnjC3s1azM0y+BKzs9N4AFr54PfzZE
 GGtbsf8bcDg/cpVSE2B/GbhI2R5mFQGY+6dwNUOv2Ta07Bk4Tfw4qZXK5Rp9DfAOFLOgy1NK2lH
 2IVeE6qRdXN/riV/NG3n+2vCJQxjltOaJMmxsrXc/+LYQf+4oVmm8TzwlwO9McPfCcWcyPA4n9L
 lxLmXZScA5O82BpKMM1L/PrIAsaMFRJKC49aq5adziAIQpHJ/KG0mdaRMIej4EuUdep6yUIM3Ia
 UM2mialikJmTW1tNoZrYfROb1e1mdXQykM9fncf/yBarb5I76rT3TkTP6JVSwfD5TwaOTMIVJ/l
 ATAgL5zbUHCFEkWed9sOdLxSlUkE6fK6BRebITU5g4pMuiKiuuytvzQk+qdR4kYRVQtMpdeux8w
 FSx59ICLV9PxobInUMQ==
X-Proofpoint-ORIG-GUID: WcPGnkqnOijx7Aa9sY4bEZf3Un1sXe6r
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af18978 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=kgg5nJQTCQF2KXP9n8GJFg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=IYge48onPvb9mXducVgA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX4LcI2kyk3Ckk
 BLe9TvTbtUgLXZHCQDxaDXYqe/8hfY/Sn8XlYrhql5+J7TzTE+6bfBUKT0COE0lPiTZHiwpgzwj
 vrY0yhPU/8waCSjT9ljJZ6OEH/j+NVE=
X-Proofpoint-GUID: WcPGnkqnOijx7Aa9sY4bEZf3Un1sXe6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035



On 11/2/2026 8:38 PM, Konrad Dybcio wrote:
>>>> +  assigned-clocks:
>>>> +    maxItems: 1
>>>> +    description: Parent clock phandle used to set the input frequency.
>>>> +
>>>> +  assigned-clock-rates:
>>>> +    maxItems: 1
>>>> +    description: |
>>>> +      Rate for the parent clock in Hz.
>>>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
>>> Neither assigned-clocks nor assigned-clock-rates should be needed.
>>> Parent clock is outside of scope of this binding.
>>>
>> Sure I will remove, but the parent clock input is a requirement of the
>> Hardware and the output of this module entirely depends on the above
>> ranges of frequencies mentioned and that is the reason to keep the rates
>> specifically. I will capture it in the description and hope that should
>> be fine.
> So this is essentially xo, xo/2, xo/3, xo/4. The gcc_pdm_xo4_div_clk_src
> you added is defined as a 4-wide divider - do we need to limit that
> divider's range, or would div=0b1111=xo/15 also work?


Konrad, the divider is valid till 15(i.e 1.2MHz input frequency is
valid). I will update the frequency range in the next patchset in the
description if you think that is the way we should go about.

-- 
Thanks,
Taniya Das

