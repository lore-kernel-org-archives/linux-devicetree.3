Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A307274B46
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881331; cv=none; b=jbzqN44684+fyoabU4XKD4ByQ7vq1zOwsqT0e9TBYa33JDGWeIMSrknHRjHeoH5jQEnoDKucznjzEF90bP84XTUBD27/Fr5nA76PpkylbrCKEaJOwLg71S8nH2o9U2JQKKUJW1DPn5Irj2+FdlLkrUf+mDb+HaqMFKyMVmTgBeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881331; c=relaxed/simple;
	bh=YtQ34cQ9XmFi6zcNdYGMdmbtWTCoLVnZxtAsP94R6sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjpQEpHPrHtmjoPTBSgujvwScTy4WcAIPKa6TtVfJk4AVfvnoBXJqPHXWejZDRbCDK6HiBSGcx0BQK0LPzhzmly1sR8de9zftMwJ0fV6RW+6oIWdwY/Tk+N9KH88Chr70TLzimOqFbZmy0ER4YwDKP6h3SKlTyfNV+vvnb1eO4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2VWao6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvpKYrS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2VWao6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LvpKYrS6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXXM015278
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JjxJi1akmR350BjqJjUpsg/JBkPEFxqTxpfhmQt0rP0=; b=K2VWao6AEPk4LMGn
	35Waa8iTcpOgbuYSmwTYe0FtW4M05O9CZjHTZDPpEvsNL+bMOWWfzPJf0pANq9Yg
	/SAzOHHOVcaQN7m3yIXKvms+ZydoW4SCvGfsblVH8cNoatZHKQaQFitxH4H2/O/k
	3duo9w7IfJu9Ad7Seh+0cgCLOSKXblbsQAHauG+ZcHTb2STCDzZ1CsDXoVMxUue4
	V02ncNdLbvWJW2iWtN0zayH6BvIrB9MsRXd4Sn7vwodCszH2V0VdeA/Zn6FhFZlw
	Kn86a9PB6mL2HKCtwYMLjyaF0avKCyYfOszNTJvw613zbP+nlycrEhyvCvk0hp3Y
	9U2eKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugb4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:48:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso477050385a.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881328; x=1792486128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjxJi1akmR350BjqJjUpsg/JBkPEFxqTxpfhmQt0rP0=;
        b=LvpKYrS6TBZWPt/wDNvEE6brivkqi0rTcljdTba60yGtlbHmv0mrLxwAzgKFdHNBFK
         69D4IOiGij/i/URa2558flsR3WdO+A2q+QHSUaqVqaUa9im80emTUThOU3YsUD+71C75
         /nqYQn0KQWt8RYYrH29IZPcNNSjw2d2f2ltpKy+l5FA8FKa0M4WggMMBgwnuAeY2CCLS
         kvyduHTnpvPzjz23xh4KnfO7KLu+uyCb1PBe5jnbgtqQbgt5MHtANzRnFcHJNyRcbV9r
         nis8BhBKisfDlsauM/yymZHgiUifFIeEp3nNgdAek2Wre5fbT6/DWtVCsv1KFDKw1MiE
         F/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881328; x=1792486128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjxJi1akmR350BjqJjUpsg/JBkPEFxqTxpfhmQt0rP0=;
        b=TFWzHXM3RdL8u2Pr15Sg/08fftZlU7bimG9eCjlxevXmlTn0c6IClnEEimTT0W1j30
         MrqEYdZ79wXCuTpuOdBSPeUwNK2XC/hF0GenhdaaU21166cADkf+DoJtJizDgGXXam/C
         NOMgovdn2pJN6HMlWARTdyQh2tRqIM/9F99LkVFT+nCvixSBOaoNzptzEqvVJxs2WI6F
         yo3yaCIoOuU7CMJ4zqOECZZFpSKjVBPwLG5VN+4DM8T7h3Y2J5kjpgvHi2WZkGIru0TD
         T1qN60EwH+xnO0A8Q6sJAKSJJJGaORBYQVVwug+/3dRe3Qv9CElecD/FPHdKnPw444AL
         l3xg==
