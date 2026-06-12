Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AA23911CE
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284741; cv=none; b=kWVmP7hUFtnrzGE27lm9us5ZQRyVDQbLqTnxiIOM0b61p/Iu6uM6UTwZnJRjXgrwFAIlyHTNod9qLUlJDkB41kqLO/j047NLnnkv3kP6vq+BXeRlkGjn1dnsT1uJyBIKgNpydx1Tbl+Agl5N9pRULoDG2aQVbw9DECXDwyYIqzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284741; c=relaxed/simple;
	bh=CfhSriWS4WwEYC+i+yk6Zxhywexzlao9E2hEBJT4Q/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WICxGGlqY40uTP1WALxU9wOfAIoKtAxkarwfP7XJiZ+NKFrTL0hhnU2m1/qMc1UPGZvFn4prbBqgfFvs9H805nCV0D7tQcvo0KMJEWzAivyG41cTmkBXniV8GA6ax3qD6Pa43H8BR8FOWX7KqfT4R8RUsTPAcHlNjjbVJQ5Zs4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdoQJ+0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T5y2Ny3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdoQJ+0L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5y2Ny3Q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVOZM046500
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9DFmNAH1IgOZkO6kAlv1u8mYMZxyL6dC6r7w1W5gOGE=; b=KdoQJ+0LAD/hkmca
	YXRDdQiNUDl63NJ7PQBKot7sA7ZbEPRID+2tkW8YtsRh7nBZ5zM4lCx374w2OcgS
	zxEnJxw4Ac6tlIfCFBJwOfZnoga32RNiB6MNJe5FQmUaXvKLCb8Z3YcRX9mPn9so
	kb4kO1ByrCy6n/H+EmcNarUdZfGOO6gSOo9fitPKpK3/lTXe7rqYKOemkzyVBxBo
	AZ4HQR/vinUxPU4LF8+uet7X5FsEdLq6wG8OfXQ9VCiK9zp5VCcH2e9EKTep/ylv
	CYhp8/UeBeO0VFKiuoWLMgHUiWM66F53+PXwgd+wIKxtLYyy44sqWc2+V6u49V3P
	+V26ww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76ejuff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:18:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422b544a4bso852954b3a.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781284738; x=1781889538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9DFmNAH1IgOZkO6kAlv1u8mYMZxyL6dC6r7w1W5gOGE=;
        b=T5y2Ny3Q6p/ev5wCKFCX8bfo+Gtxz7TBmnG/aLqP8gjmhhVoWwpqyJjVFeqxLyF0zC
         5bKv0Q9evgaW/KUPMmHZ49y4fjMH7z9OJS2KLe4afJHN5+VmDf59XtPrdC7hKxAvZcCY
         qqCBnLMHg9JV1hn+YxJrK8/5VSH2SmzavfXT7wxeXIy2BiXDrAVbLmt7AKepAlPYbjJO
         FSpec367rSh+wtgLbTSOoMSubuaI0uddwkEtpt7UCwcseBldtQMd49IHNGYLcir3QJWE
         6PzgVs33bbM5VWGbjlHJmNPabWyX59SHJI/dDTh8GOl0sKSAiROHY2dAzhQ/IMMoGhYQ
         2luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781284738; x=1781889538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DFmNAH1IgOZkO6kAlv1u8mYMZxyL6dC6r7w1W5gOGE=;
        b=KGn3MclTXYeFYyE6S49+fFCXW1khgSD0FiQUh1o/9NeJY7MlUulKuvjl+5MB0umKD3
         CO60VMue+oOa5+LxD8s3Xagn/JI+KJMng9x1FlLa8Bk8UuS889+VonckJSThrwkQo1RD
         mzf0ScSLlnklE+npcnxnZJFd5wKgBfDR2lezeuJj6NrBQLKJPZvIxh6BZmeJfdr8iTAf
         ebXK7ptMAFRBFfk2o7cJKAl5UzBEoOJoMHp/Y2bGQ4HVnqLMze8D1rcJitig10NgSsV2
         zDf21VhF4W4zkGCI/VtvjXt5sA/o1/Uoxg9Wpmw5fD6+wSb5dYx3uMoPMEgjywHS9JeS
         Qpog==
X-Forwarded-Encrypted: i=1; AFNElJ/RDkbhHC1YJbJwaQGkUFay9NtJMq6LZdAtp0QZi2K/Ix4mt2I27yx32vGXEJabcQuYA/hWAHfW9tdk@vger.kernel.org
X-Gm-Message-State: AOJu0YzeFGuK690dOBA9bqCecY38XeAYLNTaQ7HnTnR+mm772MgSxidl
	onRxaKAYLxQ0fG57zZtcQh6X1+h2AQnIrA2hy1ZXvAq0d3JvDDaHgUE5ijZ6a3Zt02zAtEOG4Oo
	7RxbMQJl+TkrLi7uDNvxZ7LgK7dP74jcSZaYlcWzCDRTk9ygiamHqhdVfWVPFyMZw
