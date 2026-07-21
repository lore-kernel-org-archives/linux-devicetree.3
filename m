Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD194DB54B
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647413; cv=none; b=cQ+Bmpl45dbuXEQ5wuP4qYt3SXwn0NuCChQKZbkwa3OrefGJNkTlUJGlqxWD2GCkPWgptjzf020oyh4V5BcpOWr4xKo4WSoOnvSAbqTD+t3YTSBq2rBqKWLWp581eDArbA+8B9KxhkNnEAVdWsd/0XktU51mxNO2NHV2/zlOaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647413; c=relaxed/simple;
	bh=v90sHJ6tSvZo90Ujotd1C6DTyFO/ubjSh/heL5pqGqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7xoiGoMg4CaJlFutH6JJeKW9m0e/XRB1TXXxFbcPgfv0W4BGINionqv0nmSAVYAz9GOadhvCicGUDl7HtuwZ4D73xXtBWX+q4i8+AnYvD8GGlZJvkm5JczkVJCOf2KKrL7IasCo/+edtMj59VnzpbD+SitFhyJ83kEV5kMM9yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HFm4TJx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnLz9F6F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HFm4TJx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnLz9F6F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg2Ii1841395
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o44HsitTxFl4RRHhM8X0Bo7+DeaSzkF2BvOXpNUOwQI=; b=HFm4TJx+QKjj1CSB
	4ct/yXVRXXthkbIERC85JMEEFdrBD1yy6CVEiEEL6qLdpWx8cgD2TYW/biPORTqc
	fMJnsg+W1Ijxjp5koysP/xXJLirTug496fuu2PU3317snbCsr/3W0Ex8opnY5RHW
	0yd5iv+IiKzE33yF5PN1FnAzdFHdZPa36lrhHNgaQLJ3xnALgqYk4lVckrMVbAbc
	Y9T4U1kGWa6NGt58bMs9s4Ck8A3pF5490jhEc6TH3/GBoaxWcN3VZAATCH4L0Ve7
	pHQ57aDeQ+0/hMhIQbe3gdbJIZ8Pupi5c4Wd3yhwUd65WGYm9GNv9az+nbtlEUvk
	dkyFDg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se30ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:23:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc86a9ef97so246609615ad.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784647410; x=1785252210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o44HsitTxFl4RRHhM8X0Bo7+DeaSzkF2BvOXpNUOwQI=;
        b=jnLz9F6FGoiqck792dZ53/X/8l8aBajl6oY7PveVl4/rGQ2LHNK1b7gHCRo6qbZY+n
         9GbmMwFuGqFj1Se7WW5s975LJj5QRCz1QcWUpFhKQOr16YbJuzpdEVpeKnkkZCWY/XWD
         YJLt1vTnks/fkdUdEOEQ1Ky4WTq/BpPvZZibFc1y9JukF00mjvMtGx2yeuH8eRAQ2lAw
         w0yrDstain8C4PUyMEX7PKg5efEcU/wmHc9NUHrD1IgQXfQUL4Pi3ENSLyUDASFT7/09
         TrJ0J4jhansIz9/FL2J7EInWtf5+Q0zODmJ+IqVtcLb/WJSkXot8zP7VDdVxd0BEdHl2
         Z/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647410; x=1785252210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o44HsitTxFl4RRHhM8X0Bo7+DeaSzkF2BvOXpNUOwQI=;
        b=N60D2C7Leiajn9qcf+sNgbxuL6EKZMqCzbweL/DCRAtmPtIxUMhN8zb0+F4j3MB4BR
         73OfNI+saGA0ry8BE4pZLEAbGJ0qPDuRuyF/X9iovQcD/4M+yR3LJq6HCwsaPe7+L3vK
         7OQrwRzDlUqsVssdAcT+GOjiqqASKabFTkn5vUdSmEI8fp8ULOC04fodoFOCxSXuwkHk
         Rlm+1AMUmcpiHh+0x36rrKU3bfdvOcNOlDe7GBDjjXCqBfmEg4fiDvHPae2HtNUbT4Ao
         ncA6CO3stmymD5+jHTUzJb1xo38aexBpz2xs1GVLXncQu66FT4HVs2xfkZUo3GmfBHvF
         ZYmA==
