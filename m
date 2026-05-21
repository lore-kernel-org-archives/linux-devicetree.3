Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67522C3257
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325797; cv=none; b=BSwSN7spQPyapO3eECP33DIJ4V7/XuJRqKWlEovdMia1HxZsh/PHvPqBTUNaHIGnGlwW0hteiyb0dMQlc1RcXE5kG7n+TqI1DKkos4sI4hdqtmUKgOUc03jxpAdKZodDr/6Mj2UdW1onEfPl1edde5zFn6RD/F1LXmAH3SJ4t2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325797; c=relaxed/simple;
	bh=uQLvCLyLKewaPBfOITpkJUe/bRH5dqsoapo9fOu8YkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGqYEUzUi97iAOqE8f1+lrQ1tYHx0ZhgKAWq6UyaqzhapV53iQrVOPsZNsq4uGnch3EWtwvkcc0SKvFTAm0VvWMRMRI6ceStQx8FhJhLhJeXYPGc2oRbLyyT9AoocES0uCmVbukm5Bc6B+yAIvX6VXSjztIWBo1eCpT4y5phUjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuaSAZeb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBN0ZsZM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuaSAZeb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBN0ZsZM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KF8JmB748568
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u+V9cVsKTNh
	VN5JgnurmHUqaFwybS+3Yl850UmViNVU=; b=YuaSAZeby1ujciVFSKjkfjOJWEB
	/BNSvVWFrwpINlIANgENFA1odq8X/Fk9+OiW1fJ7Sjg5FJoE8biY4I+VqKNVl0pk
	2Hdqi0qmyrmabO/eE3Oe1lNFwCPIwLWXe3VGzxX8/eaLa9O03Qqo755nOszwbbvI
	b+fxf49nYLNkZ/ehFqCfJdUh2a5Os06zS2YuW1wvICTJZOvjmuVLBij2/QhHdJ9s
	r7jjQmvgqrS5T+GeQO+ozFSS/aGCzp5zSrC28BHBQd+d/wz56wF+7vU4mPrlZXxh
	O2cLYh1Uje2ILgsP007rvxtXkxr7cyryszM1T+pR7hl3shmZ1o8hDL8p0hg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6j1mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:09:54 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-65c62ca395cso9826236d50.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779325794; x=1779930594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+V9cVsKTNhVN5JgnurmHUqaFwybS+3Yl850UmViNVU=;
        b=CBN0ZsZMkGloV1S/5i/E8jBx/yhCpWZRxKrMyOHDW6Hbq8Salz5HCuzhC/bUC4w9pJ
         J1GI0KclwXmEt8XQNBY/G5aoSSN4STrWkaAM889XpmtcBRn9nfrFqJVl1SHLSEDH4W/t
         4IMrKZoeMoOu3sQX2ziKLtinOF/X3xFtVVi4ysMPbpfrID1ZTJfAgP/qzpV4Vahy1Gxb
         +cy/RjU5BXJNsPHlv5ETp/eZK74Wcakho57JxSgjTuA9TIZ3pl22UAPlko8K8Nx/5hS6
         ywteEOPWlpOseq1kxMe+HOCd4hYwT6cUiFcF6Mdh0VDAH+W5uDA+KoFK9+cRncm00kXn
         Rg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325794; x=1779930594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+V9cVsKTNhVN5JgnurmHUqaFwybS+3Yl850UmViNVU=;
        b=HeXQ6hxlrbadZPuYKVGsKTiwX6I/wkfPJGfrXTqSBn+viA7NVd2Bq63d7GhxIm+YoU
         /X7Nbzg6mMl3RnAT0K9bNav7kzRwmUqP03/SDUlVROBv1RbnKDTY2tQ1ovBx+FAsHEle
         mb7Kfcz2MmpHG28jQd3aBy7ZR4xaCmKqX4p0JO0f65y4f+LBoBXO1NpxOY4FI25Uuex1
         Z+X/ILszTH2G36QgKvU0J4tN1FcH2Jf4R4vb0pNu1RIFddd5Lpz377R6drsn4tjymxkk
         y0EirVIcaLiYcqL9pwJRiJEG5a6FBf3pwyoFszcu8oL8Dc2ROHTQxowM8VrekD9AKbcP
         IYPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZT4RvPXd13Wt2FMgSBxFcyAT8yCa8qLwJ05NLVSOdXcOcbr+/s4gjFnVsLmSbTC2uGZldqYcfKiGs@vger.kernel.org
