Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFEF480DFE
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708675; cv=none; b=HRQbDHug7R/OI91wsbAD5glQzCxqOL31lmtnfMp3xl9Qi6mmmLMlq+Byu08qkR1voBOGB/WvHWIfNIRW6r21TafK2loIANkE2RwWa2GtYp4XSxEvo/S6JMIp8DjnPfMuBH1BRwPHOa9kUGS7BGynVi439z3VAjkcwL7f5OWzgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708675; c=relaxed/simple;
	bh=pASOjP3S0Uv4ugchenDmCNPGNwsOsomDAh19FFHphRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2vGmPfFUeG1QQ11Hmg7wcu+u1AMMNXLWiBfDL716E5+n4CO/9Ti03GQTvIrX+DqSRZNJAfkj0HecGAww4gaAVQ8Nc19Km/2WZaXqwwf3E2VIiZIWPGmXuf0UklRHj6ntr8d1YS4g0q3TxX5obLRG5Jh4BZRlwuQA6SaQxgVdOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJhgK/u+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kf1stwMX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJhgK/u+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kf1stwMX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEEHXS2476142
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hkYA6Lo4Jj5Kkyg3hZREkEP+CcxyQv2PQdWFdmvQa4=; b=mJhgK/u+arZhAPSb
	SxGBdHGKi1dTlJgk1piDUIAqxa3hCE9Bn1y0SJ49ZZTmrCg4elma6qqZR+Ekwsxl
	XazN0HE/pjwhSlx9TPsQOJORHxKBvwRGYd9Axvp+34oxP7MfPK3mo2kTYiErtnqh
	vy7MK8/YJ7n5if1APCJtRwnJ9ED3/dOiqwQbkgY7QJbxivClo5B54KVDPogYxld7
	HsBHWk7ZVH+l91wGBLpnN7TOVTXIOvpbNG43dzJn143rN/w4G0lDhPqvqSn2oJzW
	FUXI1zSHSUcaRmdcjQmzhZGl4GgI9UVx/su7/w5cqSoYFXn136C3QJ5xpbxDiRJf
	Z9ZSzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet3pts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:04:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso3163317a12.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781708673; x=1782313473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hkYA6Lo4Jj5Kkyg3hZREkEP+CcxyQv2PQdWFdmvQa4=;
        b=kf1stwMXHEKFQEcXKOoTv0lSVaA8ma4D17gVkIZ+cXeXy98HjLfRIblwIzPa6o1zmQ
         JG3tMpMfY2bfo3LMKoc3gg99yW62aI0CfKjqeY9/T3K+MORFpahBHcAkoi9FM/1H3IZ7
         U+BF3Sgu98InGZBUOP/UweYvDzKFqDnPS5zSMVrdYwOypkLu/9OCqwd6/7PCSdoE/qP8
         aInpxAk+NWryjXpxvDh9WaB6TU81J7qr4oZXj+cl18m8BLuNz1ywkYaaKiSnpMIlyCwD
         9tO1OTG0jIel/KRkOJRpKPUeyEf61U0e1UaqkuvwjFRl9nZuXaBr0p2IbeaTn9rVv63+
         sPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708673; x=1782313473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hkYA6Lo4Jj5Kkyg3hZREkEP+CcxyQv2PQdWFdmvQa4=;
        b=DqscpEQDAgkqd+9IEt7ljWI7kTwio+InD64Toyficiqpe3g2qkBslzImTNMfDYjGoq
         xlzxL9UReteay8cwX0/lJMlORZyU9Kk3RWbRGty3t9LYaZy9hwNHW8nAb3hNUpMjbKnS
         t/Ug3eHVRWjIWo6T137teIsz/lauJVgukf6P269Mix1cxbLaBbtQMp4iplFGupA3Zwlz
         kfiKHTrF2Ko2XJu+BIHohq1cZ/hyg8EP90ZrBKyHra+tSOVPTVK7eXuUlTmKN565+k4/
         sArHy0FmnMkEPJkylGZ9/NkpSsn/7XvabtDRTKGqqcdjVoHLRIDSNl3dVJ63nQ0OR2tu
         GQTg==
