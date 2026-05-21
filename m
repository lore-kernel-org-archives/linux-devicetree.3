Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE2F25DB12
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323847; cv=none; b=gnMwfY/YAnEQDQtivYkf7Qy5jNoTPyWHmg6g3NnN5SUEpQPolGCzsLJzN0j6h8LmXgJWHX3VBuyDwHtmABGItFH0IE5qRkJmU7K/5vyAx8ManTJEVJeuQ65aON4OwMw8lO/WYtdD84VThSEa3c6/wHTQ/EQLCHB2nsqf3aXUh1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323847; c=relaxed/simple;
	bh=8YDN6rDDgfUMH3s3D+1m6FuPIYASc6HFvPaXsSXVgQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWLKNPgtwhgy26T4HL80H9dvwfSaftCeRzd58WKNGz3CKGpNbRSlD7VImIv4fAzQhP6xA8Al3dzMykNPBiJCZa7v5c9a2wUV74N3l03KLVxihDpUcGKJJWol4wr+TqTIOLH2x+mv0xbk6q1gGCbTAe+X3kYAFCS86m5oc96T6kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXz3QRKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+bkTokD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXz3QRKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+bkTokD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KLKRFN3680274
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/53XCL17jN3
	51K4aaPlGvru/vziGTGGtsn9yhfrv7hk=; b=eXz3QRKZIFXaBD89KyrgH/U9+4j
	wJVHWfbLEEOJ0YXXbIM3w4KqIrR8Y3bsudCd/ytYzDSNvoQGPIQCK6EwALgkENon
	t0SmaEztdhd3iuBUEqxC3fnzfrlNzcZFuCbdjiJJEShUk4WFKq/d7Fdvf2YGkXIb
	D9eIdo5v0IfmQ1JrS3RSeo/vpTAticWOSUlMfiJ4hHpkOkBQerW9XAkrXRX1JCFf
	J9QHkFV1OXBCNmz6D4FHDEVLDAiZXq4Ya25lYhSQxvRuTNVI8ZTk8E0tiZ+HtjM7
	twJ7cawUdp1HsPu7NSKUea1N3HIt8OypVR+GQL9HwJAfgzixs2fRbT4wuCw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j2c9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:16 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7bd49a2467eso109446567b3.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779323836; x=1779928636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/53XCL17jN351K4aaPlGvru/vziGTGGtsn9yhfrv7hk=;
        b=L+bkTokDrf6ocedPc4FtXnaLpOo92YrwcYI28mSg6IAnG3Hl5ml900F2pUmRpui7AY
         cMtA/Z3chvXl9o0fnDzKUh9bwaBgYPY1fAyeQwEleOVvBtCfyl42FlWM8tBJbTvoNVx5
         Yb92q/Vqur4U1LDvWw4SCsSX3B9SBOaEsl1H6Ok9kzi3JVaodNLwfSUvVIeEeXh9XVrG
         Hjxrg5leZSMZoTV0lBLT2J/+/3pwRL4ONJSVOlNoq0pMAybXsh9AcaLxiWlzSCkkOsUB
         gCwhGZLe8ZPXMscJOcoJPVyEb8OC0koQdW3SmKfYRMjWXJw1pwqeuEWPBp3ojM7n6nIe
         OZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779323836; x=1779928636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/53XCL17jN351K4aaPlGvru/vziGTGGtsn9yhfrv7hk=;
        b=FgAnP1+s/Kka1V/+SD1BbKiPOV+INs0YU4eKS3ZLaMapEmofQmTBEss3NS7Lcnlosd
         UFFwO2etmsRe8mu/q6+KxiQF+ERyFtguahDg6ncZ2HI+LPUeR6s3DYjN9aJqD3HHakjO
         PrTuSowLrzY8tx6IvOwXMIBQha35dGOPzSrVE3T+ygXDQ8VRGSZ6COWXg8CabHL3ZAmx
         eb+WtVqVwjvCts665smp5kkXUP3sk4GDHhPtoQyhoSagagfYXFo56PSqGvfwJgmgmnSt
         K61Df9IROAIDvgWcwluGLpWS7MlItAnUw6Bb5E9TpAnKe+e4OYQ15BfyP26RUoN80Cf3
         OHCg==
X-Forwarded-Encrypted: i=1; AFNElJ+moXo3oYNGqI68OycLbG1oxO0kVGN1CQCPDe2X2JVftDTdqWqx3drMPq6i/LoqCidXG2aqKt0v7ktK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6enOx1S8521n6Ko2Q+CX6CsHCBbtUAHWCwwwtmOmeXiY763Ah
	vyslA0IEj5G0EnfYLWpYC/dD2tm8HyLLm9nLBryoPGEVXjLTxNRfBCX5epk3lJ5o2mkEUW2qc6s
	5WuxQMO1sGkyZQxiBWlM89ZLn4e7+1snDJh30vD/B0bJHe+ea+zNXhWDinUA94KAs
