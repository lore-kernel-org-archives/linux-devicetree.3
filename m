Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC40E2C21DF
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325801; cv=none; b=jKMpvEX+JHtE30sDtojnQCXosTQhHzHo+olE/oPbAkOUm0jbiGJi1CTz7UT4dpuEQnT9t8RXdvdQA2oyGF8DjITnle0/6eIZjtxtwAkgP4qSsM6UJDphEWHLOWWn4eKNa64hJdvFqJQAecyTKFSm7Y2qes/kjzHQN/gTh2z2jp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325801; c=relaxed/simple;
	bh=RFXz2fENqdLVWccMwug3ybapgQvtvrvDR4bLa4G95Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEzCr/HYn7TUWJN8cPEBo7Gv4Lrcscs+kTiwF8Pfd8n7NIMJktto/VkzKc+3ZxLUdkb1lCroAvT84BCXqcwUf60Ktsrd+HYzIa1Hg7KE/noaGQENWxCVD/G6wVR1ZdbTisT41xKmNy9hr2lNrGsc4oZCZ5p35RNJMti7NJVRs6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeTJ0U3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3yvDGuA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeTJ0U3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3yvDGuA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KJ5XJ03084910
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RAFhQHBj3Lj
	iJryw0ojmCoWQ4BfJtI8S4Cf5s+zUFFQ=; b=AeTJ0U3lg2EM6QPLXxU6coHV1f4
	ecTy3rgtK9Ufuw3WIyRN2h9RxTGviqISV83pGohZJOgSdKohtUGKqlCwDfiRqOCO
	/I/8e9JjxyhKzTUtDYdGhees7Oj+g8RzaYrYkfpk5f+c/luRyjCqtVgnA0tcDdzE
	Ln4F7zwrFjFP9TypYSVp6LFZGvUnEaRCRP2qfyk2pd/I/ig5H23hOwG/lp2OCNUp
	oQlz/nfC9KLaGnS+pfrZgVZxEY9dmLVvLdjuG3J2X7QCexvRrMf4bJEd2euCyLvR
	/R3fxd9Hg6QK4IkSidR5DjqidFiQwT8sYzW73ooL2/k9vIXrmseAf3Nx5Ew==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f2xf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:09:57 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd726a9569so108718137b3.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779325797; x=1779930597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAFhQHBj3LjiJryw0ojmCoWQ4BfJtI8S4Cf5s+zUFFQ=;
        b=E3yvDGuAH1Ue3g4E0wRZfb6NM1cOBIC0Xylzs7R4EqRLaEtTg47GVKje9bZ0D2awTz
         lWMLq3b2GoPwMbGmHXLdwfgubRRdpfjRDLpgVKOhiWH/BvSNK5wUejp6oizbCNzmgI9/
         iiLIWrFkCFbjfXsFOhYVfuKeD7cmBO4/9deapNIRH5zPmJ+eI6WAR7QBEQSSYqMOZ0Y2
         jA4KsGklmunOgRmOY+dP7hmf9iR1dZtkBIRlxWcTHuVu+D2j3ZBt0+l7baXujBqxXbQi
         SY+NAarOJ+D1EIvpm2hC5hx63TK6vCso2H6eu9p1hPtUu+pW0gVBKd+3cwd0S69Gx3dL
         EcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325797; x=1779930597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RAFhQHBj3LjiJryw0ojmCoWQ4BfJtI8S4Cf5s+zUFFQ=;
        b=Ul7m49vPqpK6DPlbcPXqIwUsYTQTB6lCJsoYCorw85IzeJj9+sd5ViLPa2UVnKBCsB
         +d05tUCTRkxfmbFhfrcfHpRmDa2Lvrc9ULblmUj7L3T5F9BKH6p0ijxJ7U3Mny8K6UXU
         EX1o6V4t+FfWlHslPuNvKWXY6DvqOLEQAQ0oejdp+TBmhje8mDvqM39LdEteYgMvXC/t
         5zcK6vQsCavUULJAobMRAhdwVN/qQrvVrCXirEgQ+RTm0fI12vbk+E7oYnvEWK00EgJK
         +7SXzKXkCYBoImBBmaqoqzcKdm7cGexZ6vxatWSlDzBZfcQkAd+IANk1fFpWyOOp/OoC
         OoZg==
