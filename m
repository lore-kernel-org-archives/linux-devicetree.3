Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A023D75A4
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 03:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209152; cv=none; b=g8twfIM22OHr3USnRwkBugZe1sdX0KLDn6TcO8MpGD6QZHf28+3o+36raT0azO5Z3Kix7CIYqyWp1I4tE+ynRrIcaaFkKBntv0G3dT+Fm0RpRaFrgaxDZTcKsC3edc6omVIAk53N4Its+wl3f00sTEZEDKL8l3XvDRX8d71X1YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209152; c=relaxed/simple;
	bh=hFGzzUuJAf13a7cH1dk4NTelEuSXHb1jue9hfuno+fE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aIKIeevVXI2FgBebfXPHys2Vd+SGg96u0fVLG0Ucz4EF45nZAHcR0ciHC3DJwo0nTmAWOREqIGjQcqND0XjL5Hvo/0TSAiMZ+w9axwLdVkFtniLtFpzs/mvyhkor9bV687wDweXYpP5wHsLx+w8K665+PIcARTnA+dUF/q0YVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikp9c6bR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEyxgMab; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikp9c6bR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEyxgMab"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30jkW3939005
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 03:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L0PYYEDltuM
	aLnbqbWWQO9goRO0YLg64WgGosJrMhjE=; b=ikp9c6bRo/xr6K6NToySoDSGgBz
	ez5cSAb8d3SLWwf9mcEb6C5DtNIjnSpQ3zh8XjFjSKKdEDuOs3ozBLrYkrl8ury5
	D0NLM7K3GtoZ/jVvtNgUKRZlsm5V9Si1jPnwjaDOW3IVf8lcrDzLB0YHm1YHRmoA
	qondPpbOlsUc1PN4IRYKLkkliGHrZetYkSWKQYZtzfg1nYEO6p9GlQePW1G7+Ig+
	+Hs5orI6aQD0fIuoMFyPSKL82s8JWGWStS6w/ql5eKyYlghISisRBhcIMkkgdLXW
	Vix1eygtXJMU0BAZCoLCPItMDTanYzXQo2K5V70OgIyILsPKC8QgkkFrg+A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnrc9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 03:52:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1437222eec.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 20:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792209149; x=1792813949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0PYYEDltuMaLnbqbWWQO9goRO0YLg64WgGosJrMhjE=;
        b=iEyxgMab2BV7bUosvpX5mVELgoo7hfkh6yhCvAGc7KOSyjmNEAGnNclr0ckX9XShiR
         ism+WZt647Nej4S41xbNduue8oarsalhnoWY8PxNPyqYro7c2SZbwbdKqMiTaHJckLa8
         r/0AowsR8v0jNSWJXB2a3NYWpHwnP/tMTO+qje7diCBdYI4QBeFjlGezvBpGkWNAKU1P
         bs5G1VvTUyj6mT/iB8OOATbUwmjo4WUcREK7E3NKuP+CFKzuwU7hAsJJHkQwIJMoQmiO
         8S4sCLV1yT3BO21rL/pejM91hLqQtqJysXsFpnZoH00Vj4Og5VpN5CoNcWsLlsSuh/5q
         tdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792209149; x=1792813949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0PYYEDltuMaLnbqbWWQO9goRO0YLg64WgGosJrMhjE=;
        b=aaBmRWoAaH8UlrSoIilEEtxmkTsNmnGbzlLPlMhTunKzpPvdAjlsfqPRVEKU18Zp02
         6dIthWtGJDPo3Hy8zgtGPD98vEW3lAA+m5a2JunrKIKBzSD6kYkh++H3eTABhQvM4h7t
         Ev/gjbbVPIgPf7Ds3SoDKYbXchY+gACOE+KfYZbEOFtQf6MeWd4AjFEelADZxDS3KA+g
         dafv0N6C00OS4jhUq2oDa2ZbD0yg33HLA5UVmWwdMqFlItA0w8aA+97DIdfn+cqJCogv
         4BzPnfuJtOHksBRERWV91jYsHseFTyjYQ6e3ez8f9WmH2aRwFhXLC1Rb/H1EYOrAuXkl
         97sg==
X-Forwarded-Encrypted: i=1; AKwUvBy5M2knKauXGKQojznbCjocuJL4wx4nkKjja4IYH77+5ULmMSVG6MvaFE4zH4qEUC6OkSugEkozNRfZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIjKOlD75QyF806YBYg7jdNk3AnuINQz/vGxFXqpeBf+1UjpgDu
	x5HkH4bIvOEztX9q0hKQOM2BY7dJduvYm7dbSw+gsBu0tEaLL25mwu30HBq8q5xOFWfUnWy/05a
	eKvfeQeCPFfQBXzS0GVe/And2s2iZfgWXv2dCbIm2rMqfeYvrFLy1HAORiiSDNvKU
