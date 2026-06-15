Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0193AC0F5
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501812; cv=none; b=bHtDagcuPFVgmU134E8wuxJ/uBSwl+gIF0HX/e7tJD7R+JIArs+nGJ2Wrz0LiDoWtIqOMxLj9QPVKKN1bFUQ6Q0yYAJzSilmZOCxv0kgsRGw8q5koSVKg88gJpwzKfbZmkJt7ksn+fsbtjHATvHsJg8gBwpdwzlAJNHSgLlX5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501812; c=relaxed/simple;
	bh=qYK+7l93uL0ldevPNHCeXcekblMkaafTeKpLCsf0SqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnIshML5swaxJm2AE+Ht2iRIFNF1NKbH+jdtpGKiYeN+xR/an5aRCU/fQgjO9bm7Nvtbd/aw8j/07jhADB/FB40F+zUoWqXip1ztDNpDGN+9zr2AhVpDk4FDwbN/ivo5ikpZfK+RtWcdkDcbvihP3NXpbLsCiOmG6zJGzJ6xF5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvmeXDRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghG61zTf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvmeXDRl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghG61zTf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kXJq3224732
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5EGAAXepjhAnoVW1OslX4X2Oh4gOE97bCua8lUPgHU=; b=lvmeXDRlx2SV6MH+
	/kRZ6XZfENXNA7KpWZAat2NMSIWqCbDgLpoVQagcgITE3a7MbGHNjdl264apciCo
	54adl+YJ3Lrtxnr+CVGXOtCvihZ0ZhOCuKDBqQ8mYP3HukpXCg/LlJc7dOipDnyo
	Bhz4pLE0z6kfWR0AEY8fWoF254Pio6aU0yflw1JO12zhKbq2tZYIwUYzho8rhc3w
	NDNDXCG6UhLQOwxzlIRuSBQdJwnotcUDPEwyDNVAfy9ud0mailK+o+5gO35IU4H5
	vo4hDTaju+I67VEzd5T/Al6HvZqp+n3rTrQiVHsVXz0kcKH35FK6tI99PEjkFN2A
	yB2W8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u5pry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:36:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0bf6904a6so50920555ad.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501806; x=1782106606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5EGAAXepjhAnoVW1OslX4X2Oh4gOE97bCua8lUPgHU=;
        b=ghG61zTfZKoYJFgHGYrJUsQKuYJrUgoOr9IkMAGWPy0sozpIZCt977UcifsOhUFkYm
         fGnW4qJCGtSrEaxTqAbLurrR2ykn4TV1vl7/aW3+IiQdl2Q6HjEZ19TWmU7Z/ac7FZYv
         ycKb3lE5W+tzfGSP2pBBeDCPrI294HAOuEMbil1K3JIWyXlaRfvdOQUvOq1k7ppcLoNV
         9Mkw9Bawbf0BtLBJtUdCrE8f70b2Eqaj2pNDgDThh7JinaZPWxxiCS1nwO2Mu+ggdEKl
         kVeBA+qRRzgviXvL6XPfBqORSwiN+JWPPu6jEMxFgYGwPfBRga87e+ZDk4U61CTzmIvM
         emDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501806; x=1782106606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5EGAAXepjhAnoVW1OslX4X2Oh4gOE97bCua8lUPgHU=;
        b=Ux8qfjIU0CbcqI310vxiw0sq/xQZwGzxTG1zOOsx9c0siu6oe2gd6dPnsCXHUh4tdq
         poeNQW4280LoXfsGgE628DT870RoxfxA7oV0iLcrhqCdshzDnOoBj3Fl3ZrNqyYevXAd
         5zz9eRi1ag0SH9fDPm38E0i4unsSmrJIAo5olSldRK/DdFHlGSUSV4yfRlpjAHyGMK+t
         Eab/xIqbd6VFWVZra8z3NCIxzXY43scxaZn5VHfU3wo2YhHleHK4VabCNn4Dnp8mud1b
         Bv0RO/vxIG93erua05Zz+jNzq6/gIjOfVF8Kt/Rad4VvTPWZ3lterUrANFHo0DuhmoH2
         4+2w==
X-Forwarded-Encrypted: i=1; AFNElJ9atrx3sm7TNtK1AUeaAZbQuhIZ92xj+N9a276cUpSd9j/TuDCPQrBb+4cjUlHLikxdVTjC6w6364lU@vger.kernel.org
X-Gm-Message-State: AOJu0YzWRjn5JHhIwipx0LVrOAYh9WJISLMsNIxF+npncYCKqX2TpgF1
	fGgSYCAndg6wul5BJW4ptTdaHBfAO8Ovjc2BgbwljQRn5iZQtMge7D96ZL5gajba65KIRVNFH4F
	wc+gvHwdjRh4NkerJGpAox0tblMS5CXBCeKbul8SxdAQLnolN1OZ1am48L6Sw62u5
