Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2495439908
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669805; cv=none; b=Q3Um0OyyerL5P78Pq75oqeWVgYxAuYiqzyk0fC1zKwyaczvhBxxrIMHjEsTL8IOw1A07A7fSlidu25Bzg/eqSm8D3OfOeGEImnbKEbkjGYLGvk6xnT+7wLfkDRNYrQKokTHRty9KCbIjGEtQReqBAD+QBhAg1PP8f8bMDyyBI8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669805; c=relaxed/simple;
	bh=1AqJjptPNcOHrmiu5mm4MU1/41U1adLcnSyOVe44xgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5eteWHztYJ354kA4o9fCMYOJkAjJYFvo0UEly8RIVTH6S656fJ8xhc3AdtlC+vTAJNJvmvgY5sJpTSX1ktuM1sUSkPJioMVbSgNGK5yyxPdWZDxnOGB6xHfIOqcDtv4cxwxJGa2xpMqU8zEzf/1dFOhaj+bp24ACuriej7MKbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=KQxAo9PL; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="KQxAo9PL"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3926826a91.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784669801; x=1785274601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1QYvxskec5dUTJ/7WHomj96AzPse0SLdtLdUj/bCfI=;
        b=KQxAo9PLKPjmF1zedD6L+LXZa+Qbpbr4fS59h1xaH/QrFA6QjsSItZzyKr1JMqgQ5c
         UqEDbbmNxRWLVq7zIdZTChGBeSd4etA1ja9WcvelSfzOu+uERlTlWvK1jmXzjWOsTy3K
         AY8FYWHHd33j+Q1tvnizjelKVNRe12yjuUyka+2/swf5jPOV2OqNa6Qbq1gu15XR1x3v
         h/o+R/FKxYEfRQPDh0q8yIFeSJ+cEJRJWEOhok4XmJyGCS10nKkU4/1HPV6ZOb5bjG4z
         FAsChs7/toS2B4W0rjcZepWbXqcEEiKJR/mJTDO2uNblRTw/IWR7RVN6Ed3M3zfK5xgs
         2/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669801; x=1785274601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1QYvxskec5dUTJ/7WHomj96AzPse0SLdtLdUj/bCfI=;
        b=VIxoJjqHg4gYTply311q/lWeytNjaPtIMJncWfVwszkw0ZT5rrY775xin39DPWAp1G
         YaCiWmqZ/L/2nveTzQyC0v35LF8T2UG1N2mqntaiRM+iOOPalxef5evVMXpCZCEEsI9Q
         D+GAOIzZ53IWPqYZ00wIOGHEyOuwf7k1Z8lUqJhTxjjqcwdgPU6ZSSGENGiCmw0G+/BU
         ZuJjGTN5ky8cNt1m/u+8pY6yg/7lxZEkgh2siFyCzkw7I3LX6gGbLkAKbEU9GcGe1pFQ
         2GtmfpiMxXgAyMJyMv9sflcIQsE+aQnbt3Z26VEbtxBbLBaY+5nGyxBkBEltNxq75dea
         99bg==
X-Gm-Message-State: AOJu0Yz9RgqjCdCn6PGSiLALVjImTgTVoNwhKbj7DXMiX2iXXPpABO/B
	va4B0Ohjmxd0IFQFcFG53JzDoKR5/15GssL+Eryt3fkZXOEdtHt4G+29RamS5OTVK2kD4fU6gVP
	q9Ib62XE=
X-Gm-Gg: AR+sD1317v6M9LaD9LJeLyCrco4dcOFdJKvXn8zkhWCoamZWMGNIb/d7y8QilYn5Yhf
	6U0qcLyl9eS1hM/qbmjK3e+dMNav/rmEDjCjjscw0ZdgNWsZNhtrOXL+ThROf7Z8lonCmsFNfQF
	A/dFF7VPfUDaUmlWR4wFkV+AxtR9gulGvBW80oxGn2caL9t94cUfiA0TB/VuvXx3WwhgQCDIQQo
	brNbrAq9hVQ3S9ToKRNAfXsTMmgT6XU/A8KYDqdOJIeIaARHdfUsgVoaZTKrpgs/uL2l+h/5p5E
	MMuFzf+le0rITMXgmL/ziU2d34mU8QH6qHum1ZxgNcoQCcJ5b6v6ENrJFvLG49P1/W3X+A12NGb
	TnYwshdB2Yatbw1MJ0v3ojGEwUmA36Bw9tdNY3nJiz995lsaeDvW0ZaNtXyQzei3ceFiYqj0c2b
	ArIV8x2h2HsWu8xKs=
X-Received: by 2002:a17:90b:3d86:b0:387:e0bb:57f7 with SMTP id 98e67ed59e1d1-38e4b59b913mr20726866a91.40.1784669801396;
        Tue, 21 Jul 2026 14:36:41 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm40706521c88.9.2026.07.21.14.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:36:40 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 21 Jul 2026 14:36:35 -0700
Subject: [PATCH v3 4/4] of: unittest: cover /aliases updates from overlay
 apply/revert
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-nh-of-alias-overlay-v3-4-7001028fe2f5@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
In-Reply-To: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784669796; l=5750;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=1AqJjptPNcOHrmiu5mm4MU1/41U1adLcnSyOVe44xgU=;
 b=CMHl+rx19XqZuiL5AqerXimikQ7tM4bbdwc6PkQdi4w3SDk8XAfgaekB9V3vdrDJt4T7L7mry
 2Ap9CZ7Gk9fB4msYsUMv76hJ20jZXWJccHGsD2cR5wbR4CtrVUeN1jZ
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add overlay_alias.dtso plus of_unittest_overlay_alias() to cover the
"aliases inside an overlay" flow end-to-end.