X-Gm-Gg: AYBFou3zHHfqECXM6UAGsCoMwT60lp9p5kApdZVmEZGMV16EIAoAHEA/fu21V7KVMPz
	Xg+kzuWaVho9J1WHEF2TYkheTaRNPzDcKCgFWVN9m0j+3M0Jnn05810TAEbb0294tjP5UJ2Jnx4
	IUVSwJ3O+gLt6F/ttq3eUKk16Bv9i6DSjPxl09kUHWwHsBYi4t49AJClHGNpgi3E9yIdPLCVv9o
	b2NgGegzJq6bl1EIw87RyI3EbqsKnzJIQgcPz8wGst/YquINbceIrfedWBXxx5Ex2aTWpdScFaW
	2gnFF3imScK8tmBc9Soa3C9doHwWB+rLHp/6seLVvFTZsRlPwTvrlLVBF4UImIJQN32ctKK6/VM
	y2XeQ7uaRRmpnREqLA0KL5uh42akgaqP8jaKZ4SUCWHkvNTGG+em15Q==
X-Received: by 2002:a05:701b:4657:b0:13e:5b2a:e65c with SMTP id a92af1059eb24-1850d370640mr2426922c88.3.1792209148812;
        Fri, 16 Oct 2026 20:52:28 -0700 (PDT)
X-Received: by 2002:a05:701b:4657:b0:13e:5b2a:e65c with SMTP id a92af1059eb24-1850d370640mr2426883c88.3.1792209148182;
        Fri, 16 Oct 2026 20:52:28 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm9723006c88.15.2026.10.16.20.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:52:27 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 2/2] media: qcom: camss: account for C-PHY when calculating link frequency
Date: Fri, 16 Oct 2026 20:52:21 -0700
Message-Id: <20261017035221.3816464-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad2f0fe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nGyAT0_fS2eleY3HuKcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: tpM2DCo5deRp5sI24O8ElhRb0GZoJD0N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX8E2j6wxCJvUh
 ylvUjlTxykuW+WIXqL2IfPkZ70A3QSShbFvOJ4kjfRz3ALHyagwwSyy6cRd8tNhPzwfoXJDMwEu
 aEhkvkIH3CfPJkLAwD+LmbzwJ5seDEM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX9eKzhUA9P3Ze
 9yowH6TpV8rnE2Aqz6rHrDUSR++V+bwTtFGMfhkPrFe2tK7F3zKUyTweMeW6CwYUbR3BzM2YpnY
 DoR1vbYdmnmr+nXOOWOyg5l9CjGFRSJNRXOTdq8gN+CGpF9oCAmyGz7uQr4WW4WzTS/b6Wr7Gl6
 C5dvId+yitThjUuq4n57tEAN4Z/MVllf5gIWCfJqCybG7KWaXjoOh5Q03D8UKKgmKrh2mpVQiP6
 1C8IeheXE1em25crwNBpWxP6AUUbNTvosrkfoGyFQTr3D/fyEPZ7cFlbNMnCozaSGyO8BAzCbGg
 X9m1OBqrGFNipCr/6A17VQZ56A/+YUhyRFzZ/695BkjmJJUcKSzid5O4q0ntEZGo6mq9WDaUCNx
 6MkDcoZxsvoX5UC3ELzoBiDHOjHp51fH14V+bVESb3Xel56Ivhd/Wa4R3sSdl3xEe78Mrysr1/8
 KeaVQCZL9qbCYyC7NYg==
X-Proofpoint-ORIG-GUID: tpM2DCo5deRp5sI24O8ElhRb0GZoJD0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170015

The link-frequency divisor differs between D-PHY and C-PHY: D-PHY
carries one bit per symbol while C-PHY encodes 16 bits per 7 symbols
(~2.28 bits/symbol), as described in the MIPI CSI-2 specification.
Extend camss_get_link_freq() with a cphy parameter and scale the
per-lane divisor accordingly.

