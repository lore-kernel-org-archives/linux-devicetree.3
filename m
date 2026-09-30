Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CAF4BEE54
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766293; cv=none; b=Cd+okPKiDNxCcRHXFMHrnEBSUOJzkZycV5jJRmjB+ynXrNK+BRzuLosdyq6UfS1mW/3W44sFEdEp6jHkgYWn29U7aKepc5kOSin6pgJS5K+nrInKJ4izZZXC/6Whi1f/dBxuOtL3mb6o4bp6irXllacdcJ3Z1Gf3+DMPyYmkzgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766293; c=relaxed/simple;
	bh=n/22CJIRs3FbTQ/EXxPb6QwR4RlL3xGqhin4YyXX/X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tl6M4AJL3pF5iZu7L/DTPGllQ6mnxHVAFZyurEVXLFBNW/QmIsbnRxmpSoDOQB6Cue7Qzkqtu4u1ww0Oqxk+AYzyPk9HOEsz1ptjS8EtfLfXC4wLnspctVnFXgRo5/yjTmIxspzuBGNxyBU4j4QVsfDQgyg3sHBejFCsGGWwhzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=my/5kK0N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJf5fC1t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="my/5kK0N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJf5fC1t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dXut2667046
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUpd9+a72DFNRMumj2W0ENVQopg4yo6onCsGEdVnGag=; b=my/5kK0NPcYGPUMl
	GwPINqpVbrConduOJeWQdn91NGpRbCdMDaiI0IDliWmraW876kpruCsjk3/EdsTG
	b81M1/JGMwU6QZL8lTEtRZFZiS0LM7B4ccPkcIduhuGIC44XQJtsmdGV0YKvjEUe
	BXkqrA+hzOdFFFBIw16F3aS4mb67zhgQy9Ilt1ZRcL1TrbD66PxGC2UijdwhwGOk
	7nxafei1MSj5rJ4iQGceK/uW6NabTx63WXdlACOYfZSVR3MGY83zhrQ/dk73Z+sm
	B6bmHL5/rJ/S41V4xC+p84Mn0NEekeTT28yUwlP6TUqQ7DCqfoopW517Faf4pDq8
	FWLeJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27h0bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:04:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a04d1cb2so1034776d6.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766281; x=1791371081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUpd9+a72DFNRMumj2W0ENVQopg4yo6onCsGEdVnGag=;
        b=JJf5fC1tC9EUtPplbmE7+W54J6er+AMN1udgFCvTUFzz5X68YbECln53L42vgIb3og
         I4DQM6VwdHwSBkhzr2fxNDiOiFVT89QVJS/z/Xt6G1lXNhvbelzkcimpwBxYrL7zxYsN
         mZDyjPl6uWfqvpSdcEwLQHS1qaMZMFCHgizOg8KrzAb+f86IKf+2yijpaeO8Paa9z2ws
         yGH7qPPuay5jv+V4uH3gh13KkSJfCyoxOtMf48MPd0FsS7BwtubZNzYsccQHPhA+ki+5
         WhsU2TCMA7U34oj6ENUyB3p/xMx1HdJyuSZVB/iBZCqAUrnAEQdI62cLgliynfLDX6Nr
         6hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766281; x=1791371081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUpd9+a72DFNRMumj2W0ENVQopg4yo6onCsGEdVnGag=;
        b=R3H0vmncgHHBs4eZoNCIPlsa2meP7vSVj0X/p2Jp/nGIV3+8wgIAl5moBugigohJAO
         ix9c9ztbeJ8onvgjtGoivMC4BxDkBx3YlNfHW6SGLhcYL96LiZD3eaAu8xAuQw+orc3K
         6BvOhti7BytHgrXaf2dFntXXTUVZTfJRjs+zk6U+X1olRKjM4zBhZvwk3cgwhBYKZYZ9
         LWWZroIFZ80Q3hdDtJlzEuax22pM+uPHFnCAaS4XtYHBoClsm+PHy9NHsczR4dYpqNos
         m9ab84wjXGnuwt11KEfHXWpvnojW9ceuSaHZ4CyWXpkaXZIRvXG/AFZgQbLhigwiIdvM
         LLSg==
