Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104540;
	b=PJO0PUR4dQDPc/8BLk+5rAltn8TIbQWpTGevdDuATgG62ckxHH8hZsHFVXlxqkSDPgpY
	 n7dkD6FAVKJcuMMRq3c5Tw7dZ37VMq9vk3SI9wHsQ3qgPzndIghnF6lUnt60LUa9b/ou9
	 A2Rt8NM8JGQhkk1hTe8yTZeKcCjbOrWgVo4PT4BkFWMbpOoazoIJDfF3HHox8TwMAqhlr
	 gQVYnzDnr+MEHo51fPC/ZYVFj9OBHlGeiVzRH9YGUpppSO3Bz2M8LzdBd4gdHwkVqy0GC
	 yAsgqlnkFMQ7/+WbskfJ/SnyiRQBjS132MhHgUisX/JKlPNu+2KFh7MP9VBwMVhMfyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h7LPiten+di9v04819rN8XVXOYlJoCsA50fDwSLZnhA=;
	b=A151LZQkSRs5theCyUADc4twCDbegYI0wi95QRTGUON9wPbM6Tfz7ubAaa5R2rzOazJ5
	 F1Q3k2XZC1P8PP1usyQGIhIdUJUjlLVMliLWQ8ujyFDD+dwi1ifWKTTLPafsjfP2pggpx
	 OTNdB9y3ortV/QcdSlhBoWZxzPdpQTK6PCZacGUQaLDZ1Z3A5h/nis4uNiEt7AlsQVESp
	 FejocHnbPHy7r+kGyxSm2Xct8WZIqBmPlQ4kQg4wPYJnQ6s0deZfzO4biMrt0CsLGvfv3
	 qhMJ/H05Fdr6tNu50uesLRBqDPi1HSFthMOuECV0ec6AD5RCbEyDk9LKkXHG9mGCDOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oco9Gonv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eIQNqsEk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45139606A334
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45139606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oco9Gonv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eIQNqsEk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RCOCRV1125023
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7LPiten+di9v04819rN8XVXOYlJoCsA50fDwSLZnhA=; b=oco9GonvR/JvauPF
	UqVRBZ+M86Yru00uzdrv13N//n9BpdHKHRwi3EVh7mPPCNADLgeW5MsjCa9o9WI3
	zNRW/lA3SvsZNFWNKmK4FGsn1ZqOMiG/J+Nn2gZHcRwqL1nAW0YYuF66SxtZouD/
	ixSJFke0fbS52K94mJPFF17X61GPuIADnjBd2NI0HzBcUYR1SAXTFutKmZD2ZjEi
	lcbDSQD99aOlYU6BpJjieqJ1nkCAcCjfb+YuRda+VQTG4HWjsgT+YFzpnNML6MW8
	BwBjTPgXnmL1U/2LmIlYsYPr1oPlcErEl8m7IPv5zeo3Y3EQKvcECj/dDm2wQSd6
	L7pGAQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux981aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:39 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b160a0ceaeso40052127b3.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104539; x=1793709339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7LPiten+di9v04819rN8XVXOYlJoCsA50fDwSLZnhA=;
        b=eIQNqsEkbYz53ZcmBNu0sTascovpHfcFJIjEaoUcLXnQx/wEJy/Ki7OprbZsvS300L
         +KYCNf2lqem/NiR09wJauKqH66aeng5y5JnTJnYe6Plubiv74fgNst145ZiUBEdg8Q0Y
         wxm2MzLsItHLPYZgjARFdXlWE6xbVd0BWf/8+z4bRrjyxFGvA6JKczG/SDbX2eVOZjOk
         PG2RoMzF8hSFfNGk8XpsJSoZuNZx7nktSHPZ+HVaa+ZuOBXMrM5fOMgTEsHY0BLjuhaX
         pi07wKUMUKejpH8kgU8swDZTCSpEz3MeM3gd05rDJGFUdFj+nfPqT6ZxnU1hKLo2lfaM
         EHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104539; x=1793709339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7LPiten+di9v04819rN8XVXOYlJoCsA50fDwSLZnhA=;
        b=VxAL8FYByjXzReTUFjsDjtjTANneflHSHPdxyBAfgd6wGWNu87YW79X+dFEWmxjJcS
         aC0ka9NKjdJfjsVk3fl24/iefmMB+dm8kbLM07wHLBbu7HG69kSpHawKE97GC1xEszod
         AHusf6qGXojvOfZEnV5hF2SvQQRSM2dqzpuym5wwz8Keft3w1JEH0tgTDXPrO1JpHVZk
         b8ztSdoL1kcUY2YG3cuaSCa3/VJrTlCZlS9Q+O0DrjXu9mSOXJhyLox1o8RjPfLxnRLO
         3pycl8SIElR0uCicWjklb6OgCPrsTUbowNWBhahEoMLljmXjpEL88nEYBHzbrB/bNcgG
         R+kA==