X-Forwarded-Encrypted: i=1; AFNElJ+6BQmAqt7XeZ/BPlHpuNzRamguvanSEqwW/o/yMTBh8txTZUzZ8NQLq4oxrBwcl6EgMG1IpuKC8ycS@vger.kernel.org
X-Gm-Message-State: AOJu0YzuqrJL7wKTyAm0YZKMfsHDBaCr8hfTfF7Qt8C6QqqZhG0nSeyG
	h0ZhYo8ppO1Ie1rWUAHJBO1DpfEBAJ8khRzHLCEZ3FL0mYgu9L8H0Xmz/JUBqQkM/RSsoWv0kP7
	CcmeyQh89vLLnh+kE7VocKyQJeTJFuQcZHlNO4N/uEXLpoUwYkEwVofTUefBe8Clb
X-Gm-Gg: Acq92OF137kncm0T1lCS5Eb4hgBc0ApiqG1CxFWDmL0W2wamAm1oJWjL4ZXIpTMhY7J
	Wmd0pKqhXC96wOdOk7laIJEh1XUognEH4qS1cGSgURnur4Po2Q3ouNum+bS04UX4TjLaTgVDEIz
	iRjwXL1MSHcBNNi8FuxPwyPykwKhZiJYaFbIaqcOku9147qdPfdL6fCChiM3/9R984mYmhRNu8Q
	Y4UXCirSTlh873tZes8rhj4tPJXHcHLjpCrUZ8D7p63PDYAgh8bPY5SL/NLeIWvDld4S7S5Lt5K
	oE9Vb1o0znWBnxDMl7YaqdyMhYHfXXIlbkzusszxamlbsoxEbn5iZah09tMd8XPU48M+vKRnGli
	42E4uy1xKbP3/qE0gcBCSm2KUeTrxUb0c4vyhmEmDA1Y0dADwJjyW+C6BcsPE47AP+ej6KUdAln
	XvpEiA59faZq31E+4=
X-Received: by 2002:a05:690c:498b:b0:7cf:e22b:fc49 with SMTP id 00721157ae682-7d20c047039mr8476517b3.31.1779325797076;
        Wed, 20 May 2026 18:09:57 -0700 (PDT)
X-Received: by 2002:a05:690c:498b:b0:7cf:e22b:fc49 with SMTP id 00721157ae682-7d20c047039mr8476247b3.31.1779325796610;
        Wed, 20 May 2026 18:09:56 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60851307b3.10.2026.05.20.18.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:09:56 -0700 (PDT)
From: Michael Scott <mike.scott@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH v2 2/4] phy: qcom: qmp-combo: track whether the cached typec_mux mode was committed to hardware
Date: Wed, 20 May 2026 18:09:33 -0700
Message-ID: <20260521010935.1333494-3-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0e5b65 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=GhrnwN_qMCjkbgjgO0kA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: qKJcdv0tlkE-KGjGAGkUt6eJ8UTmvH4D
X-Proofpoint-ORIG-GUID: qKJcdv0tlkE-KGjGAGkUt6eJ8UTmvH4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOCBTYWx0ZWRfX5/sth8t37156
 0rI5T2rw1xo0W+espq86RGSwjGFRiLC/CqD5PmhRFQQJF+11pgu6qFvxX9w8+T/uZAmtvQ83rYK
 ckXUVwCDzeWDvHQqjHdgSExuxCbYUFc3j6vUCDpda/5CXpgfCHEsIClGgr+TkN7utLAvcsbzxa1
 p/NYvEAE0ebkvpnleLEq4W8TV5wzZJMsyzmsJxy1BU9y+pcjhA/Ybz/fpimXGWl3Gulz0mkSKbj
 1UXNupwliu7oV8lO+YRCxBjgBhUdm8eAIy4O9JF4TMhtUOUCqAcUVnQCZ45bbglp89l9GgN7MSA
 wooK5/9L1rlnhQFOpqXd4yuGhtUx/TCkK3bsvlw0JwcTd19eGKNWbfvgLp4nZNQ3/R3UlbK03D6
 MLCd71yGGPhUrhzhjFsLNKBbCS1o9dlcfuQTxxohy9WEl7OibukBBI7Z7bE020cudE1HNSNPB9s
 leI+usNFDciq2WMIeYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210008

