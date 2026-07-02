Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976B8426404
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994661; cv=none; b=pcVRRup3d0/qeQy8Ih+42wGLYzDU3ogmKKx/AQl5vi3gxhRPuU2uwM49CTs87/ImW2sBiKuHNC6eg3D0MaK7LG5K/I1GCqG4kxYTe3drU+CkraI2HErxuJpaMeJ+4xYP8Ys61LeXz9YEUwOzu82/JApUSwxm5oD90i6R7ujjzVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994661; c=relaxed/simple;
	bh=d2zjVFisejDw5DlWK3026+2i4XLfiQgYGnyp8NqtcPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXbrMjf5so9UeyZAy9hcLt3eJSUzZjiM+Yza+ix4MEwnuGArBZMbnsfFLiJ+hXUrzWPFYfXbtViS9rKol+rz2zgbey7MbudKcbGlWwjJI/daa+g9AnwTNQ6K9zqZ2fL/S3Hyf2UhRfYYjjp9ebXGJ8br381UL7EZRvtwTFe7Yaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/7bB8IL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1H3iuTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/7bB8IL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1H3iuTJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sJi54172111
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=; b=k/7bB8ILtTDhbbU+
	q/jbwd4Ps+xgqOjcsez/it8MIa44mRiNh03RNDg+3t824EkvbbLt9A3v3UD4dbLE
	ssra3Hs3MkmNwczHwFX0jO86vm4DHoU3WzVFwAOEN53E+OA0DauuAtiIT/LrOTCt
	4ftFjypqoD/H7SPlkJRGGbJ2TnGYKNH5GBLsyNLuQpsN3M3rx1ffRMYQ96QNJ/Ib
	FZhmndeor/IuBW0f5ljHCmclwQkVajnNoKO+NKuaXdoqbP3MA/437fgxSJw7uD1K
	iPtdVLhU2E3Ly3j1HpDeuLIHSB21e8rBJwO/JrGaxsdWL/cqap9UKTZq33QT5KMY
	dFM8Lw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwrs4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:17:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso4643401cf.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994658; x=1783599458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=;
        b=b1H3iuTJRjEcV2KD+gpqTKfT3QlVRAIXsduUOCS4ojpuOdGVx1g3td532a0s5WInp7
         2jUvWxaheRZ2+oxzIeqdM4Kkuy7nJMNm7ul+X0Ebm7sf8XSUikUaGr/K9p2HluOqDT1A
         y37SP6hIOXCXJUu9ucQbTbz0Z3RVadWo/5ytXP4rY8RuySJb8MEkEjrWAFmoTuedNEvt
         j6w+3qdLttWex15pr/I8QZJqBbCwA9J/WbED7P94K+U9Rjx5ij04idx8jAP4mdiL5KtK
         DGLlsSBHeUZ1nlbWlyIu+smbAQF9iDjw0E1TciUoNpODEHMDRKtxi1tvwl7o15/nIE0O
         koUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994658; x=1783599458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=;
        b=CvC0wzws4uTa/MiiZKyKlhJFTSnt8VmVP94TJd0sNYcYT3yTTdN+iz0wvudHN5T76p
         4+0mDEvWjzcsH0Hi6DbRXVfgjTcmemmwnsvClYA1POnDBgHaaM4RkGwqbNWg1NhzDFfq
         9k7ybYbTgLZ/unK3bnfge0FTQU+EQWRvyuplnD1jHZDgtJIVvcm91hdA11FjnKrzQcnk
         tKC1/Ak9e8SaRQV0ZBkHwm0tALXZImZxqJfM7D1Ut1crUrIAB2rMsRgbQM4uyh7SJR6G
         YeqhbqlSGA72EDl9ReRD6w/spSWZxezLI+vaMCiH80jOyuHWFcHXWybwRgaBE8AnVd17
         q1nw==
X-Forwarded-Encrypted: i=1; AFNElJ9648gqnACy2JLq6fLJG5xuZn7sUNozkDFfiwP8W9py8Kmbk9v74LWrpyKVSUfDa2Cj65e34Xkvx/q+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxf5Wc8eXt42P059zGJLp9MwfPCwTapXKb57ufG12fNhcJR59l
	gAfBjYk4pDAveGSPFKhWUnfrEZDirD2xX0UgNSlPWoBKMfnf0+RDbr6Cnk78WQzeCqrh0Up18bb
	tMvAtXV4zXG2K1fIPkxXHkWOL3Zk+n6iAWBop9X388oJzONugm63ir4s2YjWLQN4E
