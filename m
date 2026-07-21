Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522926F46F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625569; cv=none; b=Ns+2KknjRKCzyKKKPQf4xC7z9X6Qt82lUdj+sfD6BkUr93Wd1eby6UmzO1SN9VF1P2HZc+qpRPE3DIJ6f5HbZ3Q/Qp7ZS6d6TwOCFVpd0MOxtvk9AehdOFdXCX+jMwgjo2Eu62/FwhVDQ0p2BPIk3oppzujVNFSdMYJRAVSQYIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625569; c=relaxed/simple;
	bh=h7OkXjIcyiqraWDTg6dQ7Qjakwh2M5Bf8larYlTJdyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paolRClK2NrtSGV0C1Wne/1sOrTaN002YdeubuSrO605gw22Amw1PpYwqRjNp4Sdi6Bmn8q5TDHh0KLi4zIZQ9vQifOd0YQQAdlxXnOo4BR0bGUXiMcTxmh7M8n8B25FLZ/6T+4CKNOL93LDQPPVg1dy92+DKI6/w9sT1FuweAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3rpe5lH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALS21L7K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3rpe5lH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALS21L7K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6Fsn24150498
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gRKUDofMEo2Sg8xUURikMPta4qvKN0rtK1tI/8N9jl4=; b=n3rpe5lHpm/ByWlU
	PYnYAz2B/9gwjsB6xsQ6SzhHH0nBlLEleqSu7SYzfNuHis/R4ni3mlT70fFcXuMf
	VFfo0Wz8Hg+cZED7v1jT8rVKK+DL7KF8obkR1UI6aDzVeH337NovCsN+vyHqb7+9
	qBNnPsCkqVXeuIlzAHcn30yxSGxo/i7fkkOwHO02Qlq88KyS/nArKQ0tCvf1LOZy
	5/uU11N3Ui7wppDvMdCBPgX3qzJYwGDqeTRoAqYdduj45piu1oLqHv8v4xFgxzDY
	es08YKcccRy0Wd5eoalgY+IHYXeYSLmR0/a4O/TsQQb7AfMkbuZjtfHVCPQpWZ7z
	xEQpag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff3spd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:19:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso233646215ad.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784625565; x=1785230365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRKUDofMEo2Sg8xUURikMPta4qvKN0rtK1tI/8N9jl4=;
        b=ALS21L7KZ32pLbHN4v5Y5Lj2EQPKrAKHf5/F8WQ60LrbSbaB6J6CDjRXawIX866Not
         aeL8me6bhGe3cHo2MKjEVr46ZWuQ5UU+kA6VSg5Ryzvv98y5lLbUpWsMUI1ToxjPQdcr
         8u7FKIU3vol/2+zs20OXhoFi9uEQta+ekouO4F+J0XoBAx5BquEaav2emyZx7dtMy2HJ
         XxCML/DFHePVa0YM9LV/3Ykr6OW3ZUhXCX2QjZf7NY4X8yfAes/q+Wpqa7Cjk0eCLfbU
         h3SmX9tqs7Z244XvrthbAMU1gQFC5omnPnTrw67ve14EKh+6vQMLrAVqoE2yQB2NoNbj
         IXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625565; x=1785230365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRKUDofMEo2Sg8xUURikMPta4qvKN0rtK1tI/8N9jl4=;
        b=TnaMBlztekW7ihTNNB+E0q1ySxb0jG1pn6CmZT04BCtGmMfrCjgVSx5/Jw2aQi5k6c
         AIPfgssMe6bCUNWG8ykoFRU8DQqt+mPeshN5Dx5ssWHOHs/ji+tamV8rBP/6XlhMjndd
         +HVEha26rUEl38R+2+ftdYLOUgUmJTtOGkWGncz8M17nPE/fhxBe4rnrfVy/FpROm+Wc
         MjxwHjPjrO53vRlMQdH3KdqjhbIkoKoYdgcORqqOlUr6ZamS1jNwT2wtNXEG186KiST+
         108WZ9FGYedhaIZNCQ4RAyPBo3NjWiz6eRA5lRn6GHa9tWmGlgtp2nIn9bcKrM0G7MT9
         X9Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rp1bU56biRANCVaWvpUTxtZcB+vE+noMADJBY+4myTxPXhVJpGPVWA4osDv9ZDweGlgFl42QxVgl48e@vger.kernel.org
X-Gm-Message-State: AOJu0YxG0X8b2/Fpv75BXP2QIi9YEOAxDwfdEudKe2ssc7gj2X/JbBmR
	GG3e4fsCHu/V7Re30DeJsUXHL9JH8k0xDp5MyN8wMuZfRtBcguhB/U6pBTD9p5P6+T7wXJ+Q589
	bAdEq8alupyiRYQxAawTBsc00xTKME2Gq47aiA1tAM/vB6OhXpIWQAH1fihJPbGBU
