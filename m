Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB52D8767
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170807; cv=none; b=MIcxENmxLKXyl/OyUx/b24/772TSSlKjEzyQuYJoZtCXC5nuNydR8fCuaa5tnq3nyC8j6n33OzCh5ZhoA5aEsTkybhZJaYaO1DGyikyy8+MJ0M137WBeEZUZoXGBTIe/B+BxWbfaOMYzUYYyn6c/0qghoJwYuO7m/W9UTF4L+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170807; c=relaxed/simple;
	bh=xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=se8UE6Pha6m6wBOseaalVTJK55mA2ZTU02Yh91iaoZ4mwYlvStJ06BGM+IJsFM2oIZxSv8hLkBrRhNabz5lM+6RprTAPrXbytu9l8PG0G/78XiUEQFiaHo52xnx1mil5iQea3KtFXLHG3b1eAgy3V2tyvgm0Mpw3znP93Jd5vec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+s2EVqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0rx0EWQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+s2EVqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0rx0EWQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0XoXX1226913
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=; b=a+s2EVqLXf9v6Fdn
	9NQE/H5sHVS3yfE5C7hFH5wdv+geYr5SerZ9X8sy2qefOLLsJpezdCkXtdwt7dIy
	oyoj3TWGTcPlBgC6w0sfm1uVz3YhECQFPCVuBDxGq6EEqxWemnuZxAUB438YDMmW
	aoRGQJFqjnhjL3ekE2H6JHioTahXEFBTeG52Dld19of6DZtyE/39uZSKLP5xOmac
	OoSJDcncz6Ur6GzcnyjesZhWBz9xjpAQ2HSdh09aVqIEbpaEMbM/bl8RfdFwo5JY
	vN9OChJjomPWSjL2+4RWsIAfp4O6e/whRhCPV3oxi1L2ttb99foapYmjzUW3nJE0
	JMtuBg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1hqdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:00:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so4447400a12.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 20:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784170804; x=1784775604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=;
        b=M0rx0EWQOpTxguDb3LvZjSqfbwSRN+zjeUhwPWdmwTeMvjB0yXFffOmOzpSwV2RBgd
         mnH34xlhvBbX8mHoYb7Z7U93NZbhGEDiogZ0i1Ci/wOvyzM+qJvbg8Hw0EF09Guz1XGy
         bmfsp4kIlAGeZsKCS/e5pz9SFC/uoOa/x232n+LMY5HOT7qrt4TguBBuUqR0XIhBpN7v
         Oqo6d1WhaXKlgFXOKcdpK8YGD5vA5khPjMyObAvVvxjx6DDCrBPOie2+kRIufu5XL0xW
         np1WCv7MltKpuhuBDw437A535hoqo/+5HRCaFO/ROWbQzKr5MJlfycm8w/Ij6gLt57zj
         vMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784170804; x=1784775604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=;
        b=Bm218Lk6FdRMUWEZWFZAccPT/k37CEW7SjuAFQvXh+H72QoDlZIR4/uV9uHvT5uN8O
         AAM7YCwBmMdBblthnXgCkcytJ5aqBMdUh9EhiAIclbpY8YMB86yVDPimf7QbQqYPIFzW
         9rdzGW3lzh8UQA9N4GIq98jUcwYycYaGYzJGB0lBq+bZErmOudiA4GrhFkH24Quf3OOk
         fp6hGfAcbNMBwpIu6+2wcnbVk8klR5iXrDUtfSnQMpI1JArZ1iLQng1zxmoXo/w3hDtJ
         WMLidFl7PlIq1yT5GXw32gbU5D3yQx/2/VGohsuiboKMx7eDyM7tYahsmnQtxD09OHe4
         FueA==
X-Forwarded-Encrypted: i=1; AHgh+RrMSKoR+qvGdNGWMuwMzEoKOdez5Fbp3Qz/h/GK5XnF2MEiDifjl0pEbpwb8KMfp4KQMZJWy2ii1Ql0@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4GHeYl9Od8qmh4JbEWAFJ9ip07ofw9gIqww5eLAHYWFLJib6
	h4sCJM6uUcqx6MVD8QuVuQsLdlX6tEkv9CPte5MXQhN8xuYsAlF1XyrP1/m5s7pTqfAUjh/bYo3
	qtSSZ+ei6eSraKBJ/nmI+srg/V+AJass+vGa7063B/zFYj7AUlOlzChwNNcqdXSXV
