Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7A48094D
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905767; cv=none; b=QT6m/OIztEgHgZw74It3g1ieuZM4I9nWcL2ZcO++N4YM6NO2JK+UF/etMvwJWotadAcLmilqNiXUTWtoRA5aMulaexMKJYdJcCsG2SxfkDIzfsmdDwheU7JjBpu83wHmqfCambPCmcLDdbJ+nL5VkjUxnDzo+wAwk53OKvddUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905767; c=relaxed/simple;
	bh=0bnCOKwnwDk+tMRIOsO1oGgEBVECcQ+CY1lwPvpyynQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoOST7Sqkgl6uUplvrukMINfmmq/xNmQ0fOZ99gBT1cuM5R1OvCNGnZ+nrYDKWwPRi7BZYf60KKjTzJvognpLhX9pB8GS7gfx3lCoq40t4fXeT9bikHRFYcSRrhoFnmQO/ym+5sJJhxHd4H6BbJNrxbabpdFN/KByeaQ1uSDJlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtbHzlm9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcCksVrD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtbHzlm9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OcCksVrD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8OtX761381
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 11:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kFcErPMbRrdovsdBegssaIpyzx8eIkEjsztaeNSdBpA=; b=WtbHzlm9h0TEMadR
	XL4kW5eWupJqyzZGgRUlmvnchgfmItEyza1BVeR00780GCyYdV4pYxT3YIiwMgTv
	/rxAnsn5VOSS7/EWw9DoiI5eM7TflmRk/yLHv6D3xaoMcGglcU/n8yxWWnrKUlCu
	K5Xmz+iijCjlSm7clqdM/9TCrT9iswZViBpJfDI61ORBpTAFOBnAmraCnLAckxf7
	sLAtiAdBzag8IFUHJAcs7OisWVDpYEfGQEzUdDJHVuIVmpBvNSAaPQYm3d40ewRw
	57FgUWPKZouvmS7m3GDDz54LxpYihqhS9VUt+XL/2/OOJ3rx2KGUe91ZsQAwKUVr
	0rI9vg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd0cxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 11:36:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so1072391cf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905764; x=1783510564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFcErPMbRrdovsdBegssaIpyzx8eIkEjsztaeNSdBpA=;
        b=OcCksVrDYUtuLUuNaczg1meuxhBmdSV0bC3DCbbOFBBzUqvJaoGsgngpQPCDFAZCxg
         9CBNCOG2vfcT2znfforN5RpGWmlzmRH2nnNv3zsZIzhZZW0PDuSBT0u8UylRgf/IQV02
         UwGgwAvl0CF9x9IGtPst+WCgmmZtgm7j5UUJN3AbknrQ5tkxl4Q5nELCs618pwtcBj85
         F0WcKSfUH22fxBrlUJDvsa1f7ZDIhzdvb9pgJckgnTW9+52UB0Q7Mc4iUvztTVvRAlKP
         J5BAX4XoHoWoinj2qIehWRmSqJNxXE0YXWS1X72++9tSeoUmvWPmxQFodb1Cr0EDfwgh
         K42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905764; x=1783510564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFcErPMbRrdovsdBegssaIpyzx8eIkEjsztaeNSdBpA=;
        b=ZCwrAfc7WkAd4K6UXXtSPzke8GXPaTo9dti0lH2GfRVIFuUNx3zoYIasdioa0s2O0E
         nKLf1TkKT9jYn7s4k3e/zSuakncHTOUb0O/8VGU1kvyqHc11B1yr+PXOkH/n/NpbLEdl
         KU1P9V2eykt4HkT+MiC1U1cMv7Z+GTZvWf95+wEAPBDjtkrDeJiDCrff9saNOMYYHnaV
         Dlr9Okm/M9UerVaA3qiBhL8uKAjr91a51HViFkKxcRgj9adTmJXgqIIOclYG96Fwfktr
         nODhI7iY9ZVD3bu6mT5lhmkXwiN5vRhRzbiei/H3q5aDqjGjlGAGImuc1vx3DI9jCkZ2
         /rjA==
X-Forwarded-Encrypted: i=1; AFNElJ9IpCjjSz5XbqSHqadNakx992i7RZgyHoXGgOEBVuueJB6S7ZNJMSRDm1kEZ5bsB3VdtUg1LnKWgaLC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ZyV1zCibYmA2kbmE83GaGFuHr4Y1W0bHS/A4RNPa3SuHc3nd
	V8im49C4XFDwpXv+GShub0UJd2cpigC2RkhcPyzdByEQjWv5gf1fzGciOLKAXO18WRE+4hpwZWh
	lHrf6ytozJzVXOnSpq1dol8pZSq1P5h92qAoGhxZlx3/RKx4NnD0TtM79OtL4yByb
