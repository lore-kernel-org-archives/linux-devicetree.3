Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AC0440A3E
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158679; cv=none; b=sFNy/tIvilgcvanLgQpyF4WDa7ny5RRma5YN/cN2JN2D1b7Cxe8CDF0CKu5X/f27cLyikaEy02OngPycW4Le71vPRVCi3c9oKpPrMObG8C52Sz8rMGkTX3EJUDEZ2HARyoDUVsLhZErFrWgk+zyW/tK9uU03CZOkYjJs65R19fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158679; c=relaxed/simple;
	bh=qoT31AAPa5+jJb2CqRYaA6IhQgVzFn6wfS5OW28TrnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQ+Ogi+K5uDb4ZL65huKimqIT7usmh76fA1phcEM+T0mtWXOfWh8rH/SFbRgjIe3inaF8TP30yKj7tppp9lShr1rzuDZbg3OTXMM+YCuzZA5SJYcY0mFdh+ST3FbcZM9OwhPD4Ve/lSmlHasGT4AZ7jz9O2dk8oXp5P7p6GNY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aff2TP+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWqGXEUD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aff2TP+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWqGXEUD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3Lct3566346
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGJKm8l6LX/BqhxrHb9SSldcZfCWF4dWpVhMNcxEzwM=; b=aff2TP+1C5hfL6hL
	R2AswIHOI2KzUW8uhqot5VYFyg4EG7dAEr3mlGiy55xO9joIk3/KIeLP4l/r9adT
	oBt4xYhCfpvix0Y32nHo6fD9D+m/DhDV7hedacNKcawKlDPM/n7LcY7XVpQ/CjhZ
	NDSLrxg7TR95PGkpB84QO2ljZrzaH5pJdGWDeM/6HGTEuUNkmoaA5HOpheGCaMvO
	L2gFsC6Rcsl2ZIKx9mvO54HxSeFLi6lE6pMf5K2nNNnIXfy8zR2Yroapgkypslv6
	Zjn2R4a8SWH9jlZccsSMcFeUrfCgaVY8qLGfzJSY//vGJVNWGEddMkxhBPrNk2p+
	kN0eHw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xuufr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:17:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1022728eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158666; x=1790763466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGJKm8l6LX/BqhxrHb9SSldcZfCWF4dWpVhMNcxEzwM=;
        b=bWqGXEUDwMY77K5H6MqojOPN1y6WuDyaWrZUODwTBkksFOlhy039wz0Fi2gTYGfqNi
         nLE2zWIxaPD2oE8cP77zOgRJrVN/vU/0dkjcYhbAelwIBMQKMHanPMAMBFIKOIFvt3Gi
         dQ34v8joU62kvR6ADb9os/4ddVDAlG2sWQhlG8Tra34AqEX9RnTrTTaqLATLraU78SMD
         IZx976qcrBdYicv68NMxps5EX7y5weWJtFRyw+wAT+nc8CfFli+pNGjri28ZA3hovwN1
         CUAWJfVqDbUK7AuUKYUs45IcdkGBO4/+Ap/m7sgRllV+LJZjBx+OqVo3SEBvw4WsEP8z
         TrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158666; x=1790763466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGJKm8l6LX/BqhxrHb9SSldcZfCWF4dWpVhMNcxEzwM=;
        b=eOx2eAt//gnu6sxocd2rMuCFTxXRddnB2cvcNTpTx3yWljY//u4S4QRKAFPMy5NWWW
         QXlkZGxkR+Wca6hGqzg+REohwV6/e9Z5MtdxMcST+if3KnwdiAOY+DSd4FkCId240gZb
         eIbGfh48fgqvGtr+AAlgRLDTJzf24emlprGalfSbXi7IiSljrNbmj9NvHNi0vOrk5WHB
         ISTM7yMrFHpNUt5UDOZy6BJ90IJzhiWFjmyj2a1DSmIzOgYy1dId3N5szh9B/yCkWrP4
         MGZ9/BeO7OUjikCP3GHui141X09qgVo8jVzi7XawwvjxzXrWlCd80Lyi9D80jwExmzLr
         AnYw==
X-Forwarded-Encrypted: i=1; AKwUvByJkAsSW2bl1NPI0poUeUPxeptcKK7ne1qdxu9HZ4nTLWwKt8ybF01hkJ5fQ+o3N6JYuA5KmVZlcvNu@vger.kernel.org
X-Gm-Message-State: AFuF++mpE8/TBdkZt8+4MCndYDkbvrxUX4by2xr0jNDqwqGMXv5lvO4c
	jJoLzCsD+STmFD6StuBvlPbwtdyc1ox3xv6GrXUTobMf3vFHqstGhJvr1eEMQSYdcRk7u0a22Wj
	DhhRvoeVF1SR9Hv8r6RYJCL5gPSRKCbHyN8Aomyqf2tBwRyXyQJ/cVQ19GMtYMvZHVvMxXnD8
