Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D163AE715
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502683; cv=none; b=LAszfenRapVomIc8zes+N7NWZ4gmtfDme2c2s7o2jlbC9XJBfcFt+l6sz1emsel/T0RbxpMCd8vN4RCjixNazkdJ4YYA322+eliWhhtoZIXSrofCz5fq2KM9ld46DhPL8TCyEGtQGx++Pm/+MYGZUHXLSWKJPYyax4JVUb35GR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502683; c=relaxed/simple;
	bh=THM7ahWJk71/LoSX2T6Z8VkcVT1plWm6lCU1L7btHiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZ7b5ZIYBeihFKZXWGCWoSpyiUfjHINn9+Zk9l/kZfbpsPdxCqPjwpaYFpgGkQLoo+TOq4swAbFESWHV9AXrxZKNKK+OUZwnuSAoHRNin/wLOpY5jydff8eGkknlnEpRwAiPj/USyQFJWbbAp0cPn+qB1HkNDGRcAnxo/UgFjm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9li4ae+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwW9w/c9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9li4ae+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwW9w/c9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1htGi2738672
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	13MV5+oGu9Y4QSitcFuhVSklhqqLnHoOgTil+bf8rdY=; b=R9li4ae+Vk/Iss32
	J4asgu/AaZCOoEjhYJJcZCAxfumUZuVwEJGGj5lRbQqIEWGI+lhZO+YPgph48OBn
	NdvFDGou6r/9QhLO1P8YsYDGh5O7Is1G/ZrrUObW9L4NkUeOsPo0MDazKvblf7rE
	zELvNJuMIrvx0z4hySPC7KXII04IWtoI+QfxYLXeBM08Wjt3xZhqskyAo+XpkMkR
	nyNXnhS9fCLVKktQpTmmhnJYBSDxXiH/zvwYWdBFXpE7bP9+bmW7hRg0+RejxzP0
	kow7P6sjaFHLBg9qL/0Ys1JwRLJ5oQFC2XsxeLVtHjaVbjMqMOgjy3rvPm0++9qX
	ofEbTQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9fdreu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:51:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0bfcd629eso35660525ad.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781502681; x=1782107481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13MV5+oGu9Y4QSitcFuhVSklhqqLnHoOgTil+bf8rdY=;
        b=EwW9w/c9lSrf85qhKSU3PWQOlJa31q3HQVXx3/w3gQkr4cOMXSpSdctALtDy4dnkfD
         ZpPNa1MFXDq30rDBe07jQWuuDkA7U8htqFGdP2x+wgQQGBuusBKsmJsnSijv8keuT11W
         UdxQx6yLMUf1XiyIGJZJKx+BS/WbDN3mkJZb4ck4V4hKEc0FGnlmAtetQ+U52CO4SbJC
         ZyKWzOfYj7PPx/rY7qp07SMliJvhOrnEBE/p62v6QNCetAiXlP1LK6uJ3ppIZkXlh647
         3jih771OyTdjUI/lHiK/Jv/Wwqm8xMCo5mfJ0TZgNFO1hg4uAzJVPmA65zbuBTFXwsn5
         twig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781502681; x=1782107481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13MV5+oGu9Y4QSitcFuhVSklhqqLnHoOgTil+bf8rdY=;
        b=fdXnN9ZQQZoXJslRFRsl/bn9YsPSzdsbQezvmTfZCXmDXXf+84xc2bNvEqrGVXo8gW
         39rPTdG6EpK6VAxDBcHiRfhDBAjV+amvNJsNrHNxAB+hrwwcvRj9Gg0P3cE6i6wD+Nb9
         zBw9ennLR9uKb+ygFEHqnaqQGXKYuy6CfMWzxtRdz0FhPhwQlUhKWaDhQAoFBVNqZ3F1
         9gjoeP178F1Z6T1GmYJZnYhnISe3LEa4MV5b9S/ZZiSWUTupBqQbXFhqIef56CRrS5fV
         nfwh2fc3gRlDI9XemIV+zjOCHLi5R/9UYeIOrWh9IKr9pv9XoIEgF+vIS6UZEcThkq5m
         B1YA==
X-Forwarded-Encrypted: i=1; AFNElJ/15kARTaamePHpuUdxNoGMH9Kw8ql7CdGs0SLeVA21ue2ZTza1O7TkRe/wc9xY2T5luN1oiESl3bhd@vger.kernel.org
X-Gm-Message-State: AOJu0YwQV3ImWhIH4HAoHBQArpLFa5FYzannaHzaGnsUBeZl+ysxG9wC
	CNcW3qdD9pLB9U7i6FiFDi2yMETD8aEUYYIXkEnB5TUqRzpNXSgE7Dr7s5cZtYnzvTkYvoHjdGh
	GzI2I0iukf7fayQZo2Vwdb1VjEJZubxY94RqSpMu5ZiWte+MfbxvBNsu7pthh8zpW
