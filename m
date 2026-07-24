Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEDF3D9524
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881154; cv=none; b=LIZNwsekklavxPXRJ7kDl38RSdbSWlvyuUUZQXbb+L09alv/CO8mkmAgccU/71G/CzWzMViFlrGPOyYqBTihT6hWEDBjrzS2HIk4nc8b9u4ISo4UWMQmyBwvx5EF+od4XCMSenWdFA3IyoVZmHyjviaoVzcLrQeBLLiySL0lUbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881154; c=relaxed/simple;
	bh=nELjpqWoI93YcqsYxu7mwnYQndQk6TwGgVXH7OUR//A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QB9KREeEUI0vCEsVgUoS9styKuEaPKv4MQfD3qsStVkkAhG8gPkzdUYfTUGtcx+5oQjt6a4UFgArhRC3oQO3pGeEAYaJxNtPyftnTmemiT2QjoxCAreTD4XyrspNU8yn3PqiHms0MxrFYYH1muOzASu8iR1BTEqyUDk1QngToyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcMtiDPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIboNy84; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcMtiDPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIboNy84"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4m2Gh2099816
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5hAZ8RNm+jR2e7QCmc6v+/wNwvrdwBN8Xl4r/Hc6iA=; b=KcMtiDPR+WFMKx93
	jleerMmt84p6aTcAMH7CdC9E2uLk9q5cQ25hgSUW9NrhQDiUtiWaT0d6kfXkoUpk
	A7Qb761AkFHnPwYB0ZF5HedGYMyuBg8OLe6i+ymu7UcMI023m+O3CvqYtNX/N+8g
	JAAWcCPhd7ZnT75t9J3rsLvjfGm5GtD8x4V700/tnyUW0xi7uIlW1Bk1PfjzVpfl
	Z9aZtB9nCTyBgcmiU/GOXn52ZQ/bm4VRZ5uxGxYEZD0Mk9vmjet8Os3olRBg6iZS
	hxxBdNdsMb3ZOwoIfat/Hs57Z8MpW2K0KXUJF8VLDzN2hEdAgDvnvk7KGALPnFPi
	LMP9CA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktaht0uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:19:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-901fdbfc3abso429376d6.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784881149; x=1785485949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5hAZ8RNm+jR2e7QCmc6v+/wNwvrdwBN8Xl4r/Hc6iA=;
        b=WIboNy84zrh8DwDYANSJq9si6aA27aew+lTjsJi57AUYk9WnleeE/CW9zvDTJf8jsx
         3uxNhNfN9uZPvrwE01gbXTzhgzVQspOhueNu1WtC4/muvH+FfGr42+j9h3wsz49VArIR
         vtXePTIGJSe3+t5bWuVoarc5p/nZmJCbR9v/h5nOY3Eh3rC4cDvuphPSrJ+A7nEZbN4q
         +YFVC+P90ZcAaky3B/tZgCa/5Pcplwm0RiNyrWGHomVMrCTDmBFs9sPmFawBp8irqdyG
         Csg/P/A4rTlBWFGTfgHJ+Ew5t2Z4siD7oOu9RYimxVm7TLTAD8pH2YlZfurLiiEFUGNw
         N1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881149; x=1785485949;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5hAZ8RNm+jR2e7QCmc6v+/wNwvrdwBN8Xl4r/Hc6iA=;
        b=Df72rXb27uHoVENvEzfPOD+osNTx7pcbTlp4zw93+fo5jcKtskUMTI6JYBw1lmRH9H
         Hyt1tqRVi5J1c8yxIeO9OWBSRinbFEGgXak3UaGgOKAzL4329PXJAbKs3mRuYJrx1fRX
         Z74itRwxvAp1zbdfgQ/5r1KiY/+a0iqRuPJygwp24eGvrNSO6Yn6P+K76mnRn9Bpl84Q
         Plgvt0Wk/SiACPz4/XdCuwrJlmAMgKEtEGWRrJLDrg05xrdPSb0X/lGlSXJS59jZ656b
         18s0yb3Xbqm8OVNUSLfm+tTUBLRDDqeqRZC1qTOZioamRPwDpxbZrIjX57gqqtaaVpxK
         Ih+g==
