Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC473B1019
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699440; cv=none; b=LMSbWslHLMcV3Kh3PF/zCp6wgM/8dNO/YHx1WMprTk8kfYFMAxcp1leOnXOyWds280phrIIQmZJFBGF5avwqqTJQDOibequbcZcDNV4SeFDTFgioxiB0HmpF0Xw2vzHQcUlvJvHxu4a8CI5Dl9T9anZ6uNM8uWgY0lZ+SewJYTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699440; c=relaxed/simple;
	bh=V2CDtU2sApYLQL60WrBZhaKK/T+UY76Ll5JaE52GJ/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6Fuu62KSF3TqtCMYZPJo/TQ3ucQBcTlLNoAHm6M3EXLzGbZhbRryr7ZloAz1A/ooDDK1FNnYFlU5g/OYvvpYzmlnzU2ut7BUQM4/00dDCMBuiQixNVJVgK6UkvPtesyHQ3RuFBf03ayLKIHgFvaDqd5jLXQxyBviE5CU8BTk80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXvZRzOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SY78sHOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXvZRzOd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SY78sHOX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuIM53995531
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ij7RA1HzN2SRpHABYetDfbRP
	MtfVR0mnxi1AJWG5/18=; b=EXvZRzOdK4sZa7UTTq4mGuOgX7aEfog2+0ysKWvq
	0Mfc8dCGNGLRZx8Y9qPGwPhdV5YTBtOp+SLqmDT4TTZ49Wuw5Cl/bTxfZDLRJUym
	jy1ChXHxOZgt/0sZ3PMHfrpcUZlGH00wEZU7TYpiQtI/eI0uuOhJssD2lxP9ZRWk
	/xHLcO5bmU5spq9/XIU8q5WOno/GyGjWD595WxEcdF4C1DMzfW2JaecfAdrK500G
	itTcYqevG7dWOFBkJqptHsPDe4EiTqQ5+oGOJm/IFqrJRhojSD7MQiLgqKAiLkUy
	gPuAui66cYvu3EQOPXD2M0Fbmc8pSiuJCOVZgfKxEe+I2g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8urjtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:10:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6332db4182dso4634637137.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778699434; x=1779304234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ij7RA1HzN2SRpHABYetDfbRPMtfVR0mnxi1AJWG5/18=;
        b=SY78sHOXL1ZARS+kwaK3kDEzoBFA54Mq1t28omtVOEgS9iETyhRwVPMbeXdhiSicHH
         jFLyAmlpBEq7BLp2S6iGtGds2DVr4ul0abRcN/48UgKVXgJ41Fh4rpSvIAcQ42zlmvad
         TnR8osNWlXPbOeUstyg91p/hw6uZHZg7gzIJ9Oflec3DiJhqpTt/EgMrrwco2kVhQUFF
         7bT0RvCnWjJeVG/8lLjT/koXmARSb/2s567A6CK0cI6pB95KtgoNC3U6yA/UuOuXDoi8
         g4i0jJv0FYPKK9ckm4Ndb5PkTatbxRRL+deagv4pJecqGBHX/1e4KddxCUi8APHKpMwd
         PvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778699434; x=1779304234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ij7RA1HzN2SRpHABYetDfbRPMtfVR0mnxi1AJWG5/18=;
        b=pd4mwL37BudpJtcXaYcbWdDV94jtZjdcwm8gJL30i7tDWTpHufr/vP8nr/duv8lbUS
         xExDBwNasfe3fahqUoZuVLXrYcY+GvLPfoey3c9hkCauhmWVZfFWmTo+qfwy63LrP+y0
         lbLMihxS9MNIslkk3mU4DAiQp5jkfNmR2fU5F0wCV5MF3HgsOtuVKGhPJqAYJEm5/aI9
         K7YcpMtJiwspOg7JSFnrIojib/wtzNkuWDvSOoS5FEi9mMqHgthvUlx3TMDArvORnoss
         qd053uuauZnd4lK1svu9juRSoR58cCk6+x1BfEISETnOukEXqDf5rJrFu4QBmatQrRpM
         0Q+Q==
