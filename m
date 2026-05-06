Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECDF4A1391
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086302; cv=none; b=R7xQEwq7SEp3UhHIWWbG0ThTxYVGH32qQP/digHSh2/NT9h8HuhqBpL29yMdm0BLbzLiUF5vBuXMvPRsHeRyhvK3VES6nSXvTmc5NcB3GU++Gm2QlVjbbFWNP9j9AibN9ARUDIDg0XSAGgTkNCcea3rVIkOf19/XGf5M3cE+ZSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086302; c=relaxed/simple;
	bh=ILf2pwIydtwuDQ5X6HEWQeN25aSDTWIBdHxlZSEskg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ok9UUy3gz3Rff2bCmDxQh2W4sn64nSqiNls+1+1XUyXslUPgwEMoZYuJvD808mHAEeHjnrb4JMLIED4y7Iq30AaxuPUxys8s1YkBT5OuOBViFWqROfUQQnCpq7zpyNFLADcQa6NqK8VB9THCTAroN3Cstui8SuPqztO4+uyMayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUi8fJk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZFiGKlJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUi8fJk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZFiGKlJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646FGKUU443101
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 16:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W5l3VFDbTD30w1M5nzfg3zp7afKvX+ee3MVALDNuec=; b=EUi8fJk+/lET8coX
	OZOiJIeF4FMSLMcnACPvVWZvtjYgJaEv3x354SnLpH0utY0U/d/9oeN0eRwYs2d6
	fKfwRRIoAVHksbvoDH+JAh1yLRdyRywsFzRi+ck3TlnaUTPifqLWK4U2hpv4zStt
	YLYW7eDpZ8/qYxgiDy9fEN5ZDPsBCkP1ATsqJxjUo8UPCdzhMXTgHxRQ9R/T4j6x
	DUsv98Wuj2qiofzpzXH/pOSftw8XafU0U40Wtd/y+MYErhTGVgl1AANqQGElaT8p
	MbuCBEhggfKYZFyl+BO7h9zsZPKIoNODnTKQ6IlewT9jkpZNAlrk4zs1VdbtY8pi
	RHM9Eg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299hut9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 16:51:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-131371497a1so7839475c88.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086295; x=1778691095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/W5l3VFDbTD30w1M5nzfg3zp7afKvX+ee3MVALDNuec=;
        b=ZZFiGKlJ56xSF1q//1NE9IZBUvljdcg7IkFZOnssbTO9zk7a0vFUfB+9/ce4oSjzOO
         h7K+DcJ5/qhg0m4iLDf57ZPIOmyV0qMsmRKaO5JZngxGAUA1Y+hvDJbXsthSifZVmxtg
         F5t+AtbEWbVv7SXPzPpv2nYIcqCMCkfsOs4DXtwyc1lZRa8/OKKHQxbd588UgYZtVysD
         97fpZx3sxSCjj8bys9Ntu92nm2OWtgCdD4ibfvmcsDEZFXrfiyApX2QdBk0pGdsva19g
         zU7qSrHB0YoTZOjBK+QYqTmTlTbZTU7SxOiUNE1/PWd4SIix9GyQtH+Is0xoiUMqTVCC
         dLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086295; x=1778691095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/W5l3VFDbTD30w1M5nzfg3zp7afKvX+ee3MVALDNuec=;
        b=e4lh0uY1dcCq90KDzMV/ImNYkLPFG6eZFx+8jZcuR8TR5JU5q6KT93u6Z8+7fJC+2u
         DMZP1Sb59PS894UYeVmsqSWlLERtwV41SgyywGu2mZo+idL9PFjc1L/r4rgCTUuynbaI
         9PcnuFowCJNGZBvSN40sV5VggvS4OV+/uC6nXFROlVkuuHkVlfIeaGGK/3mOH+vwq9lp
         ODuCgFykM+DK7ESbvwz2cl/vg0B3Wb7Eqxg5OE2a5JdvYIoWpHrWhWXUxR3y1ZCudlLn
         N+LUE4Xc5YMTcDOByvVts1D4YrTu4JnC+BXV3wUFjEdKwXdbjGnIc8jEfO5k6cMm3H21
         lCrA==
