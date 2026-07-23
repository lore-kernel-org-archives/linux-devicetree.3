Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F48440A34
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808032; cv=none; b=fz+ieE5h0dS94vdrvke9VIl+qs68TAnLW3l9v8LLl81TiF8xLaJlnZW1QELNi7HupWuX9T2JdOJc+n1xZVcaC4E3scuOEaoMacI3iVyJy3Ivz3yd/JczpRZwBoBEGMExsd985SMy0zlfnHPQ0qljY1Pq5O65w/A3/J3iNF7ODYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808032; c=relaxed/simple;
	bh=ASZ5ohN5yTy18gTwjj32uTj76XxMTu8kKaZjkY0YGlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aj85x47HY2b0pnMmNAxoEhfJGpDTJJPfj7fcDwAGda1qzw3aC2rmleuos21t9Q1m5f0i0w2iWpteFUuuYIHeFxn+nojQaZL/OAFnDcEPIZTNrwlIE1fGDi4qB86zdBs29TlQOA7NeS+Q9up5oV/e9os/rJ6en7bvKb5iDpHwoHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFHKGniF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NgwUObjH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFHKGniF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NgwUObjH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qa403668003
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZ09E1o1UpWUHsx21y+X247Kk7xKrNwhco5CftwYIBY=; b=CFHKGniFpOMeFwy7
	yxYXC4PkXts/zp/F2RN0nu6eRVB5cPisjXTPjmh8CDEJkeLhoMQUIx7gvK5RVjC5
	qR5j5ughCuGka/SQI1HP3G6zV3ByCqqZbytkOr01iiusi6t/Tj9KwlHECKjMXgB9
	i0M7cQ7smTOacl5pG8Rl6ZiS3Vpra2bUPHJlTN8mgLumwC6NC22Xo8kRTecFHO/Z
	ceDoxPaT/4LG8C6XxPiNTNB5BoK5JJzshhpw0EVUftNPvUv4MKbz7F5zAktvK94L
	258de8AxvCYYoIHu9IskaHmJ8UQZ4GC+nHFOTCySMw1TwQ/t4La5M6GRnBQbQ56D
	E590Hw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc32es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:00:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so1876911cf.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784808028; x=1785412828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZ09E1o1UpWUHsx21y+X247Kk7xKrNwhco5CftwYIBY=;
        b=NgwUObjHWRzIVZQRiL5P9985HmDXwhh4IXImqG/PrCjgfy1WCXLVwrsTuejhafSkCW
         yC+uLYhPzX5f62q958ONnXwvuioUh5arMv8TjEbU08QpT+PjewAjcm2h024tydJKvj6U
         eEGudwaIxG1nNZ1AV3ntHVDVcQyugDuRmEUeagENbGueNBSH8BbcPy+CTPRCws4246tL
         4BCAgG30oTMwLATcaRUtVWz9oxNfzhfqSmn7oFkrDGH/Od+bVrUxyvWOL81CNKUdlzrg
         qOLxurSwM2SwVP3iZHTCNtOphZUe7FBOe453rkQJPueDVca93Id61Tnhsp18HRqcAYS9
         DIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808028; x=1785412828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZ09E1o1UpWUHsx21y+X247Kk7xKrNwhco5CftwYIBY=;
        b=jH3+bMFTlEtXBTe4I+NfSZDQArvotU+29zjxrmOW6L4tc6HvDn8QhqjxFngCt4FXow
         pN3rQ0lRJCN9AC2JBCpPJ2aWNRPXyqGAw63avdJbWAZeckhyEa06XsBb7UjRClk+WUf6
         LIoS9gNe0AUbe+oPzHzfKPtVJLzGt+NzGy2vT+sAftPOlYRAHO5G8TtLxIoIF600qCbq
         zgOP3VEPcNQAtF4JsxR6Y1WdX/TDMX+9cUXnkHqTldwUIyu5v3Nl7sF8Vb9aA3ATMC7y
         KmL+uW8FPYw/TFLy9LqIsyMuUHLwCyUzeIsEpwlzPA5+xrETURDa4VlRmAPISBMv6H+x
         kPmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGXVf1s4Usmg731sA/3xCBuQIRDDoFw0NfFFXsNjWPh1N7gn+cSVeaKmSJMZpJ+YpxXR9CXS8qJU9O@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgmgvu72jPMJDBfJfi5cjMvO2/1Q1XbYwV/Iu+yoCaZGdUywfi
	78znTlwHD7EgN9Qm+pg5likRj4pTlz66FoqolaO2C0GiA5IyPFth88fW04QRDamQsKjbeg8s3cb
	6/JNTLv8rqj0TTetvX8/bEN6V4lO4eTIan9Gbzp0YkpY5C6OMZ36B5BGgprAl4Pdu
