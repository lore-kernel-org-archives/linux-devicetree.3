Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746FD432E65
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455457; cv=none; b=soFtBwKN0MZHJS7Ns9teVI2KVXSSFlRFxoecGEVM/DF+tvdDCw69SOrAkrL0s0H9bAU608X7qGieCoXDZWPw9uA1y22f7wS3CVJ4B/k8OykpkIo01AxpdLYW4xuCsK1idmDtflCniNmjrCYozOu6YslXtpesoU7h0BpMfdQnoqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455457; c=relaxed/simple;
	bh=265Vl+KGGKJlE7e4ia8GTvvieO9JWlqLF0WeOn45tbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eM32lBCjPyoTiwnubeD31cI4sM/cMusm38fgFt/9m+t9PTXkoFRe0d1BEqqhff5gL6R+ungdhWM28NSuRBl1NFY5ziH1stmTfDKF9uoHUslNm8zWW5V9X/OzaXYQjhbjQHW7NVt7HVaJalquITTxx79q11FxWi/dYMnFOwd4nPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoK02wEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f75+G3FK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoK02wEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f75+G3FK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDXs481092542
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgXs96hhW9Ki7SDANwXO5TQ2I7iFcKSC+Ga62QuGtLo=; b=SoK02wEB9yOl4Uvc
	PUfHj2hxwTjwcBMizOpLdDnD3ySXVEyvEXAGvRM1wpx70/oc2IJju7hbGdCG9wwF
	LbKuUpfppX5yHuHsbNTCH6LfdVXxWBS8s15eM00ddqZx4zOXwBfItBodVU9TeoHJ
	jXJU4vzphURwxfc5/UkA3aRrh+QZGQeFiy99j21MF5aW6YhUJR3P4dXgK+/sl7M7
	oP3Vi6qxoUYhKp1B5FS3RbzAQvSTUPw62fZg7C5IeScOOP6XkgblC+MImJ4sYPNq
	gqjxqKl1EvJslhb5sSibeu1Jef3MgHu2/s4X+knaS2tYC9vVJz22wZpcHBWQoOeP
	y+xJIw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049er67r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so66314745ad.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455439; x=1787060239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgXs96hhW9Ki7SDANwXO5TQ2I7iFcKSC+Ga62QuGtLo=;
        b=f75+G3FKp/M+xdnklKiwv/crjcVC1Ifnaa2ZFf4NBgeoRcr2/APeBP1EK8x/kYJzKZ
         AiARPR1KHbYN4B8TahBQDJAhVNW7x4B5om1hkWTY3Bk53Nm/NR7MnnsOcUs0ATsJLlct
         qlEakjhcCdQU3Z5cQjhj9+sz16TU0hqCDGf6se+ptDQ72OSItfjU0TkuPLKs0XS1bm1Y
         P71cL3dd+xWmEl5GeNYeyANo8eM12PsKnBXifPkUPVL90aimmTUz7VZtL+b8m8hTyP+i
         qKRJAlIMKes49A2reIoh45Z3ckpZdiO7PPSyuiByB54omZqPSFrjxcDgUzi8x3YlSkaB
         1c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455439; x=1787060239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgXs96hhW9Ki7SDANwXO5TQ2I7iFcKSC+Ga62QuGtLo=;
        b=LiKYDRzOf7uvlAjekjSt8xfA2oxrv2XSYqd+QjMP8qYPWpFxgdEbC0AMydr9u1tsjS
         Wi91y01ZgSgENgjKnAb1EqHdmtWoZYrzdUJJrOOohxU43AbJboCWNJzKq1yf/p3L1mKY
         9Yf1Pj+0C13OrveNBSgCes0A77V/CNSW3yrZqyokF+HubsVZGFqHrlbbvvwJL6J9fpp+
         ECTF+bkAftkp5l8J4lMmOZg3OjGpUH4g/kM8gkRgQAkFuDlZa+0yHEG51DsW3jJyYPkJ
         OhBsIE1/urCn1hM7DLs7mnk9A8pfwNQvvEQJtnOIliz3Xz8yNV4ynEQUyOTt3/n56KEe
         f4yw==
X-Forwarded-Encrypted: i=1; AHgh+RrL4zVyqykYunxP46ug3GMl5yZtBp5835LirOjgvpLgaKaAIiz53lTiCCOQa2VFFwpaC5gMXEemhLwQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy1Hvc9Z7/p5N2bJ3ZYl92VGqoGBblUu698jcVTkgAzpRiPVo7
	vwfaqB2eU26ZR4GJGwfmc05C8i7kYfjf9WlGDiGuinwT1+Rg0hhZUXkq7G+vvJC65iMefrBFzlc
	cPU8YOIewt/f334Qh9Pi91VZOGYc7Fu2Rbt/LnZif+z53FOLqQO1/MUO/1bp2MZYX
