Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51903ECBEE
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526652; cv=none; b=ua0U4edMLNqA9bDfkfycMv7pF2SXgd1XhjtAZB0Tk/z8K5zuCJbgzfVMfvcQmI1H7qmmogZQMAM2uqHUlnNRy9qyU+EFvJA0zOv4XL/vFDjluDihHlkhQeI0jjpkywpQhGYDgyMtHL8p5wLyilxRQSHtIio98Efu4oLGJDVt7x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526652; c=relaxed/simple;
	bh=ksXhDnXUSc09ymO9BUxLE2AHU4CFZ+IdaWJBQsG3b4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+k8fY2UyqjwKnfkPPh+Wl3ZF9MYJ+O0eIlRXU9N2HriMgBVaqRNOUxlrBmipwsFcp5cYjNEBC8KxKNydYbPTlYs1DhGxkBmYQhgfcw+/I8izaCssGjM7koTUU+ueGlskFRVtmcH0gcu0dsPmHSLquRaQ7CeLH2Rbn4iNU05vhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti46jqoB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti46jqoB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso17676855e9.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526641; x=1782131441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPmpKQP5INxuKqSCk2KpcTRPXdjTeeSY27wYeWvsmvE=;
        b=Ti46jqoBGXT+mhYa55JGv7biJ+XTMX0/hpO4JhLLewADvf+15/4NkYWtmO+9GuKsfF
         ff6cc9vKzrNI2wfSikRA6F0cCDyaYnuY5k9Vd/fqpr+40+n4m+L9d/IBgNvEZrUEmRMm
         2Mo/f27wgno1YHBm72hnI0mTJcKvYs3jqehTADRn0haIoWIN3ZIrmLaoQ/NVLegw7G9M
         GbcYZZ6h9C83Yl2A0V3P225Dz4rV+fULjZ3VoB7rnLMT7TMZMA6PFz3AkLNijxdTuVXl
         MjBlY5+ZNF8LHpF5Ef+xb7TTmZollSEWMcHCgoHKGaU42BX7npJf3JNOCEMwVBFUE1LM
         2sXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526641; x=1782131441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VPmpKQP5INxuKqSCk2KpcTRPXdjTeeSY27wYeWvsmvE=;
        b=eKdfsZ/JpcZpaw8tark0n8NmumaW5y/O/x2sGcgOAKA75xepDLK3bK3KUvzMCRw4/Z
         EzclLgyYw+zcV/YwGW+AVioA5BtJPr/iPqUGFWM8JLmUf5BKCBrli9GAHA7bYSTbKBna
         ioWMs0+hqfmhRNsJeA9PMhXKaLxUSzOcuBCa/zbiFNWjax68Gh267CP0mmDLyfq9wcCQ
         SONpeuXcTCNj2/IXt3kcIUJ1J1/5FTkWQkNRsCTIdkTtrpjsbKHq9dfJhN9fvDtYKT3X
         gYUCwEvmr+vxV1Gl/03UKdge3TecqapM9Yd1Rf18/WmRiS1WpKq2VAOQKw0GarcdWLZY
         vdKw==
X-Forwarded-Encrypted: i=1; AFNElJ/TEvQuND2CHYQrEEWQRS4dw4q84RT4zqcX6fBBzvTaMPEsdukzuHByppv29fJZnsbuZmMSLp+k/I8q@vger.kernel.org
X-Gm-Message-State: AOJu0YyItxtS6S45Qz+GHRRSOndvrxSk+o0kdOU6wJwehSGmGy9GybYn
	QJkvRoBfbuYRs/1Xb9E2pwk688ssQJCevhAplc17L3IG+JGwPOs8cAx6