X-Forwarded-Encrypted: i=1; AFNElJ/ScVKIgfFwc5Lxa7tDu1DSzJRpFXWFUFzx19FLP1tmuBoZqDg4XApwxyDtaeZYrPxNGHeX12k6LuOf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpo8uQddKW1qd16Q/8Rt6u/uyy65qdn+ZYa+eU0GqkONPb2CoT
	MLJDSxVpieXBqUzecN4weqfeHU8DKdo0UHgV9xwB8AL9sCAii0cMB8/rR6sDGI6alVqCAdgMuIN
	BDnD3ajelua2tCoWZulLVxKqJCBBVnV8b+fQ2o+f5qI3nkQcFkWBF3JQpCtUZdYTghq9w+QhI
X-Gm-Gg: AfdE7cl7duO4gKAO6pfiRGXFSfs3uHSbQ/xVeCexDXEKJt7RQwVh5keIhKGQw+85oeA
	L94tcn5vCr4tBpK6yzbhrTXh3a1VhD6F9DIm7nQjY/zB80a8tNu7z9wxab2GkBmHSdYSyju8/Ws
	Yg1VfAiLGM3UKGQlnDVFNKkNimpBj7bXdRDr2RxLx+TqGFxrQPUJj7A+sVH/cJxfI/a85ap/Jrg
	CVUdTQBYxvOWxRu0QS/a7x+RIroCe3z94UVn+GdKidwIl/gTUSeRh7FguICB6pspOlsC2XxoFtk
	8yrKv0UnRB8p1ury5vFnTG3Xs0aY0YvVfqtLI6nIMJb/ftMAQ3Hy2vk+D4QFKSfcQrNTjZ0FMxt
	sThgz/3PFCMUju//W3SeU2yKTtGW1qHLSUUsb+7ryingK
X-Received: by 2002:a17:903:950:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c6bbf58b5emr43304765ad.4.1781708672765;
        Wed, 17 Jun 2026 08:04:32 -0700 (PDT)
X-Received: by 2002:a17:903:950:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c6bbf58b5emr43304025ad.4.1781708672073;
        Wed, 17 Jun 2026 08:04:32 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm227261845ad.25.2026.06.17.08.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 08:04:31 -0700 (PDT)
