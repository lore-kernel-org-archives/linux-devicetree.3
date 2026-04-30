Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122B7402B83
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550013; cv=none; b=eqDM1NNABrs73N7/V3C4h3k1/M3rnZoqTKynImgCIvi5xgIUeJ8P2cIgU94voZlWDpsW9MvLVuOQumQJrk09baJYHLAc1tdAhvUFPL90UmtwBKzqnhLU9EErnJXDIxvWjHzvmvLLFD9uBwKjaewLFMUiqpmvXFQ0nWhj1mEGDHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550013; c=relaxed/simple;
	bh=glAUnslPhbMwD/sFXe6BFap3FDs/pmoREZOqlEys1Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMNeD8rETdD117WxIeqzSXk3U/iP8VnBPxSJBg09Mricwcf1l0k//Z1bqpA9bZ/hH/rXG9bIbbxI4MO3NfgvKJcMAU/u+5FrslC7UwqsQ9EZzjsGWf83+g64vhNwnNGEFxRZDY6FRpwlsC9bl4qNfWSiiL5qjIF/2mtbqPTT/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTCq+PRP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBgjVwnc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTCq+PRP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBgjVwnc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U8L7LW3733196
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ps5zXr8KvxD7La8ND/9uOCAL3O/rduP00pOV5kPiIIU=; b=WTCq+PRPVkeGHc5N
	4E4YFwhZCC0aLpYfOjyVEUbQEHg4rQWAKmu7GvjtrC/AovOiaqGNA3bDkECWOBh/
	hxMro0KI/hrFLS+/UGbqtoJrrWbqv1TGw4FnFIqH2KYg/wkqfHYMgfS9zF1F87oR
	TeIvfzYDJWQr3ZdUE4FgoCHIZVUA80muLmW6zI913AdVvb1PiyRzPXRHNfd5yX6f
	chZGN1ts+LtfC4CutHifXQDTshoZ8u+4b7YQs+0wAYWIMVtce6q2LATQ9GSWmhmM
	a0eRGkz0EzCTsDrYq6qhhPnIUY4AduhGEeRhpoBsEFaw1k6CrMTHibxYBLyeWVub
	eYHbhA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3xafx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2d83e7461so14959075ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777550007; x=1778154807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ps5zXr8KvxD7La8ND/9uOCAL3O/rduP00pOV5kPiIIU=;
        b=DBgjVwnc4c+VfQLFSNon+idN4tPdDGfCzr4mBRDO8vhal00dFC9oi9o6XPi0Ruymgy
         msF+i1PdAtz8GMVZpO28eXQniAmuZEY6hVhKpfIZJ+ZiZrwujcp/Ytda5aZ5E6iKaD9k
         wKQ9RR32+yDMdJ542Z0RTfrfcMVMr0OimDiqb65PPmSnpl5Norw+E3oBeyN64nIszSX0
         DR3mb+H+3/tVSM3LVTM2ynjGGASWsHXk+7ylR/ntQwOE5pHL2O5Hus/ieNmkp9k9/fZD
         NOMTZeNk/kqKoykwK1KkfIKiXjC+37pKIe8Bar8T2zBujrx8zC7KepGZDcITxKR7pWaD
         dIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550007; x=1778154807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ps5zXr8KvxD7La8ND/9uOCAL3O/rduP00pOV5kPiIIU=;
        b=qSDz8H1wsKobrKjC5OVNRDfhvOOXSi6ueKASLgfLnntc4w2P6HcMCgeBhH9Zoa+HgD
         HK1oTQIHUuhRWP2UV8ly3Iw35DJxLVrvrMOsSXGB1kJcaB24UCm5AjZhiSxkU6fzg4B5
         4CyoN/+sNTM1gqcYuVtSpxCckJZxP2JhaeZ/qYGn5Udnq5t28MY4Kj61boAolF+NLJ2h
         Q7H1A7lP2DSNzo8AE5GVp9gdcyXNgv8AkxOR6CwItQ6GFv5JwJDfpk2vEr6RuUNqMUsB
         oayX8cgbo+rrOMEr9TOWBFBrn7uLTNqtvooM31bsNRGBD9R4muvSaKM5O/+IEw/3ZpVi
         VRdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2qLzVuPzVGBgbdHkXNQ5OTNt9yvc1fi+9cgByvu+hCuaQlEr7qq/V82x5d7GLOAPI4ibok7MkPlhm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5i0X4T/jQmC1lpJaW8t/cx7mjVMgeddFc3MMoSfeloyf8I/R9
	eY2ZPuhVkb0ynvhmbO7LbyrDjB6sCEnhf10m2W6LN14Vbl7winR4/hxkGJO444WjHWIrd3GJGDc
	5tMVgsvKOWrLFBPAI17tWf++2zBEeh7MTuR/FTv7MVf/oGKfcw8EixY57Gc4uBTiw
