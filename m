Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E87C3C9438
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622557; cv=none; b=O8fBU8sxuUb7oERpnGIXWGTIBzkFm/Y1Alo2PG4CVhQFxa3wBdwThqzzQhDKvse1aMoUWT9qsLpq5zZ0wcZVKRkxaw1ymv6zeY9+5kPx+LH3I+NqViTcCUyt50OntqT4LE3noB2glLGWT8lh3miCAHaf80TBWUKAyQ9lhIic51g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622557; c=relaxed/simple;
	bh=49NOvaGVwlvi581GKoxSpuUe/4IKdws2QDL7UFNjgdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JE7/fyUvxnCICjDOsk8d/PCFl41mVPlcwfcFqJC9CerDD5EEXJn+6LLIyXxLK0R619Vs+cBaqvQlgp9QAikGDe2W+cJJ4ihLkeavuWryt4wdM0Bt1cSKHktqkkyYlVHI32R/yl/tij561FBGlV1Wp/ue7M59htv/OQ6ZH9GVpls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAwLOPUC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvfF+rHj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAwLOPUC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvfF+rHj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWqe92563407
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=dAwLOPUCN4+fS3FY
	zSMbQj1VkLrgSvjf90D5Pv66M0wHcSeFsoCjPd3BuNGPPzjo4gq69Zr2EPuf87+q
	xY51GcMBq1NbBDYfLCy2PY4fi7BdQ3iwUiBqA+zJyxKyW6zXIdNu3zj2XEwihOg+
	NUfgX5QVOrcv7xIlGsEMRuE0LbXPRUnZsMCDlCmaLy087f16esmgAvpimQ6i4KYM
	aLgvtof5MdJeIJHSaljSMpo1NHxzwWTcs59aQA1+pGWqIlktr0y3wh/2TuYVzq+a
	tceDmYbcefwf6gkuY2BkT3dlAXVR6+gUlj9iqSR3Z0x4Q5Rrl7ZsY+R3sksmOxGk
	JoWkhw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3gx42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:42:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso188739a91.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622555; x=1784227355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=NvfF+rHjo86Dpj0Qq+qn7+FdHlOxSxRVV1gara6rboyQiDBFBbSnNhwukEGQKYblyz
         Tm/YkYK7HnYiP66D9BEaeA+kD3ARNvWK3cTddHOvnq7WFoj9gGXs8YGBOcwnQnIFJA8h
         Wcy3gIbcKrPfYUYzyc+/bNRZ0CxsNvUAFnVuPxXeSDzCSb39qxoGrZeVrwdPhVxzTZxU
         GslzlWvYkeChkaJ7/R0FboPIPXRJed6C4kiV/4YFceg7n8p9DCE+JGVsuuhwlSyoL9yK
         ba3hn5i++h4BD5DhTnBFGJm8yW4ePCXqXFHHb1YYGxnDffxOSUujFnBWYUZ+3QTeJEIF
         SGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622555; x=1784227355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=m+xwkufyUXJAxr4myIygPnM0EZB2l7V3Vr/kyCvblB9jiA4dLrdmHivzq+RjHOlMW6
         ZTYzUUVyz85J5WyrRxhkYopGTY0748DVCi4nznVknjHozg0oJMr7p6l7RKOJoXOkCSY6
         HtlnJI51k63IQKxA6WZ8DVpIHzorWJF2eoEBWV9KtJMDUsJn/MVNkNVti2TahC9PD9IX
         qvwYECp84mIEhEX0FWRDiziA27Npnbv0+8fwn7b1FhoLEt6of4TjsIhgoZPnvrkZksBb
         nQLOb6ypGdgPQ0HpczOhvxdlk1JUfoK5zUX9iIUB95JX/Aesanh4nPIKYAD5jRNKk7qb
         zgzw==