X-Forwarded-Encrypted: i=1; AHgh+RrTLG70CC8UsyVesZAFXSJcGSnIwLd7B1buh02/q/iS3R3vxmLtzA2ClVSatzs7kb2iDbXMcriV+D4i@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0jGcQDcuQWDkOX3KIFVebaow1KaQzy+ABxDOjEA/CgtSFmp87
	RVOxCx4r9W8dYj4LVN6iT/iVzyZaYEF/WhEUDVzhG/YSZy4VvCANR5ltKn1L/fvE6XWFt6Nw0ID
	N+CQgmHuP67nRl4X70iRmhrYbOr6EacuZWUacouvZ0fyEITp1NhhKt05hXKUTm5lp
X-Gm-Gg: AR+sD10A/ArdCVkUKBuqTFbyejGvy4xzwgdkDm4EUuZNbxbHmjcpvTy5m3EK0VTGmI5
	6IAkbFH0dswg+X6/EMd0j1A9Rp9zwspfcDWsbfpdhYPNl8P7pBBkhlv5gKFtuh4ANSlOlulx8zO
	+otxx/Co3q4zPiN21fen3umUZhBzO4CJChWSZt/js3IGRb8OZp2n8XQTueRPfs02R18FhPLFwT2
	MowHhoDkWYN1qbHawSR1GmSgYxxmSVaKTtCWsn5X7Ods5Qzdql1FwrdHGYh021f60j2n3K2oH+m
	IvIT0KZ1acwemvhiYembyfQj1UXYq/bWsoWl1YYFFI55FuvjhoBg1nYYIO8dfL1X85XA/fwWoxK
	/V+peXyxqRRE7Dp6UxuJIdl5Iy9q0r/mq
X-Received: by 2002:a17:903:8c8:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cf34861177mr182590155ad.14.1784647410311;
        Tue, 21 Jul 2026 08:23:30 -0700 (PDT)
X-Received: by 2002:a17:903:8c8:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cf34861177mr182589805ad.14.1784647409863;
        Tue, 21 Jul 2026 08:23:29 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm117450eec.7.2026.07.21.08.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:23:29 -0700 (PDT)
Message-ID: <79df1c94-bbaf-41a9-8f3c-0f83302cbfeb@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 20:53:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/18] media: iris: implement support for the Agatti
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-14-76af9dd4d1f6@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-14-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R6N1AtvbRJB4hfwa5oFrFOAMdF8qIx7w
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f8ef3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2sUm10EWjrca5FkrqogA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX1gyklzP2Z8Ia
 HZ76NYAcYbARHStFcugdGR5tHsTUVuLTAV0xAJU48QLlvH+Mi77BnkPjuvXD++lrpFI9An9AcHt
 KukbiC4q2njDdmzWGmjhs8G0EtIpLLo=
X-Proofpoint-GUID: R6N1AtvbRJB4hfwa5oFrFOAMdF8qIx7w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfXwvQpeznG7Peg
 btMvlYCZ/hIiKEM18+AOwbXKU2BOuUB5+gRzaqtg0HkHaqyuRWn8YWsfdx3VTCpb/suAlbth3xZ
 ulTV0ysFrqDJLvpSFuxSlzFVIF3PRIU6vet5xfe3vnr2+TG0QSXNcTLZ+CjUHySd6etr1f64ZEx
 MRGlYWBFjagSxXWkDcgQLT002EfnXD1+ztmMpo7pkEFhicl2NzAypwuo7BNU9hBXvw80txn8EMi
 slwQm2ewpEokaARrhHtYW/PtALVzJczhglCJZbCjEn1aB4i7WqitWsMXQuxw8Hq73s4iAYS/fIj
 TRdsjwViWBuAl5xSj85ueFNyekzEE9nx266yHHF1rMz8olr8uyjtvvWzHSANMalGYOYqpF9S/ki
 3wxVjfi1JUiJCP3mBx6IlatxE+tRROYLAIxoNoBLPuPo8HUTwtw3GsnjZvpbJkb3WLcIy+WHCC/
 T6lMIAmbUtZw2I+JhOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210163



On 7/9/2026 7:12 PM, Dmitry Baryshkov wrote:
> Port support for the AR50Lt video codec core (present for example on the
> Agatti platform) to the Iris driver. Unlike more recent cores this
> generation doesn't have the PIPE property (as it always has only one
> pipe). Also, unlike newer platforms, buffer sizes are requested from the
> firmware instead of being calculated by the driver.
> 
> Co-developed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 241 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |   7 +
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +
>   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 110 ++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |   5 +
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
>   8 files changed, 375 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
