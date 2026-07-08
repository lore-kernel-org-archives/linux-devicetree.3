Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61016439335
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523576; cv=none; b=UPusNC1V5huUg+kS0pp1454n0DCWicHyEyB2UI508SNVjNhpydyUfP8xjVbajVh0krILlO/yxlGTMYkYhcX4UGEj9iP1FMiyrU+3w+fj/FEmoQPhlBrw8wylahvj5fZon+rV9n3nSR8OnhB+7NBgNdyvZ9gsZHNjdLZ7Xu70o7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523576; c=relaxed/simple;
	bh=ml9OKoKuvQkNMDPzlm2vusWghZV3h8XcdIJnFruorv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJ55Huj6WBOfaabhKsVMLxw1bAZUCdxVgv7Wu9uALKykXqh2DpVXo3afevhUK/CqPNAbbPzhhm54L5FAFy7VoOxDubr1mYHnJtcBB2XvbdngVTpCfkOHeNCzVvrlkqA0sV5vD7rtN5Ifx7Q93prdYZjCvr5vtZSkpJI/Hi7QCMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SR4vaGtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+bnk+lV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SR4vaGtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+bnk+lV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3h5C2580093
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ei9xdawI96PONiMmH3UZ2A8JF/Q0FwZz4uqQVshS5TE=; b=SR4vaGtbf3vX4rSq
	fn37ykWmBrNySEn06BWaqawzc0g+MyRrpMUz7J28BissuCYOAUZWBNngw6PfSS8n
	nw3wXw46n1XFMd6bbMyBMHU++iFo2e1MSxGd75pHlqJKIzMZmtYFI2gQHGGyxD0t
	EhOvxyqbVzpCf9Ahu1ntBzFmpfBCmpZeeU4EjpD0E7IVs4yJvYfQdG/mr4UctTN1
	tnyUlkdHE2dn6Xny08YtXIiCoA208d0Hv1QHoJM3RtJQ/DDjKf6h1DQ3PW+e+xxn
	KRElN0EU1UPqe8OT9KB/AKefy+WJXKQPuMG59CJaQbJKWZwzouCElRtpMNi+7L6t
	jvimzQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gbd1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:12:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1240135a91.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523573; x=1784128373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ei9xdawI96PONiMmH3UZ2A8JF/Q0FwZz4uqQVshS5TE=;
        b=d+bnk+lVqH68dvS1HfZIwbK7Gs/1GaogrgEXg6V5/2usyaHLTBEEopfvvpNxYpD72C
         u0QpImAvlUPrmGi+0F8mNE65q9J6QGAXE3cxnXDweXkxj5npPJcsX7xYXKmcAi9YD9qA
         cThAWD4n9L3UmJj/Re/Dk3Z0gCklRfmpo/SBicLA+b6LuneEjDeAj0uihRQ34XzGiC+G
         CtwNBKlVb3CFBFOD1R1O17UprOTOL+Ra4WVNwsC4rRYA/v8iaAo/p3HU1Bh45QQVBt5/
         tgLI/BJgA8P5J4A8iFPD8U/xXe1obO4lOLXY/x8AAGsTpaE81ifSJgFfBLJD443pxo7e
         B5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523573; x=1784128373;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ei9xdawI96PONiMmH3UZ2A8JF/Q0FwZz4uqQVshS5TE=;
        b=nhnhIAKXQRxrdv60kLCDyDabYJN6w7aYnUCKMVMGVs4dVxTVenE5YsBSKxBhyMvy96
         rd+rek7N5+PbbixBev59VBkV19n0AI7O466AnuAfU2l0fK8Nnt8Oh+iWdWU/L5IZWcVe
         uWOLHpZib+9ZwDuA0sOamNTRFIDRGYSGJqrJiF/lMhqG82+Uo6vSJkQeVZhEA5YhtXLP
         SlrF9YCFgkcYyIcb5TQTlXzVeb49MAxl6C+smNBAHgmPmr+W4xI3O4GsyGCvCoE92bV8
         9Q4xWRINZcKxFLQdgfuw4B1Cs1aWlNPU22zWjilyF/AR++qqtoSzEEEYmbDGzF+jiizt
         l6jQ==
X-Forwarded-Encrypted: i=1; AHgh+RqN5NPLKNZVKajUVEy+Zm8Q7j1w9uJd1CJN6DvjGpuZDNUMZ5Od8n7xux+0STYopPh6X7mtaOdBotaF@vger.kernel.org
X-Gm-Message-State: AOJu0YwUoiJrOle511ViZ+lJ6Ja4eTGsNooh+bo+dHEgCywnKwsvuWPY
	H1I0tJ/nCH+4eUaPF0MnqdoB9Vv3HbR4QXh2zQooe2J4WAkOSQ5eOjOsQGj4MGwB2bd5/q6duSf
	FLYHOvCh+fva5pgX4EQ5eqvgUQnfgNAHAXu85HH097a+b63l/Y8uCHTPSz30w3pY2
