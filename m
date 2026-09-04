Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919164A483A
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529590; cv=none; b=dv9zFbVkgGZNZVCkG1jjeMnmBe77jStqZawKzpfS/MFpqhMS+yKYiKXqvyIQMP9zpsehU4JYirx2ikZNfWgG9658otl3wkKWh/PS/Ol8a55LUgpkL5M2hFKaqlh+p1a5bCSjle99x/aDlE2YL/AthYclOAixmu/rX/NXVp9ZH9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529590; c=relaxed/simple;
	bh=l7HBFW2oz1K7wlz0Cw/q76k0lqFcEvUDwHaz93CkcFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ec/tx4JzrXfPvMvoPXJFrFY/0TyOBF5m+apZPGGPS7+NclvThXPp7Fd9AZxsH3R76SVCUH2b2VIboUhh2Hdz60fKP9qQjgMrJkC6p2X8hkNcbssZBCSp7GBZ/Rhm4HB3Fu2xJt9rSSg4XDH/TyhEMM4RLfKIMvCcjkYJb8zBWmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Z+px9OyB; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Z+px9OyB"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9391252b5caso66366885a.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788529587; x=1789134387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+Bw04n0AyQYjskAQ/JcmMjfV9T3RjIpfJoearHWcfU=;
        b=Z+px9OyB3Q3YxOWoirmFuGtw0afVJ5jCKhh9O/Vpn7Jo9GJ1E5p6TRkyfY6vA2/uAD
         ZbJL1XoZ5Jnmmq0KzQx1LUdt7+/a6QG3kduT5vjQ8uT6IQJXs5/pb+3D79zMrQzTY235
         EUIzd26bg64xfstUm4yaWr5zg+/Q1GxfT8VLrfYUSB057r1Rmv5kBcA1ttHllTXZUBOx
         tcH/9mLIzyW72ZOIQavXwnqJXjKkXMenuW2i8vBSLVlhWkCmyt0YX6LE6QQxK5DQvueO
         a271Fxrf/YntIY60FXWCc+8O45KRQr6HGDXa/tWrivlCDKQQMWVgeO3Vk51/Bz4h21K+
         zp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529587; x=1789134387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+Bw04n0AyQYjskAQ/JcmMjfV9T3RjIpfJoearHWcfU=;
        b=OKpltAqtNJPDJ1AMiBD8tkP/K5w9ReCLkix5DXAAY276w+lsseOOaYRGzqqJZhDk/C
         t7q/JAswOEaCocPNy8xe0+viUOUN+DpF4obJ8wjhrn8dpzkYzwJCIkG4P85+2hqfXlIU
         tEWNs6wzxK4sfZej0ue1UV0HVGCKyO3xDozXVLwlrNAjqJkuuVo2jeBqhSD50GuiXl2o
         o1IkHyIOmJZ8XQmPxCQ05X7ljkgnYBOTCgs0YpvxsXFiymVg6FJke1DnI6hP9ElM4N2t
         vg/qXIk4ogSe8E18JkVGJWEdvdBD23dTHu0i2wDuC0FQVj8cqAvwqj4NzXLLTDykVYqE
         p1cg==
X-Forwarded-Encrypted: i=1; AKwUvBw8wIsDsIHzafq5op5RIcBli+2MvyJxUQq6rOZsHHmB0LPmbfKaCCuL53Y/UpveyEzF8HFGRo4huaUy@vger.kernel.org
X-Gm-Message-State: AFuF++lH9evBP8pYTWL9ypVXu2mGIId18z45TAjx/Zge1r2hNpOWEVWy
	D6BPe5dkfxF8mKzz0v3o5NH+gelXDHr7vw5Oc+9S+BXrmgE44Lk0tmRx6jCsQp5bCzk=
