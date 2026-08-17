Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE4231830
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974416; cv=none; b=f0wqKiFf4syQCsVXEPb7MRlzZasvNHSZoAxEFJbmrjO14WNqgmTCZy/4NFdpC7yF+3WdGjwU1eFCvMTOLD3TPGK/MWMtXYxvVK4eNfAnEPpLNxcDBTcAsqOoWae6fXnjH1soug7n02r2UcOvY3e1xI85BHehW90JKHYRgy1Dg4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974416; c=relaxed/simple;
	bh=zbF87ZtV7rgz0O3uxpZ06xBFJvzJFT83u98UE1z21ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDut/qxJGtOwtPVL/OJjHUl539BwNZGcVlBuZcmxSFe+rQHl5x5XAISqPuy/EAMJbxBoOrrxHPTYLVPMcA8GZLXa1c7XVPv4Ngp+oGKRfD9O48dLT5jsLo3u17bVb7/Rx6uWUKil5vG6VJyiiWCtGqtUb3leBOEsVuFn9wNxGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gPXBzSCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRLtYzbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gPXBzSCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRLtYzbE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6Gi71193845
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kisyPj7fMtLWJkmcw99zpDofFaR/K+W+XXZHVzkhkp4=; b=gPXBzSCMdklHUR/j
	P/l22k1ivbFZIoKX1COxhQUxMhWP9kjrYPYBo1rEoppXuUWKBH2/dZxzW9wJoaKs
	e7ZkkndIlh8UiMyOKdvTlpOxvTTicl/pAsXLmKDKv6jOGl53xx4PnJMeyLbnAVnX
	W4OZGB5yuaGncliC5bTWxfom5Uc4fTMA5MSN0wFoocFxA8x0D6XjS2WbxTsgFNY5
	87G7nh/FrJSR4FmSUZ4WGnydMnQV/ZGFPi7Fmk6R0YtXXqUzm3GhcRJTkIf2hPBa
	oc4Znwd6TFoFlgfXhIPzJ7yypzyWo809LuXQ5mMT3xTgjCMuSW8xDhpsIoppyHbw
	nNeMGw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke1hrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:46:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738be9df36fso75138137.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786974410; x=1787579210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kisyPj7fMtLWJkmcw99zpDofFaR/K+W+XXZHVzkhkp4=;
        b=kRLtYzbEq6MbtQuTI7LmW3UQ2AITj8KxDzOUD99Vg2TNZ8G/SfGP9jo6rx218mO2W1
         DQRrrPigO8iLhgnx0uZ+uDa/XHHmXpULwC+FnLItyUib6kFrD71ZGhqmPtewVU4c2aRb
         8poQjz0sOXEdIK0UaBBsNyL3WwupZi2Sc7zXHU+OKCIgb2ZjRj8OPBGkLapezFAk6CKu
         qDO2CJ8CEV1h3GzF6wnSnK7lo0Uwu9grnDZ8VRWWY6pm8zepmunvEwEHmB7djnzvw0Rr
         s4wf7W/9Uuj5vl3XJVVfEs7APeMcYZ4intUtVMsBrHOD2y0sagCx5fjahWnOiQi61oP4
         mc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974410; x=1787579210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kisyPj7fMtLWJkmcw99zpDofFaR/K+W+XXZHVzkhkp4=;
        b=WWLIo5m3ao/T7Kl5WIECS/RGFSLoiX/mDNzoEnDyRVzyZSFjWDJons7I0cEmX+eFj7
         xA8BY7zWRAGQQbn1CfwiW0wGRBiaJIZLJ+BYgAKmlpBXktmALVU4v4WwTHwCMRTm6jy4
         j+clWLjFKJ5hQtA7ADa3GQY1M5tpNi/pffutWtfQsJxbGi/NyLUVKB61bygu7aZnl+GI
         QHZAGG8PWJ4g1PyF0ksmuRhzBony+BUPdZOXja7NAwX8kXr2Lai++A2R8yQv70grdJ2h
         0ZhkCzS8X/Re+DYlGzNdOjmLHdBC2juZZqd7EF0Piidskdchx9BzMNRoliQ89QsMU5e4
         ufpw==
X-Forwarded-Encrypted: i=1; AHgh+RqQdWFv9dmnmBEvLmgltwdgcFw3lejjsJzIxsrSALrBh6TcZnwOYVafEB22CAgaqvqRyG+68mHCOVfJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/vl806e2kiNapezHHD6sUF2UBEDCQ4QI2VwYR9u7pdL9tVRe7
	AS0Jxoa02BjxFTWmOOnolX0aqzRcuWgwTqYNzlumANcWV1JP+eQq5WFpX/7mkWnNV8NqQF6CLM/
	pgPSfX1A+1guZCcZAq4WeYmV+JIyx3A47sz5Tw89dcRt9cvaOSRUkNJpY4hsHVcBf
