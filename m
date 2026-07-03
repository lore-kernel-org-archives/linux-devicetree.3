Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F793B2D1A
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075925; cv=none; b=UZ92WH3W+C/Fe7l+tnKiw21jkWyImRF4uXEI+aUB+L7+xOHYwsmBnNy2O15hGp2Lq+LqsU27tKblt5yOdkiv8pLLiwOxv5uIXVDjiAaAQJPmUhF1Ba6S8zGeriiHztf2BKXo72rUdb1N+DpnwA+b970JqaPxaDz71t5Y1h/DhK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075925; c=relaxed/simple;
	bh=xwO3YwLdpt0ZtZZS2qczyw+exgxev8bh0799Xrk0ags=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TSZKVZ+GBgzmP9z66m9ZpMegxQDD07Ge1CImydHuOkUXMrm6Vut57MtJSOyK8shGLLsD2Nlyo6kZnACg0VV5LbMv886vKSk4JgtqtoNCkASkAFZAauZvyuVNI8eIdDHwDaFA6eaqrX/1NubI+em6F58RHc1BxLPYRJY7RQ9bEsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UE3vIlnW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BszmisAn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UE3vIlnW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BszmisAn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s4GM3110449
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 10:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgYvglaMrg+U1E+P+K00rNahNQw7AipRBkSiHE2CkC4=; b=UE3vIlnWFaUmla5c
	xXWqoIup1/FJaC+J+YPhp+WvVhtroIV/dol24s46yJYZBqs3oELdnjET3fYF0YrY
	hNtuPOxp63PoUzqZbua/gd48LgHc8btvDHp/5QMHxaryTLswvbIB1Yg6BZ3Vk1fr
	OBPF8nMqN19URLIfdXcbEIxNfeMpXTpOQazyyFCttX3XzPNojfnwrYYV0sGa9wdy
	E35Cs2HVjAbAEy9aIKaP/yjxB5jOjnX1llhoRqQ6DPeF5Ch3+SUvWUiM8NJUEqyp
	qFKbsM4DY43bftV8XR7Wnv+U4DKKhu3zKNWKvgKF88FD+KmP4cB33+K6bjou9laK
	xlXVKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eyamb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:52:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c2d2dd52eso655961cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783075922; x=1783680722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgYvglaMrg+U1E+P+K00rNahNQw7AipRBkSiHE2CkC4=;
        b=BszmisAneIoAKE2bYyySmWtHavMYZe/duPeaL+SZxHQfgoBaXabTGEx2VZbGPY+iaU
         aPe7zoAvDIVEDNx1n+TLUcClxSpHAWiFtOkknbnLxXuQhhk45ZPI9wv0UIXntcYR7256
         8vwrnvvK3AO18QHjkxd2ux0Ka/aQDFf+JFKcH8EsOHnkuvbpsoomdVMy0voDBU081CA6
         GMquWjyO57qRXrRv3zWzhgOznLmG2maNd6UTk3L0nXbr1PutOIoR3ZVYopaR4eEksq46
         aoAV/VYt+dWghTa8Zco4/oDS0scSNrMc60AIdhb8q1BI7H40PqzGaY+HSBMhnCgnko+n
         E/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783075922; x=1783680722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgYvglaMrg+U1E+P+K00rNahNQw7AipRBkSiHE2CkC4=;
        b=jGawex5eNPDXzdp6Sr1zyJFraRo1+FcQrLu5uQb7eKZG2Ex9Ov8ZnRu1V7IvKL86nu
         9uFuHWvhYFJ747dY19PMUW+bYVLNwm/2AOfG6ZzHGz0/3S3wk9bhuVaiKclhZPzjyc5U
         STUYJgzuvkigyHg8Bkv8n9+gcp6zhzM9S7ylB+AWUQOpOST6L1hdUM7Y3mhMdCd35cSl
         ZXXwEw0w6ey+ztQTSZocmCdIV1L9+VLg43GYqaS2e/lG1zHQgLJxGDjBYYgZ/tJAjCda
         qaVidKfj1UbOBEGV5/Xg8L95giJzAPhihLCUzFwQPMxP6bqCf6HxM6XnVBnZ5i26rYbY
         isGA==