X-Forwarded-Encrypted: i=1; AKwUvBy/aaSrqiXgigyoDaPw3U7dQ/OhsMdFKRt26Rjmf10mI6kArJZatzP5E0R6r4dP38j6kagx/kotZgV8@vger.kernel.org
X-Gm-Message-State: AFq9FYJbbLReenWOZCbopRxSc7J/u0YBpTHjlmVLHAyWapVc6uVsIpUs
	pz2mJSQiKU+aT6Fp4TfIy1/DfmD8TebjSqLlimG9gxAyir9VloGHZU+5ILIAmFdInZ34ojZN3ip
	7cCjc0LZEpcaNgscnmMB7KcXaQEGIS4xE/aKRoZKMHxcT5egffVIsa6qTH7UQwIPq
X-Gm-Gg: AYBFou3fsRxfsb+c2Xchzcpgb+k8xpp1LDKAjuVySH1qJEEdW0bFogLcaX68AE/h5JU
	evJ3t852oH85xaEIx7xsC3QZElvVQNU99xCgm84GxSXQIoF/Qdrrvsy1Uv5LSBI9b0QANzscArk
	O78CJSD1KyPZ1HPDxGK6mahKbeQZP+3PD5APuHr5sJgv33T9a6/Eh/rE4nHjhwrb/PMpNKZooxb
	b3GDXUF+4HJ7GNuiUTfG5yIg7KZ+fC3JPH0SwJiHpAbl/0jVZZjkMELF1mqnopyF94+YfbeXo71
	+TC2MOKCkjoa0CaHr8KlKmWB7p6ecwLkVD8v3TTGVQ6cjv74qLbum3akywRujron7iJW3Tfjvn7
	aVAqAuLL9nzRQHG7Rp/ZUXwvP7KCMq1paA+jN67tLa3JPBIhE6SD3dRnRiY8T0A==
X-Received: by 2002:a05:620a:170d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93ebd0cbba3mr2018274585a.4.1791881327671;
        Tue, 13 Oct 2026 01:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93ebd0cbba3mr2018271885a.4.1791881327187;
        Tue, 13 Oct 2026 01:48:47 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac35dfsm3905304f8f.33.2026.10.13.01.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:48:46 -0700 (PDT)
Message-ID: <8e42db37-3aad-4825-8287-8578fb3eadd3@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:48:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] thermal/drivers/loongson2: Fix Loongson-2K2000
 trip point programming
To: Binbin Zhou <zhoubinbin@loongson.cn>,
        Binbin Zhou
 <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
        zhanghongchen <zhanghongchen@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
References: <cover.1791512067.git.zhoubinbin@loongson.cn>
 <93d78dbedc091117d8fc7ecb29a0fdf2a6d096b7.1791512067.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <93d78dbedc091117d8fc7ecb29a0fdf2a6d096b7.1791512067.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX6hnWHkhgR0hM
 5jALgJbsXHcmTRI8reIJDvw5+QqCKGZKM57AlwlQtE/dBHgLA5GkYyUngioBX/q7i1/hdRYcBL4
 9fSARjzQqGaxrolg4s/l2btU5IZ+q/e/sy9Xkvhz0fARZgcjr6+ERv/FfUhycD104lxk1OXgnEP
 KQxz/pIn+KsB458x8oBp/AbQ/e8eiZU66rm65cD2WXza3GWX5cFTz31sneH9HE5y38G2pyFvKI+
 +1j7AKAO+PRRQmSrcLHc3H+Rxq1hON1LtbJAhlgEs9xSZahA+M7+01spVTvenV1zy1D4mXkzTKe
 W00ijEpdUnn0iHkbbIagKzotNMDyDHU0/MP8pI2hSKiBbsH8JNgCWx4z8ISMde93e6/m/91bWvs
 gSaNrHMnhz3E47/6VThe0cyI0D7SIURBkdgkGA2g8OYaVl50bGmAAfpc4GBBMezauZ23UinWloM
 RqNXTNHqhcGn2GrwiZA==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6acdf070 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=B0Tmh5SJC70KtaT1dDUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: uVbd6QleLdqVAK9O7cN_5yac5uU1fcg-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX6r7TO3US12rI
 4b9+CY/0TP665tSnmDnAZM6bvv4St09dTRcJKQMQUelbnEb0y9ZOQ7fL71f0n4HgQcqYf6zfmzm
 Nedm5b6AKsgfTiL+aJqNQjWO4eR2EHw=