X-Gm-Gg: AYBFou0OnQ7iND5NYH3A5mRqGgqDoXRPC9sh05fsRqLZ7oXkUQHuOXjj6UFiHvuj5PH
	c5cdSZ9shVbewZPi7K1kc7hV2sImi65yhG3EOUeq2oKCRwgr6EBrA/N3TcVHdBneMC/5CL9FFfH
	3WOORWk3lsS9Hz0ipbwwVALfCJelR1iaftRzO2SQO3HEnd/ElZDcdxYuPPcDH+frWyICb7M/CID
	M+QZg2WdZHCoZGeVijSRsIlLZOLq1/6/WDcWDshwyL3WGxiirPxjvlRNPO9lpYYyb6uloXH0nPU
	Mx/dE8QFbL3hWcxpW0vKmesNY2WGeexdKUntCdzHc8h9dWHtHJW5REh5nfgCOckCdJEJ9Oni9Gb
	0H4ZnocDsZSGQkY6DkLSdjr/8vBQw
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr1703486eec.19.1790158666016;
        Wed, 23 Sep 2026 03:17:46 -0700 (PDT)
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr1703474eec.19.1790158665532;
        Wed, 23 Sep 2026 03:17:45 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:42 -0700 (PDT)
Message-ID: <5c7b5697-8645-4230-86f4-d31eac559a0b@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
 <20260918165137.302631F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260918165137.302631F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nmdQfM4vR7uhESvEsHRkcEPAp2-v002v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfXz+ffs+5fqeZw
 iu/sCpf+xrTD64jSTwwZOhkH/z51sQvYlR9koUjsg9V6R1+SrGbynyDukv1oiJ1lx/CzUxrV/LN
 clUbIi+C3dUMiisriX9b/49GVrwMhGoC7MO+fQj5cz+MtNph9Nv/PNHPa96jQEjbKp/juNRM8o6
 4fJ2Bgur49jAb33Lraw3PQyC/hzY4PatG2Pyw7lQw2KoX48Jd2TR9jDpeC55AQ140i6X4WPvIOU
 MYexEWBfuwcsWdNOwxkrU+0iwqKULn8cmCNP63e8R7cvYEBbZukeTzUbDYD8g18cc0V1thTo6Vf
 LPQMwkfkcNLm3gLg/EI4SNgg98kzX+ATGWSBY1T87Q8lUahbtjJym12RfhTrT2IKDOOkK4gtnTc
 Bg9e/QbC6c0o3KcOZa0TuUKNx0aJSnOM2uu39JEADuKTV+XL3iYTPllkdoRTnRe9BwWginPNCfZ
 eDM3DaV7f9iPeVwsR5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX1cThSlE4hVMh
 +msxu4lgIkqtX8xvMerNQN6ouded2LR0rDgOtLRpEcsNTdeZoPz7t3epQp5IHZY7jgeJ+fZmrjn
 GIYbeb0LdVC1ZSDfILFedd36KFTnGgU=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab3a74b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5oOkLhcO33hfkyhgiOkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: nmdQfM4vR7uhESvEsHRkcEPAp2-v002v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

On 9/18/2026 10:21 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mfd: complex data passed via match table .data field
> --
> 
> commit a6c2d131522cd1b3f195202001e9365b690fa7f6
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> mfd: qcom-pm8008: Add PM8010 support
> 

...

> [ ... ]
>> +static const struct pm8008_match_data pm8008_data = {
>> +	.irq_chip_desc = &pm8008_irq_chip,
>> +	.mfd_cells = pm8008_cells,
>> +	.num_mfd_cells = ARRAY_SIZE(pm8008_cells),
>> +};
>> +
>> +static const struct pm8008_match_data pm8010_data = {
>> +	.irq_chip_desc = &pm8010_irq_chip,
>> +	.mfd_cells = pm8010_cells,
>> +	.num_mfd_cells = ARRAY_SIZE(pm8010_cells),
>> +};
>> +
>>  static const struct of_device_id pm8008_match[] = {
>> -	{ .compatible = "qcom,pm8008", },
>> +	{ .compatible = "qcom,pm8008", .data = &pm8008_data },
>> +	{ .compatible = "qcom,pm8010-i2c", .data = &pm8010_data },
>>  	{ },
>>  };
> 
> [Severity: Medium]
> Does this match table improperly embed complex pointers?
> 
> The MFD documentation explicitly flags passing complex pointers via the
> .data field of match tables as a pattern to avoid. Using an ID enum
> such as (void *)TYPE_PM8008 instead of passing the &pm8008_data pointer
> would comply with the core subsystem patterns.
> 

I'll make this fix in the next version of this series.

Thanks,
Jishnu

