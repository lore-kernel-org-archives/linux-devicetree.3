Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B56245517B
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340859; cv=none; b=WVvXSmOH0nssrJvr8/SRiYaC3HiyC9loyQxcZrtJM7moK/paMPYl6zcse1X2Ji3hx4VXqp9+LcRWGOTHHCuypTqgQZeXoJ1oyDK1cxWqsXjiF9IS1eQStpIUTjWhXQdsxqrdOW96ftzQ1VJeO2NmuH9ims0JOX8mF3mmLNIx9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340859; c=relaxed/simple;
	bh=CdPpVt3jhTVkM0bzeDaDuajKfQ5z2AW/BLT4e8Y0CzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6ctf841Y70Acj8l9oZVds/OsZoLwt/4ztqajgFGyhyzCX72ZokvxzxVTH9plzCPbqOjZA3aB2l/nHnPDwyqv5loSbrdB4T8KyKK6yS9G/qWn25GC1TYakyRgUo5jAYWUgm4Dejj4dev4CF+TpIVdo46/0TdzH0XEKSBQFqxYbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izmCRHTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3kqveMy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izmCRHTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3kqveMy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YnHU3532398
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tS7aD0v0oP7zIS58pNV4/khTyKAVVNAy4M4J2kIEBbo=; b=izmCRHTGtblcKxjS
	md6gN1qvEAI1vayaSIvug+//PSzlC6FCs++LfhC51DU/9qRYIwBTRqPRNhsUVt8I
	6sBmjLnkhsYCyWVVChyYnsnglyg+HunoOhly/o2bPYUdqLe3a3O7Yq3L4ySYCVDE
	FoNDy1g3x8f7TdOohqDI7EmgEIHcaojbXpSzKF4JcD1Luh91fAtwa2Ic+W2cI084
	SFXIFL4Ljd6AnK5H68dpekoXwiqfeZfSiOrANqYSaF/H33JfygeoyoPRguLekPNJ
	E/roQ/IgWTGAr6yStIh1FeD8FlJcNeNhirIIxxGvtsBANjrLTZZGYUCqROFavXrt
	gw358g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kb7cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:54:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3f521346so995600a91.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340856; x=1790945656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tS7aD0v0oP7zIS58pNV4/khTyKAVVNAy4M4J2kIEBbo=;
        b=O3kqveMyzS3NG3/44RxirfM1thU5p3XLxceWMoGRkYkNG+6KfYKHlrPSNJfKRBnBVk
         f9cIEOXQnCTmwdU1LgQ9ddonkOPyiLPBd2KHIhtAGEKxT9NJkWyaCrJlvR19nCSmEOEE
         rtBUI09xYM7Nw5pLcVdZtFzd5jHpnv398jAFIa9NJDy4ahEwg1qzPHm8cG05U5jdnAq5
         F1DwZwyt1mAvtVcZa7+Y2fU5lbDFMbX8BlmgYykTMfgrXCGD+f+UgPQznoDfuUcrOcUY
         oFUYLNBtTHW9Z7vFrJetP6kSvoRKyd3aszzCym9dbiMccs4JgHrEE4hI3/C0/taKhHZZ
         9QOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340856; x=1790945656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tS7aD0v0oP7zIS58pNV4/khTyKAVVNAy4M4J2kIEBbo=;
        b=NbMziIxwC9aamobxw2HNxUKUyOZkfeerAkHq2y2tQkpFXJASlnqwYwI1xED/tx5YhP
         m/tu/pf8g3XpmC5OxvcltFka4sI6up6AQbiv8ZoFYVIQiWxMD/xgKaHgRp9C4NSY4aCp
         3g5Q4gtykoO5dAalXDiNUplUgkKyJ6tFbdLi4ZZedhuWbZrtkQk3hPvJlsz9eqwAn1+L
         be3HQ+F9wLVIGwNaLg9g7G459KghDcaOLaF0LJN93DoC2sXRX7b/i18h0W+QvQg381yz
         F/fNR6Sk4ouEeUUnwIXCqJ1X24i4siByL66yxX+gc3Qo3NENpxB+o4MY8ZfpZ56TPiHT
         PLNg==
