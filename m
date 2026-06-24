Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E38138C421
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288448; cv=none; b=j9aokpnQD7QmYWgZSnz27ncy48v670Zswkdl1DAygSuOzqxaX5XWNSco0s2+hUhxguYY0dtdH67N1TN1WW0VUML/b86xdvBA7tt/XIOU2YYdcjsGaPRpzGvFOD4LN4968OQ0yGV49TlSq5f8guFw5zl39Fk8bus7T57wvVTbcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288448; c=relaxed/simple;
	bh=PnD90Rj22MBwRbRUAu3UlZZ9ydO1vRNXFYqA0O2T3kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fiASqpVSZ6K5da/Hf3HJBhYxlABwoYZcmzT/RuQq35+LwbCY57UdZ89U9hT8RYqVMT6vrMU05OS5QcqXQU2kYv4MnKZTV7UCPn/27aPvMkhhLNzwCoGHZVPEc2+AisvxYLZTIgJx2fzz+qnmVJrbYZIfsV8mrqNP5IOQrZISbq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mzxr6tyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRrlnvtW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mzxr6tyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRrlnvtW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5txtW2237368
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FzVY8788rMGJlMr4B4yxqA305gNDuOqkYty6vubBhc=; b=Mzxr6tyI+nm9jMdS
	3SlZD3nLXPb775ui0RTNe80TcJJdy+gu4KmQ2g6Sq4CECQa2awmDbBvZjyHynqNB
	qCZy2XGQ88MuLNadRo2vlMYyXcAJ1zd1B6aGBBH5+fGGxbDjxFbIO11hLgPcSAS3
	AcS8J9Jo3wEGSTe9ONQJayFYMszbkt4vUBhLOBcN65xRQbHh9r8/JPI986L9p8cS
	8na+MBC30ydvwIde1lmQ11x7zzQv6WPwtG7MF0O0otAmXcm7UnuNnOhjjS26P/Fw
	DEZd3qSlcDv125wqgA6kCZb24klq6dPWkjghV6EHEFQPOwofl3h6EdrD7XcMn9he
	gJa1LQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p25a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:07:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9205e6b0bcaso98647085a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 01:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782288444; x=1782893244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FzVY8788rMGJlMr4B4yxqA305gNDuOqkYty6vubBhc=;
        b=fRrlnvtWRnNrQtAkKOcmCvZvmDhqOyZLFoQizKUoWDmeXmjWV7unfkOPg48gDk1r98
         1/5hT/2druBKPc4vmHyMUOFJf979JHZ08yVY938oIiDPHASDigXDFRrGf0cdzNqPO3Rb
         7pH5YowaPLuWn+1QdRX8Jfq//KG8MPUpItXNpM3P7qxazQWnu3OGXJM3Gcd9OTGE/jrO
         rwWzT9nDBiMNDAJokHVLm19pfGz7VSdVvNJNrz07zdtWgQfOtEggJYn638DhzZjXX5g4
         EPNf6lycGl/rL0L8yp0NvuktTMzhCqM0c2/y/nejmB6xydSYQmiUc5Yphv6RuwGmwrGL
         z8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288444; x=1782893244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FzVY8788rMGJlMr4B4yxqA305gNDuOqkYty6vubBhc=;
        b=qF0dV4k3Fo6DdXntCmUQotLBgHztIzTTmgyCVHC/HOic/uqebwd91zvkmp0/0Y/kVP
         PCZ+kjGjo0hFNvTYlHS37XD3tX9gmWYAlkTxs3AnMweIfBmRWzj3ZqXKDDjS8dLtfqyj
         68u8dTlHMHspNBtYc9k5aQU9JOmPAM6cW2r1TV+4Sbo9Sz7gMP+ipzMhztcXVAHum3iv
         HTiGWzoNDzI6MvnikISt6C4TVlYWAWVGYQ3vLrQG1x3YTJ6i+caY5Qbr7hRbpGyYMe2s
         x5vWGKajiJF6gdxFzvp54sC2xDFTEOhoK9JHijvx5mYoFX4OE5ju+j4eg+oXO4wX3i+h
         Q/iw==
