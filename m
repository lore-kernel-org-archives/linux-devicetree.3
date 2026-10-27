Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104530;
	b=ws/865Gczdws6DK5ZZiRYAwj9SugG6y9igpC9Fx5HuKdEitfXCMzLBl8S9HdHsOs0NAe
	 P5wyIEd6flPcu3abAF+KT/R9Dhr0atrXFCXhdXZnYeMagPTJagKGXkVVI5WoUB/C+DOL0
	 GoOcQMLz+OuhAN3Y7ODPQP1Enim7HdC1bWKE6peHiy3sdXAsNJfF6c1peOgN6z9VGwXom
	 36o7IKwvloOcS697ZkFn4JIwMS6Vcxj2FCvJg/2N1JmNGAoyZjBhvaIFt5hZ0vnJtwUGo
	 D22ZGfdSDcikCP4uTib5R7mZvXeXMocLeED/W9xU37LoJlIYq/3Dh7dyykRaXVpdkAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rmsSccCdCVqEkz9rVQlbpk23rbdxQICURfkwTyElrOE=;
	b=tunEXVxVbiS6VDPTZA91CjzZ+yGOHe+/pwXcWrnyAPB+rGDhzVP8WXkqbRWrheclXNcc
	 6PsW/5OkzFSukPS/xgEh0M9zXjG/kX4RG4xY8OXVvbhwVpEjp4QWRQAJekyl9eYZ9g2pL
	 MZCk9wITlKVdjp/qlMQjlCsI4KLjMqOUhzYn2vraU8826YPAueyOBm6Z4WN0eALOAoA0w
	 XnhwN0wq4rukZ8OzNa97bl4h38wPrUHRx3MetCTkHngUq8Yb6aVnx+wQHBoL/sfcs5sPM
	 1BPi1AQ4l1WVmXpgP0N6ZeVZfFgM6OHC5Tf7C562vy4VYD7YThRgI+/aYuEVSBZ6sEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SyFUWO2s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQeJFbPw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE55606A322
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE55606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SyFUWO2s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQeJFbPw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeKAV1427433
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmsSccCdCVqEkz9rVQlbpk23rbdxQICURfkwTyElrOE=; b=SyFUWO2syPxPDET6
	7LmY9HH6Hl3n5bBbrQpND3yp0XaCpbpAzaxrWqm/23YjGWZ+JuO52POoX6Kamu0v
	nImeUsn/j3nYckOnrFBK0F7a2C9w5j2u0Ch88S/+K4nliaQM0I3Fj+1AcoVR1Yii
	5i6W5RfI/EMv5O77RKFV36nnmAvYW4Vj8LIzFBZ1j37160A7bbPu2NydCzGL5ih8
	Zs+BUrlfLyFsl2iOpgXXXn82ApBeFcDbtFieOiYD56QaXnwMpWQ5TGIbHm9DbErY
	G8G6RWnRxx/urEJLSmKHD8zRpUKKtG7pcqQO2T8LBXaywV5ICgwKUYENWspmjNAD
	PO4zdw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbkaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:29 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836caf085e0so61705717b3.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104528; x=1793709328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmsSccCdCVqEkz9rVQlbpk23rbdxQICURfkwTyElrOE=;
        b=iQeJFbPwd0Dt8k3dSAR9fZHyu0W/oe9pjhhhzptg6Vh7Z7J850/xJpUEVOduIiIGT7
         Z06MSZIgKe1S7t2g0q49aSjMBGfag4wez7d541WzpaI8Q2Do7m4MXwAdMA6BSRl8vs1y
         9JOZtzxQVtGR+TVfAkvp277zvZbJ1GbmKSg2L/2YHDg63G81kHeygP1SfxUfegWKJCOT
         Etz7PU2eesTRHfs8BK2+7i9U5Gwt2/YdqRDcIa7aRTB3k0LxKhwU2pI+jzdBXwE78XGv
         QwwHjQybNNbpSAQXIRuIklCaZY4+FVXzOnS4ep05YUILaC3PNbUfSaic+1yf+Ine/1pu
         T6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104528; x=1793709328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmsSccCdCVqEkz9rVQlbpk23rbdxQICURfkwTyElrOE=;
        b=0z+TefMfrAeW9sSg0neyIHBh8EZbj1XMK5NX7ivLxd5bNcrN6aUo3YPMmeeYPRPmUE
         9XWZ9xAsMntkXcbPE9XIHxlYsyAkn1Kso1M51RWzMpIANnSHL13BhIaGj/uWytH78kna
         9V9ACZw3RcHaymtUaJsYQb1+G0PD7xMgO6XcE549Ho/cOWLbV+uTYMB+mlaQu2DaY/5R
         aKUrccg52E1eXGRo0ZiFSG67+tzrw4S7ReH8DYFmxdzflpnc0nyAxeuvKJl7kigirq6E
         h01SM5OnjKWpwecrW5x0g41QRrCdb+3uIFmDuZ9Ib2j8gDCLhUnD4r2hUEu3qfSehDkj
         bWPA==
