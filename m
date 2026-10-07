Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0134963B6
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363930; cv=none; b=rIEkiQ48Cw05c1E2WxZlMlU5prJGk3qE4WgFwwNliNrXN0fc3CrePs0jI7r4njbFTwi6aryJ6/dZ04H2P9i2ipvX60dGtMvpawNT0/1LTRy0EMezf2dGterhLN10m7lHR/R9t22UPhfZ8Ul4jhdLPYSSLb/NMF3luwIp5wWPkmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363930; c=relaxed/simple;
	bh=9IHRMabF/UUZ/I8jhl+b1TFxH72KngRZLYox41kc84k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OF5ZbxJFFCaxC2XOKjRlqC0delicpMYoGbC7sMB3nGkoFhiMv1O5dmoiYd69l+cFKPwaGTASOMAbBu++X/nRjwHmRHnKR1kmhjSwxmkfZNholXytcowvstL3pGn2zrZlaVd2Lhd5WE5BXFUNBa5Yb2XjzaR2fOavIrJES7/2vgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuKeueNb reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuKeueNb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jeV13334690
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+w5RJMRUBd2
	5lXyd2GhSv/Y/VzCG8uEh7F6bn9BvQcI=; b=cuKeueNbGlBMpJnc1sk1A1+lpBe
	OtZVThczFoPqClILI7fYv+TnPIhkq52o1LdiIGmiY/bQUbu43DUWDa94XmVgO+tG
	14tsDRmpb3ZRmO/kGpy38etHReYR6Rn2aRVIJfPZWCGoZ3zZbf4daHE+t1S6sJ5G
	PP3goja/BbfkfORvp+ZgtJS58Lq2hRa+n1b4nl9x4aTYKBRCJDPRr19sV6f+UOMh
	lEfNvfIrrmSjkO0qyJ9b2rYep4U4PHXoT6R7fpbqTXlfUJmqAYn+4ots7aPh/wyf
	iYGlZ5WzoOx58d/LyY/RIv6MKO0JfdBwLBt5FZZCuz/lnEkRItFqYyF4x4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623b3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:03:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e834ff4d0so560256185a.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363789; x=1791968589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+w5RJMRUBd25lXyd2GhSv/Y/VzCG8uEh7F6bn9BvQcI=;
        b=zWM7dxQ5kSC1ZvTLD2R1xxVJb7qe/TpS8OndrwwVvsci8KgqcA2hLIfZrZCaAske+z
         ORzZfMg4edyr591K3Ff4uzfo0ZKg9h/vve5Tml3byipjnkmpSAWjLs368Rjzcr6rBJo2
         eAcUXQBEQX/wCh81FwVCTUJUDhAYjhPBAGeB3FHZDcaT9EJVJypcz7+Gdf+Ndu411KCd
         esJdhFa3/czrtjVHc2ahH0Lx1ym4ROH7g8/t0wKMBYxHRvcx2Xc7B4EuDXKaC7u04Mk5
         2QNvDy20qrMXchjWbpmN6UrOQw9nOIaL2d94pex6q6bhzd8qloT6XnN3k2R+m1Nq+j6i
         Odkg==
X-Forwarded-Encrypted: i=1; AKwUvBz303vTMOiQTgsrLJMEjF03VsDqruj8QcexGaBNekVizlxr6pVk74A9M71YNOycvFjirp7bz9Ko/8hv@vger.kernel.org
X-Gm-Message-State: AFuF++klpTzWCOKa2sPnEACjS6U5J8F5aXwzyIyDbBif8d5PEt16rWWa
	Tz79PbxcLgYV2dRTvPpkEqOnLII8awy0Wkar9I7VgeNaRw1RqT0675cLqQr8IvKozPqmm7dymPw
	F6NDwtASDESS6WRcO8HyqQ0pgYAZ2N6nQcr8ZfUFKz6c8S4Y3aItd5t3z8pDTs6hh
X-Gm-Gg: AYBFou2xpqw0Nw1qNdroGbdMxbJOFHapKva6RPgxkQH+iJUs7+eNLMT1+0PqKHdByX2
	kPPme1j59urWk8Iw/RQc6/FSLsDyBzQA2kpFSqWGR3y5sQ4aUHF6OJ9lyTl3dFPAmTEeu5sn4zN
	37fqpvoMb54dx+0oW72hRWqicDkRYeE3Uz3TORRF5wsqyzmLRdTTcqcKcMR+Qcio5E6RgsKWK+3
	jI4IUkyiE8QhE8/uBbQby1NpDgdTfLZJE5BsdTHIPBIe82NtC7mEITu+aQirmMOGZ9pDLc7x7Oh
	33wrAYVnsR1Fk09Gisrq+Ej2ExS0Rk6Q8zzeP39MiHnL59xgO1cvSWTL9dM=
