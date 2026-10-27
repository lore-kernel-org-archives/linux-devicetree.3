Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104452;
	b=aLwANGIFRwF+dPRRT0ip66VxMSZhOWXEWTkGjgXTnkwUrG/KjxKcVO7az2waF2ws6YpP
	 D0Jv6UZ10H2pTGl91lJZhI8yLvgAIKNVONCUB1MEz/n9a6Fa2z9+bSHIoTbbZ0xQ6mV4u
	 GqEOEXVc/L3YME2mgpPSRkZvRH0siXW9eYks4at/wtBULeyrD/qvodjHBFi2piJXoTp80
	 KIMcSKUYbwBnzVRNG4a4rcUjgnW/nyaSKp7mlgV9lxv9xfS8Dab9IHGqR+MkdRdX7tshh
	 5A3xlAkLUcMIHtKxBsc1u7A7ycYEWH8E63GyMa6WDQYsCR7d3mrM0FR2rCwhaSMJihA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B9Knkh+WsIvjFMm93DD5cwjOlqjNFhWqu97xcck5k7s=;
	b=qwpzKCdzBW8jXvJdcQlk+ope6B1XI6lJ4E/luZHOK2rxLKVqmqWQS7/Ud0kdXXADzzEJ
	 m2J+5eirXEbanjHon0hMl3GlPGTx4otcPg4jRAwKLaD6UIOYmtx3fk+dxJ0ctxMNUG3DR
	 FqGb56ohIef8ruYplNQ+ZPHmc1d3PCJFhSjZW2IlILM49Q2ayj+cjX5EuvxsUwpR1SaiE
	 xeQlNtaPmPP2GOM0TBqSpfb6NYLpR0jTgg1o4k5Y72Jzfr1KolIdBD7BP2pTTqaXH/Lle
	 Vtayi3k2kXTQ5nFCi5eaUekId5SB1nROSQPF/vkXWAkRaq59yKtTmIXiH+1HWJWQ/8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SCmS5Whc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iBaWWoys;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48990606A324
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48990606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SCmS5Whc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iBaWWoys
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdvHb2523908
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9Knkh+WsIvjFMm93DD5cwjOlqjNFhWqu97xcck5k7s=; b=SCmS5Whck2wp3mEA
	ARJ09ql/yzgKuWFcxCnMbu6TdRxhgm81MTG/5HAmg7yhmZdajmEYUadkQHFG2kEN
	bOtydwpDBo4wFeO4lW2fu9ufRyBE6eSHuPv3pQmoEqPxwkdP1dBDROYoCjznZ+eN
	jg9L/G0wxdm0UJh/0cu4VPBzUBya7JfhWJUVoThhEWKj8GctDB7U8EEkjgMMhBU6
	VA2PDNN0/oVWTlrNJF5390Kz7l6iZ/ve5UFudezudItO56O1RqgpkhxcVQweA8KP
	s3TSThDB1fViMQt+eykLbXQYGRMPEbUDerCxiDCCJ5UbIFFbpfMjZLOk9MbhQXzM
	opOJUQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw212g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:34:10 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679f2615dd0so865647d50.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104450; x=1793709250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9Knkh+WsIvjFMm93DD5cwjOlqjNFhWqu97xcck5k7s=;
        b=iBaWWoysnjSMq83FEkKttG2wHvdiP/ZU8mwnPcfFbTFsdsIIJVAQs3YAxAvgU1gwzP
         3ZAePtEudk13Ry5v6LPT6rOYKngdZ1xJEDqPVFuQPSbRyDDGzAH3s20VYr/XHegAhg1e
         mFcF1JZA3+N0SrdTHBo6CH4Cu4UR3IIcTQTmdWP2uv0T6/7XNRDfv32G+7bydJ6UAaUv
         i23MEnoSbBKzZ2Fc6Us6koDHVekAm+P9BA8PDT3rJPHpw6tVG1SGAwmxCyZmQvPZFYU/
         xobDvALmia+Fd1U9Th9ARst80dwi+1B9KTgLN4plsIpEUVnGF1okd5+GwsLrFv4N0Pow
         2Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104450; x=1793709250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9Knkh+WsIvjFMm93DD5cwjOlqjNFhWqu97xcck5k7s=;
        b=GsqFdxKm4CoC2Oku1f+aA0tAFJw0T1nPVpwGCr6sWxr38eqvctF/CGGDhghR2uuh9P
         cP16u4M9kZZaC7B6rfHu7ae2jQ6Wl9B6u+1hCl/vQbX/dkpzOJ+pOfQ86T0J9Kl84H+J
         pg/x+PSk+yTq/ubHQdxV+syW2CwhZBf7bn09Z6KRxwNN8OhzFvptobXrkpXcaJBOo6XM
         8rLxHvgxqiJGk6hqqoyYozBrSv+jRiSiu/O2D57tApGZuma15BLyLyN2JAVzH1ozDDGH
         slz3LTaBowYUMNcnMf45TsC89Y0BKjToBfvGx27uQdOVDjoTKiC2M8t+CmUkKgavt3c0
         IrUw==
