Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8700F3B47E0
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546425; cv=none; b=RkoKM/YHaZzRUxsm2KZFw4YbDkm7TonedPIB1jyqRnit25eU1ksjOWhDxLDi947y6/PgAAvzq+FiyhezZQojIp5ETdmzy3RT5UVSgr+BRu8PLqgM0CboKzrHn1LZv2vBq/VlyjRepssED1UdukAEuMoMgo6bH4BUVTCkWhER2Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546425; c=relaxed/simple;
	bh=kYdI5l4GBJqpYn6R+hCQX/thjSx8hd591kFqo8rU/Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jo7/ZBA8BcK2ccb8EBNc8upBmq35PAK2DAqopPfnNlGso3oJsXoGIAkLz062p2nGG1tz5FeDvcV/pSgA7uPM8LDHGfd+7TnwF70hVHmi0Bjjjf3EAFizYg25kMU5yIeusWNfHkPQkvyfrDo3S4p8gDsYE1xi1PrmeKDo2LwMsys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anWNTmEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nzp4Zo57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anWNTmEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nzp4Zo57"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UArDAl2907559
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvQoY5V0MZI8XGYTkLu2HUsdKc19JDiJ99j4fREKgB0=; b=anWNTmEuJ1B9AugJ
	Z0a6hWJFWmn8nIzaeD5P5rEXiS+JQhHdnlnwWtIOOh8BkmZcoJnWqgghu3nXguDy
	mXGMLDLCUZsVdNqWrpVcIYLxr+A/pXPfB7Rt52yUfv8uMXLPTNmf25qaEGb0dMMU
	Nijqiu86J8vMBcw/eCaZYrW/sibQj2Sl/JOX76S9oBvfjr7+sKOBgsXFWbYmk5f1
	3xgDmi0Lmz1RG1/K26tWl0e2lX40oqD8UnbQX+ZdQYU7R6QYYPBXasjNTm0WFGzY
	BQU26w+Tj6aa0l0rEtFjQ8ny38bx0U9MUObfiE48mTJ/W+7leD83AWIyT45zmjIO
	GbMfHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pf9e4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:53:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so8778925ad.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 03:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777546420; x=1778151220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvQoY5V0MZI8XGYTkLu2HUsdKc19JDiJ99j4fREKgB0=;
        b=Nzp4Zo578sWAv3nqvSrHU0s/2Kqa2B/eIKe11+MdBmZr3sQcWqHE6bF3998kzvDkSa
         Lyka2dmohbmgmENC5MaVoKBezVxrGqnivEnrQFnIfUbPbc16vINGAA61kdH0bQYBycDD
         uhsjmCaJKrkstYFW6PIHkEq+IX3ai4HBbWAPuAPVb8x4sxQdnNLbjbAjDr99Wf+37DJl
         Mz0LNyAOxXHmQ2NeYQhx0O63QKgkjgxTB428TxWh8wwC7HWKfDq697W7egYS92XAhakv
         uYc9NRoQ63su5m8lyiroGULMm8kqnkgGMAMnQL2ekuZcZJ6/sU5OgjMzmJch/+X6on0/
         7Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546420; x=1778151220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvQoY5V0MZI8XGYTkLu2HUsdKc19JDiJ99j4fREKgB0=;
        b=CIO5i0FcLaZorakTh6FQ9WXaTDjy6/KQdWQRvEKv1yYuohJHAC7OtVV1vh7E2x0/tb
         TP+CJl55DkqdyE5UByFMRlEfB+UNpeo73OI8OduzE6KpzOcR/hGCMAby9T0XS5bUhgg3
         /dvd7Dz6sj0siBTAsSqi44l+lcd+NghkvNTBdSZZH37GYN7UpMs9EX1vy4F9HcLZ13Dh
         um/nZMaqWOpKK5/v/3vIqmPpkAXFKBBN5CDHAln/kxfFpptwXLpG21Zot4DRzJ++P62r
         QQZCdhTmwPoY93PFKMna9l9QP1sRxd1pCt6nBIEHboEjwUyNYNBdoLghFrd3sY+WsZyI
         DC1g==
X-Forwarded-Encrypted: i=1; AFNElJ8uFf5MCJnUgHqT15zCeHmu1INlLQFjhK2VJT2wzBuQKGF4aNPkwFG8Tusf1zOS1GXMFLDCUJZTReZZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxazCM65QomcyI42fZyWbHJW1locW+a3WrhPs1MhYqeSmlXWNkQ
	2w8QWf72+32OTud0+7krq/Hj9Etrv57+F23/KYI1rQ63oZ7CIgd7cW81RvwY0RbiQBvXapAbBUS
	PBwB7gd763WljNNJV41emy/X3WsccT4/XsBnkUiJsL7ckKQFdiECma4kaNcz6XK7L