Thread the PHY type through the CSIPHY (via lane_cfg->phy_cfg) and CSID
(via a new csid_phy_config.cphy flag, populated from the linked
CSIPHY's lane configuration) call sites. The TPG path is always D-PHY.

No functional change for D-PHY: cphy is false and the divisor reduces
to the previous 2 * lanes with unscaled bpp.

Also program the CSID gen3 RX front-end's CSI2_RX_CFG0 PHY_TYPE_SEL
bit (24) from the same csid->phy.cphy flag, so C-PHY streams are
decoded as C-PHY instead of silently defaulting to D-PHY (RX counters
increment but no packets/frames are ever assembled and buf_done never
fires).

Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c  |  2 ++
 drivers/media/platform/qcom/camss/camss-csid.c   |  4 +++-
 drivers/media/platform/qcom/camss/camss-csid.h   |  1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c |  8 +++++---
 drivers/media/platform/qcom/camss/camss.c        | 16 ++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h        |  2 +-
 6 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27d..6eaeb1ba7462 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -66,6 +66,7 @@
 #define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define		CSI2_RX_CFG0_PHY_TYPE_SEL	24
 #define		CSI2_RX_CFG0_TPG_MUX_EN		BIT(27)
 #define		CSI2_RX_CFG0_TPG_MUX_SEL	GENMASK(29, 28)
 
@@ -115,6 +116,7 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 
 	if (camss->tpg && csid->tpg_linked &&
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index a00791b00feb..321bb3c86c56 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -547,7 +547,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
 	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
 				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
 	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
-					csid->phy.lane_cnt);
+					csid->phy.lane_cnt, csid->phy.cphy);
 	if (link_freq < 0)
 		link_freq = 0;
 
@@ -1279,6 +1279,7 @@ static int csid_link_setup(struct media_entity *entity,
 			csid->phy.lane_cnt = tpg->res->lane_cnt;
 			csid->phy.csiphy_id = tpg->id;
 			csid->phy.lane_assign = csid_get_lane_assign(NULL, csid->phy.lane_cnt);
+			csid->phy.cphy = false;
 			csid->tpg_linked = true;
 		} else {
 			csiphy = v4l2_get_subdevdata(sd);
@@ -1293,6 +1294,7 @@ static int csid_link_setup(struct media_entity *entity,
 			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
 			csid->phy.lane_cnt = lane_cfg->num_data;
 			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
+			csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
 			csid->tpg_linked = false;
 		}
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..00e2669db64c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -70,6 +70,7 @@ struct csid_phy_config {
 	u32 lane_assign;
 	u32 en_vc;
 	u8 need_vc_update;
+	bool cphy;
 };
 
 struct csid_device;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef228..60d58becc7c5 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -146,8 +146,9 @@ static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+	const bool cphy = (csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
 	if (link_freq < 0)
 		link_freq  = 0;
 
@@ -272,9 +273,10 @@ static int csiphy_stream_on_legacy(struct csiphy_device *csiphy)
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+	const bool cphy = (csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);
 	u8 val;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
 
 	if (link_freq < 0) {
 		dev_err(csiphy->camss->dev,
@@ -336,7 +338,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 
 	dphy_cfg = &dphy_opts.mipi_dphy;
 
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, false);
 
 	if (link_freq <= 0) {
 		dev_err(dev,
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c888e78256b3..d525358afa04 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -32,6 +32,15 @@
 #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
 #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
 
+/*
+ * C-PHY encodes data at 16/7 ~ 2.28 bits/symbol, whereas D-PHY does not encode
+ * data (16/16 = 1 bit/symbol). Scale the per-lane divisor accordingly when
+ * deriving the link frequency from the sensor pixel rate.
+ */
+#define CAMSS_COMMON_PHY_DIVIDENT 16
+#define CAMSS_CPHY_DIVISOR 7
+#define CAMSS_DPHY_DIVISOR 16
+
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
@@ -4624,19 +4633,22 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
  * @entity: Media entity in the current pipeline
  * @bpp: Number of bits per pixel for the current format
  * @lanes: Number of lanes in the link to the sensor
+ * @cphy: True if C-PHY encoding is used
  *
  * Return link frequency on success or a negative error code otherwise
  */
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes)
+			unsigned int lanes, const bool cphy)
 {
 	struct media_pad *sensor_pad;
+	unsigned int div = lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
+					       CAMSS_DPHY_DIVISOR);
 
 	sensor_pad = camss_find_sensor_pad(entity);
 	if (!sensor_pad)
 		return -ENODEV;
 
-	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
+	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, div);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index ba3d51d9c0bf..f7ee2ae792c9 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -170,7 +170,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
-			unsigned int lanes);
+			unsigned int lanes, const bool cphy);
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
-- 
2.34.1

