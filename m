Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549954;
	b=g2TRDhQkB2pY23Vmfk0aRRqhjr8zqchRQyY70BkwRI0S1UOiImpQCmDeoiwYykcSv+k4
	 Yqcx4Ta2tYM18DwE00HmZPrdb6EZ7eSXePaoYIKaS3CEHGbbM2p6mLGRGplKLpP6KaEC2
	 Gj/QsIpXpwVR+FGzWmF903rnZ8G6qeAhDp4TSkjyC09tKhcWX21NFfZlIRcH+Fg35PqN9
	 H896wPuIcGygFs6GFfCklYS8FlfNWj/Foj/EeEK93mw7v3DN8kotu+xOWGPdvIKicGUHx
	 hNLuo6XFhQ/MxNLg3/ruvjrKCbCq0t+wmhuz0YhN+cMQyaMfDHL143uonReF1RvqNlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cZb/Vxwnk5i0rmxVkJY09IQ9GprsoSJqpVPX6mlp4WM=;
	b=WNemh4Q3mxTO0KHrSy1dApSa3jl2T1vdnDFzD4jD6bMbP9wXPlUhsPp+bAqgqUryXR46
	 OfGIYDTfhwgyU06HNV9Iqj695kRr+BQBbVrpyymjTpE6kCQcJsV0/4z7K9qEgV3oPo54H
	 /CavfS/R63eSRLaIldIuPSqmfmw4rYB7tYAjiHfiAj/m6PCKXgE0nkG984MjtlnVM2w44
	 Z++vd3m37FRoaAdHhslXJSOrGlYQdY3PjW63o3Nkcd7kqi//ifL0KIAH/MQ4b1kNI5c+j
	 jT1VzyzA5j/n8gD4YkyMoml9Q5WkTcw73fADc/C8XfRNRd6AL90WqxEGkxY+ya+ZfSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iK5azXCa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hXftB4QS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCF1606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCF1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iK5azXCa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hXftB4QS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57ABO3615976
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZb/Vxwnk5i0rmxVkJY09IQ9GprsoSJqpVPX6mlp4WM=; b=iK5azXCaJCPVKurd
	A7xRECXm0jzpDgcuH80i7qEzkJ7G+JTaA4JQYjvGRyI9ZSzyJAzM03I2YFwqa6Ev
	tJOpFb/iNmI84HoIuZtTxB40VdSKYw8sOAhFEK0AlLx58jn0Rm5cgT4jkqMapCdU
	ayrNZcr2E99ePIQlJCslG79aTFGJZs0X1i0IDselNteMjcEgzCIIO567bF3YlxtU
	aPREa1BJZeKzb9ZWKP6iZH+xBvYOqNg8AFPZO7rFFM8v6t8IAcmXSREsRxKRrgWl
	f8bC8w9UeMCJALc8hu6251nAFUbnFZ7lEnkqWBL5AV0eiMvRoMI/w31e7vwwhhgS
	NsP7Og==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ajdtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:05:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb96533adfso310790a12.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794549952; x=1795154752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZb/Vxwnk5i0rmxVkJY09IQ9GprsoSJqpVPX6mlp4WM=;
        b=hXftB4QSht9xpJ89SXCviGvdvOpwclS9Mw2uQIMzkuZecPVHZWMii7GhM9JJuDFHnm
         1T6Ne/m+zfXqdilaULdUrrtVx24pChfRZcv5wJnDSUxEk+ljHpp7FLP8zurddicv1zk3
         GOpXElDGm8xqyUuQ6Gl4h2bIdDS79fs6K/Ri8Toa/cSXy+4+l7nkslRrHLOzdkhmnSva
         WFp8+PCuMb+IJngNOKEbJCvnxH3NZXg6Abt2y3l1xMOL7LEKDEtHc+dDmQfxjD2LJ7jY
         kIAHgodHO/ls+Cu06QT6xfOOmQpXG1pdLJGHgyxO1bMF11Ajshm/VReFiyG24BbGRV9s
         04Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794549952; x=1795154752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZb/Vxwnk5i0rmxVkJY09IQ9GprsoSJqpVPX6mlp4WM=;
        b=cA7GvTMzaqOtGrPRkX2ZPdD/2DpojRZyQX133zSN2rphTFqag/jkZiZw5+fSJzo7au
         JPlQHmTltr6xNNyuuFQkDI3SxqjZ8mUVAQIPeDHApl5kIX39cWELUY1NKnMKplB+/eBb
         5TNjClRjA7UdA3akogQzgLq8BdKCrFoqqmEwWIg80zi7nMO3YUDfdPgbOZ5xo2j7m/N8
         hCMWgUt4f43fkaLWDj2jKgI8rBcDqjGNrVTkfs309mG1JLg4h+QWi/d7w42BsB8xmGPo
         r5wI/ZyPUBET38GB1WA/6vCz/hoMiMTREKc9trT6hoePjqcs+PGK8GeopRDQXkHEVaIZ
         puNA==
