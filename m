Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED8378D92
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262157; cv=none; b=MA9PesE2EXC+I3bwTH+qFyyKZqhvkNY5UYZ0Cp/rlHbkHyM4fI7yqEOvQy8NwmSkiFoWb6G1M3MB1Tz+6iJvWtmtNkhIOBFve2OcU4rKTfVYW+sX/iBafyMj5AQ8ZlTgaF64+W2HyZVIvfhTJfK/C3a0urwDBTjmbMQoeDTkn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262157; c=relaxed/simple;
	bh=X1KXs+i5uL9uwAw7KV41qBYIJSZ3+jEh3Bc9Sxzdsps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tbi4yFSIF+1MdjPTnZhPpc3axKhnlKazcKXIffeYYMgkqSJJJ6IiGpQvPhy1RV6jBdePr+/iHdfI5CJKCY3nB9sZ7psYhJUoLaTxjJ7nwyi91NO4lYZpg73loWdaEhi2nzCj8Yyvs4fJBj5f55eOlAXaar8gtZyigIvQAaY+TU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=xhDNwbl0; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="xhDNwbl0"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91071ba92a8so11910346d6.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790262152; x=1790866952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLSKarAZusXR0W9CXQ8qq3Qvo3B/rbo6r97R+Zk/6MU=;
        b=xhDNwbl0jSobv0z6BMv6cqJkaf6/0KFlt69f/TFEt9uju+7arJcP0/mQE1rFure/+G
         RSpckLxPez+IPmN2AGJLxF1uGJGUTTb4HU74FIYZ8XArPtkDN76Y40fztVKRzZmT4s5O
         Cnsr4VKKtD72gGuFngkNPMYoOt4XBFG0bFl7CGgLjaZRZtPk9c7770LlV3jHl1k6BlqQ
         8MP1mAJZ8QRzp4/GrSmD1H3Nw5VDlNAovGZVqN/X9uZN08Wobj+pGOtngq3t9o8pl/6o
         iNUL8wNxaos5rQWT6+1Zj7hmuzaE71zHmcbknoGqn+ejck8TmCKnW/up5rwzQ48tCLME
         oJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262152; x=1790866952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fLSKarAZusXR0W9CXQ8qq3Qvo3B/rbo6r97R+Zk/6MU=;
        b=J6Cb0dBIF+8bMxLG6+84z+NS2eTU9JfjayVzpRdk3Uvv8DWTtyQkcWcib2NUdQWWys
         JiNMm6j7m8luP7fR38VvhcRGchUmyqdVo3KTT8wSkQSnpcUBpsy1I2bOj0q00V7VE0NQ
         9H8xbmKHddcXdUZ4U/GKiYwmXJnq41DPXU5O316DFqQIu6uYwzuDSMmp0aK4YXfhwHcW
         aZ0TnQ8ZnI/oNSX86rH75NjvGAptWBTAx645LG/DPcIGI+0LqfiJYASDy4Ha3blixnKx
         d4VfVQetes/JwPX2i54JuWao9KOwT+PD29mzlL9TA+Hxrzl05Lc3X4fYBS28nqXA2QvB
         DK1w==
X-Forwarded-Encrypted: i=1; AKwUvByeX/n5FvoUMuTLAT8bZhaUnhBT8SXJNiZGwM7GLjanRJcJGGpbPsjnoiB8htD8pZwu/kCREu+uLV2N@vger.kernel.org
X-Gm-Message-State: AFuF++mIiBV1oxVUgCUQodYSpFjbbb/k7P856yMjTgUfD2Q7K8VC4VIY
	lXpYNDJpRzQhmSTbARFVfjYdtR/UDhS6A06IE3ngR230CofebjZcz9XcO1XiYnwBZuU=
X-Gm-Gg: AYBFou3b3rQ7WPEUSYO1pZJ5hqfYoE+fJJsknc1COrTTfCBlF8Ilkj/aUDyvGoChoeq
	xkLWROTsNTXP0OP9yBt9iFzilQE6uU5cVPG/UssqUQmm6wEY+N6LBeRmIUYSJQHRGz+PhLBV1+N
	aqP/gvy3F7sC/jmRr6slnH/ztdlOpp1ulCOebRnPUTlUzQhRgl6pWyJH6ve3H0199izkMRkfGW6
	xJYnpb/uRdbUdE21bsQUAuaWokR/guaKZUrDoXVMbV+dB0/Re/SFZYZC7TDFf3yirH0e7dPvShn
	oXIbKYN/PK0XLF2z/OiqAo6/adaSg+pfFay5e/qWrRfs93kVucOUTlLmfR62N5vjHooGKSZUp+8
	5TQ5RUp+nMH9seLUqGvvkdVTpl3rfBLsc0dboN4JgUh33MSoujOYY0ZAaoE52X54Sj+xd6orGyL
	OZ1sA386K5IsCEDeqVuoBoa4qTUkgJlSQW2U/h5uv96GRv7X5ljp0HZTHHzTmOzg9tNZR78wlDi
	ReX
