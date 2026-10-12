Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997E5363C5E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812061; cv=none; b=owgn0qH6AHJN1NZl6lS9IIj/Xv2NCGteAg7uhMI7HdQ+J+1BIqRk+ZR/aUSFST5AtTHGJ7dDgkmcZ3+QeC2UAzDgt3JACp728LIO/OJVapVzGrnA4SEsA9gs7KjUD8iFjPDtg+defO0kuI7oWqPurWrXvYFrWtffcMG+vXURgQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812061; c=relaxed/simple;
	bh=AQuXFsW4tNdVlh5swpJRCxyG6y9zl4i520crN6qxLqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDfiicPmCjORotamQ8WhJI7/OfH1AMojACT5AGdz92dvPo+odnT/2TpJFt9tacA4ccl3Ti8DToVTPaFptLUpWBbEtIe4AtOyHm/2O37ZO4bUjjN2DyYjc1ipL65L+79n0yTrI1Pkd/CRMk9vGLJZ1gVJwILqBt0LtkEJF1Rz0xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpOuWOIZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGFfxO88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpOuWOIZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGFfxO88"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07MT1933170
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZO9HNLLNqcZbFHntk3RATNGGcfmE74k0W1y+uxwR6k=; b=CpOuWOIZk9ag2DlI
	cALe4RDuNCgZqete2ha44vZAThVKLX4mveYdEk9vKfmSsVeoxt1N1WgaZf4xPCer
	xpzexobcirKwxYCEFUI6HDs9ym9oXuKMST26S3QG4KhEDJwccHcxk/UB3SC5j9SK
	AGaZmSHCak83GnNcP4Xxx5Mc9xqkYF897lCTagUU1/2GNl9URFqW6/s8wpnVJ63h
	w6ZMYIwtKeCGNH/siQ9t4o6jKggYtuvOrBQGWrWvzo/pr4vd8ndoq4vJrEhDHDAe
	CjZW0Ifu8OMLLdudkT/Ls08+mPKSEYi+cuneZL18jY8qyq42uc9OKHwgnSZX7sOc
	EZ/dAg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjdkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:34:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso3169565eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812057; x=1792416857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ZO9HNLLNqcZbFHntk3RATNGGcfmE74k0W1y+uxwR6k=;
        b=aGFfxO88VBvZFCJZ+0O/aUQuFHep1hgkoN7eGjJg1eBk3CBuARH6b+5H9moxoMIhW0
         6CBxOw79g0OUwHJJx+1F1fCwbG1VgE/GwPzOGIcRCZpgYml6AkUzLA0BVeE9IKHBie+g
         GsNgWtqRjqq9YHpyfL7zjeIMJhF+/JPKW7pWW1Eps0H94bJxjIGeJoI5YWDGAQ6OE826
         vxdp8cRoimu3GI6J42+MniHKRjqlaiw8NwXDq6c82XS7snMrFsjucpevgKWXMu2P9uIy
         N9uhbB4+mPUtwMxkeeOJfu5Qrjvsmhpq2HLJONl1XkiZ+icRxy/iGNzVaqqIq5siq6j4
         OA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812057; x=1792416857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZO9HNLLNqcZbFHntk3RATNGGcfmE74k0W1y+uxwR6k=;
        b=iVhUiT7tGO8sCv4hDngn+ygJIeSiNrwn0j8C2lEpnWfqcE3CcwJO2SBzRPeztP3yWC
         121juuN4arR52zb1SZKD6ZEWCxALCP5oAIr65SyhICCv0va2GR8g25ekfANDXptuHHid
         e3TyXoNFKoM3uTnorILbzgffU2/XFoc2AmjT2Y4G5mYpGBslE4mrE0LBTfc0RERvGtsA
         FRaIYDhPBu0wFuFKPEWFSE5EPcie2yjGfyujAtSqa1uPDXH9WHfi2V/if3mYC/GT+cKQ
         X9djnakSvkQhCW7jxYnuM6+S/Glqi9ZKs7oBAuudDQa5SOQvDcq13KaUiohKEOejLIf+
         l9hg==
