Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C625403B1E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386049; cv=none; b=NWh1bLMDzuXcFdkSx6GvbJZX4LVdU+Nwthg5oq1rabszJQoYN8z6fmPYyi61GPewdmaVnZRMrW41wMak/v1Qdb2qdii4zsq74Hjj5XsDSHajz2slYB7O68wc+v/bGLRc82fsxppQ02Ca8pVQMK2rsOX+8k1DeUXTFDVAESAyFEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386049; c=relaxed/simple;
	bh=K+4QUmI2FHemQsCM6LPm+IF7KDqWjOzPmXdCgDeqkBI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mHVdOdmbz3IvepO2W2pyAwZaapSg8mTWp7oRkmYfQQ1JymYAKorsKr35/giq/MwFkN/sthAABJA0ZO6TvHivE+yN7VjUnI8H0EBTo0mKL8L8GBIhIV1jQ5EHbrJ8Kd6Ub0eGL2XPcxIlRESGIDxUsnonYIYoHsJGtsx2yam/fCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Knfxpf3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GoyqzqVH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Knfxpf3F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GoyqzqVH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4itpY1747643
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hx0fhj8bMrjech0/jwiRrwoQsgXvjpvMtyi96ZF6zus=; b=Knfxpf3FhlkJsxF3
	OODYRgnnR8u2ryagWKXc7CSl76CDKpXaDCrkVP+tc+ZlqQB1St3F0LLTrKYjnWl2
	g/SMxidwxcTYUjpHP501UN+OgXLa4AIANvREd11o6cbyZ+m3Ra16ExIdFnSgmsPW
	RAHboGxPOu+1jEv/Iqpi/1yunewm6aJGJOeDVJ2jMN7zeJNhymaPrd1IdxqJPMll
	f1K/vPa1PceF0DfhN+j8rJmiKyGzB2hweDgy4FRJicqtMbx8odMGo8Gp9Q+wfPxe
	gUVVrFiNIzVvQp0SsjY8OGt21xhvFLumfGu8DWr9TdgwS0WnS3Ha6Lx4idJMnUNq
	ePZ4sA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc183cw3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:00:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e987ec84afso15680975ad.3
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 22:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792386043; x=1792990843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hx0fhj8bMrjech0/jwiRrwoQsgXvjpvMtyi96ZF6zus=;
        b=GoyqzqVHbEvgT+lzsQU5zOKoo/XUy8OZTLvaPHEA/dL6f6UtrpBWwsVMDINOUv1GXa
         caJww/0Gl30B7Ngdmtp6794F2Laut0MkckMPqsS+GFFI7ngvuIXi+JT9QsGvuiK0rGwh
         g9C0TMqt5O2wG3RbUdMYExfZnp776yQgrXbtKpmmx9T+oo8l+n13GrG9JD2YycVqmQDr
         MCLHvGtcOq5Zr/ABXedmUgV/NgOCuIQX4Xt4v8svfBinYUduBribsqwOFCDUEzeimNaw
         9j4J3Z4b8WHw+XKDt+D1W229SlLoq75+Zo7YGySiSzSWv1NobGZO0eyU65ElMGgfjo9O
         3wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386043; x=1792990843;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hx0fhj8bMrjech0/jwiRrwoQsgXvjpvMtyi96ZF6zus=;
        b=nvoe978vYbe/EEtiM6NST2wRKxIxC29ENj2w7XQ3/szq4Jq1BfHw3+zRrLaV92NQqr
         6Mo9LoH8vzSsGq/rpWoFfUoVQqLapTueDlo8nZjimxgdIN/bmiQBsrak/BazNI9DYahb
         eQWwXLywK9xyCiUyF9EXDU2rlmqgdq0MdgOdIlyJvjPNxM9XQpvFafxnSQrzlvRolTV2
         OtSjPyt2R1NrPBVtYa3KK4ykxhoC4JOic3O09Q7/LIPK+s6egHMhWBT56uufoBnHpmV8
         B4bLDFZ+Hy+WqBF3IVjuoYnygYn31ucf2V8j1bUBmVe4ms6P+4spmSnyjku3ZzdcuYon
         hsig==
X-Forwarded-Encrypted: i=1; AKwUvBwSyKqJtgURESvcFqtHc4IShALqk98gGt1MI4AdMX4rTesjLTcutanBZm0INytPVh+m01Gb/KUZQO/b@vger.kernel.org
X-Gm-Message-State: AFq9FYJu+pt5RUaehsa8LunWyhjRGwyxN0U7twr5cDeQgZEGi68d6MKW
	+kQR5pLnrqYIkBKzoKIzv6HN+8E8xOSlGzRg5gNXD7YBQEvHSuQPek6qpJp/caWYx2Q0eQjxGWH
	9GgN4hHY2Ah0kfEI2UeuqT/iMLVQZe9SSBBOH18WRspiYyG9gebID6ifgGVdt5cGlbZdispTL
