Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10D03B0AFB
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578924; cv=none; b=Dpp6hsSdTKMKBx3uP8N5WHsbKjp/j/Q0Wbx+T4flyNS92HCQ1s8zd8lHvG+KlH9PENUyFDqvJFK7yq9mQSnk5DBw5bm2CHXE0S6SKPZzsczOrNaqehhz03VgJy9SKnDjNRaJDyx3YmlOxCyyavmBvSGyhpp6ilwNuASk3NVHQ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578924; c=relaxed/simple;
	bh=R1v4ESg4zs5cpKbWsrIGjrYbBgdH0so8Apl4Tz5gbeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNiBsZFHZnmxPxn0Z/uVN59Df7InWHjX9P7LkG/Ap4XpOaCRGTUrb4B1BJstFlZ28IVpDb7uF+29rQhYzL/7+/Xo6kTovrao9TaGz5IcR343BQOY8rpwWGNvZgx27ZTzZmKRByHZpmHGA1PBaipn25ONFcRPv81UdKwVsMkUE+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIoZTLVo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIh8pzs7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIoZTLVo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIh8pzs7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DIBpH3402359
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 16:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZ30nZnkzUWmAjcLPNF6a6T9pjqKEFiBBlMT7XZwp7w=; b=eIoZTLVoLPSr81cL
	+q44q76Z5BMyMlSlCQwEP1duZsFwM8VAC0Mb7n+h72ob+p65xFEZkR3CyTAKZVjp
	G/cZKD5IIqEGFEWUThJrpO0fjqVfPD+VaRO0Z/5ZCTaw7jLGO1zFAy4dKK75GeQ4
	oWvIAjg4tEjRbi+eGshrJGlStCcDo2jOHNlb15Yn51ajeCSC/lsDle84mjWZ+vtS
	tlRN+gnj4B2V2JNnjRdQODomiesbYAU2JRxZFqf0ApL6Gd/0GJg7Z3AJUrbka8Hj
	iF4NecsHQKCMYNGJYT2Ctz2aJT/4JTq8tT6M5GlKJQqeaI6K/NwOdTLsRxm6rVTG
	TPjOFg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhuk2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 16:22:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bce224720d8so2538485a12.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578921; x=1776183721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZ30nZnkzUWmAjcLPNF6a6T9pjqKEFiBBlMT7XZwp7w=;
        b=EIh8pzs760y56jypUICsRyDEWc1OXdQuB5KhCHNhGS8pO17uaHfbw3DxirT4IJ5Ibe
         JZ5i442Qw7OOtt/Urm3HJIz2UDym9WZtt+8sCef4DgO12vUvTRVqC/AYgIJY3BVfLLQ2
         cphHT5VL5EUbB/e8oE/K57q5NZAPi52UFoa2Dgt0f9bbNU9dbC5mSvyz8OX4PUa6j9NQ
         vsVVWEBZ3BUHvu5bdxJvxaFMbrKNxmZggmnOL2R5/8ziIrytfddN18BSdNRXHN35ny+R
         RDQ4i17xQJJEmTW79JjfAUBfnyAHAnHQo8BIwTKljjY3nlcMDABedp6f0Ffe8y9Z99FY
         mKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578921; x=1776183721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZ30nZnkzUWmAjcLPNF6a6T9pjqKEFiBBlMT7XZwp7w=;
        b=Tkx7S7+VlSoUVQpt58RyUtdXIgPiOHHH46WYbpWmg932jM58+ewv5Sunlh01PpLQAI
         4MuExOG3TSpxXECHdOi1CBX8hwUPOSp6NVJVyug4nzSWbSXW3CFPV5YUupLu1JgdlEo4
         I5RQpgkml+yr/82OiUX6NQI2tl3m1Am8ifh+ZclSvmoDTum9bBbab+oR7QdI8ee1bVkV
         hLCJ1QYdv7ufhIhbYLQOtvIpzEsknpopWWy15q5EXpxmcxHt33pJfZFxtx3ggPfP1iut
         PIS7UllxUvSXRtwkrPKwgHF+C4hEo/8LAm6Dp56sXBx5MG2EDRdvDlhzkTH1tJobkxAx
         4ycg==
X-Forwarded-Encrypted: i=1; AJvYcCWesIQLQWWPrNyvhaSLmARqmIFA60O+Sr/NzjKlXganmzcsErWE0ufMREyi2IJXNkjJqNwwJLd7Wrus@vger.kernel.org
X-Gm-Message-State: AOJu0YyIUP/1VazWROm8UlcFK6VBHmiuX17bqcR5EWGmRH8Op+pGnjPt
	OrT2xmJs+OeHKpUB62Dft9X9xRrOpaPaO2mMy0M6dX3EEjr/Am7nC1wYBWtkF8JTbnaer6cw1/M
	CqHcpikjgARmVENa6J/gqh5ghgIDeg8LoS5ffDZ0Z38P/eSc7kLaeeUFlsCsc0pXt
