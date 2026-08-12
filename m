Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FADC47F77F
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555385; cv=none; b=WotXfX1Jrk2ea/DjXuQv6T62W3cxHvo1q5uV25l0c1vUCLafAOXirXxCQGj1ZrpsiclpRP9kVJR+TME+8AGvEi9WIcf62heGiSH22vdp/CkYNgR7MoCE8uGO6uczZBFuyHUVXrE9L5UpiXGnWP8KLVq0O58Y/r7G60QQUiF0vjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555385; c=relaxed/simple;
	bh=mPn73CqzfrdOvjuc2ohN6xC//Fl39RO2mkY8Ijir1Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uigQFxLBfsoxMRU6aVwDG+AFilqVqXBLBI8BqsEWoiK+0jEjVlMSD8okcOBRO011oZObEvAi82JLuEBwFod23xIrt680y/UtoO1mKhzAoaG5+nQqa47E2AsQ0ZRt0gQNKCNsWGZkQq+DsSDPYhUuP5/NjwWfPW8QJnLHs6U6H+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Tj5YEt9g; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Tj5YEt9g"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-930c0f9c1b1so77893085a.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786555379; x=1787160179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3K2YFyPbwee3TOPI2L++unR/lM5wpp/EyOEokJr7A+U=;
        b=Tj5YEt9g0cbsLqAdp6LjKTPrlJKVAxLH95aNmoaK+AGXsOHBVentwmaElh+9tDBtoU
         fUT+dLlJpBZ7TCZYCGUbOHtGbtJ+Gc2GEju5ydJbrsuyVqxs5lu7ankCuA2Vkdv+dU9N
         VciOiOeEsJ0XVBdvbFJVvMe07Y2rFbppJoyIdl00pAvV78baD5oEauVejLpRAwszDGVa
         HPXfr5BDn3ewg9uHIJx8v4PfWkShE7mW5HJH4zv05LvJ0NzsG2v7zifRcrr4B2jrSXW1
         VyIX82yo/OUrNML9yYmySdBhnJaHahw8Aat6v0mkh+JQbRqLeNBCWzuc3YmK6Qfj7Cqs
         AIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786555379; x=1787160179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3K2YFyPbwee3TOPI2L++unR/lM5wpp/EyOEokJr7A+U=;
        b=cf4dSaCqzf0TSOXTya1DCVQ/JuU+qHci8Jl/KTdD5KQuRTukke1Zmm0EKSO2vZzrOS
         1AeuTjte7Sjn9fpefHEAyoP/ooIXWlfuV/pprMiyHPlKrucl8ey2GqZ15oIleeaF4zWe
         c+spIEb21uuINdFHFB1cY4y9FeQTH1L7VkhsRCyiPluz2olCWcFIealMuxSVcfmqTIsQ
         9sb54iQTzfaKAAAEiDOd5W7CqWHb4S8c+V3lUadLPYzx5W+rv53Hn8D/5MFVqKno1Oyq
         Ptk+MYbGcXCQz4QNDHdqhnZiaWxxJYtXnoffFfixY7WSspFHtsM17wjJe3X842O1p792
         K+wg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7pcU+PAFjsqEMH/6WE80bSAlGZ2PZzoAJMvOhR55Nx/6oDFjI/NNPzC6vPqBayRDGIXJyXiLfekU3@vger.kernel.org
X-Gm-Message-State: AOJu0YxjrVMNrRvymX/d0MCtvuOXbb+6Wh40Nm+a1/ESye2T4vmShWX8
	1wDWWKpBTR75ctBIY2cZrfsdLZWntsbyHmssl/QrYxQQdvECog4ssRC3Cy7iRHUBtas=
X-Gm-Gg: AR+sD11ZB6ABvno5Hw7ywEZXeojMulihswfFhu43FPJ5SlsmzQkif9WSjHBGCBfuhRb
	rfzcvB0vapiv6z0QEhzTQD1PdqMcz/Shf3l/686Nc158hUT5Sb+XlEfy9l+8Kkvu04nafchBOTs
	5ypTAiWiwihzJgdkCKbx14FT548TDaCsC6VigWEM2NiXNu2oNZc9yeltgOj7DTl/ssAmIZyP90j
	HkNi4HovnDrgdIY8mW5tHd2Q3fLpUY0ci/P7XludRPxUaIIsrXC0Ndurex9iFSzeLiv989gj+HV
	c8Alr2OF0srZ3epwyJJbMe1+MCjC1forhNg2MamaEdrbSV+C0YTykkuTdeQyB7e6z/jZG5euitG
	mN4poK1gIjSAGB0KZy/X5RDKeS+pd9zCrqkNIjsRp7fDsColomwGoxeb6/X1eyi3cOealCyINmG
	357cSo58ThSOmHb1dIhBOLOZvmcJ1hC+XOWHqndSMc5rX0xAybREAuBlkTB1gpCs57BQ==