X-Gm-Gg: AfdE7cnB1ooL4KlVLWgZxG8FGvO4lYqhNcTKYELeUiIqLNxMwyCrAqIIxFI6SVVLX/y
	YaW2AG/XlBzNimfy2tBxFlFmDqdkO/XMu3vhcndwlPbDPeTAJ53dM24DvVkG8bDQ7zEABw2zNBT
	GwPJL7jaT0eMFcJcfd6dFTstyJrQRTpBsyHaI5sQt6omgxcEjB9LG+aZR0ShFsLAct5IOOdwcz/
	tHQpQkKPj69FVtR/cv/Qptxah5bEvffeLgVRw3C0bqjW8TyQ2O6GcgS08oJrDqQq4iUhgKhuhNh
	yBnsm4xFO8GZvFnS9PD3PZl4jnza6VmCesABaBSUjHqDV4k4rmLAy+yRSxArbLyDM8wUE+Ds4DL
	xLHTTt0wKJTJU3J65sWD41PTPFPbfWdWACEQ=
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr48830311cf.2.1782994657827;
        Thu, 02 Jul 2026 05:17:37 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr48829951cf.2.1782994657207;
        Thu, 02 Jul 2026 05:17:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091785sm122892566b.16.2026.07.02.05.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:17:36 -0700 (PDT)
Message-ID: <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:17:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ucnhF7J61mZh7CFhLqjvNVsglR6UG_U0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX8otzhtKPtbz1
 k4eEbyzg1eI51HdKy8+rPVVYdvWD8S1hoTQZZfW4B+QrSSmsdQaJRjCV7RBgdEoULumC2WA9B2x
 +DCla8LdEJIQBR7wWyNXK724+SScs1+1Q1h/VGPQgS7hTalADzeAUyUAO/f6xEG+w6jqN07Tvar
 XTzFvm6QG0kWoyyTeqHrpy55J7Ha9qVzx9E7LJUmzUbIPL2bT0tsT6/PhmB1Yd3zpITKyncR4pj
 5Pb3dqMwO2PRtz/yJXn8WkZnLzij8JgCqK9x9qT6mi9FE/rVPAokWGmVXiKSf9LSury7iB/XWhx
 WUwogSSpA1Rkp8owqf2XuVtY8TSM72al76bTv7CXd1CGHRkuLCeB+2KkPL5KBm7OQ7S5vziCpCc
 xe8mmKw9ypLovTv2SVve9rosOivM5QVKIVPfdqmzaCkKvgVqjlmeWyXMBgeYpyOpii+fo3zY+Ig
 HhkCsJSwEDLLcq/6oiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX9u2zOboGy6uD
 2Koj1knXgyb4mjs6zQWjfo12cfeY362ztNmu4X9AeOHCL3MJ0VVuBZ54VSfT6VldjKFEe/2G9aq
 3xaL8zpqK9z6j4KAoM1UnSs8M0JxMbE=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a4656e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4cq-bv2Ru7092N9bbaEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ucnhF7J61mZh7CFhLqjvNVsglR6UG_U0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020128

On 7/1/26 12:37 PM, Daniel Lezcano wrote:
> The Lenovo ThinkPad T14s embedded controller exposes several platform
> temperature sensors that are already used by the firmware for thermal
> management.
> 
> Expose the EC as a thermal sensor provider and describe the keyboard
> skin and charging circuitry sensors as thermal zones in the device
> tree.

[...]

> +&thermal_zones {
> +	ec-keyboard-thermal {
> +		polling-delay = <5000>;
> +		polling-delay-passive = <1000>;
> +
> +		thermal-sensors = <&ec 1>;

Do you think it'd be worth to add dt-bindings defines to avoid raw
numbers here?

[...]

> +		cooling-maps {
> +			map0 {
> +				trip = <&ec_charging_psv0>;
> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +		};
> +
> +	};

Stray \n above

Otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