X-Forwarded-Encrypted: i=1; AKwUvBxMLjlFo1e1RUOK3xvR3J0+kk7dxlTlTf+KS6Ym8GTerR/QW7eiEGuuA+TtnCDbkWvQj7+cpmMqJeQx@vger.kernel.org
X-Gm-Message-State: AFuF++kiYdTRj7Ho5Vq6OmvKh/qTblQVrPno4IY3ehHP5PXrcU4huqJm
	jpFfD8cke1DDQzgIuBSdjOWpcdB2oXXmm6udAFteT0uR88zGV+DxT/1EJgYI2Qe+ZhymhdPGI2/
	V1MaGwV6Dvzd7AaxGY7XitXmJH1hNNfOcGZyjTKaC0TlcgoPPGYN7PqLJBcXV5MWa
X-Gm-Gg: AYBFou2Mwq8DlmjwltnUAVv41UDvE5fQcocRavOSAGenpm3C2UmA1JX71Ky9QLpxzkL
	Goj9fWqAnJpFY53i98eD37S4MSHfkkOlm6M9THkmN+aqCjirnhHbKrKwl2jODD9U4/fNLaD3L1/
	6fj5WLM1gEXRB/7F9aGPxYZdHjgzesJBRc1Hjjq9AVRuhDxj4c/SnGjm+sXaCB+HXfjfUd1emgy
	+ZFRbVMdCBspFa+MbyY3gr7YsUKaMrgOQ+t4Xbh07nEidoRFH0STeFd7ynDFMDoIEWTziGvYbgr
	FI3/9Yqk+u/Bs3nvmckllf2+j0+wX2EWUn707wVjpRKb7zGbQ97eeZCg/X1lqZCg4+6aExEvONL
	+Xi4Zkm/836u6iITfrzXIgBbfA/sv8t2b8w==
X-Received: by 2002:a17:90b:1c82:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3a098aaba1dmr5199217a91.59.1790340856481;
        Fri, 25 Sep 2026 05:54:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1c82:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3a098aaba1dmr5199199a91.59.1790340855905;
        Fri, 25 Sep 2026 05:54:15 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm839778a91.16.2026.09.25.05.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:54:15 -0700 (PDT)
Message-ID: <14797f32-9355-4b81-b805-af4d8d8ef5f3@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 18:24:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/19] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
 <20260731-iris-ar50lt-v9-2-d71a782001c0@oss.qualcomm.com>
 <bbf66d18-0587-41d1-a902-32686f66fa76@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <bbf66d18-0587-41d1-a902-32686f66fa76@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab66ef9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=iB3hNsdZaZMRGRx/E791SA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZVrMA9eccY_vmvRiiCEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bB3BGPuuu2ZugVQuoO6l3baBGvuMVG5G
X-Proofpoint-ORIG-GUID: bB3BGPuuu2ZugVQuoO6l3baBGvuMVG5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX0h1Gqrj7zL5v
 KpP68R1agjYlRBc95ljhTkWfosR7owDUIhr+uIETfVAUJ4wSfMavZ/ej4YL5WjG+3LmtWK8bIA5
 pFRWG+bexIcnuoHtVZNS/xYAnzV6RsgP5jsq14Qo7rpF5SX9/edJuAeGNttWAa73J29Wq9Av2kd
 AOlLMW5dFfpcFW0Qb+RfzAsnOt3602zjF1RzhE7zSrJBUOQb9OOHh9fas0lUKFz9jDEBRW4F7p9
 vzt8QPW3Y523UTBaoz803jj9sYpIyqoOx6o9+uUB4ONwsGL2I6bSLgDrhbyjq6GdeuIZR5uQjN3
 pzm6NH/81ehSr5HKo+1ZbdwBQe7m4dXtLkcHjrCOjP9qxnEUgoM+fn3099VYzILHtWmVlhNmKz7
 mmTponspgbmRmTTJrcljZ2Z8cqXXFdhfOrzImYsbYTSrCxmWqpjPe2bMPsT41z0SB8mCMYF6Jf9
 R1YxHRn04VbaNYgIE/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfXzb+pxOvu4oLR
 lTZsniDAV2OjQf3JFklBGIzGMkoADej6l4oJOG9ZzQvOiJh1xLFmOlUzVzlgkanSrWTHvH+wReE
 aNFqPdQFE2Vfw+n08JRpon8MX5WMZ7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250051



