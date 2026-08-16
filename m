Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA57B4B0497
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 03:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786851200; cv=none; b=SCp4bP+JLLPkebptvRPzh/4fERLgKM+SuPxeXyzb72xP+gk/Md1GpS0YcfgD1vMmedMK0aU7JybKVmu6SOClj0ffNs1Oj4iqPGJDKGzQLu1whP58Auju9O5mjqhk2gU6zhqlolAu+0VDT08FkQ5YqnPqO2glFr4mmhab2J0/L64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786851200; c=relaxed/simple;
	bh=pkjai2qaEM2iGypANcdpOa+96sXgV8GX13dd7ezvD94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c/tceOszkrtXBCoSyIcCIRIzZ64XCmx6j6F6cD1OP0KCcOJH8PLBQhitS8ALefqqQm2DYr+Nd0cvuJr+ewZW0p6DmGstyWvMKFNIgmGaH0Pfo1MB20qH9O3wiW0ZBC6ZuN2iuo2IrgpgXFI5lObOL1NnCj3T2mIKOquoG73ug/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=jRJ+m5SZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="jRJ+m5SZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ccf2360620so23066235ad.3
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 20:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786851198; x=1787455998; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JAqREToUjYTCQLEd8pcov/5i6SH68omeUXg4qpUAeN8=;
        b=jRJ+m5SZ3PjisSm+FjpKwp/mr5QETRIDR+G87FncyCRkrFHB2uqR5hSjMtz+49Y1Kq
         r5iaJd+HZQAhqO2DDQ8BNlKEbOrznhxj3sl2aQ916fdB2/JmKAihP4eBQr8phMIVbIJ+
         S+Hrkrfii3FIfx4u9i2N2gKbFptWxQ1cXnXdL3vfi4UDLk2bJCsqK5gP0KcSyD7mNvji
         0sfF/YjTS9AL8gCySge5xl36cb4KrPOK73SZVyd1PH1fEy1d62WyZ7+X/yEIbU9jKIsP
         wRgl20wC0HHq6y0sWe3dJmVtwzB/kO/uXRWN3YNyc1TgX5KlzOKAEJiqRHrHT+QKR1CV
         QmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786851198; x=1787455998;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JAqREToUjYTCQLEd8pcov/5i6SH68omeUXg4qpUAeN8=;
        b=X0em3v9w+q025DCepwWAayacEJ1iMeDW02veQ4jWmWjdvzcfn4LDKW/sAIgSm5x/nh
         O07euDYfK5kbvenpxtsQl6wUbrXcSs7ucBxaCu1EZti8ftdnIJn4FjhBjbfMfK5coV3m
         D75Bpd8Jxrn7rEZENgc12eN1Qvf5yuruVMT9mGkY6qkUKyOcfo9/GDyuYU/kBmRH/bpG
         CNv4PXHKGvo5+4FYIsTl8F03V/L5B4WgQpQN6V/umtb/BzdSysROHFsbdV/hAqKECLJ+
         8vG7dd5LD7+xzCkpOuBfcHFt+bcDpqimBwFxxe2urt2aDlzNkorkWElBseI38NmycO8p
         XohA==
X-Gm-Message-State: AOJu0YxAoBbP1JanXanFpzgXTGGfvAo62VqP3nYzG+oNklgzVUXZ2Tsa
	vsQ4OwUdnOfiAVJijzZ2BvWV3bs42FZKbMTY6c3wCLWNs77gVp0R4+LsdRtbfgzgK+m57VhcfXZ
	rl+ukI8M=
X-Gm-Gg: AR+sD12ZcrSNz+Dhz9Otz2hvtxcOohiCCdFrm984nPwfqcTL+N7CC0D0eTmzg0ImsUu
	3B6e6nxt8lf4cbbfBAWKm8bGnESlYy1Nv4gERJ/QgHVRRvhD7o9ef8HpC7ZHKzJy6bDyffdNT8L
	puLS2ctGo1XFQFSPrySSKWUdvePNGwBZ1AnHaMh+52J8ebHg34YUW+3wx/8JltV45xLL8bNHFSh
	WZfkKPqavgfieuOZvCJkEo9dLfjAhd3QS26IhtT9VVI5M+cjMRNfRlv9sYWjtNP91Usz2Go9A++
	Yb1aGX/tw/rVLq+rv/u8zdEfCkervRzd0NdDRpS96JbXuGRm55YEjCTLgmtlBvKoAp4IN9YKIyp
	4yl9vPrkqaJUsGj7cPtPtGHl9esRTE8ltzdgZrgBxV9XbYevQ8kUIQ621eVj9Bb0W91q3rwlICv
	I6TdmZUeVVC6ItsxDAY40y0RwSd/GNodTnKjr4co90e/BlSyoaF/pBCXK7WJuPOwo=
X-Received: by 2002:a17:903:360c:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2d3b0d5e37amr178953305ad.15.1786851198093;
        Sat, 15 Aug 2026 20:33:18 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320c6be7f6fsm23887057eec.0.2026.08.15.20.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 20:33:17 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 15 Aug 2026 20:33:13 -0700