X-Gm-Gg: Acq92OGZXCCSGQBH7vtOG4Ww4vhqycdByH4ZPNz6CALILaoJja4hX+coRgE8avU9i/N
	QXG6A6+CFMOJWz8vdedjeByDvujuQI3xLzlq/p4BR88izh4qN2bcKf8fKrF2GUctVaRNuLVn5ny
	qRpX+iEiO5vyfUDPD3Xo5157sa6klH7DfLMo26+7RhikmQsN3tdOvA41qxelnM82WiUGzDSaf2c
	9K8wlEQa2TdFy1rxI9i5fsqLDVc7BN2Ovg4wTxrjJDAbKSted3cOnJccn3CTuv+R0QhnAEt5AG/
	Ey1toayTtaHBx5scPQfCckZGZ+yBIormS1SLri38ICnUQFvzifFR4WRBwD2nn4YlwAjn48iUCiu
	c08knVM339cWqpQJdNdsoVG2x9wm/PcvTe1t7/kydhiIrbzDcw3pN9gvcpWPsxcPsrJYGrUvYDA
	WqXQGbtNfGJwJMAkc=
X-Received: by 2002:a05:690c:6202:b0:79a:6249:a046 with SMTP id 00721157ae682-7d209cd3355mr7511197b3.9.1779323835777;
        Wed, 20 May 2026 17:37:15 -0700 (PDT)
X-Received: by 2002:a05:690c:6202:b0:79a:6249:a046 with SMTP id 00721157ae682-7d209cd3355mr7510937b3.9.1779323835378;
        Wed, 20 May 2026 17:37:15 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60545717b3.10.2026.05.20.17.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:37:14 -0700 (PDT)
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
Subject: [PATCH 2/4] phy: qcom: qmp-combo: track whether the cached typec_mux mode was committed to hardware
Date: Wed, 20 May 2026 17:36:13 -0700
Message-ID: <20260521003615.1260844-3-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
References: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0e53bc cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=GhrnwN_qMCjkbgjgO0kA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: z8CEvigvfd39ON31CObqLDwNeTxNad-u
X-Proofpoint-ORIG-GUID: z8CEvigvfd39ON31CObqLDwNeTxNad-u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwMyBTYWx0ZWRfXyRB99vdQ7j5P
 zVr7EW+wPuoJ1g4MO72NqpZE6BNLI0n6pmqICjjCbCbe+zEfbUoSrkcb2boBZ/M3LM7MD6YAP/9
 6vlzPWT5YCQWHDZVzg+n6WJMTtO+R2tK7/XR66PtqqjB4Gc7tGMhkzEXzzMyB8rYVD59y9QLKmW
 IUEddvlFziiquDAU3tij0hIUJiltB5pw5QEa0e4J0kjcugZNY114V19XKtmPESwAjj9szxva6Ch
 h8r669bkCUdxQDdtymMBaoNeSMlcTjfYgMyhqj6N4X96myHklNVbfqcW2BIEA3VkON2LZZdTJXT
 mYT7RLS69N/2G1fEa6W3hCtjUlmDkVVP0bISqZiPTJFYalr+LeW8HNJPvsZYehbY6xaKX3c/UNf
 AxGg+viEkauRUvlXuPP7uXVZ4TJFnpOzPzrNuiqOxPUGRGPiI3G5C88+fzSgtVykJxBA+NuTW3S
 pU4as26vjHDGTYbj+vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210003

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
index 4057583c0cfe..9b6da783ce60 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2295,6 +2295,7 @@ struct qmp_combo {
 	struct mutex phy_mutex;
 	int init_count;
 	enum qmpphy_mode qmpphy_mode;
+	bool qmpphy_mode_committed;
 
 	struct phy *usb_phy;
 	enum phy_mode phy_mode;
@@ -3747,6 +3748,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);
 
+	/* com_init() just programmed registers from qmp->qmpphy_mode. */
+	qmp->qmpphy_mode_committed = true;
+
 	return 0;
 
 err_assert_reset:
@@ -4507,9 +4511,22 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
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
@@ -4521,6 +4538,7 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 		qmp->qmpphy_mode, new_mode);
 
 	qmp->qmpphy_mode = new_mode;
+	qmp->qmpphy_mode_committed = false;
 
 	if (qmp->init_count) {
 		if (qmp->usb_init_count)
@@ -4549,6 +4567,9 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
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

