Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE50326928
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696499; cv=none; b=r8BucIM6Ot1AvMjLeaSdbilaErNuYRTZQ3eTN0kWzjGRaGmI3npupPpQNYw3a1hVmkQX5uWQg4fM2KHHl7olqc4EyEC3WDMep/VXRXc7L3WniPGUKC3qAzbPYZTQZ41VaP12Jfz1ijuEPP//G5Zh1NZFenq3dhYG+MsU4slhPvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696499; c=relaxed/simple;
	bh=Q7SXo8DC/0xS/EZU1J22olGXiFpFxo8B5OX9/Vdb4xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oB+b3aG4qbb1rmqM60wTIYdBazZh9eqh5RXSTyMaz/TcBr4qYWJ2q9K9T8tGxHErBmudRl9P1B/8taQNEcuVhsavGnEti+n9O9/j9cgQsRjuAQSe6XrcRtujkd2VFHy8kzc3ko4mDVJ17nAyS9m8wSnGjag5xM9I1f01mqAp+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbA4+60f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXg+2TOB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbA4+60f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXg+2TOB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEcW8M982535
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0V8KZPgKxdhmBKZy9zTx1VsGb8GdWSYih1vACwJ2JM=; b=JbA4+60fvXE5wrgp
	fRoUWRMadr8xo23/8WiDX7RuIC4x39N0cwd0+jGNv9e0vD1i5ez8uamhaz1mUdWZ
	zSZEejERnLZxR5WqFspxxM0yI4L25gRA8NymVBBCNgseyCb1zLdLttA/BeFDjSda
	ITGRXlOuXClxHb3QawJx3+e4qR3CFuCwBoNi+6rSgtaPy+BT3fn37I6CTwMEqI4h
	dmD7iqk1CM0Tcyps5rtLwNF/o3a3fzI6ZfZrvnVgyodqQgksP4tD5fdvpV2z0yKR
	25beYSmh0RSpOyq1rougnAm8MK+oK7ooWpv6uQhubFRiyK9XGR/OAkVR3+ZpPunZ
	yLRDBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dh91t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:14:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso10714811cf.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783696493; x=1784301293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0V8KZPgKxdhmBKZy9zTx1VsGb8GdWSYih1vACwJ2JM=;
        b=LXg+2TOBjz1C9woSFMrM/nuE3nYx/cw2kcsQwW+IBbS5y3MZBJrM6bqkwxDNr7EoGK
         dVWZJfapHSR/ZJXVv7mhE0hzDtght/Vpdkr90MPtp5y5yx19buHIEtQEqdplckpfPRPv
         i2vZKUDtUrsiV//Xn0z9M1JAw4epurdR6XEPNfipnqXhlFWvol2uio3t31MIB0c5lvAQ
         twIZmsksVMRCAMQ7bMGagUiuYFHMufPktD8k6LmyslosxarvjaqR4FC2b1gJ6KtwxeeQ
         YSjRVOE0lGVmIqMrZKxGv4OT0J/TjaNv7jlbTwbCVPGzq6mNnI5+lZ3dmPtXmPPybGHu
         uUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783696493; x=1784301293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0V8KZPgKxdhmBKZy9zTx1VsGb8GdWSYih1vACwJ2JM=;
        b=DL/TqrHmDQU+skYggz+d0ZjHrpfC0JuVZxg4JTQe2vxJLGkRT2WgLWSjdl4Eb98K8c
         8weT6ZsYzeu+gCXjFECZfK5L8+5Flse+/31WtsmxvZjZy5ekPKFlHTOEyebmnYBV7Hv/
         mezFF7+w4lLbe2p877qA4joalXzA7dGGVcrAJd1XmWo/jCegkUFAz5tHM81yGpVq00V8
         mASC/wBhmOpJw9vF1V2zSfN4IOcv8x5wwhBqJdH5uJRIai2xFhoijo9Jw4t3lwkYJ/qg
         UhrlY6Y1Z+m5uCwh5ftkszp5RepLIhi6TccH/3DKSTXNe+am3Jz2YJzzXf3lKI5/ac9x
         lz+A==
X-Forwarded-Encrypted: i=1; AHgh+RoK0UjZwNMkaSjSzVYENSNrP0Em+hy2W0LQhheg2JWmlfJ8gXiEgPfswEBykY2tqCBYBiBfWHKLFlCR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8a+GKQ8HArfdiCuGsKLAeuC5Bv/C2a3cmkcIv5Q6X8WNYP5Aw
	AebuYtM+4UEZL4BhPJ8/h/cFRnbzZJi+oy2z27YvtaC1HrUMNpM0QTAlFvIaX0LpbvTt7lNxSDP
	vYrddHPoRar088+wznM5NGbB5nkAG7znAONjDCdgCLxeyGkGK32aqQOHDjkCAmb0V
