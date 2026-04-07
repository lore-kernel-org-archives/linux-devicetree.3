Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320DE3B38A1
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579019; cv=none; b=AwPXgdztqWtKh380yyTEMgWc7BqRtfaADnN3B8M6oO+wBZapVcQm4EQsBV8oWzobeFJBH9PBbNsjxI1CaqbWnjH8PKukqxKgZilwrraCxV1lsZV1RNOBZk2KXFnxUBamq6q9GoJh6L+cqj/P2izNuWIpcoqxDAZg7JFxHgLYcz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579019; c=relaxed/simple;
	bh=L60eVjl+lDg86S6kExry0yJcPktLDMV+jSg+o7VyCTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKtDxqAn2QuuWvIaE3292GXNCWUvJ4yGRoUVcRc9qMFo6pqMHQSiIwlth6r75KSzt3GMO3kidvWc9KfaB+rdVPswLZ+3xAYtAJXHTxaytGIB0g9ZbSVvlPXrMbMZezGsezpNCy4+kWf1toVg4uciH3IpGAZviwsAD7gRNt3yHx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIIXToDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4WBihFK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIIXToDT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4WBihFK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DIBun1584872
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 16:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkHr1XsREMAC/KqxSvd8f5vKp1/h2jijCG0gdIOkT/U=; b=mIIXToDTXG/SBwgu
	pT4TJOaFqxdm2IT5srDr7iLf0n1O05WyoFrUCtTu4ZOPIHPSqHLVf/iCzHs4AEj4
	S3omEEik9hheiiNW3RTKRwueafQhHVKG8bObtRoYYbz2u8+Z9gZzXAERJLWobRmT
	NCVyyCNaTgrPqZslXQMwOFLR5F1uFH75tOoro4IuhreuEYpUPsD7iR+sJKFZNUdc
	+x0Jl6lz7wsKPFoP0EGoIYrmNVfI9/iXq5VSJl2Ovd0MilusaMJo36feFFRzxU2u
	3Zbyacu/U+KFc0Vs96bx407yDJoCd2SPCZuF5rldOfSyD4aPUA9yBdNwGVH78LdT
	H2tP0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9umad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 16:23:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b241be0126so141051605ad.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775579016; x=1776183816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkHr1XsREMAC/KqxSvd8f5vKp1/h2jijCG0gdIOkT/U=;
        b=S4WBihFKoG3+mON5DLFuhI7s+lhNJTVu0OCW8zk2r4BAwbr9cBiUpp9/DSH2wz2EKP
         u9KOg8DU6npertEIRoBNp/flyeZH0o9o22AIIyT7kW3HuxbZQpz++gI2O8i37+Ax09kr
         XJ38kfzSXqXFqNLOKAUb4pEzMZ6GfCXgVcOXSgD4yMmO7rh7KartAfgp7HY8ymBZ0q5C
         1XGhnBasBWcGne15N0oMXZLejHH6JU42VNQ/r87/KGxT5NliRU0R6lhsWdh3C9VIPMSj
         XXgfAhZ7i88Tmyk048oZ4WnRmwQE130IWSBK30r2hv0sIORLsScCehaxZJMcmSUDk17w
         BNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775579016; x=1776183816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkHr1XsREMAC/KqxSvd8f5vKp1/h2jijCG0gdIOkT/U=;
        b=OrUSsxqRqOhK9Dej/SeW5VWF4/g5lKkMJC0RrtGS/UM7iCJq/E43EMwIsBoxu0uTK9
         wApcmwwm79qyD/zrhjFkN3G1+Q4ziQ8DheM/cjESoCSaB6X3ydjfLKC3W+mW79rSCkeM
         lbUB0ecMYibRgTHTFTIdJh//51iwnjskftzR2UAHpXogSOna7c0Rk9wc6nIMDejDgQ/X
         Ow7UcKJj6bTD24K4/NB70JOSZDOAtY1rhoCk4XKZWkiLD+ipTohSTvjYF1jGLSyWUkr4
         ZfyYQ017MM/qgJ/Fzl2RBvBRzkbSAkNV0Xj+rb6gappA6CYHqlhDWRJntpbUOd+Loyn3
         hQ+g==
