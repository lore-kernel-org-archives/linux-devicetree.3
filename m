Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C162338B7A1
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284984; cv=none; b=uVILoKPcs10NMIKh8jxpmpCbEyEazCawINBK/q4myaQS+7bWbpVU9UoOYufUxUtIyQo27tbn+RtzZL7bs/2KulrlknmMLPTCNroErA2LPK6JACzBtVyIH7uI7tVqLu4ZUduyGEpCXCcvsiM4dctyEDnE+dFLSsmAdg6lcdhf3NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284984; c=relaxed/simple;
	bh=RRx0OyRJz0v0mrnwaN1jNi07aomWPrzKeKJkv5FozUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIjw2uEpnwLzjW72FFs7E9Tb74jggeDm1vPN291UjXbiWg/NAtvuBa6+/QDH9jnJSop0lVm3zrjrHU9lFZqs4xs3BF9a/fNHkQ38FP4IdMrRzQUL8hvBTYJmKRuA6FhLt1+uhUzDukJb54uYYeyF7NWApwE93W4s0hy4YfSO48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqSNSF8R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtU+nECq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqSNSF8R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtU+nECq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5txle2237373
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9IlgppSiWE3A++/+8Jg0JE1d
	yFq8UkZtwHjTf83GQSA=; b=CqSNSF8Rqf0pNDc7O+3VMu1tS9uje5cNKkWUDAFa
	X66EoINLpg0k9UV/S7cSa9Q7Bv8cQwFnjx6OADk2/vaS276XWBzwDXEgu8Bv0H/0
	GFel0v5uUfmBvgNoY29FTbwGc9SrT+aYHQfTJjQSbUQsf5F2PdSn1LOrDtunMzl7
	eaMSKirlJrXTvAS0gPDApH0V09l5RMTZP/VQL5elHWBTi9hnJUq0SqeY1fkssyrf
	P6lrYVVb91MmPvCvdPnA0TVIEFNIDDqpXSKUOMXYmuc8XtZR/Z0oHNAajthEPePB
	aHhVYB3T0W1PaRGRb4sah5my+ax+tT+9M4RI2na5dQsCQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p1xqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:09:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0d0516ad7so4925845ad.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 00:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782284980; x=1782889780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9IlgppSiWE3A++/+8Jg0JE1dyFq8UkZtwHjTf83GQSA=;
        b=AtU+nECqipZg9U6KEQYU/YcD9o8dm/YSXEYbrn8tdc7Raa6oK9qx9v7hIIIJrTFh0Z
         UT4gG35X8l6C1cZEK6IyeGGamcUQVYnRglM5o53VBHsyV8zfsi5hRPnjb0sCkeYtis5C
         wT9FcAbzudfUvvqEDwkz7QNv++ddsuK6bJDvYHYDr7lWsIx3Os4TXo3AS04MQYUkxPmL
         W4xUnRJr0dDTLZ1poc1xC1V9TedWzTfwDt2wUq0hgAnFbmzMHKz5TEzdrNmju/h2X/N7
         YgqN36P0x555ufRqQEeXYE3w8MsBNh71ImoPCzKZwclmppdzT2Gyn2fMGqkZZ86+Pt7v
         gbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284980; x=1782889780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IlgppSiWE3A++/+8Jg0JE1dyFq8UkZtwHjTf83GQSA=;
        b=A3jxPDvOrGiR4QxesdfkjCrvonVJPwICi5Fzn9yDAJzj3Yh2ZVnohSTFvoDdAXA4s9
         5UHS8fbCUm3Thlbsm2Lr92vviN4CtbcMyUajrowuPCmYL7rsem2LfGNaEM8QwOrnsRCz
         ljHCA3NzTnHNkvNhMgdwuqfpNUOf2altbfzXR8bCueor5vVKdmyOGunXK1+m32AQ7XBy
         Zttk1BdZEd4IP8AlQ6ivH7GeDn+0zlkpQGCzjvggw8GFX53dSS62FaR9W2Do4CSuiBod
         tRtGJoGJSsnkyTqixuyGZBJsw9tXWReokGVKpReFenwZt2jMAp8RhP58LtQ5nLIbeoV/
         RXBA==
X-Forwarded-Encrypted: i=1; AHgh+Rpyze02kRXVVQuKrZGKvh0Em/l/Cwon+cBSnIfI2Gt0rtOpIg0kOPm2UKAVLaYJ9gqzXpl8lxNrhFIX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg0pI5lrySaSvsC2PKMzR+Zz5tA4wMq4v5m1rhMMTdzFMFgLT9
	WvzgVVfXY7/rLTqG9yQQkIB1qrBj5Kut4bi0yvJx2o1q6jxYipAUIil/mTr0F4Blyub3jjjBe5m
	iDX9ssFu7vwZkJm6nGnpllXAoDQJNiQsq4DPPdv/OiCqUZl483wOXELLAGzuROcBP