On 9/24/2026 6:06 PM, Bryan O'Donoghue wrote:
> On 31/07/2026 00:48, Dmitry Baryshkov wrote:
>> +
>> +/*
>> + * Detect the firmware generation and publish the descriptor. Run 
>> only after
>> + * qcom_mdt_load() has succeeded, so the driver commits to a HFI 
>> generation
>> + * only for a firmware image that has actually been loaded.
>> + *
>> + * The generation is detected from the loaded image (@data / @size 
>> point at the
>> + * reserved memory region populated by qcom_mdt_load()) rather than 
>> from the
>> + * request_firmware() blob: for a split .mdt the latter holds only 
>> the ELF
>> + * headers, while QC_IMAGE_VERSION_STRING lives in the .bNN data 
>> segments.
>> + *
>> + * The descriptor and firmware data are published exactly once, 
>> before any
>> + * session exists, so the lockless readers in the ioctl paths never 
>> observe a
>> + * reassignment. Later bring-ups reuse the already published descriptor.
>> + */
>> +static void iris_detect_firmware(struct iris_core *core, const char 
>> *fw_name,
>> +                 const u8 *data, size_t size,
>> +                 const struct iris_firmware_desc *desc)
>> +{
>> +    if (core->iris_firmware_desc)
>> +        return;
>> +
>> +    /*
>> +     * With a DT firmware-name override on a dual-generation platform 
>> the
>> +     * image on disk decides the generation, so inspect it and switch 
>> to the
>> +     * Gen1 descriptor when a Gen1 image was loaded.
>> +     */
>> +    if (desc == core->iris_platform_data->firmware_desc_gen2 &&
>> +        core->iris_platform_data->firmware_desc_gen1 &&
>> +        of_property_present(dev_of_node(core->dev), "firmware-name") &&
>> +        !iris_detect_gen2_from_fwdata(data, size)) {
>> +        dev_info(core->dev, "Gen1 FW detected in %s\n", fw_name);
>> +        desc = core->iris_platform_data->firmware_desc_gen1;
>> +    }
>> +
>> +    /* Publish iris_firmware_data first, then iris_firmware_desc (the 
>> guard). */
>> +    core->iris_firmware_data = desc->firmware_data;
>> +    core->iris_firmware_desc = desc;
>> +}
>> +
> 
> In function ‘iris_detect_firmware’,
>      inlined from ‘iris_load_fw_to_memory’ at drivers/media/platform/ 
> qcom/iris/iris_firmware.c:216:3:
> drivers/media/platform/qcom/iris/iris_firmware.c:161:12: warning: ‘desc’ 
> may be used uninitialized [-Wmaybe-uninitialized]
>    161 |         if (desc == core->iris_platform_data- 
>  >firmware_desc_gen2 &&
>        |            ^
> drivers/media/platform/qcom/iris/iris_firmware.c: In function 
> ‘iris_load_fw_to_memory’:
> drivers/media/platform/qcom/iris/iris_firmware.c:176:42: note: ‘desc’ 
> was declared here
>    176 |         const struct iris_firmware_desc *desc;
>        |                                          ^~~~
> In function ‘iris_detect_firmware’,
>      inlined from ‘iris_load_fw_to_memory’ at drivers/media/platform/ 
> qcom/iris/iris_firmware.c:216:3:
> drivers/media/platform/qcom/iris/iris_firmware.c:170:40: warning: ‘desc’ 
> may be used uninitialized [-Wmaybe-uninitialized]
>    170 |         core->iris_firmware_data = desc->firmware_data;
>        |                                    ~~~~^~~~~~~~~~~~~~~
> drivers/media/platform/qcom/iris/iris_firmware.c: In function 
> ‘iris_load_fw_to_memory’:
> drivers/media/platform/qcom/iris/iris_firmware.c:176:42: note: ‘desc’ 
> was declared here
>    176 |         const struct iris_firmware_desc *desc;
>        |                                          ^~~~
> . "$TS_DIR"/lib/common-end.sh
> #!/bin/sh
> # Copyright 2024 Google LLC
> 
> Proposed fix
> 
> ╰─$ git diff
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/ 
> media/platform/qcom/iris/iris_firmware.c
> index dfc4c184646c6..39558a300d38c 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -153,6 +153,9 @@ static void iris_detect_firmware(struct iris_core 
> *core, const char *fw_name,
>         if (core->iris_firmware_desc)
>                 return;
> 
> +      if (!desc)
> +              return;
> +

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

