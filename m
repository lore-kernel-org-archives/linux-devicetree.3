Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA57E2D9EF4
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917319; cv=none; b=kgnBwmo/6QPmok8L0Zoqg0c4RmJWwEO1D8IbqHL/2V4U4Ol/7qoexfWJoEUWcaSFEPAw+BTjFt6ENXwvkCXUj2psdRkcawqgnLXmVezFqVe9xPOaxNvhRik3izYy3kIiEH9RtS6TlAmQatIxQhEuUne6SvoSYGuemlnSeIkKBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917319; c=relaxed/simple;
	bh=dvTz9pJnz/6yW78RczUv06dX5VWsbqoJiYlp+i0Azwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0cGaU4OhR90UzE1WUE/vCTxAzG7WYx92Wq8myTLgI3O9FZy/cpmWMyE8bzzQofgimyimhsDYUv2/aWxcHoWRaOxVJEPsVqxHBDXN0ilKMqA96Un/qwJGZozDuj3Gq4DOhhGXnzbohfOWkY76NhgXXON33GMED2hQ6Z0ReUf69Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfMjOiFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaytB8mi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfMjOiFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaytB8mi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UGYNkG4013777
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p56ol0FuHjmlarHhQHfqBzfwDmn8lvfqmM2KRXHkKZw=; b=mfMjOiFaAStTEIyZ
	AN+EEFYreoWuCSid0q9bqDblC9bRBhbuBpNPkY1pI2y1pMAR2vVlOpxhZikLXqOb
	Sg3ltiwy7d/B4XMgn8Mn2GUq/HQdd+g2g90WPVowYg4puXb9Y+Q+HvN5ny5iqQc1
	DtCRvMxgPal+m07zZc7/xc+DejjCTf9WM5zRmuvRyJ5iw3ORWcCuvOScZ5VUwvzR
	vPeR4xepml1fENk6dqki4mIO+00pQ4XoFCA+h+kvL5p+3mZoW34/x5Zf7+wwIh2q
	LIGrMyPTjRWII8PGIzyHo3vtwosV1qsVd3ZueIlsN36MOwG7HtjRl6FuwQ6Z43vw
	4CPRdQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regtqnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c5b48baf75so6785915eec.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 17:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917316; x=1775522116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p56ol0FuHjmlarHhQHfqBzfwDmn8lvfqmM2KRXHkKZw=;
        b=XaytB8micYFEAzVeVGDvJ0TyyqQDMG+FgBX1SvGZRNHqCeVeFZyG9vxW/d1sd6NAvp
         RBC0BjBR5e36lGQ7C71yN6siARMYU1hey5ZxO7UAwzeGhSrgoHXV4EY0yFqrzG183UW+
         UaIW0YphwVYIA/P+hbWbebhfgbHkX/Z8sZAiuMzrGb5nIK87u7eV1Se5KGat+LXv7a6T
         jZVAY6Z8dFdT/RmtOo7sVnXkaGJxyug1rhOIci9wrV47+MOY4pLqO2pYoTu6S3fDydQU
         6Kd3wLLK/lWLtJ+hPMaSeqwkQGTvD4uA5b6HC8+YgwVv28DcURllASD9TndoM0+FVXOq
         z4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917316; x=1775522116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p56ol0FuHjmlarHhQHfqBzfwDmn8lvfqmM2KRXHkKZw=;
        b=I5yKJbutIBn/jU1kww1j3a9zuYU4+lWDLYE4BNMBGaeIYXZn1ehDla8ueBbehEBzNK
         xfrpmi8rm1yooqpOqLv/BQH0P3lSVh9T5jCq08Lgaw4qqEWHyefoOFhIsTgd2Li7fa68
         Du8evrHjOHKz1zp2DpWo3N2jmQdOeA92IcAaQJ3LuwKvJsukqw9/jz7Hn6Kg3UIkKAkh
         ny3IdEDWV4HZIRfjHN9Jh5MU5JiXBWEBHRDnG8AVL2PaD5QupNsJnoyjUbBvStWTN2AF
         iHXJkxca1BllxeCI3lrFmPnYCzPm9BMWZtFp/DTouzWeSrwqtFuabuExP81Mu12bxkFn
         2Yjg==
