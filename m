Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DCE4C6EE1
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328603; cv=none; b=CHSnyxzSx5FxNrslI31roEQYDD1Bvo8iOjeWZsOH5+jAi+ZjA3aHXmWVoOJPNnEKIjI2Cy/cjj4SHpHtJ0jZ7+UGp48HjMZY1D64/XAqCm1mEnOkBmgBp8u06oR9M/tHrYRpqOfFbXeRwg2PEk/Y3PLCNz3nQiXnyz+I6B0DKbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328603; c=relaxed/simple;
	bh=IARJjUuJ8TzYCPtgJnhyF2BzcDD2X/PGevklk7LPqgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SRPtQmgVDs/xC+y+MbpMPLedfLEv+8Wi3fwGSM/My8l64TpukQ9aR42B/TVnB2EJ839T4a9yRDKTWKx6FRw/c7XdqAeiAHX0/v64CNWm2ddIjbwJh6R4LwWb8N9THaJAHluLSIL9sdEpDxD7YWc+QUMiVPFRsFtjrZAus1or/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exBzJcqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fohbY8hm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exBzJcqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fohbY8hm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmSfp2856427
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=; b=exBzJcqaIq9wwJQe
	NJ8C2aFeQTxEGuDq7YswVucBjbLHDdmFjC1AfQxgqsUIGcF6vVFpAIR9kSgyIUFk
	54HOmMzRJ9xHx+4aXiJwriH5AkCH0LQq4Ew8elrF4OMPGBt4WLLYteQ/HsXuJcjT
	VvULgHyzz6f549pvkP8GcgP13Ga3zM4cYSLlR7GNTvx8aiS0+Q7PpORDvGvW/DlS
	idYctx8WvLfQxJXqAGzkiqBb31VazanhqqCYwOBTnVqyBT9oAWjTVq8agDWrPOKW
	QiD02hD1AMdWlCtT+SAqCu1JPnG3te0l3ItQB2jOxt9JHerXKxrNHK3I9V3D21DZ
	c4GRlA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddjdn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:09:59 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-49aa4525b82so1779792b6e.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328598; x=1787933398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=;
        b=fohbY8hmtSosH9P1j1nS1Y5zmj1sarFNCvftPzr2XRELqnZLFk/tnwKLbH+Q6TvgYo
         EaPK1SoUkjfa3XJ3ZVoHcY0o0oKc3bwedxiv9TEwriNSCtyK08id/6CVio/fE+nimXf+
         qmV0mOxwZaR4lCe0zC+wVtmgwYpDGsApSutAisN70QF+CFT1MKhOoApxe1gdBCVQB/9L
         m0Y5OV6E86z4x6pMC1maElad1CUzWejJ+1exKzomi9iaBIAV+RqUqE4aQhJdms4Psai9
         eJE+WCaVXW0vrZVwACdqKLd9ofLEG9L9+k4tpbrRWtoZgcao3Qv/MdR4w2mj8hiHcJmV
         w4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328598; x=1787933398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=;
        b=gGIB/gw6ov7MMjuDTKB2BgdbMVUd/p/i7Zj+FQYduA58kSB6GuSoMhqyTx97nZ9Xnf
         UKonm0jqH+O3mmWF6vYmceuzDbaDoVtD64aZxC3Mw5WsutIM9fISm+LKhQJvx8an9wuU
         4HxEUtkWtVp5N7R9tE5SRHsJFGqnoYjbaolT1Wf7Zi1zmfEFm1fazNj97jwAHjB2LX0f
         jP2mekuDB42MxcJTkznJL6nl9xp+DnQy/TnBG0RAQVBbI0F3ya7d82rjxNi83j7uyqap
         DYr3MKJ0t3kYbiAEjjwwWPO9fCnUpPARV0Wf/lxXIOmGumWEYdEuNx1Aiho6oc8ffJ6j
         zGRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKO1FeY8b/pTWrftIaACofrVN/UvPlnz4lMACtGG7H6yE9TDTd0xfK6FpVwrNM+eUYLDPsuPk/irAL@vger.kernel.org
X-Gm-Message-State: AOJu0YzihMb8ua2uReYBykxNKL3t4mZ06Od+o+SscC0TjTrymLGPjAFJ
	WRoavjfNRwIgxm3ixplsdrvzuXreNLbKajIcgR2uOgE9uYd/Ij0TpUmLgxh/3RTIT780H1bhGGA
	H7iLMzVteeKGVqJWzdLXXA6eCDk1lSqMF9ugEtxfbXR2qkVfZNAiqYqQbqaAYBQV9
