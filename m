Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE940863E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099083; cv=none; b=FLhlix++AaUtXB82jWyZfAW/6OTg8ZimHboqwcRe6aBrmgr73lDechiIj6EpSnynGTwTr9lCvIWK3YcQghRrm36SE5FZ74yo8FET95c7EozpSjvWBNjuLbfq231bkSn0ZlT0HwfvkiHzna/ylnuk57doC564y8/7E6VTKF6WZnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099083; c=relaxed/simple;
	bh=CdfnwlmRSBV+figoFl9mNT4ce/sY0fnUNjgPXon7xVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWg+ufd0j9P9LIiavB3/moxVnpKTxI4HDNj7frjE18zIL/z4y2wb08NgrvvYNHb/Tqv7iJRvRNg/i4w1s6B/T+5EXyBhHlFHVs0H03P2BluJfAPudIn+i4qGU3CARoq0H33MZen3UYarwYEEgZc/+bPf1uNle6lzHSAk7ZZUnl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQZpXydL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0tpZjCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQZpXydL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0tpZjCC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBnCE1135318
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kug53bNTwtfaBOBC6lkpFkpl1cjnIWTW3W0ddWiIpuE=; b=LQZpXydLGiXepNhg
	SWI/+ezHS7zEMl9xyCRZX3RMYEMT07m4gcgw72XSm95oWad5GSMrerW1gPnXr5of
	4Gvpm+z4f2oFL5r9Xc/lj5L4EVRnWN4HpSq2FUTOQbsxOWe4vhjEDczGb6pWv2VX
	k7Ipilb/fn5GkUdJmni3PQiIWdJvnpaSvyaHQ0UpB90O0Bodq7DmvA3JGfhn3K1g
	6YquE3BVhOzXvnIiX3vTouYiBL/Osfg4uX2ea08WktCWY2LxAKrY1gxfT61LtsJ9
	y8Uo6lMU/CzzpcS0Z/2CvAwNSOncShIJxKOdYxiKB5BJrPjEVms1ByweVZC1Tcpv
	x5vMNQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1t25d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:44:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c9239a1dccso317942137.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099081; x=1781703881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kug53bNTwtfaBOBC6lkpFkpl1cjnIWTW3W0ddWiIpuE=;
        b=L0tpZjCCp3PwGJkaFfORc56XfPwAsxbLyWu3zmjTO1Yx9xSQEfry5dClEYMmY9o/BD
         tVc6yLtHYHeJ8no3E6782LK6Yj2tq6mtlPVs5WSsfHZSWqHU0xUR1zmej/wcqVWIGOAb
         VlsqGaxSBkRXMKCU1C7qaMrr6meKAiOVeZtKsx+t/6hGC+zsgt/JYy2LhWHRikxQtRRy
         vp8+cPJ5msRTvX2VuUixbSUWG6dzS5CProJrUkpMDFPWP4ekGqC2R+FHBSNSpEEWeIA+
         hHtzkXPlwX2FuTn+nRG18BEq3f7DjMrmmHpXG7gFyC0ahpLeeuVpMOPTSaf1YbUwbC1V
         ZvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099081; x=1781703881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kug53bNTwtfaBOBC6lkpFkpl1cjnIWTW3W0ddWiIpuE=;
        b=VHN558YJXhHUauS4qw+UrLczqU0yF2PcX194nt4d86SUrkR7jo3kkzskarDI467/dI
         VybOlyk2PjopD3fq8h/MSi4E2M4dCxSoIXQupXFIcvPGl3aq7wBC1IJMe+0BExet2tXG
         Rh8h7dXq/OyA27uE8FqKm5PSVNGt0BTkvpvdfG8OGYrdqphWuMAGbDiFchlZQ6NcHQGT
         mOHnNm+SOoCwWhdiAyVYaGXSdcLnDUuDkX9ZALO3mj/U5f02H5Nxuju8CQJoxOw0ywyZ
         8+8PWupZ5wLVnR1Hsr2clzaEZaRNspU0LmqtvNhRD9pdbUqJDY7DZ6YNBdci+mcH8ubg
         Ycnw==