X-Gm-Gg: AfdE7cnUWApW+aLlNtQ7RDSiVwXOMgl/LTnPdc/5bEKZ81rVIhYG/QY3rOBVoDtJllx
	VAp63SykYns9IWjsorZxLbsKpg3z1bdTZF3mgTysZkCpSkCkpC+L/648li8EKPBzRpnWuEH0On+
	qa61Rq0SC3hsyuCWcJ4gQ/8gycz/mrCKsdev9uZUv3+mPZIxL6ieOlafNeWFc/teOkW20ei6JdX
	hHSrBi8Px3xBiP2DzC6kJj48ANna+87Jf29EgEajTyzDeDjD6855yYkrsMDGP5b0ms7OgkGnk0Z
	13uJtH0NXNBrXlzJ5i1Bdo0FUUP69M27SujFRGcbvcaZd8Bres3kBdTO8ecB1L9GVP6OeCTNVy1
	9y5RM56Rkf96Q3wTxU0dQfvJpB2zgao7WO3A=
X-Received: by 2002:ac8:5a86:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c26b392eemr8153631cf.9.1782905764393;
        Wed, 01 Jul 2026 04:36:04 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c26b392eemr8153401cf.9.1782905763876;
        Wed, 01 Jul 2026 04:36:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3a3d9bsm2567782a12.4.2026.07.01.04.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:36:03 -0700 (PDT)
Message-ID: <58dc9bd7-0025-4cd9-8318-960bd0136015@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:36:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
To: Rudraksha Gupta <guptarud@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
 <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
 <1bf1558f-19b8-4052-9609-52039f820bbb@oss.qualcomm.com>
 <6e3b1279-61c8-4bc5-9f66-e437140d3074@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6e3b1279-61c8-4bc5-9f66-e437140d3074@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a44fba5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=oA5LrNwOAAAA:20 a=9AdMxfjQAAAA:20 a=EUspDBNiAAAA:8 a=CQK_wUJZO3GTBjW-OcoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: Je99gKTsf4QgB3r8Rk7UIoRfq7Zngxxx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMiBTYWx0ZWRfX1RfVfUcev8Zh
 n41XC3UleWNeHHKNdnPE3z1auFpRD0BWyWUCrBh3EG5HVq0kciBOsf4JCALcNVcL3lMf1SmlWq3
 zz8t4luGbHK1+QFpTAGjpUsN07gvSew=
X-Proofpoint-GUID: Je99gKTsf4QgB3r8Rk7UIoRfq7Zngxxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMiBTYWx0ZWRfX3fJp3I0jrrKp
 QJhX+N29w20jWm/EyWginmsYTsboWVTGBMitbIgCPmsPZoILQ+cHYIJzykCOEENLzlOhjphDJ4s
 dPzvww8E4Oaf9vPp5qAMb9QR7kW0cjO3cLd3MkQwXo6A1zSptviPo1hGNxq4+czieyq2VwALqBJ
 ydyZXg8mJ2M99YCzPLvETYEbJFy4XEF8GuJGvJuFo43ZIELPpkVzX7bs6H3O/8iHHeNyIOURvzs
 IZsvE4N7wi9I2IBbkQ+SJAiIoQwwHhaf5z55BV6PKpqFyMuypfkue7W9577eyhvi3/zibkjAmCZ
 MZHn+ajnr/wxQsZI60BOKvJRsf7IzkhU/YvnVBUdx5Upx0OpWNT8xmTw3KaW1NX1zPzO5VcQNLR
 bnuHHolUVQF1kI5u2durMO/MuDs73abe1HQjyjLAASRqBqiDBNvXReoHz/dqxq6uJO/gjkgLsTi
 gCJi2qKqlLOlCE1am8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010122

On 5/28/26 5:05 AM, Rudraksha Gupta wrote:
>>> +    .seq = { 0x03, 0x0F, 0x00, 0x24, 0x54, 0x10, 0x09, 0x03, 0x01,
>>> +        0x10, 0x54, 0x30, 0x0C, 0x24, 0x30, 0x0F },
>> I can't see these values anywhere downstream
> 
> Hello Konrad,
> 
> 
> The .seq values concatenate spm_wfi_cmd_sequence + spm_power_collapse_without_rpm:
> https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3265-L3285
> 
> These are passed via msm_spm_boot_cpu_seq_list into msm_spm_data[].modes:
> https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3303-L3369
> 
> msm_spm_data is passed to msm_spm_init():
> https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L5510
> 
> Which calls msm_spm_dev_init() per CPU:
> https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/spm_devices.c#L221-L239
> 
> That writes each mode's .cmd sequentially into SAW2 memory, bumping offset:
> https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/spm_devices.c#L148-L162
> 
> The upstream .seq is the same thing pre-concatenated. spm_retention_cmd_sequence and spm_power_collapse_with_rpm are omitted because no upstream platform uses PM_SLEEP_MODE_RET or PM_SLEEP_MODE_PC:
> https://github.com/torvalds/linux/blob/v7.0/drivers/soc/qcom/spm.c#L134-L249

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

looks like the other modes (power collapse without/with RPM) are not
really supported - perhaps a good thing to add to the todolist!

Konrad