X-Forwarded-Encrypted: i=1; AJvYcCXo3MxzAn1z6HFCrsetnPs9O/Fy4G/8KJeCnT6hDc+M1gsSaLsk2yuGulCcVQftzbYQBMEntRYpFLOs@vger.kernel.org
X-Gm-Message-State: AOJu0YwUEe21FhYkdGCncY9bk3tfyOLn4U6J5gFEzir+q7auNL/a4uME
	mIbs8hDOZxWqXuTNIUVZ0QKnLibWxAummxM30d/Ug+pRNP1ppOlvK1o1N8FU+Y+yuysHWfnMHVM
	BH1r48crRwa+eeUxBaGZiCWxojfGPgB1oibptKyD3klbgiQfDFJTApZG89JOuw8f1
X-Gm-Gg: AeBDieuKs8X2+qzRUhspRExGU9drJLjCQVwpZaZBy8vp+nERGPUchlvvWaIM+ZFNjPH
	huOEGFEVeuGvJKMZ6AQIx01lWUuWg+eucQy+QkQMoJnzbF6CakPDJwHfj5F4RW9fIF3umzf+sKa
	oZQfqy+AsStsLMdRmQC2sD9VvhlmDWV93b/b1ESGGtqT4z1tURXbtQWuUdu2xrwSN7EtIaV/EkV
	t/Z+w7XPIV6+8oB6MlW8WTERgGt3KNOqjR7EtTC3ndgVBDxrt3vXWCD0i/8g/zmHrtRZlhyUOiq
	+ZBDd9bObJWV5cJWYzUi0vgtil2LZPQyeOpb7JqpJGHkNw+LCYp9Kw26JWz6XIAG/GjmDhQewzg
	UJ6UQ5oLNK7sGExmbyCFRDDDJqoIV76QthJy5HZFrxxTqqR1KDnTxl2Cw2TCb8dByJQ==
X-Received: by 2002:a17:903:40d2:b0:2ae:ac0c:5a29 with SMTP id d9443c01a7336-2b281674f1emr185590675ad.10.1775579016593;
        Tue, 07 Apr 2026 09:23:36 -0700 (PDT)
X-Received: by 2002:a17:903:40d2:b0:2ae:ac0c:5a29 with SMTP id d9443c01a7336-2b281674f1emr185590295ad.10.1775579016034;
        Tue, 07 Apr 2026 09:23:36 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d20bsm177228155ad.16.2026.04.07.09.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 09:23:35 -0700 (PDT)
Message-ID: <1e2b396a-5722-4c28-a3fd-3195b5155959@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 21:53:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 5/6] wifi: ath12k: Add CE remap hardware
 parameters for IPQ5424
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
 <20260407-ath12k-ipq5424-v5-5-8e96aa660ec4@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-5-8e96aa660ec4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d52f89 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=K0dzcbKyB1xs89kN7v0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NyBTYWx0ZWRfX4vLfKjBy3i2h
 Ugo/n16AiCmHd7nXn0EgLOtAj5Q9ZzQAuKDDJ2fN5+vSlUe+bn3n+9n8AlB4/HnJQn7kiLmzUkS
 Ulv7j90AtpyRayIPkClXrTpupfi/HP7+OdzSJRJhx/PykopGRtESEw7AOt3D/rvyNR5zw/gfFXj
 WZ/NnLWp7OnEz9yKP6QsVVwBTBjGWlQNLlpYx0Y+Pw6/3C0zCqbV7A26uKKFqpGGmOcAov8SbHh
 30sY4sGchiSNoGQNMCuPzTBHsn46WCM9fJXGK+sOLpIyOzpJlpvy9p3OxEgWvnFjoRqDV0GnZuO
 TmUYrJhE+VqkgSvCZkJSF7Gxm3+vHJ6keqD1OF5qJBxlroEJ9PhNb8ADvBLjWLO2ur0VzRtPOfG
 WwHVaysCln4gM/veVVaQUPhrDGph96TQh1jTRDGhNfbFgj7nZKZNtQnhkNAVkbNoGHVYR75afYt
 P3dLkM4Ui0bk8hLghpQ==
