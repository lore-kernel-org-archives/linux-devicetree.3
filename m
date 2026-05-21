Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76E025FA29
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323837; cv=none; b=a5m2HtNdhigENZpxjrRJZZ2ZIqllMPXmjkbFzhl/yNUWWDFtm5RIHTCe+573oVlAD2RFYMIU3EZBW3q7ODEpDDMLDBAfufSiMRQ06vqxuj2FkNSD/WZM6AyNCMfRL+abhRf1INovLlenZahzYZnmWdo/IEXtwy6z4BSMjZ1shBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323837; c=relaxed/simple;
	bh=bENYEI93+kfAxffqfWequDJcPC9SYuAS3BBUWcNvBV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5ehRpK7vf8pq3C/W4hgOzoV7q+JPOOdOghDd/BeVZ7qyhnXwiebtJW2LUxnoYsWok5AFB2i8w5utT/5qIwl6DSOCddfuo0Lka2r+RVyByJloqF1B2t3PsWA9Q4AiQK9vKBZqh3Qnu70uo4fEiiIck1G4nxLBpQ2Y7e6GOH02zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGBK2bA8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxfuAwfF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGBK2bA8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XxfuAwfF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KMO3sB119201
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fdw4wGz0s7N
	X7rZlmQyXYCSIQlXchuQ2tG5rGljK0io=; b=PGBK2bA8MWsiAutAPM87yw4W7Ir
	5m+2p23yoSDwzTi7LI4GgFR5OkME+NiTyJvGjpAKDVkpwmJRMXQi8gcK4tJnkrzO
	jUzAcKqkmKDbFZFsOADV4kxN655nok5LxZfyTikA7BQovndHJxqOoBujqCl5Tt92
	KfxQ8sUPN8GzaQnf7Z5zecmSCgqkdEptILaMVsS08/Gp14N7qvXTWTqK/7Qw2IF4
	dRyyTGB6B2FuCHiBZLX5yBROslF0DS51PI7VrawMFZjDrIzIiGHEbDVcRDh6jjb1
	zGc07qAkXrFr3eHUI+J5SdTSviiVzPA+ZSxWT9qy0Htkx+Fcx0EdSm5+1SQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8aca0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:13 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bf8075f04eso103003237b3.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779323832; x=1779928632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fdw4wGz0s7NX7rZlmQyXYCSIQlXchuQ2tG5rGljK0io=;
        b=XxfuAwfF3g4xKO7li1b714kA7c2pykbP4Cu/u5AQj1QC7nCEm/TjkP6t4qAS2+3qkk
         LDWcKnizHE9ZRVsLUELDehwMp3AwKJxzpA5mJjVozq/ObsRTaKhQhVmnRJ9bwWRhAEan
         gZQzwTvlFT2LDo+32q7ELKZoeYDksWGcc3wumVDHupO7Uk7vL97pO+fQmt8+q1oir+kq
         +or8MnvGNdUplzez7T+4RYAZ3MBKBg+ZInShlMFZSYjvv+bV8XP6sYirE8SZF6A1tKkD
         MGVj/FiImIsxEwAlv7/CU+WqGmr1tp+/gUrxackkCUd16+icP4wBQcs93bY5zt4YH/fV
         aCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779323832; x=1779928632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fdw4wGz0s7NX7rZlmQyXYCSIQlXchuQ2tG5rGljK0io=;
        b=P/cI+67lXQG4xYvPGrrQn/m19kzuyjKmEHrXG43+T7HzRE1rBpZTiw3dgTslR2+Hx+
         VFFq9POiqln73lDBimPxpvDdOMxizR7Va0oFr1dZYfja+YAiET6PoL3swNvrX5WGMj0L
         PTLGu88Xb2YPnVmQ425kxFa0yxulmfzc1E6bc+llbi8zn/KoEhus6LymG+Y6/AiQ2TjI
         EVzzcOAqKO92KW/qEu3qk7yW7gKIUfzjx8I2kDufCEzWLgW5o0IwZkom48wSl065Aky/
         kjJetfsI25/bSmFWUeVG5a/1zJ/ZHTOHa0jRJHOeQWKRfurjmMB2G8RfLhU3GAwHytC1
         lDPw==
