Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501226;
	b=x3NB1AVwoBXu8TU31NFbOu3faWpA3oiY5D9rMlzZ+EP9SLBCloE48kVlRcyb9WfVasG7
	 2AOfxsp16rwrOilav1KX8WitCXvAo30PDImQHiwuIhF1shUDY0t1Xr1pTUt9IiEViyowm
	 ZYgDsSvRr0Fc3H04tTNEcXMOJwjQxiBYNAPnN4WTK8CYPQlPX0pDt08HEJIFFgZoe8HMM
	 UW9VXVF7TT9v+lp5AR78CO0YK6wnZqixkqKP9HPq4rvw/WMuVKT1Pa+TQ0zcca3spKw66
	 O8KKWqbP9B+rWUDJ2yDU4z6/lfTmYyxSTR84N88u0Li5tl7uIFnAzO5gJqkXV3oCPZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qy10MCNTYPGcfzZL52ZybsUTyOOK881ej/NFqUmLnqQ=;
	b=xZyy23vhqiD0srg2XIsVrJVZKYySUrgPSLQ5TQTsZDrZLNGtHDDYA5Joy72ugvm3d5HR
	 CIOzZ+cke+SVnbccQy+89zh5H8ISdRRAukkQQydZh4EwAmndP84WsvcYxVvFE4y2NSriC
	 o+IU10q7QgzAzL1dzHC3iy2bfy1rMYwNZWszYljf1V92rrF6DG7yNLkWB3OztfdmYEq0s
	 E35pQmO0g+jAnWRLrM75aEjSbsadBzRutSMUjHKwXo7Cy/GwvnD4ggBtkFMZjAaQHVctg
	 +kS8ZEQr4XjMBMDAAdgn23fKUh0L5zgC9HWUUfIeuzWZS55CAU+DcDeoULoXu4WmQpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iauC1ZCt;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAC60A3824
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCAC60A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iauC1ZCt
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1882097f8f.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501224; x=1793106024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qy10MCNTYPGcfzZL52ZybsUTyOOK881ej/NFqUmLnqQ=;
        b=iauC1ZCtLJ+tB69Zq2X1S9F86cMkdFrRLjxyu/MVuWh2pK1bFBPny4DbJAZbwK5LKm
         b6shBEADPtKYVwAnKkJHpzEpxXYOAX0SLwAnHd2OH/WRq71IK898NV7MUbyoJ0i18lHU
         UolN29yCITahO0d/ipVDB9IoLqD1fFtqvtWewBJQ5/nunil8kDZRbUSkOowryvluPPho
         IYPmqnouL3YrpC98LaCw+TCsoMbNle+CzsRSW5lVhRDMHk5HqTxQZFAs+k7o9xdIzN6s
         lFivEbzR1J0yG4fUUfEGNqqsfNaIsEetXevT3LY5O0tsfczQUe+g5bAWpXv7fpAxqmFN
         yVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501224; x=1793106024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qy10MCNTYPGcfzZL52ZybsUTyOOK881ej/NFqUmLnqQ=;
        b=xYPf+ffHLIdNkAxKWtEe8vpQBsDLYOYQsUSeZPztuyAv0aIjLNaoKF7bZ5ZKQiTuoa
         Yl7f2t0Fkuzg7cV8zlnnKsRKTGJb11SPjxpyo6N3T4GIFvfBIbsRJEW5KmJ83cuA8SUx
         buFCvDeOvvPzOO5Vu9W9QdFLd/3bH+paEERpq8Yc0vabamaUNB+++yH29RnonXwSQ7Us
         7LHxfF+5pzwBgvBPo99WRUbcdl+nYP8fJSNAcP8lUyrfRUFuuasuePjBGsxBFSIGfAOt
         ND+xAKXErcIdAjWrGyQkSUwltza2gXWYaaVfcCUjs1H390oG9aZEAIRPTj+1btiAKe5C
         8MLA==