X-Gm-Gg: AR+sD10MjH06bcLoGGLvIvanuOSgkYEGgU6k3FCv0mTPKa2QR8+IVUx3p9izTE7+8lB
	4sSJRK+G8auoBTQO7n6tjBvK2impbtrp/HU2PjkWd3y3OMAQq0xdTvERSXhfPmFCyvtUTy7a+b2
	VMoWszeXEMM1an8KevL1045OVhfXvKKVOU6YpgZoduHWqH84+2Gt0d2MV5b2B6hmyX61AQl6lyj
	3wH/L1c5RLwicte3woV7rghVd/43NqlUYKCxkTuuh9MHzcQqVez28zKQM91+He8umYeO9BOdquG
	wW4gIePfCaWy6ynccX7YPtBFP06BgLwmF3pkM1Q0TG8bsHuxJW27fw32jRoT+tD0lpmcVvduw0R
	mnrzDO5QiCLkrdXBpw2KLhlaJ
X-Received: by 2002:a05:622a:1f0e:b0:517:6162:daf5 with SMTP id d75a77b69052e-528470df736mr1838331cf.3.1784808027416;
        Thu, 23 Jul 2026 05:00:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0e:b0:517:6162:daf5 with SMTP id d75a77b69052e-528470df736mr1837651cf.3.1784808026841;
        Thu, 23 Jul 2026 05:00:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af243fsm226702966b.26.2026.07.23.05.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:00:26 -0700 (PDT)
Message-ID: <51e3ac48-d062-45bd-b20f-c3fe29e43aac@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:00:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: initial MSM8920 and Motorola
 Moto E4 (perry)
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Catherine Frederick <serenity@floorchan.org>,
        linux-clk@vger.kernel.org, Aneesh Pradhan <aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723014627.63310-1-aneeshpradhan@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fj2wXR7K1QLwqT2cGGd4JH6PBZ9FNc2G
X-Proofpoint-GUID: fj2wXR7K1QLwqT2cGGd4JH6PBZ9FNc2G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX8JJjn0mQRJcn
 L8fhVjYl3sZaa00WAylIB6/P8oVkvMl6whXLywwl/X4CmKZf13NACyT0dOiFdV9lFwpjZ1+sy17
 ztwppsq+qBVXLiZ98euZt+3Fzbz7a84=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a62025c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=hLbMPmW5DWU4JABURqAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX+wBhWz8pZW+p
 CcXKIk3oZvEwJEhAK8Jhm3h33vaVMaw9yganEE+RGe23lb1t2dP/KWQvcaK2Alm5qm/Tfa0z4id
 nLo1fss/S7zKMmTsjrYBuUQUmX6C/0LIqWQ7YH3d5DqkG9OyaWg429HoH6s2eSOnmDOfFQqc2v8
 27S8lVBjwdVbLP1nv8mkPokg6gYLcomm4zWK9FBcZaTFmpDlGbAVI/I83rByCc6/4CJzuqHTAS8
 01edyXNelB0qyRxQuTXuTUHDYrlhwqhtWwTLorA3T5dtPqnYrXW0WHNtpDvPgFOGxATWuDPGADL
 e9sO4um3qsJtqJ1gsWCwOzsCos2aX/RMIyDZ3TvQVNGWKXJbN92kGPYRLxq1oJnK8BgGU/SfvuR
 Bz11y1N6om0SfrBLDJltZCG25yztzS3ZL4LpogGNC+rMQLKzTo+bajlPvKpI3FLrkz8BnXv76JU
 JBwhoKvt+2b07pyjznQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230118

On 7/23/26 3:46 AM, Aneesh Pradhan wrote:
> Initial upstream support for MSM8920 and the Motorola Moto E4 (perry).
> 
> Depends on the separate qcom,rpmcc-msm8920 clk series (binding +
> clk-smd-rpm) for the MSM8920 rpmcc compatible used by msm8920.dtsi.
> 
> This is a trimmed mainline-first subset of msm89x7-mainline/linux#48,
> rewritten so every phandle exists on qcom/for-next's msm8917 / pm8937 /
> pmi8950 (the fork DT assumed richer SoC/PMIC nodes that are not
> upstream yet).
> 
> Included: regulators, eMMC/SD, USB OTG (gpio-id extcon), keys, RMI4
> touch + reset-gpios, BMA253 (i2c-gpio), WCNSS (wcn3660b), PMI8950 WLED.
> Deferred follow-ups: DSI panel, IPA, QDSP6 audio, FG/smbcharger, modem.
> 
> DTB build verified: msm8917-motorola-perry.dtb + msm8920-motorola-perry.dtb.

Please send all series as separate threads and all revisions as separate
threads too. You can use the b4 tool [1] which takes care of that and a
couple other annoyances

Konrad

[1] https://b4.docs.kernel.org/en/latest/
