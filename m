Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460365;
	b=f/ipdfHTHSbYIhZ8xiHAy132RYU0nGvVtU8q+zfVO0GKLfW0ZFirCyIJIpOlFYk8H5nV
	 Q3gl6sLc46N2LoK1h47A6PdcU/sPbyC2dMe3WwKxin0Crxbor7lOOkKqBvo8gnZJN8Uh4
	 PNyQBs67EG6dsdrNPYQJIcpIUmpurHd/4z9yxzGVfHD2Jf5UHUWsVvsiKogMcaenR2x9P
	 lpW6GF+a81EtK3GnnTANXIPv/PXviLmNQ2p5JLrzmhmGacs6n2lAcqsBibbxZqUlvMrNc
	 mWdH3f9e/fW6Rx9eWisMEoF3nO/9/WlvIcT36K9TKRSoaS/FoUW15YUwPBB0DANDFmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460365;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9rM4GZXOgC1yOcev7Pd1LAp+V/n4emj7sYZ2cQwywT8=;
	b=5fAC82Jsw+1fbCIFjvZYM2DMYPQlNaIjeg+FQL7ZUdbChvDSsqo/N7o2d+m6U7CHB7NI
	 vwYHmuLFYxlNaeFtmPFshuDvg2XIlXfpeX/A2Jr4sBva+H+hZ6oozHFIZ55JstKXEMkdO
	 nuyzlMS+SBtPa1shPptPwMRhr1UkJ0xEHd0g05CaBfmi6PQ0S0Xg6RUwi+BvUtsXSIINq
	 bBqY3KOPnGLBmkcLltorwom4AwL9qQWC6EXorryOFOJWjIaYlhHqvXzA1YjdbfjPfbcBl
	 lBSgUwOiPLsIKcAFSRNW5UdqRnKeGBEWFxu1Y9Ng+ypepJvxrJbrdtqjy/ZynLEz1OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WK1u4VMH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E4F606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WK1u4VMH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9E21F000D8;
	Mon, 23 Nov 2026 18:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460365;
	bh=9rM4GZXOgC1yOcev7Pd1LAp+V/n4emj7sYZ2cQwywT8=;
	h=From:Date:Subject:To:Cc;
	b=WK1u4VMH5LV8L8chBV5+ffc8VB9P9g9z4gqw9rAD1xbOz8ybGqJcZTquGYxWCvp8o
	 P07VkVSIyF0y4Wge+ZqNVVRhpCQoZV/r9Srr/jARvcpKzTlgZDJLoZe+jDpWweC/Zl
	 W0zV/QjjKa/rafUAo0H7F0uNPzpqNNkcXkL4lKO15nw1z0HvWV7jTY7a2FgBrOEW4n
	 c3y1GEWu+8E3rtgXjpp8n31VLByiYQuo9F7aUuyJPDSDSB0SI7wlzYOsqU4f1r2dsH
	 HDX/HVw986oiZmXRkx+RZH5vFnFrFq6Lg9Ai2K6TXk2Obl+Hsf0rzTO7ltxHTuRFfd
	 cqZ0i+Xm7Vw7g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 23 Nov 2026 19:59:16 +0100
Subject: [PATCH v3] of: property: Create devlink between PCI Host bridge
 and Root Port supplies
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
Message-Id: <20261123-topic-pcie_hb_rp_link-v3-1-f90191217c74@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5FMBBA0V+RWWvS1ouIXxFpGINBqmkRifj3V
 yzP4t4LAnmmAGVygaeDA682IksTwLGxAwnuokFLnSulM7GtjlE4ZDJja7wzC9tZoCx+lEvVdNh
 DbJ2nns/3W9Wfw95OhNszg/v+A8+kcoh5AAAA