X-Gm-Gg: AeBDiet5FWoYTC3Ntn9ZcfTPNjlqny73welwhtklAFVQXeR7UgJTQJ0odXQLZ933Gij
	uAnMjRazxKUIeAGA0mOoiA5C64Y242VFL5XzyrcrI9q2adORahH6s1/JirN8sZGlkD/RbQDa4DD
	OpuFfonTO6DB2zKGDAjMEVJIfH0dW9t9p86CMgERJ9KWaU72YaS4vOD8KyuWr0ZDPQ27wiKNg2p
	vFaZA0TYFVr+j5jaEvfmHRXy+smMu9DunDcbia3RLpZDJbIVdYZWG3kPGnM72fzmKRDnVIMdg65
	w4Tu3ybDmlDZ/gmWTzIjZV6SaqBlTIgF7TeQIjzDPWFCBlq+BRy2dtvxXQslMAGMu0UnnqzzPVq
	mwtuTk+rkesXhv8ANnaWZ96L86t666Sat+CkMdn5n9mKS/L0=
X-Received: by 2002:a17:902:bd04:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2b9a2345232mr18800235ad.15.1777550007308;
        Thu, 30 Apr 2026 04:53:27 -0700 (PDT)
X-Received: by 2002:a17:902:bd04:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2b9a2345232mr18800005ad.15.1777550006729;
        Thu, 30 Apr 2026 04:53:26 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:26 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:29 +0530
Subject: [PATCH 4/5] phy: qcom-qusb2: Add support for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-4-c9c108536fdc@oss.qualcomm.com>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
In-Reply-To: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=1446;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=z9a9ilodfoaZe6rWbutpepb+HOnjBSdkp1kFi8ZpYi4=;
 b=IOE9Vdz9TdJzaNgyiwXdVYxmmFDYF9VHTqzy5dEJC1AehxKvn7ZNiOEZ5b8sjuLAwE7dJ9Yr2
 RkKC9X1+cFGAHVfnRoo/InDVj7ljVl1kbIEcjeZVigHOKnB1Ht82W38
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfX+FYxcWvk7l0A
 A1CW56Y0HEgK48q3qdWPlkpzXJ+cqbtTYdBNSKVnVX4KyHbNp1NDfOGpSDKhVXhaeTKpa8o4p43
 iytJPBwbGsJVCp3BfPJFz8YQzlQ7j0vXPh0xe6ICtnVxAR4l1vTwbwT4qmgc12ztIGGobRzF3Nq
 Caqr2eqJkmFhX7iEJer20jO3V/v/sRy/sQndNN8cEnM/UxsiotcmW7Iq6ePUjZJdMArBEF2nhUo
 7vMd0shYr5KfwoDM5nwXsuZqkiqfaFHiCgAx9T6vHaQOx+txZRRtxdkPANV6fERB6vfPR5a7CuZ
 ZtlDUyjBxxKJkN3zIKKCT4KrtV7ARLhK2koyHsM2oJvtO4i71YkzJqIbkzdHOoE6wjE70K0Imex
 2lk12GMY4x1Z0cxRCyvUfHS5lmadFpGrlwo0LGqX3stUCqFJzAlWKe0vn1IIC3gAep3LLx1/Jg4
 fGDSOkgcs6ySuUCWnPQ==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=69f342b8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2jleMYo8EjVMK2M3yooA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: rLS3_Dy9mb165KM2o-C_woYmyVKVGNRY
X-Proofpoint-ORIG-GUID: rLS3_Dy9mb165KM2o-C_woYmyVKVGNRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300120

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Add init sequence and phy configuration for Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..ab7437e7b751 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.autoresume_en	 = BIT(3),
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = ipq6018_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+	.autoresume_en   = BIT(3),
+	.update_tune1_with_efuse = false,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -958,6 +971,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,shikra-qusb2-phy",
+		.data		= &shikra_phy_cfg,
 	}, {
 		.compatible	= "qcom,sm4250-qusb2-phy",
 		.data		= &sm6115_phy_cfg,

-- 
2.34.1

