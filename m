Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC143D7D83
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014996; cv=none; b=VSUd6PJeya+Rw5gU50Cjo+gW5a1CgG9D+h+Y4SpsaAcSmLUGcmmcU8oPV7nnMPqrY40fkxF1PLY2CoWLpZj8DyN1cRUnhhPeXqQIdWeXO3UMbGntGHo+XLa8oTAbqu+2AAlbNYwx/H4tEwk6xUgZlkn4TftkkcM1D7+UR3cAKmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014996; c=relaxed/simple;
	bh=ASm7RuamRsE7921xF54TZxFnknu/p8k+QeZ1rG7yBng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLkbb80bmQjq1QQUA1pMjdjXeKP4+WFdyHBFFsL/N7DiVIjdq6ZNii/bdtW37A/LpK5e/qqr5/BG5SjR2BhTvId6EnwerjXN7Mc5+Wjq2/vqfPYGcczUY3j6Ek1JLYb6/R8J0p0/Z6lfLCpN2eVjaU/Sfkj0ABc0Nu7BCWhrhas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDKoiQlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UO7hLtxp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDKoiQlb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UO7hLtxp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SSLp3743624
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZEe1lTtEISGDx3S00pQzENsnclmU1XHW06htfb8droM=; b=kDKoiQlbcmEDcvlN
	y6iznhjfq+DruJbYG7CW8WY25gafUkieWmXOp2LyL5TyfdaD4PU0S8jMYnC60hrd
	P2WHdaHgOQQpwk4zuuLRbVKygaPUwDtCuzEt4RBJj/d8Bez4QDDLRcfS9YcUoxnb
	5v7BHLTo6cXnQV8/IlwgSSzBMZyDTSB5PLHuVqdRl8K7+lV/S6xm9MKrWkm2L1Tm
	mX+F0Ex/N3E2Aq+hnaO0Brw8I6ydt/o+gQcHbe8e1mA6VKP8UrTtuzrzeQZW3z4s
	RXuA6Jd0pL86r/s46NPhyq45bdCXTUocFJ9Hh7xRnuJ7Gt78jqPG37Hg4lALSuRQ
	cb04+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2kja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:43:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso79011041cf.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784014993; x=1784619793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEe1lTtEISGDx3S00pQzENsnclmU1XHW06htfb8droM=;
        b=UO7hLtxpxybjgDpl0401mIeeZJJKssa3oNg9uvUje1gWzH1kQ6CEfmySzhqupAOq6/
         vz9WdEW8JJtCugp6EdMxn5Wdfe1w+SEGl6gn/8jkFYA8FfQ7IBfseLp3f5umFEkkoNQ0
         pHKZdeRwVT0GbCVTNldT8hmFyT8Bb01igs6OI3EAWvjzPS7ZISSDEWbhVujVf2zibBr0
         X7CcLBGvg28y4M/npc7UIlph6S6YvZaK91N6Khn1BkzRnaxA2mqcHiAkyeA1MDDy9eVR
         zLkNSkwTfAwdOkYSJ7HBIBTGeViBT3migWEs/gsZjD4cX/f4ViMNgkw1P7g2eRwy3QYZ
         XW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784014993; x=1784619793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEe1lTtEISGDx3S00pQzENsnclmU1XHW06htfb8droM=;
        b=gugyrfee4CLPY/vqwNQ/y3zeP6Mgaqce794uf5nu7NkO0m5X+j+A/egUCo4RDvQ6E4
         AkrnQSHvvmYv5tbELDouF7G4P9LBfxIGmQQSr+NJVoB7j4M3dap3vTUGizGsPPPk1Pko
         VUCRm9hErvZTqDhpyhNQicq/MnScuIIh35DlxWBd8eSx7IcTyfe1QxNwwTTbSJ7tLEDY
         pQhalJulx0Bw7MJfaeseIUmWciP8a7gPRhOZgNTcOpN0hLJciDhYss06dN+0BAEk/3WS
         8XRlQU1phqGNmbZw1lhT31M4vOXJQpzFrvFj8sXK/MzxAs8+y0UUQ2TYXXAuTAF/3R8T
         e2Ww==
X-Forwarded-Encrypted: i=1; AHgh+RpMZTM8MGZz2E1qZCRqAapPek8D7qzxMtVTkoKJL8KiG4Bzuhl2/PCb4L0VAHvFbE/LnpHnDYxMoWZ4@vger.kernel.org
X-Gm-Message-State: AOJu0YwgQIsvDgC8Xab4nHnmekaRjtri1Sc3Lvei9fH/nOrPIRyEsCCT
	hVurs3xy+6QaXdrmrBEP+dMMRudSSrt2p9p661aWtWKa4O2RBQBaaWZSFMusJjdK8FeAYrtl7cd
	QfPXJqzEVYFhvyShMgNmiegAtc/HiApG/VHRh3UElwUF8y8xAzfGQ56ZJtDt181Gc
