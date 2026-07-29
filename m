Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B73438BC
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322988; cv=none; b=bQqwYtL3YEmhY3fLzz9Kllw9pqTVa2A/IAko0K4nBPLD8C6A9BmcQQJOwLfYc78RPN72O1Fj25DKEkAY+0MVlvSleiuO85B9H3o9V26H3nNKulWHY2wCgdSII5iWayPiYFPf8CrOY8XFYZcV7rR17Wl60R1Q8991Lo67qc9IRw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322988; c=relaxed/simple;
	bh=PxOtOLx01FWwtuTSeEKZdDI2cMEM41pZ6VTI5diTbmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsTlsV6d2kqixl3AlMdZQ1WVWsFLv83cNwHD7cGskTamsPPOJOpi6GSrySIScZ34WBhFkwZnKrPYnE79n7swFw437NhBcAFgIZXdL2kURkPOZoIU9aQ0NXi/MBbJZH63TTUjCV/s4PKAWQZVl0FexAoQPRyrliwN+yRww27uDME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idfMF46d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ft6RS99g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idfMF46d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ft6RS99g"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7enhr944282
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	za0FHuojM5j39EDfBnNki699HVub6S3hVXHlAo6pnRc=; b=idfMF46dQbv0R6vl
	2j12h7nz7rJUyx0Y8qkretvbs5ejVQsu9922KI9Wgxj8kFB+zTz+BwwBV20a4S1y
	YGrN3k4DhUqSKljMNJeH53VrBn6UOKdFLvqwfuN4COKLShTrhe6NI6S7W7gBnVaA
	nV6SSZOIjY9ZXxjSQ0wytBqVipFP6ok+sT6+8XUvydo0dq4WikxoD7H+5dSu1cZ+
	xuH5uGOcppZ4uqGPvIsSO6lq/ik+K/IIwdX88LUa88PoJEh9SWftRIKl5G24c533
	OH8COo5cY7R6zXo+cPObVYxy/qyFVZC6Z6H/H+ue0olvjVzs3ptafg4rUD15kI/w
	Cn4xZA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm1ayb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:03:06 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-977c01fee74so3326241.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322985; x=1785927785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=za0FHuojM5j39EDfBnNki699HVub6S3hVXHlAo6pnRc=;
        b=ft6RS99gV0YCQrN0QM4BdKOowgyezcdv6C1ubAEZCUmvbGxmtUYtVb+oBLXD3Y4CF9
         4DAY8lxiaPAGvbITGvX7L3JFo0H26ty/SKLwjfru8CsFGmY62YnwuCOWmHLEDpML+Otw
         FByCtG5Wm6vnPZDHAJR15LqUfNBhI02WpIosX6GBSluzXj1h37kV915kWhwTGtkk8eYJ
         rLZQIke4d58b8B/T2p8i11kElHw5pw9WhCqFnveuRBL6k3NrONNqO4dWjHkZPbW8WH4Q
         SBM5lcb++tLE6EaI8oJeVnymr33BgE4bKurbryQR7xrzYhdw4mb7mZ7sGTOVzeoJEFPm
         LcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322985; x=1785927785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=za0FHuojM5j39EDfBnNki699HVub6S3hVXHlAo6pnRc=;
        b=cntuVvTpdkH+bCf+QTD/xj73X4xBKLg+gPiCO6az6qEbo9dtzuvv/cGzA7Lshm51UQ
         bUn/GJh66JHP6/TWgTgK6u5hxD8aFiUU97e3HkiwDcgk+r999A8PaXl1vKpDOI58nBF+
         if5W2MJZYshF67rkzVpu8lBKUfwlT/G14N3fAQKgYbxEOPF6jMD//ipph01nsQJwWp/r
         aWorebLU0zy0EeOu25pIj3yUhm1dwzofBXOCEJua+ekZMZxVwOMMy0PM2JnfX6goqOBS
         UsgSvdoqoqF7foPSHBXGytI8721wdPnjxHH3lI5Yy6fd5/2QLUkhu4l4jgrXD4Ell9T/
         Vmow==
X-Forwarded-Encrypted: i=1; AHgh+RoK3lUIYyJHuNpcK5UYAqzh65Sk1/OIaoL5fqdlxoMX2A9FZ0gVIUmjB1zWDpkGxJ4HALXd+gVmQsPK@vger.kernel.org
X-Gm-Message-State: AOJu0YyoAhCLSxjvQgxpQLo79pcJ3RHBh7R5bR77EPQYr5hQ8mDF3DhC
	75EuHze+YNAF5y+7e7fpkOsmP25Y5ndvBx4Zdf8mhNK2ByDKS41Gdz/y/dmEbn5LE19mPZInmvd
	8ymlBOh4VppoCMlc1tFlM1c16AX0snbOdWtBHDmww8VQaBCZNIQMZ42WEBMNXkyqW
