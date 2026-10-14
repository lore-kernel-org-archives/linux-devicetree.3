Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFAE4A4F00
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019867; cv=none; b=Ut1MjHn3l1pwm/x+GJWNe2rKbzC7zHQewDITd7/ZCQx9fGsEoare28eK6VZgnG1azCuNKEv3SJ7fyWN3mZuSnU4kE0nyO+2TAR7xABZoGtRacQ2YabV9Z6kQAnu0oRdJtyKBeAj0gno4EmBy0AdTVHL+WtTIIYs4p/GhJ3+T4v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019867; c=relaxed/simple;
	bh=vO1oV8bwHSlX0sH4gGWcdp/dFwfkrZ/9K0rxzsPh390=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qa+sxpP2Do9+nMqbB/mblMVvEdkbT+yVU+DCLzYW2c5tLuC/mKprZEJjvkZljbHgwsIWLRyKqv43qyOR0gAZgWpWkKpsDFN2Eb8oOkFkI/hd+6ZChJG5rVsccMVFMlE1YrGAic/a6pw08c0+coy4rN0r2TwfoaGPMCwYHPwls0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=NpCRQoRa; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="NpCRQoRa"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30b6dad2382so10844425eec.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792019861; x=1792624661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6C8jGqFinDpuPjyzpS5QwSEVjMYW1BhAN63U/eJnyk=;
        b=NpCRQoRasKFZvwKvpW0aKW6m/lvRoFBO2/N5pssvEJZLla3/AVgvqiDPZJrR09x2Z3
         yjrkl5t3HzZHZuH2//Clj2zoZCJQIGWpLpZhVTZy5mDPlW8OB8MQRWJUm1LJS5Jra2gE
         S4coXQi0QTM4uH068PBHO1tBrXpp2PSas9Q+XBVrULPg4X+GMGiDFWxaYc1a2vrvkJnr
         UGPKJ09jzSR0iRJShm6EfX0bB3JWCKqIs7yWizcyaAC8ncVfNPdYQVoCdjD+aB4NBa3c
         OkCNh9y7Lo7zMdMzTJogV+5RIra5i0OPcjWq7AWkjClcjs5rVrBFvDvMpmlK9w/pdW0O
         QtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792019861; x=1792624661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6C8jGqFinDpuPjyzpS5QwSEVjMYW1BhAN63U/eJnyk=;
        b=BQrJQmGr6EP0KtuKkPJ6v5/AKN0jVxbm3M0yFvaZ8u7lxKKfAqd5oX9jUQVGtNGusy
         vECPzyQCki/N1cAdY2MOhrwkRM0I/XhqWtyOWG8g/AUqtH6UPQtci6kr+6IWt1E3emRM
         E8FTwvLRs6geZcvAiCU1b0Hup6DfSEVxRVfREjWf3sF0NRIgGLaEx9OIcIp/dwhoYkBG
         IcWCxFfOUhgTy9SRCT0gX9cDoKmLp6uKBoDbdc0SRWJDNDGjaWSF4l3cfsVjXy8R1SgW
         YvKHiiOSM8i+a7Ysa/xCUBc49iX3QwML3f5JNtX2XZkufkiP7clWBUilFjKh4tJ2awz0
         0uGQ==
X-Gm-Message-State: AFq9FYJpS7rUds7qyU3uBRTF0YjqiZ8IRjHychp95Tah0Kpnyk96eHbF
	Q6g7+1Dh7fttIRvEVex8sZEu6FjdLXstS+Nhd2F3MGkSDtxbQF+IQZfpqn0ftAKNzGn3M4zKRjw
	wqYx1igA=
X-Gm-Gg: AYBFou0K21dKTkMPbQGMCFIidpr0d6qDYjAnUzgbZMDuusa8ZDw1s27Z7W9fVI5o6fq
	DBndzNJYI+QSdLPqi+U3dg6Psni5rjtfAOKp9kEncitiGvkBdd1/yhz0PzqARZx6ZSrURC4Hhlr
	+0gqbJfHcfVU7H/eksOx0oFqbkVuMznCtArR3vsvcMrDsUnx3J9kXzAaAW9S1ExvtMyCq47WsqJ
	8ETvVs3Z2VvJg/aJfgAruoXEAlXbhr+236GgOJEAdRszOk5ShAJsz8Br1oVp1Edci9j9C4bXEo5
	mEQ3hB7fBmYFZnlh4iPjzUYbZ1R9Iqylp2P8+1D7H/NJAW9Vyznpb531ECMJY5QbBTB2qO/jjA1
	NbaosD5BPMWyOVx+tEQamTTdXAlAC0HLEtDCRWxpzmiWvUffGhMpjN8H13l4BluTnqQqhedgyxW
	H9G4aOovm7sUWg6WKRQKAjtXZb/ERqblAK36blBVkIglX5ytOZ5Ww1v0pU2cRkFxThtYpOcz97c
	w==
