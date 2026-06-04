Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6575C40DFD1
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573064; cv=none; b=MG6RugukhdpE4l+YbSyvd9gMVwPX8N94UASh+1Ym9GQJhy2LjMqQwdnbGUdYSUgIPcWBptfrdl7sm7RYRtBJoeX949cMYX37zW+n3nyVTvr4CpUWKjaqsngeBGNEz6aoTzKXxX/pB8s9KJxfSSEyr43KYgY/8k5UA+OySTFRQWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573064; c=relaxed/simple;
	bh=MUst1MLkAAjlIqGj9NF3PoqmV8scdkQpsGC/RSxlZ2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fu0FsCnh6yP/PQmHY1doh4+omckOrQKBPaEjWroKbd7P6Rp21R3PnJlheuS4ko0i6Gcr3xrVtC4+En1yyBiRKo4qcHRl/WpgXQUZKEGwe/FyxvZA5jgdaxbBmL0xYMm7aE95SjKTnq5a7lESko8/pqGccdqCfcGzCU86GKONKNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9LAZM0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zsccr6XQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9LAZM0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zsccr6XQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546v4dg2478030
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 11:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qXvacYyh5VG4TTgXv/NQTXRitLcLUy9KAEIH2z6Aw2w=; b=D9LAZM0SJTt2XlQK
	TspSgUHHWk9nVfgJh1TpQBS1kaxTXgfju1FHxsxRAeNVw2GeHcAOnvlrlC0r9Mts
	R3tldW5f3RAPfat5KZPDkxVuDTrgfpk0sK0wiQdUEc2ar0rXtn5KHYsne67OT23P
	LhZrfTLFnpyHUT4KKWSs2AWT13vkcqqa7Rfj+L1f2ucYyGYtR6+aiwunx0XaNrY7
	8VP9FsEIWJ7GMMLSeeOuaj4ArOvW+tLHzvThhcjsRN4QjYYQK+VJ+FZwN3LXfA9Q
	DnnePqqsgLoovCYjetu5599sEKH8A8quZTQ2tsitQsUVgK9CTNsPeCdhQc6RqCK0
	gY3PpA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvh1ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 11:37:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf160f7191so3982595ad.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780573062; x=1781177862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXvacYyh5VG4TTgXv/NQTXRitLcLUy9KAEIH2z6Aw2w=;
        b=Zsccr6XQsYwC2hm/HGPh2/RaPgjWYIeo74T9PS2r8NeDB69gafLRV8jaS+F7byh55w
         sLvn6UVEXA2ldYEEl1w5xczlm+OCjWJBD1IRO6G0nA6OawJwA0LszQ3UTqdrsMPHt+5P
         7KiG/vN9AwWuguxLI+QErVZP92HTkNnq1t+u+0D8iZyA/8vlw9oPUMAqiuidYR4pzIYv
         8d1NDmm5ExBCC0T/nZ892qHM4ySkWWwRN6wdiycggfBLv0Dn5h/b5G4jGzae1zCZN8pb
         oElORp0bh2tPXynWZiYpf+SSdXr36qnk1mPp5MvMt81h1G00AGJW0+FyEclVRPfcij8U
         cefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573062; x=1781177862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXvacYyh5VG4TTgXv/NQTXRitLcLUy9KAEIH2z6Aw2w=;
        b=KZmJYPp1++v7VAs3TyEYcpwJRoGXJ7uI9mzharwS5afYW+clLFX87I5QQ5OOU18U7d
         XSIMZRG080d2ojsF+9UilzwvOQ0w5MQ2fpl8XFkv0QaZQRvgEqpe9lWf5ILWvfUXTlM8
         HOoo2dem6BS+zH5j4SA3vJCqgT9fxxl/V2Nk7b4unXQLLi8LkrNC7qSFYQnC353qFAgB
         7Q4nSYG+S6zpmB4yLUpM4UWAJuMWohf2ZTr99SEHPVnT/18ASZcEOa61Tpr64yq2nvYK
         IzW1q7WJd22+jpuFlw5MRbVn0SUKFLnXdvlJn6Fechm1zv6TnTTjMZO8demM6w1oYtZa
         H80w==
X-Forwarded-Encrypted: i=1; AFNElJ+ErZtxw/qJLXfndsWh1TB21C5udw7/OZ/oUP5WvBZ4HjTZayYuF2h9t9tztzxdAHYWA8AZYAh6XQKl@vger.kernel.org
X-Gm-Message-State: AOJu0YygxKn8C/sBQC/d4vKRQpQQEDNe+/QCH9/hwwus3LItNf+xbR6o
	WkF8dKz+c/BiVLZ4KivZ/27S0n0uf6jXpNrINtgbqylKSvcDgH9b+XyWWPJDnmCDOa4L00bkc+B
	tTFPSKZ2NkhCDeMtaSu92Ymx4u9w/eosgIyjkD/Wr0dcDnjjQqiUePFWmz0ImEmFUnWfLpW/1
X-Gm-Gg: Acq92OFOKymI4XB5hJ53oVTW7kLnMDCXpa7ADuTj+N+a4w9yevilZRBNp3kGzbpxv/u
	OpcHZYp2MBpdYKeEJm3wLG6iJPOBrcbXrgie5Pmz4LNMXUtxV1gdiMfVkY4FjNsk26QMtIy5tZ4
	4p+GEjdDCSp0JcLQsAbvqtN+/C2DyqFNGFnqhJL19pvnAM8+RmbdiiHs1IXYP4v2UJe90aoAHeA
	gTFWhTKkJEjzqkkjIqSvctdBuT/8u6biP2XMgRR0TUFhCAkrQV9I0VNEYYknmObguZrCdSMw+75
	zz3fEuTyuaHZvFXit358AyUnTMEMcsTDJjd0Db3i89nDcJoZXlbL5wddJ0mPIGI7vmdhzUZkynN
	tj2DAu4qQiHaR+oFp0fPaky/d3R1YrN8FK8vDERTC4fGKMQPXgaq7L9OK6G7orhdHugtzpExNb0
	Bn
