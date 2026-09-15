Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3971F25B2F4
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476928; cv=none; b=sPJK1TVpvPOHleD/L8gYmxOI0jc8j9tHC+3d7bvvPxmHjCt6xKea/2fKPiKX2JEvNUCA/LJJd//M+Q6JPFFe+j1hLYdICQxeCuwpgAcMR4aGGiX+sZc9vsq7rct0o3gW5fdc7iv5GZ29961MtYlG3EouZsrlN65d6XvS86H6YZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476928; c=relaxed/simple;
	bh=eBuqRI24vD9lYQdJzGI9yYYYHDAzmgfP+d2spgyUCE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuSl1V4RIkCyZGhMuDfLEEXkiMVDCNISiEDu725fG8GzuRll/5FmcMrXFVCc1yX5sZ4pSCxbZy9YimkLvn+y9WZAyYegkDNG0NJszWGkhdqiSywYwaNUzdDWaxqQLEdsqrbaA0d0U7mpDoUQy2lk5vrjAqXEDqhcdWy5usZhRrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVO+5lEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuwkCcdM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVO+5lEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuwkCcdM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9guiM275471
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r4oI1G/Tvwo9Ye+D1/omQonq92SLREOl8PUl+SUaYyg=; b=PVO+5lEPcrUX73k3
	qJVcygFJF2n6LbU2fBb8YO5youBtQ8EgV4G5/PnY5VtJGH/5lG8u2NzcXdlnxWJk
	MZoeDcPqNNwygsna3I4NsAoxdmJYetCXTI/fXuGv4BTJmD3cWdkZGSaRPjpd/bSe
	HqKPZnq12RkGMQmS5PcOdaXkC5TDXyuueVy4h4oenZA+/wT4zdoe7RKAmei27KRw
	UACC8uhZrtq0dF9+HrKAotgmlcKWaMY1V6f/b054vIsEBuGO6FeCS7i/a9tO5DuD
	f0df5fL/iBsVcv0hu7PDWvZDbFgzcGafIPTaUumQQWBEEVcMjN1g6XEc9rTsavRX
	jfoQuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea1um7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:55:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso787881985a.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476925; x=1790081725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4oI1G/Tvwo9Ye+D1/omQonq92SLREOl8PUl+SUaYyg=;
        b=XuwkCcdM1Z+GwiMn1YS6FnO1GeHl1xMqUMcaw4GfSWaL+FM1j9PCwwNZAOfvwqCfaX
         UUMquYTZK9LsdjpJxQ+RgNOS1eqisOlJfUnnyvLm8HZ1Am1rqPFyRznjeWKrmXoZQquS
         a7083MbQ/zvsHy/Hg6/1NXc18Wj9yuSKNU9krDTWu8ERa0n9jNIjMTw5DGWr7f+pqW5o
         q4cKrg1wl2iTt9+fMtWWwdVZVp866gKXbJeavKjza65Yv0mhiA838jBSrb9qX1KXqfiE
         HnjtZbB8lKnk6NkCRiVYCX1Lv7k6QAt+W0/H2YjPrxh3ExVbvCDJNZ4tPSq2GS0OG2gX
         0mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476925; x=1790081725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4oI1G/Tvwo9Ye+D1/omQonq92SLREOl8PUl+SUaYyg=;
        b=nub9Dl7+fc+fdlknrdAddCskSPkkYoYRiOFt/RJskYhsjMs4XlQqutCvlToz071WIB
         JgA2+ppVcDuxHBUCHrj0dJQJdAWpB/I7Hxy83crSCXID6iyJeFm2ryrm1ssoC/WkMAzT
         WHoQHCXKKZ572Fc3eZ6Z7DdpsYlFGDELcp+uJNrYhgqpBcq4yI+B2lzBJcvjR+QhxB5o
         GT8Mt5ZSmOYlFEtFrHN/0nBWSvVESH9mRWn3VLeA8fKpqUx2RhoiHkAKahsLarIcwEmU
         d1qpuMj9lxrN6UnwCP+M/dC06Wza8pbXjDJz1xMCgHUfk03DU9yjXNYJ+tGUidzohPU3
         ULnw==
X-Forwarded-Encrypted: i=1; AKwUvBynTudU4he9EeiiVDcLmZfBqP8Hr+dayauuWVi8do+MwkqBgvnDuDBRkscInNaUXj047R9RzhpVKnkZ@vger.kernel.org
X-Gm-Message-State: AFuF++ksNztXHpXrTfx+C3EoIdvikTSU4u/4mjRpFEZ2fqHD5U09lCwG
	AwjDIu79glWKHqQIucwE8ooq5YZORblzaLpILzdplangKRlBDDdea+rbeI2Ozi6JXgNIZstXjU4
	GMhseGbucnmmHhnSxlEr+FBRZl33wvbqSmU0p7WHKOlzuEUTBC85gMvRP105fDniT
