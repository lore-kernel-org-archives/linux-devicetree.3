Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CD732142B
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650774; cv=none; b=MoJDLW1Gn6VNH/WYdPWgahVON7v8fULFyZ/JXojmzizh624jgQ+oPnNbbPEdu2xS+JB3SCTFeBQbnbyO5hI9TSEYsXVOZu/xZ+Q74kKEXHqrkv4BH44MODOz3cDqr62cqRcHOqGd69mIfbn0czEaxGwntLYY0sZ63AzKlBJCIzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650774; c=relaxed/simple;
	bh=capWsiQ5rJGhl9NvRhbnoZUTwqGnZWyJCfohq7HeORs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djwO1xZyQOWVwunx8jDOw8ixVO6Gz6qh2YnkeJh10OBV6WgrIMNsw3xRw2uX+K6eg6EQhwXa/7UvZTmKS2HYUtULik01nTUaoVY3ExCOowNLq8qyAXiTAP2qSrRIyvGLWpQr+nYFdrXpqBhoPGlB55mNwgdhXk/c6+JamlsWvBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmBC+XUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtER+VNN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmBC+XUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtER+VNN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O6Ad572878503
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFsYU4PoJlad7DzZn2ri3+ulmwgZAGOVL0cgWHGyGXI=; b=RmBC+XUFmq/Hr0+6
	P4HQ+kLDbngB1TjfvtVvqaUUwnYkdplmzmDnMWkBNfRGTOt4i206m34n06DxkAqG
	QbJO0gxYrePw227NVpfEnlsOb4yID36AkHEsi+5Dv/kCrSH55aKLNOJ1fb4HMuJ+
	q4zUUPydsCP81WJOg3CVZIWs7gjgFKpwl8wPn9A79pU7+53TjsGQR3nHGcrBuq7R
	Ylo4oYroJRwaRaP/j8MI3DAeWPS0LddstyrkyriIgXkwMPJWHkd84iiD2GM/c2lu
	9YF3UydaLX5lJ/NYMbQjtzorYL5uy/ehJlJXa33PhQ6l85PFbROFgIFU+YUBJnbX
	GcEDGw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9kq2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:26:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba6fe41283so94728965ad.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779650771; x=1780255571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFsYU4PoJlad7DzZn2ri3+ulmwgZAGOVL0cgWHGyGXI=;
        b=AtER+VNN+V5kwCgafd9qSEj4mXmvlQpOb6SjV+18jYbZzx+0WjtB2cnZxwswmFxD1f
         rZPKzi0/JDWZWGWtZfqdpwdYFBqvCN791Tko+DbKMxI7eJkrJSmKSh8hGEfh3mHuZM99
         UAGQa9ZjfFoaEBy3Ap9Xq0hGtRUkmgCqgPrDp+IVjfwdfImid792bnqHEkwJd/evMoR/
         26km74exs53DlZTK5h4nYMHAzjnpjTyXyaQf1Rm2RpGkui634SfiurNeS8sPpGqnv1qh
         PNC0DXeVIMBxRRBQ8swGNDxHMcyzekMhq2Ei6AddBhSejpxcigLfB0U8TAUX61v6kJ69
         Ei4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779650771; x=1780255571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sFsYU4PoJlad7DzZn2ri3+ulmwgZAGOVL0cgWHGyGXI=;
        b=HAQiSsUbNvo5WXVw2CWXcG2ClQecjap+164vMI5OuR0Rr+nlgusAUIC83jJAsHHvXa
         RcnU2Hb2V1UJcjdjq1ceU0i51mE+cUR2Tm5ABZS/EwlWKGWFnNika7fcWkbE9hgUFYrr
         FQyvb7bZh+neH8Kh9sa21ItSHMiIvPu8DsbZhqEwTDXfJBgi971HErtwG0WjPlQidHXh
         Wct5GvsArKAc3T079FJkrJWBYzVvUltU4IBPhgN1o0ohcPHhFaoyY6Igd34ZKr+UlBjA
         VCPAQvypVlc6WU0lcrkPyGJey9q4UssrvHqyxP3iql5KR6/CV8/Y89Dpj6obiM8qYCrW
         lRQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Kg1tpCeffGw+fjZc6+AZyXOSLAOD825JLW+oR34YxV1jGvXu32Y5YhKO/DwCh+MyAdwbtyz7RgPbD@vger.kernel.org