X-Received: by 2002:a05:620a:a718:b0:92e:535b:e08b with SMTP id af79cd13be357-936b3d68c02mr526104385a.33.1786555378959;
        Wed, 12 Aug 2026 10:22:58 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936b5f720eesm173587685a.47.2026.08.12.10.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:22:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] PCI: of: introduce of_pci_verify_node()
Date: Wed, 12 Aug 2026 12:22:47 -0500
Message-ID: <20260812172247.276554-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812172247.276554-1-elder@riscstar.com>
References: <20260812172247.276554-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 407d1a51921e9 ("PCI: Create device tree node for bridge") linked
the PCI enumeration process together with devicetree, creating a devicetree
node for discovered PCI bridges.  Its successor commit ae9813db1dc5a ("PCI:
Add quirks to generate device tree node for Xilinx Alveo U50") shows how
to use a PCI final fixup quirk to also create a devicetree node for a
non-bridge PCI device.  These changes allowed devicetree overlays to
describe components downstream of a PCI device, by providing a place to
attach the overlay.

Note that the dynamic devicetree node is only created if the device didn't
already have an assigned node.

Later, commit aa7b4bbcb3a1d ("arm64: dts: qcom: qcs6490-rb3gen2: Add
TC9563 PCIe switch node") *pre-defined* devicetree nodes to represent the
PCI device nodes that would (also) be discovered via the PCI enumeration
process.  The devicetree node in this case is created with the content
from the DTS file.  So when a (host) bridge is done being initialized
during PCI enumeration, no node is dynamically created (the commits
mentioned above do not apply).

Ideally, any pre-defined PCI devicetree node would contain exactly the
same information as whatever the dynamic creation process would produce
(though it could include more).

However that is not the case for the pre-defined Qualcomm RB3gen2 nodes.
And in particular, the endpoint (function) nodes include this property:

    device_type = "pci";

This is simply wrong; that property is meant only for bridge nodes.

Rob Herring requested that a runtime check to be added to spot this
specific error, only for non-bridge PCI devices.

(There are many things that could be verified for statically-defined
devicetree nodes, but this is all we'll do for now.)

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: Verify even if PCI_DYNAMIC_OF_NODES is not defined (Sashiko)

 drivers/pci/bus.c |  1 +
 drivers/pci/of.c  | 26 ++++++++++++++++++++++++++
 drivers/pci/pci.h |  3 +++
 3 files changed, 30 insertions(+)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 655ed53436d3e..679afbc6d3109 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -351,6 +351,7 @@ void pci_bus_add_device(struct pci_dev *dev)
 	 * are not assigned yet for some devices.
 	 */
 	pcibios_bus_add_device(dev);
+	of_pci_verify_node(dev);
 	pci_fixup_device(pci_fixup_final, dev);
 	if (pci_is_bridge(dev))
 		of_pci_make_dev_node(dev);
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 8b18c4ba845cf..0bbf1a915b7d2 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -1006,3 +1006,29 @@ int of_pci_get_equalization_presets(struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
+
+/*
+ * Check a pre-existing devicetree node for errors.  The PCI enumeration
+ * process gathered a lot of information about the device, and ideally it
+ * matches what the devicetree node says.
+ */
+void of_pci_verify_node(struct pci_dev *pdev)
+{
+	struct device_node *np = pci_device_to_OF_node(pdev);
+
+	/* If there's no pre-existing node, there's nothing to check */
+	if (!np)
+		return;
+
+	if (pci_is_bridge(pdev))
+		return;
+
+	/*
+	 * Currently we just verify that non-bridges don't contain a
+	 * device_type = "pci" property.
+	 */
+	if (!of_node_is_type(np, "pci"))
+		return;
+
+	dev_err(&pdev->dev, "\"pci\" device_type NOT VALID for PCI endpoint\n");
+}
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4469e1a77f3c1..88dde67bd60cb 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1205,6 +1205,7 @@ bool of_pci_supply_present(struct device_node *np);
 int of_pci_get_equalization_presets(struct device *dev,
 				    struct pci_eq_presets *presets,
 				    int num_lanes);
+void of_pci_verify_node(struct pci_dev *pdev);
 #else
 static inline int
 of_get_pci_domain_nr(struct device_node *node)
@@ -1260,6 +1261,8 @@ static inline int of_pci_get_equalization_presets(struct device *dev,
 
 	return 0;
 }
+
+static inline void of_pci_verify_node(struct pci_dev *pdev) { }
 #endif /* CONFIG_OF */
 
 struct of_changeset;
-- 
2.53.0