X-Forwarded-Encrypted: i=1; AKwUvBz6PzB2CU0TLNesdAGiLMlFbJT6AaWPkx2F2/gIEAtteIX0AQuJPQJmHJEqjVHLcpSGa0pBwxtCsYYg@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8a70ZEbLBo6G2WObWf2NoiB/52T7hKmyhkGvrnq0w8PqmLOKb
	PdMZq2TVPB9FRE0jXTdym08g73t24JSEAQic+qw+jcvw6Dri2gnjKvMhCr7VwsfOJJo2NJIN17Q
	PnQT8EP0eG6yJH7Z3FI/HO959ggVRyXCZT24XgbIXD0dEUNqr4extYJg1uD3dTzlM
X-Gm-Gg: AYBFou0vOf19PVMCJa0jXvI/ZrZGyPDAMAPJoKnfeeIIZCUACOcNRdVmTdi4XApbPI4
	EUYqOYt66AG80LZjPr2zLeFR5IP6B/YKriQarq9t/ETSKYsgC5iuGHF5D8Xmi4WFCl5AmDt/JG5
	x4Sl3xeH2CUoiP5wtBNldEZgvEPsLlweOpXNVwBbtZS6sMM4xZH2ZDff7ndV9xRbewwrtxQDJzv
	313835pyOy1ixOUfA7wjCkB66vCbzlC3y93Tz1DPsKCD+X+IF2AzJ6V3w1yoW+HyTIb+EkOoUYY
	jC/IQwXfGDwcoFtyxnFiPU3o3y9AXv8XaPViQ7Bl+hnjFCNJaTnFVVqoNXz4TK+3OvJDym3mKjm
	LC8fTbMTzOjAFmsiFVw==
X-Received: by 2002:a05:690c:d85:b0:8b0:d4d8:e0d5 with SMTP id 00721157ae682-8b166ca3a17mr80538517b3.59.1793104528327;
        Tue, 27 Oct 2026 05:35:28 -0700 (PDT)
X-Received: by 2002:a05:690c:d85:b0:8b0:d4d8:e0d5 with SMTP id 00721157ae682-8b166ca3a17mr80538297b3.59.1793104527694;
        Tue, 27 Oct 2026 05:35:27 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:27 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:19 +0530
Subject: [PATCH v5 2/4] regulator: core: Parse regulator-off-on-delay-us
 generically
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-regulator-off-on-delay-v5-2-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
In-Reply-To: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=5262;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Mb+M13JU33yRl5ikfmNSIlfE5FNtWfL/XYrlwXjHaO4=;
 b=phXB8dnkOoxUJ8v0LWqSSWOfE0HrIW6SKSKQDL8XhnEpNDY88R/Hd3QbR3qO4HDss9J+xbEnn
 fr4oPndo5wkAmScoja96va5CsjgBxqaCe6X0q4GPx/pqRZMyYjG85Sv
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfXxSaTyohyVsxP
 Z/7V2oMcpFvCVOVCqNmNo7vCZDDr8/KsAM4+WZMe07S97a5BrqAEMgCTZims4bTOeKFtJv3ERI3
 KwPKOjHyfoJrak7dtKxzXU2g3oKmtL8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX76HU3N19+HHS
 Tozfo7wnK8i0zehbH8sXdsGkqopMz6xq64D3vUNwLgRvgPwOkN6HRewpqcqZpqGiPPSttxFOhIi
 hgksuejhQ960rFf7Mg/Mxl4660t8weikaMi8BCQugYGa5IGETQfhf3xEIWNTUKRlkXZx48tLp9X
 Z+0mqbQ7XdnECUflPL6C0MZXvbR5lKB1Jv5uFA4gmGAydoExOsXDUDq2gm1StPVPeAgJXP3vPEB
 704GWWKQGzJCKX1C6L0l7Jse03r5poKnucYzizMjxxYgGhlT3+IDcGhyAYRBXqnFFihCIaJbmwu
 uNFCvNW+L3DO2b0USG6F5lKdFiL0RnTT5XYjqZ+mgzVWLq3Ozjql7QYfKGoSblJV3hzgVFGSJn7
 My4j5K8p1w19i3YJSNOCJcKJAhRnIS9GNMKzDOtZqpSRRayAt4NwlRWbSsMJyYLwJL4QLfSyksX
 xCRtp9FNEJXxInv6SxA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae09a91 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=f4amEbVUL3UPIz_tOzEA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: 2IUXhLbrzKiBtws8jfAKrwz6rcAeTS1G
X-Proofpoint-GUID: 2IUXhLbrzKiBtws8jfAKrwz6rcAeTS1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270050

off_on_delay is normally fixed per regulator type in regulator_desc,
e.g. hardcoded for every LDO a driver supports. But the delay a rail
needs before it's safe to re-enable can depend on board-specific
factors like attached bulk capacitance, not just the regulator type,
so some individual regulators need a different value than their
type's default.