X-Forwarded-Encrypted: i=1; AFNElJ96QwCwEXrdHEZ3Rh/8HNouA/NXqpbf3vKMBGM2aTGndCOOi98951Cs+OzlRBNzs7maTb5s7k4H0d6n@vger.kernel.org
X-Gm-Message-State: AOJu0YzA7O9kGSVAf4EgYUFMAWP7BaNFDXXyR1zMIAZNcLLWneIdoS+1
	pZI0tEHT6r7AW+KmBtWt6F0R5yF/OpRrEO1GmArOMddBsKHELiz6bSxHiKItpYkpeL97darbnGj
	ynaZ2PxMk9QPCwz2i/19rMI1mukYzJxHhNO31VIDjZ6Bo3ImD60Ky0EvrPBL8H61E
X-Gm-Gg: Acq92OEW6ZIVBguv6/cMHQ8DF3kiciKGXt9FttC49J407okdjJ4G2dFMM4cHKHGjdws
	EFXJHSXYv6pu8jmveXKFigQsHFF/PruO6+ueexDudaSaJlob0n/6cuEkOcUg3Ro1GSgcVxL/8CD
	mkUyYndb6FZVJSlKmOU6beqEpxl8sT9uB/MoA8itM5RdCZnynpg7QorsY8OidEknK5++t22bZdX
	XdCYggzau7V3a7f0sZ81ZYrysTgfDH0J9ufaV79i1BcA0HaY252POP8Rpg4nPVP5ouwlY0/0iyN
	ta4Ag0y9Z+hi7aqJm/cACOuYrmbYQv7DtVVXXXk2BSXhD++/nY2RqO8eGCDVlxqfxmbITMViFe+
	W33dWVDXjjML/x0MVRfvxu35YgPruOQ2zZOZ4rre7FzcrB0shKBromhZAw8ObKUAF72jiCDj2+V
	NmRLWDY2D1he+3wamsewuiN4XV6Uo890/a6zR4x0+04FFZTw==
X-Received: by 2002:a05:6102:14a8:b0:634:8685:d335 with SMTP id ada2fe7eead31-637aa01fd9dmr2325401137.14.1778699433787;
        Wed, 13 May 2026 12:10:33 -0700 (PDT)
X-Received: by 2002:a05:6102:14a8:b0:634:8685:d335 with SMTP id ada2fe7eead31-637aa01fd9dmr2325377137.14.1778699433128;
        Wed, 13 May 2026 12:10:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e163sm4351293e87.44.2026.05.13.12.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 12:10:31 -0700 (PDT)
Date: Wed, 13 May 2026 22:10:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 11/14] media: iris: Add support to select core for
 dual core platforms
Message-ID: <urpdhb6svgprfvo3drmpr5pusy4vjqf3hom3vtvf6kket3fqcw@lrad6xcrbzex>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-11-7fbb340c5dbd@oss.qualcomm.com>
 <qodaq4xoi6whna4phhrfbdfanfm43y7vmg4qxjuke5m3qgxozn@h2ot2a7w36xh>
 <a9658e1e-70ed-0c30-28d9-28966242a4eb@oss.qualcomm.com>
 <uujvaqpr72vmdl7w6kjh4xggci4pnhfwukatdj2x63hewfhawa@muzebwimx4oi>
 <fa2eb472-92f9-9bf0-be62-93a88785b405@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa2eb472-92f9-9bf0-be62-93a88785b405@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04ccaa cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=PtqXx7cjCSzpcFS0k_QA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 1wb0IVaQOpDAA1ShyfIIj4TZK8S1qJUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE5MCBTYWx0ZWRfX0eG5gVJn/bpO
 rhmpSRLgoTYbC/KOjNzrG4bumb3NCqG4pCtnnbFguXvm+JdVQWaKvZO3IKc2R5714RLt96uiXAu
 DTedfF73Vg8SasBCosTlC6jFyuj0i2EFIfVYLYHmdeIw7DMOyrG53F+3dVxXkHPNnHpbA5ogrTV
 /6gf0RgESV3crY43ClR+KaSNgh0YUc3Cs8Efk18sIbveylDQQ1/Mwr3NknuMvFgCm61rZvlfTjp
 TJLqR0EoHSoC76YeMQAr7ZsG2decsHMxJBq2E7Cjp3Kn/Klv9h5KU14UPNpHazFjFkQKIvlRPrR
 t4tEG2Y6BtJjKrhhsIwRVV5LZnArSA9/yBqKksptD0eL/zsALey56GxGmfdOCDk0rz2zDjPNuvl
 RIpFxj/Ctunu2qq62nb9Ccpe3Z26QREBqDSJqzr49la0Z6dCCG7nBjkATZ8d265XY1nDBCOgeRa
 R/M4R5GKAtgQrdvLMEA==
