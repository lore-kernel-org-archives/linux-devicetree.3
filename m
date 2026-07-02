Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D3536AB7B
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017259; cv=none; b=hY57DH1uowPTFiTQrKeNlKjH7Yro2uROxs7sah6oGEskdarakwaIEQYVHFn4/U6sirGLFH613kCz2dkeKajGkdiSAJ4BdEiH9OAbyCOZfgkxQUdQKXJkUILuNDEFSDkgd8FolajHQstZRiUpIdOTaq+1QuEovWEPpLzaTUl9+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017259; c=relaxed/simple;
	bh=xvEppMuh7bHMtzlkUdcvZDLvzPcPeT1rc/Fc957Trsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FMch2EQJYWZKIFQSie0i1wC9Zh5nEhMLHdig29+LjwMYhmw5UkLYJE5+nsQv+MAXhWXxLNLh9sBSuHKRkck5ovpeUbNsW4uRdykwi6gReGcfkF6HHjGHqdy3INM9HGJtJGRqfdbolio1qyyozF03vuEjqu1NYjuQEtoD5hhKpR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghJecZv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwW7UvRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghJecZv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwW7UvRW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3JoM661909
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2JZrvWT9A4DjhRmvjWfIQbLkYceVgF/0MWq/Abfkrc=; b=ghJecZv6optUF0ae
	tLRiXwjwNW/eVCDs5+tpApw/TsHkw+ZJ36GKbn/wyeuDjyAaZkSLFu4QzbGiPjaZ
	ovrrqHLofMwTfshs5+9QQPZo2LBfKqvs+5umG8TqRpSzUqmDeOlP4S2B7W4KPNbB
	7uYOSNKK2hVngKJj4tZ5kUwtO/5pyX9exl9LH7vZM/J35+2RJAWzmRDBf2q9Nidh
	nSFqt2b6HGKSsQo1ReQ+82HLPdASyVJk84JmPzJ66MFkA5+v14ziieLkEMKOZYHB
	q6CoxoCmV0BI7vlCWUZ2iiBH3KGTqjbf66etBju09PNpsMeJGINjy/xBO46NqSME
	NYqYLA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp9pf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:34:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c79e5de32cso26003915ad.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017256; x=1783622056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2JZrvWT9A4DjhRmvjWfIQbLkYceVgF/0MWq/Abfkrc=;
        b=VwW7UvRWnPj6R1wEhoJsMEaP8aNvrGRICeGuvT/hKYbghyZKX5v4p60bIEzFipJUmv
         tdyfhIOpZA6KptOajfFL2vXsAaWL3EcMokUF2YxcIkN2954uAPEepHADpcg8xu2gyZNy
         3U9q4h/Jar6WGwjpr1TWZliMYCCidpHsh+mRGeKnfEDclBs3gzoWgWhruNGgW29zXsY1
         DCi04ro1Y15n7WaxVhnjXpHZksVVxQ9pBAoDo90DqwBX8fNXyVGPfAGyAbDB6AJkupBh
         pwkj6SmqnIST+hNCcVFHfFsFruNeIS9bLG1rv40+WZjfXTkVDlOl3AMAXYG7B9GZBhxr
         lm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017256; x=1783622056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2JZrvWT9A4DjhRmvjWfIQbLkYceVgF/0MWq/Abfkrc=;
        b=nfRpcC1YWEbC4DWIF+1TY/oExN3vpfQ1uSRdVxMATeAcREuzz7d1ie67TXYPig1gjN
         0UozjK1zOYoDGYaq5AvfJVNJRRZZd8bRJkfK0Ty52jU78kr7aawU4dTBwylQcVhZbU9c
         P8E4pjd3ei+hXYNAiJE2D4oNosBovvwhKy9raPiu0dAKfJ3QEuA7PogKWc7iBI+2Kw9J
         M6GUCX6hX+X7CbopeBUEItWty2/dveznsilWG4Bd2EeS5VUcodKBNBWvduXAAYOsP9Ee
         cpxaHiLPZ4SBntFAGUOxkUeSYboqKvRxM4mb6BuRRe2OiGRxxrKCeceIKOj7gsORRguV
         K4zg==