X-Forwarded-Encrypted: i=1; AKwUvByz4uyglO8M8LaF/hZ+GjiOrNeYpJxLvkSU5WJym3QyjbOpR6rtwmGCF/kRrJ2fIMssNdhgnAV4ekCc@vger.kernel.org
X-Gm-Message-State: AFuF++ltZ7LPbXRz5J4EV24a4QW3ynHaFeBrPbRlI5Y18EHxYaKvsTyS
	j53dxx4kV5ZCVHZXrWR8B5B9o4rqEZSsX/xCgV/XYDXg8MRBtIO7CcO60LHw8IecfJh1zPLKhA4
	YgOAL0YDYNub7DV36tf77aBQTG+ApHBQI5KcOi8KBMSZDY2gWd6xMVPBHrz6szstP
X-Gm-Gg: AYBFou228d4ojdwKIQ4V5RtoSgtUsbmaEQRce6um1VoGiWJAISlwskUvRwEzy+gSv2+
	EG+Bo2DcG+73/OCV2wPS7z6lNNvZ3g+BQrzsrZ0Q0D5o0LKZpawFgzugluX6WHkfbK0JZPMz8xm
	jSY4Mk6SbqRlvKUb8BjzTL6s5HLM48LNO8a0UtkLwyEulzf5QhVPIrVopwJGeAyj8AyRkBFmwtm
	QazIoyYuOBRlivAma4F18ek0myhMeXP4jzEsVcz7Qj9BJfsBxnFtAuUJeHRWmDm20G1eHh5XVuA
	qdee41wa2gOhAM19K6XDp4ay3R338Xr0SevUr8ug0FnANtdNm5oh+4fpMq4VIWgS23X44J2ppPp
	qHBXuuFRe6ggdPbbilx3NnA==
X-Received: by 2002:a05:620a:28c1:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ca9523518mr139808785a.1.1790766280773;
        Wed, 30 Sep 2026 04:04:40 -0700 (PDT)
X-Received: by 2002:a05:620a:28c1:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ca9523518mr139803285a.1.1790766280181;
        Wed, 30 Sep 2026 04:04:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm708830a12.1.2026.09.30.04.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:04:39 -0700 (PDT)
Message-ID: <2b8045d6-050c-46c5-bbf2-eab7544b7070@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:04:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm64: dts: qcom: hawi: Add camera MCLK pinctrl
 for Hawi
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-9-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-9-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX2wK4QXpRKwLg
 w9OqilS4EFiEhQOJu7voO7AIe1oxYWHkDXoRU5afXyZ4j9H8LqnCM+xIpiawYNvLKS5ti9dCYlf
 cJGTLHgeNUuxl4+OXNsiHb1ujjPRSd0=
X-Proofpoint-GUID: 3Nepy7i8qo07ZmzQ4DRGUmCtdvbAsizk
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abcecc9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bWtWBUCbUMvqLY_lKcQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX0kuEW4kYwn5G
 XlhThjQlTudadJQFAH0YjlDK2UNBAzh5W53j1CBI6Fq53qSi6RxQOJJuAS1NVMkaKQQOYr4qDSj
 WFZtru2R/rrEdMqz8Jt2OwpRjlZmGy4KxR4+brRPyZ8nWDoBo/too6OMQBzKY3RS3+GvMA8ziGQ
 Iq9fKUER4fe77ajXBhz3TyEsIufc8kXHUhXUlThxZe8+e0ClmUBv4BpHOnD0ioOuGw3YXZtt0M2
 0Y6/SHs59ZHmJescCnkkpaPnb6wGAAtgDgooOULMhQ4qejJCcWgB37E2T6OpZ9BLxxB8XNN4SY/
 DPEj1HvOtpdwWNk2caCcjO5vP8a0Jqnnf7wl0oWkxR3DgM+GPImxlCY+Zl1WEANJ8alvR+63vp2
 Ql3FLibxJRzd+F0qkw+3cjVN64g/ZkoP/Qo1JEoJKrBxCy4WT6lQjST9FcUNxrmBO7T3/It5TT7
 zrmLSNxrMxBz8+WUxHg==
X-Proofpoint-ORIG-GUID: 3Nepy7i8qo07ZmzQ4DRGUmCtdvbAsizk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300043

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Define pinctrl definitions to enable camera master clocks on Hawi.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