X-Forwarded-Encrypted: i=1; AKwUvBy7ghizN1diNOYngtSHjDxjmeGYyHsttnkgH72DiMsPBWrk+a6XjToABdpLtDAZ6KJx87Q8hZ+rSDQ/@vger.kernel.org
X-Gm-Message-State: AFq9FYKYyvggu65j7VkKszpc2xhGpCbuaf1BbhLgRjDLmQHvLutRCizE
	K418FP+ntUXRYviismulqr1MTpjgH07dfqzpeC4Su7jn3ypi7JPeCIwh8YHLY28IlBWAPdsy8GV
	ySSnbgOSTWQD7vw829/0qAIxn8kzrn2EfJyznKR6OfZwXlbqgeMtlbMyz/Sl8Oy0d45yj/4eh
X-Gm-Gg: AYBFou1Ft1aXtkQotzcP0HJCRGTN7nM/QpnBmRffB5T6mIPIKq0VwEdok/jBWKs+W4Z
	8PEj+nrnQ+O2ycTYjV6wR/Cjv1J9QdeQWbcD81v7QQUOd02FrGzhCX+3U5yvUX2SJXEjb3fAuCn
	D2EdFKVzRxt1/WmTQlz48SiSwLsK31GXNVu+9m+ebp7M7WlhmLP6eCKgjeT8K9/eQWpeJe+4ppE
	WBV3eDUWEfQkg849yBPzNAOcyXkYrYYuqovmav6R0V7Oio89dOMeIMUNhTbGGwF4rn/O36ay2iy
	IXJuYbGmk2IJNTmvrifMOYbPTDbqsKevfYja/jphw1TK9w3bnHlsNaHDKHzO2rOGXJVepUjSqdv
	sG2cfGglgl3Tf1/OUbXbiFULMbnFZ
X-Received: by 2002:a53:ac98:0:b0:679:ad95:8ef8 with SMTP id 956f58d0204a3-67a454404edmr7327243d50.62.1793104450393;
        Tue, 27 Oct 2026 05:34:10 -0700 (PDT)
X-Received: by 2002:a53:ac98:0:b0:679:ad95:8ef8 with SMTP id 956f58d0204a3-67a454404edmr7327226d50.62.1793104449862;
        Tue, 27 Oct 2026 05:34:09 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a4622e78esm4690840d50.12.2026.10.27.05.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:34:09 -0700 (PDT)
