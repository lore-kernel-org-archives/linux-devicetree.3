Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875E33A7582
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076626; cv=none; b=oTxUiFxlUkW32pZmjYiUxHQonr4ufnqdW7nfJyjLkPBhSl0rnMGQqbIXEHBMQYdoU0fHPZRz2grUW9kxVqjZgewopJrbsMjK6OA5Mftt8z0okBjYi8Dfji5h+HqPyId24llNhvrjSlniRx2QUgrBz9ijyu7rvh1JwKVrJBXuKGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076626; c=relaxed/simple;
	bh=M2j8dlezMX1WXhIwcvdi4oKmtviPBpBqXa5qEt6C7j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcXKMTUaViQizByFkxRXbZvcUXLY4reYotIHdseWdZIDdMM2GDbmprw1ekj1N2DpFi7o+Ruq6MpmPHWfCAPr5vFZeYso4WrHK2PKfV9S9YXORAtey1mgEckU3abjkWbCRdOkYw0VKtYV9CQeoH+D+f4NXUGZGxTd7SZA3o81TMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O0QxWfZS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O0QxWfZS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cab973140bso5196445ad.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076622; x=1783681422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E742RWSqyUpjpy+ZFSeaNRHKuAVV+n7jX1SAgxgLen0=;
        b=O0QxWfZS9j7Odr0Dnkc0OifJEs9vgFvkxZNuQfFwFFIq3tHbRrdmfXOwb4pvsLyBZA
         8eaF7zjTEsdVNaP22vcZCT7l+XZQ4o8QoQuf9KckomTHajC1mc+ReYH0L722k7Kzb6Xd
         lpoYJfaO0OFKJIl677zC2/7mJfCZeT+GWpAuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076622; x=1783681422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E742RWSqyUpjpy+ZFSeaNRHKuAVV+n7jX1SAgxgLen0=;
        b=s1NdKKPUZ7HGIjFCOz7OU/gS9YJ4ZMqc7V19BualNXM/UAEyqQJ8rRgv+1VaWceph9
         v2ehDQWDSqivczZkLwFRce5vVqP8Z4IGyRf89ENQ7SolB04zTmf/xS9h1DmOmQvQrg5x
         68zE3zoSyTiqmtPvVNdRWpakEbbMqy8MelDueMc8iKWnteg0B1Vm4HHdfVAMkiZ8uDc4
         U4ApKiaIjkumKo7iuvDRNOlix1dgkliLfeKwjxTNBjB62jCrGJYlYiWF+iN0Rq7d2tlU
         XGsacoVYFTfh861lrGeVVFuIJ5IWp3vDQrnc7jAYXEbnj77sfA6tNCr9/7jDLrL/eHM+
         iu1A==
X-Forwarded-Encrypted: i=1; AHgh+RqF+WUKLneLKOt2xelLc7FkHKjN8u7e2Nm0jZiDXLo2S8vWfte2Hr26Utg9UfZRcYWVOX02+ZBwJTlw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WWNgvNU2Xfp2sWbd3piHAA9YeCNyhnJ4rc4sdHEQR8LQEkMh
	TY2HSh2DFeyx2yFbbzKAdxHefE5/eTBdG3k5Hg1H+6o8QXfqlW7GUTDmfl5iMMgg6A==
X-Gm-Gg: AfdE7clA/7sfctXiO9CvJ+5XPnTaZFmiHW5CFZJuj0bvfpX9uipaBKXt6RjNuInJxtw
	8ryvroboFUDAG2r6mq2MYR5Rq9gGNrNhWn+T7qlsCtRS48FASuFkeV75UciF7zY+p54/mL7cpAN
	wLa2JMmG40Ygddji0eZDK3Xh2Ox2VH/YCEHcwAB7mUSDN+f1dpjfUnG3zTSFr6ylmLFzXMCDrcx
	/jIXlPWs/cMi+ND9yxZG2TX5G4bMBdeWsuwRDneX3JFwX8/ZiJ0KQEgAXM3zr9ytDHK5vv2K8RP
	IFFTrnNkVatBbU4pKplGbjNqGnFq1wHBbHuck//oacYzkWzpPbRRr9SIZi0/UC1BYvRiokSG+nT
	Vs5qQemeVwaUtpa4YD/EUZ165O4ziJzPWPWKa6ZJcSBOTwQADrwH26AuZUEnUpnt5BPREdR6fGH
	g0Qp0rlSgeV2OCxIWPsq1tQCn11TwZgK5Py6kmUy5uMN8eGfNmn1i81Kro3oimgHbTdAX/mA==
X-Received: by 2002:a17:902:da2d:b0:2c9:c13f:910a with SMTP id d9443c01a7336-2ca7e8d033amr108379995ad.45.1783076621819;
        Fri, 03 Jul 2026 04:03:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 01/13] device property: Add fwnode_graph_get_port_by_id()
Date: Fri,  3 Jul 2026 19:03:02 +0800
Message-ID: <20260703110317.1283411-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases the driver needs a reference to the port firmware node.
Once such case is the upcoming USB power sequencing integration. The
USB hub port is tied to the corresponding port firmware node if it
exists.

Provide a helper for this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 22 ++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..3e3e19ef66a9 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,28 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0, FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return NULL;
+
+	return fwnode_get_next_parent(ep);
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);
+
 const void *device_get_match_data(const struct device *dev)
 {
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db4664..e04901c0bd8f 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,7 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.rc0.799.gd6f94ed593-goog