X-Gm-Gg: Acq92OG4vCTxmc72xT4mFJRrnWmCeevOSw5LTexGB6HsPpZRfgfE2oQLWnPq2r0doV+
	tiflFamP/7Gi0BWmPC+isZLcw8V37w9h1j0CEIXYAMBDe26DXwyvxV8l68HOgFm0CODj+yew4HF
	7eWib9UbrHG1MI8KNIcLKLw5rVJbNqaUsi1S32BGmrUq1aWhygqfds6e3p1VjSNUKVLKTq1j0nE
	ahZmw2vEGvcNZhR+wBlkDrs2JdX50GtxWcuDipHXlZkfFFed+Q5ESfWtaHwbRyn9g4uM+3DiBQu
	fa6rC3mlCxyxEWG9FO4LDLEfX9Pl3Mj1lOUJX26JdXmAt4lLtLi+9nDf6Fhh/Fn2fy2FQ9KF/gl
	trK1jBS8fYveuhboFaXzMPE8jaMKsyXmTP+9ydFWn5BPNRu1tXQ0=
X-Received: by 2002:a17:903:2cc:b0:2c1:1a22:7c43 with SMTP id d9443c01a7336-2c412360000mr140474525ad.24.1781501806487;
        Sun, 14 Jun 2026 22:36:46 -0700 (PDT)
X-Received: by 2002:a17:903:2cc:b0:2c1:1a22:7c43 with SMTP id d9443c01a7336-2c412360000mr140474275ad.24.1781501806100;
        Sun, 14 Jun 2026 22:36:46 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5dd0sm111774125ad.20.2026.06.14.22.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:36:45 -0700 (PDT)
Message-ID: <743080a3-c693-4a9c-b12f-b1e46a4893f6@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:06:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-4-f6857af1ce91@oss.qualcomm.com> <875x3z7igr.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <875x3z7igr.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2f8f6f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Sssc6dVpwyjkiyZbIosA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ptABkruzbxdwHa3fT8vaufDbix-MpsGG
X-Proofpoint-ORIG-GUID: ptABkruzbxdwHa3fT8vaufDbix-MpsGG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX/0NFBhNcC4l9
 iBDP3iRtIujOUzwudrU4lDJqDqtsNwFy3G2NnQHy+WH17DOFbGVw6gYeiTxGILghI74SM+L+Wn1
 y/w2xNkPpEEQYId0/xB4KAqvVRZoL3q+7w8LIWsRa0x3nbNT1d28MURcGvBCJyQAlwlmc4a+29x
 YDGuf5L1PFroKlf2mX/W+5y80hEJaPWJkIon1OEl/qTx6KNkFfLb7Ef7iay62en6MgcZ+Gp4OcF
 w5LvDyWoW2gqUc2tQyg+YZsRYcBMwv3lRI+J3K8SyuoUJPOAVnVEZMKCanNj4RUyGZhNMCQFti2
 En12uuoJ86eSQbYExUgj8A/9DuGFEUGQMgqrVHCDsJ91cHlO+X89AnAmU8AvAcDcJQQZKX/xUmF
 s3Q6ycJ+eX3HWntwt73o4xt/nRvWSsmo6D6lqBBMwmRQzzLQt+irrcAXKDhU6V63rRSCVHgljAU
 YZsgn8sug2G9IbnUUwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX+4cqvl7/YpcO
 tlLxpDWzonA6M7uvFYLGMkw41IEuKdcxUoOmaP8q+rdN8VxcUGZx0+Rg9amDOiIuS3yAbUrnl3p
 Hkpo2Rik92lrYzP+wT+H81tfjxBaHWM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056



On 6/3/2026 8:57 PM, Thomas Gleixner wrote:
> On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
>>  /**
>> @@ -92,6 +99,8 @@ struct pdc_cfg {
>>   * @base:           PDC base register for DRV2 / HLOS
>>   * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
>>   * @version:        PDC version
>> + * @num_spis:       Total number of direct SPI interrupts
>> + * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
>>   * @region:         PDC interrupt continuous range
>>   * @region_cnt:     Total PDC ranges
>>   * @x1e_quirk:      x1e H/W Bug handling
>> @@ -104,6 +113,8 @@ struct pdc_desc {
>>  	void __iomem *base;
>>  	void __iomem *prev_base;
>>  	u32 version;
>> +	u32 num_spis;
>> +	u32 num_gpios;
> 
> Please fix up the struct definition coding style.
>   

Ack. Will update in v3.

Thanks,
Maulik