X-Gm-Gg: AfdE7clW04gbk46EWSuoeZV7kMc9nQffNi1rkddTdULKObf/NPZssfBrxTm7cra4y1d
	1ljS2rKKZzi/guZYT1rX62Kw0cOSEdwXnx57VMzv9j49TpFLIEPYUgfBU2jBuYBdWQFCwaPf41A
	Zp40HtFWatYoI+SOvinLhYTmNHGPeL7Gbx1roEje0tdq2PsKksB1i+YlY2WKRMC2LzA2fEq9VHw
	m6Ao4VYKKUh8aRZAdKtEanGp1nyKOagRYXtIEj7sL7J7zJJ6zjMHUD3QTjRWbgmw6iME8IuVNZ2
	FZ4khvcsGOYYB+yHHdhVSg6IhcaRANjPw35bMvQ2L3pCsOFCjQ+LTdbeXVG12enbhpnY6RknvXu
	qwexHI1+UWi6UTm89p+Jo3cRk5eI0xdvPzgbwnwmcryozVxFQqnFRYscc4/HNEc5CVAxDDt+9nu
	ApFA==
X-Received: by 2002:a17:90b:2709:b0:387:e0db:3d88 with SMTP id 98e67ed59e1d1-389434634ebmr2919956a91.35.1783523573378;
        Wed, 08 Jul 2026 08:12:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2709:b0:387:e0db:3d88 with SMTP id 98e67ed59e1d1-389434634ebmr2919927a91.35.1783523572957;
        Wed, 08 Jul 2026 08:12:52 -0700 (PDT)
Received: from ?IPV6:2409:4091:c00d:4a15:d9c4:b604:397e:f06e? ([2409:4091:c00d:4a15:d9c4:b604:397e:f06e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm22125489eec.16.2026.07.08.08.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:12:52 -0700 (PDT)
Message-ID: <b0e727ff-a6a5-4474-a045-e946edb15276@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:42:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add LPM stats support for
 subsystems
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
 <0c6fde07-990a-4c0d-b1f4-34cc61d905a5@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <0c6fde07-990a-4c0d-b1f4-34cc61d905a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXwFiRbHZMuZTs
 vdVDwVdtub2gmxaCodw21Q86K1ROPbLC35GTwsqqrrFzJnDG6jHWs/3PAGykEqB4y+M6vYl1DrG
 2xvnuaYMAFR0S2hpEIAlrzov9/iZK9A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX1Xz9ugpyje9o
 JU5NrOdxw+0W+hAVybGFlLJvLu4xZSFNOWXjHN4+j630czlAkPrWhFlXmOLsEhahPENQCE/TYFa
 oVEaiMxj8n4Tyjff8Kb1EYYW4bhkTL9zMik6vvkVIkY3vZIGKNkRSrI47x3++Edh3HmsWYr29UB
 hpvA5US98a2Crs3VZ0CXFtwoSprh01iUGUMUYlNc8XHvpEDQkFtD2WyCHTz8E4RJdfXX3iwHvZM
 MpySS5eAYwmzq83TtoczXMPF8bYbG3jjbCiutk1GTaKqV0ugkNoWtLr3weXopEMIHT3Lwx00ykA
 kNZ7/q62LJlYoq1UKBd2F9Uxh3vs2swytFoqOawZqRDVYrS475eMrnTF1Ndjnd7fNwECr+Kpz9D
 BXRLJxoTtQFVrZiPdVmxdOAlt0EWoCbyDdogV5HsLRSV7ky6Wd6QRxD11N14L0xhtrsfgwlYviP
 Zk3CCbRiGJNZQnfClXw==
X-Proofpoint-ORIG-GUID: 8xcEVK2P91yr8trN2yPogm_xrzffMOSY
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e68f6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=y0HZvo5VsPpfka8ii9AA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8xcEVK2P91yr8trN2yPogm_xrzffMOSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080150



On 06-Jul-26 3:19 PM, Konrad Dybcio wrote:
> On 7/3/26 1:13 PM, Sneh Mankad wrote:
>> Add support to display subsystem level LPM stats for shikra.
> 
> Explain the problem and why you're changing the compatible.
> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Understood Konrad, will add the explanation in v2.

Thanks,
Sneh