X-Gm-Gg: AR+sD11Txl6jKCdu1w33nZyFsmSXZySShNR4U0eyu+M48oXmf8Fpg5asxByhhKBcrJ2
	PoJXdQC5p/8T6tt375dT5DrzAOhfDQKa6PjqCv1ypGVMn7ALHjuVC0UMRRKBwbdIgRxQ5j/EcZ5
	FYgc0p38LWIb9j0LW/wklpc0kMK5LJn8joQxVMh5VUfdLbb0PRrCl8LMKo3yP4u8WLgnatC4LGA
	FeX+m16ZdBGndUO5SKZIdlbeAMgeWtYgid3PnPUMRI/PAhcQGW6U/b6WrPyEJ6rnkwCt5ROPRMW
	QGLF790hVXwRVjD2hsg2sXQtxCz5aPYsxdjrbaMGrzWoxfMrSTutdmEF0AzdvhV8iCMCPgO/cYe
	q2LqYEAnJA3GzunwtmFjzUV8nng==
X-Received: by 2002:a17:902:d4cc:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2cf348193f5mr192352945ad.7.1784625565339;
        Tue, 21 Jul 2026 02:19:25 -0700 (PDT)
X-Received: by 2002:a17:902:d4cc:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2cf348193f5mr192352615ad.7.1784625564881;
        Tue, 21 Jul 2026 02:19:24 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da095sm71796115ad.49.2026.07.21.02.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:19:24 -0700 (PDT)
Message-ID: <4ca82b5e-f570-47d7-b08f-df9ab6393059@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:19:17 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
 <20260717-qcom-spmi-haptics-v4-3-b0fe0ed30849@oss.qualcomm.com>
 <alpWEL1hJgQ18I7d@google.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <alpWEL1hJgQ18I7d@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5NyBTYWx0ZWRfX+Qlypp7p8vKd
 +v0Gu1l+N1y2zjv5lBYRzWRgrfzH5Mn5vShXpJP5DBaWCaG4CZNaizT2T3/vGU2Rqdg53Jv/+Vc
 UA05r7QNZVwltgGn66wI87zDeDM26aQ=
X-Proofpoint-GUID: cKUWmFQVNVMNyNPtkubUNryertRvKcZh
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5f399e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0P3381qDqkNb-38gs_IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5NyBTYWx0ZWRfXwfOOobPIF86i
 rqz520Ojtq9atTOkary51lQLn3OhxCjaC8FHOm6hwr3hi0Wle8D/D5GZopWZWrgWdr4aU6TQ7xI
 cTAwxxpVcrDRL+6QW5yZMADHZq5HD19vfNt7we/K4LKvNX+B4bXKawCpdNkbhkQfHf37K2qPYKY
 THsyxvQCa9OzpSZQr/dRyJGWT1k9rLFpccqroVoHtHj+khOMFk6vM8NBwdQTZSLWIYlO1A9s6ZR
 JptQALbnkC8TDTvNiI+iNuFNcOIVToJapmpSdw11gNVeXRZypWbrI7yu+jpVa5rV0SryYD6qnA+
 aRYwDQQo0vD6DuuVo69xc5hKaeU2w3PnX4JPjQBN1B58dnEsv7hVJPchdPw4sECG4l4fg/0j132
 JD6hmcVqqCgeTSEXtEF3Mgnmt9RtUa11+UPlLvAxDq1DdJaVLN0enoTLvH5GnKlWAnKzgiglWAM
 HRET+2akk5J7uZzN5og==
X-Proofpoint-ORIG-GUID: cKUWmFQVNVMNyNPtkubUNryertRvKcZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210097



On 7/18/2026 12:51 AM, Dmitry Torokhov wrote:
>> +
>> +static void qcom_haptics_remove(struct platform_device *pdev)
>> +{
>> +	struct qcom_haptics *h = platform_get_drvdata(pdev);
>> +
>> +	/*
>> +	 * Unregister the input device explicitly at the beginning
>> +	 * to avoid the input device being used after the resources
>> +	 * are freed.
>> +	 */
>> +	input_unregister_device(h->input);
>> +	disable_delayed_work_sync(&h->play_work);
>> +	scoped_guard(mutex, &h->play_lock) {
>> +		haptics_queue_flush(h);
>> +		haptics_stop_locked(h, true);
>> +	}
>> +
>> +	haptics_enable_module(h, false);
>> +
>> +	scoped_guard(mutex, &h->fifo_lock) {
>> +		for (int i = 0; i < HAPTICS_MAX_EFFECTS; i++) {
>> +			kvfree(h->effects[i].fifo_data);
>> +			h->effects[i].fifo_data = NULL;
>> +		}
>> +	}
> 
> Most of this is better suited to close() method of input device.

Hi Dmitry,

I tried moving this into the close() function of the input device, but
I’m running into an issue: 'disable_delayed_work_sync(&h->play_work)'
may be called multiple times when the input device is opened and closed,
and the delayed work can sometimes end up being disabled unexpectedly.
That would mean I need another flag to track whether the delayed work is
enabled. Do you see any concerns with that, or should I still keep it in
remove()?

Thanks
Fenglin
> 
>> +}

> 