X-Forwarded-Encrypted: i=1; AHgh+RrdAgl033gTpe8OA4J4lz6vF2Bp6P0Pvtc3zyqv4zYW8UsLNYMkpWdyqY6PfnEPAC/aPY+C7S0sXLIM@vger.kernel.org
X-Gm-Message-State: AOJu0YxBOkLAeDUUiZzU8sqBxmcL+6gwUf/+RHd9wjqKCphkHMj+vkc/
	aeNNDLYubLcFLiMkS5R8YQ9aLrEiw0LKl6TiDE8x4BKFSZ2hy+ujMZxtFDS8dEh5Xr5wXTZlcKe
	npezI3Kj8L/2YsGfErQh0gccPHbLycGu2FK7oJuQYigWdRzxqNYbHp2SFdonXEBN/
X-Gm-Gg: AfdE7cmdlkq8JjpZFazavcFCCRpgDViBJNkBhxPU41CI2Pn0SXmNzPNLIJw/6Lnd4gI
	zNeaTXWNUOi/uSnMrB1mK8e6vJyuPJzqSqSA0JRwCDCgXtkDSAJVohpqtr5HDeCMIoWGcuDpFej
	AeHU7OxzMKkfIg4agMcLl77xPmfz1GXCaTacsXkUB5rppz2U1xgOvkY0zYrSYPkWRqlCCyEv1BL
	m8z/3+ktyOIOuKyqeTGIBI8ac/OEEO8sWwcJnBrcu1a8VyKG8nC1DxNCOVA74GNu4qxtisqlvkn
	drVYraBoE5vre3PAy0T2o1VGFmme0TBRJ3VpbU8AkRXEOy38vZAtXnwKjOq+yR7pa25guFBuFii
	9MDnKIwx0shprVNE+dxwnYeXuXsBkS7s8+uk=
X-Received: by 2002:a17:90b:554e:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3893fe5d587mr9351780a91.14.1783622555154;
        Thu, 09 Jul 2026 11:42:35 -0700 (PDT)
X-Received: by 2002:a17:90b:554e:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3893fe5d587mr9351738a91.14.1783622554713;
        Thu, 09 Jul 2026 11:42:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:00 +0530
Subject: [PATCH v6 1/7] drm/msm/adreno: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-1-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1210;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vmi+IpVwDwItd0JsdKwDI4X0C7GvFEMaBv3VFip4Ixg=;
 b=nxXrfXueHCc8y0f+NSNb9djpV2+XQhcnHRgE6tAiSlaz/KzrkKd70ZDgPVMGFyhqmn/+r/2aH
 qjx5RZWOQQCDnIJSYqVVjc9IR1xwlOARTfmr7T/GKNDW7jB80rJlUhx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX7Giz0AUPjead
 T6CGfx3I3qUx5fNPhB0VY99T6wOe1Kla8b8M0zLTMMjkZUJwoCPErsFPXUnYz466itqRr9ulPdy
 FGwbz9qpIlLus5KnAPY9AAr12LN+ZSJpGK0mSm3Nwov+FzRPDctt4WjxoMCHQCYTy052IZHO8ek
 e1zCUratWtgSTjTtyPetQx3xT4q2t7Pe+aEv1+KvGV/PzZUTyScXCwKxx89/TfCdyQZXZ+o6FKz
 XBN6Ttm48BGcGm9v1sVtsVr5zLxPgxRqmWjKwjbEEYbhUK02GW7pqlRKgZZzw7RUNKcSqRtM5Rl
 Dt4Jy5PWl78yeQMX7hQRDC8GYAF44R74/c3//w5dxfrN/Z2kvPaXQvgOoE60baeea8MAobEpgH7
 69uxF6aJb0bgRR7jdsE6GpvQcwSMvLzZpB0jQmLpdZ3Kopt9D+Im+8TdZrqE3hVYs/T1G48ToIu
 uBOx5cvh8vIWbsVryTQ==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a4feb9b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX1SqEGPVwoc5V
 mQQ3K7obqujQUV27cMOGBPDqcKfOT1nU7Kga1eX0ERo+mNthTfycHwTCgVIbaT6AJ8WqVXiU0ZP
 1phhfnyq8cD+tAlunx9/iKq/BiGztKA=
X-Proofpoint-GUID: WXuPXSpOeKh8twBXjWrV2HyjA2EBpoai
X-Proofpoint-ORIG-GUID: WXuPXSpOeKh8twBXjWrV2HyjA2EBpoai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090184

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.54.0