X-Gm-Gg: AfdE7clT2r63qh8Hdbaw9b/KNRaRl1qPzWo0fydSucSAJufTcBQKqIWLSWj75yDBr//
	SqaCEqN4ASC0MolP8ap5XFjWe5YLzAYRv/dlTk6yPEb2CcFeaSpSppQ+FYCP1Ul1PY5/lpIDhyl
	9Eyv4MRhgPUiVF3NHGR04I6dJAxiM220pPDOFysNDenhn/rZXB+b+aRbqMXVhI0Z/ctj/Esjvu3
	U9dgIwXXf0udQ9ZPbZQDHpckVQnADkmCWx5TBdGU6sljNxFCnjsgwupOphflDj0fqy3/FNSh4yi
	z6XGjkuaYfig1EFDYfbnj4YNqXfP+ux8L3qLXsx3qzOEQa6mGH1D0vIEji1zkhF66G0aK3+Z531
	A5g1LrEb1VzeL6rCbkgX9ZciFLmlDK6kwvtAby2Bv9K6xTB33M+zGuuU5pSXNRnVmsWYWt4T4xg
	==
X-Received: by 2002:ac8:7f8d:0:b0:51c:7aa7:e0f1 with SMTP id d75a77b69052e-51caa1a7e08mr41258521cf.44.1783696487924;
        Fri, 10 Jul 2026 08:14:47 -0700 (PDT)