X-Forwarded-Encrypted: i=1; AFNElJ+2mBPa37Twn9SzN4BhctNAfDttpKfVQpCQewxMBmE7SnrY7dQLfAXoGJyEOd6/ndxz1EiNcppxh3p1@vger.kernel.org
X-Gm-Message-State: AOJu0YwJj4Xf0ImCVOuBP8Sg5zDSYeWGQRsb4Ol0+Z5dJfQKNui5ufkQ
	fv8o7ZeNOSMvqFzcS4qflukrcdcUfHp8GwTmQhe/nY8GNNCNyLAl+7IittdkBx10c7vb8lXLGbM
	VX2inYO7nNrSkyM9iaeWrQ/Ve9O0puD8ipRfbW3BUR9Knp35+53MnUwT7oM0OjJ6k
X-Gm-Gg: Acq92OGNFE+ysMBB+SB1wkHeTFdKD5G2iLWBNVZ5fUzt1WBFWQUO5mHt3gViNn4Km4g
	FLphhFwcvkxY8YKBvIOH5sSVIvmC0aZQ9V30TGtSQv/36l3BMqEZ0JV6WmJ2h043+FilosVOqev
	zsu2RdK6HGfmcrS86kSWUYUfMRsppcvP/4Ib5st2cVvEQAIbq89SPAlG/VSNtchh6sooYPWerm5
	1jUkqmn7uBZJIAZ5PKyPqWcOl39jnVWl42Ige9TykMbv8ewlTAwYB5lBXUSJAqyg2VN2i1CpPiP
	uBtd8sexeKvxtMtCT0eSAy8oUSGfvA32/OMWQfbT2ttmol9Fw7jqhqXy43u+nWYjaoCl2WEMoTc
	e239gTN/pTlnDS9O6QQ8xJw/UBDanEV+apH9XNaswd1HMKzO9GOGxoo2m
X-Received: by 2002:a05:6102:1489:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-6feee4f9571mr4179087137.1.1781099081039;
        Wed, 10 Jun 2026 06:44:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-6feee4f9571mr4179073137.1.1781099080601;
        Wed, 10 Jun 2026 06:44:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac091b23sm63272021fa.17.2026.06.10.06.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:44:39 -0700 (PDT)
Message-ID: <c76aff72-9167-4048-a009-9b8e477d3764@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:44:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] dt-bindings: clock: qcom,gcc-mdm9607: Use proper
 address in example
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-11-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-11-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfXzet1fR0yQSvP
 rCtYHbJeyTNOJHxdLmZWP/RU7+0WNd9nE4IRV7OSpondKPLDFuSkthlmOqGKRd6Rv21gEBQMqjL
 BqAYvrljhCh4y6D//LVl8oCxbHG3hwOVEAw8FSKLNxvUlekzfKSmLXw9jd5CFtE4HxsfNz99vjG
 N8cYyCCx/NFYEzMox041SWHy00yFlqWLlwjKq8zwwRtnjOLAnFh78DQFSMi7iTkX5bVKW/jTKtb
 HnfqtY3kQ84aaPrncxYvAnTuK5MO8RvYqwK0CBOlbItF28Hii/NqPsV5lTEkLb7M1byQpuEMOiO
 UzGGSAjtkwDfM4lRztKpYnUsmxhp8vx42pxtUQmQDawmPUho1xfPB7m+LdgeOJN1oCQn95ULmDt
 Sft4gNBuQt/PYiJtcbmcqRpnLybkq/Et+AfsCFEZRdMAF54R+yasIOgH4cWyJsdxn28k4izqMrm
 cZMtRzFvfRYe4m8+vyQ==
X-Proofpoint-GUID: XHW1osJ_wpktuADFSpCG4CLo9VevmjVU
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a296a4a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OYg1jswFRQlTD9ONj4EA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XHW1osJ_wpktuADFSpCG4CLo9VevmjVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> Given that this is a dedicated schema for qcom,gcc-mdm9607, we might as
> well use the correct memory addresses in the example. This does not
> affect the validation itself, but will reduce confusion for readers.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
