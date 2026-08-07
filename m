Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF9A453A26
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085615; cv=none; b=PWXLgSb31rg6AqJhbgFLa9wLvCVZA1RIFjXmYa76DbUk8EB1gGpR35ZwL24ygsVwZxdSey/CuzwdvNYhvDOTfMsSz+oIL356G9VEomSzJRpmxiW/M6qrr95fO6DVuWEAXFI1ibJQ241dDQQR8qMSNKY5iD3ybO2fwm/QtgzKbeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085615; c=relaxed/simple;
	bh=qWuwbIrQ7RgJGuhrwovJePA4VGYgHtm8h3XVOSoUQ7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUCbGQxpA4+bvgd6Acgd1HdYBjSq17Wy4uosI7/LPNVmS9H5GzlkQExlO5F0D3ftPjnv0gJ+pPiL/ls/96h0jmAY/N0leAR4koOUJgaXbRleB78MZe7PnFuCN9n+wdbNg4juG/UVXgaCCDRi3Bm3+Ffnp0xvE+CmXffNukDgrfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLcmWz2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exJzJ2c/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLcmWz2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exJzJ2c/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gma33822026
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 06:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSWYtsf8kz4OC4IWG7G4OxS5M+rGMhwAuutFaCEaOZI=; b=PLcmWz2KDyrqO1fy
	UIfWj3bnfpZ1XMaSTA0Kln4C1Gpgs77cRM9/jfF+RS8hT/swm40tBOtyPbby94oO
	rRwKEsr0k4eTBiRcwsDxSXB8n0HLH6NMNwz6CT+Mz3HHYiF6UeKnl7iqKhtRg0ij
	yvdw4905LUQPBz0CgJCTsHcfiVmv7lRKgkfwsBbYv5EnP9QhfL0etpZss1BEFpE4
	bO8rAREQI+79heSKL/kk9K+4zWJL53I5VV2dkJ5wYivJN2TXexlnchsj6ntsvMD6
	DZqbFfuHx3Q3sGrD2jeQl+5Y37whQlfIumP0gGNc59JmJKJIxxBuJcAel/WyDRfJ
	Olz1Zw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gtpsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:53:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848568a6f62so5120698b3a.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085606; x=1786690406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSWYtsf8kz4OC4IWG7G4OxS5M+rGMhwAuutFaCEaOZI=;
        b=exJzJ2c/vP2Y11NgSMqebTOv/uYdWII+mwRung48+PNcGP9lx7DQ1Ep7Jbm+ZN8LTm
         pw/BGGgxeFBcLaVfbepLczXmAT4l6OFa5jVzq0Mkg/3up9b5SUCwKlO75CfApLOncXvW
         K9Tg/Z9Kw/FVqHPAasz5/Znu18sdkwUI+ZUH7ChesKi+rwvoJF7QyRiVsIgo+XoQAmBu
         iuV5S7KFTlFAAuhCgSlfGD3NCSIeeQqseLROWP4TpFYqwYCpuAypntoPKnEvALlCOj2W
         MmEfYDxtpJE5MV1MKRoytc0iPO0hkDECDG9priTcGL2LkJ5bnPWr9W5zrR6WxuR3zKGl
         cXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085606; x=1786690406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSWYtsf8kz4OC4IWG7G4OxS5M+rGMhwAuutFaCEaOZI=;
        b=JksR8hZNZIoE7zz7BRqVduhKLPouzv9g8bFmLmYxARcOh+uQ5DUXEn3Euta2Hlbcko
         6X6vXmEAopYYXoFHBjDE6+AsArIPGDtZt3wKvfp1OvExw+f8NwS9tO+42dg6x+lxr+XO
         Tnds/3zEAZYzXI3aWAOBZxOUveTx2kAGotu+2fCE8d+vMH7JVwcrMD/0H8I2MBRguwaj
         kknTvB9Di1BitqAUn+45Ns36dMoOa6NTdx1fGA+gHPwgQsdD/oJAJ8M2iRJCd4p7Pos1
         HCWL3mGykoFrqb6pLtTmjTkOhOnJBfM1YSYAhTuqhZ7BYd6AU85xduoz0UlOoTVUuTbs
         PnUA==
X-Forwarded-Encrypted: i=1; AHgh+RrHca0PjallslFvXuLkWbZ4a1cLx/pbLC7zHpWdfjWUVHaIRVeFiIPfutQyImK/nBLSXHLAivbZR0z3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhzd0fECDZ/DyC0+7tlFrX/5sSXhUl7mJBEnyfOAEQOQCMUazM
	Kevdz4J/NXU/yX5APNXCDGbCUwIGaXXkNPfMPUOd6PU8M5eP+fQ6hTnbw4ZBOStBbD18qIJR58r
	fv5utkId57GYBxOpNcll9Z2P9aAfh+Zc+VRaMEzf2lDHGE3F8O2Mz9bdWLHFNI9BL