X-Forwarded-Encrypted: i=1; AKwUvBzccUpVJ7ubMAe6lz3UcH77fumYjqg6cYdGoGlDAPGE1dIAmferqU2zAKEQetqq84/p9bhtIF19YxEI@vger.kernel.org
X-Gm-Message-State: AFq9FYLEK8vMg0pFeCVt0WZT/vhjlPicSodzIsMyP4Mlh3O3whXCX7G5
	YyEVxMsM4VgM5Wld4Npep4URTP+cbmn73ujH4HbFl5huFTYHx49U5FGQ8+uj4QbY9a0H6RXcUol
	2SH4+LHfunsJw3MoG+yjTp4/xUPud0GaMSWqUnhgBfc7WNdrhtqpTBN1gLWA7WGrQ
X-Gm-Gg: AYBFou2HLc9qcGN2wkgS83of0qBHLAZYRRYHAB1JYcslWBiHEJ6Mkqfv2SQVNjQ5v3+
	+NIminaIZYdUBUCmXWPaxoeTYq3Q3owP+rl/wJyWUgdUj0Q5s1KUI89QhtPN9kiuPlQjQXlBQLm
	StiU3zPWLueCQDe40WQO/YWXLxbzRnn+H5fIrMJoiDh7Vm3a0I5GqIVcw2VGTCN7KD9ypvNuKeu
	bjTf21BW+4Ywd5iISikqeiQQaE6uDG9/34lujB03RDGHTLwBZ4HElt4NeNWStiR1ygFbZbG9vzC
	PnXlvZfnLgaBTjkGNE0IhsAyiCwUnOBQ7FXBwy7BxIQvZRT9Y+3DPP0o7BOYGaPsygyvu5VWlVx
	Pc/WqCvUWlwD7wOJKqoXRnf3K4o0=
X-Received: by 2002:a05:7301:f24:b0:351:595:750b with SMTP id 5a478bee46e88-3537e2964f7mr14905710eec.36.1791812056988;
        Mon, 12 Oct 2026 06:34:16 -0700 (PDT)
X-Received: by 2002:a05:7301:f24:b0:351:595:750b with SMTP id 5a478bee46e88-3537e2964f7mr14905657eec.36.1791812056418;
        Mon, 12 Oct 2026 06:34:16 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:34:15 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:21 +0530
Subject: [PATCH v2 11/13] phy: qcom: edp: Add Nord PLL configuration
 callback
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-11-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=4783;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=a5XRl2SA0hyveR2kRhO0hXsLMrPVZAn2FeKG/SbK1s0=;
 b=MRmRCsYT29d/XMuAeE3OCY6Sz58JMZtl8zQgVvmaVSzML6Ox8JKoC/1kMoc5vsqlDzaQVZPML
 6JtvlNFTVpQDqrYRinG9QIqunEFz0eXzpAhz63XhsYsU5gi2wyPR8md
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX6Tn1v0aS+n76
 MVQy5KCaIc7fWFPN6NzyFpzjYjrlvN6UEnmPVpIHLJC4gbCjCGcUrEMCV6nwUitZFRcGYV7rZ0b
 tEcW/f0IKq+Zb9rdBMHLW9CZAxT+toFkTmE8F9DomWPqSxlno8glnzaEzDSN/tYhcoUOdxpPEKn
 5Q0r5uy520CSwnRoOa109eJA618Py9zqYrsRiTBLOyshuvxIUgkXnaa+15yojeVmhZPjo6Zug0w
 g+Ploku8Kakv9VNPO2kGqMc1LYFKy/2sJbaL9z27EgiEcxRnf8/+nPc0L/LfF0xUcuovkLh0oAH
 k0KK96kVwci/R6/Q/r2M6wTUHsgswqAb0+RhUD8UUNZQcElhhTiRMYIzV/ogeNmtY/XwUm2qqVU
 biXLzGifWXeNMUnimCQuTcOKz11A6WVaBKdWsqK8uiVtl3M3+dLlnP4PABLKqdptvLAMp4mQwak
 OO5xpDOPBEsXDQyAR5Q==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acce1da cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PRaozp5Bz6Goyj2T3wIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXwXSiGw35wD/k
 AKk+BT8X/1YLPvPqvM3qLknfPm9F6PoLZ73icxrC1gmjEfINxF2KcDp+ZiCqANVqrUPqOy6maDX
 6wgUM1/AbJx02HDUuZ/la571NzHfVCA=
X-Proofpoint-ORIG-GUID: XGBB3iiV7aAn-wFtVI4nKOwa-Zy-mA59
X-Proofpoint-GUID: XGBB3iiV7aAn-wFtVI4nKOwa-Zy-mA59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord uses a 38.4 MHz CXO reference with a different QSERDES v8 COM
register layout and PLL coefficients.  Add
qcom_edp_com_configure_pll_nord() which programs all QSERDES COM PLL
registers with link-rate-dependent values for RBR, HBR, HBR2 and
HBR3, per HPG Table 2-1-d.