X-Gm-Message-State: AOJu0YyzDtQFADkSyKIqCN7EQcSpfkA389Tn5lo8fOpSIeH+CnwXvnS0
	zZsoYaOAcPLutc2HGt3Ot5gBieZWnw8xtiOmRt6O7d6Td8/9LRH8nvPC1LlhqvAzMMMmdLrVsrl
	u5vJhkC9RW58J6pXj9aEX+Wf8coR0XrZenJyDLxrVCqsum/u8Hvc+Pn29DRSHUY97
X-Gm-Gg: Acq92OELOra7FUCNjjITdJm5YAvSafR1J+bqDOezzkpCUGDiih4nKuEwIGcbuuLM5Rk
	JlqI+OYbdrcqf1ZL5Qlz1iErg4WLNgbhxYCMiKHXeukuBMBNSo+7w/PpFQ2wxnVPO7EWGXxffJn
	XP2oMrW3aOGDg+Q1K6iNzwH0vu1MLVfdCpAnXVbVD6ZjH4FA7VlpqiNAF1JKwEXhcqVFe1+c1Tf
	+ZRIMfaYLvxIJpFwpIUPdjit0aRacV+QwswW9xrAlOQWe5ynJWKIXI/7jcOClZquFuepfe23mVl
	US5OiC18lp2TIzGtHqq7QYgW2foXZA//Z9YgtYgnf+MZoAIQnNxcAZrzqlW5J9MLBGXs0DJ6hpO
	2vMBYb0JbTQGwpRM3LYPIxvqtaOQ0usK1dOISzYxB68YQodAoce66s/P0W9lahOyYoI0XeQ==
X-Received: by 2002:a17:902:d589:b0:2bd:4d4b:9143 with SMTP id d9443c01a7336-2beb03663bcmr117283145ad.8.1779650770949;
        Sun, 24 May 2026 12:26:10 -0700 (PDT)
X-Received: by 2002:a17:902:d589:b0:2bd:4d4b:9143 with SMTP id d9443c01a7336-2beb03663bcmr117282885ad.8.1779650770492;
        Sun, 24 May 2026 12:26:10 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce2cdsm75329945ad.29.2026.05.24.12.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:26:09 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 25 May 2026 00:55:49 +0530
Subject: [PATCH v9 2/5] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-enable-ice-clock-scaling-v9-2-c84613e9ce47@oss.qualcomm.com>
References: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
In-Reply-To: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 5cUtIdkaEfTrG5QHn7Vg_0fEVd69b4u6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5NCBTYWx0ZWRfX9aFx5ZmbR8aZ
 6AfRFRvHmEMLgh/h8m8c998ShYhPduSVAGSH7aKR0sHPhbq7hpB6w6pVDeZ4/FULLiBxsu5jWmh
 WbluKw9SpkXABqsoRcKywdBp53iUJjyKFQF74Z0FKmhyAFl35JfXYwkO6H5QInEdQnUXuQreHfp
 Dot8Lo6Idp7VA64HDart0JXKsHnsjMEKG3J4oB0FD5x3LEQ4+sZb/fltFD2896CUxe5lrvKWbeY
 ASysCajA8x/Dzp0pHXT2w94gsapggY/WyK8V8HOf6DNgNgcxQIhRnp/hpBv1vP1cJMtkU3M43ns
 T9EiX2NWXTnZpbR1hh0iwKjvzR5w1DGUvOyQU/QHj3baP/SJe3JO8kS4yKIZPmGQrD1jJrC10/D
 iKqdA4U8XGPGRg9IbGej9vD+eVwmae4VPW7+sbe4w8+cx/abP3Q0IUv+n5o35k2UqyqheBcQdLw
 oTUxsRC29hK4MYrBfdA==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a1350d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-RVjIYUuWhs3u9hRN0oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5cUtIdkaEfTrG5QHn7Vg_0fEVd69b4u6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240194

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

For scale_up operation ensure to pass ~round_ceil (round_floor)
and vice-versa for scale_down operations.

Incase of OPP scaling is not supported by ICE, ensure to not prevent
devfreq for UFS, as ICE OPP-table is optional.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index bc037db46624adaf494d08f6c2a2c55c9ed24606..b248d8db8997341117d014320d22fdf1ae7b89a6 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -306,6 +306,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -340,6 +349,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1933,6 +1948,12 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 			return err;
 		}
 
+		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
+		if (err && err != -EOPNOTSUPP) {
+			ufshcd_uic_hibern8_exit(hba);
+			return err;
+		}
+
 		ufs_qcom_icc_update_bw(host);
 		ufshcd_uic_hibern8_exit(hba);
 	}

-- 
2.34.1