X-Gm-Gg: AR+sD10ZvXKvmqX1Em9BY5/T1Vf6y4DTsqfTHjxm0I8YZS8TTI08P4GriTLIuNZrcpX
	3b0SEpCNE6w09JXuO5TKWOgW7wg/B8XXOWOr/ktfIpD8Mtiu+E3LqUv7YQHIz8MPs0wF+8GVZDI
	lUmDNkxHxfI5bUVC8zozcshPD8auVbHsBg+TLJrfA+Hfedvjcvmj3KWUiuhLE+be80jEo9Fc5n+
	hbAd2GYsK+7OXcDwjIhgcce6Oz1725M2VKTOYwgGa64+xRgD5vPpdnMfpjj5H+TPHb6jn6SL1rz
	pjZq6RzRQcrCx12wj3ubgOEUXNYDBdd6YNNkG+v/GvUyGos0VeFyHgTyEv+ojgZ1v0Od8OE58lJ
	dEwPu6W7e2lqDnoyElMt5fKp/N0g2zRPh/PaTmrw9YrA=
X-Received: by 2002:a05:6a00:194f:b0:847:8971:87bb with SMTP id d2e1a72fcca58-84f2e00ea47mr19192669b3a.21.1786085605908;
        Thu, 06 Aug 2026 23:53:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:194f:b0:847:8971:87bb with SMTP id d2e1a72fcca58-84f2e00ea47mr19192637b3a.21.1786085605474;
        Thu, 06 Aug 2026 23:53:25 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:24 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:10 -0700
Subject: [PATCH v2 06/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-6-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=1768;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=qWuwbIrQ7RgJGuhrwovJePA4VGYgHtm8h3XVOSoUQ7c=;
 b=EESzC3jaa1DxBnT1Ykx8jPGSvZu5E4SBnVB8iZzBtY9PAwWBnPWf78FYVRThVFUXT7+L0V6/3
 cd5BI3Up7LpAdDmlKNOSA1G18sCNe6GM93Br9/JwWKqGGXDUfA04JCj
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a7580e6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mAYwyletAeVdbrWGRpcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: c8Km8GYLCEAQXFko9jKvDs3bF_JmqTB8
X-Proofpoint-GUID: c8Km8GYLCEAQXFko9jKvDs3bF_JmqTB8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXxWsfHDSXOhFJ
 sFxhHcTju3GLtIvShJG2aeRW5BUH70zgSIpQiUKxcFLYwU5KQFqIOuIe19SJmUyM4UhSymCKaWV
 /3NHH47S6V7muJLzNKeiWso/LbWsjSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX4Ui48fgtwFPs
 +/GiOfqC4i92si0S8JjcjOc5vVLAVPQbXpa779LSs9fgYQhMAqgCJiRKvPjI1s09Vjr6Yre3TtU
 k0lylvYYigFDzJU2BwLc21DIgvGRWjIIkT55sn7DDs1G9+XbinAcgRgM0mRl+h5c5SUgTJtcl22
 spsX0C3QzYeUKZfYSdMULMdfqz4rxisBgudKpeU5pyT70ukNfdd3tRs50U8dx4jeNY/MVt3sPpG
 Ef+fBQb+uMuo+clquEIKV80gDhWQEsYk3wrsFkbZXIwwkTSZlIHkVMjyBQFyw5HAx+oOidYmA7k
 2W1Y2o726WPtZ8nrarVyIp8bEcik/kIxr0VbVja2yyVFmJuRZJp5NWQzfjz5i+QbsDY+MCAwa62
 XwwFD2CXe3zzaRYlyOpqrUmHxooDjtTKgXT+eOAtQA5/+Xlp7sY7fgB4YXAYfA351Dnn9xoCxIz
 R7ng6KWp1gKGem8rJoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

The PPE (packet process engine) clock is derived from the CMN PLL
output divided by 2 and then further divided by a configurable 6-bit
divider. It shares the CMN_PLL_NSS_PPE_FREQ_CTRL register with the
NSS clock but uses a different field (bits [5:0]).

Register the PPE clock through the ipq_cmn_pll_regmap_div_register()
helper introduced for the NSS clock, passing the PPE-specific field
mask.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index c1b00699eb72..a24e57b33c6b 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -71,6 +71,7 @@
 
 #define CMN_PLL_NSS_PPE_FREQ_CTRL		0x98
 #define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
+#define CMN_PLL_PPE_CLK_SEL			GENMASK(5, 0)
 
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
@@ -90,10 +91,12 @@
  * enum cmn_pll_clk_type - CMN PLL output clock registration type
  * @CMN_PLL_CLK_FIXED_RATE: plain fixed rate clock
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
+ * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
 	CMN_PLL_CLK_NSS,
+	CMN_PLL_CLK_PPE,
 };
 
 /**
@@ -464,6 +467,12 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							     fixed_clk[i].name,
 							     CMN_PLL_NSS_CLK_SEL);
 			break;
+		case CMN_PLL_CLK_PPE:
+			hw = ipq_cmn_pll_regmap_div_register(pdev, cmn_pll->regmap,
+							     cmn_pll_hw,
+							     fixed_clk[i].name,
+							     CMN_PLL_PPE_CLK_SEL);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