X-Gm-Gg: AR+sD13kKOuPQMSe2mKMkUbQsgAt9Ov99ysdAMIsLrD587enkzdI0pnd7N8UmSRPlef
	kc/soY3AVr24l/9ZvuSUj3aBJQ7sgjcllk2io2L8ZtDHRUmpwEPvUdhszHzkDudMe7hpSr9SPnI
	v97JQ0LpDma2GwSv//6tkKHr2szEbQ6a7aul2ddq0ax4MdWil15et0oz6gemabBvTFixER+SuXV
	a4lwITbxq3UWHdXGsaMceCKP9qKCNJ8tNExV8NbLeE5ZZjaIYFZGBcuEgY9IugHKkptqBMqPqqF
	83z1oc/C/uB09PpFUtjyID1wdMJXHRTaw7AHvCDTiwKQ0n8SoOSYzA/Q/jvbaBuxSqso6rZ5zRh
	1goqC5pjk3xkf4YiRIGLZTjGNrdf8KlrYTsnWRBMTluIGN2SA3s7C8/K6VizXOTPuLy1UURtFwq
	FHGbE5Zw+TtDj7LaxSeHas2gE=
X-Received: by 2002:a05:6808:c2d2:b0:486:4892:d553 with SMTP id 5614622812f47-4b2eef57c60mr7714245b6e.0.1787328598423;
        Fri, 21 Aug 2026 09:09:58 -0700 (PDT)
X-Received: by 2002:a05:6808:c2d2:b0:486:4892:d553 with SMTP id 5614622812f47-4b2eef57c60mr7714168b6e.0.1787328597957;
        Fri, 21 Aug 2026 09:09:57 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:57 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:58 +0530
Subject: [PATCH v3 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=2081;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=IARJjUuJ8TzYCPtgJnhyF2BzcDD2X/PGevklk7LPqgQ=;
 b=KmDwPQXORl1Ra/lOX6PTLp4448/qlVRagyslHmyTMRKAmZ2TjRjYeGXCKrSJhH8L1o0oYoqcg
 mL+qVKKxt5UCvGeiVmeELj3lxlLw3pxFMOsKUgQ94CFkDvv8sp0mfH7
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX++Ne3mhou20K
 lfQn1UJXIMTNS/toD1XfS3dAymy6rmMQWYs/TLW8WbfXfWVC96500kg8jskutobKgHejSnkOsvn
 dLuFcu5uinh61BQTVhpxIyQent3T22c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX7cabLA527AGK
 l99PFGDM/vg6EvyOpZti5te/t8+sQB5KF+NHcdSQDg5u4lYpHDMdFMiJjisZ9nbrpFtg0tfmP7g
 J+mvfwXqjod7NcQKeDUpb1sraNUOEU1iX/F8Lo/c+t636q81DlgVcOkXAFhbENo4r0TTk8WuckD
 hNOgS/zdTmCSwGkvQ2TpohaL204wJEb5qlMFApknVS7xRQQuO9AIb6u07TXK9T+6++nfvNbWu9i
 FMin5f2uGRg7LzC7Chfv4pOhyMnOATgiIGLI6HAmOLXpD5t/ER/1uzCgckiuhdZ5sbWdeHNj0nA
 BNa8h/iM4fo1PHMMaQYzO0owy3sbQsZsGfQQpcRjNuRWn9En4iB9Ms7stQJz32xkJnBhQDm6Q5R
 dYlgFMkaqHUECpuBFWHmtAo6OAoJ5frgc6ysg5eKSO6ER0jvxB37JdWSw9co5gH6BGbQk0VG9Pz
 aW6X8dqBL39K3C8JPYg==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a887857 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: KpbV3S9k2CjzRu0I2F82-gvbTjDJRiAr
X-Proofpoint-ORIG-GUID: KpbV3S9k2CjzRu0I2F82-gvbTjDJRiAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6367b2a5a4e0..d8c3a6b12d4a 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -943,6 +943,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *kuno_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kuno = {
+	.clks = kuno_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kuno_rpmh_clocks),
+};
+
 static struct clk_hw *eliza_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1103,6 +1117,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0