X-Gm-Message-State: APuU4Z/IIuR2YfyQTCRcKIqZcu7XEuF5ZehmKWsScWJ2oZj4ac7C0JCh
	jx8Anq8zxxQoQAmFNWotIXI5hzQ+L5Ky8kdU/N1iot1WtMTsvhulmiIaU8C6gR0EM6Z+0l9Uss3
	ksgARh9x9oPeeDP5CJd+6ajRHz5/CoEcTm4G2NsBPjKyAYVXNB0NEbqdWeU9BF6om
X-Gm-Gg: AYBFou3+D5h+aox6FO3P+9k2CGjX3bgtBWWeIluIwp+XhcWtvBWzZtW3jmHNB5yimnO
	esrirp8n/71j25TwLlIqhbvHd7xqHL2/O76Aac6rEKzXqn7n8syjaN1UF7lGp/VYZwZmEyRIjrZ
	Li1HRfcIS36oN25PwhmGoJXSeb2couUMJQCBpOePajmDsa78nKWJSmxA4s64J+bICuGICrCmNJX
	EHVkxTlW9Sqj0+EQqFpaL2lzjN5t+vP9q488zO7Ns0JN5SN7rwcDrD2rcvhZQR0SoVDF6m1G16j
	Mk0g1FCauO1ryBEfJeSoB9dK/oDbLxwupp7MQS3v06PjtjRX02iIOB1M8oCriWluBt82f9OQCXv
	HJ4tIGvBS7Jo2Dv4JzUOziRRYMfYaoeN23GSJKCTqsITkiJYNMA4n4JV7ybz/u2q0UnsGSX9+qz
	uXJn0=
X-Received: by 2002:a17:90b:4f85:b0:3b0:91ce:6720 with SMTP id 98e67ed59e1d1-3b1b0a1ef3emr1153173a91.30.1794549952077;
        Thu, 12 Nov 2026 22:05:52 -0800 (PST)
X-Received: by 2002:a17:90b:4f85:b0:3b0:91ce:6720 with SMTP id 98e67ed59e1d1-3b1b0a1ef3emr1153150a91.30.1794549951512;
        Thu, 12 Nov 2026 22:05:51 -0800 (PST)
Received: from [10.239.133.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3bf46b3sm662099a91.3.2026.11.12.22.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:05:50 -0800 (PST)
Message-ID: <9c0d7254-1248-4174-b858-f1060523eb3d@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:05:47 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/10] qcom-tgu: Add TGU decode support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-7-songwei.chai@oss.qualcomm.com>
 <sashiko-outbox-212113@kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-212113@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfX9fOkKUdLMXVm
 NiUohvVBDmiW64aGWjhsGJ+PGIBKnMLCPlrJ7inXxSwyyrld0w6QF1jQwx063D/WVcQtnoauioQ
 Rqqlyao97qj0ZqXKNWaN66m/ubvYn6k=