Subject: [PATCH v3] of: property: add i2c-parent to fw_devlink supplier
 bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260815-b4-of-property-add-i2c-parent-v3-1-c22588b6482a@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OsQ6DIBgE4FcxzP0bQKvSqe/RdED4rXQQAtRoj
 O9esEs7teMll+9uJQG9wUDOxUo8TiYYO6ZQHgqiBjneEYxOmXDKa9qyEroKbA/OW4c+LiC1BsM
 VOOlxjMDqVtW66ZkoK5IM57E38+5fb+8cnt0DVcxobgwmROuX/cDEcu/frYkBA8mrtkHBqUJ2G
 XGOg3VHaUgem/gnd/rF8cTxUqT/UiAVzRe3bdsLfngZ/SwBAAA=
X-Change-ID: 20260813-b4-of-property-add-i2c-parent-168c6d7f1934
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786851196; l=4085;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=pkjai2qaEM2iGypANcdpOa+96sXgV8GX13dd7ezvD94=;
 b=s8hAtuOi8/Bq//0aRQC/jqTXJNQpks6rXE6N0HEnTonrAtZK7Ajurs6LupZW21D21Mi9XBCTj
 4wHK2dO2nbMAMJJtlg7PByfcHJWE8ZI0BiwvW6E1YBbWyc3XhuAi5hJ
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Platform-device i2c muxes (i2c-mux-reg, i2c-mux-gpio, ...) reference
the bus they multiplex with an i2c-parent phandle and hold a reference
on that adapter from probe until remove. Unlike muxes that are clients
on the parent bus, they live outside the adapter's device hierarchy,
so nothing orders their teardown against it: if the adapter's device
is unbound first — e.g. while reverting a device-tree overlay whose
changeset attached the mux nodes before the controller nodes —
i2c_del_adapter() blocks forever in
wait_for_completion(&adap->dev_released), waiting for a reference that
is only dropped later in the same teardown sequence.

Teach fw_devlink about i2c-parent so the core creates the
corresponding device links: consumers are unbound before the parent
adapter's device, and probe ordering no longer needs -EPROBE_DEFER.

A plain DEFINE_SIMPLE_PROP() cannot be used because the property has
two incompatible layouts: the i2c mux bindings hold a list of bare
phandles (i2c-demux-pinctrl takes several), while toshiba,tc9563 holds
a single phandle followed by an i2c slave-address cell. The two forms
are indistinguishable in the flattened tree, and a 0-cell parse of the
tc9563 form would read the slave address as a phandle, linking the
consumer to whatever node happens to carry that phandle value. Use a
custom parser that only takes entry 0 for toshiba,tc9563 nodes.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v3:
- Fix the tc9563 compatible check: match "pci1179,0623" (the actual
  binding compatible) instead of "toshiba,tc9563", which never matched
  and let the bare-phandle parser misread the i2c slave-address cell as
  a phandle (Sashiko AI review)
- Link to v2: https://patch.msgid.link/20260815-b4-of-property-add-i2c-parent-v2-1-239c6da9e097@nexthop.ai

Changes in v2:
- Use a custom parser instead of DEFINE_SIMPLE_PROP: toshiba,tc9563 puts
  an i2c slave-address cell after the phandle, which a 0-cell parse
  would misread as a phandle (Sashiko AI review, Rob). Kept the full
  phandle-list parse for other users since i2c-demux-pinctrl takes
  several parents; only tc9563 is limited to entry 0
- Move the Signed-off-by into the commit message proper; v1 had it below
  the '---' cutter line where it would be dropped on apply
- Link to v1: https://patch.msgid.link/20260813-b4-of-property-add-i2c-parent-v1-1-a2487e920ce1@nexthop.ai

To: Rob Herring <robh@kernel.org>
To: Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/of/property.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..9bf3bc0a5f38 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1471,6 +1471,22 @@ static struct device_node *parse_gpio_compat(struct device_node *np,
 	return sup_args.np;
 }
 
+static struct device_node *parse_i2c_parent(struct device_node *np,
+					    const char *prop_name, int index)
+{
+	if (strcmp(prop_name, "i2c-parent"))
+		return NULL;
+
+	/* tc9563 (pci1179,0623) is <phandle addr>; every other user is bare phandles */
+	if (of_device_is_compatible(np, "pci1179,0623")) {
+		if (index)
+			return NULL;
+		return of_parse_phandle(np, prop_name, 0);
+	}
+
+	return of_parse_phandle(np, prop_name, index);
+}
+
 static struct device_node *parse_interrupts(struct device_node *np,
 					    const char *prop_name, int index)
 {
@@ -1562,6 +1578,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_resets, },
 	{ .parse_prop = parse_leds, },
 	{ .parse_prop = parse_backlight, },
+	{ .parse_prop = parse_i2c_parent, },
 	{ .parse_prop = parse_panel, },
 	{ .parse_prop = parse_msi_parent, },
 	{ .parse_prop = parse_pses, },

---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260813-b4-of-property-add-i2c-parent-168c6d7f1934

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