X-Received: by 2002:ac8:7f8d:0:b0:51c:7aa7:e0f1 with SMTP id d75a77b69052e-51caa1a7e08mr41258081cf.44.1783696487295;
        Fri, 10 Jul 2026 08:14:47 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d86b:ddff:83a7:67da? ([2a05:6e02:1041:c10:d86b:ddff:83a7:67da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm4604990f8f.3.2026.07.10.08.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:14:46 -0700 (PDT)
Message-ID: <67b7d76b-f13f-4dee-9b99-d7a8215da504@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 17:14:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: Add support for Qualcomm MBG
 thermal monitoring
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
 <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE1MiBTYWx0ZWRfX1HJdzB3YgMqy
 wpi6lIMSULoimpCGNrOTBsPRGcG1NzTTahd8OI8ge3/t0V0w2N+8eSKg0Cf9puel9rAz22vNpIa
 H2/CGiN7scgnQr7PqZ6Z7iwzdL4md7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE1MiBTYWx0ZWRfXzNtL3lJTDaCc
 VZwDhxbYvfMv7bAn05irg1OZ9dcMQHC1dvRUEZibx3HCqrNwP7suQRpQ5m/4f06dmJk4mV7tPYg
 FomBjlEQOZCoWkti93UNh13STveegKJt57VKYKGa4Tmgl6o3Cm8Bhxhi81BhpSl4IzsIIZCR4bC
 3FR/wBuBPc8DVCKUhO+5N6oRBxBG9gSziOrA/8f+JxNf8rz9qeIHL5nXBgdvvrkDkL++cGWoxrt
 zTY2RnXBBKyRd22PQmPxec3pP7TFEWmSJwr/wdYzdRafti+W0hIkcwWYW8ZbBT9L7avp8LyM/XE
 utIS4tnlFrU6zJbVLWWmymJq+/aCcHR5q1pegj2fuNWgKskftiJ+QzWr7Fc+kzdlKEHX7c0JLnz
 c4BkTVAGgOZBGwVpugQc65svSmT4bBC6YB8np9SG6aUJGefISHEbRtP3UM0c0zwuJgdhSs3npPo
 hmzey6H3vPhN5jYofiw==
X-Proofpoint-GUID: zGsUQ3_3oh-tsEPYJsIWChPf5wAK4gm4
X-Proofpoint-ORIG-GUID: zGsUQ3_3oh-tsEPYJsIWChPf5wAK4gm4
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a510c6d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ELNG7oYFuFGS01GaYMYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100152


Hi Sachin,

On 7/6/26 10:14, Sachin Gupta wrote:
> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> 
> Add driver for the Qualcomm MBG thermal monitoring device. It monitors the

MBG ?

> die temperature, and when there is a level 1 upper threshold violation, it
> receives an interrupt over spmi. The driver reads the fault status
> register and notifies thermal accordingly.

You are describing how works the thermal framework. Please explain how 
works the hardware so we can understand the submitted driver.

> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---
>   drivers/thermal/qcom/Kconfig            |  11 ++
>   drivers/thermal/qcom/Makefile           |   1 +
>   drivers/thermal/qcom/qcom-spmi-mbg-tm.c | 256 ++++++++++++++++++++++++++++++++
>   3 files changed, 268 insertions(+)
> 
> diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
> index a6bb01082ec6..f2fc24a3096f 100644
> --- a/drivers/thermal/qcom/Kconfig
> +++ b/drivers/thermal/qcom/Kconfig
> @@ -21,6 +21,17 @@ config QCOM_SPMI_ADC_TM5
>   	  Thermal client sets threshold temperature for both warm and cool and
>   	  gets updated when a threshold is reached.
>   
> +config QCOM_SPMI_MBG_TM
> +	tristate "Qualcomm SPMI PMIC MBG Temperature monitor"
> +	depends on QCOM_SPMI_ADC5_GEN3
> +	select REGMAP_SPMI
> +	help
> +	  This enables a thermal driver for the MBG thermal monitoring device.
> +	  It shows up in sysfs as a thermal sensor with single trip point.
> +	  It notifies the thermal framework when this trip is violated. The
> +	  temperature reported by the thermal sensor reflects the real
> +	  time die temperature through ADC channel.

Explain the hardware, all sensors are showing up in sysfs and notify the 
thermal framework about thermal events

>   config QCOM_SPMI_TEMP_ALARM
>   	tristate "Qualcomm SPMI PMIC Temperature Alarm"
>   	depends on OF && SPMI && IIO
> diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/Makefile
> index 0fa2512042e7..1bec2746b98d 100644
> --- a/drivers/thermal/qcom/Makefile
> +++ b/drivers/thermal/qcom/Makefile
> @@ -4,5 +4,6 @@ obj-$(CONFIG_QCOM_TSENS)	+= qcom_tsens.o
>   qcom_tsens-y			+= tsens.o tsens-v2.o tsens-v1.o tsens-v0_1.o \
>   				   tsens-8960.o
>   obj-$(CONFIG_QCOM_SPMI_ADC_TM5)	+= qcom-spmi-adc-tm5.o
> +obj-$(CONFIG_QCOM_SPMI_MBG_TM) += qcom-spmi-mbg-tm.o
>   obj-$(CONFIG_QCOM_SPMI_TEMP_ALARM)	+= qcom-spmi-temp-alarm.o
>   obj-$(CONFIG_QCOM_LMH)		+= lmh.o
> diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
> new file mode 100644
> index 000000000000..fa2f10002253
> --- /dev/null

[ ... ]

> +static const struct mbg_map_table map_table[] = {
> +	{ -60000, 4337, 1967 },
> +	{ -40000, 4731, 1964 },
> +	{ -20000, 5124, 1957 },
> +	{ 0,      5515, 1949 },
> +	{ 20000,  5905, 1940 },
> +	{ 40000,  6293, 1930 },
> +	{ 60000,  6679, 1921 },
> +	{ 80000,  7064, 1910 },
> +	{ 100000, 7446, 1896 },
> +	{ 120000, 7825, 1878 },
> +	{ 140000, 8201, 1859 },
> +};
> +
> +static int mbg_tm_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
> +	int ret, milli_celsius;
> +
> +	scoped_guard(mutex, &chip->lock) {
> +		if (chip->last_thres_crossed) {
> +			dev_dbg(chip->dev, "last_temp: %d\n", chip->last_temp);
> +			chip->last_thres_crossed = false;
> +			*temp = chip->last_temp;
> +			return 0;
> +		}
> +	}
> +
> +	ret = iio_read_channel_processed(chip->adc, &milli_celsius);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Failed to read iio channel with %d\n", ret);
> +		return ret;
> +	}
> +
> +	*temp = milli_celsius;
> +
> +	return 0;
> +}
> +
> +static int temp_to_vtemp_mv(int temp)
> +{
> +	int idx, vtemp, tc = 0, t0 = 0, vtemp0 = 0;
> +
> +	for (idx = 0; idx < ARRAY_SIZE(map_table); idx++)
> +		if (temp >= map_table[idx].min_temp &&
> +		    temp < (map_table[idx].min_temp + 20000)) {
> +			tc = map_table[idx].tc;
> +			t0 = map_table[idx].min_temp;
> +			vtemp0 = map_table[idx].vtemp0;
> +			break;
> +		}
> +
> +	/*
> +	 * Formula to calculate vtemp(mV) from a given temp
> +	 * vtemp = (temp - minT) * tc + vtemp0
> +	 * tc, t0 and vtemp0 values are mentioned in the map_table array.
> +	 */
> +	vtemp = ((temp - t0) * tc + vtemp0 * 100000) / 1000000;
> +
> +	/* step size is 8mV */
> +	return abs(vtemp - MBG_TEMP_DEFAULT_TEMP_MV) / MBG_TEMP_STEP_MV;
> +}
> +
> +static int mbg_tm_set_trip_temp(struct thermal_zone_device *tz, int low_temp,
> +				int temp)
> +{
> +	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
> +	int ret = 0;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	/* The HW has a limitation that the trip set must be above 25C */
> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
> +		ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
> +				   temp_to_vtemp_mv(temp));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +				      MON2_UP_THRESH_EN);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		dev_err(chip->dev, "Set trip b/w 25C and 160C\n");
> +		ret = regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +					MON2_UP_THRESH_EN);
> +		return -ERANGE;
> +	}
> +
> +	/*
> +	 * Configure the last_temp one degree higher, to ensure the
> +	 * violated temp is returned to thermal framework when it reads
> +	 * temperature for the first time after the violation happens.
> +	 * This is needed to account for the inaccuracy in the conversion
> +	 * formula used which leads to the thermal framework setting back
> +	 * the same thresholds in case the temperature it reads does not
> +	 * show violation.
> +	 */
> +	chip->last_temp = temp + MBG_TEMP_CONSTANT;

