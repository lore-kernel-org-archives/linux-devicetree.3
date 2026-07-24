Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4970361977
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883194; cv=none; b=uP5JDlFkZy+o0vsVb45GnMxrshFOBb9NdaAteR/lyb8M03hxWQjA0LShu3Y9BrDZZEjYh+tL6+LI9vFwtfyWDu74BX6m3Gp432uBkU06uNiqArr7USok/LYNqiHBnZpeq80GNKX6NLe5QqB4aJALzVMQXsvLGrvdTF7fB3WJD1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883194; c=relaxed/simple;
	bh=iNh1XCLDrmQm4DSIiCjf34/78IrKNQAGBZv7+o5Yrsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWzLPvtNktonjLmw15nhB3r2ag9jK8MkmSpY2WHw9OtFq2toM4AVcQxt9KiP2n2X4/8w2fYVw4k2HxDPAI6k/A0C6ytmcs6v+hRywDd6C8j2BQxBH1ujPEDunFKf05QWxM+gtN+sSBI7BXQrEFCeSSnhhVt02owGKEQ2ewDSW7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BWryMePA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV5W0LTa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BWryMePA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AV5W0LTa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lDeH2137571
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yjdr9lk8K5g17oPrksmiVOVDbA/cHMz1YIR9k2vyLs=; b=BWryMePANinvFrSk
	2WOaSdL8Ya1rAZbrAw3AFxhRQSwi2Un1EycL9un3EreN5M40fcrtXAdMFO8+Ozav
	2xenhDjKVlCI/bo6eQntvwQZESbMm/ZktTp1GHAezWpARwysafWs3848Je/OC7Op
	5rWzU2joC2/ecW5wbzFInbbvm721ACkhVvgUtU6sMMJgaxtKWak2Cd4xz7oi6djg
	W2gjvlDw0TjvCj7pdfxQkSS82c3p9R5TxZfY8/CgPBs1Kxgx24kt0Nqpj+QmSLh+
	e+8WHbbLeH5kZJPUtbiKxUn0yb4fgeaouz83XzI9MiXe01z3cYegbv4XlC6xwnyp
	IMPYzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1aytm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:53:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so2538351cf.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883190; x=1785487990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yjdr9lk8K5g17oPrksmiVOVDbA/cHMz1YIR9k2vyLs=;
        b=AV5W0LTaYb35IRwo2Hn1F+8TcxjkvXw4yXz611WXFk7e1yjciiTHlwPvQ50domflRb
         z5zgCfN7787RiTgB71HevWHDeJGUCN9Ou6kXJXcrJ97uoEmTqTwH5GQ0sZLi3BD6k7Pz
         JCH0Zv/JzSxgI8SuqqOYgMHhfpZvC6TagbN4SZxUyhOg5K+jJSwxM2jvY+6HWxrlZVw0
         /053uIxjFpKz2kZqlmPpdxtVjDf1av7t4b/getKnfzrxRnV8jBD3dXSEQ21AYoFt1eMU
         CgHmpiwshaZTvooCE1kPj0A4ibrB3oLdPKquyLvDsQaGXJcsvPKM+T6TKBcRzKpd/Sp3
         skzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883190; x=1785487990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yjdr9lk8K5g17oPrksmiVOVDbA/cHMz1YIR9k2vyLs=;
        b=Jihka9d5GD7EpN3vfGMfNGiSD2Y9+xGYaqmQC0MEloKoABnZGJdaAGBzdDCVTy+LH7
         pnt0Kedu7ar35Ib4fMsmKYewInLp+ODN1nHqO5ktJ+vuUVsxtoZoxpbXnn4w0+IP7b+a
         80Z/o2URgqYjVjA88Z1elSSZ1b/0QejvpdPmP/LD9GJWvMAt0aYixDFC0sEOtlOgjL1a
         85kvCUNFJc9DmU5CZ3oFyVD07n2xmm+MhHXgjQMvEGJIMLEQIn81wRsoLIm015s7ogtX
         xsRsDXJdz6lKbFsL9RAzLt48jzvY45shqImJwZ7ce5IKEAvzBJ9UsXJhJjW/Mgvfx/qJ
         oFVw==