X-Forwarded-Encrypted: i=1; AHgh+Rqdw4udjW0Syt0UDBG9b9u/yASVfQb0Lr8Vrb0bJaPIFPT2LUrGQhtSmO0Lkd0717N2YHDVn1YTWjDY@vger.kernel.org
X-Gm-Message-State: AOJu0YyLJcQTfNf5zwKqKesLFeJtr6gxblDXbUFqK6VuYYauvq02Mv3q
	Bf9jZq0CsTNIqZg/GWu+alfNgsL2Bq1r4ifTE40aMsztKz7pYDwrRDNElC1vmqxsHfMIuyQPVML
	qWpyU33cyA7Oh/lUPkfrzPvwf2BOR/TKq9zBBlcLgXH+yDT5U1mmOL4wBAsYzoIWJ
X-Gm-Gg: AfdE7cket6hYL0epKc6VNRS5nFcItS0g5kQyCJKn2NqhRozV+S6eV8cdCVnBOE7PCku
	dV5GpSy5bGjpyso+0jCN6TlqOkICBjRTRic+SBZuMY7UCOmmUkhZ/h4Q5VKJqlYUJ761RQGH1jC
	9S+xAfDI+UjwC0ASkIzs4kphRYFxQQ61Leor4gm00LyYLx2iOhOOIRug7atuot1g3HlkLJJTQvu
	Fdg28u1eWYw+RgzkhlZzxRRKHctaMoHWBlszbY1jV/RoumHrIoq9TS9MUnGYtYkYkj0wQct2IY7
	NOKZLz0Bf52A4cEQbTSFrUSoVncCDC7ulEF0GPDV62mPR6PiF5CgDzpbHgERmVahBFTVrRc8giq
	FN8X1OSAwRTgJYKSZjlj1MFg8xxNImj2IxcPkD6W/Gg==
X-Received: by 2002:a17:902:e806:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2ca911d8b80mr68383105ad.29.1783017254920;
        Thu, 02 Jul 2026 11:34:14 -0700 (PDT)
X-Received: by 2002:a17:902:e806:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2ca911d8b80mr68382765ad.29.1783017254353;
        Thu, 02 Jul 2026 11:34:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:13 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:36 +0530
Subject: [PATCH v5 14/19] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX9GR07tqQMR0v
 y1yhoOMnGF5W3pb9HA5WhaTOriUnVDRWIJwqAPi+9KPCzf3T1JNZTlJ456Gyy8Uy2n3VglmIZKA
 TNJjNySPkPwHwwQ95N7Qb2S2TRwRs70=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a46af28 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=U57akka57KfjTRmel4gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX1blR9D/SCxiQ
 AuoREIA96p050e2cTvhEK22hfp5EMDOTxN4mGfuqh+bGotHneggTc/sqoV54KWlXVqzgr7NYzLi
 aOJVD28RYSlNDXcEc39vRX93oNG2+7kvirf5pYFsQuabJaHLdMLXR1msQ1ex8UXRbytlpfyniGM
 3APjkalJO6ovJD5Jevgc0lRuUTsA7LkbKNV460amPAt0frN4CjKAkt3G6Aw7xuQUk7lAqMm70Fy
 v8S2vb8ZL9NsuojtocH4Ts8/zPIdUUwb3D7sztpkouq7ruSaNV0vBP/Syp0m9yddyWcHLgzbiSf
 bHvCLGZEaLKb2/hKIynYlKip5MmTKrpCdV+Wkm7F09KlZyyGVFOIy3PCQUczumYnOSJTfxBJrOe
 zNaOrAeSnsVTrlnOzhFsIr04RHwekZF86zHSQHRtkm/GqHnqkpKrrGzsDQJP3Y1VL6dSy5sIr1u
 Lqfk8DXW7G29e8yw3VQ==
X-Proofpoint-ORIG-GUID: 6F9lWTRdoVNIBDoPua4n99k6AgiKa2ar
X-Proofpoint-GUID: 6F9lWTRdoVNIBDoPua4n99k6AgiKa2ar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195

Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
similar to other critical clocks, since marking it as CLK_IS_CRITICAL
causes the clock framework to invoke clk_pm_runtime_get() during prepare,
which prevents the associated power domains from collapsing.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index b19e8910931d85ceda079c2745eba37e18112955..78797b77d7c7ba053201064ace3963cf2bd5281f 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -148,20 +148,6 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	},
 };
 
-static struct clk_branch gpu_cc_ahb_clk = {
-	.halt_reg = 0x1078,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1078,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_crc_ahb_clk = {
 	.halt_reg = 0x107c,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -324,7 +310,6 @@ static struct gdsc gpu_gx_gdsc = {
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
-	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
 	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
@@ -353,6 +338,7 @@ static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
 };
 
 static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1078, /* GPU_CC_AHB_CLK */
 	0x1060, /* GPU_CC_GX_CXO_CLK */
 };
 

-- 
2.34.1