X-Forwarded-Encrypted: i=1; AFNElJ/AMc756Zf+54o312xiIicFBuiKCWZQCVvSUM3NyaDJkahZWZGJF/cgZ6fL57zrE6wAeKgOoKOalgut@vger.kernel.org
X-Gm-Message-State: AOJu0YzMNus2c9UiOdBKH9qQhiXngKaynUpNmwafMv0/xFliD699uLqh
	yiE8KFM6ckbDg2zVFWdAaHNq0s9b+BLqi+LtbKslyFqale14IcH3PCaE0hwhDdOXyjWhevSJFM/
	cMhaWQOpEq3jlh09e5b3Cf5eZJ+MwB8wgv18PWkU/gz/Tqw2jrhm4eleinx6RBiIn/alWOfQN
X-Gm-Gg: AfdE7cki/YXxnvSyRCgu2gHYmuMJmL/om95h45xo8NlZfKTMqkLo0dZ+qRyBxOVcR2J
	nUAsJb7bj0bBypeu5PTP1xj48AA2xbjDdhkIYOXytVns/NeFBOBZsYZ3Ea2wL4qrFrcyDwh9utw
	o28c/yoI5bFa47FC7hlNn217EZ++VkUHbb6HDLgp+3LApuF5iLU1JOwFu20DNB8HjTdc9gJSQy3
	PpiAAnPUzoLvGgviS++I2SfT9/w55hfEUfnEpwLrDx2zjEOa5GNQP786HryRRLbmnqETcmce8DO
	lDNRY4pWefp2v9ExJlwK1rlyJyrKfi3yjtKXguH7aoMEWOwnGHVWMQt0FdyCEwtTOejLmRFf/gD
	jt1Re9yZjcpc0+d2HHxOpapcQ4hnAoR9l6WM=
X-Received: by 2002:a05:622a:118a:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c26a55a4dmr96352311cf.2.1783075922264;
        Fri, 03 Jul 2026 03:52:02 -0700 (PDT)
X-Received: by 2002:a05:622a:118a:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c26a55a4dmr96352131cf.2.1783075921914;
        Fri, 03 Jul 2026 03:52:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6093786sm269939366b.20.2026.07.03.03.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:52:01 -0700 (PDT)
Message-ID: <84d2f764-3757-4d25-80e4-50a0b36c0c2e@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:51:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
To: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX+o5SCpNBm8AX
 MnZkZN9knLYYumISycm/teaVJ1uqnSSPvV6+kFPZhObbGmGmBgBJGLm5fKdd1lZlr0/YQizG323
 olF63E10t2iTo96zFsAY3NE+gxC/9MRicxxGjLXuBXohYin9IszR13c5pSkVbmayAhSi6VrtazB
 rF4deRb3G/CnEatEsXvN3lrHByuN/i9hX4kvs8gQ1yOZRQP3eCtDgvIa2ODqCBVzE0K42UVSSg8
 mPsgenW7ojUVBPwpwG4vO3Erv1ykPIAf9rZF91xI9pggCcTichzLP30VB/1ZZcm2pJjyZi3/wpn
 t8D4sti78OvmwmqRYhQXnBB7q664EbbExtnyf893HHiG6/whMhECOBIHVZ55EImh56yZpAWvogI
 SWahf38wDKOWb+nE8w45DtdsL3D6ysYeKWNR2n5jdAxKPOoGtFa0mFTfP3n0Qy4mm72f7MquzaV
 def0MyPMoDQn4enbwhw==
X-Proofpoint-GUID: kIUdEbS41Xso-IvHeXEuQccLBqv7dpXp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX6CXsVbaDw7hR
 iATsiFTWwHR6biH4k1fr0CZ0KGmBIVbvvTC0bMJt6rABJfzD5EeT5phwJAuH+IsG1JV5WxABoKl
 DdtuJz6jd3olx+2/iGfrpF8O9cSE0ag=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a479452 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O4NR3KnNvlTAEidytREA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: kIUdEbS41Xso-IvHeXEuQccLBqv7dpXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030105

On 7/3/26 10:58 AM, Sarat Addepalli wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> The qcom,gsi-loader and memory-region properties are provided by
> kodiak.dtsi as part of the IPA property consolidation work, so only
> the board-specific firmware-name and status properties need to be set.
> 
> Link: https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/

The link and the paragraph above have no business being in the commit
message, because at the time of applying this patch, the referenced
patchset would have already been merged.

Konrad