X-Gm-Gg: AeBDievYLOuTlkvyC/pFX5LHFut/nvwfAeLh3dkW0PBroJV7urYiDfYKum2Qv860Br7
	MfHNgyoy7RYZBog5l/UphM1ioIkkJbak0sy4UlX2Fnp5TcK0uMm1McKW2zyafErFDzmRvllbatG
	8h9NGJv8adDiF8cY3jcK+1AtQgkSBdEn5roc4qdgM/2VNmY/LVxBQmo3qbZjvz4vsht5tPlr8Vd
	OTMF9Cco8bFp2+JgiVH3nrrMe1MP66Xy/ALRE7XbVwWCaTzpjcnZr6fehsqJWhC1urGFkI65J/v
	OyHjZqRN/P+N2y2Ah0/0UbuQKPJb+E/4KSv3c6PwMYPE3/jVXZQpD/jH3B8wpC8nxs6mICNSOin
	znFGZejFXiz1M/xjHPKdFsrWZF/dnmxV/2Q+zrFLrhFtBBbYmBuc2T2kbN24cxb1NrA==
X-Received: by 2002:a05:6a00:13a8:b0:82c:d5be:d28a with SMTP id d2e1a72fcca58-82d0db6ac92mr16146587b3a.31.1775578920681;
        Tue, 07 Apr 2026 09:22:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a8:b0:82c:d5be:d28a with SMTP id d2e1a72fcca58-82d0db6ac92mr16146545b3a.31.1775578919884;
        Tue, 07 Apr 2026 09:21:59 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c3d439sm19025087b3a.35.2026.04.07.09.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 09:21:59 -0700 (PDT)
Message-ID: <ffce1c33-d8e3-412c-b681-a980b405aa42@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 21:51:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 3/6] wifi: ath12k: add ath12k_hw_version_map
 entry for IPQ5424
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
 <20260407-ath12k-ipq5424-v5-3-8e96aa660ec4@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-3-8e96aa660ec4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NyBTYWx0ZWRfX0S0XigyOxXr7
 xEpMJQQP2HDoWoH00aSy7UIUWWc+L4JxGvadlWHjo7Z0o//TtSOr0nwROM8UDUWAaVIGz8QXfAD
 SvNqgY6Wkhq5Ym4b9Wo08Y3OS8LQ3zqdiq6bdMYADfikO1du8TIIaFy9G7R1MSWYp8HtIJQ9epS
 a+Bplss6Sn7uiY3528M9pqUT6itJH2Kw6nptdyqBFYjm1JcCyX07yx06oUL3PT8t2FOXh9qqryD
 +coyZLOGGts/FuIjcfafcUH0eqwdQ7srUQxbCQZg+957L8qsfoW7QaSv+INETQcyJYiBUGT4dhm
 V67M7xVEO+YmMCeD8FQdkbFmpVGIawyKAX12ys5pu91k2TXaRczmEqOE97J8cgJQTC5PPkgxPaX
 tPGRaZmw4dtvdAs4oJVNdYmkubicmxFAHNhv1oicoPw4py8Edkv0TKc4f1lfZmjqt3iMS/rRGyD
 1q9NcSOx3CEvzROtkcw==
X-Proofpoint-GUID: 7stZbG_3CTwBz3Q4mqITMNUdyBVSK3XQ
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d52f29 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AiuA0lUDFxK_Uw9U_U0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 7stZbG_3CTwBz3Q4mqITMNUdyBVSK3XQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070147



On 4/7/2026 10:56 AM, Raj Kumar Bhagat wrote:
> Add a new ath12k_hw_version_map entry for the AHB based WiFi 7 device
> IPQ5424.
> 
> Reuse most of the ath12k_hw_version_map fields such as hal_ops,
> hal_desc_sz, tcl_to_wbm_rbm_map, and hal_params from IPQ5332. The
> register addresses differ on IPQ5424, hence set hw_regs temporarily
> to NULL and populated it in a subsequent patch.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/wifi7/hal.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
> index bd1753ca0db6..c2cc99a83f09 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
> @@ -50,6 +50,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
>   		.hal_params = &ath12k_hw_hal_params_wcn7850,
>   		.hw_regs = &qcc2072_regs,
>   	},
> +	[ATH12K_HW_IPQ5424_HW10] = {
> +		.hal_ops = &hal_qcn9274_ops,
> +		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
> +		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
> +		.hal_params = &ath12k_hw_hal_params_ipq5332,
> +		.hw_regs = NULL,
> +	},
>   };
>   
>   int ath12k_wifi7_hal_init(struct ath12k_base *ab)
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