Message-ID: <023152ae-5a98-e19c-7803-0dbca7814ddd@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 20:34:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 10/16] media: iris: add minimal GET_PROPERTY
 implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-10-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-10-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zxuoLvKxokRD0MqmCBbPWLVAtdDCW971
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a32b781 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=LrD0L7TPytbPiIQqxktYyw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FHMilMr0S3awb_RgwQsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: zxuoLvKxokRD0MqmCBbPWLVAtdDCW971
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE0NCBTYWx0ZWRfX6WuCdZ5L2YXW
 vZZwzzIf+003RparLrGzVQ54LIcvoebXdLVKtebzDU774DdjSki4XFgtP+X0/U1XF1bzqeyN0Bk
 9ykxx6peJt5/0qRj/lqyOL6+819BTmAYpFJdNtXb8oL4EgFEclrPr5XlFEVvCFQ/Dc2sbUBlDap
 b0gDFJ6+3fl+tU4vH+xcq76FYWCmfjxRfxZNBs75vtC/bUkfSrs1fpgoIOjQJiOOmFye2Dv8eor
 NbH+jG4a1GOPDiAt1xeAD7cQdyhyNj0nmqxT+81L2GWcgIKzUPp/jrYmPSqRvjUlbqvvXLSuDe3
 9EsdZPGkOzw23HXCj6PFRBTnsZBdUh8aF0zxTV1vnvHrAETzbruj2Z738xHZnyZWcdnuHevUBxo
 Lu3X5rih7gLNhKSx0au/aPQnnQ+mG9wcmeo1ZLDa9m6ykeAefNnk83jNOxjNZ5DM9wTtCU97YIM
 FuLiHE3wqxZA5792PFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE0NCBTYWx0ZWRfX2rKNPG3BWVRJ
 jj1/KvPDAX8Tg+G+FXNkkpBlgt57sasNuzbyCJcVTv+PAHabpod9vHxqjIsk+1j0jYGApOj1DMj
 6iOAJbRHHI5QMGEgGzT2UfajKf/y/Xw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170144


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> AR50Lt with the Gen1 firmware requires host to read
> HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwise it doesn't
> update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
> command. Implement minimal support for querying the properties from the
> firmware.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
>  4 files changed, 43 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index a27447eb2519..16099f9a25b6 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
>  	int (*session_set_property)(struct iris_inst *inst,
>  				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
>  				    void *payload, u32 payload_size);
> +	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
>  	int (*session_open)(struct iris_inst *inst);
>  	int (*session_start)(struct iris_inst *inst, u32 plane);
>  	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 7674b47ad6c4..99e82e5510ab 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -1117,10 +1117,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
>  	return 0;
>  }
>  
> +static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
> +{
> +	struct hfi_session_get_property_pkt pkt;
> +	int ret;
> +
> +	pkt.shdr.hdr.size = sizeof(pkt);
> +	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
> +	pkt.shdr.session_id = inst->session_id;
> +	pkt.num_properties = 1;
> +	pkt.data = packet_type;
> +
> +	reinit_completion(&inst->completion);
> +
> +	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
> +	if (ret)
> +		return ret;
> +
> +	return iris_wait_for_session_response(inst, false);
> +}
> +
>  static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
>  	.session_open = iris_hfi_gen1_session_open,
>  	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
>  	.session_set_property = iris_hfi_gen1_session_set_property,
> +	.session_get_property = iris_hfi_gen1_session_get_property,
>  	.session_start = iris_hfi_gen1_session_start,
>  	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
>  	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 0e4dee192384..bb495a1d2623 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -35,6 +35,7 @@
>  #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
>  #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
>  #define HFI_CMD_SESSION_FLUSH				0x211008
> +#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
>  #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
>  #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
>  #define HFI_CMD_SESSION_CONTINUE			0x21100d
> @@ -113,6 +114,7 @@
>  #define HFI_MSG_SESSION_FLUSH				0x221006
>  #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
>  #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
> +#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
>  #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
>  #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
>  
> @@ -205,6 +207,12 @@ struct hfi_session_set_property_pkt {
>  	u32 data[];
>  };
>  
> +struct hfi_session_get_property_pkt {
> +	struct hfi_session_hdr_pkt shdr;
> +	u32 num_properties;
> +	u32 data;
> +};
> +
>  struct hfi_sys_pc_prep_pkt {
>  	struct hfi_pkt_hdr hdr;
>  };
> @@ -574,6 +582,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
>  	u32 data[];
>  };
>  
> +struct hfi_msg_session_property_info_pkt {
> +	struct hfi_session_hdr_pkt shdr;
> +	u32 num_properties;
> +	u32 property;
> +	u8 data[];
> +};
> +
>  struct hfi_msg_session_release_buffers_done_pkt {
>  	struct hfi_msg_session_hdr_pkt shdr;
>  	u32 num_buffers;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index bfd7495bf44f..23fc7194b1e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
>  	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
>  	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
>  	},
> +	{
> +	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
> +	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
> +	},
>  };
>  
>  static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
> @@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  			iris_hfi_gen1_session_etb_done(inst, hdr);
>  		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
>  			iris_hfi_gen1_session_ftb_done(inst, hdr);
> +		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
> +			complete(&inst->completion);
>  		} else {
>  			struct hfi_msg_session_hdr_pkt *shdr;
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