X-Received: by 2002:a17:902:e88e:b0:2b2:4260:109 with SMTP id d9443c01a7336-2c163d8ca4emr87064565ad.23.1780573062036;
        Thu, 04 Jun 2026 04:37:42 -0700 (PDT)
X-Received: by 2002:a17:902:e88e:b0:2b2:4260:109 with SMTP id d9443c01a7336-2c163d8ca4emr87064185ad.23.1780573061578;
        Thu, 04 Jun 2026 04:37:41 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.81.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fab9sm56977595ad.79.2026.06.04.04.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:37:41 -0700 (PDT)
Message-ID: <6d2f2756-0d83-4a84-a39e-d830bd0d9164@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 17:07:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
 <ci2ur4vurrljhvkza7nqfq6hsjpj7aurb3r3lvjkebfwkcae35@kvnjmosamfzs>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <ci2ur4vurrljhvkza7nqfq6hsjpj7aurb3r3lvjkebfwkcae35@kvnjmosamfzs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K4yv7q5Z7DbSVCQ8EloRxm64dw_2Gcns
X-Proofpoint-ORIG-GUID: K4yv7q5Z7DbSVCQ8EloRxm64dw_2Gcns
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a216386 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=CuxhqhSUAd4m3DS74PnwmQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I8ymiPN3apOPhcWNF14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExMiBTYWx0ZWRfX0CvOjae4ep5y
 Yfddajwk3u+wzrM2lQl5jzbmdF9OBSk1sONPyemMtzJmbpxVFRktQJ5Xe9l6ik0Gm133E/b6/5F
 D5nJtDIpdCOxbTgnUoKY59CHYi3sqxq8Wrbq++tsrZKAxcN1aYtKu6G4QFkkKl0khO2C7NDO5c3
 DiiiBAVcNenhCOogazqY1yzy541oqmHK19s55bwOD9sAjzdSXLSpywEpycB5AAFKt5CfKh9q1pn
 RLGUZWZgegKbvPkBDsDqOpNyBW9A6IHh44f+ESjcPVI9iboG2QtKyzfJQ5XCfr755w6ANjIVQJ+
 kRYgma/gDktsz36Cl+keU4CWLQaT9WtEjUk6Q5vmlBjXejugydY+pjlQUmUe3cm0PYGm+hZ1rkO
 cOOT8JO4znTPsVHWOMox3uX1QC/tJrlaquHjfaQp05xSYynQ1Q8bLCtqeE33Bua6IXc64FtGeb+
 3gQZN1Hc+dO/jCAOG/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040112


On 6/3/2026 6:47 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 02, 2026 at 02:52:00PM +0530, Kathiravan Thirumoorthy wrote:
>> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
>> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
>> enabled on power up but that's not the case for IPQ9650 and we have to
>> enable those clocks explicitly to bring up the PHYs properly.
>>
>> As per the design team, REFGEN block provides the reference current.
>> Hence marked the regulator type as REGULATOR_CURRENT.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/regulator/qcom-refgen-regulator.c | 94 +++++++++++++++++++++++++++++--
>>   1 file changed, 90 insertions(+), 4 deletions(-)
>>
>> @@ -62,6 +75,49 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
>>   	return 1;
>>   }
>>   
>> +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
>> +	int ret;
>> +
>> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drvdata->enable_count++;
> I think, a regulator enable() is called only once. Is there a point in
> having enable_count as int?

Ack. Let me change it to boolean type.

>
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
>> +
>> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
>> +	drvdata->enable_count--;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_ipq9650_refgen_is_enabled(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
>> +
>> +	return drvdata->enable_count > 0;
>> +}
> Linux knows if it had enabled the regulator. I think the usual case for
> the is_enabled is to be able to read the hardware state. What is the
> point of having this callback?

Without the is_enabled(), regulator core assumes that regulator is 
enabled and always-on and is_enabled() is not called. Hence, it is 
needed in this case.

3458 static int _regulator_is_enabled(struct regulator_dev *rdev)
3459 {
3460         /* A GPIO control always takes precedence */
3461         if (rdev->ena_pin)
3462                 return rdev->ena_gpio_state;
3463
3464         /* If we don't know then assume that the regulator is 
always on */
3465         if (!rdev->desc->ops->is_enabled)
3466                 return 1;
3467
3468         return rdev->desc->ops->is_enabled(rdev);
3469 }

>
>> +
>> +static const struct regulator_desc ipq9650_refgen_desc = {
>> +	.enable_time = 5,
>> +	.name = "refgen",
>> +	.owner = THIS_MODULE,
>> +	.type = REGULATOR_CURRENT,
>> +	.ops = &(const struct regulator_ops) {
>> +		.enable		= qcom_ipq9650_refgen_enable,
>> +		.disable	= qcom_ipq9650_refgen_disable,
>> +		.is_enabled	= qcom_ipq9650_refgen_is_enabled,
>> +	},
>> +};
>> +
>>   static const struct regulator_desc sdm845_refgen_desc = {
>>   	.enable_time = 5,
>>   	.name = "refgen",