X-Forwarded-Encrypted: i=1; AKwUvBzoE0eIr6S9MBQYXeY5ublKyp7WvvdxEf83f4JssltyQg8VuDNGqwOodAFXZEiLh9e9y4vCjLd2CfLP@vger.kernel.org
X-Gm-Message-State: AFq9FYIjbq90+pl4fIrmcHwBPuHbEH0NjQoT3lQ798uvbaFZxTmwqlGE
	o0kAlVi0ZVVDux3ec161gGWGJO1YoUN7XEjZ8TYhNS90oGKyDQhg7Cv6
X-Gm-Gg: AYBFou1GRLt14fXAamzvyE3jO0IuWVU26pyhfpeyECGKBHpLnta9n8Pf51h1bcwEU2g
	oBCPh/KapKPcPabCqvzFB4It40cmhA7KUkMezqNzfQDOZh7JCLwtO66kXYBfX+1yL/13wBGX0EC
	M89U4+IAMMJzYVEXgu/HzEdYa0rhlyHb7epH7ZpIIXzAqaq6fzi6X1S+ohfHbpncpyCvpMpLg5y
	Ru2RNI6RJPfCwpKftLqXwY8yOTD0LlsMeMnc4Dzu9N2hc1EXzyAXuC+hYD6QAZ1uf0NJUD6qvXM
	tyA7P3TJOUeQ+vBAZ7SeydgCg6BZNNr6+oG0kLtitq3ZxBjQtVSQMiy+QcfedpqSHDWYKoXDqMO
	XEpK0PjAXqkQtFi29/0NcV4pbMTv/H9At7D/elCtAjuenqW8SvwKdruyuA0DRcu9/5dCGIa/Q01
	vV0bxU8MPlc8J8zxIWl58GeVkfaqMt+zNfJbbRf/+GveLHmoaetERJ5F6jPNRHpF23cfFO/Dcso
	OVl3qydMjKNziCwYf/U6jo7hIvwssIE7AsqgoEuxfAXaC/EAY67pnO8NNZYNcmJOBKYkXl3YxE=
X-Received: by 2002:adf:e34e:0:b0:48d:b8a1:53c5 with SMTP id ffacd0b85a97d-48e07fc0ab6mr16744823f8f.56.1792501223683;
        Tue, 20 Oct 2026 06:00:23 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:23 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:15 +0200
Subject: [PATCH v3 4/8] of: unittest: Test fw_devlink with GPIO nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-4-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add OF unit tests that call the fw_devlink add_links operation for GPIOs
routed through nexus maps. Verify that each mapped consumer has exactly
one link to the final GPIO provider rather than to the nexus.

Also cover direct references and all GPIO property spellings recognized
by fw_devlink, including the deprecated singular and unprefixed forms.

The gpio-map routes its entries to different providers so that selecting
the wrong entry is caught as well.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: Route gpio-map entries to two providers, use a middle entry (Herve)
v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-3-17ac82dbe226@toradex.com
---
 drivers/of/unittest-data/tests-phandle.dtsi | 39 +++++++++++++++
 drivers/of/unittest.c                       | 75 +++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index 554a996b2ef1..f5d7ee072c90 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -79,6 +79,45 @@ consumer-b {
 				phandle-list-bad-args = <&provider2 1 0>,
 							<&provider4 0>;
 			};
+
+			fw-devlink-tests {
+				gpio_provider_a: gpio-controller-a {
+					#gpio-cells = <2>;
+				};
+
+				gpio_provider_b: gpio-controller-b {
+					#gpio-cells = <2>;
+				};
+
+				fwdevlink_nexus: nexus {
+					#gpio-cells = <2>;
+					gpio-map = <1 0 &gpio_provider_a 3 0>,
+						   <2 0 &gpio_provider_b 5 0>,
+						   <3 0 &gpio_provider_a 7 0>;
+					gpio-map-mask = <0xffffffff 0>;
+					gpio-map-pass-thru = <0 0xffffffff>;
+				};
+
+				gpio-compat-consumer {
+					gpios = <&fwdevlink_nexus 2 1>;
+				};
+
+				gpio-compat-singular-consumer {
+					gpio = <&fwdevlink_nexus 2 1>;
+				};
+
+				gpio-consumer {
+					test-gpios = <&fwdevlink_nexus 2 1>;
+				};
+
+				gpio-direct-consumer {
+					test-gpios = <&gpio_provider_a 1 0>;
+				};
+
+				gpio-singular-consumer {
+					test-gpio = <&fwdevlink_nexus 2 1>;
+				};
+			};
 		};
 	};
 };
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e255f54f4d76..f15c110dbf4d 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -10,6 +10,7 @@
 #include <linux/dma-direct.h> /* to test phys_to_dma/dma_to_phys */
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/fwnode.h>
 #include <linux/hashtable.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