X-Forwarded-Encrypted: i=1; AFNElJ8OXm2uhinykP01jQSrT+Qip7CkTIXkwhpbsdYeLS5HAY9TTeQGzgUieYjoHq/ESAx7wuV0KN/Dj98w@vger.kernel.org
X-Gm-Message-State: AOJu0YxtX51DLZQSUvFZMIVvJD+Zh3mR8lZcPp64lhLW+LafEyRcWNMk
	Pk/KFwqxwXWVQLEBac/CxDLt0SSbi73fpBOzKi+J39T0SRQw6EgWrlMQWxoNoE094BOBMKiLH3G
	lDGIyXrQsi/nVHevi2f9bCi+UD7ySg5mrPVij7qlQIah8kmbKY1Wg2hUVSLTK3Tpg
X-Gm-Gg: Acq92OFydc72qU23VDpnB6zDZ9HtSTffvPl8GPGg1FUyHgDcNSmb7qygR0mgHF0F1lV
	ruT6lO5d5Wk2H6YZtuaOfA+E761OJgcPCK9iIaOKIw4lwstGb6rMGm5yJVh4S4DTc9kFCzfRh0l
	sfryVoE/2E+RSn4x1xeCjU965jMZUEbynVxH9TVnc8YWs/ZhBA4H/5SssGlqHruC7sRSLfLTLaY
	1nlDGt0iaNJAfxUQQUQHqf4kUnR+C6w6DYw8HqQC/r9gjaQhzj9W6GeG5KU9jQbximx8vGRlRVW
	KCCf9tjmTpVxtqUFNgATh71JY0kuPThf+S1bEHpRPYy4qwFxRwI1EgynKYdOFRTO2Fgu0zchJol
	KFgnKdv3LPePHRnxnvaMFUT+USkNiOw713hdsswqNBFWay6MGwPxDjZbpLf4i+cAW+hiTlVcFDK
	ZKwPaK7YwiT0CnqLRTE26KR4QJNQ==
X-Received: by 2002:a05:690c:b8e:b0:7cf:d9bc:80af with SMTP id 00721157ae682-7d20c54bdfdmr7903277b3.30.1779323832405;
        Wed, 20 May 2026 17:37:12 -0700 (PDT)
X-Received: by 2002:a05:690c:b8e:b0:7cf:d9bc:80af with SMTP id 00721157ae682-7d20c54bdfdmr7902977b3.30.1779323832015;
        Wed, 20 May 2026 17:37:12 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60545717b3.10.2026.05.20.17.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:37:11 -0700 (PDT)
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
Subject: [PATCH 1/4] phy: qcom: qmp-combo: skip USB power_off/exit after device teardown
Date: Wed, 20 May 2026 17:36:12 -0700
Message-ID: <20260521003615.1260844-2-mike.scott@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 50izh5ngk5KJVJKjkGaLSSaUtrW8xGIQ
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0e53b9 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=EvQFHbMspfJCUfrvVzMA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwMyBTYWx0ZWRfXxuu7URV/EeIw
 1GULyeGpcYc0pdasWoBcTKX0ZyRC2E4TBqGCBnOGO28oA/tmEg5b4yj2kLZx+DsUbUa4wrvsNHc
 Bd5CXuI83l7onUgdSWFrkH0U59ThRCheo7EKuTGU4yza9dMh9VDHDExHTIxsYgK1d/PLZ59yxfn
 SLoA2i6OsjBgP6X54685mXqn2xU2iQ9rxRnE7bRZohQ+Ad0bxgPB44uM3nhYLkWl1a3kl+696R1
 /Ablvgs+3MRCVV9f6Vc5bs3F7+RgfTdnCGvOdaUiY2hSsbDIkwiah+w152A3eBb2j2sBEjeVVsR
 Ub68btqF2gZ3p/J92SDVzGd4Sxj5pQor/ZFvIZSTFPpvSilB+Z3k1mN7PSnOYtHONehCiJtDkSA
 hwO4H0pae6nqSdEY2AK+7oRUgnHeYdUzLZQtEqHoFNLfcYvwhhLQqjerVLFj0HmXkmxxdBpenf1
 7Tj9nmHsj6JENoke0TQ==