It is because it is inaccurate or the temperature decreased a bit after 
the interrupt fired ?

> +	return ret;
> +}
> +
> +static const struct thermal_zone_device_ops mbg_tm_ops = {
> +	.get_temp = mbg_tm_get_temp,
> +	.set_trips = mbg_tm_set_trip_temp,
> +};
> +
> +static irqreturn_t mbg_tm_isr(int irq, void *data)
> +{
> +	struct mbg_tm_chip *chip = data;
> +	int ret, val;
> +
> +	scoped_guard(mutex, &chip->lock) {
> +		ret = regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
> +		if (ret < 0)
> +			return IRQ_HANDLED;
> +		if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR)
> +			chip->last_thres_crossed = true;
> +	}
> +
> +	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR) {
> +		dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
> +		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);
> +	} else {
> +		dev_dbg(chip->dev, "Lvl1 upper threshold not violated, ignoring interrupt\n");

What does it mean ? Spurious interrupt ?

> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mbg_tm_probe(struct platform_device *pdev)
> +{
> +	struct mbg_tm_chip *chip;
> +	struct device_node *node = pdev->dev.of_node;
> +	u32 res;
> +	int ret;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = &pdev->dev;
> +
> +	mutex_init(&chip->lock);
> +
> +	chip->map = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!chip->map)
> +		return -ENXIO;
> +
> +	ret = device_property_read_u32(chip->dev, "reg", &res);
> +	if (ret < 0)
> +		return dev_err_probe(chip->dev, ret, "Couldn't read reg property\n");
> +
> +	chip->base = res;
> +
> +	chip->irq = platform_get_irq(pdev, 0);
> +	if (chip->irq < 0)
> +		return dev_err_probe(chip->dev, chip->irq, "Failed to get irq\n");
> +
> +	chip->adc = devm_iio_channel_get(&pdev->dev, "thermal");
> +	if (IS_ERR(chip->adc))
> +		return dev_err_probe(chip->dev, PTR_ERR(chip->adc), "Failed to get adc channel\n");
> +
> +	chip->tz_dev = devm_thermal_of_zone_register(chip->dev, 0, chip, &mbg_tm_ops);
> +	if (IS_ERR(chip->tz_dev))
> +		return dev_err_probe(chip->dev, PTR_ERR(chip->tz_dev),
> +				     "Failed to register sensor\n");
> +
> +	return devm_request_threaded_irq(&pdev->dev, chip->irq, NULL, mbg_tm_isr, IRQF_ONESHOT,
> +					 node->name, chip);
> +}
> +
> +static const struct of_device_id mbg_tm_match_table[] = {
> +	{ .compatible = "qcom,pm8775-mbg-tm" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mbg_tm_match_table);
> +
> +static struct platform_driver mbg_tm_driver = {
> +	.driver = {
> +		.name = "qcom-spmi-mbg-tm",
> +		.of_match_table = mbg_tm_match_table,
> +	},
> +	.probe = mbg_tm_probe,
> +};
> +module_platform_driver(mbg_tm_driver);
> +
> +MODULE_DESCRIPTION("PMIC MBG Temperature monitor driver");
> +MODULE_LICENSE("GPL");
> 