X-Gm-Gg: AR+sD11/zFbvEOlmT5CMkZU2uIFbA7TDyg8rCLui3GvXp0p1vt050TWv001TC/mYYVN
	O/f7NaEh9cd5P2wuR+tyYcluEYr1sSu//CHKXUlkiiRHgcRWBXSEHwm5kF1cKQu+8PAGaZg7p1M
	rvmP3LsWAfZ4Ndu00mh24ztfuhHD1o81VfF+7/deHECdbBbd6avi/lNXnYb/rJz5EexJgelCHOR
	JnWc26aaM9919YydXcHlrRhIgVFd5ML19HCsT3Qd2Ld/dM/L5thNdd6Pb31xU/0smd7wPGc8ArL
	C5Ng6bbECpkdLsyHxUeWtKOjRV8Qh9Q8KxDaYH2aI9z+yQGvSQI3dHCUuqSOWLWRB5DBoVjfcA4
	z65vSO5JJPalRMzOGGF5vkbYB
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1526697137.2.1786974410320;
        Mon, 17 Aug 2026 06:46:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1526686137.2.1786974409935;
        Mon, 17 Aug 2026 06:46:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b74059sm33753866b.38.2026.08.17.06.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:46:49 -0700 (PDT)
Message-ID: <ff8874b2-6851-4c8b-b9bf-476b807bf91e@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:46:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
To: George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
 <20260813-alluring-advanced-jackalope-55e5c1@quoll>
 <SN7PR19MB67369ED27F676F6197A0727A9DDB2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
 <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
 <f13b0be6-bc1f-4024-9881-59f522566f64@oss.qualcomm.com>
 <SN7PR19MB6736C6F52894B351836F583D9DA72@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB6736C6F52894B351836F583D9DA72@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwNSBTYWx0ZWRfX4efz0oKcbEDO
 TxodSbCgQ6S9sQO520e/hDGY5yhHPfUNy6wx5lcT16FaSD04nOT67CBdEI8aaBf8J8J935zr8pG
 xlVEPOl/Q5oGQS1pP2zIieh+h7KQMmQpRvUBJoy9Q9FPPnyhHr3YuezwkYLoRcupXvcwPicoJrl
 yiUp4N8z0pYQEEEoy1DvwwAm8f2VfmJxi02NFQLzVaxnX3l8oA216LTzKdVXPWtZ/1RIr3v9JJY
 jgEh5hi1TcoJGjCPQwCN3aGnlruGhuPiLQSFB5YWgLZPUDA2bw13CbepglVOoAEZMqWqKpXmEDv
 DXhK9gyk9XaV/H3OLhqAc6bN8p6q5iiQKygeRKxgCRb2fb36PnYDGAa+PmiUrAKlnt00mYE0gVu
 23hKWvFGu0DrJPCUWzZk5OFr9lDXcVv53Rxajjack4UN5mEZHsBoRlEyMwEl2oIWCNkMU0qiC9L
 WHcNHiZ68gKF8j/MZ+Q==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a8310ca cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Jmm3y0j5io58rGE2ST8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: G4KsgWmkSuc4892iff0wATW9ZTg0_7eA
X-Proofpoint-GUID: G4KsgWmkSuc4892iff0wATW9ZTg0_7eA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwNSBTYWx0ZWRfXx7QGk41xa6SG
 fGMLj0G3Xu3C2rGjGi4L1p585H1D2rtHx9Fw+5T5d8EylXKMCOlhnWXSqvosA8W+p6BAJ20OVGd
 sfbKZ7ObqBfdBfjMec7vzfsuuDibEj8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170105

On 8/17/26 2:45 PM, George Moussalem wrote:
> On 8/17/26 16:38, Konrad Dybcio wrote:
>> On 8/17/26 2:37 PM, Konrad Dybcio wrote:
>>> On 8/13/26 12:48 PM, Krzysztof Kozlowski wrote:
>>>> On 13/08/2026 12:28, George Moussalem wrote:

[...]

>> so the implementation, matching prior art for similar cases should be:
>>
>> - phy node with #phy-cells = <1>
>> - consumer takes a reference through phys = <&phy FOO_PCIE> or FOO_USB3
>> - new driver in drivers/phy/qualcomm to coordinate the two modes
> 
> Thanks for confirming it's one device. I'm already working on a new
> version using phy-cells and having the consumer select the phy type.
> 
> However: I'm adjusting the existing phy-qcom-uniphy-pcie-28lp.c as
> that's the driver currently used for PCIe only in both IPQ5018 and IPQ5332.
> So I'm adjusting it to register 2 PHYs and provide both PCIe and USB
> functionality. Any objections/concerns?

"UNIPHY" is a bit of a loose definition, I also see that name in relation
to DSI and ethernet, but I don't have a better suggestion

Konrad