X-Forwarded-Encrypted: i=1; AHgh+RodFynM68E59xK50bpopU3Q72qdz466SINACp+oi9DVg/DsgFe/16UnZCheBrbfDE7QGZdnWxipaoYt@vger.kernel.org
X-Gm-Message-State: AOJu0YyTOQS2KjSU+RXAWh9LCcHZgsZWE6DbDYH07PmmYSC/ufYfxykW
	mFBhtJ/9tayaULZBiSGBZqSQXt9C7Qr7Ll6Xp50JFR3mwVBKf2jNypztpHOa0wyULCsNbFWqmeb
	Sv/0x+svkRSQUOuMSLuxYtE6LLRpb+A5X8oMh3tU6K9ZQocTlfC6Q+lvGuSnYcN67
X-Gm-Gg: AR+sD12NWM/BgO+/Yi7LzT40xsf3iWF3jDtcLUKJeujbNxzm93qXc4PPEI83cLVS4k3
	hUxg38VpGihy9FjUfSf6P6XT3znktAT9VT9HhjIP+xSrlW3+lxaBMwVdinhtGp9w6GPMOoJ1SKK
	ZS2VIdCOlKQhiwUsbBn/rGPsoZaKLiyjgCzA62pZYa+1Gia//fzffNJzKmqxVYfrRZEY77PzC6d
	vQYeObXjhmdqMNSZBfg8rpN8xTUzBxXwKNpOVuyRbe1PP9IOYPIUmLDZn1DSfjdI929B+AjLDMi
	D/mC3y5726YLkCPz1UsY1ClCp3QGho/l9ZKavHTTZ53oOioyCUI7DmsGM6EavvvPPPOMvn7PlAU
	OiKIdQdcUGgVmxSL8tvkyCiEy
X-Received: by 2002:a05:620a:7181:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9315e3553e8mr207638585a.7.1784881148719;
        Fri, 24 Jul 2026 01:19:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7181:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9315e3553e8mr207636185a.7.1784881148237;
        Fri, 24 Jul 2026 01:19:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f35025114sm2829815a12.24.2026.07.24.01.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:19:07 -0700 (PDT)
Message-ID: <e90546f8-6ae7-4199-92c4-5cc223dc6d26@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:19:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: dts: qcom: qcm6490-idp: Add IPA node
To: Pavan Kumar <pavan.m@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724050846.3413161-1-pavan.m@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724050846.3413161-1-pavan.m@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3NCBTYWx0ZWRfXyNMwYBYEajIB
 /ZEpWm/DwBAYWy8RHdFFHnB6+nuiv8T26psd+8l6x+7BJUACM1oJ8teijV02ojY8KhM90yn0kUl
 yupQv49Y7zWyoS5hi1u4c6Hz76XsaVE=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a631ffd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MdxDABNhWrtLJrUeo-oA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: UnhyU6qG0wPZHJRQ-QKkEHPGAWFMD5B1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3NCBTYWx0ZWRfXyPlyix3cTOMQ
 aU6Pj3MCL/q0VAH8Rvd3VLPEg4sBv/1NWtFmtos/axhtOhKk1Vd557LgWGt01ALcJSNzmdzGhHR
 iZM63misAQ3TwdhUHtmcleumuA6zBcAi0tHc3TWNVQQM+0AEAaa+nRYa4b/BeyT/yF5R+cbm1bV
 jEUFUONjLPS9JvWeDoorArT65o/2zhPZHsidYM1l6+h7qNz6exIpFNtWR1jgTg7k4FctLzsd/qU
 9UyXP971bZxpvXNAX8cIicXkzDemBq+W2FdROKUxngMdrhM5szp9gUwr6q6JLOVdaS6ueEHX2/4
 M8QPEaVu018E0/wVUeGsHR8fOzFnW34TSL48m8Aczy8HdpSPwWTvd4N8swWt7n77WPX0c5BkB+e
 Q4s+ndcRHF1FL2rMYL7jAaiEZWjvZfdkDnuakCpwpSRhj0oL0kmCKawIdb7Y8QXbuEsq9JWaz70
 TXaC/c8XcyDoXX/tZ6g==
X-Proofpoint-ORIG-GUID: UnhyU6qG0wPZHJRQ-QKkEHPGAWFMD5B1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240074

On 7/24/26 7:08 AM, Pavan Kumar wrote:
> Enable the IPA block and provide the firmware name
> required for firmware loading on qcm6490-idp.
> 
> Signed-off-by: Pavan Kumar <pavan.m@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