X-Gm-Gg: AeBDieuNa6q0aSFzGYA47aHuIRCMWyS/2vwe+SUyYKZKGDePoGBdzafnnB5xRcutfqK
	Pq9gPGjLTol/H9qSZdq/NpbN3srEUrKxtaCAqdMgS8+dnkZPiAqIGCmARW1H2D0H73/No5oN9A4
	GwpHZGku4l2XZJAeHL7nyMEyffh3jDCXfBYtosuVUjoKo347rArWoVMHfjz8BDkBK5a+tjIJgvu
	T2XQz/1xvHLVj1LFzzzdvp5mGUeS8j8ZoA6I0TE5mIeibZ5nHXLvjS0sE+GfRmPSrT6uN+3c5FV
	KOWQ2rCTg7f35pToHaJ9XSCLK++HQy+Ho3H2TMf7kJcBS9kNFyUlpT045dA2m++nMU+yEstRJhy
	EwZO46X5rCtmQNxJ3FV8nOHSk/SW8AfWPrGaArKb4O1CbZqVbTyXmNj6FAldOZe4=
X-Received: by 2002:a17:903:368c:b0:2b7:88f9:9c3d with SMTP id d9443c01a7336-2b9a232f847mr17204825ad.12.1777546419672;
        Thu, 30 Apr 2026 03:53:39 -0700 (PDT)
X-Received: by 2002:a17:903:368c:b0:2b7:88f9:9c3d with SMTP id d9443c01a7336-2b9a232f847mr17204605ad.12.1777546419204;
        Thu, 30 Apr 2026 03:53:39 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.229.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f3e2sm61448125ad.38.2026.04.30.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:53:38 -0700 (PDT)
Message-ID: <09969567-b791-2502-4028-46cae13db3d0@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:23:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 3/5] media: iris: Add platform data for X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
 <20260429-enable_iris_on_purwa-v5-3-438fa96da248@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-3-438fa96da248@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDExMCBTYWx0ZWRfX5+uZghPqFLJq
 /lfDmJrO9ZpuodzyETkk0UUSsq3wj/+UxipPo+k9wPdT5F1EBHp+vkzZncQutsqbLHXHaRh9qyE
 HCYg3emXrjyU54GBef6xmHJhOuzEpRylpCFHvQ7T2aZ885b0HVCmyMPPrXue1UkpJfqqRt1xDbq
 Wi4NDoyQG+sVa5zCH5lu4PvuiZqniodCZpPa4nAFy7fOBaFvca8xw/Cuc3Heqztz1pbSMpVacoo
 T+xUQITBH/eYhsfebXg2Z8LS4IPZJQMRIRj1ZQ3Ix/V+UztbN9lzoXn5c7W1cOiVvrcR1Yxsq+F
 dHBRArc9e4hmN1LITkOMHQU8VqSmFWaERP7IyW8vA/rNTQjuv9IwFrQ5dCfZjoJUYokD5wThOYC
 FNOnbCVs2gBekigm9BIb+/5ySmZhooHvWNOZ2BFnNYGKk3XqGNb78pOPVVazFHpoRWQ1IPCK4HK
 ryZzyhog4/GKCamRs9g==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f334b6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=sQGdqEwRzC/zEhaLYLcr+w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_kvchVDP8_-l7kQr3B0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ej5AvfT5rj_ufukFpqaOXoSf4AJGZoES
X-Proofpoint-GUID: ej5AvfT5rj_ufukFpqaOXoSf4AJGZoES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300110



On 4/29/2026 1:13 PM, Wangao Wang wrote:
> Introduce platform data for X1P42100, derived from SM8550 but using a
> different clock configuration and a dedicated OPP setup.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 97 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 +++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>  4 files changed, 124 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580eb10022fdcb52f7321a915e8b239d..2e97360ddcd56a4b61fb296782b0c914b6154784 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -47,6 +47,7 @@ extern const struct iris_platform_data sm8250_data;
>  extern const struct iris_platform_data sm8550_data;
>  extern const struct iris_platform_data sm8650_data;
>  extern const struct iris_platform_data sm8750_data;
> +extern const struct iris_platform_data x1p42100_data;
>  
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..e8b1b92a6329266d22b06e84c47c477d1a9d742e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -15,6 +15,7 @@
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> +#include "iris_platform_x1p42100.h"
>  
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
> @@ -1317,3 +1318,99 @@ const struct iris_platform_data qcs8300_data = {
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };

Add a comment to mention what is different from sm8550 data.

> +
> +const struct iris_platform_data x1p42100_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu3_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = x1p42100_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
> +	.opp_clk_tbl = x1p42100_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu30_p4.mbn",

is this the correct firmware? shouldn't it be vpu30_p1.mbn?

Thanks,
Dikshita
