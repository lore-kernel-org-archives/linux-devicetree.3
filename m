Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C856F31ED7C
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374591; cv=none; b=QmXa13MnLfGewPjKM8kbVrXsP/4KQkvjsP1M9DA6AXBcxUvW1Wi9jjTCZ+9fZd2gSakp6O9IuvnQYejWTkrOPKDq6zGa4CqZGC4pSOor1fFb99qMArZqnMaH61iPSzEpsZsdoe8ueUAn+7JC3NK6LzrqomYfVe5WwTwRGzRiBkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374591; c=relaxed/simple;
	bh=+LeUK2W5WFxMKhi1pUwMIkmIdcqHQRyIWqYHLGd/T/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWDKrZbibh1QNZAEIMlhZDW50u2evUT0fNfKq+RboxMKpHI4sI+1BmyCX2c/GgilOHQaHAqaH54eif98WQUhizQ6L9mXSAOLJ2BdU1SMwAbH2h3daZ5i5MJYPojxHw1AIX3LEuaq5ndw5CK5leffF8vRmnQa+dZeLSlAUCyUH+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqIS9j1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEGvldsS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqIS9j1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEGvldsS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eEMl577527
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 08:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=; b=AqIS9j1to+afer2w
	TBq4LwesK9SicCLGAyGSt08s7w0zPebsw7YZg0wTrIa8NQqDpF2CSvLrOXzh1nK1
	vwaNumsxuvNfWr+X7k0wcoTa22j8ydLkGKabfRLryANYtODU8Tmbx7oPyb/LxLFs
	SNNse8jCF7jR/jxa38+qzk4X7y2HLWd8KB6R60skirMK/VoJtCuJzyfYch7Q+gTb
	zQgdD9V9PGVtkmlsQ0EeHj0c6DnHINfFDF7siO9XMm1o5YnzJZGh3uZAsRfgJEE3
	pA1cvXx/ezBX/dX1RgfKIF8/9u/ZW43exOYR/4dEBrLEcWau0zPWit3kyR9rUSBR
	ds1/WQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudh2xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 08:03:08 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59c09345f05so63850e0c.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782374588; x=1782979388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=;
        b=AEGvldsSKfHU7MuVHBGJyXthXCQVM9RC/a6LBzhnlduPif/3pXJY0bq/tRFOZABg3/
         na7BYBdKwOm2+/gHr/Yi2Exa06G2wq0rQu/rALgxuKbIkIL0aczAHVXVDpmZmjK2o/D8
         agdcCJkfhZ1/5n3QVSp19i5ooPODkdzskO8lwo2eturfTx8HyznS9CSIjM9ZM8PkHjve
         jxcVNGS2Y6wZlJ1/QulpjIbys2iY+xQLzPomUjPqrofwQwfAwT/3Ga/sjKra8q1OUBcw
         4RWeGRGs8vTCwebhbe6GzWMx46b+VqqDFHxWCeUZm18muSgnqG7h4QrdwUIfz9OvckAe
         R+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374588; x=1782979388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=;
        b=D3EfQXPICz399l1YB4vJX5NJYFZ60CUQyGR9/yvJFxx8ONvuWY1YCTqsUYdaaeKHqG
         ohIL8Y3eAzJe0Z2HmfSodAAvTE62yFhyJ3MWE0jAAACfV0vXA42S9npf9QNUMlrC3I4b
         9WMvXdtWx9qku5H8S7+7Ct7+0L4+5Ok0FS5lbLnVH0XCpKMaNkZJWqc/EBBIdVSlf9mR
         qVXGpCL3+W/Kgb6paBwLKydgu9YYSoYmMg+VLSUjqy0RwKQtTO9JBgJiSqS2Xwwu+fHW
         KIDSzkdLmIsJkiwDWIf/ewZUu/zc4JeixF+UWoao8z03FzfHSO5q1xZkwCf+Vne8I3Hn
         ej2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoW8uQZY6UmGA9dzygxMIvo+Zt25b2v+O6ROfJYPqVySjt1EfcUEI0G/O2dMpgDC0RDzGiuW3HDgAi8@vger.kernel.org
X-Gm-Message-State: AOJu0YxvieLufeMB14u6eLw512Gz75OYSv4QxSmkl4CgRebQwAGhyQ1o
	XNwU4JVg7HOeK/6Kra3apjpHodUpc2LNDOSDOCajFIYya7Oul7bnhHUvZb+ihbrLdlQ4JZdvT7Q
	q/9kINHCy7PWYTx2TQo89FKpJI6t3K69coWV0v/t7OGkN/jw4NNeplytwN/LCOpHS