X-Forwarded-Encrypted: i=1; AFNElJ/zrUlt+ohiuwFHEt3gXI9jAMT+IVJbccmplwhBaobggc58TtxG8PMaGZaPFVwRPSS9zyk/V73UGiH4@vger.kernel.org
X-Gm-Message-State: AOJu0YweP3MDT+WapCss4S4nSfkHaxXoGOcFHJOBBaFgwvcpwwRZOU1F
	nkh5EPRSooKdgBMM1JtLW68ZNZDNEzBt6WEQiVd9OCAackRJ2H3Hv1ZuQ5WGjwUIa0jXfF9eKiE
	GC0wdEZ+VIxht9XF6zVfowDNL+LtTmuiTnEHUC0GmvxSTN73RvnDwyjVSg78SPWPF
X-Gm-Gg: AfdE7cluxu8itYozqVlHxVtKevX1IEso2QAbyxmeObiC/JodTMNheD2m/smcxNZbqr5
	zxHr6c0IMyGGxffZ4JOMhSocvQPuH1WpjYMels8+49W6Eci4rs1wKLhZjk7VhFhCq854wUNhA/j
	7uUfOIwuFbEXBwiTHuqKP9+sc0ijR9NXO0DW+kN1/sUUXIrJx8zLt5rCNP4CJJM36xs7JSNpZxJ
	SgdLPCyL8EDcLLjeKLhuUR1XhBiQMdPidQZntbnBVquaG4H9wl/WBjZPsmzOKn5mmY0A3JfrqGM
	acKaYcNSUQ+xbSYKhtCDi/lKPX+cBU9vMmrxp+7+/TXm7wSOSPJgdDlRfDwc8rOeTL+bdsBQKM1
	zczVPoQXYPAh+aUk1Sv0xeEl5+fv63UwanhrB4zHE5Zrthw==
X-Received: by 2002:a05:620a:29d2:b0:915:c76f:26e0 with SMTP id af79cd13be357-9277e739cffmr388253385a.18.1782288443579;
        Wed, 24 Jun 2026 01:07:23 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:915:c76f:26e0 with SMTP id af79cd13be357-9277e739cffmr388248885a.18.1782288442983;
        Wed, 24 Jun 2026 01:07:22 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.204])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11f0ee8f68sm27650366b.56.2026.06.24.01.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:07:21 -0700 (PDT)
Message-ID: <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:37:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] media: iris: update buffer requirements based on
 received info
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2NiBTYWx0ZWRfX8sW5p0vK7GXe
 CeX6vXNJybfEvgiVCzjeTJSkMIBCmoJGEHS3JDEX4KWLkMtVu/pCZtVrYUeKE8dg7RuSCWPQYqV
 yp9YfFXgMnqENCg8A8DNg4DXDx+2VEk=
