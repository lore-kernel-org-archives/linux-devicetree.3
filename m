Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3944028EB
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602345; cv=none; b=MxkzKB6X1x0vKkFrCxmEjUEtoxptUqkl07semxo6oD5C2R73749pk9JN34PQgVL7taTknnK8QyGkWFwjFujY18tgELVUTG/U3jq8eg+HrCWCQnVVDTfAFg0G2ITrSlXQDtZ4jWi1RSHKNhlIz89iV/TEeAckAUj5JIzeNokuXNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602345; c=relaxed/simple;
	bh=7I/bRIWyLMaPsbMBoV17Sw4ckfrzow+c9tKwDTtXT3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSeZlOZxuDzKWFn93Tro8NrrNTOIJ8qBB5YzlW1dO13Pa9GkQLlPDGhEHeW/dnXxoRQ2js+Wk92MWTuxhh9H9XEiMtpHRr8h5So+v+eIHGM9ijr+WdyogVoLbTeye4DB375JbE6dyEf6im8rmagqqiH/NwPq5Lo5UX+iCpdSZPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=FXk9fRgX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="FXk9fRgX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso124246985ad.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 19:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784602343; x=1785207143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eu/fcLH1kduLv+xVbDX9wG/kMZA8+oQXrfn0Rhdu8iA=;
        b=FXk9fRgXAX8dedu+3EsqbshD/CU3DRDAQ0Cyz6fM+zw6AOl3kWIBfVLBg7UwslrFii
         p2nKK1s5zm/k3lyvDufwvOwt5fBxwX9gmSW9k7EPfhImIZYCjYU+XDzPKnY5xCbNDLMz
         l0JLNUj3b0+/KdYJ/uwED90YJwiMDy9sM4Wca6h2GSAmrHmmAf5QrTD/K8xVlw5HP/12
         gLVEKgoCyDg15++CjivS7bCDs4M67hHHGMhg1ngOs26TV2Zylv9ETVsXAa7vms8y9i0j
         0CklKkdG7YiTnBlL8x2UpdV955W8eMGF49osPCs9hkelBImXajGJuPP5ROqst7QeQJXR
         lR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602343; x=1785207143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eu/fcLH1kduLv+xVbDX9wG/kMZA8+oQXrfn0Rhdu8iA=;
        b=qcRJhNq/uu1rvTMWMIucuVRpnzyqOx9tC1qw8oZ2++mpXzrr+4Xh6JOZhwBOddbhFb
         glCvI1p78ex2m5vbUdE34iIyKgu2Ri4OKumIF4VYdumKMZyuCMOyabSvSD7/rHUyLg+n
         fVZrQ87DFzdgfv+yjKfFOzYO1AqlVQIM2NFs9VQD/HRemG+v+10emW/Nmv3PP/56vA1H
         QIOuVW5q4Q7/bMJ1/hrwsQ17+JccI7S7mrdCatfkeThGi75Qj2IvmiP3anyzqQMj4JGV
         1yFyW4XAPYF9PnQHpKYnao5P5C+DPSotvy4RuBDx8eym+JIRHlYBXVRXVdfFEMLHLeif
         D/xg==
X-Gm-Message-State: AOJu0Yzv65UOt2YmcF2MidXBUsbE27teuf8qM00kmIhQ8admwq0HWCCG
	7GvFO4Jsm/Dvprqa6wZjGhwERnojzGwiIjfjVqaIvo0kOUdTor2GYiJQ9rdhJPn/8S9c8/4LEdZ
	ajYscEsw=
X-Gm-Gg: AR+sD13344LeWZBpE5te4egKdOFoKINAID87s2V0mdqNtO8+DB++iIxYX1tx58aEM5p
	KSi2YKAHpU4PJaqJjNG2tHX9QhyvQFsI4WtHrqSMC3bdVKSlKYZi3KIGR7X2Oel68iaQQi7vam2
	LwIZ2eIwL7v7wHQYM7/InfcHV1ofXQdtNaJ94h0T/Fs2Xmg9Hmjj7+gADgGNf4etZWEgCypkW3y
	0EARZ3mbafiaGUkLuBjxK1Km+DjDlHymyiQ1/nY0tmkH+pCf79VY2lgbwK/jT0mDc8nwh7rMcg3
	JBBT5LW4TkCGT0JIgUYsWMVyPVs4QQhnAj0BWpDw7ufKoI5lgHcTt3X6oeTv/1dn6lSoxyo3PHS
	pPcS5N/krmb5Ka/iQ84lCODuvOsOOJ+qCYcfjCsm/rETzj9zhDsqP9HMKJXo6lxV9cxA7vufBL3
	j9XSm43ifCXHO7vO0=
X-Received: by 2002:a17:903:13c6:b0:2ce:b096:e517 with SMTP id d9443c01a7336-2cf3489548bmr179693435ad.5.1784602343335;
        Mon, 20 Jul 2026 19:52:23 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41167294eec.24.2026.07.20.19.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:52:22 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 20 Jul 2026 19:52:18 -0700