qmp_combo_typec_mux_set() updates qmp->qmpphy_mode (the cached state)
unconditionally, but only reprograms hardware when qmp->init_count is
non-zero. If pmic_glink_altmode (or any other typec_mux consumer)
calls into the PHY before DWC3 has performed phy_init() -- a real
ordering observed during testing of USB-C role-switch enablement on
Snapdragon X (X1E80100) -- the cache transitions away from the
probe default QMPPHY_MODE_USB3DP but the hardware is never touched.

Subsequent calls (for example on partner detach, where TYPEC_STATE_SAFE
also resolves to QMPPHY_MODE_USB3_ONLY in the !DP-SVID branch) then
match the cached mode and the function bails out early with:

  qcom-qmp-combo-phy faXX000.phy: typec_mux_set: same qmpphy mode, bail out

leaving the lane mux in whatever configuration it powered up in. On
the Dell Latitude 7455 this manifests as the SS lanes being left in
the default state when the first altmode notification arrives during
DWC3 probe, with the function bailing out on every subsequent attach.

Track separately whether the cached mode has actually been committed
to hardware. The bail-out optimization is only safe when the cache
truly reflects the hardware:

  - qmp_combo_typec_mux_set(): bail only when the cached mode matches
    and was committed; clear the committed flag whenever the cache is
    updated, set it again after a successful reprogram inside the
    init_count-guarded block.

  - qmp_combo_com_init(): set the committed flag at the end of a
    successful init, since com_init() programs registers from the
    cached qmpphy_mode.

No behavioural change on platforms where typec_mux_set never fires
before phy_init -- committed remains true through normal operation.

Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 25 +++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 0db200292642..e28bc1cc7a78 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2295,6 +2295,7 @@ struct qmp_combo {
 	struct mutex phy_mutex;
 	int init_count;
 	enum qmpphy_mode qmpphy_mode;
+	bool qmpphy_mode_committed;
 
 	struct phy *usb_phy;
 	enum phy_mode phy_mode;
@@ -3754,6 +3755,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);
 
+	/* com_init() just programmed registers from qmp->qmpphy_mode. */
+	qmp->qmpphy_mode_committed = true;
+
 	return 0;
 
 err_disable_clocks:
@@ -4509,9 +4513,22 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 		new_mode = QMPPHY_MODE_USB3_ONLY;
 	}
 
+	/*
+	 * Fast-path bail only when the cached mode is also known to be
+	 * committed to hardware. The cache may be ahead of the hardware
+	 * if a typec_mux_set arrived while the PHY had not yet been
+	 * initialised (init_count == 0); in that case the cache update
+	 * below was the only thing that ran, and we still need to drive
+	 * the registers when the PHY does come up.
+	 */
 	if (new_mode == qmp->qmpphy_mode) {
-		dev_dbg(qmp->dev, "typec_mux_set: same qmpphy mode, bail out\n");
-		return 0;
+		if (qmp->qmpphy_mode_committed) {
+			dev_dbg(qmp->dev,
+				"typec_mux_set: same qmpphy mode (committed), bail out\n");
+			return 0;
+		}
+		dev_dbg(qmp->dev,
+			"typec_mux_set: same qmpphy mode but uncommitted; reprogramming\n");
 	}
 
 	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
@@ -4523,6 +4540,7 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 		qmp->qmpphy_mode, new_mode);
 
 	qmp->qmpphy_mode = new_mode;
+	qmp->qmpphy_mode_committed = false;
 
 	if (qmp->init_count) {
 		if (qmp->usb_init_count)
@@ -4551,6 +4569,9 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 			if (qmp->dp_init_count)
 				cfg->dp_aux_init(qmp);
 		}
+
+		/* Reprogram complete; cache now reflects hardware. */
+		qmp->qmpphy_mode_committed = true;
 	}
 
 	return 0;
-- 
2.53.0

