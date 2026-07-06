Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D3D309EE2;
	Mon,  6 Jul 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345525; cv=none; b=sOg5k0+GaSsi1JC412s6GDx9qiBCrDvdzhPi6iGiLM7stbO4sCTeajESc4jFIi2dwUsJwPE5yYrXp0lqtnmhG/BxMblecpWa8L0KuU/0OgQNXF65J1N6aP+nIz82dukSjRKIu0bPiyBOzh68DaPoBsPGQ1pb6bYdnDNpU8PKNj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345525; c=relaxed/simple;
	bh=6gkXQMH+/eYsyYxQKGNXQtav7+eIM6KQT7OHu8bpPUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKZqPRfYKZ6Q6jIBg2drzqh39VqkdTR9aCvCoJwfm/or2yyoK8z8zhFfnzQkHdEal7R+bIlEMgejh5a8S3P31/JC1brkB51581Elya1bVzrmmSI0CwognrvhfjgfI7gzWlj5Eu4Hg6rQWTfJEncC5tEuHVZ8Emvt/bNhoOx4Clk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=r223KV2b; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="r223KV2b"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 895182BCB;
	Mon,  6 Jul 2026 06:45:16 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C4783F7B4;
	Mon,  6 Jul 2026 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783345520; bh=6gkXQMH+/eYsyYxQKGNXQtav7+eIM6KQT7OHu8bpPUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r223KV2bRh5guJF09ZO4Lo9dZJRqLg6eEx4KvF6j75qFPdoStXW805XILlBvFYomB
	 GL5u4zg9ajbdHec0Y4GXjfHZoRAHjzsMnSUEvt+GIdH5WynHTrZfXIOTReFlH9aRTu
	 wHyJjdv9RAvhMbXt9L6rYB4pMvETiRoppJFPW9cc=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 5/8] firmware: smccc: lfa: Add auto_activate sysfs file
Date: Mon,  6 Jul 2026 15:44:45 +0200
Message-ID: <20260706134455.132091-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-1-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Arm LFA spec places control over the actual activation process in
the hands of the non-secure host OS. An platform initiated interrupt or
notification signals the availability of an updateable firmware image,
but does not necessarily need to trigger it automatically.

Add a sysfs control file that guards such automatic activation. If an
administrator wants to allow automatic platform initiated updates, they
can activate that by echoing a "1" into the auto_activate file in the
respective sysfs directory. Any incoming notification would then result
in the activation triggered.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 34 ++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 5b7f9b07f6c8..ce4f966db475 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -89,6 +89,7 @@ enum image_attr_names {
 	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
 	LFA_ATTR_ACTIVATE,
 	LFA_ATTR_CANCEL,
+	LFA_ATTR_AUTO_ACTIVATE,
 	LFA_ATTR_NR_IMAGES
 };
 
@@ -103,6 +104,7 @@ struct fw_image {
 	bool may_reset_cpu;
 	bool cpu_rendezvous;
 	bool cpu_rendezvous_forced;
+	bool auto_activate;
 	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
 };
 
@@ -550,6 +552,28 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return count;
 }
 
+static ssize_t auto_activate_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+	int ret;
+
+	ret = kstrtobool(buf, &image->auto_activate);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t auto_activate_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+
+	return sysfs_emit(buf, "%d\n", image->auto_activate);
+}
+
 static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_NAME]			= __ATTR_RO(name),
 	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
@@ -560,7 +584,8 @@ static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
 	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
 	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
-	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
+	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel),
+	[LFA_ATTR_AUTO_ACTIVATE]	= __ATTR_RW(auto_activate),
 };
 
 static void init_image_default_attrs(void)
@@ -631,6 +656,7 @@ static int update_fw_image_node(char *fw_uuid, int seq_id,
 	image->kobj.kset = lfa_kset;
 	image->image_name = image_name;
 	image->cpu_rendezvous_forced = true;
+	image->auto_activate = false;
 	set_image_flags(image, seq_id, image_flags, reg_current_ver,
 			reg_pending_ver);
 	if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,
@@ -700,7 +726,8 @@ static int update_fw_images_tree(void)
 
 /*
  * Go through all FW images in a loop and trigger activation
- * of all activatible and pending images.
+ * of all activatible and pending images, but only if automatic
+ * activation for that image is allowed.
  * We have to restart enumeration after every triggered activation,
  * since the firmware images might have changed during the activation.
  */
@@ -719,7 +746,8 @@ static int activate_pending_image(void)
 			continue; /* Invalid FW component */
 
 		update_fw_image_pending(image);
-		if (image->activation_capable && image->activation_pending) {
+		if (image->activation_capable && image->activation_pending &&
+		    image->auto_activate) {
 			found_pending = true;
 			break;
 		}
-- 
2.43.0

