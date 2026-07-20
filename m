Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26543B71C2
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531004; cv=none; b=Ftgi3TgsEyFSYFbcSq8u5FQXQopneBj8RmcbcuBxc8L+MZgTbqjHinTEMdR8o+Rnr8h0xw9e6bSu7ica7WF6xFqMm+Pqzetwo09tQhaxZgfLmZIj3vdywCSRyteehosvdqbmpy4A7CBL6ge0TATooi0ou09jxoYG+w9Hi/W7AMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531004; c=relaxed/simple;
	bh=MDFjA3RgAEvCtdRyXnAbVMy3S7sJXL7lribMJJ6+tBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvZBq8FFhexN5sam55vPFAccYSm2PcLjkJDWAem/y2Wp+KvKyI0tkn5W1DHJi+hh1cVruO4LR7A4ZYs0VfSlM75UHYh4R5Eo9oKUh+9irOetbrsjYBdqSLY0cR8JOpTi+DqR1FfKcywhWHb7HcMkMvwFhDrd4G0yC/Ql1kZ9H14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=aKwr+pic; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="aKwr+pic"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3811f512167so9650675a91.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784531002; x=1785135802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pX5vXL9Rltp502Am/rntkBhNRyHxfpxR6XXxdG/Nl84=;
        b=aKwr+picSxIJU1ehb88vHUxFKJRjm4pw/9A/Zf20fbskTTWukPZKul9wUwZzg+qu9w
         bHG058XnDm6tS8e6NnEEDtHLZx55bp0nOOC0YmHSkbcKpYzwom5/wh2DShmhnRKNgt6m
         Vx8h5IC66Q0pAYTBSlLo8YlfDkApmNc4CzXhblTD4SiEFS7UvpEfsWDHFkSX63SkX0lH
         HMUrQ4u/iqiBEtcvkHHpMaH59nfI0JGKTJ08tzCJv8toAUkoEkKqXgqoLd+3HP+irAnc
         cT5dlT+w8A7UaIuFJUQRCbrZIJMTvjOYIwA78Yi70LGBMzPEtgyHXbh4fj2P1rkRX3yn
         BOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784531002; x=1785135802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pX5vXL9Rltp502Am/rntkBhNRyHxfpxR6XXxdG/Nl84=;
        b=QL2f9mcM+pzA9Vf4nfsB9SmrjUh7n42Hfd+mZNqWDPKjLA31Wfwdagzpcz7Nvye3IC
         Baa7zvQnQT4m+T+BGPtX/8h7KCALNVCiZoKtE5llgFPYg2MXVb2J9RXPe9rrHvYgWbmf
         gH7f/35uEGOcBBC/0GOacE5w1E42ecjR1ptnRR+pzNg2jiCqgEb0fxNUPXkTykG+9DKf
         jyw+jjBzH+yYAgJ0TJuTp5l0zlV8Kh6F07TqhFP0T62TgdFs/w5ZNBdDtp/enw/GUee3
         e7qms0MSIkXlcPir1N6qlUJa4p9lEb59QMgavERPs+jvsNn29Tv1baEjEjsLZfWbUHLy
         TShQ==
X-Gm-Message-State: AOJu0YxLipDn8jm1pHLaHVEAxWgsOrfSPeq1SUXI07a+4t5qYR+nZ3/2
	mmuxKRGE/opKWI/YdnS9IEgIqN0xSu7eU/nbC07J5a64aHNTFxcZXFRzuya3WAP9sv3S4fMZKb2
	HynHiv5g=
X-Gm-Gg: AfdE7cm1FvTqD8v8J2jpfbWAyj0A6ns74i4VunEFqhLmi1FJWomtK1P9thaN9D9tXk0
	Ki7HwBqmg/CsOnoVVrC1AmxrPDkvBbe27Fee9TH2cxIHI8G51rkStpXzANIpqSqQpZLWuWG06/i
	O8ecBWH+raGYs+/Ww5o2gJk9ezguW5zEd3zlGK3mLZCQ7Ywux4kso0h79+bN93FtMmboEn2QYVy
	CswRGvEzG/bla5v56Mp2TyZO9dW1QAitsY5lqqZxaq6iU4COswx+a34dRa6Zk+RPGQ+fpYHKHga
	UABTBq2YS3tjg19HTHJqZO8iuzOOpIggspxoEh778U6izj9puxG9uLYodCnDZfd9IfKlr59wLHF
	T4G3+pPvit/9K1CMKbrUhBKa/6ZzaFVj9skv7mf6uLRhN6isIeaIlsNjqtLNXxOC8TjJZ2QxZaO
	EvaHLk
X-Received: by 2002:a17:90b:4a08:b0:380:9157:d6c with SMTP id 98e67ed59e1d1-38e4b41043cmr14246640a91.10.1784531002261;
        Mon, 20 Jul 2026 00:03:22 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm463052a91.4.2026.07.20.00.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:03:21 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 20 Jul 2026 00:02:53 -0700
Subject: [PATCH RFC 4/4] of: unittest: cover /aliases updates from overlay
 apply/revert
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-nh-of-alias-overlay-v1-4-f1e5d9889b30@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
In-Reply-To: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784530997; l=4807;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=MDFjA3RgAEvCtdRyXnAbVMy3S7sJXL7lribMJJ6+tBE=;
 b=1uRt+NYgSdsZklwmrfdumPXYE/QBEyqERaPzRKFHEZQtMC3xI1dM47vV3H8GishS+GzYzTxCP
 qF4b4W4H8RbAl930bpY2FBF9kQzZ3pdQJHlygIXRSBygbhdgVFkhAfA
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add overlay_alias.dtso, which declares `testcase-alias99 = ...` under
/aliases via the &{/aliases} shorthand, and an of_unittest_overlay_alias()
runner that:

  1. asserts of_alias_get_id(target, "testcase-alias") is -ENODEV
     before the overlay is applied,
  2. applies the overlay and asserts the same call now returns 99,
  3. removes the overlay and asserts we're back to -ENODEV.