X-Received: by 2002:a05:7300:ae10:b0:35e:3727:5412 with SMTP id 5a478bee46e88-35e37275518mr2835980eec.9.1792019861246;
        Wed, 14 Oct 2026 16:17:41 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm10678679eec.25.2026.10.14.16.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:17:40 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 14 Oct 2026 16:17:31 -0700
Subject: [PATCH v8 6/6] of: unittest: cover /aliases updates from overlay
 apply/revert
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nh-of-alias-overlay-v8-6-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
In-Reply-To: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792019849; l=6029;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=vO1oV8bwHSlX0sH4gGWcdp/dFwfkrZ/9K0rxzsPh390=;
 b=KSfTWA8RN8kwkvxeYymegrm+s9/YF1TFnvLA36VUkdztJSJ+reL1vW7b3MYoFmFutTXMc+Fw+
 EiUeWQBct6FDuKmoPOQ7I7oX3uKfPHB+bonJEbhpT+5vV0o63F958Qx
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add overlay_alias.dtso and of_unittest_overlay_alias().

The overlay has two fragments: target-path="" grafts a labeled node
under the run-time target base, and target-path="/aliases" adds
`testcase-alias99 = &<label>` at the DT root. The runner applies it
with a non-NULL base via of_overlay_fdt_apply() (overlay_data_apply()
always passes NULL), asserts of_alias_get_id() on the grafted node
returns 99, reverts, and asserts of_alias_get_highest_id() reports
the stem gone. A precondition check runs before the apply.

This exercises the reconfig notifier, the absolute target-path
lookup, and the /aliases value rewrite together; any one missing
turns the get_id assertion into -ENODEV.

The grafted-node reference is dropped before of_overlay_remove():
overlay-created nodes must be back at refcount 1 when the changeset
is destroyed. The post-remove assertion uses of_alias_get_highest_id()
because it is keyed by stem and needs no node reference. The apply is
wrapped in EXPECT_BEGIN/END for the "memory leak will occur" warning
printed for properties added to nodes the overlay didn't create,
like the other overlay tests.

The overlay is not added to the fdtoverlay static build test:
fdtoverlay has no target-base concept, so the empty target-path
cannot be resolved statically.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/unittest-data/Makefile           |  5 ++
 drivers/of/unittest-data/overlay_alias.dtso | 25 ++++++++++
 drivers/of/unittest.c                       | 73 +++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)

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
index e255f54f4d76..2f5e4056efae 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3475,6 +3475,77 @@ static struct notifier_block of_nb = {
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
+	struct device_node *base, *target;
+	int ovcs_id = 0;
+	int id, ret;
+
+	base = of_find_node_by_path(base_path);
+	if (!base) {
+		unittest(0, "could not find alias target base %s\n", base_path);
+		return;
+	}
+
+	id = of_alias_get_highest_id("testcase-alias");
+	if (id != -ENODEV) {
+		unittest(0, "unexpected testcase-alias%d before overlay apply\n",
+			 id);
+		goto out_put_base;
+	}
+
+	EXPECT_BEGIN(KERN_INFO,
+		     "OF: overlay: WARNING: memory leak will occur if overlay removed, property: /aliases/testcase-alias99");
+
+	ret = of_overlay_fdt_apply(__dtbo_overlay_alias_begin, size,
+				   &ovcs_id, base);
+
+	EXPECT_END(KERN_INFO,
+		   "OF: overlay: WARNING: memory leak will occur if overlay removed, property: /aliases/testcase-alias99");
+
+	if (ret < 0) {
+		unittest(0, "overlay_alias apply failed, ret = %d\n", ret);
+		if (ovcs_id)
+			of_overlay_remove(&ovcs_id);
+		goto out_put_base;
+	}
+
+	target = of_find_node_by_path(target_path);
+	if (!target) {
+		unittest(0, "could not find grafted target %s\n", target_path);
+	} else {
+		id = of_alias_get_id(target, "testcase-alias");
+		unittest(id == 99,
+			 "of_alias_get_id() = %d after overlay apply, expected 99\n",
+			 id);
+		/* changeset destroy expects overlay nodes back at refcount 1 */
+		of_node_put(target);
+	}
+
+	ret = of_overlay_remove(&ovcs_id);
+	if (ret) {
+		unittest(0, "overlay_alias remove failed, ret = %d\n", ret);
+		goto out_put_base;
+	}
+
+	id = of_alias_get_highest_id("testcase-alias");
+	unittest(id == -ENODEV,
+		 "of_alias_get_highest_id() = %d after overlay remove, expected -ENODEV\n",
+		 id);
+
+out_put_base:
+	of_node_put(base);
+}
+
 static void __init of_unittest_overlay_notify(void)
 {
 	int ovcs_id;
@@ -3649,6 +3720,8 @@ static void __init of_unittest_overlay(void)
 
 	of_unittest_overlay_gpio();
 
+	of_unittest_overlay_alias();
+
 	of_unittest_remove_tracked_overlays();
 
 	of_unittest_overlay_notify();

-- 
2.54.0