X-Proofpoint-GUID: 4lnDomoeIPdI_Sb7A0sDO2smewQg2Kc7
X-Proofpoint-ORIG-GUID: 4lnDomoeIPdI_Sb7A0sDO2smewQg2Kc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070147



On 4/7/2026 10:56 AM, Raj Kumar Bhagat wrote:
> From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> 
> Add CE remap hardware parameters for Ath12k AHB device IPQ5424.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/ce.h       | 13 +++++++++----
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 22 +++++++++++++++++-----
>   2 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
> index df4f2a4f8480..009cddf2d68d 100644
> --- a/drivers/net/wireless/ath/ath12k/ce.h
> +++ b/drivers/net/wireless/ath/ath12k/ce.h
> @@ -38,10 +38,15 @@
>   #define PIPEDIR_INOUT		3 /* bidirectional */
>   #define PIPEDIR_INOUT_H2H	4 /* bidirectional, host to host */
>   
> -/* CE address/mask */
> -#define CE_HOST_IE_ADDRESS	0x75804C
> -#define CE_HOST_IE_2_ADDRESS	0x758050
> -#define CE_HOST_IE_3_ADDRESS	CE_HOST_IE_ADDRESS
> +/* IPQ5332 CE address/mask */
> +#define CE_HOST_IPQ5332_IE_ADDRESS	0x75804C
> +#define CE_HOST_IPQ5332_IE_2_ADDRESS	0x758050
> +#define CE_HOST_IPQ5332_IE_3_ADDRESS	CE_HOST_IPQ5332_IE_ADDRESS
> +
> +/* IPQ5424 CE address/mask */
> +#define CE_HOST_IPQ5424_IE_ADDRESS	0x21804C
> +#define CE_HOST_IPQ5424_IE_2_ADDRESS	0x218050
> +#define CE_HOST_IPQ5424_IE_3_ADDRESS	CE_HOST_IPQ5424_IE_ADDRESS
>   
>   #define CE_HOST_IE_3_SHIFT	0xC
>   
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index 2b5d1f7e9e04..cb3185850439 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -329,9 +329,15 @@ static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_wcn7850 = {
>   };
>   
>   static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
> -	.ie1_reg_addr = CE_HOST_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> -	.ie2_reg_addr = CE_HOST_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> -	.ie3_reg_addr = CE_HOST_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> +	.ie1_reg_addr = CE_HOST_IPQ5332_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> +	.ie2_reg_addr = CE_HOST_IPQ5332_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> +	.ie3_reg_addr = CE_HOST_IPQ5332_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> +};
> +
> +static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5424 = {
> +	.ie1_reg_addr = CE_HOST_IPQ5424_IE_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
> +	.ie2_reg_addr = CE_HOST_IPQ5424_IE_2_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
> +	.ie3_reg_addr = CE_HOST_IPQ5424_IE_3_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
>   };
>   
>   static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
> @@ -340,6 +346,12 @@ static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
>   	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
>   };
>   
> +static const struct ce_remap ath12k_wifi7_ce_remap_ipq5424 = {
> +	.base = HAL_IPQ5424_CE_WFSS_REG_BASE,
> +	.size = HAL_IPQ5424_CE_SIZE,
> +	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
> +};
> +
>   static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   	{
>   		.name = "qcn9274 hw1.0",
> @@ -824,8 +836,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		.iova_mask = 0,
>   		.supports_aspm = false,
>   
> -		.ce_ie_addr = NULL,
> -		.ce_remap = NULL,
> +		.ce_ie_addr = &ath12k_wifi7_ce_ie_addr_ipq5424,
> +		.ce_remap = &ath12k_wifi7_ce_remap_ipq5424,
>   		.bdf_addr_offset = 0x940000,
>   
>   		.current_cc_support = false,
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

