Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4367D3921DF
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125696; cv=none; b=Zn1c52rV9NzhheXYp/VJBvagay1KsUABJjXQxJmrk4rF4jCope4sVs8fOAQELBzlOjGHGE76P9z8n3P+LPdWkcGs40vg433iZwBFRqaaiX/xKUiX8+zEP8bOEbq8w605lLay2j3HuAEUmCgtoRVU1uhyDyT0Vdg6c+0291qEYUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125696; c=relaxed/simple;
	bh=REcENdaosnAkFqqFzOgJyBHuHUx4hDLNOUZw3J7VwQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Py6CPxkt+3KSNSUJa8Oh8vGp7fAhRnu/kdGB3oruK78Lg/7J56S+wObadxn31J/spA53mZEWcQTvnt+hFtSLpSDJohkh0o5ruydG302vrtY3XBS1m/dAZuA4R0Re/weJ6Si38HoW07X6XAnbjPCqk+vLlhVU801JzQrjVXPf3kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtEE2CB/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVedCqqm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtEE2CB/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVedCqqm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327CVTO3044437
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 10:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQ7Zd5cgb0yk5pits+gN3wLhngPs3KzNIb6mGSmkcF0=; b=QtEE2CB/LG9Io4Go
	EGhJemTXECeThCcc/wBzfFu7oYLJTSD+Xjh5AElDvpqmEWXIlVlpD0Iixl/+nm5D
	KMkDQ6kNvHV3qraajIboWHlpMKVWW1c0I76IDVtT1fhmNlxf0NoIPozhtc/fRoyr
	wLnS4Wjc0pN+s5BgW/doG+xZhHQsUiLAKA0+KI5FrlSgztvBUMNnQYpNqlw6LAQT
	SX+AWvVmaBWYYSg48+qbTSRQuP8B6/u/nNN+6my7WhiMO4RkPnj3h/kMOO6CKy8m
	R8xMlkZ6onc7wmcWOaigKL0DSwHrDSB+3DGmKmNggJKgHmGtyHVr0bY5fFAjOWsM
	lhxz4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483vctt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 10:28:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0bf2b3879so18553545ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125692; x=1775730492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQ7Zd5cgb0yk5pits+gN3wLhngPs3KzNIb6mGSmkcF0=;
        b=eVedCqqmjefnPpxVXco0mBCu/W1eLTSGcngPGZpQN9eC57LeQ5ZbRnWefvKTw7Qc0i
         igrkb9BYUclviYIeqAK0SspD642KSMUm9gzNeYh7JHRQMypealwRp+8e1pg0dVn51CY6
         09Y3J1wmBGz4mpr6GPJTwKAZCuDZ3uzmZ6AvpudXO3L7LK6KGzBz+EYCWQB9QBx+1dvP
         jys+1ZHO4cWcP7GpzkTEbEKDaQ0z2PpR1XDgNII4wwCnPJrJXyLVLxREDhm0IYvrqlka
         /xM/BOnNKrJRMFVSCybvW54CWumMZuUZrM146mzZXrkpqZ7APZE8RAS34Sxe6FgPhDff
         uC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125692; x=1775730492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQ7Zd5cgb0yk5pits+gN3wLhngPs3KzNIb6mGSmkcF0=;
        b=AvhtoJxBuwtafXbo1wThq7t7OPCPwDEK6s+Tg4XYcfOxQqg7xSSboMma/brQj9UlRs
         1CJZ0Pn9iU3ngpSdE8exUR2NHTlNn1h67g/dxZfEvYky7ZstVOHw1rxiql09c8qBFDbI
         AFUG3RiU0JDC5m6YuUcC6E9P80v61L9cT19SXyms1wRs592kfW2wFEXV8KDjFaHA30Sr
         +EJeto/X/hJQXYfQ8fLxjCzn6fCdkO/uvg8xOwArtPGR/wxV/b27UOVRmVu4W9fPhtE9
         0Gbl6t3y155iMhQKKquWRLoPQ0MSIoTnuVslPT9UneRCzxI7o2TomqnJhVtRU/erwxeX
         BEMw==
X-Forwarded-Encrypted: i=1; AJvYcCUQV4JkWludFvu6yNbDm1jthrHfLptgHcFTcdqq9us2dxgl4Ad+W0dQgoRyO0Kb2ymBKbPrOQh79MAe@vger.kernel.org
X-Gm-Message-State: AOJu0YxawK+EXIJBiXGLU2i/j6kFNXuPw63fffL8zCm5F8noVX7tZjPy
	kdmrQIt/FlZy2b5+eNkiX3bU60Dd3b6lbMrpsU8w0sr2Qgr0LIWsg0rT3fRrDKrzGrQjO0f0lQN
	9B6enPpq3VmiwX57i/UMSMUFB+izp1ru4o+d4whPOFxICNW3innvB4XuxZo7cwpBu