X-Gm-Gg: AR+sD11qF+4eQv/EDgOsnyKosY1iNvuwwJJNLKweyMYirAK1AIKqCU5x9Pg0GMHKgPg
	rEqw5Kf0v1m8k1pZwDflFGlV7/biqz9tKXBRaYSKjfJ2HnHl/u6Oinay63oZVUY8Wtsvr/HDvcc
	WtFwwg5cupgEJYk8c/zvZwKrkD1gujEnvHaqq3POMdvB2+fnSEs2gfnRemODYI9Gvb1C4VI0ni0
	eQIC22HaOGlmi0IAWXMSV7iTF/Q0LOm0y4qvoBvMQExqbPoGzcA56AWl+O3/yeJSp65tP+/PkJ3
	lO7+gH/qX2juCAMrL9FYpMoc81FfG54K6nv9yswdZsGf6Xo3pm1vyF4YaKOz9MRcv0vIoSYzqNw
	m0rtHLH8iAZYbiCDzJmwXU5kp
X-Received: by 2002:a05:6102:1485:b0:74d:ce65:3e8b with SMTP id ada2fe7eead31-7549f558f50mr1348631137.2.1785322985158;
        Wed, 29 Jul 2026 04:03:05 -0700 (PDT)
X-Received: by 2002:a05:6102:1485:b0:74d:ce65:3e8b with SMTP id ada2fe7eead31-7549f558f50mr1347388137.2.1785322969721;
        Wed, 29 Jul 2026 04:02:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050be9607sm743481a12.12.2026.07.29.04.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:02:49 -0700 (PDT)
Message-ID: <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:02:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vfZnQF8mLWFtKRy2qFl7IrjfFCwdmh0R
X-Proofpoint-ORIG-GUID: vfZnQF8mLWFtKRy2qFl7IrjfFCwdmh0R
X-Authority-Analysis: v=2.4 cv=R/Uz39RX c=1 sm=1 tr=0 ts=6a69ddea cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Cp8rfTUuKJJUPH2W_1oA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MSBTYWx0ZWRfX154RAKf/Hy5d
 AucOAOv3xMDxO7fb1VU2j09J0K+uzh7U7gDTCb57mAl4JfmxfWtCQmiGyOegJp6QfA3sx2fFK40
 unmy3YnH+0uuvPyAlZdKKhaLITzWf/yiHCLJP0Jjad//Md7V4F4jyYH9zwoDgfw1VsxmvcmwPny
 JzGVlkkTwRFrpULtGeI0nJhbSBqJnfaSnTVax4q2SfIoeruInXHhMnr0tW3eIy6zNGoUyMD2HgZ
 uG762r4OrTm8k1g/5pHBvOKKnMs5SlYDQ30ZFKuAkYfKGgelqIf8afhzrRQzgX55zUyY8swqCKY
 GKLNmfsiGK2avp7q0FA//B9cSAd9rrqHVYAiZUYTNITlrZsg3XtM4mA58Qdxmu7ugfV2ZaKS7lr
 WpzjHASSPeTxa5dCWt2jzripoMqVHdLHECD5qRtm5oZEPnaOolMJ+MIcdLTjrM4or+sZ00hdxWw
 c/caqgzVe8O1qp51xZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MSBTYWx0ZWRfXxTeIRh7ps777
 P1T3Kkelq5sl+T58Wy5FgSNlAwtGuanLAIcbcMa61LGsRjWqSkS+qT6BE5mYCRunOkklg0M3EkC
 WRkc0xhYA2Mo4duOD2quVJXqZ6+RPeM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290091

On 7/28/26 7:44 PM, Anvesh Jain P wrote:
> Add the EC command definitions and handler functions for switching and
> reading the EC fan profile.
> 
> Register a power supply notifier so the driver can react to AC/battery
> transitions: on each PSY_EVENT_PROP_CHANGED notification, queue work
> that checks power_supply_is_system_supplied() and, if the AC/battery
> state has actually changed, switches the fan profile to the
> performance profile on AC or the battery-saver profile on battery.
> Track the last-applied state in on_ac_power to avoid redundant EC
> writes. Run the initial sync once at probe time, and defer the actual
> switch to a work item since the notifier callback runs in atomic
> context.
> 
> Serialize the fan profile write under the existing io_lock mutex,
> alongside the other EC command sequences.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

[...]

> +static int qcom_ec_set_fan_profile(struct qcom_ec *ec, u8 profile_id)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(ec->client, EC_FAN_PROFILE_CMD, profile_id);

Shouldn't all the accesses be serialized after patch 2?

[...]

> +static int qcom_ec_update_profile_from_power_supply(struct qcom_ec *ec)
> +{
> +	int on_ac_power;
> +	u8 profile;
> +	int ret = 0;
> +
> +	on_ac_power = power_supply_is_system_supplied() > 0 ? 1 : 0;

Comparisons already return a boolean value (i.e. the ternary operator is
not necessary here)

> +
> +	profile = on_ac_power ? EC_FAN_PROFILE_BEST_PERF_PLUGGED_IN :
> +				EC_FAN_PROFILE_BETTER_BATT_ON_BATT;

Is being on a (powerful) charger a prerequisite for entering this profile?
Currently plugging in a 5W charger would trigger the switch as well.

Should this instead be exposed as a fan profile for userspace?

Konrad