X-Received: by 2002:a05:620a:6287:b0:939:de48:e41f with SMTP id af79cd13be357-93e9b74b82amr280295585a.31.1791363789229;
        Wed, 07 Oct 2026 02:03:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6287:b0:939:de48:e41f with SMTP id af79cd13be357-93e9b74b82amr280288585a.31.1791363788617;
        Wed, 07 Oct 2026 02:03:08 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:07 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 42/45] media: qcom: camss: use one lane for TPG internal path
Date: Wed,  7 Oct 2026 12:00:38 +0300
Message-Id: <20261007090041.3732717-43-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zfdsSvsgtaK0kyUCsQILRhImXFCr7pQu
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60ace cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=knLUxTcafSqJ48ELel4A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX2c/HbR+gqvTA
 osJuemd1xofRWHiAuM/CjVOXG4TJaRbZCg4xfWnXqr9t+L/172aPLnE8ci6HqakvFKvWIgel2fu
 wGoTbFYUcmWOjQboVRRW/nl2Bmlixks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX6on7WpQPa8WZ
 Jn0UdR8OAzfRRl7CG4lnHDytUz+cJOm30rX20r876ntEN52CWc7OD45b5Hbx8iMJthTeVjtGxu2
 nI7zEVp+mTN41bd8I5DaTHEnU3SS6L0oTglVN6QY6tVkAMnRk1uc65NStxa2Oht/CDjylls1h72
 onzS5apBEysxygScjfu/0rmQ7Pwwl/dQSxJC6E+2w2BCn4Di3I7Z+tSEs5yJdXbl+bLqIfdSJa2
 UjIfCfke2t1J/mpO8X+lDMd10t94VEAjVcd4eLY2I7NqWqQHwghrEvyCiF5xoqWn6lNtC583ALm
 vCECBLmbTaxTAf6B5A67yGYZuvf/B60BDLi3mpwDfRlta/UlZ5pJ64x8Q415RFTENZBz1qsduK9
 lpApMUX7KNsNxL0OCc9CtCX5O2cjXQTScq5Wr486d8X5PccY2RFYfXcnMgVrfOQiQ9mkZctfm6T
 OGd8IqG6i9xTYuTzAAw==
X-Proofpoint-ORIG-GUID: zfdsSvsgtaK0kyUCsQILRhImXFCr7pQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

The internal TPG path sends the CSI-2 packet header on lane
zero. Configure both the TPG and CSID for one lane to avoid packet
header ECC errors.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c     | 7 +++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 2 +-
 drivers/media/platform/qcom/camss/camss-tpg.h      | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index da13963ef1a0..6bb0af77fd49 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1276,11 +1276,12 @@ static int csid_link_setup(struct media_entity *entity,
 		if (sd->grp_id == TPG_GRP_ID) {
 			tpg = v4l2_get_subdevdata(sd);
 
-			csid->phy.lane_cnt = tpg->res->lane_cnt;
+			csid->phy.lane_cnt = 1;
 			csid->phy.csiphy_id = tpg->id;
 			csid->phy.lane_assign = csid_get_lane_assign(NULL, csid->phy.lane_cnt);
 			csid->tpg_linked = true;
-		} else {
+			tpg->lane_cnt_override = 1;
+		} else if (sd->grp_id == CSIPHY_GRP_ID) {
 			csiphy = v4l2_get_subdevdata(sd);
 
 			/* If a sensor is not linked to CSIPHY */
@@ -1294,6 +1295,8 @@ static int csid_link_setup(struct media_entity *entity,
 			csid->phy.lane_cnt = lane_cfg->num_data;
 			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
 			csid->tpg_linked = false;
+		} else {
+			return -EPERM;
 		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..423f45378a48 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -105,7 +105,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	const struct tpg_format_info *format;
 	u8 payload_mode = (tg->mode > TPG_PAYLOAD_MODE_DISABLED) ?
 			   tg->mode - 1 : 0;
-	u8 lane_cnt = tpg->res->lane_cnt;
+	u8 lane_cnt = tpg->lane_cnt_override ? tpg->lane_cnt_override : tpg->res->lane_cnt;
 	u8 vc, dt, last_vc = 0;
 	u32 val;
 
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/media/platform/qcom/camss/camss-tpg.h
index 7fb35a97dd06..fb22747f5eed 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.h
+++ b/drivers/media/platform/qcom/camss/camss-tpg.h
@@ -94,6 +94,7 @@ struct tpg_device {
 	struct v4l2_ctrl *testgen_mode;
 	const struct tpg_subdev_resources *res;
 	u32 hw_version;
+	u8 lane_cnt_override;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