Message-ID: <5b771fac-68fa-455a-8970-dd42b4e41e8c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:04 +0530
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
Subject: Re: [PATCH v4 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-4-258ba9612da8@oss.qualcomm.com>
 <20261001130511.C511F1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20261001130511.C511F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX1On2QSaSaFVv
 wkgeXBA7ZL9RfsboyrNWEUJquUet/+ymoZWOF444/5f0sGxyu7u/ZC4E9HAzERxGDxiO11iroMC
 T6Jk8DczTaZmX9Jo0RT+OQLKBoap9WOvAcmCDK4X/2TZ00HJSvnB6MapnyZj5V+fLPH/vZerZbN
 BHdzobAK2CRkHkNavdLFKHVpMw7cDoZMettvm15oWWafbymVbYI4MK/IX1cK9XR2fwh4+9ePcQH
 2KNmKYrvGcXwyvqJa7CBvyjx0frhqIBeG73gwi5Qc49TXllb6cZKz8/pNXKdF017gOUGra6Njza
 ISDlYV9BL+9XRz3RgQHN8OT42WX7ZY41+mP9NmFui/T/itiGh2c+J/qhWNhH6DUyd4JsEI3OKmD
 6cpBp9xGdGp2X9jnf5PwBdMf1Y02N0zxfspIry/cZ9keRVmv61vfqDGEk08MFiCZxAEx4vfx3l4
 HoXmN5sLzuvvD8jNHMA==
X-Proofpoint-GUID: 7oUvVEuYQDY5Afh5AV_UqvjZKKkisIXZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX/cu5Q+jLndFi
 f7p2UuhUD2n2fyP4B+XaBAeFnQVZ42onAnu89OyRaW63JF50Jux4W4tRXLfNr8TFDVs9Ehh6R+b
 v1F/7C3D6Xx0tou8T3WHR9M6/uFa15g=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae09a43 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1V9zyztEnOGGBHuOcGgA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: 7oUvVEuYQDY5Afh5AV_UqvjZKKkisIXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270049

On 10/1/2026 6:35 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] regulator: qcom-rpmh: Use-After-Free due to devres LIFO ordering
> - [High] regulator: qcom-rpmh: Data race in worker thread bypassing regulator_lock
> - [High] regulator: qcom-rpmh: NULL pointer dereference if delayed disable fires before init completes
> - [Medium] regulator: qcom-rpmh: State desynchronization on driver removal drops pending disable
> --
> 
> commit b0211424f1ad79c3af4f67d5c03d4546a1bd442e
> Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> regulator: qcom-rpmh: Add debounce delay before disabling regulator
> 
> This commit adds a debounce delay to the Qualcomm RPMh regulator driver to
> prevent rapid disable/enable cycles. It introduces a delayed work item that
> defers sending disable requests to the hardware. A devres action is also
> added to cancel the delayed work upon driver removal.
> 
>> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
>> --- a/drivers/regulator/qcom-rpmh-regulator.c
>> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> 
> [ ... ]
> 
>> @@ -347 +347,54 @@ static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
>>  	return ret;
>>  }
>>  
>> +static void rpmh_delayed_off_work(struct work_struct *work)
>> +{
>> +	struct rpmh_vreg *vreg = container_of(work,
>> +					struct rpmh_vreg, delayed_off_work.work);
>> +
>> +	if (!_rpmh_regulator_set_enable_state(vreg, vreg->rdev, false))
> 
> [Severity: High]
> Does this worker thread modify the hardware state without holding the
> regulator core lock?
> 
> The core consumer APIs execute under the regulator_lock. Running
> _rpmh_regulator_set_enable_state() here asynchronously might cause a data
> race on shared structures like vreg->enabled and vreg->voltage_selector if a
> consumer calls regulator_set_voltage() concurrently.

I checked the driver again and noticed that the check for
(vreg->enabled == -EINVAL && vreg->voltage_selector != -ENOTRECOVERABLE)
in rpmh_regulator_set_enable_state() is only needed to cover the
case where there was a voltage vote before the first enable vote
coming after the regulator's probe. After this first enable vote,
the value of vreg->enabled would always be 0 or 1 and this check
would never pass, so it can be ignored for concurrency concerns
with rpmh_regulator_vrm_set_voltage_sel() which checks
vreg->enabled.

The other comments are valid and I will address them in v5.

Thanks,
Jishnu

> 
>> +		vreg->last_off = ktime_get_boottime();
>> +}
> 