X-Gm-Gg: AYBFou0peKuWMbS/otC4Rg751drX53UIQfH4lhrcFYzUFiSMTnSsokcSmcQF0xw9alS
	zKVgFcYw/W4aq412/YUVLSo3MdDV4yXWXh/tONZlRFeswqcl0Ny/vQJWXVIskq/EHy6bvRaHPnt
	ofx4BKY7UQ3DzKejvicm5U0gx7D6AdPo7JeqV86GJVUj+KAs4p8o5lRq0hc8jUD+FZZDUDNFbpK
	84ss6VfK96vGoqUU6i4jgl+5EN0isdiNr9UoEZP9NGTer8DU6zRQwBJs44ir9YCO81Hd5lclcNT
	1qzMzqp2Q4extvHQ1Ij4lmUlet7aLOAR7yWcywM5P/YXBK061Fp0oozWAiARSh6ECbHZ5WVxh97
	xz8pSbKntopl5GaNx+fjAdZpuhAeRwoNkCbjP5VxwoZ5xXWMNKGtpkfDJA2cB18PbMqEZ74vLwP
	Yp4Z9AnroGKgt2xGKiPbSL9R+XQC2ePqbui8iX7alhAc10HB1ENdxIURu/cwOyAXCe
X-Received: by 2002:a05:620a:a0c5:10b0:936:dbf1:f495 with SMTP id af79cd13be357-939802f6e18mr474878385a.1.1788529572210;
        Fri, 04 Sep 2026 06:46:12 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm211613885a.14.2026.09.04.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:11 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 1/4] PCI: of: avoid allocations in of_pci_prop_compatible()
Date: Fri,  4 Sep 2026 08:46:03 -0500
Message-ID: <20260904134607.1856121-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904134607.1856121-1-elder@riscstar.com>
References: <20260904134607.1856121-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three compatible strings are formatted in of_pci_prop_compatible().
Their sizes are known in advance, and the largest is 16 bytes.

Rather than dynamically allocating the space for those strings, just
set aside a buffer on the stack large enough to hold all three.

This avoids a problem that Sashiko pointed out, where an allocation
failure would cause subsequent crash because strlen() is called
unconditionally in of_changeset_add_prop_string_array().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/sashiko-reviews/a647bd56-7dc8-4fec-9d96-834622054cdf@riscstar.com
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Added this fix to the beginning of the series

 drivers/pci/of_property.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 75a358f73e694..a0632f932b5c6 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -324,27 +324,36 @@ static int of_pci_prop_intr_map(struct pci_dev *pdev, struct of_changeset *ocs,
 	return ret;
 }
 
+/* The three compatible property strings have max sizes 12+1, 15+1, and 13+1 */
+#define PROP_SIZE	16	/* Max size of each compatible string */
 static int of_pci_prop_compatible(struct pci_dev *pdev,
 				  struct of_changeset *ocs,
 				  struct device_node *np)
 {
 	const char *compat_strs[PROP_COMPAT_NUM] = { 0 };
+	char buf[PROP_COMPAT_NUM * PROP_SIZE] = { };
+	char bufp = buf;
 	int i, ret;
 
-	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] =
-		kasprintf(GFP_KERNEL, "pci%x,%x", pdev->vendor, pdev->device);
-	compat_strs[PROP_COMPAT_PCICLASS_CCSSPP] =
-		kasprintf(GFP_KERNEL, "pciclass,%06x", pdev->class);
-	compat_strs[PROP_COMPAT_PCICLASS_CCSS] =
-		kasprintf(GFP_KERNEL, "pciclass,%04x", pdev->class >> 8);
+	ret = snprintf(bufp, PROP_SIZE, "pci%x,%x", pdev->vendor, pdev->device);
+	if (ret >= PROP_SIZE)
+		return -EINVAL;
+	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] = bufp;
+	bufp += ret + 1;
 
-	ret = of_changeset_add_prop_string_array(ocs, np, "compatible",
-						 compat_strs, PROP_COMPAT_NUM);
-	for (i = 0; i < PROP_COMPAT_NUM; i++)
-		kfree(compat_strs[i]);
+	ret = snprintf(bufp, PROP_SIZE, "pciclass,%06x", pdev->class);
+	if (ret >= PROP_SIZE)
+		return -EINVAL;
+	compat_strs[PROP_COMPAT_PCICLASS_CCSSPP] = bufp;
+	bufp += ret + 1;
 
-	return ret;
+	ret = snprintf(bufp, PROP_SIZE, "pciclass,%04x", pdev->class >> 8);
+	compat_strs[PROP_COMPAT_PCICLASS_CCSS] = bufp;
+
+	return of_changeset_add_prop_string_array(ocs, np, "compatible",
+						  compat_strs, PROP_COMPAT_NUM);
 }
+#undef PROP_SIZE
 
 int of_pci_add_properties(struct pci_dev *pdev, struct of_changeset *ocs,
 			  struct device_node *np)
-- 
2.53.0