X-Gm-Gg: AfdE7cnSeR9YwRhBFhTbUB5UClS4NFtAJ/38781r5pCf314KNrc9M5gMVWKMTQHwSlp
	pstp79ZmQVsdYtPV4npnp/A2bSQi4hFnr92xIihW4m/seCkvw8GtRJ1du+zB8HORMMzqUxdg3dk
	4oaLu3KDopZIOWc0vK5GLvaad90d+c33Hst1bScyqsdMVEB9D/c4Gt+XZQsTzkzyg9ROpYkoaKd
	xa2DBHIX8l7TDwkXKecjxpJesrY5lpc+kRQ1fvmHgy3CvcXfpGon1skasTFa0rRPm1g/JYzh7qI
	ZaDBOlwLtg8kEDyvkE1Ty6bjaa2Gz7KTzkr+47F/r8IzM40RUPke2S29grAUpocJjaGmQ8yq2LT
	/qBbnM/ZOT7yb9GfTHT00rIKg9qPH5K/GO58=
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr157863137.4.1782374587904;
        Thu, 25 Jun 2026 01:03:07 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr157854137.4.1782374587428;
        Thu, 25 Jun 2026 01:03:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe59504sm121399566b.43.2026.06.25.01.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:03:06 -0700 (PDT)
Message-ID: <1d26c917-917e-41b8-ad52-8c1f3e306ce6@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:03:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2OSBTYWx0ZWRfXzJN6FQWL0FmZ
 gdAyJbRo/fmjOEoENklOOeiCNwEqL34eFC2tnRfI9sBk6eBMTz0JxgAcXKE8ZDxH1dDi4Zy1TzM
 Z9Wr+wMCHo3JZnGKmVgp5tbZLZz1dt0=
X-Proofpoint-ORIG-GUID: py59_32BLixYwsi2S91pwRn-pb5dDxg-
X-Proofpoint-GUID: py59_32BLixYwsi2S91pwRn-pb5dDxg-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2OSBTYWx0ZWRfX1qVm8UwuMpwu
 l0Oz7KT1Br5d1TXMbgda2PL0/tUQwPGZx/IUU/4+VE9ChQLOH9grkxXrw0LcU162n78g8bwuEUB
 HOrx7hNc15cMVjnvgw6GZXjfLestvnlW/bee/dLj1SLuv1xWjmvo1eopxskpa0BRAB8vHB1DL0Y
 dCj6FyGszym/bMs3Y+WkM3Yq2rsPen2TVDb/BWAcL7MAaue9j0ADDrN6UBbVInwQ5693LmGJsHM
 OL6lUZ1XlRYO8VBPBDLM//84aVtQCBfMIuN/BhR4dJMXX0WIUgFSYZV2JD/cTARDDNzL/24uz/H
 kE6xqD+EF/L3IN6mB8Xf57y8C3bacvnaH9hQ8KC/HCKvhF4tJKMHd4ti6FhS4BldN28WvsdyFDa
 mKtaId1uFbmkv4nWpbjTL/hJfwvHs/OlkQCDRREqQOTriHCu7ZzB0QjVQZPpzapuNrhdWSAgCgV
 ROA/S5Uuo2dBC1KwxdA==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3ce0bd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3l1M8v5O_xJZoUiDCkgA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250069

On 6/24/26 11:08 PM, Daniel Lezcano wrote:
> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
> 
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
> 
> Additionally, expose the system fan speed by reading the fan RPM
> registers from the embedded controller.
> 
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures and fan speed.
> 
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---

[...]

> +	case hwmon_fan:
> +		if (attr == hwmon_fan_input) {
> +			int lsb, msb;
> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);
> +			if (ret)
> +				return ret;
> +
> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
> +			if (ret)
> +				return ret;
> +
> +			*val = 0;
> +			*val = lsb + (msb << 8);

'+' looks funny here.. although t14s_ec_read() only reads a
single byte and assigns a u8 value to the u32 that's being passed
to it, so it never *actually* breaks..
 
[...]

> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info t14s_ec_chip_info = {
> +	.ops = &t14s_ec_hwmon_ops,
> +	.info = t14s_ec_hwmon_info,
> +};
> +
> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
> +{
> +	struct device *dev;
> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
> +		{ T14S_EC_SYS_THERM0, "soc" },
> +		{ T14S_EC_SYS_THERM1, "keyboard" },
> +		{ T14S_EC_SYS_THERM2, "base" },
> +		{ T14S_EC_SYS_THERM3, "pmbm" },
> +		{ T14S_EC_SYS_THERM6, "qtm" },
> +		{ T14S_EC_SYS_THERM7, "ssd" },

Makes one wonder what happened to THERM4/5 - may they be dedicated to
the 5G modem, perhaps?

Konrad