X-Forwarded-Encrypted: i=1; AKwUvBxgsF0W9HsTUpI8rgqnLZp7FCmTHPGlvRhhgDBK3+qwI0Lc5+vOaUp9xkLGNAYYWzzsYYG6fyQtD4Pc@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1YwgCKaPEWv9nqTLUcXHGPp1Gn1iniTx8hwyXcpUB8yr5ho5R
	mG8L0kUOTrTF5rMmvePtgqUE5sI7H++iVAbaSVNlUa+Drtf8W+q9FVb6oYJRN1QLyn0r5R7xRQ1
	+yzP7mhS+Qr5dl11RAvI0n/BA7z9jY7Uqx72VFYiyh2zoQeX7mCJoBTcoJH6Hjr/1
X-Gm-Gg: AYBFou1LCzCrhtcfJq/Hci4pp7YS6cstmgDeXB9NfSCqrTvHh5CxAd3cOVyI5gRkz4d
	Hppfq1Igvm8hvuciLAY0ru633+NwEHndddElN617jgPFfPOE52klVRY25M/GjrD1ixOam5CAs5h
	Wj8hGaX01Fwnyk0MN+N7nBXMveMg54BjkjufY8tVY2G+db2xrWp/QYjubBaxOb9DJhrdn7zPC0M
	bZrotXs+kmUbYtfZtd3ardCt0hn8CegLNO+NGsTNSVxHTGGA6+W36HUsySVccbuu9w3t2s0MpUv
	uyEmTFgwlKs53+2bzoSvgbFWpJi4fpkJHI1viEYmiUrWwHkWCWgWz+m0HlKZDBg4eo3uNYy7em0
	h/eNDilshpQWzAlNuJg==
X-Received: by 2002:a05:690c:c1d0:b0:8ab:3a97:d7a8 with SMTP id 00721157ae682-8b166c6c6f9mr50084837b3.80.1793104538539;
        Tue, 27 Oct 2026 05:35:38 -0700 (PDT)
X-Received: by 2002:a05:690c:c1d0:b0:8ab:3a97:d7a8 with SMTP id 00721157ae682-8b166c6c6f9mr50084747b3.80.1793104538052;
        Tue, 27 Oct 2026 05:35:38 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:37 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:21 +0530