X-Proofpoint-ORIG-GUID: 1wb0IVaQOpDAA1ShyfIIj4TZK8S1qJUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130190

On Thu, May 14, 2026 at 12:25:58AM +0530, Vishnu Reddy wrote:
> 
> On 5/13/2026 7:21 PM, Dmitry Baryshkov wrote:
> > On Mon, May 11, 2026 at 09:42:43PM +0530, Vishnu Reddy wrote:
> >> On 5/9/2026 2:30 AM, Dmitry Baryshkov wrote:
> >>> On Sat, May 09, 2026 at 12:30:00AM +0530, Vishnu Reddy wrote:
> >>>> On platforms with dual vcodec cores, select the hardware core for a
> >>>> session based on current load. Assign the session to vcodec0 if its
> >>>> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
> >>>> the selected core to firmware using the new HFI_PROP_CORE_ID property.
> >>>>
> >>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/media/platform/qcom/iris/iris_common.c     | 10 +++
> >>>>  drivers/media/platform/qcom/iris/iris_common.h     |  1 +
> >>>>  drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
> >>>>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
> >>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 ++++++
> >>>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
> >>>>  drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
> >>>>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
> >>>>  drivers/media/platform/qcom/iris/iris_power.c      | 11 ++--
> >>>>  drivers/media/platform/qcom/iris/iris_utils.c      | 75 ++++++++++++++++------
> >>>>  drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
> >>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
> >>>>  12 files changed, 113 insertions(+), 23 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
> >>>> index 7f1c7fe144f7..3b3fc482e194 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_common.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> >>>> @@ -46,6 +46,16 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
> >>>>  	inst->metadata_idx++;
> >>>>  }
> >>>>  
> >>>> +int iris_set_core_id(struct iris_inst *inst)
> >>>> +{
> >>>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> >>>> +
> >>>> +	if (!inst->core->iris_platform_data->dual_core)
> >>>> +		return 0;
> >>>> +
> >>>> +	return hfi_ops->session_set_core_id(inst, inst->core_id);
> >>>> +}
> >>>> +
> >>>>  int iris_process_streamon_input(struct iris_inst *inst)
> >>>>  {
> >>>>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
> >>>> index b2a27b781c9a..34e32c60f768 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_common.h
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_common.h
> >>>> @@ -11,6 +11,7 @@ struct iris_buffer;
> >>>>  
> >>>>  int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf);
> >>>>  void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
> >>>> +int iris_set_core_id(struct iris_inst *inst);
> >>>>  int iris_process_streamon_input(struct iris_inst *inst);
> >>>>  int iris_process_streamon_output(struct iris_inst *inst);
> >>>>  int iris_session_streamoff(struct iris_inst *inst, u32 plane);
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> >>>> index b396c8cf595e..54a8649841e4 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_core.h
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> >>>> @@ -30,6 +30,11 @@ enum domain_type {
> >>>>  	DECODER	= BIT(1),
> >>>>  };
> >>>>  
> >>>> +enum iris_vcodec_core_id {
> >>>> +	IRIS_VCODEC0 = 1,
> >>>> +	IRIS_VCODEC1,
> >>>> +};
> >>>> +
> >>>>  /**
> >>>>   * struct iris_core - holds core parameters valid for all instances
> >>>>   *
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> >>>> index 3edb5ae582b4..fbaf852a6b99 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> >>>> @@ -124,6 +124,7 @@ struct iris_hfi_command_ops {
> >>>>  	int (*session_drain)(struct iris_inst *inst, u32 plane);
> >>>>  	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
> >>>>  	int (*session_close)(struct iris_inst *inst);
> >>>> +	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
> >>>>  };
> >>>>  
> >>>>  struct iris_hfi_response_ops {
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> >>>> index 30bfd90d423b..9d9fae587297 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> >>>> @@ -1300,6 +1300,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
> >>>>  					inst_hfi_gen2->packet->size);
> >>>>  }
> >>>>  
> >>>> +static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
> >>>> +{
> >>>> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> >>>> +	u32 payload = core_id;
> >>>> +
> >>>> +	iris_hfi_gen2_packet_session_command(inst,
> >>>> +					     HFI_PROP_CORE_ID,
> >>>> +					     HFI_HOST_FLAGS_NONE,
> >>>> +					     HFI_PORT_NONE,
> >>>> +					     inst->session_id,
> >>>> +					     HFI_PAYLOAD_U32,
> >>>> +					     &payload,
> >>>> +					     sizeof(u32));
> >>>> +
> >>>> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> >>>> +					inst_hfi_gen2->packet->size);
> >>>> +}
> >>>> +
> >>>>  static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
> >>>>  	.sys_init = iris_hfi_gen2_sys_init,
> >>>>  	.sys_image_version = iris_hfi_gen2_sys_image_version,
> >>>> @@ -1317,6 +1335,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
> >>>>  	.session_drain = iris_hfi_gen2_session_drain,
> >>>>  	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
> >>>>  	.session_close = iris_hfi_gen2_session_close,
> >>>> +	.session_set_core_id = iris_hfi_gen2_set_core_id,
> >>>>  };
> >>>>  
> >>>>  void iris_hfi_gen2_command_ops_init(struct iris_core *core)
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> >>>> index cecf771c55dd..600e9dc07669 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> >>>> @@ -56,6 +56,7 @@
> >>>>  #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
> >>>>  #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
> >>>>  #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
> >>>> +#define HFI_PROP_CORE_ID			0x030001a9
> >>>>  
> >>>>  enum hfi_rate_control {
> >>>>  	HFI_RC_VBR_CFR		= 0x00000000,
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> >>>> index 16965150f427..dd341ca5be57 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> >>>> @@ -37,6 +37,7 @@ struct iris_fmt {
> >>>>   *
> >>>>   * @list: used for attach an instance to the core
> >>>>   * @core: pointer to core structure
> >>>> + * @core_id: specifies the hardware core on which the session runs
> >>>>   * @session_id: id of current video session
> >>>>   * @ctx_q_lock: lock to serialize queues related ioctls
> >>>>   * @lock: lock to seralise forward and reverse threads
> >>>> @@ -79,6 +80,7 @@ struct iris_fmt {
> >>>>  struct iris_inst {
> >>>>  	struct list_head		list;
> >>>>  	struct iris_core		*core;
> >>>> +	u32				core_id;
> >>>>  	u32				session_id;
> >>>>  	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
> >>>>  	struct mutex			lock; /* lock to serialize forward and reverse threads */
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>> index 8995136ad29e..502d7099085c 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>> @@ -258,6 +258,7 @@ struct iris_platform_data {
> >>>>  	const struct tz_cp_config *tz_cp_config_data;
> >>>>  	u32 tz_cp_config_data_size;
> >>>>  	u32 core_arch;
> >>>> +	bool dual_core;
> >>>>  	u32 hw_response_timeout;
> >>>>  	struct ubwc_config_data *ubwc_config;
> >>>>  	u32 num_vpp_pipe;
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
> >>>> index 91aa21d4070e..b72ce5b596b8 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_power.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_power.c
> >>>> @@ -77,9 +77,9 @@ static int iris_vote_interconnects(struct iris_inst *inst)
> >>>>  
> >>>>  static int iris_set_clocks(struct iris_inst *inst)
> >>>>  {
> >>>> +	u64 vcodec0_freq = 0, vcodec1_freq = 0;
> >>>>  	struct iris_core *core = inst->core;
> >>>>  	struct iris_inst *instance;
> >>>> -	u64 freq = 0;
> >>>>  	int ret;
> >>>>  
> >>>>  	mutex_lock(&core->lock);
> >>>> @@ -87,11 +87,14 @@ static int iris_set_clocks(struct iris_inst *inst)
> >>>>  		if (!instance->max_input_data_size)
> >>>>  			continue;
> >>>>  
> >>>> -		freq += instance->power.min_freq;
> >>>> +		if (instance->core_id == IRIS_VCODEC0)
> >>>> +			vcodec0_freq += instance->power.min_freq;
> >>>> +		else
> >>>> +			vcodec1_freq += instance->power.min_freq;
> >>>>  	}
> >>>>  
> >>>> -	core->power.clk_freq = freq;
> >>>> -	ret = iris_opp_set_rate(core->dev, freq);
> >>>> +	core->power.clk_freq = max(vcodec0_freq, vcodec1_freq);
> >>>> +	ret = iris_opp_set_rate(core->dev, core->power.clk_freq);
> >>>>  	mutex_unlock(&core->lock);
> >>>>  
> >>>>  	return ret;
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> >>>> index cfc5b576ec56..da8a89d3dd41 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> >>>> @@ -90,40 +90,79 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
> >>>>  	return NULL;
> >>>>  }
> >>>>  
> >>>> -int iris_check_core_mbpf(struct iris_inst *inst)
> >>>> +static u32 iris_get_mbps(struct iris_inst *inst)
> >>>>  {
> >>>> -	struct iris_core *core = inst->core;
> >>>> +	u32 fps = max(inst->frame_rate, inst->operating_rate);
> >>>> +
> >>>> +	return iris_get_mbpf(inst) * fps;
> >>>> +}
> >>>> +
> >>>> +static int iris_check_and_assign_core(struct iris_inst *inst, bool mbpf)
> >>>> +{
> >>>> +	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
> >>>> +	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
> >>>> +	u32 max_session_cnt = platform_data->max_session_count;
> >>>> +	u32 core0_session_cnt = 0, core1_session_cnt = 0;
> >>>> +	bool dual_core = platform_data->dual_core;
> >>> num_cores
> >> A num_cores field would require updating all platform data entries. For two
> > I was thinking about adding num_cores to platform_data and to iris_inst
> > (or iris_core) and setting it to 1 if the value is unset in
> > platform_data.
> >
> > A better option would be to move all these multi-core functions to a
> > separate file.
> 
> Thanks for your point, Adding num_cores to platform_data makes sense if the
> number of cores grows beyond two. For now, since we only handle single and
> dual core, the current logic feels simpler and sufficient to cover both cases.
> Happy to adopt the num_cores approach in the future if we have any platform
> with more than dual core.

Again, an alternative approach is to get all the platform specifics into
the corresponding iris_vpuXX.c file.

> 
> >> cores, a simple boolean flag feels sufficient here.
> >>
> >>>> +	u32 core0_load = 0, core1_load = 0;
> >>>> +	bool select_core0, select_core1;
> >>>>  	struct iris_inst *instance;
> >>>> -	u32 total_mbpf = 0;
> >>>> +	u32 load, new_load;
> >>>>  
> >>>> -	mutex_lock(&core->lock);
> >>>> -	list_for_each_entry(instance, &core->instances, list)
> >>>> -		total_mbpf += iris_get_mbpf(instance);
> >>>> -	mutex_unlock(&core->lock);
> >>>> +	inst->core_id = 0;
> >>>>  
> >>>> -	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
> >>>> +	list_for_each_entry(instance, &inst->core->instances, list) {
> >>>> +		load = mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
> >>>> +
> >>>> +		if (instance->core_id == IRIS_VCODEC0) {
> >>>> +			core0_load += load;
> >>>> +			core0_session_cnt++;
> >>>> +		} else if (instance->core_id == IRIS_VCODEC1) {
> >>>> +			core1_load += load;
> >>>> +			core1_session_cnt++;
> >>> Arrays, please.
> >> Since we only have two cores, explicit variables feel cleaner and easier to
> >> read than arrays.
> >>
> >>>> +		}
> >>>> +	}
> >>>> +
> >>>> +	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
> >>>> +
> >>>> +	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
> >>>> +	select_core1 = dual_core && core1_load + new_load <= max_load &&
> >>>> +		     core1_session_cnt < max_session_cnt;
> >>>> +
> >>>> +	if (select_core0 && select_core1)
> >>>> +		inst->core_id = (core0_load <= core1_load) ? IRIS_VCODEC0 : IRIS_VCODEC1;
> >>>> +	else if (select_core0)
> >>>> +		inst->core_id = IRIS_VCODEC0;
> >>>> +	else if (select_core1)
> >>>> +		inst->core_id = IRIS_VCODEC1;
> >>>> +	else
> >>>>  		return -ENOMEM;
> >>>>  
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> -int iris_check_core_mbps(struct iris_inst *inst)
> >>>> +int iris_check_core_mbpf(struct iris_inst *inst)
> >>>>  {
> >>>>  	struct iris_core *core = inst->core;
> >>>> -	struct iris_inst *instance;
> >>>> -	u32 total_mbps = 0, fps = 0;
> >>>> +	int ret;
> >>>>  
> >>>>  	mutex_lock(&core->lock);
> >>>> -	list_for_each_entry(instance, &core->instances, list) {
> >>>> -		fps = max(instance->frame_rate, instance->operating_rate);
> >>>> -		total_mbps += iris_get_mbpf(instance) * fps;
> >>>> -	}
> >>>> +	ret = iris_check_and_assign_core(inst, true);
> >>>>  	mutex_unlock(&core->lock);
> >>>>  
> >>>> -	if (total_mbps > core->iris_platform_data->max_core_mbps)
> >>>> -		return -ENOMEM;
> >>>> +	return ret;
> >>>> +}
> >>>>  
> >>>> -	return 0;
> >>>> +int iris_check_core_mbps(struct iris_inst *inst)
> >>>> +{
> >>>> +	struct iris_core *core = inst->core;
> >>>> +	int ret;
> >>>> +
> >>>> +	mutex_lock(&core->lock);
> >>>> +	ret = iris_check_and_assign_core(inst, false);
> >>>> +	mutex_unlock(&core->lock);
> >>>> +
> >>>> +	return ret;
> >>>>  }
> >>>>  
> >>>>  bool is_rotation_90_or_270(struct iris_inst *inst)
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> >>>> index bf0b8400996e..5a05f7d65501 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> >>>> @@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
> >>>>  	if (ret)
> >>>>  		goto error;
> >>>>  
> >>>> +	ret = iris_set_core_id(inst);
> >>>> +	if (ret)
> >>>> +		goto error;
> >>>> +
> >>>>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> >>>>  		if (inst->domain == DECODER)
> >>>>  			ret = iris_vdec_streamon_input(inst);
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> >>>> index 5eb1786b0737..a1ce3cd524a3 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> >>>> @@ -41,16 +41,20 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
> >>>>  
> >>>>  static void iris_add_session(struct iris_inst *inst)
> >>>>  {
> >>>> +	u32 max_session_count = inst->core->iris_platform_data->max_session_count;
> >>>>  	struct iris_core *core = inst->core;
> >>>>  	struct iris_inst *iter;
> >>>>  	u32 count = 0;
> >>>>  
> >>>> +	if (inst->core->iris_platform_data->dual_core)
> >>>> +		max_session_count *= 2;
> >>> max_session_count *= num_cores.
> >>>
> >>>> +
> >>>>  	mutex_lock(&core->lock);
> >>>>  
> >>>>  	list_for_each_entry(iter, &core->instances, list)
> >>>>  		count++;
> >>>>  
> >>>> -	if (count < core->iris_platform_data->max_session_count)
> >>>> +	if (count < max_session_count)
> >>>>  		list_add_tail(&inst->list, &core->instances);
> >>>>  
> >>>>  	mutex_unlock(&core->lock);
> >>>>
> >>>> -- 
> >>>> 2.34.1
> >>>>

-- 
With best wishes
Dmitry