X-Gm-Message-State: AOJu0YwtPOS/ovGYJ5B0LhYuyo3LEIXAoH6leVOf28AjQui/3VRz4aSr
	LzR+g/mK9qPm3GnwztwfI/Zeo3z1Vz1QfqdDGvzZ5Dq+9awZYgqrb+wuF08VZVNqzMYEZ3rxYWJ
	bjlPcTjbzHHOs0hreJUzOY3v+bY+vePpwMGq1Uc2PDHGn2FgGoGaV4pzCcmn4+Kn3
X-Gm-Gg: Acq92OGVL6SB9AQBJze8Fi8hByN6BWlpyUmeB2P+UuBfHwn3eM2Kxvc423pjBhy7CGQ
	Dz7SacCBa2BXZVLhKrRni/FV4XgtSYMZdgEnaEkV+VmmWoi83pqEOiTwB26bgt3te3aTfFzjruk
	ph3nElbkLxCVtxniTJNw0hkSAUNfFQHg98fawt/GAJGvarcKTjyrWd5NZoNXhU4r83QwnfhYV/k
	+aQ9Ieh3BJGRp0sUclSglVQByIGLAl8iDvK3MQPddpsKt6wEIrw1fh27cM5Esu4f/+uftBiUB6w
	LZtQFa4OFUTcfqerZn/AG0kFdiPe+TIIaOxFXJlqVAA70hP2olae2DPXLiWxHUsBcXsZLP4cRNc
	ryHaV2LzIzCXKsWyceLd1NWjDWL2VRhMF4Wa0zwxjf5zmeBKXyxJjrE3+aK1/KTATGSvYuSKyN3
	YhVHiF49gTj/vL4Y0=
X-Received: by 2002:a05:690c:6387:b0:7b2:136d:240a with SMTP id 00721157ae682-7d20aa9cb6fmr9422047b3.9.1779325794027;
        Wed, 20 May 2026 18:09:54 -0700 (PDT)
X-Received: by 2002:a05:690c:6387:b0:7b2:136d:240a with SMTP id 00721157ae682-7d20aa9cb6fmr9421707b3.9.1779325793555;
        Wed, 20 May 2026 18:09:53 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60851307b3.10.2026.05.20.18.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:09:52 -0700 (PDT)
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
Subject: [PATCH v2 1/4] phy: qcom: qmp-combo: skip USB power_off/exit after device teardown
Date: Wed, 20 May 2026 18:09:32 -0700
Message-ID: <20260521010935.1333494-2-mike.scott@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0e5b62 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=EvQFHbMspfJCUfrvVzMA:9 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: Sjo8SUSSdeUxBiON1QsjJ9l2KL7Yd23h
X-Proofpoint-GUID: Sjo8SUSSdeUxBiON1QsjJ9l2KL7Yd23h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOCBTYWx0ZWRfX2exGvBx37ifj
 b3aU7zOzvPz8z6pM0fa6cKV0jLzh1FSqcOnBlCukNuvxJ4M40Rkez5gVMV2AYXgyeIReLNbPEKn
 +upekuHdKlP9/8oiSunoAgD3drq+Q4mUMh9VPXM0hwXNb8KvetDj1+tYM6hqHGsh6tiGlyJtOQn
 CoG3Lrpc50opunLNZgnAvNrShQG38nZUDKg1VmoyJ0eo6QP5AIBiJIIcBagPkGhk8290vWPjBzY
 fNpf6QY71y9DHKKM4czetTomH12YRNWV1HIRZ9TOwB0p6ps+vk8OhNJZBoSOCQZfWoQ/KdIZs4O
 kQt5xx8ZhQvKscsZhOCyNT51xRB2wkiVZvsbTZaumcZFk3lpOQa5DTBOOyuXzvDx9kZqLETLMQ0
 Jcla+hK0oQMTDPZaHY+nrpChRm5FLQgmJxgLArVBVERTZ55dPDV0EcmQnxAKrgsr4fwWKaZKy2A
 Os4s6V3s2u/sezRB66A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210008

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
index cdcfad2e86b1..0db200292642 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3926,6 +3926,17 @@ static int qmp_combo_usb_power_off(struct phy *phy)
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
 	/* PHY reset */
 	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
@@ -3968,6 +3979,17 @@ static int qmp_combo_usb_exit(struct phy *phy)
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

