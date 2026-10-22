Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658567;
	b=gjvVzVjEVIgjvSopGXByaaFeNUAx6lMT1c0R5piFC1UZNtXX7mpnA5QzfE0fyXJNavyN
	 FHFOjEzkZEqNKKVcDdoqlTLbHVc/RH4bmaHOjiGflPP8xU6ZXs9oWX7/zFrQQRFyZups1
	 wWRNyVsZiLku0co6fKEvVphDtmaRD62Gw+kCxOCTaZICOb5Xw3EBPoirlJJeNxz+jKMV6
	 GQg4r+1dtXkupe627Z4jxZl+HGcjXcyCnhWkm+2UKV+Y1k7olFnAeF9FTxwOJzEubnClV
	 Kouxm9kIl+AKgREHB5dBDRJC4m4PXoobTD26pLxSg3OWx+9Tc1sTAAytM8YkUvlVMrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
	b=xiAdwDq5LtlFAnyadvwn5pALx3yer0fgJ70t7nYh5oRbwG+Zdl4WcABoTWXWGcZgYac4
	 6gnMWQGmL6Zg3/uBUmnIUqrfV3lJDRpVcMACzy08JfvjkCy23YLYSgwNWzjri9o4oJuYd
	 WWm6/hn2mKzZvVvt002/Lwz6rg3r3VAYUgfGZOV2dUg6GZ4mlj0MyIiSzF6kv1rNWe5f/
	 Bxbl7xmYcEQq/kn29JHGkayLX6dJN0uw+EScu7hTW7Q+IDcU8+BqgIXIAMcvZQr3X59Nc
	 MVdbjLKGC5CRKCDi/I3t0VtT1YnvQ63KV6eJfAA4qsZnyNRQykx+RlobP6P/dFHHbNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgagUyde;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cpjh3hK8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8E5606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC8E5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgagUyde;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cpjh3hK8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LnEV3194722
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=; b=mgagUydebMG5Fzsr
	22bhGLvPM9MswVbY217xWPN6M/TTO7kNlOEh6Ti29k8WxCGeC7NUzmWJhl8qj6N7
	Lxv9lHLMPLjalrwwznZPzKkPjMhuv63agr2xXVMES6rrS6toDNRA74WqjTI1BJga
	DddMqposK0D3Kz1ESA3Y4GcbUllpezHoXpq+MFpSup7mWi62s3xpG6cRfPwhJyxt
	9Va5pQEn4xSlIQR41HU/f1+ms87Uz3gO6MD/iv1aQzwkCKnjy6yRtG8CzHsmh4lI
	8IkutG/UGk6JDTAHpROFRjVvI3IkUE4uJDVpU7Uq4sl9PFENqb541tkwqOJcnWxY
	8n7QyA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq03tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:42:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so2452890b3a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658564; x=1793263364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
        b=Cpjh3hK8yRhgYFLXU84IPZiq0Ka9MKZcr11Vg8UR+DFXoJneaBoqFQrtIDSjM5byAb
         dcs8vkXhM81q1rwe5ncDmZGBfl9fIhSivd+mIzhDtMXMyNIyqoXY4LLhSjSWVTGjHz3G
         kKpm9hwvqpKcXPQgIewc9aXda7APeDqxJekg7x8TGETG9QSyKSSEcrY11s3xQk38Nr/j
         TR8TCfL3NSVAXQkYBZbjOvGt8gPqgH4LnXmW0kPJdhIeKMyzS5+MBsjOp926cuHAIJBg
         B2DnAIPhlkWPWe93wAF+mYiQeag/MiDfb/94tpwaMjpgIGTB8dyGN1Vaqc5R3FaDilWo
         06vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658564; x=1793263364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
        b=0Bqj08sNgZgmw1FybpRYxnCENWPCBND2+HRzeB+qHNaSnrxhCu9u2xcw6mvC4RuN5b
         HvG4gBwyn/9PCvhKR/5VxhkErzkU2nYIQaQuILvOInQTdM+cmjWTwYYkWmgcp9K7zaPh
         bU+KYmTEFfeD8I06qrTPaHV+s4mdvsUWXGjwVpSBWFBy67m4jwf8/S8IPHgimi/JXI/9
         LEENjgo30I+N9FfZXvSPzPiTBTYfuO5QWQE1NKLQD2Hran0BDNI9icuFqq5yFyGN9T8C
         Rx+F+TVIYgJxfIzq1AnhrxyIoCW7iHGYCMYIt8d3O9YIql1UavDKOpz9c2XPJ/Efn0Vo
         c+sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXTeA1We1c8VwRr2IKmcjHr+Xb2KedCZPgoetugH05dv3XVolUJKHU/zSnNwsOI0UK2QKbqe5dZ3Qd@vger.kernel.org