X-Gm-Gg: AeBDievZAfJfRMgczD1r6uvnTGpx0dtODnaO+cNVWKQYwxTbOdn0nZKAy+yOriHsC5I
	mHUQoHhuE6lAmd5InEKSw71K4hmAZcJ08h5kzs0bXgMTpaiRrqXariCrfcSN1Y134l3BSVRh7wl
	/6bbDOmNXc1d93QRDveBYsy3kZsz9sH810Z//M9yt7msZjvFPuwDOy3xjs6znq1nhesXfyaLZKV
	gGaR4ZstvymsLDxJ/lJXKQ+L3h5SOD08Itfqbp0YruVl/31ttajwn+Lw5FeLTHH41Lx43lyF1eP
	MZegNOJUFMXMFP+4eLsap3yVO1DAOO5QLOMU1AiPDjo8zJjFx0PRMihDtFSgOGMykKIUq6ktRpV
	AY4iJ300X/H+w3c9Ni37RlEeT5J0JkwFVmNqL+TNRdAr1+yWyll4QlQY6WEuho2NaHepWIl63+3
	VJzGcuzpGxj5U=
X-Received: by 2002:a17:903:1a4e:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b269c3c5f6mr76030915ad.15.1775125692323;
        Thu, 02 Apr 2026 03:28:12 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b269c3c5f6mr76030445ad.15.1775125691854;
        Thu, 02 Apr 2026 03:28:11 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475ff56sm24425525ad.22.2026.04.02.03.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:28:11 -0700 (PDT)
Message-ID: <be011ef1-e938-44ab-80e8-fdbadf5feeb1@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 18:28:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 5/7] qcom-tgu: Add support to configure next action
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-6-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-6-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce44bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ex1FgqpvNLb1JEDmgOQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfX+s0GjtzH73Rj
 Ry/jsJ0Y3IS7tIsjnX1mH2xPEFucBqM4LaRcsd9bz7Z0wSR43Z5KXrFdqQvfJDR2zRrIDgvz3s6
 jF1qlLcHImcskciY8gg4tpHwZGMiwUAsgHeJToZW5AyFr8N4OaVfNg/VFwmJbzWqaYIlQcZ58JP
 fpCASwRj/gzFEoW13BpmR5OY9DWEr1V5hH3P9NW+U8XR7tBUmCWXkNtHIuzZEg7EF0vVfxDOYbr
 7PHOlc5C7Csn2wMYUc0128XgIfU9YB06FcQRRUkBRHBgs1D16EIZxOxXMAlOTKOkCpMNtgEFpZr
 PbGyG1dJJdjcGA91hPlURxWci9niFHrBOWd15U/6iXeTwuQcQukjxddYZ6Fm91YeXeUjEiuiTRG
 XXh/iqmpsbPI0zbnX7S/ltCKwEAgqy6x28e2zZHKC3QCxD+OMkrsM1534aS0H2AspcWjuutyyEt
 fT51eGm2TbfPZEA9Eqg==
X-Proofpoint-ORIG-GUID: sE5ZlphdLdXpHJdv4lW3LNVwmZUffErJ
X-Proofpoint-GUID: sE5ZlphdLdXpHJdv4lW3LNVwmZUffErJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020093