X-Forwarded-Encrypted: i=1; AHgh+RreYVNRhSUjnOGQGHFxtzrFTqOMxe1W+0fgs+YeCETP/PNwCPOvD+UWbCMv7DXhY8zpzGh0AO6NVLvb@vger.kernel.org
X-Gm-Message-State: AOJu0YzUCd9pQ1qgeTFG9v4MbtzoHfdKpPvukKeiOQx2gbs8YG4ufN7W
	njhoMFwhTBhSHm7oKKUilaX8rO8K1JivbgegSDEMqwCTl5wN7pyQoqaAMbnp2H3BFpF1e4VsE8H
	RypFpUzmMJJrX9X4h3b806Xux460RLtMNyp1hqbVWjaYKf4EaH5wBrqQHTn+yZqPSs97DKOQN
X-Gm-Gg: AR+sD13iDoAn0FSusJQi7ngzD6wAOPJkDnju+3AP99mHQAf7SDtweAxePXO7owh54hg
	OS33EqbbX3X6o8xf+wbqXCvWZ+TVBpdiEcJlDSG0pynUDgteICYuTLNOpmDkeDWjlvwtjaJDJHa
	7dXOxGe9PkaMqY2obCdli4FdphCp6C9tnCXvqGD8LJmmnSPa6gzrGInOFd1KunwXxz0VexEeiT7
	JfwMcNZqjr5XD2/BnVy9OVaZWcUACh836GUIDqB3QUdDsOAEuZS5Y+uWaT9d53TzK60rti2WqDq
	zSMuNqChgEe39X0Bxt79cIEBg9n/FRjM3Vktf0Cuf8OIPVF3l7YIdlsoZzj6mPE/FFCygB6LOHK
	r7tMBQkaWT6VL5qNFui4mdu139Hk=
X-Received: by 2002:a05:622a:588c:b0:51c:7b12:6000 with SMTP id d75a77b69052e-5283dfdfa20mr57309291cf.76.1784883190192;
        Fri, 24 Jul 2026 01:53:10 -0700 (PDT)
X-Received: by 2002:a05:622a:588c:b0:51c:7b12:6000 with SMTP id d75a77b69052e-5283dfdfa20mr57309131cf.76.1784883189715;
        Fri, 24 Jul 2026 01:53:09 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85c52fc0sm22315058f8f.23.2026.07.24.01.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:53:08 -0700 (PDT)
Message-ID: <edcb955d-92d5-4506-afe4-270f7814d23e@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:53:06 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] ASoC: qcom: q6prm: add support for LPASS LPR
 resource voting
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
 <20260722120217.3609506-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260722120217.3609506-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bq9mLyPcoHhSut9Vqd5WM6rDUlfSTjiZ
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a6327f7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9brZCF5o_kxjRrlj0w4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3OSBTYWx0ZWRfXxU5fCi6MURQO
 8l/OXIgYFnes3nWS98Ayo7cnr7rdPMcXOw4TwOLEBWS0JxBSoWCWcyaFz6eJf8C3Wwldm09Zs4D
 0J5Vj4TciKA+dYOWBdXY0Ost3/NApXxfAYiOamUGx+hXq5WB96UfehCDO0fz+Yfd3qZSjlUm7Xu
 SfhCvh2+30P8rb8IkksBtw9k7GfNFhvbIhfPvH0AgrhN+kI5X5tFi/4xKqXb45VgldeV2qweLT/
 uNmjS7Y9cls4XODQ5f6yDKRcIpamL+tDLCT7sx4tHd87jMfj8r/bLg/6iJt03ePSU+kLkgEybyD
 iqU3c4QIFhw/OrMgDVhgkuYKF9OPs4xviEnnKEnfamb/FCk6vbPYG0/pVWSJY8WMmNy2U9k8Qxe
 1G3v4Bv4XTRnnFmACbeeznZZbFvhs0L0l15wttgYgnyv8BJ0GuPKEwwvyHfTf7q2jq91DT6Fezf
 h0Tz+LzqdzXnE3gzERg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3OSBTYWx0ZWRfX7FoeGpdSdux/
 4gSz1GNB5bvVbVEPUzi4+iHxLLbH35cw39KsGAGJDX2LSe8QV//FPs/6QZvdyw880Z3u0YJcCvN
 2Rrk4cj9qcid6h9FrIS6Qu7fnWVkMzg=