X-Change-ID: 20261123-topic-pcie_hb_rp_link-c084e601adcf
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795460362; l=4589;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=eaqhIPZmDT+AqMVjs4K8JRsEVbvlM8yNAdZ7+oa/IuQ=;
 b=VYGCAt6lxrvnKpOTKrR7bEFMswV6WJapE1gJ0ZYw6xShGOSOU6RymPA6lnnCKhlHGIrhFgLn1
 SoAj2Ti+0ZzALsvvUbzxv60lKFkgfWTLfMDL9V6fCP9AV4+LiXF2Toq
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Recently, devicetree started to represent the PCI Host bridge supplies like
PHY in the Root Port nodes as seen in commit 38fcbfbd4207
("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
the Host bridge drivers still control the Root Port supplies as a part of
their controller initialization/deinitialization sequence.

So the Host bridge drivers end up parsing the Root Port supplies in their
probe() and control them. A downside to this approach is that the devlink
dependency between the suppliers and Host bridge is completely broken. Due
to this, the driver core probes the Host bridge drivers even if the
supplies are not ready, causing probe deferrals and setup teardowns in
Host bridge probe().

These probe deferrals sometime happen over 1000 times (as reported in Qcom
Glymur platform) leading to a waste of CPU resources and increase in boot
time. So to fix these unnecessary deferrals, create devlink between the
Host bridge and Root Port supplies in of_fwnode_add_links(). This will
allow the driver core to probe the Host bridge drivers only when all Root
Port supplies are available.

Reported-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Resubmit as-is (bump the version as I added my sob at the end since
  the submitter is different) - there was no activity and no response
  to a bump for quite a while, but this patch is still useful.
  I dropped the tags I left at v2, as it would look a bit silly.

Link to v2: https://lore.kernel.org/linux-arm-msm/20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/of/property.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 45e55f618488..51db25cbcd4e 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1601,6 +1601,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 /**
  * of_link_property - Create device links to suppliers listed in a property
  * @con_np: The consumer device tree node which contains the property
+ * @parent_np: Optional parent device tree node requiring child's supplies
  * @prop_name: Name of property to be parsed
  *
  * This function checks if the property @prop_name that is present in the
@@ -1617,7 +1618,8 @@ static const struct supplier_bindings of_supplier_bindings[] = {
  * device tree nodes even when attempts to create a link to one or more
  * suppliers fail.
  */
-static int of_link_property(struct device_node *con_np, const char *prop_name)
+static int of_link_property(struct device_node *con_np, struct device_node *parent_np,
+			    const char *prop_name)
 {
 	struct device_node *phandle;
 	const struct supplier_bindings *s = of_supplier_bindings;
@@ -1638,6 +1640,10 @@ static int of_link_property(struct device_node *con_np, const char *prop_name)
 			matched = true;
 			i++;
 			of_link_to_phandle(con_dev_np, phandle, s->fwlink_flags);
+
+			/* Link the child's supplies to parent if needed */
+			if (parent_np)
+				of_link_to_phandle(parent_np, phandle, s->fwlink_flags);
 			of_node_put(phandle);
 		}
 		s++;
@@ -1696,7 +1702,26 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 		return -EINVAL;
 
 	for_each_property_of_node(con_np, p)
-		of_link_property(con_np, p->name);
+		of_link_property(con_np, NULL, p->name);
+
+	/*
+	 * Since the host bridge drivers parse and control the Root Port
+	 * supplies, create a devlink between host bridge and Root Port
+	 * supplies. This will prevent the host bridge drivers from being
+	 * probed before the supplies become available.
+	 *
+	 * For checking the host bridge node, first ensure that it is a PCI node
+	 * and its parent is not a PCI node. Only host bridge nodes will have
+	 * this structure.
+	 */
+	if (of_node_is_type(con_np, "pci") && !of_node_is_type(con_np->parent, "pci")) {
+		for_each_available_child_of_node_scoped(con_np, child) {
+			if (of_node_is_type(child, "pci")) {
+				for_each_property_of_node(child, p)
+					of_link_property(child, con_np, p->name);
+			}
+		}
+	}
 
 	return 0;
 }

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261123-topic-pcie_hb_rp_link-c084e601adcf

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