Exercises all three functional patches earlier in this series
together: patch 1's reconfig notifier is what mutates aliases_lookup
on apply/revert, patch 2 is what lets target-path="/aliases" resolve
to the DT root when target_base is non-NULL, and patch 3 is what
rewrites the fragment-internal path in the alias value so
of_find_node_by_path() finds the live-tree target. Any one of the
three missing turns the middle assertion (get_id -> 99) into
-ENODEV.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/unittest-data/Makefile           |  2 ++
 drivers/of/unittest-data/overlay_alias.dtso |  9 +++++
 drivers/of/unittest.c                       | 51 +++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 01a966e39f23..0a8bd9a74283 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_OF_OVERLAY) += overlay.dtbo.o \
 			    overlay_18.dtbo.o \
 			    overlay_19.dtbo.o \
 			    overlay_20.dtbo.o \
+			    overlay_alias.dtbo.o \
 			    overlay_bad_add_dup_node.dtbo.o \
 			    overlay_bad_add_dup_prop.dtbo.o \
 			    overlay_bad_phandle.dtbo.o \
@@ -87,6 +88,7 @@ apply_static_overlay_1 := overlay_0.dtbo \
 			  overlay_18.dtbo \
 			  overlay_19.dtbo \
 			  overlay_20.dtbo \
+			  overlay_alias.dtbo \
 			  overlay_gpio_01.dtbo \
 			  overlay_gpio_02a.dtbo \
 			  overlay_gpio_02b.dtbo \
diff --git a/drivers/of/unittest-data/overlay_alias.dtso b/drivers/of/unittest-data/overlay_alias.dtso
new file mode 100644
index 000000000000..32532c80505a
--- /dev/null
+++ b/drivers/of/unittest-data/overlay_alias.dtso
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+/* overlay_alias - declare an alias inside an overlay */
+
+&{/aliases} {
+	testcase-alias99 = "/testcase-data/overlay-node/test-bus/test-unittest100";
+};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e255f54f4d76..a9f4a0bb3087 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3475,6 +3475,53 @@ static struct notifier_block of_nb = {
 	.notifier_call = of_notify,
 };
 
+static void __init of_unittest_overlay_alias(void)
+{
+	const char *path = "/testcase-data/overlay-node/test-bus/test-unittest100";
+	struct device_node *np;
+	int ovcs_id = 0;
+	int id, ret;
+
+	np = of_find_node_by_path(path);
+	if (!np) {
+		unittest(0, "could not find %s for alias test\n", path);
+		return;
+	}
+
+	id = of_alias_get_id(np, "testcase-alias");
+	if (id != -ENODEV) {
+		unittest(0,
+			 "of_alias_get_id() = %d before overlay, expected -ENODEV\n",
+			 id);
+		goto out;
+	}
+
+	ret = overlay_data_apply("overlay_alias", &ovcs_id);
+	if (!ret) {
+		unittest(0, "overlay_alias apply failed\n");
+		goto out;
+	}
+
+	id = of_alias_get_id(np, "testcase-alias");
+	unittest(id == 99,
+		 "of_alias_get_id() = %d after overlay apply, expected 99\n", id);
+
+	ret = of_overlay_remove(&ovcs_id);
+	if (ret) {
+		unittest(0, "overlay_alias remove failed, ret = %d\n", ret);
+		goto out;
+	}
+
+	id = of_alias_get_id(np, "testcase-alias");
+	unittest(id == -ENODEV,
+		 "of_alias_get_id() = %d after overlay remove, expected -ENODEV\n",
+		 id);
+
+	unittest(1, "overlay alias test passed\n");
+out:
+	of_node_put(np);
+}
+
 static void __init of_unittest_overlay_notify(void)
 {
 	int ovcs_id;
@@ -3649,6 +3696,8 @@ static void __init of_unittest_overlay(void)
 
 	of_unittest_overlay_gpio();
 
+	of_unittest_overlay_alias();
+
 	of_unittest_remove_tracked_overlays();
 
 	of_unittest_overlay_notify();
@@ -3848,6 +3897,7 @@ OVERLAY_INFO_EXTERN(overlay_17);
 OVERLAY_INFO_EXTERN(overlay_18);
 OVERLAY_INFO_EXTERN(overlay_19);
 OVERLAY_INFO_EXTERN(overlay_20);
+OVERLAY_INFO_EXTERN(overlay_alias);
 OVERLAY_INFO_EXTERN(overlay_gpio_01);
 OVERLAY_INFO_EXTERN(overlay_gpio_02a);
 OVERLAY_INFO_EXTERN(overlay_gpio_02b);
@@ -3885,6 +3935,7 @@ static struct overlay_info overlays[] = {
 	OVERLAY_INFO(overlay_18, 0, 0),
 	OVERLAY_INFO(overlay_19, 0, 0),
 	OVERLAY_INFO(overlay_20, 0, 0),
+	OVERLAY_INFO(overlay_alias, 0, 0),
 	OVERLAY_INFO(overlay_gpio_01, 0, 0),
 	OVERLAY_INFO(overlay_gpio_02a, 0, 0),
 	OVERLAY_INFO(overlay_gpio_02b, 0, 0),

-- 
2.54.0