Subject: [PATCH v5 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
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
Message-Id: <20261027-regulator-off-on-delay-v5-4-f9c3b128c6d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=10342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=FhLJy7uEHEVyt4Rj82xe/unoocNVLUuPP1fhE8/LNHw=;
 b=0w/Mp6Np+ydqUXnw0o+5C5f8mb+KDriZolB3aj+bypyI+eEeSiaIz+3yozK2W7X+In/BtOVNq
 WxNNs6qqenZAfToQYZE0uzqto9OGeogipg0OD4crleMlvTTVCNqyZzn
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae09a9b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=__8GP452ZJ-5y0T1skQA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: mRvYzL_my4whziqBuYQ74L_OtVyOjrro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX8T6yIa6JHOB/
 QZZ5X0mFCmiEv56FCsvICi6sjhBy33aGwDIYop/XK0Rr5Lf3DEAMxfdFpHBHwjkI7Az/5Qb6inO
 gwShQ3ukuQG3hMkzev1zorkQytF5Q4sisriWbzaCQ5VGef6sJffs1mIbXGC/Hj4rGtERUnB7waq
 ZvSPSbbMYPgOZ8+payTGo1VZPzR72ALiDCYJ4A9fyOMJ8+T/nVN8cwA21WHbZpI8pKFFO+SZnWg
 mqTGGTEnpp7kpkLy4i60Jn+Ln7Wp/K4PlBII+VEZ3RqtxqibJBN+JCYVBq7VtoTZB9qYmWptyXG
 lkAcqskjUtb3CxU7AbSVShx7+VQAdh2UU9X0/VfwZvl/ur0BCmAn4KMf9t40Pg/oinhUvNyX1G/
 lrg6RdYbXiqEYQ6jfK9cNBhy40m7lHaaTnbnOEGvdJ4e7kA1Xw49VLCGIxRFyDsEVZ63IVyrh4h
 PqJJWKBZwkXMzUgLp6g==
X-Proofpoint-GUID: mRvYzL_my4whziqBuYQ74L_OtVyOjrro
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX7gM3ZGkA6ART
 lpKDwGLqeBZnhv+6xW9xpg3U6GlNOBHrebzsa9/zBbMSSAgTkuSB6aKr4o6266BNzY2es1wb3JN
 lkzxofoYx/14Vnv2H2hHQmdYysnxuUY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270050

Some consumers rapidly toggle a regulator off and back on, e.g. a
driver that disables its supply on -EPROBE_DEFER and re-enables it on
the next probe attempt. Sending the disable to RPMh immediately causes
needless power cycling of the rail.

Add a 'qcom,regulator-off-debounce-delay-us' property. When set, a
disable vote queues a cancelable delayed work item instead of sending
the request to RPMh immediately. A subsequent enable vote within the
delay cancels the pending work and leaves the rail untouched; if no
enable vote arrives, the disable is sent once the delay elapses.

This is independent of 'regulator-off-on-delay-us', which enforces a
minimum off time once a disable has actually reached RPMh; the two can
be used together. See the comments at struct rpmh_vreg's @lock,
@debounce_delay and @off_on_delay fields for the locking rationale and
how the two delays interact.

When debounce_delay is configured, off_on_delay is read from the
core-parsed constraint but tracked locally (see @off_on_delay) and
enforced in enable(), since it must be measured from the deferred
RPMh disable rather than from when disable() returns.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 166 ++++++++++++++++++++++++++++++--
 1 file changed, 159 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 25c14de3cd8b..28060bcfe48f 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -5,9 +5,12 @@
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bits.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -15,6 +18,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
+#include <linux/workqueue.h>
 
 #include <soc/qcom/cmd-db.h>
 #include <soc/qcom/rpmh.h>
@@ -160,6 +164,33 @@ struct rpmh_vreg_hw_data {
  * @voltage_selector:		Selector used for get_voltage_sel() and
  *				set_voltage_sel() callbacks
  * @mode:			RPMh VRM regulator current framework mode
+ * @rdev:			Regulator device pointer registered for this
+ *				regulator
+ * @delayed_off_work:		Delayed worker used to defer sending a disable
+ *				request to RPMh, so that a quick subsequent
+ *				enable vote can cancel it instead of causing a
+ *				disable/enable bounce on the rail
+ * @debounce_delay:		Time in microseconds to wait for an enable vote
+ *				after a disable vote, before actually sending
+ *				the disable request to RPMh.  0 once torn down
+ *				by rpmh_regulator_cancel_delayed_off_work().
+ * @off_on_delay:		Like regulator_desc's off_on_delay, but tracked
+ *				locally and measured from @last_off instead of
+ *				from when disable() returns, since that return
+ *				may precede the real RPMh disable by up to
+ *				@debounce_delay.
+ * @last_off:			Time the disable request was last actually sent
+ *				to RPMh. Only used when debounce_delay is set.
+ * @lock:			Serializes disable() against the teardown
+ *				action, since both make a read-then-act decision
+ *				on @debounce_delay that must be atomic to avoid
+ *				queuing @delayed_off_work after teardown has
+ *				swept it.  enable() needs no lock: its only
+ *				shared-state access is cancel_delayed_work_sync(),
+ *				which already serializes against
+ *				@delayed_off_work.  @enabled and @rdev are also
+ *				written by @delayed_off_work without this lock
+ *				held, so they use READ_ONCE()/WRITE_ONCE() there.
  */
 struct rpmh_vreg {
 	struct device			*dev;
@@ -172,6 +203,12 @@ struct rpmh_vreg {
 	bool				bypassed;
 	int				voltage_selector;
 	unsigned int			mode;
+	struct regulator_dev		*rdev;
+	struct delayed_work		delayed_off_work;
+	unsigned int			debounce_delay;
+	unsigned int			off_on_delay;
+	ktime_t				last_off;
+	struct mutex			lock;
 };
 
 /**
@@ -290,13 +327,17 @@ static int rpmh_regulator_is_enabled(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
 
-	return vreg->enabled;
+	/*
+	 * Also written by delayed_off_work without vreg->lock held, so
+	 * READ_ONCE()/WRITE_ONCE() are used instead of locking here and at
+	 * the write site in _rpmh_regulator_set_enable_state().
+	 */
+	return READ_ONCE(vreg->enabled);
 }
 
-static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
-					bool enable)
+static int _rpmh_regulator_set_enable_state(struct rpmh_vreg *vreg,
+					    struct regulator_dev *rdev, bool enable)
 {
-	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
 	struct tcs_cmd cmd = {
 		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
 		.data = enable,
@@ -313,19 +354,76 @@ static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
 
 	ret = rpmh_regulator_send_request(vreg, &cmd, enable);
 	if (!ret)
-		vreg->enabled = enable;
+		WRITE_ONCE(vreg->enabled, enable);
 
 	return ret;
 }
 
+static void rpmh_delayed_off_work(struct work_struct *work)
+{
+	struct rpmh_vreg *vreg = container_of(work,
+					struct rpmh_vreg, delayed_off_work.work);
+
+	/*
+	 * No locking needed. cancel_delayed_work_sync() already guarantees
+	 * this work has either not started or has fully finished by the
+	 * time enable()/teardown proceed to touch shared state.
+	 */
+	if (!_rpmh_regulator_set_enable_state(vreg, READ_ONCE(vreg->rdev), false))
+		vreg->last_off = ktime_get_boottime();
+}
+
 static int rpmh_regulator_enable(struct regulator_dev *rdev)
 {
-	return rpmh_regulator_set_enable_state(rdev, true);
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	s64 remaining;
+
+	/* See struct rpmh_vreg's @lock for why no lock is needed here. */
+	if (cancel_delayed_work_sync(&vreg->delayed_off_work)) {
+		/* Queued disable never reached RPMh, so undo disable()'s flip. */
+		WRITE_ONCE(vreg->enabled, true);
+		return 0;
+	}
+
+	if (vreg->off_on_delay) {
+		remaining = ktime_us_delta(ktime_add_us(vreg->last_off,
+							vreg->off_on_delay),
+							ktime_get_boottime());
+		if (remaining > 0)
+			fsleep(remaining);
+	}
+
+	return _rpmh_regulator_set_enable_state(vreg, rdev, true);
 }
 
 static int rpmh_regulator_disable(struct regulator_dev *rdev)
 {
-	return rpmh_regulator_set_enable_state(rdev, false);
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+
+	guard(mutex)(&vreg->lock);
+
+	/*
+	 * vreg->rdev is also read by delayed_off_work without this lock
+	 * held, so READ_ONCE()/WRITE_ONCE() are used instead of locking
+	 * there too.
+	 */
+	WRITE_ONCE(vreg->rdev, rdev);
+
+	if (vreg->debounce_delay) {
+		/*
+		 * Flip the logical state now so is_enabled() does not keep
+		 * reporting "enabled" while the real RPMh disable is still
+		 * queued. Without this, a quick re-enable would see the stale
+		 * state and skip calling back into enable(), letting this
+		 * queued disable run regardless.
+		 */
+		WRITE_ONCE(vreg->enabled, false);
+		queue_delayed_work(system_percpu_wq, &vreg->delayed_off_work,
+				   usecs_to_jiffies(vreg->debounce_delay));
+		return 0;
+	}
+
+	return _rpmh_regulator_set_enable_state(vreg, rdev, false);
 }
 
 static int rpmh_regulator_vrm_set_mode_bypass(struct rpmh_vreg *vreg,
@@ -481,6 +579,36 @@ static const struct regulator_ops rpmh_regulator_xob_ops = {
 	.is_enabled		= rpmh_regulator_is_enabled,
 };
 
+static void rpmh_regulator_cancel_delayed_off_work(void *data)
+{
+	struct rpmh_vreg *vreg = data;
+	bool pending;
+
+	/*
+	 * Mark the feature torn down so a disable() racing with this
+	 * teardown cannot queue delayed_off_work after the queue has
+	 * already been cleared.
+	 */
+	scoped_guard(mutex, &vreg->lock)
+		vreg->debounce_delay = 0;
+
+	/*
+	 * Lock is not held across this cancel_delayed_work_sync(): a running
+	 * instance may be waiting on an RPMh ACK, and the lock would needlessly
+	 * block disable() for that duration.
+	 */
+	pending = cancel_delayed_work_sync(&vreg->delayed_off_work);
+
+	/*
+	 * If a disable() was queued, run it to ensure regulator hardware
+	 * state is synced correctly with software state.
+	 */
+	scoped_guard(mutex, &vreg->lock) {
+		if (pending)
+			_rpmh_regulator_set_enable_state(vreg, vreg->rdev, false);
+	}
+}
+
 /**
  * rpmh_regulator_init_vreg() - initialize all attributes of an rpmh-regulator
  * @vreg:		Pointer to the individual rpmh-regulator resource
@@ -552,6 +680,13 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	vreg->always_wait_for_ack = of_property_read_bool(node,
 						"qcom,always-wait-for-ack");
 
+	of_property_read_u32(node, "qcom,regulator-off-debounce-delay-us",
+			     &vreg->debounce_delay);
+
+	mutex_init(&vreg->lock);
+
+	INIT_DELAYED_WORK(&vreg->delayed_off_work, rpmh_delayed_off_work);
+
 	vreg->rdesc.owner	= THIS_MODULE;
 	vreg->rdesc.type	= REGULATOR_VOLTAGE;
 	vreg->rdesc.ops		= vreg->hw_data->ops;
@@ -561,6 +696,16 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	if (!init_data)
 		return -ENOMEM;
 
+	if (vreg->debounce_delay) {
+		/*
+		 * Enforce off_on_delay locally instead of via the core: it
+		 * must be measured from the deferred RPMh disable, not from
+		 * when disable() returns.
+		 */
+		vreg->off_on_delay = init_data->constraints.off_on_delay;
+		init_data->constraints.off_on_delay = 0;
+	}
+
 	if (rpmh_data->hw_data->regulator_type == XOB &&
 	    init_data->constraints.min_uV &&
 	    init_data->constraints.min_uV == init_data->constraints.max_uV) {
@@ -581,6 +726,13 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 		return ret;
 	}
 
+	if (vreg->debounce_delay) {
+		ret = devm_add_action_or_reset(dev, rpmh_regulator_cancel_delayed_off_work,
+					       vreg);
+		if (ret)
+			return ret;
+	}
+
 	dev_dbg(dev, "%pOFn regulator registered for RPMh resource %s @ 0x%05X\n",
 		node, rpmh_resource_name, vreg->addr);
 

-- 
2.43.0