X-Gm-Gg: Acq92OHqIlg6pNatPGxvgj+AIlv4yGk/wQBGtijffuOwtzLC81Nc31ybLdbnzol+z7o
	HqFvLQ7nzM5yKmAL1+j2AmnKRL2bhbzeSC3/L6VHCs7oGuyL+ZeXOc2g/3au6NcU3eScWcD85Fy
	sTmMQiu0qjZQMZKHCWn5QkcNagsgELibTYGeErhjjmC6hPyfq/OlDp3m0UnGKqxAFKUmZ2Zybdw
	mEZ06HZUv/4nTXFQOskDrs7C4wzqWvu7/gc9/Tyhk9m4PLN7/h/wFBxupzKkH+mJ7iNn9vgfqo5
	rqWUJCdnWrgEbGQYIAcqx7SqKqaAD2f9sz2LwdswS6CHQghS/3FGFY8J6Qo31z+EUyE46byH6Ei
	NzbVOQWJ2j2LSKM3yKvC3BVFMvOZEL9yyI0w7HOJ3GM94Js3X8HGa
X-Received: by 2002:a17:902:ebc7:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c664082585mr114141635ad.0.1781502681073;
        Sun, 14 Jun 2026 22:51:21 -0700 (PDT)
X-Received: by 2002:a17:902:ebc7:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c664082585mr114141265ad.0.1781502680609;
        Sun, 14 Jun 2026 22:51:20 -0700 (PDT)
Received: from [10.92.170.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ce89sm89192275ad.57.2026.06.14.22.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:51:20 -0700 (PDT)
Message-ID: <1403607d-a277-4300-abe4-56648b3c2a1f@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:21:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
To: Vinod Koul <vkoul@kernel.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, alim.akhtar@samsung.com,
        bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
 <20260526090956.2340262-4-palash.kambar@oss.qualcomm.com>
 <airUb6wT-I-7cOXK@vaman>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <airUb6wT-I-7cOXK@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1OCBTYWx0ZWRfX23Sr7ZCZ9VCW
 JGjB4BkjHcxVBZnja2bgR92o8VMTel/sWn9Y4ylDdN3qon4zGatjUwN5fy+6VoS3Jkd0Gc1dTn+
 GsMnQcQ+O8PK4iCgMDH2v5Z4g9fXrwsswa5Fo9pKlxXs/LSG6LAcnV0vqk8Hwd4iYi+cyvUBUcm
 mX4FtbRz302ekAZEveO0gqEGSUxdLd84E7s0rRjGRn+W3zXX62ZRf0C58RlhWsb9T12XKhcc0q1
 nnYM/hRL8bcfBVgVEzIfxMrr01PJsbIwwSjm3wsDeVifRLtZc54KLwu8OgMZAcFNhr4QYMCDlLs
 AH+QcvCW68Byh2alXz8r4224YrWfv2OfMNrJWqejPb6YWQUyrL4SvbbmCY+olEfiB3NurO2cjI+
 v1enQSbHopIfLEr7V6ATBA95iRwfrZNXzDkBErb3q6W2bk1k8FoXZnRtx3HOnLsunHfLKKYGyRN
 KUMR08gcWsmBnKvUWhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1OCBTYWx0ZWRfXxs8qrRMW79RY
 aD2E5HkjBSkCh9MtBSCMa1cDQ9VxHzRr0pvXDPK9CS0Ph6GKhdmLo9Q4qmE5Auil9SVLFsiaqr5
 tJhpvXNZT6+ums8vNB3N4w91vp3s5Xc=
X-Proofpoint-GUID: MUGqP_k7C87akp33N7FVvdGxAatZAsoN
X-Proofpoint-ORIG-GUID: MUGqP_k7C87akp33N7FVvdGxAatZAsoN
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2f92d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YxLorS6-WnmH7tsLkT0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150058



On 6/11/2026 8:59 PM, Vinod Koul wrote:
> On 26-05-26, 14:39, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> Add the init sequence tables and config for the UFS QMP phy found in
>> the Hawi SoC.
> 
> This fails to build for me on phy/next
> 
> In file included from drivers/phy/qualcomm/phy-qcom-qmp-ufs.c:24:
> drivers/phy/qualcomm/phy-qcom-qmp-ufs.c:1878:26: error: ‘QSERDES_V8_COM_PLL_IVCO_MODE1’ undeclared here (not in a function); did you mean ‘QSERDES_V6_COM_PLL_IVCO_MODE1’?
>  1878 |         QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO_MODE1, 0x1f),
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/phy/qualcomm/phy-qcom-qmp-common.h:22:27: note: in definition of macro ‘QMP_PHY_INIT_CFG’
>    22 |                 .offset = o,            \
>       |                           ^
> drivers/phy/qualcomm/phy-qcom-qmp-ufs.c:1879:26: error: ‘QSERDES_V8_COM_CMN_IETRIM’ undeclared here (not in a function); did you mean ‘QSERDES_V6_COM_CMN_IETRIM’?
>  1879 |         QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IETRIM, 0x07),
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/phy/qualcomm/phy-qcom-qmp-common.h:22:27: note: in definition of macro ‘QMP_PHY_INIT_CFG’
>    22 |                 .offset = o,            \
> 
> And so on. Looks like QSERDES_V8_COM_PLL_IVCO_MODE1 etc are not define.
> Please rebase test and send again
> 

Hi Vinod,

Sure, will rebase and check. Thanks.