X-Gm-Gg: AYBFou2Q5bjX83h+QXq4V/ivwpv0Jqpdh5TfJqBx5bPPn7uIunpkIl1w9u/3giF8xQq
	vdVCTCn5Z67GnwVC6TpVll3yv9Mlfjk0PxsyXder4BqD2vo9QYGs6nkEiWDkAh+HkIlrpLo3fL2
	75i88xzJtREA1Tx4S6XzVb6JiP6yrLjRdCkX3rc2OZDatr/tbuq8YF8w2xGzOBpQOcyg2/UOQ7N
	z85Ai5NmcbF2u/UHjSER1iXWfoA62jI6GNNq8r1iEB+dWKYn9VOTyg8f2pA7uR/9olM35bGo+Al
	xneFOme6Vk5cDw0m9rTyU/GL9/qXXEsTJLCF70r4eWBTvG/Qfl2FgqFkfkZtmkOkOSOOzd9Evbg
	mrXnAan7THIkb131K5RLb/DSynQdnAsYji438JBo=
X-Received: by 2002:a05:620a:2556:b0:939:13a7:70f0 with SMTP id af79cd13be357-93a40765af3mr102035685a.5.1789476925484;
        Tue, 15 Sep 2026 05:55:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2556:b0:939:13a7:70f0 with SMTP id af79cd13be357-93a40765af3mr102029085a.5.1789476924914;
        Tue, 15 Sep 2026 05:55:24 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ecc38105sm1206322785a.4.2026.09.15.05.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:55:24 -0700 (PDT)
Message-ID: <9ba16818-ae60-49a3-8444-c1056c03c63a@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:25:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] ASoC: qcom: lpass-va-macro: Add shikra compatible
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-5-fdd2129c696c@oss.qualcomm.com>
 <8acf2491-01f3-49d0-a357-39592ba991dc@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <8acf2491-01f3-49d0-a357-39592ba991dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z1o81oqhZCtAO1TIPmFiIr_0IP-zZrQm
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa9403e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=xk92F0r0DzOCDTAHD88A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: z1o81oqhZCtAO1TIPmFiIr_0IP-zZrQm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NyBTYWx0ZWRfX05TSNhS1rYEL
 zxdewzajCxp/qfoL4BuUTUr19hC6nhnidt+/8I+KDYMwGXYPQfgc+CdBakMPBWfdwn5zF+kHCC5
 9cbrSi9jQbzlDfRcwoDKpT8fhMGcRjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NyBTYWx0ZWRfX4A+hplD00xSB
 IdFzAyoBouSrJ6gj50tZyKLRqEGhSEH7Io1m3lKzlxAaRrebRk/FYTwP413KLQL9dfyDhzQrQGf
 4BNOpkZ2Obt65lgXq3uY+0ARTXsv6MPNAYiVojQQ5sFXzNoVMh1iKU7pTCSV/TAmZevM1jKa56Y
 Na6xJkgJiC6CI/yIc24BlUnlz3eMF9C6gF5bejQOqNNOUMJ0sWkAob0IqjWPOkUDORsdxGfBHTs
 5Ec2ozeppAlV6rHMNSGmT5ye+gU5V42BV3aRnV2cVV5Ve2cVs+mso6wWEz9x/a+P8nc0P8lmOWy
 kHzLRI65n8X/48C0DwnvFkFGBc6Oqx3GW27tomb9NFlK0sPy1kCsOjbWYH9Xwd2nxQmp6tcD5X4
 +MHgAqDAJ2Z1AzSIIdhXyYDFlGf2sRVV3CiXWQ2Re5izo2dOLZkZ1PS6oKbJYpewQHSPkpeCf2y
 POgKjdbKz13f5py6LfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150187



On 9/14/2026 5:17 PM, Srinivas Kandagatla wrote:
> On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
>> Add shikra specific VA macro data and register programming needed by
>> the LPASS codec v4.0 implementation.
>> +static const struct regmap_config va_4_1_regmap_config = {
>> +	.name = "va_macro",
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +	.cache_type = REGCACHE_FLAT,
> 
> Pl use MAPLE here.

Thanks for the suggestion. I will switch to REGCACHE_MAPLE and update it 
in the next revision.

> 
>>   		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
>>   				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
>>   				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
>> +
>> +		if (lpass_macro_get_codec_version() >= LPASS_CODEC_VERSION_4_1)
> same comment as in 4/5 patch use a flag.

Ack, Will introduce a flag or switch-case mechanism to handle this 
configuration.

Best Regards,
Rafi.