Subject: [PATCH RFC 4/4] of: unittest: cover /aliases updates from overlay
 apply/revert
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260720-nh-of-alias-overlay-v1-4-27da6848dd84@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
In-Reply-To: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784602339; l=6970;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=7I/bRIWyLMaPsbMBoV17Sw4ckfrzow+c9tKwDTtXT3w=;
 b=JBepJEpKO1UgSdDgMBOLfMF4BXOfkw9jwwmQK8AiZVZayScTfiLy6KGsbft0QrUlQpV/SLhPN
 HR7yWFt0egtANLQO22TgPy8UwIGdwaWH/7sGmWBaqke3bDF2GAeGS3e
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

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/unittest-data/Makefile           |  2 +
 drivers/of/unittest-data/overlay_alias.dtso | 36 ++++++++++++++
 drivers/of/unittest.c                       | 74 +++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+)

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
index 000000000000..7763fffa8699
--- /dev/null
+++ b/drivers/of/unittest-data/overlay_alias.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+/*
+ * overlay_alias - exercise the full "aliases inside an overlay" path.
+ *
+ * fragment@0 grafts a labeled node under target_base (empty target-path
+ * means "the target base itself"). fragment@1 adds a numbered alias at
+ * the DT-root /aliases and points it at that label. target-path="/aliases"
+ * is an absolute path — reaching it while target_base is non-NULL
+ * exercises the absolute-target-paths handling in find_target(). The
+ * alias value is emitted by dtc as the fragment-internal path
+ * "/fragment@0/__overlay__/alias-target"; the overlay code's
+ * /aliases path rewrite is what makes it resolve in the live tree.
+ * The reconfig notifier is what mirrors the change into aliases_lookup.
+ */
+
+/ {
+	fragment@0 {
+		target-path = "";
+		__overlay__ {
+			testcase-target: alias-target {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/aliases";
+		__overlay__ {
+			testcase-alias99 = &testcase-target;
+		};
+	};
+};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e255f54f4d76..35d75f2b3ef2 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3475,6 +3475,76 @@ static struct notifier_block of_nb = {
 	.notifier_call = of_notify,
 };
 
+static void __init of_unittest_overlay_alias(void)
+{
+	const char *base_path =
+		"/testcase-data/overlay-node/test-bus/test-unittest100";
+	const char *target_path =
+		"/testcase-data/overlay-node/test-bus/test-unittest100/alias-target";
+	struct device_node *base, *target;
+	struct overlay_info *info;
+	int ovcs_id = 0;
+	int id, ret;
+	u32 size;
+
+	/*
+	 * Apply the overlay with a non-NULL target_base so that
+	 * fragment@1's target-path="/aliases" is looked up absolutely
+	 * (exercising find_target()'s absolute-path handling) rather
+	 * than under the base. The alias value inside the overlay is a
+	 * fragment-internal path that only resolves after the overlay
+	 * code rewrites /aliases values, so this run covers the whole
+	 * chain end-to-end.
+	 */
+	base = of_find_node_by_path(base_path);
+	if (!base) {
+		unittest(0, "could not find alias target base %s\n", base_path);
+		return;
+	}
+
+	for (info = overlays; info && info->name; info++)
+		if (!strcmp("overlay_alias", info->name))
+			break;
+	if (!info || !info->name) {
+		unittest(0, "no overlay data for overlay_alias\n");
+		goto out_put_base;
+	}
+
+	size = info->dtbo_end - info->dtbo_begin;
+	ret = of_overlay_fdt_apply(info->dtbo_begin, size, &ovcs_id, base);
+	if (ret < 0) {
+		unittest(0, "overlay_alias apply failed, ret = %d\n", ret);
+		goto out_put_base;
+	}
+
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
+	of_node_put(target);
+
+out_remove:
+	ret = of_overlay_remove(&ovcs_id);
+	if (ret) {
+		unittest(0, "overlay_alias remove failed, ret = %d\n", ret);
+		goto out_put_base;
+	}
+
+	id = of_alias_get_id(base, "testcase-alias");
+	unittest(id == -ENODEV,
+		 "of_alias_get_id() = %d after overlay remove, expected -ENODEV\n",
+		 id);
+
+out_put_base:
+	of_node_put(base);
+}
+
 static void __init of_unittest_overlay_notify(void)
 {
 	int ovcs_id;
@@ -3649,6 +3719,8 @@ static void __init of_unittest_overlay(void)
 
 	of_unittest_overlay_gpio();
 
+	of_unittest_overlay_alias();
+
 	of_unittest_remove_tracked_overlays();
 
 	of_unittest_overlay_notify();
@@ -3848,6 +3920,7 @@ OVERLAY_INFO_EXTERN(overlay_17);
 OVERLAY_INFO_EXTERN(overlay_18);
 OVERLAY_INFO_EXTERN(overlay_19);
 OVERLAY_INFO_EXTERN(overlay_20);
+OVERLAY_INFO_EXTERN(overlay_alias);
 OVERLAY_INFO_EXTERN(overlay_gpio_01);
 OVERLAY_INFO_EXTERN(overlay_gpio_02a);
 OVERLAY_INFO_EXTERN(overlay_gpio_02b);
@@ -3885,6 +3958,7 @@ static struct overlay_info overlays[] = {
 	OVERLAY_INFO(overlay_18, 0, 0),
 	OVERLAY_INFO(overlay_19, 0, 0),
 	OVERLAY_INFO(overlay_20, 0, 0),
+	OVERLAY_INFO(overlay_alias, 0, 0),
 	OVERLAY_INFO(overlay_gpio_01, 0, 0),
 	OVERLAY_INFO(overlay_gpio_02a, 0, 0),
 	OVERLAY_INFO(overlay_gpio_02b, 0, 0),

-- 
2.54.0