X-Forwarded-Encrypted: i=1; AFNElJ8/P0isqkbtzz7d+yl0p+oniIOxx3OTr+ImuRAWXQVU9gzwsHbj8Rwk56OTu2qU21ZzpTZWeC4ZkPCV@vger.kernel.org
X-Gm-Message-State: AOJu0YytkFzxRwKLUJTHDUzrX5tQs0zugRfcifKA6nsRzC+FPnnrfWJR
	q+lM0xrFOkPTgqM2fXzEwqUMemMYmEWA++0LKZIUcvDQkSj0OKOJOmN9skUN3g/t6H4vQ+oc3dS
	IfpfYeP8y/GcQGPBpEi7qkszU74EBN5yUQvAdCMt9sBdR+5HZJ29d1tQmMKOM+hdiuv/0mGMS
X-Gm-Gg: AeBDietuF3oY76qJqPdExsLKiGlk/GCQP3XFhSW+1rkr9h7YwkbTVrBq/0p1fzgirNN
	6OZ4vkCzsUwejdtE0tUOg4a4P+7/JpMJ1NjVTx0nbJ/v5bvOjnpnEUQijqpnDx2egESQijscFOs
	tbZFmo7N7aAQPU09GOAVSBumpDPWQYj4zU5t5u4yhSHvi368/7myjBfhroGUsrDMVusozKpsWFp
	vgKQCXAovNe1UKbltSpeOkPun7cZADtw0Hr0yZuYwq0FhzSmS1ji5fnBDNuqJuvLYkUxFsEHvuy
	dQNEawLNsHCpRD5Vxk2KWA++HDlrufikLI7/+KyonE8onlYbbE33r7/hff+hXLEmwxTJ7W5Le3b
	FScnqg3gqEGwv+TH2CiVPUUugs57BY9eum1Z3vchUSxUgpWaTHp23MymwZRGYEzsHlGj3rodWsq
	Zo2Os8i1Qfxtw=
X-Received: by 2002:a05:7022:eacc:b0:130:68a1:a237 with SMTP id a92af1059eb24-131964a9dacmr2319214c88.35.1778086295449;
        Wed, 06 May 2026 09:51:35 -0700 (PDT)
X-Received: by 2002:a05:7022:eacc:b0:130:68a1:a237 with SMTP id a92af1059eb24-131964a9dacmr2319183c88.35.1778086294758;
        Wed, 06 May 2026 09:51:34 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:34 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:45 -0700
Subject: [PATCH v3 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-6-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=3013;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=ILf2pwIydtwuDQ5X6HEWQeN25aSDTWIBdHxlZSEskg4=;
 b=IbebwAZDe3/WVHbIALgXbGGemTnHIYrCW42lUXMfgvtIHnPIyrB1NhPmfWeN15joLVJk7yMAT
 fOvmpjx53IYBePwlVaRS9lVBgyTD570OGQ3LsPeHG5ZwvZxNM61tK3o
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb7198 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Xwuga8JxpJPgM73N45wA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: V9fq-7PmP7XOx3pEW_F4-32RRVFs4Sj8
X-Proofpoint-GUID: V9fq-7PmP7XOx3pEW_F4-32RRVFs4Sj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX3Ty7SE771I7m
 uCN+rPZTqBpZpfrgxwvAL/3U1ROsfj8EUoDHTNHp3Mj2tUui0gZqhXsDlGZ0Jvk+G2kmb+dfw21
 Eop9dzonL5SoYupSSMKkYkPMM3gAfYsV7MeTa+yn9I5ZOi8lu5QIme3qn8Btm3pjKnCF+CqqfgL
 dxLQlqjT0wINqavPfHFp2mR9wqbk8/Baz81cbZoOQvaAYosXcxvwNSOL0rz6RW3khZ8KIXxj1BI
 hvojowzdY50Wb2qpHNaX6v7moCnmM513zFuzW06f6CyqdF6QnCDaCzBc6t2MxW1D7fwZl+/NL3j
 SfWrXwmspPgiw46EPh7Ni9s+ds5PjZ9fAt3936qHqEsrxb3XWPWPZFV6/RNvh9DkKfutsFF/n8B
 bo4ALar/LOOWWuCC0aaN8AP8l+1/K+/Dom6XXzTKjdKjdxGNR2I1jQJ+mSFX/xbqPP8qivn5S6E
 wiIhVImnhM4n+mOqisQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

Add clock operations and register offsets to enable control of the Taycan
EHA_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d334492145..3a2157bebc52 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
@@ -198,16 +199,19 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
 #define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eha_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eha_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eha_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
@@ -246,6 +250,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 	clk_lucid_evo_pll_configure(pll, regmap, config)
 #define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eha_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1