Assisted-by: LLM
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 103 ++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 66c31684c48e..3e857d105668 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1638,6 +1638,109 @@ static int qcom_edp_com_configure_ssc_nord(const struct qcom_edp *edp)
 	return 0;
 }
 
+static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 div_frac_start2_mode0;
+	u32 div_frac_start3_mode0;
+	u32 dec_start_mode0;
+	u32 lock_cmp1_mode0;
+	u32 lock_cmp2_mode0;
+	u32 lock_cmp_en;
+	u32 hsclk_sel;
+	u32 code1_mode0;
+	u32 code2_mode0;
+	u32 core_clk_div_mode0 = 0x14;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		hsclk_sel = 0x0c;
+		dec_start_mode0 = 0x54;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x06;
+		lock_cmp1_mode0 = 0x37;
+		lock_cmp2_mode0 = 0x04;
+		lock_cmp_en = 0x04;
+		code1_mode0 = 0x8d;
+		code2_mode0 = 0x27;
+		break;
+
+	case 2700:
+		hsclk_sel = 0x04;
+		dec_start_mode0 = 0x46;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x05;
+		lock_cmp1_mode0 = 0x07;
+		lock_cmp2_mode0 = 0x07;
+		lock_cmp_en = 0x08;
+		code1_mode0 = 0xf6;
+		code2_mode0 = 0x20;
+		break;
+
+	case 5400:
+		hsclk_sel = 0x01;
+		dec_start_mode0 = 0x46;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x05;
+		lock_cmp1_mode0 = 0x0f;
+		lock_cmp2_mode0 = 0x0e;
+		lock_cmp_en = 0x08;
+		code1_mode0 = 0xf6;
+		code2_mode0 = 0x20;
+		break;
+
+	case 8100:
+		hsclk_sel = 0x03;
+		dec_start_mode0 = 0x4f;
+		div_frac_start2_mode0 = 0xa0;
+		div_frac_start3_mode0 = 0x01;
+		lock_cmp1_mode0 = 0x17;
+		lock_cmp2_mode0 = 0x15;
+		lock_cmp_en = 0x08;
+		code1_mode0 = 0x14;
+		code2_mode0 = 0x25;
+		core_clk_div_mode0 = 0x0a;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD);
+	writel(0x0b, edp->pll + DP_QSERDES_V8_COM_SYSCLK_EN_SEL);
+	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SYS_CLK_CTRL);
+	writel(0x0c, edp->pll + DP_QSERDES_V8_COM_CLK_ENABLE1);
+	writel(0x06, edp->pll + DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE);
+	writel(0x30, edp->pll + DP_QSERDES_V8_COM_CLK_SELECT);
+	writel(hsclk_sel, edp->pll + DP_QSERDES_V8_COM_HSCLK_SEL_1);
+	writel(0x07, edp->pll + DP_QSERDES_V8_COM_PLL_IVCO);
+	writel(lock_cmp_en, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP_EN);
+	writel(0x36, edp->pll + DP_QSERDES_V8_COM_PLL_CCTRL_MODE0);
+	writel(0x16, edp->pll + DP_QSERDES_V8_COM_PLL_RCTRL_MODE0);
+	writel(0x06, edp->pll + DP_QSERDES_V8_COM_CP_CTRL_MODE0);
+	writel(dec_start_mode0, edp->pll + DP_QSERDES_V8_COM_DEC_START_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0);
+	writel(div_frac_start2_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0);
+	writel(div_frac_start3_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0);
+	writel(0x12, edp->pll + DP_QSERDES_V8_COM_CMN_CONFIG_1);
+	writel(0x3f, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_MAP);
+	writel(lock_cmp1_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP1_MODE0);
+	writel(lock_cmp2_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP2_MODE0);
+	writel(0x0a, edp->pll + DP_QSERDES_V8_COM_BG_TIMER);
+	writel(core_clk_div_mode0, edp->pll + DP_QSERDES_V8_COM_CORECLK_DIV_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_CTRL);
+	writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
+	writel(0x0f, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);
+	writel(0xa0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE1_MODE0);
+	writel(0x01, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE2_MODE0);
+	writel(code1_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0);
+	writel(code2_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0);
+
+	return 0;
+}
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