X-Proofpoint-GUID: uVbd6QleLdqVAK9O7cN_5yac5uU1fcg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 10/9/26 04:58, Binbin Zhou wrote:
> The Loongson-2K2000 splits its 16-bit gate value across the control
> register (low byte) and a dedicated HI_GATE register (high byte), and
> derives the gate value from the target temperature with a different
> formula than the Loongson-2K1000.
> 
> Add a per-SoC set_trips_regs callback and implement the Loongson-2K2000
> variant alongside the existing Loongson-2K1000 one.
> 
> Cc: stable@vger.kernel.org
> Fixes: 734b5def91b5 ("thermal/drivers/loongson2: Add Loongson-2K2000 support")
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

[ ... ]

> +static void loongson2_thermal_set_trip_temp(struct loongson2_thermal_data *data,
> +					    int low, int high, bool enable)
>   {
> -	int reg_ctrl = 0;
> -	int reg_off  = data->chip_data->thermal_sensor_sel * 2;
> -	int ctrl_reg = low ? LOONGSON2_THSENS_CTRL_LOW_REG : LOONGSON2_THSENS_CTRL_HI_REG;
> +	low = clamp(low, -40000, 125000);
> +	high = clamp(high, -40000, 125000);
>   
> -	reg_ctrl = ctrl_data + HECTO;
> -	reg_ctrl |= enable ? 0x100 : 0;
> -	writew(reg_ctrl, data->ctrl_reg + ctrl_reg + reg_off);
> +	/* Set low temperature threshold */
> +	data->chip_data->set_trips_regs(data, low / (int)MILLI, true, enable);
> +
> +	/* Set high temperature threshold */
> +	data->chip_data->set_trips_regs(data, high / (int)MILLI, false, enable);

MILLIDEGREE_PER_DEGREE

>   }
>   
> -static int loongson2_thermal_set(struct loongson2_thermal_data *data,
> -				 int low, int high, bool enable)
> +static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, int low, int high)
>   {
> -	/* Set low temperature threshold */
> -	loongson2_set_ctrl_regs(data, clamp(low, -40, 125), true, enable);
> +	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
>   
> -	/* Set high temperature threshold */
> -	loongson2_set_ctrl_regs(data, clamp(high, -40, 125), false, enable);
> +	loongson2_thermal_set_trip_temp(data, low, high, true);
>   
>   	return 0;
>   }
>   
> +static void loongson2_2k1000_set_trips_regs(struct loongson2_thermal_data *data,
> +					    int temp, bool low, bool enable)
> +{
> +	int reg_ctrl = 0;
> +	int reg_off  = data->chip_data->thermal_sensor_sel * 2;
> +	int ctrl_reg = low ? LOONGSON2_THSENS_CTRL_LOW_REG : LOONGSON2_THSENS_CTRL_HI_REG;
> +
> +	reg_ctrl = temp + HECTO;
> +	reg_ctrl |= enable ? 0x100 : 0;

bitfield.h helpers

> +	writew(reg_ctrl, data->ctrl_reg + ctrl_reg + reg_off);
> +}
> +
>   static int loongson2_2k1000_get_temp(struct thermal_zone_device *tz, int *temp)
>   {
>   	int val;
> @@ -81,6 +99,27 @@ static int loongson2_2k1000_get_temp(struct thermal_zone_device *tz, int *temp)
>   	return 0;
>   }
>   
> +static void loongson2_2k2000_set_trips_regs(struct loongson2_thermal_data *data,
> +					    int temp, bool low, bool enable)
> +{
> +	unsigned int sel = data->chip_data->thermal_sensor_sel;
> +	int hi_reg, ctrl_reg, val, gate;
> +
> +	gate = (temp + 311) * 0x4000 / 820;

litterals -> macro

> +	/* Low byte of the gate value goes to the control register */
> +	ctrl_reg = low ? LOONGSON2_THSENS_CTRL_LOW_REG : LOONGSON2_THSENS_CTRL_HI_REG;
> +	val = gate & 0xff;
> +	val |= enable ? 0x100 : 0;
> +	val |= sel << 10;
> +	writew(val, data->ctrl_reg + ctrl_reg + sel * 2);

bitfield.h helpers

> +	/* High byte of the gate value goes to the low byte of the HI_GATE register */
> +	hi_reg = low ? LS2K2000_THSENS_HI_GATE_LOW_REG : LS2K2000_THSENS_HI_GATE_HI_REG;
> +	val = (gate >> 8) & 0xff;
> +	writeb(val, data->ctrl_reg + hi_reg + sel);
> +}
> +

[ ... ]