X-Proofpoint-GUID: 4pZMNddGDec3sOqaHqcukMUgMLsHHwLF
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6a8c1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ip5MbSc5NOlZf4faZLsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfX5RJPgfRgGbkS
 VE53bRO4AZYRBraX+Xrewcj4465/CKNOPkxlslop1Bchxu+JK5c/Nbr5dC0597Z9MJjTbay3S/6
 Ue1rinRnzVx2tiw3LEK/o03M4k2xwxA0RzCQcTtEM5w2wWLtNFw1KP2HtJrI8KM9A2Jj6B5HJdj
 C0d/GFLp7GgzgcjTHVtItYw1cZqPd0eyEIo0t2NFn+bfqRSmhOHnEUkSkSAOTblwG+TvXB1Rl5l
 QbIb7NVkEgDK/S+w+EPCTK1eUXCLCC8D/nEuFJnoCD0W1cjiDBlg5dFes+xSj/wehfaZyEk2lvM
 r2F+nnZ0XJZyomxol4xlF2rVfiN0i46eaetCsfuaAgt/sNe34YJzVIFPXoplho9vFMVJMC9HxK2
 URpy8+w6sOKQ9N6W5VzW+eQqbGzkCh5NmzJb6G0OxjATlKBJDPGWQuuP1IEyG8wW7ohqIJcoUwr
 VpG0MePNmYYW5X60LnA==
X-Proofpoint-ORIG-GUID: 4pZMNddGDec3sOqaHqcukMUgMLsHHwLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130024


On 11/13/2026 10:59 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] qcom-tgu: transposed step_index and operation_index in
>    tgu_dataset_rw()
> --
>
> commit be12a60019509b692fe89759e5c9e8345578b9d2
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> qcom-tgu: Add TGU decode support
>
> This commit adds sysfs attributes and register programming for the
> per-step condition decode registers on the Qualcomm TGU.
>
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index c00e95e68214c..72b98a96d7f20 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -18,8 +18,8 @@
>>   
>>   struct tgu_attribute {
>>   	struct device_attribute attr;
>> +	enum operation_index operation_index;
>>   	u8 step_index;
>> -	u8 priority;
>>   	u8 reg_num;
>>   };
> [Severity: High]
> Does placing operation_index before step_index in struct tgu_attribute
> transpose the two fields in every attribute initialized by
> tgu_dataset_rw()?
>
> tgu_dataset_rw() uses positional initialization and still passes
> step_index before the priority/operation argument:
>
> drivers/hwtracing/qcom/tgu.c:
>      #define tgu_dataset_rw(name, step_index, priority, reg_num)              \
>      	(&((struct tgu_attribute[]){ {                                   \
>      		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>      		step_index,                                              \
>      		priority,                                                \
>      		reg_num,                                                 \
>      	} })[0].attr.attr)
>
> As a result, operation_index receives step_index (0..7) and step_index
> receives the priority or TGU_CONDITION_DECODE (4).  In
> tgu_node_visible(), tgu_dataset_show(), and tgu_dataset_store(), this
> hides attributes for steps 5..7, maps step[0:3]_condition_decode to
> drvdata->priority at step 4, and transposes step and priority indices.
Confirmed.

Will provide the fix in next version: Changed tgu_dataset_rw() to use 
C99 designated initializers (.attr =, .operation_index =, .step_index =, 
.reg_num =) instead of positional initialization

-#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
-       (&((struct tgu_attribute[]){ {              \
-               __ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
-               step_index,         \
-               priority,         \
-               reg_num,          \
+#define tgu_dataset_rw(name, step_index, operation, reg_num)              \
+       (&((struct tgu_attribute[]){ {                 \
+               .attr = __ATTR(name, 0644, tgu_dataset_show,             \
+                               tgu_dataset_store),            \
+               .operation_index = operation,            \
+               .step_index = step_index,            \
+               .reg_num = reg_num,            \

>