X-Proofpoint-GUID: 50izh5ngk5KJVJKjkGaLSSaUtrW8xGIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210003

qmp_combo_usb_power_off() is reachable from an external consumer
(notably dwc3 via phy_exit() during driver unbind) after this device's
backing resources have already been released along a separate teardown
chain. The dereference of qmp->pcs (whose ioremap mapping has been
freed by devm cleanup) then takes a level-3 translation fault and
oopses.

Easily reproducible during testing of USB-C role-switch enablement on
Dell Latitude 7455 (X1E80100), by writing "none" to a USB-C DWC3's
usb_role_switch role attribute, e.g.

  echo none > /sys/class/usb_role/a800000.usb-role-switch/role

which triggers the chain:

  Unable to handle kernel paging request at virtual address ffff8000876c5400
  pc : qmp_combo_usb_power_off.isra.0+0x58/0x470 [phy_qcom_qmp_combo]
  Call trace:
    qmp_combo_usb_power_off+0x58/0x470 [phy_qcom_qmp_combo]
    qmp_combo_usb_exit+0x38/0x90 [phy_qcom_qmp_combo]
    phy_exit
    dwc3_phy_exit [dwc3]
    dwc3_core_remove [dwc3]
    dwc3_remove [dwc3]
    platform_remove
    device_release_driver_internal
    device_driver_detach
    unbind_store
    sysfs_kf_write
    vfs_write
    ksys_write
    __arm64_sys_write
    el0_svc

Two WARNs precede the oops from the same teardown chain, confirming
the resource ordering:

  WARNING: drivers/clk/clk.c:4494 at clk_nodrv_disable_unprepare+0x8/0x18
  WARNING: drivers/regulator/core.c:2657 at _regulator_put+0x84/0x98

i.e. the pipe clock provider has been unregistered and the regulators
released before qmp_combo_usb_power_off() runs.

The proper long-term fix is a teardown-ordering rework so the QMP
PHY's backing resources outlive any consumer that may still call its
phy_ops. Pending that, guard the power_off/exit paths with the
existing usb_init_count balance so re-entry after teardown does not
oops. usb_init_count tracks the balance of usb_power_on/off; if it
is zero we have either never powered on or have already powered off,
and there is nothing to do.

The same guard is added to qmp_combo_usb_exit() since it is the entry
point used by external consumers via phy_exit().

Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 93f1aa10d400..4057583c0cfe 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3922,6 +3922,17 @@ static int qmp_combo_usb_power_off(struct phy *phy)
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
+	/*
+	 * Reachable as ->exit from external consumers (notably dwc3) after
+	 * this device's backing resources have already been released along
+	 * a teardown chain. Refuse to touch registers in that case.
+	 */
+	if (!qmp->usb_init_count) {
+		dev_dbg(qmp->dev, "%s: PHY not powered on, skipping\n",
+			__func__);
+		return 0;
+	}
+
 	clk_disable_unprepare(qmp->pipe_clk);
 
 	/* PHY reset */
@@ -3966,6 +3977,17 @@ static int qmp_combo_usb_exit(struct phy *phy)
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	/*
+	 * See qmp_combo_usb_power_off(): an external consumer may call
+	 * phy_exit() after the QMP device's resources have been torn
+	 * down. usb_init_count tracks usb_init/usb_exit balance.
+	 */
+	if (!qmp->usb_init_count) {
+		dev_dbg(qmp->dev, "%s: PHY not initialised, skipping\n",
+			__func__);
+		return 0;
+	}
+
 	mutex_lock(&qmp->phy_mutex);
 	ret = qmp_combo_usb_power_off(phy);
 	if (ret)
-- 
2.53.0