X-Forwarded-Encrypted: i=1; AJvYcCXhFt0o+ip21vkAnQvO4SoFWQTXsRgNN7ReDsPcsG86i6Tio7NE3/kLibA5cX1nsZS7QIXGeKkaCYXl@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgrntL3dSot/lM1L89Tf0c5T97OH0fQOvp5dKMO4kDYAcOYOs
	WlrbF4xlRQjQrQYluTAiCnvoslT4SHJ9sbqWgqYxsnJ6YfRGcSlga/5Zhua0XFO+R56M6SAt5jr
	XalSTG0wIirg9FTVPPi7eVFRxLwvFHjch0oKXg5W1xY6syR8hfjYPsANkFM2Eoh6Bow1fyqAe
X-Gm-Gg: ATEYQzzYTAqUFDMkx5Dar8+NxeLGADWSPaXo5B/u9uvr8mpEN70KZ1XXmRxDdHlhUlM
	yOPG96P+6H//xH92ktzvEqxUgh2+S4LPWRu2iqa2nfGm5NVKWSxY2oSEpZWMA8XAv2Q4+gbsIvH
	uK87CEXzwpDrDOJV6IWnOiaeemnezmp5qk4PMCR4NDI3iX3sDcOThop+DP250JzC7fD1zz+7+s6
	47XKyNIouV2OqtqQtbDHk4AhWnvZ5rZ44PjWgbtZ0ormu/B9hXrQlC7ryVh3yjvcw+ndKTQhCbl
	hv0RHwBhvilTNGW5vCch0Vq98ob21iv33mf3G3Fa2QyuwVxnJoic+rdV74vTVClWn8G0vEUOz3t
	Kr35YG2I3Vq/bO8Aqo4OjLt8TOWkPSEtC3dx273if7itohcMHqRUt2++PJuBofol4Ie/uqzbI8k
	BB
X-Received: by 2002:a05:7301:1294:b0:2c5:76d1:7f95 with SMTP id 5a478bee46e88-2c576d1bbaemr4673543eec.28.1774917316062;
        Mon, 30 Mar 2026 17:35:16 -0700 (PDT)
X-Received: by 2002:a05:7301:1294:b0:2c5:76d1:7f95 with SMTP id 5a478bee46e88-2c576d1bbaemr4673522eec.28.1774917315528;
        Mon, 30 Mar 2026 17:35:15 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:15 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:35:01 -0700
Subject: [PATCH 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T
 PLL
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=2840;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=dvTz9pJnz/6yW78RczUv06dX5VWsbqoJiYlp+i0Azwc=;
 b=aN2dhRKbA7AEXirzTPHtVQQAafPxYBZake1aRDjykgzIB6yHNYW9QBB0GvKEag88o8d4lgukV
 /A8VHH9ZaHsBo4lp/GwPDMedg7XBLjXFKmzZt/VYuDxJcRbBeyuzKlr
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69cb16c4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Xwuga8JxpJPgM73N45wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX3IXTrt1QrcVM
 HJbp3H/16xOx5ke+eVkTzcIC+pEk2W6n6y6UoSkZTHUR4LdRdUyQu4YxZvgTAV9RIk/4gabyO8S
 f6ZO55g0g748aCJ5Sv0TNiA+a8fNoSjgctf24zNkNDZEpR8AcgOmSp4StzX4cnGGzzDhH0UoZ7E
 9jzH8E4d5SHGebOTc5IoCF8k6MG/q/PLiLYRXbDiZcMw32F6bm9LG4XqhoA9q3vePFNVxm6Z12/
 Zz+vdnpjgozlsZCQnDHAFGtuLFqaJesTVE/vtBQdWhVIcbozSOPp7F+Kq21HaKguwr64j7JS0V9
 d0Q60uDHMVdqG+gdbDPK2ciYZAB9dO94L4BgbckcqjHnJfCDxE6j4MevGc6h7LALfVQfY2gy8gh
 xZQSRp88SRMWdcxPj6BIKZI7uRdzQ+F4LIUZwhNbrPETV36MNG2BrwlUJnnZm+7hyMY31Rgb4Rt
 DdpcnGEi6IBw6ygOvtg==
X-Proofpoint-ORIG-GUID: KDxoV1p8OS-49nNrw14R0QcljooiX7Dj
X-Proofpoint-GUID: KDxoV1p8OS-49nNrw14R0QcljooiX7Dj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003

Add clock operations and register offsets to enable control of the Taycan
EHA_T PLL, allowing for proper configuration and management of the PLL.

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

