Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CBA36F421
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 23:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786837063; cv=none; b=mlKhy1IgXxnIy0injw9Q159iYmAoXZxFwGVkK7awbrPYFooehqC3RSrGnzjcZEVYbyKenSy0MjmpmxEO3r6bemjHqc6/487fIty4I+Mpi2uFY7IbRGGVofduJKROfOWl9jHKjkHOoGqdoUBdNgVjLS8ibAs1zfOa9VsL6Mekc+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786837063; c=relaxed/simple;
	bh=UTB4PCVZCun1MDvQa5ILxomTqEdGuBl84TdN3VTAJAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iYAJm+reO5ptKjsCvKkO8UC4APuGc7I/dpMOxI2leMBuPqBZBGcCAUrMn6qZPGAyHd/mmwJOdgozrleHwP29Bcxrv11Qwkf/FPjiloVQ8FB10YXSf01vu6iLkvtDEU0nwZF6dCmc477y1dMmY/1q9oyl14/115iT1wjWgdgARYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=DsO54/DP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="DsO54/DP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d032846c95so32344405ad.1
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 16:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786837061; x=1787441861; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lw+c/7BI2fa5typwmFQ1GqcMZJz9TiXn2p5B/sA9qEY=;
        b=DsO54/DP8MNJ9SST7xWcVBJIhyWNfQ///3QmJ7NP2I99BM91xSOtgt6b97nUgJ+EBr
         sQklHd69MlwAHY6ODweYu0HaAaDcxof7oJCF8HIhfcOs3sLvCl0wMWWpDSVoPNbqB77I
         TVSg24Q/ZVnSvXl6zFmPhx3clXaYI2GCgw+c1j2eS7tOwAf6M0+w07v/YvFDnss7ceDU
         3wlwyhRVnAf1D80RSfo5aE1m2bQKr/EZG29sJ9mjciYIDE+IgexZS3Rdj0iST1pPhCky
         nY/6ZlJTROS80n9lyGUEy4yyRXQVdmXYy298yspR2YLJ3+45UUvawmoZIBhev37kkmRv
         vzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786837061; x=1787441861;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lw+c/7BI2fa5typwmFQ1GqcMZJz9TiXn2p5B/sA9qEY=;
        b=OObabQ499qpDlf40Axe9BhX8hZZBmE9Fux4EDSe9LmeIWHo04MYyk+DpKXJ0NFMKFL
         JthUTOlzbyBrtHPaT98q7OFcDGeVg6X1wG0cXBKndYLOgE6Iqj/QVDxd1REU6SyTTRhd
         ELukn8oyH+nqt8+KzHqu6bBSEfPW6XYzX5JCgEa56lt1q3qFka/WGd+dTfnk4AVfPhIk
         1gPgrYnycIfQxN4OyUGR9vnd3pgWs5MeN06JKovGK60nwgUTjxCPUoqRAK7i0viKgw0X
         OQJrIJNaVzv6c+O0PKXd2qnB1TFIOuyhWr6NcF2uggMwxR12dn70xjEYEZ906GExmZsY
         Vumw==
X-Gm-Message-State: AOJu0YxSaz1rSNBOBj6bhj4uCJRit6pLw6TYlHt03eIuKUAFqB9NCuVg
	E+vQRDTJkVjq8pA+WER90oohr4ZZ8dqvlLQyVU4qMKUyhmclOLfOjOF4gtD7TwgHBJA4su3QDXJ
	o8dJ/Fv4=
X-Gm-Gg: AR+sD11XMa33+rd6kStEdDNs1Qvptpkd8rVj7AWL9l3lqHPg/CJBdoIUB93tC0CjgXt
	JL0xeInTiXIXfsnb+2jKido8sYoARbU2q2UND1JX7ovGVBmx7ikvdpFZKgmefezU1QTQEE91sni
	yB+FI9k8Nbzjr31tZl9nx8K8nV7SoR1TN6nee54OfrmSqJFzDUOLvjtbfrGruws890aU/7mJMKQ
	JObThL4l3IP/StZ0zn2yTFu0y/P6jpvHOIVOQGCz91+EPDDiMpoNFtPfKXoWZL6tChWbsQ+JoSv
	HvJPs434c+5lGWxrVEiaUG/nfWSq4DaAaMqM1cYxk+rKDfNREzlLzE65famTvfamqr/AMQx2ESr
	KoTmCnQrJ6phKuII93/dElrqNLINTvG6wz4sxDysT2+dRIar7n9iMryHcy/k3BUETSaBXAtzOPs
	1AwJfkJFUmNtzbYgtWyjFoTSOH5l6+ZS/XtXLnpx4E7XZNyrSJ3iGtCHisudf5qi8=
X-Received: by 2002:a05:6a20:728a:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3cc71de6bb8mr14725477637.28.1786837061115;
        Sat, 15 Aug 2026 16:37:41 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea2fe8f1sm20111880eec.23.2026.08.15.16.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 16:37:40 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 15 Aug 2026 16:37:37 -0700
Subject: [PATCH v2] of: property: add i2c-parent to fw_devlink supplier
 bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260815-b4-of-property-add-i2c-parent-v2-1-239c6da9e097@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OOw6DMBAFr4JcZyNsEJ9U3COiMPYSNoVtrR0EQ
 tw9QC6QcqTRvLeJiEwYxSPbBONMkbw7QN0yYSbtXghkDxYqV1XeyAKGEvwIgX1ATitoa4GUgaA
 ZXQJZNaay9SjbohRHIzCOtFz9Z//j+BneaNIZPY2JYvK8XgdmeXr/bs0SJGhVNjW2KjcoO4dLm
 ny4axL9vu9f5OZWq90AAAA=
X-Change-ID: 20260813-b4-of-property-add-i2c-parent-168c6d7f1934
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786837060; l=3707;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=UTB4PCVZCun1MDvQa5ILxomTqEdGuBl84TdN3VTAJAc=;
 b=8UR0pRAHXWt5ot664JlNs84mveVN436O+7WJz43OyeDp+mVJ+oryPBKeQ72c2/uHfSFg4meVB
 DklTK5C4owZBCDKgzgGbN+DyXfTONgnmBW7dbnJzvmrMiZIclQvqjeE
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
index 72cf12907de0..e9ceb26c0300 100644
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
+	/* toshiba,tc9563 is <phandle addr>; every other user is bare phandles */
+	if (of_device_is_compatible(np, "toshiba,tc9563")) {
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