Add an off_on_delay field to struct regulation_constraints, parse
'regulator-off-on-delay-us' into it in of_get_regulation_constraints(),
and add a _regulator_get_off_on_delay() helper, so a
devicetree/board-constraint value takes precedence over the driver's
static regulator_desc value. This lets drivers rely on the core to
set this delay rather than parsing it themselves.

Suggested-by: Saikiran <bjsaikiran@gmail.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/core.c          | 18 ++++++++++++++----
 drivers/regulator/of_regulator.c  |  4 ++++
 include/linux/regulator/machine.h |  4 ++++
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6a4008f387b5..537384c55d6f 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1401,6 +1401,7 @@ static int machine_constraints_current(struct regulator_dev *rdev,
 }
 
 static int _regulator_do_enable(struct regulator_dev *rdev);
+static unsigned int _regulator_get_off_on_delay(struct regulator_dev *rdev);
 
 static int notif_set_limit(struct regulator_dev *rdev,
 			   int (*set)(struct regulator_dev *, int, int, bool),
@@ -1695,7 +1696,7 @@ static int set_machine_constraints(struct regulator_dev *rdev,
 
 		if (rdev->constraints->always_on)
 			rdev->use_count++;
-	} else if (rdev->desc->off_on_delay) {
+	} else if (_regulator_get_off_on_delay(rdev)) {
 		rdev->last_off = ktime_get();
 	}
 
@@ -2071,6 +2072,13 @@ static int _regulator_get_enable_time(struct regulator_dev *rdev)
 	return rdev->desc->enable_time;
 }
 
+static unsigned int _regulator_get_off_on_delay(struct regulator_dev *rdev)
+{
+	if (rdev->constraints && rdev->constraints->off_on_delay)
+		return rdev->constraints->off_on_delay;
+	return rdev->desc->off_on_delay;
+}
+
 static struct regulator_supply_alias *regulator_find_supply_alias(
 		struct device *dev, const char *supply)
 {
@@ -2985,6 +2993,7 @@ static inline int _regulator_check_status_enabled(struct regulator_dev *rdev)
 static int _regulator_do_enable(struct regulator_dev *rdev)
 {
 	int ret, delay;
+	unsigned int off_on_delay;
 
 	/* Query before enabling in case configuration dependent.  */
 	ret = _regulator_get_enable_time(rdev);
@@ -2997,11 +3006,12 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 
 	trace_regulator_enable(rdev_get_name(rdev));
 
-	if (rdev->desc->off_on_delay) {
+	off_on_delay = _regulator_get_off_on_delay(rdev);
+	if (off_on_delay) {
 		/* if needed, keep a distance of off_on_delay from last time
 		 * this regulator was disabled.
 		 */
-		ktime_t end = ktime_add_us(rdev->last_off, rdev->desc->off_on_delay);
+		ktime_t end = ktime_add_us(rdev->last_off, off_on_delay);
 		s64 remaining = ktime_us_delta(end, ktime_get_boottime());
 
 		if (remaining > 0)
@@ -3243,7 +3253,7 @@ static int _regulator_do_disable(struct regulator_dev *rdev)
 			return ret;
 	}
 
-	if (rdev->desc->off_on_delay)
+	if (_regulator_get_off_on_delay(rdev))
 		rdev->last_off = ktime_get_boottime();
 
 	trace_regulator_disable_complete(rdev_get_name(rdev));
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 09e26febfc83..990946b27a7a 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -178,6 +178,10 @@ static int of_get_regulation_constraints(struct device *dev,
 	if (!ret)
 		constraints->enable_time = pval;
 
+	ret = of_property_read_u32(np, "regulator-off-on-delay-us", &pval);
+	if (!ret)
+		constraints->off_on_delay = pval;
+
 	ret = of_property_read_u32(np, "regulator-uv-less-critical-window-ms", &pval);
 	if (!ret)
 		constraints->uv_less_critical_window_ms = pval;
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 1fc440c5c4c7..79b2d7cab934 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -163,6 +163,9 @@ struct notification_limit {
  *		      regulator_active_discharge values are used for
  *		      initialisation.
  * @enable_time: Turn-on time of the rails (unit: microseconds)
+ * @off_on_delay: Guard time (in uS), before re-enabling a regulator.  Takes
+ *		  precedence over the regulator_desc field of the same name
+ *		  when non-zero.
  * @uv_less_critical_window_ms: Specifies the time window (in milliseconds)
  *                              following a critical under-voltage (UV) event
  *                              during which less critical actions can be
@@ -222,6 +225,7 @@ struct regulation_constraints {
 	unsigned int settling_time_up;
 	unsigned int settling_time_down;
 	unsigned int enable_time;
+	unsigned int off_on_delay;
 	unsigned int uv_less_critical_window_ms;
 
 	unsigned int active_discharge;

-- 
2.43.0