@@ -710,6 +711,79 @@ static void __init of_unittest_parse_phandle_with_args_map(void)
 	}
 }
 
+static void __init of_unittest_fw_devlink_supplier(struct device_node *tests,
+						   const char *consumer_name,
+						   const char *supplier_name)
+{
+	struct device_node *consumer, *supplier;
+	struct fwnode_handle *consumer_fwnode;
+	struct fwnode_link *link;
+	unsigned int link_count = 0;
+	bool found = false;
+	int rc;
+
+	consumer = of_get_child_by_name(tests, consumer_name);
+	supplier = of_get_child_by_name(tests, supplier_name);
+	if (unittest(consumer && supplier, "missing consumer %s or supplier %s\n",
+		     consumer_name, supplier_name))
+		goto put_nodes;
+
+	consumer_fwnode = of_fwnode_handle(consumer);
+	fwnode_links_purge(consumer_fwnode);
+	rc = fwnode_call_int_op(consumer_fwnode, add_links);
+	if (rc == -EOPNOTSUPP) {
+		pr_info_once("fw_devlink tests skipped: OF supplier links are not supported\n");
+		goto purge_links;
+	}
+	if (unittest(!rc, "failed to add links for %pOF: %d\n", consumer, rc))
+		goto purge_links;
+
+	/*
+	 * The suppliers list should normally be accessed with fwnode_link_lock
+	 * held, but that lock is private to the driver core. These test nodes
+	 * are isolated and have no concurrent link updates.
+	 */
+	list_for_each_entry(link, &consumer_fwnode->suppliers, c_hook) {
+		link_count++;
+		if (link->supplier == of_fwnode_handle(supplier))
+			found = true;
+	}
+
+	unittest(link_count == 1, "%pOF has %u suppliers, expected 1\n", consumer, link_count);
+	unittest(found, "%pOF is not linked to supplier %pOF\n", consumer, supplier);
+
+purge_links:
+	fwnode_links_purge(consumer_fwnode);
+put_nodes:
+	of_node_put(consumer);
+	of_node_put(supplier);
+}
+
+static void __init of_unittest_fw_devlink(void)
+{
+	static const struct {
+		const char *consumer;
+		const char *supplier;
+	} cases[] = {
+		{ "gpio-compat-consumer", "gpio-controller-b" },
+		{ "gpio-compat-singular-consumer", "gpio-controller-b" },
+		{ "gpio-consumer", "gpio-controller-b" },
+		{ "gpio-direct-consumer", "gpio-controller-a" },
+		{ "gpio-singular-consumer", "gpio-controller-b" },
+	};
+	struct device_node *tests;
+	int i;
+
+	tests = of_find_node_by_path("/testcase-data/phandle-tests/fw-devlink-tests");
+	if (unittest(tests, "missing fw_devlink test data\n"))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(cases); i++)
+		of_unittest_fw_devlink_supplier(tests, cases[i].consumer, cases[i].supplier);
+
+	of_node_put(tests);
+}
+
 static void __init of_unittest_property_string(void)
 {
 	const char *strings[4];
@@ -4533,6 +4607,7 @@ static int __init of_unittest(void)
 	of_unittest_dynamic();
 	of_unittest_parse_phandle_with_args();
 	of_unittest_parse_phandle_with_args_map();
+	of_unittest_fw_devlink();
 	of_unittest_printf();
 	of_unittest_property_string();
 	of_unittest_property_copy();

-- 
2.43.0

