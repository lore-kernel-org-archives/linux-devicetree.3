Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E8E3CF68D
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691781; cv=none; b=OjrEHkyr3rM/yaZdg1s4P/PsHNQdd3f6thW6INGog2HWnybS89Mw5u56ezvahw2pmNizoXyDMb5wDzBSuQDaA2FyWPioGO88gpqo1Yufkw7wZMzIE+R2m7JtkRNaLqq2EczgfBbqZg8o8NL1vARSTKs/PonfgtxDy93A8RQ8v6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691781; c=relaxed/simple;
	bh=ahYXe82LNB/jI5V6o4BD6wPx/eb+NdBlno0wL2x2glk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEjIHnjIEuec9tx1ALqmJSgD1nItb1EbJZZ9lKa64xyO4R2dgDAPR8g44+uZzaVkHsOhaVQvgZbXaB6MFXAL0r+R0SaZejVL19qtILasO8Eqc3YbGRIDscWj6U5H94hKuhzzv2bQLZGXQGvMusYmZaqIh/0Cdrzet54Qs8giCAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqFmSSkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3Sm3zS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqFmSSkN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3Sm3zS8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K978dq2755634
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fO6Bv48GlQW/gZ/cujzOgLlpdMteDsrc0v7DT/6Qj+Q=; b=eqFmSSkNLdnqkFvo
	aVaADt1cwOCjtltureMzK+4Bwx0NCa1vP4tnB4xxDm3DJXoGbSiMia9wMTt9+JSF
	Ou5VYJfNCmI63gRZHzNUfiIrmKsuqVuuq07GwcHfAKX/I3sJ8/L3f11M5f+TbK0S
	j/TdN7eRiG8IyUUGX4Li/cKuV6YH/bsmjxA0n8MCFd2oBFD8MYOTPdOy/GiGzFG1
	5EodhUF6iUV64YaSP0rBmgckn9pV+++obLZXURolL/j8eUV++n3De8iy6NN12+KP
	i78sEuVhZzJ7GQJq8UO9AW4uf0ucFwMfeswQK74Ab9pjawyGqrVe5OcA9Fm0S+sq
	IIEAfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xgvbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:29:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso6165992a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776691778; x=1777296578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fO6Bv48GlQW/gZ/cujzOgLlpdMteDsrc0v7DT/6Qj+Q=;
        b=T3Sm3zS8JZwE0XoQBVkVomoE+KuqBX+EC74UBFQVKYbqp74brizWfukvxlrSGkli+K
         Jd/gCDWoCtNQjxotomsBrHmo1Zikb2SQMVtrUa+ffBYGbbLMtabyWuycOMGGI5NuBoXK
         Iu0FodM9mHxMNVw4mj+RbxLDrebhl8Te1ahvjyrQXd6umEPivLwn0kanWUy8NQljniCv
         cgFIwJI3dCoH6xLeKpM6fny10UNs5j4eVnBO/AX5q17mNleJkhx6quIYl0hH4qCICcBA
         /7vkgttHe3m0pwLi50plwnyZGw5OKiPiDJA6FLJi52Wlupr/0fFqxJ2Uo5Mb3v4bZ8ws
         PaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776691778; x=1777296578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO6Bv48GlQW/gZ/cujzOgLlpdMteDsrc0v7DT/6Qj+Q=;
        b=HrUbvU/006hBoU73G5rgxpzXjnDEyD8hYnOwyNXGiZyjzsIG/QUq/el6ZSCZrisnXj
         qPqrnZDwEV1shuWa7PhJRF+mw3qA7kva9dF3mGZP2de8nLasU+/2GT1CRNA3y452uulo
         1DNSuVQlcwUftlgzB/ej6M5VnP9gxevczqEElAvZCX50EXfqV6MDJqF9+ZQmS+qWoTiP
         zbFqLgQvCIOiI4QmPiJoZq9Kgiu0GXyY29IkBcbpjWxKCCUcSUEy60mPTaXcy/lJhO+I
         Ky5y08kdNvKq+6aGtHbB95MHO8qX40RaHCms27LCER6hqNLT8jhJNXYqTs26nSvS9rvd
         iMTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3LGsJfKvXydqO4aes1dedJSqJMbdxsOnCucPtuaKIuekfjRNhUEFPcPdtJ3co8TWwP+fRSXZMXh6/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9OIxXpWFOxJUs0LpZkjWmNew2cPhyBZxC5on4dBGwY31kfuBV
	Wy1uxqZkPCL88GQPT25SQLidNezTlRD9ykqsfUHckWs9VOWMeBLPyC3RvEiu7gVCX+8DxtvzoH8
	A6fOLSoSkMcuUqZo5MQx2roRfd8izr4stt0eCXnJ8UyhdUzVkXznQ3D2WxUq3mRIw