The overlay has two fragments:

  fragment@0: target-path="" grafts a labeled node under target_base.
  fragment@1: target-path="/aliases" adds `testcase-alias99 =
              &<label>` at DT-root /aliases.

The runner applies the overlay with a non-NULL target_base via
of_overlay_fdt_apply() directly (rather than the overlay_data_apply()
wrapper, which always passes NULL), then asserts of_alias_get_id() on
the grafted node returns 99 across apply and -ENODEV across revert.

Exercises all three functional patches earlier in this series
together:

  * the reconfig notifier is what mutates aliases_lookup on
    apply/revert;
  * find_target()'s absolute-target-path handling is what lets
    fragment@1's target-path="/aliases" reach the DT root when
    target_base is non-NULL;
  * dup_and_fixup_symbol_prop()'s /aliases branch is what rewrites
    the fragment-internal alias value ("&<label>" -> fragment path)
    into the live-tree path that of_find_node_by_path() can resolve.

Any one of the three missing turns the middle assertion (get_id -> 99)
into -ENODEV.

The overlay is not added to the fdtoverlay static build test:
fdtoverlay has no target-base concept, so fragment@0's empty
target-path (meaning "the target base itself" at run time) cannot be
resolved statically.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/unittest-data/Makefile           |  5 +++
 drivers/of/unittest-data/overlay_alias.dtso | 25 +++++++++++
 drivers/of/unittest.c                       | 64 +++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 01a966e39f23..fdfec5a7923b 100644
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
@@ -66,6 +67,10 @@ DTC_FLAGS_testcases += -Wno-interrupts_property \
 #			  overlay_bad_add_dup_prop.dtbo \
 #			  overlay_bad_phandle.dtbo \
 #			  overlay_bad_symbol.dtbo \
+#
+# overlay_alias.dtbo needs a run-time target base for its empty target-path;
+# fdtoverlay has no equivalent, so it is also not included:
+#			  overlay_alias.dtbo \
 
 apply_static_overlay_1 := overlay_0.dtbo \
 			  overlay_1.dtbo \
diff --git a/drivers/of/unittest-data/overlay_alias.dtso b/drivers/of/unittest-data/overlay_alias.dtso
new file mode 100644
index 000000000000..17e02d1940f6
--- /dev/null
+++ b/drivers/of/unittest-data/overlay_alias.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+/*
+ * overlay_alias - declare an /aliases entry that points, via label, at a
+ * node grafted under the run-time target base (empty target-path).
+ */
+
+/ {
+	fragment@0 {
+		target-path = "";
+		__overlay__ {
+			testcase_target: alias-target {
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/aliases";
+		__overlay__ {
+			testcase-alias99 = &testcase_target;
+		};
+	};
+};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e255f54f4d76..308daadf22c8 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3475,6 +3475,68 @@ static struct notifier_block of_nb = {
 	.notifier_call = of_notify,
 };
 
+/* created by cmd_wrap_S_dtbo in scripts/Makefile.dtbs */
+extern uint8_t __dtbo_overlay_alias_begin[];
+extern uint8_t __dtbo_overlay_alias_end[];
+
+static void __init of_unittest_overlay_alias(void)
+{
+	const char *base_path =
+		"/testcase-data/overlay-node/test-bus/test-unittest100";
+	const char *target_path =
+		"/testcase-data/overlay-node/test-bus/test-unittest100/alias-target";
+	u32 size = __dtbo_overlay_alias_end - __dtbo_overlay_alias_begin;
+	struct device_node *base, *target = NULL;
+	int ovcs_id = 0;
+	int id, ret;
+
+	base = of_find_node_by_path(base_path);
+	if (!base) {
+		unittest(0, "could not find alias target base %s\n", base_path);
+		return;
+	}
+
+	ret = of_overlay_fdt_apply(__dtbo_overlay_alias_begin, size,
+				   &ovcs_id, base);
+	if (ret < 0) {
+		unittest(0, "overlay_alias apply failed, ret = %d\n", ret);
+		if (ovcs_id)
+			of_overlay_remove(&ovcs_id);
+		goto out_put_base;
+	}
+
+	/* hold a ref across the revert for the post-remove check */
+	target = of_find_node_by_path(target_path);
+	if (!target) {
+		unittest(0, "could not find grafted target %s\n", target_path);
+		goto out_remove;
+	}
+
+	id = of_alias_get_id(target, "testcase-alias");
+	unittest(id == 99,
+		 "of_alias_get_id() = %d after overlay apply, expected 99\n",
+		 id);
+
+out_remove:
+	ret = of_overlay_remove(&ovcs_id);
+	if (ret) {
+		unittest(0, "overlay_alias remove failed, ret = %d\n", ret);
+		of_node_put(target);
+		goto out_put_base;
+	}
+
+	if (target) {
+		id = of_alias_get_id(target, "testcase-alias");
+		unittest(id == -ENODEV,
+			 "of_alias_get_id() = %d after overlay remove, expected -ENODEV\n",
+			 id);
+		of_node_put(target);
+	}
+
+out_put_base:
+	of_node_put(base);
+}
+
 static void __init of_unittest_overlay_notify(void)
 {
 	int ovcs_id;
@@ -3649,6 +3711,8 @@ static void __init of_unittest_overlay(void)
 
 	of_unittest_overlay_gpio();
 
+	of_unittest_overlay_alias();
+
 	of_unittest_remove_tracked_overlays();
 
 	of_unittest_overlay_notify();

-- 
2.54.0