X-Gm-Gg: AYBFou0ohPTmIx7aH5JXQ64ROv+IPe3xuUiVikTVukr34yUpuhVaN1eoAUKy+0ja3BR
	YMEK6YOGv1TlkEFaPypM1bkJaC+NhK07gGR39ST7VR+WQwkHAY5dY6sNP+R9vcnWvTmMyrChxxz
	d4dRhqKz/cPteTRbX7rxJGsTOS+velpLpxZZR0DzGnoVB7msldMPYpwyDOAxIGNHJ+haexH0Pxe
	jcc6l56MwuwsBHokTMLbhg4Vs+/CvhWDludOLSxu+d8Tz7Qv8YZm/yGPqwRETqpqUJCYbtiirUH
	t3xGjmbOc7Clwkip3Lx9Reok+xFxZFIJMFdlYE/zBB9aAIP9SM0DwTmvKmrlsOPsNZlbMI5o8Kb
	aCjR1bDqPTXDNsU6+1jWmBYW3zscf
X-Received: by 2002:a17:903:1d1:b0:2dd:c053:ec75 with SMTP id d9443c01a7336-2e9a6e4378bmr56414905ad.40.1792386042579;
        Sun, 18 Oct 2026 22:00:42 -0700 (PDT)
X-Received: by 2002:a17:903:1d1:b0:2dd:c053:ec75 with SMTP id d9443c01a7336-2e9a6e4378bmr56414435ad.40.1792386041905;
        Sun, 18 Oct 2026 22:00:41 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e878910sm33730395ad.61.2026.10.18.22.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:00:41 -0700 (PDT)
Message-ID: <88085b6e-9de1-4056-9ae0-489cbd866601@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:30:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <sashiko-outbox-171156@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-171156@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfXxHjLuZ2ZcIge
 +VAQl14gmcIa4LuERMOns0JYU1LfHT5F8g4WbaZMBNHZntvZK+CLk7oVm/ehugHIj1jgP9ySEJD
 di8802hlLqR+1DiKpV5ZlpuYbPtlgb4=
X-Proofpoint-GUID: yPNfpo5FSTwHvl_gq7SNEv2runmjmChd
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad5a3fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=cRC-_68V1cTd_MlQ6vEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfXw38bIcBt3R8M
 fefUmbjoy1ivrwWYbRotKbqE2Anen8Yz9EwpvuZFlW6P3HYbre1C5G0ACP0O57rgAFDrmFlm4PH
 uIpggt3rm5AmrsJbtLdSiHBUedMCZognlBAGPYcOhVYOtGxt51Fl+3l8DevdpFhAOJgBFZh1aoo
 PLc9MhwrJSKiTdRyecjmPnEeuBWtTcD7bcEPvKAavLerPjtboMY1lngBV6spjr9t+JA5MbBv/GZ
 Os/haUG2vQ91j2l/dN8wh+rEh2YOJOMHlV5Wr1Jgl+MascLs4/k1F1lXLekGIzkydiDLKOdFrj/
 y5ri3fVLKd4V3O7wUl2rEzbTqUZFFsQ7xr1SGCmW8EqO1ZZ0jr5kL330+MI9RKD1W5tNZpA1BHv
 N//+0dS90lq4gIui7FSk4UWRSxrMyvRj8fRDP7N0mnGJSRY5zCkW/nyyiKeGI/xqRcTUq6wiq1X
 x9uVy1Fl0U6150Jd2mA==
X-Proofpoint-ORIG-GUID: yPNfpo5FSTwHvl_gq7SNEv2runmjmChd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190019

On 10/14/2026 4:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] regulator: qcom-pm8008: get_mode() reads status instead of control reg
> --
> 

...

>> +static unsigned int pm8010_regulator_get_mode(struct regulator_dev *rdev)
>> +{
>> +	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = regmap_read(preg->regmap, preg->base + LDO_STATUS1_REG, &val);
>> +	if (ret < 0)
>> +		return REGULATOR_MODE_INVALID;
>> +
>> +	return (val & MODE_STATE_MASK) == MODE_STATE_NPM ?
>> +		REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE;
>> +}
> 
> [Severity: Medium]
> Does reading LDO_STATUS1_REG instead of the control register
> (LDO_MODE_CTL1_REG) here break the regulator core's set_mode optimization
> when the LDO is disabled?
> 
> When the LDO is disabled, the physical status register indicates an OFF state
> (evaluating to 0), which incorrectly falls through to return
> REGULATOR_MODE_IDLE.
> 
> If a consumer calls regulator_set_mode() with REGULATOR_MODE_IDLE while the
> regulator is disabled, the core compares the requested mode with the returned
> get_mode() value. Seeing a match, it skips writing the new mode to the control
> register. Later, when the regulator is enabled, it powers up using the stale
> mode in LDO_MODE_CTL1_REG (e.g., REGULATOR_MODE_NORMAL), completely ignoring
> the consumer's earlier REGULATOR_MODE_IDLE request.
> 
> Should pm8010_regulator_get_mode() read LDO_MODE_CTL1_REG instead to
> accurately reflect the configured state rather than the dynamic physical
> status?

Yes, this seems correct, will make this change in the next patch version.

Thanks.
Jishnu

> 