X-Gm-Message-State: AFq9FYLfynxN9YIn0IUAa5YtQIEWOHw+DvXcSo+ARMt/T4zaqwmz+Xoi
	RzcFuD73PllBVE6vRBV2cj7u7cRIKTBxSdgmNlNNTfxZMjwF0LcDyB/dK0SCg5rhD8bxZRM/RFg
	Biz+cWgI54baPHUigVQVqeVt7PHsYel3Q0aCwbWf38tYa7iMh0F3vjIx0zWGBS/CK
X-Gm-Gg: AYBFou33hEq3kprw6ll7F8mtxA63TDCcMRZxirqi5WEa1Bn3HLFplwoMVSoZoolIpum
	4fbwohzYmACV4BouJZPS58fC/DTSJUaljaYKDU50/C5Noup7XFyWOZWmdy2DGBPLyP579DvgtkT
	qJncqazwjeDJLv3IgYxjgFSGeQn2J5backRfvys1yq6JpGdFMX/YHl+v3+9WktkXwdv8TIlA6+z
	HFmu8IbPmw+xJUhLZ9xE+U7QcWl7OQBv6kfmFn2/4UWsRLX8TMJ24j0NIyYEEREqLzw8aOic2vJ
	tuS9bTHq+jVAqPEH6glgOf1YpyfJmFERAPTaKk6LPTPrL5KEYpnWT3rpnkOIXADoWtTradois2E
	TiHQe2zRXa54smCEQKeKkG+d24vqk
X-Received: by 2002:a05:6a00:ac8a:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a089dfa561mr3281525b3a.34.1792658564545;
        Thu, 22 Oct 2026 01:42:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8a:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a089dfa561mr3281500b3a.34.1792658564102;
        Thu, 22 Oct 2026 01:42:44 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a274135f0bsm297617b3a.4.2026.10.22.01.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:42:43 -0700 (PDT)
Message-ID: <cc00f347-4008-4746-91ae-c2b583914cac@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:12:37 +0530
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
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura
 <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta
 <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <atXHa8ZhwEaVUlGa@gurudas.dev>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <atXHa8ZhwEaVUlGa@gurudas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dk_VVPrd6bLWYedtOihYhfBZM0Kr_sOa
X-Proofpoint-ORIG-GUID: dk_VVPrd6bLWYedtOihYhfBZM0Kr_sOa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX4zfjJQnY1P4f
 sREhF1e/heppYMhImI91amn5LR5lcP0sE+SXSwPjVBb+kg137XhEhCmWYU54uShSIEPlhfXYqLY
 tG/OiYjTrxFrBEgOGtkDQlEP5xwcy9w=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9cc85 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8zo3re30kI2txGzbV-0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfXylrc7LNqdplR
 Jz5NSv1AweUDKfkyFIuHUxjV5ZFmVd3UJM4A7KGZVpON+5P3W5CQY0XQnsqUIAxiF1VvEMGhj69
 37EAwhgOcaRHGuc6s9istdFAMNDxvcUVH8GyTSCXLudg7OYrZNIKeUB0DyHl0ENCxabUCHZV2ES
 Cuz5isFfMPqC5+uJk6VnchLlRoHf+zykbZsOKWJq3ErKa6cpOHYNyqMCX5FCmNBZrbfAxBgTxrq
 VpoOsNA8eWBk4dbXbYTXKeH6h79BrVyM5Ry1xbP94NN3FqUDhskVdwSfYoBOkBEapYDqiv7xQTC
 I9tCKLbywC4Sb6UItBQOaJOib2TiZ4hvpRJwkAQTJf3nt7PzhYoJ2n6KywpTCXXpbDBB1d6ZM1+
 McvhvNZ9BCh5htIxHY8XpaA6RQGTqwUc32DeeHQgJu41xEAmI/vhKG9OHIoxybMaSRkzlklMXwB
 fmyP6I3YjKMY1goRBhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220034

Hi Guru,

On 10/19/2026 1:01 PM, Guru Das Srinagesh wrote:
> On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>>
>> Implement set_mode/get_mode support for PM8010 LDOs using the mode
>> control and status registers to allow clients to vote for LDO modes.
>> Mode voting is not supported in the PM8008 LDOs.
>>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---

....

>>  
>>  	id = platform_get_device_id(pdev);
>> @@ -169,6 +237,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
>>  	if (!regmap)
>>  		return -EINVAL;
>>  
>> +	is_pm8010 = of_device_is_compatible(dev->parent->of_node,
>> +					    "qcom,pm8010-i2c");
> 
> Patch 2 adds a new `driver_data` match data struct for PM8010. Could this is_pm8010
> variable be avoided by stashing the regulator ops in the match data for each
> variant and using that instead?

Yes, I can make this change in the next patch version.

Thanks,
Jishnu

> 
>> +
>>  	for (i = 0; i < match_data->num_regulators; i++) {
>>  		data = &match_data->regulator_data[i];
>>  