X-Gm-Gg: AR+sD11EUZFWGt3yjmW962+eqZ2RA7Ob6mkpROzYe/8WYOPpb5FH35uT0GR+yUL+wMv
	UxkafgyZZbX8pTc3ouRQHD5rHc0LoS4KPicHT+JqcAZfQcEqM/K+UupfUR4FAhu0iTlfHHfvZXq
	xVdDA1uz/ukA01XC83jsSeVSGDQqZFJ5KQ0NMfqjDGN83hjuu7bKBr9FSt2KMKYKByxlT3UHh2s
	x9EapdTncs/Y4b3ubtnn5i0RHJF3Ud9nVwBs8V+rRMpNBQKGvLhvwh5oEgkk1fEYJjAEpH5+o+L
	WZM7Zrd3yvOqx/hPyDs4TOlpnX8By0/ruEIJ5/4eO0VI+LmFA73Gdt8Cv0kBHOdruvA0+TXoH28
	g4eTXCBvjNAV/sbTNrgmmsimfjVkC1iKq5MJaSUmyy/I1l4kJkA83N6tE
X-Received: by 2002:a17:902:e746:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d317760990mr38736805ad.4.1786455439092;
        Tue, 11 Aug 2026 06:37:19 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d317760990mr38735925ad.4.1786455438579;
        Tue, 11 Aug 2026 06:37:18 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:18 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:39 +0800
Subject: [PATCH RFC 10/15] arm_mpam: Fix update_msc_accessibility() return
 type to void
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-10-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455326; l=2343;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=265Vl+KGGKJlE7e4ia8GTvvieO9JWlqLF0WeOn45tbc=;
 b=djr9aNve5wpKqWWshU5FALHWaFXPyeUA2cp7+NxrGv2Cg1uOxFVJpeb42e/p6hf0sLykNWP/H
 SkK7iTfzlKiCYQyIyqto4bOcBPKWGLZQy5QZEZH4A01P2XCbmeyACG8
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXzgeWujzhaGlk
 2pLVlE3ZKR3Zspea5nMzyrNEH0wn7KkInkVGbv4xc4gpL0Op5yPm5jB0ls38mYcWNknVDMGB7+U
 9qYovXQDI/vtg42HRaduY0faknK2ctk=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b2590 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WfV1sUHbO1VEJ8_JC0EA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: i44RMlVHrj6KufQ3mx1dD6GvzinC27xH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXx9CaIsfHS8hM
 H7dLuhMgoOc/3O28CDRKmefY44Rc7LkcjoKM1nfYUDdepqSTROiHSa9W+X8jMWK/3mfe7EPoxAA
 AJjNFoqnjtA93qjJAYH5LUPDhPrvarol0elkqf57tdJNRF4eJAkHczTv3xGylxSt7xfPxGJKIFh
 FWjYlRLTmoC6oDozikOaNLFdrborzmTykQr42uF2mXyfn+maOzMKwLhtMqjMxKKKk9G2e0qXAjG
 q+/llkdk5l15z0sV70Ck5Pawxknez9DJBp/uwVilNJfeTdApAySXSpL+87FiSSQWpJQldgQZoOZ
 6eAaVsRJRJk/bQklb3SCxx8dZWdeJksjzqlgnh/dZUs8G1/nA2jr9jbcBy3gnyaQW+HCWElARjS
 OmuM7BEvPIcb/g3TbSh31SJLIjmIB3iTGj7zfH4p3DlsIv0NLeic4+qjOUG5ocVlyvJ/zujKDGc
 gCxfSqI5bcteExGo/oQ==
X-Proofpoint-GUID: i44RMlVHrj6KufQ3mx1dD6GvzinC27xH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

The function update_msc_accessibility() was changed to return int in
the DT support patch to propagate errors from the DT accessibility
derivation path. However, the function silently ignores errors from
get_cpumask_from_cache() and does not propagate them to the caller.

Revert the return type to void and remove the unused error variable,
keeping the dev_err_once() diagnostic for unrecognised parent nodes.
The caller checks cpumask_empty() after the call to detect failure.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 5d1854d97371..b0e67c8349c7 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2158,7 +2158,7 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  * corresponding cache may also be powered off. By making accesses from
  * one of those CPUs, we ensure we don't access a cache that's powered off.
  */
-static int update_msc_accessibility(struct mpam_msc *msc)
+static void update_msc_accessibility(struct mpam_msc *msc)
 {
 	struct device *dev = &msc->pdev->dev;
 	struct device_node *parent;
@@ -2174,29 +2174,22 @@ static int update_msc_accessibility(struct mpam_msc *msc)
 			acpi_pptt_get_cpus_from_container(affinity_id,
 							  &msc->accessibility);
 
-		return 0;
+		return;
 	}
 
 	/* Where an MSC can be accessed from depends on the path to of_node. */
 	parent = of_get_parent(msc->pdev->dev.of_node);
 	if (parent == of_root) {
 		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-		err = 0;
 	} else {
-		if (of_device_is_compatible(parent, "cache")) {
-			err = get_cpumask_from_cache(parent,
-						     &msc->accessibility);
-		} else if (of_device_is_compatible(parent, "memory")) {
+		if (of_device_is_compatible(parent, "cache"))
+			get_cpumask_from_cache(parent, &msc->accessibility);
+		else if (of_device_is_compatible(parent, "memory"))
 			cpumask_copy(&msc->accessibility, cpu_possible_mask);
-			err = 0;
-		} else {
-			err = -EINVAL;
+		else
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
-		}
 	}
 	of_node_put(parent);
-
-	return err;
 }
 
 /*

-- 
2.34.1

