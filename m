Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368A2F617C
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789187512; cv=none; b=sJLnyF0BzCZck4mFX9Yzehe2g26z7V8B1bSdxkDqZm0OLxwAe091bSRh2D7rEvfFBSDCRgkC1wkUYcPVDxZa0UgilFpSwwP7XzahJ24r9zJAAVFilG5RU68gUmXOa4bJjHjenJxTNyQlmU6LTZFGpzUb0okPbl+SM8e82nntcno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789187512; c=relaxed/simple;
	bh=sfKCzdxaib4+pasocL4R9qT+1CZ6GpvPWb0b0BSuC3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5ChJ5Bf1SMC9QxwF+X05wTiVd416M1tWGym4gmokVHqB3UHqkVcW534Dhv+tCEWfa2jsaw/q20KMjvVIZ6NsazThb8qP2D+YdxeV8HlzyjPWseBBWDvaKF9Obi4HymZD2+ac4RvhAxxV68QB7e9XD0wFCKAk0FbL4vKlpkb3es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=httpd.dev; spf=pass smtp.mailfrom=httpd.dev; dkim=pass (2048-bit key) header.d=httpd.dev header.i=@httpd.dev header.b=t+5szApF; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=httpd.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=httpd.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=httpd.dev header.i=@httpd.dev header.b="t+5szApF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=httpd.dev;
	s=protonmail3; t=1789187500; x=1789446700;
	bh=sSqoYH0c21mEhcvpAIK0bj7Pj0T2Ip9t6Lb6uBWDPEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=t+5szApFwbaQf07puBq1wdaNfHt8OmNvVMBDX4683NUam9S1ARn5ywllB5KVYes/n
	 LiQitvej4j4I5gUR2kQGK3Ln/bkUQhBtNQb55cXh52qgs7BCDIs/KrMJt2E6f323xW
	 DskuLMkmX5LSPZiYGvlb0J6EA5O2zEziPdrAvouxyZ9JSj2Ze4RbbN++P9HIFSs0z8
	 aAOsd2tqv0fgx8rQFBohaVDnoZzqUE+hHHdgwJ3P5RwjK+Nm67rbTchIGkJgtRRldL
	 /pjzky2+aT6ft+bqtGJvppgBlyA4oQGpQQMVvOS08sW6pVgrudpjcgLKtJ2P5O3GVq
	 Q3EHZXTL1UpCg==
X-Pm-Submission-Id: 4hhdln4Rlvz1DDLV
From: Angel J <iamanaws@httpd.dev>
To: linux-pci@vger.kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	herve.codina@bootlin.com,
	lizhi.hou@amd.com,
	andrea.porta@suse.com,
	florian.fainelli@broadcom.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	Angel J <iamanaws@httpd.dev>
Subject: [PATCH v2] PCI: of_property: Omit bus properties without a subordinate bus
Date: Fri, 11 Sep 2026 21:31:06 -0700
Message-ID: <20260912043106.10715-1-iamanaws@httpd.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911230420.26244-1-iamanaws@httpd.dev>
References: <20260911230420.26244-1-iamanaws@httpd.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A device can satisfy pci_is_bridge() without having a subordinate bus.
The dynamic OF helpers for bus-range and interrupt-map dereference
pdev->subordinate without checking it.

On a Dell XPS 8940, device 0000:00:00.0 [8086:4c43] has no subordinate
bus, and enabling CONFIG_PCI_DYNAMIC_OF_NODES causes an early boot hang.

Generate bus-range and interrupt-map only when a subordinate bus exists.
Keep the node and its remaining properties for bridges without one.

Boot-tested on Linux 6.18.44 with CONFIG_PCI_DYNAMIC_OF_NODES=y. The
system boots and the node for 00:00.0 retains device_type, reg and
compatible. The other bridges retain their nodes and bus ranges.

Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
Cc: stable@vger.kernel.org
Signed-off-by: Angel J <iamanaws@httpd.dev>
---
Changes in v2:
- Keep the dynamic OF node and skip only bus-range and interrupt-map
  when no subordinate bus exists, following review of v1.
- Tested on Linux 6.18.44 with the v1 guard removed.

 drivers/pci/of_property.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 75a358f73..acd2e0f70 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -361,13 +361,15 @@ int of_pci_add_properties(struct pci_dev *pdev, struct of_changeset *ocs,
 		if (ret)
 			return ret;
 
-		ret = of_pci_prop_bus_range(pdev, ocs, np);
-		if (ret)
-			return ret;
+		if (pdev->subordinate) {
+			ret = of_pci_prop_bus_range(pdev, ocs, np);
+			if (ret)
+				return ret;
 
-		ret = of_pci_prop_intr_map(pdev, ocs, np);
-		if (ret)
-			return ret;
+			ret = of_pci_prop_intr_map(pdev, ocs, np);
+			if (ret)
+				return ret;
+		}
 	} else {
 		ret = of_pci_prop_intr_ctrl(pdev, ocs, np);
 		if (ret)
-- 
2.54.0