X-Gm-Gg: Acq92OFxepMSDyN0FskPBPYOs/APbCyfHhjJrIVu+Abxa3waLYxvTs2+bj18pp3UIrg
	/C+xrMwKTkRO9HTZ3wCRU5aBBPhP6zbAWuBSD9S1k4yRZDrD2ibKnMGosz2am+w3rMINtvnHsVk
	RbT0KzfI5P6RTJ0QbEOGFbRmq1kFHq7E+QVXFRF51wbpzVsNtqPDtfPbVCriZMUAaRWkhlk3agD
	OHMKfzTR5jv8N79YjHKTts2XVFWh8U7Yh+IKVJIXWece3Dn54HbtYw0jFgnGsmxaKH2XV//5njv
	ko+0wCEvWsuh7p6H0vKV493W1tMxtxo+Tegowee/KXWq0eSCamGeNgHwj1GSx94ZnpNH0Jfe6Ff
	9uodd0igttzt1KcMtGcfUIK8RJTFuxLKycuqCVTtxBLpcG8HbYo+SjyB66N/ugP3ynLCmi+Svc4
	ujxyPB6YY8XWoEExJO2aTsHYTuFa7WIut7kCrqY/adbhVyC7okYgdowuT4thuXRrXtAA==
X-Received: by 2002:a05:600c:c171:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490ec4dfb03mr140851455e9.14.1781526640428;
        Mon, 15 Jun 2026 05:30:40 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:39 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH net-next v7 04/12] net: pcs: implement Firmware node support for PCS driver
Date: Mon, 15 Jun 2026 14:29:40 +0200
Message-ID: <20260615122950.22281-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the foundation of Firmware node support for PCS driver.

To support this, implement a simple Provider API where a PCS driver can
expose multiple PCS with an xlate .get function.

PCS driver will have to call fwnode_pcs_add_provider() and pass the
firmware node pointer and a xlate function to return the correct PCS for
the passed #pcs-cells.

This will register the PCS in a global list of providers so that
consumer can access it.

The consumer will then use fwnode_pcs_get() to get the actual PCS by
passing the firmware node pointer and the index for #pcs-cells.

For a simple implementation where #pcs-cells is 0 and the PCS driver
expose a single PCS, the xlate function fwnode_pcs_simple_get() is
provided.

For an advanced implementation a custom xlate function is required.

On removal the PCS driver should first delete itself from the provider
list using fwnode_pcs_del_provider() and then call phylink_release_pcs()
on every PCS the driver provides.

Generic functions fwnode_phylink_pcs_count() and fwnode_phylink_pcs_parse()
are provided for MAC driver that will declare PCS in DT (or ACPI).

Function fwnode_phylink_pcs_count() will parse "pcs-handle" property and
will return the number of PCS entries described in the passed firmware
node.

Function fwnode_phylink_pcs_parse() will parse "pcs-handle" property and
fill the passed available_pcs array with the available PCS found up to passed
num_pcs value. It's worth to mention that this function will ignore PCS
that still needs to be probed (returning -ENODEV) and such PCS won't be
added to the available_pcs array.

Co-developed-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/Kconfig          |   6 +
 drivers/net/pcs/Makefile         |   1 +
 drivers/net/pcs/pcs.c            | 208 +++++++++++++++++++++++++++++++
 include/linux/pcs/pcs-provider.h |  41 ++++++
 include/linux/pcs/pcs.h          |  75 +++++++++++
 5 files changed, 331 insertions(+)
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
index e417fd66f660..2ce89d4bff6b 100644
--- a/drivers/net/pcs/Kconfig
+++ b/drivers/net/pcs/Kconfig
@@ -5,6 +5,12 @@
 
 menu "PCS device drivers"
 
+config FWNODE_PCS
+	bool "PCS Firmware Node"
+	depends on (ACPI || OF)
+	help
+		Firmware node PCS accessors
+
 config PCS_XPCS
 	tristate "Synopsys DesignWare Ethernet XPCS"
 	select PHYLINK
diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index 4f7920618b90..3005cdd89ab7 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
+obj-$(CONFIG_FWNODE_PCS)	+= pcs.o
 pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
 				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
 
diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
new file mode 100644
index 000000000000..67f9716f48fd
--- /dev/null
+++ b/drivers/net/pcs/pcs.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/phylink.h>
+#include <linux/pcs/pcs.h>
+#include <linux/pcs/pcs-provider.h>
+
+MODULE_DESCRIPTION("PCS library");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
+
+struct fwnode_pcs_provider {
+	struct list_head link;
+
+	struct fwnode_handle *fwnode;
+	struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
+				   void *data);
+
+	void *data;
+};
+
+static LIST_HEAD(fwnode_pcs_providers);
+static DEFINE_MUTEX(fwnode_pcs_mutex);
+
+struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
+					  void *data)
+{
+	return data;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_simple_get);
+
+int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
+			    struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
+						       void *data),
+			    void *data)
+{
+	struct fwnode_pcs_provider *pp;
+
+	if (!fwnode)
+		return 0;
+
+	pp = kzalloc_obj(*pp);
+	if (!pp)
+		return -ENOMEM;
+
+	pp->fwnode = fwnode_handle_get(fwnode);
+	pp->data = data;
+	pp->get = get;
+
+	mutex_lock(&fwnode_pcs_mutex);
+	list_add(&pp->link, &fwnode_pcs_providers);
+	mutex_unlock(&fwnode_pcs_mutex);
+	pr_debug("Added pcs provider from %pfwf\n", fwnode);
+
+	fwnode_dev_initialized(fwnode, true);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
+
+void fwnode_pcs_del_provider(struct fwnode_handle *fwnode)
+{
+	struct fwnode_pcs_provider *pp;
+
+	if (!fwnode)
+		return;
+
+	mutex_lock(&fwnode_pcs_mutex);
+	list_for_each_entry(pp, &fwnode_pcs_providers, link) {
+		if (pp->fwnode == fwnode) {
+			list_del(&pp->link);
+			fwnode_dev_initialized(pp->fwnode, false);
+			fwnode_handle_put(pp->fwnode);
+			kfree(pp);
+			break;
+		}
+	}
+	mutex_unlock(&fwnode_pcs_mutex);
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_del_provider);
+
+static int fwnode_parse_pcsspec(const struct fwnode_handle *fwnode,
+				unsigned int index, const char *name,
+				struct fwnode_reference_args *out_args)
+{
+	int ret;
+
+	if (!fwnode)
+		return -EINVAL;
+
+	if (name) {
+		index = fwnode_property_match_string(fwnode, "pcs-names",
+						     name);
+		if (index < 0)
+			return index;
+	}
+
+	ret = fwnode_property_get_reference_args(fwnode, "pcs-handle",
+						 "#pcs-cells",
+						 -1, index, out_args);
+	if (ret || (name && index < 0))
+		return ret;
+
+	return 0;
+}
+
+static struct phylink_pcs *
+fwnode_pcs_get_from_pcsspec(struct fwnode_reference_args *pcsspec)
+{
+	struct fwnode_pcs_provider *provider;
+	struct phylink_pcs *pcs = ERR_PTR(-ENODEV);
+
+	if (!pcsspec)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&fwnode_pcs_mutex);
+	list_for_each_entry(provider, &fwnode_pcs_providers, link) {
+		if (provider->fwnode == pcsspec->fwnode) {
+			pcs = provider->get(pcsspec, provider->data);
+			if (!IS_ERR(pcs))
+				break;
+		}
+	}
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	return pcs;
+}
+
+static struct phylink_pcs *__fwnode_pcs_get(struct fwnode_handle *fwnode,
+					    unsigned int index, const char *con_id)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, con_id, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = fwnode_pcs_get_from_pcsspec(&pcsspec);
+	fwnode_handle_put(pcsspec.fwnode);
+
+	return pcs;
+}
+
+struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode, unsigned int index)
+{
+	return __fwnode_pcs_get(fwnode, index, NULL);
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get);
+
+unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
+{
+	struct fwnode_reference_args out_args;
+	int index = 0;
+	int ret;
+
+	while (true) {
+		ret = fwnode_property_get_reference_args(fwnode, "pcs-handle",
+							 "#pcs-cells",
+							 -1, index, &out_args);
+		/* We expect to reach an -ENOENT error while counting */
+		if (ret)
+			break;
+
+		fwnode_handle_put(out_args.fwnode);
+		index++;
+	}
+
+	return index;
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_count);
+
+int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+			     struct phylink_pcs **available_pcs,
+			     unsigned int num_pcs)
+{
+	unsigned int i, found = 0;
+
+	if (!available_pcs)
+		return -EINVAL;
+
+	if (!fwnode_property_present(fwnode, "pcs-handle"))
+		return -ENODEV;
+
+	for (i = 0; i < num_pcs; i++) {
+		struct phylink_pcs *pcs;
+
+		pcs = fwnode_pcs_get(fwnode, i);
+		if (IS_ERR(pcs)) {
+			/*
+			 * Ignore -ENODEV error for PCS that still
+			 * needs to probe.
+			 */
+			if (PTR_ERR(pcs) == -ENODEV)
+				continue;
+
+			return PTR_ERR(pcs);
+		}
+
+		available_pcs[found] = pcs;
+		found++;
+	}
+
+	return found;
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_parse);
diff --git a/include/linux/pcs/pcs-provider.h b/include/linux/pcs/pcs-provider.h
new file mode 100644
index 000000000000..ae51c108147e
--- /dev/null
+++ b/include/linux/pcs/pcs-provider.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __LINUX_PCS_PROVIDER_H
+#define __LINUX_PCS_PROVIDER_H
+
+/**
+ * fwnode_pcs_simple_get - Simple xlate function to retrieve PCS
+ * @pcsspec: reference arguments
+ * @data: Context data (assumed assigned to the single PCS)
+ *
+ * Returns: the PCS pointed by data.
+ */
+struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
+					  void *data);
+
+/**
+ * fwnode_pcs_add_provider - Registers a new PCS provider
+ * @fwnode: Firmware node
+ * @get: xlate function to retrieve the PCS
+ * @data: Context data
+ *
+ * Register and add a new PCS to the global providers list
+ * for the firmware node. A function to get the PCS from
+ * firmware node with the use fwnode reference arguments.
+ * To the get function is also passed the interface type
+ * requested for the PHY. PCS driver will use the passed
+ * interface to understand if the PCS can support it or not.
+ *
+ * Returns: 0 on success or -ENOMEM on allocation failure.
+ */
+int fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
+			    struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
+						       void *data),
+			    void *data);
+
+/**
+ * fwnode_pcs_del_provider - Removes a PCS provider
+ * @fwnode: Firmware node
+ */
+void fwnode_pcs_del_provider(struct fwnode_handle *fwnode);
+
+#endif /* __LINUX_PCS_PROVIDER_H */
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
new file mode 100644
index 000000000000..df1e6f32cfad
--- /dev/null
+++ b/include/linux/pcs/pcs.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __LINUX_PCS_H
+#define __LINUX_PCS_H
+
+#include <linux/phylink.h>
+
+#if IS_ENABLED(CONFIG_FWNODE_PCS)
+/**
+ * fwnode_pcs_get - Retrieves a PCS from a firmware node
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative
+ * error pointer. Can return -ENODEV if the PCS is not
+ * present in global providers list (either due to driver
+ * still needs to be probed or it failed to probe/removed).
+ */
+struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
+				   unsigned int index);
+
+/**
+ * fwnode_phylink_pcs_count - count PCS entries described in firmware node
+ * @fwnode: firmware node
+ *
+ * Helper function to count the number of PCS entries referenced by the
+ * "pcs-handle" property in a firmware node.
+ *
+ * Note that this function counts all PCS references in the firmware node,
+ * regardless of whether the corresponding PCS devices are already probed.
+ *
+ * Returns: number of PCS entries described in the firmware node.
+ */
+unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode);
+
+/**
+ * fwnode_phylink_pcs_parse - parse available PCS from firmware node
+ * @fwnode: firmware node
+ * @available_pcs: pointer to preallocated array of PCS
+ * @num_pcs: maximum number of PCS entries to scan
+ *
+ * Helper function that parses PCS references from the "pcs-handle"
+ * property of a firmware node and fills @available_pcs with PCS that are
+ * currently available up to @num_pcs.
+ *
+ * Only PCS that are currently available are stored in @available_pcs.
+ * PCS that returns -ENODEV are skipped.
+ *
+ * Returns: number of PCS stored in @available_pcs, or negative error code.
+ */
+int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+			     struct phylink_pcs **available_pcs,
+			     unsigned int num_pcs);
+#else
+static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
+						 int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
+static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
+{
+	return 0;
+}
+
+static inline int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+					   struct phylink_pcs **available_pcs,
+					   unsigned int num_pcs)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* __LINUX_PCS_H */
-- 
2.53.0