X-Gm-Gg: AfdE7clEjuJ7BZ1Y40sIuLWFTbAEqp6XDs0aOlQAMeFjrLktXqa9AHi/5r6KD6xOiZD
	+gZj/K4SNuSynVXtFlo2vQNFQv1dRcHMFIqyqUVvPQmULYRHmQjcnJXY1whgMG5sMp4iyAhBumB
	mVBX2SXO1LuDjX9Q3XwcPZpysW9Y5Tttb4tA2X3rSlFOHhgD8ALIPWvUPJUx2Sbpr38V6qyxio1
	KW7NGT8YZdmEFbUUOYFDwQgOUaRURgxzvP7bHgcNEFAGMwkO0pIMmYUxRjsjC9OU3pOQGs+nChE
	zQjSX8c+7WKAmBOkSbzwk2hKXjQn3uXRrtb/6+ocpTUiRqOR2doxIccg0NvzpCSciJ++ftc3uje
	1OTAN79CHVA9N0ix8N4vD6YIxBIE72030qWJtcw==
X-Received: by 2002:a17:902:ea12:b0:2c6:a76c:3c6a with SMTP id d9443c01a7336-2c7e1465892mr24755095ad.9.1782284979675;
        Wed, 24 Jun 2026 00:09:39 -0700 (PDT)
X-Received: by 2002:a17:902:ea12:b0:2c6:a76c:3c6a with SMTP id d9443c01a7336-2c7e1465892mr24754725ad.9.1782284979115;
        Wed, 24 Jun 2026 00:09:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af590sm147977225ad.17.2026.06.24.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 00:09:38 -0700 (PDT)
Date: Wed, 24 Jun 2026 12:39:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Message-ID: <20260624070929.vvvtjdoe73xwa7lh@hu-mojha-hyd.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-6-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-knp-soccp-v7-6-1ec7bb5c9fec@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1NyBTYWx0ZWRfXzfNKKUhntylt
 WqecJsso4wwlniH4IYIURpJ2cFMDjHxUvAX+gvimHaFfBrWHFRW0sUdPS2Gg9za4kN9Wu5CdwYN
 +vtzi3PZZQGQEv2NNvsOrbUiUgXyUSU=
X-Proofpoint-ORIG-GUID: IP4ceL28z0KPLPbtXyQrldj1p9dthIlA
X-Proofpoint-GUID: IP4ceL28z0KPLPbtXyQrldj1p9dthIlA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1NyBTYWx0ZWRfX7MlP6OwqMyUy
 snzo8Q4/6ANG4Ljrs2zU0AMlQiubMjKvq1fLHu02d8AhURJ5X5vBKGZVpZzR1H4voTMabW3yDju
 UmWeYeYhn6wFKB83YSNHS1Rce+Rxt1pIEcEamiE2Cbh/R4qeXhEznoKcrrI1s4na7ty1guhoDX2
 DZ+1ovdZIp/cgLZisVGH0ASz3w6bQ38P4/zP+SaKTpemXyqWVFUvReQol60Cm4CYEzLz9B8W83T
 HZ8vP+amGKQHLvJKVefWj0Qu2LoimF0OQoMNYEus1vt54jYq5G2ClRUl60YNqbV8F2MrC3W4mHu
 ZixkQ2k1Igj12XUoueNqIT4HdSvVq+c5f3Csm6CMwGOM3l/BWR2d4WhZHZJhWST99dHmBEMb/uL
 xzg47C7HJrzIvS8Ur4WVCo6NivDfjg==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3b82b4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VPJvJ4v_ho0jEmeUjHsA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240057

On Tue, Jun 23, 2026 at 03:05:22AM -0700, Jingyi Wang wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
> platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 8a0bb4b2e71c..60a4337d9e51 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1640,8 +1640,26 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
>  	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
>  };
>  
> +static const struct qcom_pas_data kaanapali_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.dtb_firmware_name = "soccp_dtb.mbn",
> +	.pas_id = 51,
> +	.dtb_pas_id = 0x41,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,
> +	.early_boot = true,
> +};
> +
>  static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
> +	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
>  	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
>  	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
>  	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
> 

Since, this is fully compatible with Hawi SoC, I tested it on Hawi SoC.

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Hawi SoC

-- 
-Mukesh Ojha