X-Gm-Gg: AfdE7cn++QyiYCMUNwVW7J+tofcHQFuuep0qOFKOciO8JvO4uRmAP3B11YXNcSnRviZ
	eiSSclCwKkAo9TJkfPWMEs2DAUtWW7jct8/wE7Si95kpmdsdcH28OYzVkG0ya5VtDF50HCyKk7d
	16I2mJy6W44YE0lHqlIN7xLakGFefMzcp3OHaiN2IP3JZb+HgH4syLepPvRtatYSg/EVjyjihtl
	hAejFTzgXQA7eqgZhcVeqy6l/MxW2sR0tIP2MbrIUygohUJR5vvCKTeYLrKvINL6l5hxPxAGtPj
	Ieos2keJUi6ZP5ITg3lxxq6FznEqLf7ID5lObuBK0w9QA4nSohGgiBCCktKrjg+RzJSUUyWv1qO
	OKYDj2iNHatrSmbF99kMq+a29LbtCTGjX
X-Received: by 2002:a05:6a20:6a09:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c36c465036mr5496352637.76.1784170803880;
        Wed, 15 Jul 2026 20:00:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a09:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c36c465036mr5496321637.76.1784170803467;
        Wed, 15 Jul 2026 20:00:03 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4359166sm5611519c88.14.2026.07.15.19.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 20:00:02 -0700 (PDT)
Message-ID: <205236d6-6d0f-b88d-99fd-b03decba6fa6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 08:29:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 11/14] media: iris: Add hooks for pixel and non-pixel
 context banks
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <5bXXsqVEXaFsaBMxPP6AkG6XZFXCBP5B8YfjHjhTXuqrGd-XmP2eWPhNhH3LWxKQ_PWHTbdgIRh9AvROtnEHog==@protonmail.internalid>
 <20260715-glymur-v9-11-8cf2cbe12a07@oss.qualcomm.com>
 <65e09849-a27c-4d6c-9afe-934f08f802ed@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <65e09849-a27c-4d6c-9afe-934f08f802ed@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAyOCBTYWx0ZWRfX9cf7yedPE1HE
 IGFhdoKtj8Qb85O96KHQEZH/JW9v9TJJ1b/KLHk6RVgZEzl6SDEqUmzgJOSG6QggIMHiRqlV2y+
 26SCAV+KP/lgkpDGv91h8t9KSb9dfMp6KwSefxoLGoTOOy1/tamPKhsWwnA5aN/+Q7TXbhgManj
 +Aaxucux/1rRWyIKekkLwGvzXIU1IBy0Nt+DrCSPEGIVg8XEwOAepm2LIhp2V1dZdUbCyCDYq6x
 DPczKX9DDB+13W5HB7BqMKVSj1yNucSAJ7XF3w1Lq6AplT9RndtrCVt5EYIv9Bno9AmBgbV0104
 xoXTqBwmbREp1hfO1TyYjxLKgD+XGA9z7DqqzTZV3lBCRU1pnyPNttTnpNhghY/BP5KM54dZFlX
 MOLgf7+WrqDbWNkRIdUssp8jrJqBkSIB2y0WO7bCvAlWqXnFeW6aTLc60NeiZl6YxybGcj63hGU
 8LEsmrG5LKwajAfC35A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAyOCBTYWx0ZWRfX6FlHD/f/dbFI
 kX3sbbOZNRn5yr9m7Iuasyq9EWFg6AeYvumxaH92KSecqPWdRu1vosd9KSXWR3wrNS3AiBIn3jo
 v8DV1GkTj8smNc2AIa8LyX0Jb9UezQ0=
X-Proofpoint-GUID: zHsSQE34wba_C15A2GjPZBCLTYQVhAlP
X-Proofpoint-ORIG-GUID: zHsSQE34wba_C15A2GjPZBCLTYQVhAlP
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a584934 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=wOmbOZ9kRXkywvreR9UA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160028


On 7/15/2026 8:57 PM, Bryan O'Donoghue wrote:
> On 15/07/2026 15:10, Vishnu Reddy wrote:
>> Add platform hooks to create and destroy those
>> subdevices, and wire them up for the affected platforms.
>
> All platforms are affected no ?
>

Agreed, it's applicable to all platforms. Will update commit description.

Thanks,
Vishnu Reddy.

> ---
> bod