On 4/2/2026 5:28 PM, Songwei Chai wrote:
> Add "select" node for each step to determine if another step is taken,
> trigger(s) are generated, counters/timers incremented/decremented, etc.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
>   drivers/hwtracing/qcom/tgu.c                  | 53 ++++++++++++++++++-
>   drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
>   3 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 4ef0d696d3d0..786cb852bbe5 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -21,3 +21,10 @@ KernelVersion:	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the decode mode with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the next action with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 5b37eb10f863..4112e6a691d6 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -29,6 +29,9 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>   	case TGU_CONDITION_DECODE:
>   		return step_index * (drvdata->num_condition_decode) +
>   			reg_index;
> +	case TGU_CONDITION_SELECT:
> +		return step_index * (drvdata->num_condition_select) +
> +			reg_index;
>   	default:
>   		break;
>   	}
> @@ -71,6 +74,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
>   	case TGU_CONDITION_DECODE:
>   		return sysfs_emit(buf, "0x%x\n",
>   				drvdata->value_table->condition_decode[index]);
> +	case TGU_CONDITION_SELECT:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->condition_select[index]);
>   	default:
>   		break;
>   	}
> @@ -112,6 +118,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
>   		tgu_drvdata->value_table->condition_decode[index] = val;
>   		ret = size;
>   		break;
> +	case TGU_CONDITION_SELECT:
> +		tgu_drvdata->value_table->condition_select[index] = val;
> +		ret = size;
> +		break;
>   	default:
>   		ret = -EINVAL;
>   		break;
> @@ -146,6 +156,13 @@ static umode_t tgu_node_visible(struct kobject *kobject,
>   		if (tgu_attr->reg_num < drvdata->num_condition_decode)
>   			return attr->mode;
>   		break;
> +	case TGU_CONDITION_SELECT:
> +		/* 'default' register is at the end of 'select' region */
> +		if (tgu_attr->reg_num == drvdata->num_condition_select - 1)
> +			attr->name = "default";
> +		if (tgu_attr->reg_num < drvdata->num_condition_select)
> +			return attr->mode;
> +		break;
>   	default:
>   		break;
>   	}
> @@ -184,6 +201,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   				drvdata->base + CONDITION_DECODE_STEP(i, j));
>   		}
>   	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_select; j++) {
> +			index = check_array_location(drvdata, i,
> +						TGU_CONDITION_SELECT, j);
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_select[index],
> +				drvdata->base + CONDITION_SELECT_STEP(i, j));
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
>   exit:
> @@ -223,6 +252,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>   
>   	devid = readl(drvdata->base + TGU_DEVID);
>   	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
> +	/* select region has an additional 'default' register */
> +	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
>   }
>   
>   static int tgu_enable(struct device *dev)
> @@ -366,6 +397,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
>   	NULL,
>   };
>   
> @@ -373,8 +412,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> -	unsigned int *priority, *condition;
> -	size_t priority_size, condition_size;
> +	unsigned int *priority, *condition, *select;
> +	size_t priority_size, condition_size, select_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -425,6 +464,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	drvdata->value_table->condition_decode = condition;
>   
> +	select_size = drvdata->num_condition_select * drvdata->num_step;
> +
> +	select = devm_kcalloc(dev, select_size,
> +			     sizeof(*(drvdata->value_table->condition_select)),
> +			     GFP_KERNEL);
> +	if (!select)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->condition_select = select;
> +
>   	drvdata->enabled = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index 987ea07bd618..ac46a2875209 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -52,6 +52,7 @@
>   #define STEP_OFFSET 0x1D8
>   #define PRIORITY_START_OFFSET 0x0074
>   #define CONDITION_DECODE_OFFSET 0x0050
> +#define CONDITION_SELECT_OFFSET 0x0060
>   #define PRIORITY_OFFSET 0x60
>   #define REG_OFFSET 0x4
>   
> @@ -63,6 +64,9 @@
>   #define CONDITION_DECODE_STEP(step, decode) \
>   	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
>   
> +#define CONDITION_SELECT_STEP(step, select) \
> +	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
> +
>   #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
>   	(&((struct tgu_attribute[]){ {                                   \
>   		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> @@ -76,6 +80,8 @@
>   			reg_num)
>   #define STEP_DECODE(step_index, reg_num) \
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
> +#define STEP_SELECT(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
>   
>   #define STEP_PRIORITY_LIST(step_index, priority) \
>   	{STEP_PRIORITY(step_index, 0, priority), \
> @@ -107,6 +113,15 @@
>   	 NULL               \
>   	}
>   
> +#define STEP_SELECT_LIST(n) \
> +	{STEP_SELECT(n, 0), \
> +	 STEP_SELECT(n, 1), \
> +	 STEP_SELECT(n, 2), \
> +	 STEP_SELECT(n, 3), \
> +	 STEP_SELECT(n, 4), \
> +	 NULL               \
> +	}
> +
>   #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>   	(&(const struct attribute_group){\
>   		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -121,12 +136,21 @@
>   		.name = "step" #step "_condition_decode" \
>   	})
>   
> +#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_condition_select" \
> +	})
> +
 > +

remove extra blank line.

Thanks,
Jie


>   enum operation_index {
>   	TGU_PRIORITY0,
>   	TGU_PRIORITY1,
>   	TGU_PRIORITY2,
>   	TGU_PRIORITY3,
>   	TGU_CONDITION_DECODE,
> +	TGU_CONDITION_SELECT,
>   };
>   
>   /* Maximum priority that TGU supports */
> @@ -142,6 +166,7 @@ struct tgu_attribute {
>   struct value_table {
>   	unsigned int *priority;
>   	unsigned int *condition_decode;
> +	unsigned int *condition_select;
>   };
>   
>   static inline void TGU_LOCK(void __iomem *addr)
> @@ -172,6 +197,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @num_reg: Maximum number of registers
>    * @num_step: Maximum step size
>    * @num_condition_decode: Maximum number of condition_decode
> + * @num_condition_select: Maximum number of condition_select
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -187,6 +213,7 @@ struct tgu_drvdata {
>   	int num_reg;
>   	int num_step;
>   	int num_condition_decode;
> +	int num_condition_select;
>   };
>   
>   #endif