X-Gm-Gg: Acq92OG6MwNfvOhbEqPK3Jr+QQIVjrwUT5XFr6rY0pYNgA7unBCBpDXa27110jaKYIs
	k/j7TGV7qP6tps8dPV1rtkt6qPwbOTj+42YOhS3/QpP146LxErJNZ2sQm8PuJ87nQKoZRTZMWdt
	mMVe9VetQu1nf5H6DDe4gmYhGfMCw1QF1FEG6Gcp3qMkQoQIlT20Xun0WSOi4vCZSoNOPn6dbLn
	w+5/a+IxXzyKvOS+ascZSclcQDjGkuJRBtLPq+cWyrxuGQYYWQefQC9OTfkTw4+41AAqHYszygY
	vgiHNAN490yYHqYIKyxaL6eyUAst8np2bTANAf1wcTbyUhHJwNGtghuRXTlPhlGTHJsBdmojev1
	Gaxldi9SXGcRxfeBla+fp2rOIpD640ErWEYFuqQey6vlW2fpTNSM=
X-Received: by 2002:a05:6a00:1947:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8434d0ada54mr3972673b3a.31.1781284738481;
        Fri, 12 Jun 2026 10:18:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:1947:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8434d0ada54mr3972653b3a.31.1781284738042;
        Fri, 12 Jun 2026 10:18:58 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.232.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm2538142b3a.45.2026.06.12.10.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 10:18:57 -0700 (PDT)
Message-ID: <6cd2c9e0-9e3b-466d-b9ef-586bf6c779a7@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 22:48:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: qcom: Document Shikra and its
 EVK boards
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-1-103ed26a8529@oss.qualcomm.com>
 <20260611181841.GA3163205-robh@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260611181841.GA3163205-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2c3f83 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=g0pf6In4uVe9puqoFIUS9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wogpLHfNZo3oYugl4g0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: hK3vrUnkBHcGxheTHo-Ntv2Rg8W7R2WN
X-Proofpoint-GUID: hK3vrUnkBHcGxheTHo-Ntv2Rg8W7R2WN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MSBTYWx0ZWRfX2Ofwb9lzzD8u
 5DIrH/Y+ycPVLJJPQP1xM0eZuinZN1AjkKmawRi27wM32PwWDvRX5CtEX57FdXRs7bL0MhkTkka
 szgUL0qZcFkKfSEpPT0XTIw1L/kW2fzrRrHexv1uuqNEueTB37BP2wmNuhoBC+re7C4hqI+9+Co
 CfPCRtJuwxVA+PjdNdKz6X6V2QCI3C3a2bR0s/VQchk2GBJD3TRLP9YY/0vSjLSIWe9IHkIa3nA
 r8ktZwlepwnnCUYuxHprBzgOSaxp3s/BSa/RoNLHBSFJ7ldkzvBNEClO9g6+WvCdldSKNXKzqAE
 kd8WuDkBGncF8MaJfu6/h9zXdgZsaCzU0pWVqzmgBDlkt56ruwJZV57St8+3hEWHSxxOa+HCEUm
 qtN6/VIW23YXqCdpYwlp7OEjQ6k/gl/2kd9v5dzPf9DSXUg9QM61dmIWDgrjLkTzG3AS1sx3JVG
 QR4MeFnF3D2h2142tzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MSBTYWx0ZWRfX8BTKHLdRBbCk
 u5dVidN0xvu52sP5eR+ePYr3jIrPLC9SoeTajwB8YNa7c88ya0zgvrmHjI8xUWRN0CNGQaAd1ts
 XHDlkTu48GP8IKxtdx9gd1RhZC7Wgd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120161

On 6/11/2026 11:48 PM, Rob Herring wrote:
> On Thu, Jun 11, 2026 at 03:40:08PM +0530, Komal Bajaj wrote:
>> Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
>> form factor. The SoM integrates the Shikra SoC, PMICs, and essential
>> passives, and is designed to be mounted on carrier boards.
>>
>> Three eSoM variant are introduced:
>>    - CQM: retail variant with integrated modem (PM4125 and PM8005 PMIC)
>>    - CQS: retail variant without modem (PM4125 and PM8005 PMIC)
>>    - IQS: industrial-grade variant without modem (PM8150 PMIC)
>>
>> Each SoM variant pairs with a common EVK carrier board provides debug
>> UART, USB, and other peripheral interfaces.
>>
>> Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and
>> its corresponding EVK boards.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Missing Krzysztof's reviewed-by.

Missed that. Will add his reviewed-by in next revision.

Thanks
Komal