X-Gm-Gg: AfdE7clUxzpq8Ay/6clFsZgwMHabYCeRnmDBoSTYkksTev6Z/Q8UViDOKSr4HfvB8pR
	N61HtksgBRHV0ovZUGXzW7elMNOPIZDVsurm4OGGzui3rmonMzLKk9BGVQakeBqzJnj51SBG2NS
	rCW7mOPHxZNYx9HR2QiFDqyTscmunwNef7gn8dmDJnENsXlc3WOZm/YTu7lu5qobDKuuNfC5gb9
	779HeKlGGk8ky3l3k+bSeQTOvMa5TQm1pxHHCEXmmagbHMfuBHtGz+X5lHV+CzT54QBgxkOua9W
	haqjCDCOOLp33egTL70xuaHtDAYv78IfemXWFWXFvX1qbPMbWRGx8myOcCfTvrZPlByHLkIFraj
	b6x1wRYk0TOyU3T7Px1xb6e3KRGfwgPyXD6J6CQ==
X-Received: by 2002:a05:622a:58c7:b0:51c:b98a:244b with SMTP id d75a77b69052e-51cbf2bba29mr116966081cf.62.1784014993026;
        Tue, 14 Jul 2026 00:43:13 -0700 (PDT)
X-Received: by 2002:a05:622a:58c7:b0:51c:b98a:244b with SMTP id d75a77b69052e-51cbf2bba29mr116965881cf.62.1784014992636;
        Tue, 14 Jul 2026 00:43:12 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f462e0cb2sm6038289f8f.0.2026.07.14.00.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:43:11 -0700 (PDT)
Message-ID: <046bb977-dad6-4bd0-b1c2-4321c58d3f27@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 08:43:10 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ASoC: qcom: q6prm: add support for LPASS LPR
 resource voting
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
 <20260713184549.929569-4-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260713184549.929569-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3OCBTYWx0ZWRfX5yQ8VsRSzjoP
 C+aC36WBOCBexksl/c9jNHQfAQWbd+pe7hRNunapX4x0sBMDY+NHgL6LLz5ZVatM+5a3aIkTmX0
 AzSF1VdToDf2Zgc/kj6BRgwXgnoJr2c=
X-Proofpoint-GUID: qbfglGW9S6oGnKC2fCXlAQ2i7t1I-Q2_
X-Proofpoint-ORIG-GUID: qbfglGW9S6oGnKC2fCXlAQ2i7t1I-Q2_
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55e892 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9brZCF5o_kxjRrlj0w4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3OCBTYWx0ZWRfX4tAiSyFYGhk/
 Q9JZA+rEQFyY+CAB934MbV+GpNfhMc/nAN6GEnAFEfK5iVFsXf5THO9ji10uRg1TC1LQJLrh4c5
 9d8pgjRh0JqkmXYmk/Ye16DxGOV7GgYDm2E1he6OFoeM6isMBWKtKkC4tcxXLes9bo9L7oIX06M
 PtmKF3S0CrtOqquvzup/n+lgrdny/tyNuGrDWDm4Nh4mCgHOauvAjxq58Z/MLbxdQW8hLyyS/3p
 1I7qSEcCpDuDFnDdkUrfDPB7B1wLO36hEWlwWq3qLUUdXG5zMWTL5La0i8pBWpv2c/9xDGz8BKp
 ak2PwPqbjMyBWxdZKl4YJopQu/1VrMlgDhPJFBOInCfnA6DE9rmJBrbisNcx70zRI5Smxxpe8Vl
 tqMom/I7oH7Mycle9fdCtuYrOVBa5RhTeoZZZ55g9onykbSKEB9EI5UEG3a5j1Z4r4qGMCrriDh
 wP4B5yuGEZTBG93z8ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140078

On 7/13/26 7:45 PM, Prasad Kumpatla wrote:
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
> Also add the corresponding clock mapping for LPASS_HW_LPR_VOTE and make
> the q6dsp clock ID range consistent with the dt-bindings by deriving
> it from Q6AFE_MAX_CLK_ID.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  2 +-
>  sound/soc/qcom/qdsp6/q6prm-clocks.c       |  2 ++
>  sound/soc/qcom/qdsp6/q6prm.c              | 17 +++++++++++++----
>  sound/soc/qcom/qdsp6/q6prm.h              |  1 +
>  4 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> index 03838582a..79527a367 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> @@ -12,7 +12,7 @@
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "q6dsp-lpass-clocks.h"
>  
> -#define Q6DSP_MAX_CLK_ID			104
> +#define Q6DSP_MAX_CLK_ID			Q6AFE_MAX_CLK_ID
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
> index 04892fb44..7a7a1d3d5 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -31,10 +31,16 @@ struct q6prm {
>  #define PARAM_ID_RSC_HW_CORE		0x08001032
>  #define PARAM_ID_RSC_LPASS_CORE		0x0800102B
>  #define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
> +#define PARAM_ID_RSC_CPU_LPR		0x08001A6E
> +
> +#define LPR_CPU_SS_SLEEP_DISABLED	0x1
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
> +		req->lpr_state = LPR_CPU_SS_SLEEP_DISABLED;

this does not make sense, this should be set based on enable flag, here
you are disabling the LPR for both enable and disable request.


> +	else
> +		req->hw_clk_id = hw_block_id;
>  
>  	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
>  }
> @@ -94,7 +104,6 @@ int q6prm_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
>  			     const char *client_name, uint32_t *client_handle)
>  {
>  	return q6prm_set_hw_core_req(dev, hw_block_id, true);
> -
unnecessary change.

>  }
>  EXPORT_SYMBOL_GPL(q6prm_vote_lpass_core_hw);
>  
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