X-Proofpoint-ORIG-GUID: RHURjQD4sWdbvGBW77uUN1BuAedD9dFx
X-Proofpoint-GUID: RHURjQD4sWdbvGBW77uUN1BuAedD9dFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2NiBTYWx0ZWRfX/Imf0H3Z48Jf
 r346l8glfFHsriq6nB7VQhUO5wM3CJEY0Wa7ODb3tNM50ttW3nijnELR6107HqKs1mpI0EwOqKa
 Up2VupTiWHPiPTeItaLoXhxQ1oQCF6wE8UXuCgt3ckK98zdh6dzcJllYet/68PQ7a6aMoCjNK55
 KnYY6s0DQZydmccNU5ThJUQiZ9rnybhW9HDT4A1JkakfyC7lJlQIC1SDuDGpCQ7Ghrz2RgccOnR
 zTi6xZaVgtcc665HvcCmHUF8p0GBU8z9M7B0+PjAenGjODr55VSYCcG6pb162decxOk3ehKsPbQ
 HReLx3mvASJzAOwu0Ux/u2d5ohcZXopU4gSyI2R9HzJ/542RyD6JrTbE/MHA/qU6QSdYmv0rxLW
 Opu7ItJQCwm9NZD/y2Ry6AkvwmHMqQ==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3b903c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=9U17wRWtyhLDe7ZN7ogbJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QYZdmEBtecGxs_tjcH4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240066


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
> driver should update buffer sizes and counts from the received data.
> Implement corresponding functionality updating buffers data. This will
> be used for upcoming support of AR50Lt platforms with Gen1 firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
>   1 file changed, 74 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 23fc7194b1e3..896953ea62ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -533,6 +533,79 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>   	dev_err(core->dev, "error in ftb done\n");
>   }
>   
> +static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
> +{
> +	switch (type) {
> +	case HFI_BUFFER_INPUT:
> +		return BUF_INPUT;
> +	case HFI_BUFFER_OUTPUT:
> +		if (iris_split_mode_enabled(inst))
> +			return BUF_DPB;
> +		return BUF_OUTPUT;
> +	case HFI_BUFFER_OUTPUT2:
> +		if (iris_split_mode_enabled(inst))
> +			return BUF_OUTPUT;
> +		return BUF_DPB;
> +	case HFI_BUFFER_INTERNAL_PERSIST_1:
> +		return BUF_PERSIST;
> +	case HFI_BUFFER_INTERNAL_SCRATCH:
> +		return BUF_BIN;
> +	case HFI_BUFFER_INTERNAL_SCRATCH_1:
> +		return BUF_SCRATCH_1;
> +	case HFI_BUFFER_INTERNAL_SCRATCH_2:
> +		return BUF_SCRATCH_2;
> +	case HFI_BUFFER_INTERNAL_PERSIST:
> +		return BUF_ARP;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
> +						      void *data, size_t size)
> +{
> +	struct hfi_buffer_requirements *req;
> +
> +	if (!size || size % sizeof(*req))
> +		return;
> +
> +	for (req = data; size; size -= sizeof(*req), req++) {
> +		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
> +
> +		if (type == -EINVAL)
> +			continue;
> +
> +		/* on relevant platforms hold_count and min_count are swapped */
> +		inst->buffers[type].min_count = req->hold_count;
> +		inst->buffers[type].size = req->size;
> +
> +		if (type == BUF_OUTPUT)
> +			inst->fw_min_count = req->count_actual;
> +	}
> +}
> +
> +static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
> +{
> +	struct hfi_msg_session_property_info_pkt *pkt = packet;
> +
> +	if (!pkt->num_properties) {
> +		dev_err(inst->core->dev, "error, no properties\n");
> +		goto out;
> +	}
> +
> +	switch (pkt->property) {
> +	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:

If i check the venus message parsing logic, it loops through the packet 
till it hits the case. Here, we are assuming the first packet type, in 
the pkt to be the property "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS". 
There can be multiple properties in the packet, and if 
"HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS" is not the first one, the 
usecase would break with incorrect buffer sizes.

> +		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
> +							  pkt->shdr.hdr.size - sizeof(*pkt));
> +		break;
> +	default:
> +		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
> +	}
> +
> +out:
> +	complete(&inst->completion);
> +}
> +
>   struct iris_hfi_gen1_response_pkt_info {
>   	u32 pkt;
>   	u32 pkt_sz;
> @@ -657,7 +730,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>   		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
>   			iris_hfi_gen1_session_ftb_done(inst, hdr);
>   		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
> -			complete(&inst->completion);
> +			iris_hfi_gen1_session_property_info(inst, hdr);
>   		} else {
>   			struct hfi_msg_session_hdr_pkt *shdr;
>   
> 

Regards,
Vikash