X-Proofpoint-GUID: bq9mLyPcoHhSut9Vqd5WM6rDUlfSTjiZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240079

On 7/22/26 1:02 PM, Prasad Kumpatla wrote:
> Add support for issuing LPASS low-power resource (LPR) votes through
> the PRM interface.
> 
> Some platforms (e.g. Hawi) require the LPASS to be kept active via LPR
> resource voting instead of the existing hardware core vote mechanism.
> Handle this by introducing support for PARAM_ID_RSC_CPU_LPR when the
> LPR vote clock ID is requested.
> 
> For LPR requests, use the appropriate parameter ID and payload format
> to disable CPU subsystem sleep, ensuring that the LPASS register space
> remains accessible.
> 
> Also add the corresponding clock mapping for LPASS_HW_LPR_VOTE and
> update Q6DSP_MAX_CLK_ID to 105 to keep the q6dsp clock ID range
> consistent with the dt-bindings.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  2 +-
>  sound/soc/qcom/qdsp6/q6prm-clocks.c       |  2 ++
>  sound/soc/qcom/qdsp6/q6prm.c              | 16 +++++++++++++---
>  sound/soc/qcom/qdsp6/q6prm.h              |  1 +
>  4 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> index 03838582a..ab7d20580 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> @@ -12,7 +12,7 @@
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "q6dsp-lpass-clocks.h"
>  
> -#define Q6DSP_MAX_CLK_ID			104
> +#define Q6DSP_MAX_CLK_ID			105

This change does not belong to this patch, please add a new one for this
change.


other than that LPR changes looks good to me.

Once MAX is removed from this patch you can add

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
>  
>  
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48a..2b2b3872e 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -63,6 +63,8 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  		       "LPASS_HW_MACRO"),
>  	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
>  		       "LPASS_HW_DCODEC"),
> +	Q6DSP_VOTE_CLK(LPASS_HW_LPR_VOTE, Q6PRM_HW_LPR_VOTE,
> +		       "LPASS_HW_LPR_VOTE"),
>  };
>  
>  static const struct q6dsp_clk_desc q6dsp_clk_q6prm __maybe_unused = {
> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 04892fb44..1f3ce4cc0 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -31,10 +31,16 @@ struct q6prm {
>  #define PARAM_ID_RSC_HW_CORE		0x08001032
>  #define PARAM_ID_RSC_LPASS_CORE		0x0800102B
>  #define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
> +#define PARAM_ID_RSC_CPU_LPR		0x08001A6E
> +
> +#define LPR_CPU_SS_SLEEP_DISABLE	0x1
>  
>  struct prm_cmd_request_hw_core {
>  	struct apm_module_param_data param_data;
> -	uint32_t hw_clk_id;
> +	union {
> +		u32 hw_clk_id;
> +		u32 lpr_state;
> +	};
>  } __packed;
>  
>  struct prm_cmd_request_rsc {
> @@ -62,6 +68,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>  	struct prm_cmd_request_hw_core *req;
>  	gpr_device_t *gdev = prm->gdev;
>  	uint32_t opcode, rsp_opcode;
> +	bool lpr_req = (hw_block_id == Q6PRM_HW_LPR_VOTE);
>  
>  	if (enable) {
>  		opcode = PRM_CMD_REQUEST_HW_RSC;
> @@ -82,10 +89,13 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>  
>  	param_data->module_instance_id = GPR_PRM_MODULE_IID;
>  	param_data->error_code = 0;
> -	param_data->param_id = PARAM_ID_RSC_HW_CORE;
> +	param_data->param_id = lpr_req ? PARAM_ID_RSC_CPU_LPR : PARAM_ID_RSC_HW_CORE;
>  	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
>  
> -	req->hw_clk_id = hw_block_id;
> +	if (lpr_req)
> +		req->lpr_state = LPR_CPU_SS_SLEEP_DISABLE;
> +	else
> +		req->hw_clk_id = hw_block_id;
>  
>  	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
>  }
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index a988a3208..bd5ee0c40 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -87,6 +87,7 @@
>  #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
>  #define Q6PRM_HW_CORE_ID_LPASS		1
>  #define Q6PRM_HW_CORE_ID_DCODEC		2
> +#define Q6PRM_HW_LPR_VOTE		3
>  
>  int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr,
>  			  int clk_root, unsigned int freq);