X-Gm-Gg: AeBDiev8ijQNvHkXqZ/1a0yJi4XfOnSgphkBw3gvl6VbY2JT0j0NFeAnBGiIMqNIHPa
	D+6DW3OvW+YBXD+SrDbu330dK0Ry5JNeunvJqZIPu+m9IVMgJrrkuS57aNnssrRJjKNIm0CATH3
	ZceOaBdKGehTdmRwgWXuVfxSdeHS7izzN4MYbKD/Y6GCFD+akwANceK2EIb7EwUY/FoGmgQaVfW
	0g+xXiVH6IGy4fqnx2b/gJRq+DMzG3ZMOGoEnV4dmVWO0LJB7hniy9N9e0RKbXOWRgydEx1y3+0
	vh3FmXNE32Ql0ZJ1O0zk2MuvahH6w96ufz2wgnVXXFb49+Sd2TQTzHqxx+4uI13PZR3QOc443Ak
	FA4KpHoTZDZYGEszLXnQnTMx3B4dFAP5VOWj0LzoF9pFpIDqWyCt8yAJwEK6lpwRMny/ZSnMF44
	MNlamm+RbugTPMn+SZ+qDL
X-Received: by 2002:a17:90b:1642:b0:35f:b107:f1ae with SMTP id 98e67ed59e1d1-361403adbcfmr13890621a91.4.1776691777585;
        Mon, 20 Apr 2026 06:29:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1642:b0:35f:b107:f1ae with SMTP id 98e67ed59e1d1-361403adbcfmr13890573a91.4.1776691777015;
        Mon, 20 Apr 2026 06:29:37 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fe07c7sm10502749a91.5.2026.04.20.06.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 06:29:36 -0700 (PDT)
Message-ID: <488faf07-3d22-49f5-af7c-cd27d9bc87ec@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:29:30 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <20260417073336.2712426-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260417073336.2712426-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzMSBTYWx0ZWRfX+3ZD2QHdpSn5
 TMJDsk0Z4KI1mIAWOTgNJ5b5L2Dg67uiWVYPVehISjzM5/nQbkhaHaQuNKd2PxNb1EkVkUhBVkt
 R6Pg5wZ4FYiHTKttu7ba/8hJWxuwwMIKFT9MfM4Nye7y7I5iHWZprRz2zRgSSl/BBtg/ajnBlpq
 6x0pUyWKANajGovbjGcAkmh2/Z36wVNc5/n4M5IEHGJIhWoZooyf4p2+ahb1qyfb+bUcl4gj2Xv
 uYF4r2GOQqnNXmsCveoo6kM7B1xeHkcbmCZnVGPu//rZVOHMhtg6+Mf4cF/VIrEVApUSOBVpq5J
 9qJnyfkGnXhEz2oX/JGJRobI2H0zAYSWD7qZEY/tliyN0YcTFfPVU/ev0oMJAZdCVMtET/JZWoW
 af/pcJvQjp6ia0fedvQije4pLHYcENV+ymgihDUHGY6cNaWS5D6kafsLxo0aPA687i8uAKGHeUa
 WVGgTaeMxNnyiDRESQQ==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e62a42 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XEOHbNyQ1_GqabX02WAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ZQv-c7e759jN6Zz9Hdf6w6qRYRHlqKdd
X-Proofpoint-GUID: ZQv-c7e759jN6Zz9Hdf6w6qRYRHlqKdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200131



On 4/17/2026 3:33 PM, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 

LGTM.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
>   2 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 7a3573e03e27..a6b6019c8ef1 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion:	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 6d5bf2621cb0..9fb51f2a912f 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -420,8 +420,82 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct value_table *vt = drvdata->value_table;
> +	u32 *cond_decode = drvdata->value_table->condition_decode;
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value != 1)
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->lock);
> +	if (!drvdata->enabled) {
> +		spin_unlock(&drvdata->lock);
> +		ret = pm_runtime_resume_and_get(drvdata->dev);
> +		if (ret)
> +			return ret;
> +		spin_lock(&drvdata->lock);
> +	}
> +
> +	tgu_do_disable(drvdata);
> +
> +	if (vt->priority) {
> +		size_t size = MAX_PRIORITY * drvdata->num_step *
> +				drvdata->num_reg * sizeof(unsigned int);
> +		memset(vt->priority, 0, size);
> +	}
> +
> +	if (vt->condition_decode) {
> +		size_t size = drvdata->num_condition_decode *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_decode, 0, size);
> +	}
> +
> +	/* Initialize all condition registers to NOT(value=0x1000000) */
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			cond_decode[calculate_array_location(drvdata, i,
> +			TGU_CONDITION_DECODE, j)] = 0x1000000;
> +		}
> +	}
> +
> +	if (vt->condition_select) {
> +		size_t size = drvdata->num_condition_select *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_select, 0, size);
> +	}
> +
> +	if (vt->timer) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
> +				sizeof(unsigned int);
> +		memset(vt->timer, 0, size);
> +	}
> +
> +	if (vt->counter) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
> +			      sizeof(unsigned int);
> +		memset(vt->counter, 0, size);
> +	}
> +
> +	spin_unlock(&drvdata->lock);
> +
> +	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
> +
> +	pm_runtime_put(drvdata->dev);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>   static struct attribute *tgu_common_attrs[] = {
>   	&dev_attr_enable_tgu.attr,
> +	&dev_attr_reset_tgu.attr,
>   	NULL,
>   };
>   