X-Received: by 2002:a05:6214:4801:b0:912:588d:55e8 with SMTP id 6a1803df08f44-91421c8bf57mr26174106d6.9.1790262151859;
        Thu, 24 Sep 2026 08:02:31 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e24e458sm18438236d6.21.2026.09.24.08.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:02:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/4] PCI: of: introduce of_pci_verify_node()
Date: Thu, 24 Sep 2026 10:02:21 -0500
Message-ID: <20260924150222.1179235-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924150222.1179235-1-elder@riscstar.com>
References: <20260924150222.1179235-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Open Firmware PCI Bus Supplement and Devicetree Specification
reserves the device_type property for PCI bridge nodes (with value
"pci" or "pciex").  Non-bridge PCI endpoint nodes must not include
this property.  Rob Herring observed that developers seem to get
this wrong.  Commit df4107fc729e3 ("arm64: dts: qcom: qcs6490-rb3gen2:
clean up PCI function nodes") and a few that follow demonstrate this.

Rob requested that a runtime check be added to spot this specific error,
only for non-bridge PCI devices.  Herve Codina further suggested we
ensure that bridge PCI devices *do* define the device_type property,
with value "pci" or "pciex".

Implement these suggested warnings in of_pci_verify_node(), a new
function called by pci_bus_add_device() for both bridges and endpoints.
If a PCI bridge has a devicetree node, a warning is issued if it has
a device_type property whose value is not "pci" or "pciex" (or if it
has no such property).  Similarly, a warning is issued for an endpoint
if it has a device_type property having one of those two values.

To be clear, this adds warnings, but otherwise ignores the errors
it warns about.  It is meant to help developers; users should never
see them.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/bus.c |  1 +
 drivers/pci/of.c  | 32 ++++++++++++++++++++++++++++++++
 drivers/pci/pci.h |  3 +++
 3 files changed, 36 insertions(+)

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
index a51dff91b196d..5a040ed836744 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -1085,3 +1085,35 @@ int of_pci_get_equalization_presets(struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
+
+/**
+ * of_pci_verify_node - Sanity check some PCI device node properties
+ * @pdev: The PCI device whose device node is checked
+ *
+ * PCI enumeration authoritatively discovers what we need to know about
+ * a PCI device.  A devicetree-based platform will represent a PCI root
+ * bridge with a node, but otherwise devicetree doesn't typically include
+ * many PCI nodes.  Where such nodes do exist, experience has shown that
+ * the "device_type" property is sometimes wrong, so warn about that.
+ */
+void of_pci_verify_node(struct pci_dev *pdev)
+{
+	struct device_node *np = pci_device_to_OF_node(pdev);
+	bool device_is_bridge;
+	bool device_type_pci;
+
+	/* Nothing to check if there's no pre-existing devicetree node */
+	if (!np)
+		return;
+
+	device_is_bridge = pci_is_bridge(pdev);
+	device_type_pci = of_node_is_type(np, "pci") ||
+			  of_node_is_type(np, "pciex");
+
+	/* Bridges should have device type "pci"; endpoints should not */
+	if (device_is_bridge == device_type_pci)
+		return;
+
+	dev_err(&pdev->dev, "PCI %s have \"pci\" device_type property\n",
+		device_is_bridge ? "bridge should" : "endpoint should not");
+}
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ba3c3fddddc23..2e33d3bd4b0ba 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1253,6 +1253,7 @@ bool of_pci_supply_present(struct device_node *np);
 int of_pci_get_equalization_presets(struct device *dev,
 				    struct pci_eq_presets *presets,
 				    int num_lanes);
+void of_pci_verify_node(struct pci_dev *pdev);
 #else
 static inline int
 of_get_pci_domain_nr(struct device_node *node)
@@ -1308,6 +1309,8 @@ static inline int of_pci_get_equalization_presets(struct device *dev,
 
 	return 0;
 }
+
+static inline void of_pci_verify_node(struct pci_dev *pdev) { }
 #endif /* CONFIG_OF */
 
 struct of_changeset;
-- 
2.53.0

