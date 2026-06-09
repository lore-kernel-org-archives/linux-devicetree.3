Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2229A3E9C0E
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991628; cv=none; b=XevS/616dMPl4At4sUHjfMWx7YRJQbBgTeNszmDjpqvHDddi8jtQ6D0/pgKHhzSUssa0MkLerKkJWsD0Rm/sz7NBgM6mpzt3pYkXALNFxo83T0GQxALeepMw6hW6WW5o7eJBxkj9OZ9mWL8iyEHJkOQ7daAGEflGL1vfY6fO6tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991628; c=relaxed/simple;
	bh=ZvvlPNqqkkVbksz5kyXL+Qu0qP+YhN+IDwhB95LLzt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=shj98ktFsFw4sZa94rL3+VINE3X/0T1JXzU47xIsQWVssyfTNUjJSwJTop928PFdbwUVenYmpvcbnz/t0IdgBpurT0+bm1HDnmGev8cik8RjoN+REd6rFmVqYTv5zrR+Y1wLGFMUz+t/RKMAWePca8H5+0uxmEhg/EcugqIkNK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhlzDDIK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3pA4ggM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhlzDDIK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3pA4ggM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rfaf1568430
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 07:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMh93vm3egRnMVo/u4zkORrzzjLIq42iI82oCTBPTEI=; b=nhlzDDIK49NjGM7u
	e2PSjBmJIGKIWvCfTnk67JWHJ9Y6TFJlMPNk0Y3byb1iVn2pvmbKDTq6FDQt83Y6
	wayhxnRgDSjAk7i/B+dCm5NtWo2jnu//kftijgs/cWhzgn1dks6D9+LEEnze5aHg
	9ei5fqC81hF6Uu/n9diNdARwOVyQA1l58NN0Iz5RHSBof1PEEA7EHzo7xoPjU+uo
	XQcugnRwIkMu6UG9Qsh4xlQtS5djE13aIivUnlPeV0NkkIiG0kA71k6Upk31EmsN
	yAqQIzZ1fyDJnBEaIrWmNd7TnKaL0HVCt7uBFLjUinhXrDi25J+oeP/E85YA7vkO
	2xmQjg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx45g80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:53:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517615db531so143877541cf.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991604; x=1781596404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMh93vm3egRnMVo/u4zkORrzzjLIq42iI82oCTBPTEI=;
        b=Z3pA4ggM6gcwmTFLHMVNNULCrNVnn43itHiibyniAro2nhLwp169ijXguaY5PqpSyy
         zNeRAzwHYQpj/fbHHHnEb1fF1tPyaBXJfvVGrCnuFSiniZqzGN3GvQcchWp+jk88hVn+
         SqxFJyTZH1/MyzYHzEpFTF+6DTJSluhAmmLinxdhu74tMmKQx/6AYDN2CzG3T4rEiBKN
         F21HCmW4tb8u4IOuXHQxtzmzKXI6hXez0EiPB8AZMBGg91BiLuU3V/uZ/CsLonQBYNiz
         UhmqdGTcnNKGVyTIQ79ACYRNIrAbaD4gc4z0TEocxzGAP1P5azewCR+qZ53TAR0fwlqp
         YOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991604; x=1781596404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bMh93vm3egRnMVo/u4zkORrzzjLIq42iI82oCTBPTEI=;
        b=ZEUUVsnDg1uFRUxqE2f4Q/9fA4brhGepIPYA24Q/TKC8W9FwvitrdhPcb/abJagwyy
         nb06O7OqRPNVjS9Wo/iUjPOCeKE6kV50BtQXy+1ot8E75cFM/CjSIxEM2or2W6vsSf6k
         OoGBMw+0Pb6WQx3WYImaIFbrrgWmWVs/5WJ58tL+ZKM8rkRb70ZeXv+gA3YFObeDQETt
         +VrAznoq0JfgHMJe/bnG9lvxf+EhDswguOwQg5iYkJhF9kzViW9NGgz5ipo9KLWU0WRM
         Ca4E32Xjbe768OVagCho77eY1Bwx8WL5yUWzgp3aEHqXjebu9tvRsU6gTX4PUrTTSyTd
         oLyA==
X-Forwarded-Encrypted: i=1; AFNElJ/EbcETYOpnuke5FrAUQyLm9nRgSjSThQ4v22AspGCMpXBGF7JMl55c08GMhLWcOv74N7Fi1HeQ3SXy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj2uh+0XSSTqKD2EaqX7JaK5f1sqGCZ4SQ99HalGH3+DcyyMut
	s0+SHq+cj9h3N2e27HIjLiTqcrlsygX0LZ3yi59Mhd4avHJHotGu4E0gsF1lCGbRoGqrJZyxKfE
	Md7kd7zdd808REhbp2KQ55LAGAJpTI04+4/9rYbvkldauEJnzpQb467mxkxHq4zZI
X-Gm-Gg: Acq92OGmy2j6xwapdX7cQgF4QWV7ObjpXb8m2+9nmx5pWLNinmlTxdetXDt32XcrT3j
	Zc7cgHoXnS8FqR5rPZuuQ93SUwURVFYpMeoHA3hXsC9r9UX2rzy5rspjCYXQhTJSgAO/lFNrQE1
	ppdOV7Z5TjdrhrOD4YY0FWlUgp2GY8iwdaH5LiV4rX6Vco9YxKvqpJM1JP/XSbk4FRUINBFno5G
	xQT1Z61WDJQCN2YFexqGwl1+UJ5JxHk1U3gnGMkL2HP4c/3k1QDVJWD6CfiaYBjNpyryQ+EdOYa
	6mggnjZJUX7Rd+uVDwCooHnHPO28RMsnEbu6jcnd/wrc2feGyUqHjXZv6BRyB/Dx7lyUpjFEIgz
	TFWLmsoyPHT4e7vQpvEKuPqF47vCniAd+BpgXVYeduFB40nEO8HQND0ePgSdE5jrLbtIGNTpecj
	MUT84tTHAI6QFmsJKU8t1GVl5hZTIiMDvKv3ekS80LzunohjtlintZ/Mwd8piSSW7NWmZnKu/a+
	zrDim2F3dTD
X-Received: by 2002:a05:622a:2b49:b0:517:8c0b:66cc with SMTP id d75a77b69052e-51795be3940mr295717931cf.25.1780991604156;
        Tue, 09 Jun 2026 00:53:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2b49:b0:517:8c0b:66cc with SMTP id d75a77b69052e-51795be3940mr295717581cf.25.1780991603748;
        Tue, 09 Jun 2026 00:53:23 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:29 +0200
Subject: [PATCH v4 4/8] block: implement NVMEM provider
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-4-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27c68a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VT4XjZGOAAAA:8
 a=EUspDBNiAAAA:8 a=0xOXAJtWE3glxeOP_3AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: vF3EctmPdN0k_c1gxaCg0GzoU-wEUkqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NCBTYWx0ZWRfX9rXm72+xUhKP
 w9cmp84r9BgY6zTTJdPWz2XvdCDAMp+c67Q6zROsSjEbDSfNXigfpwx5eRIY5/brRwk/JKjIDUS
 s45LdPiW71GWHWaCVL0NBmPzQGY1zzsl4JMIOqBJZhtN/XFjUSFbtNokUMI5yJaSuGKJKK52vH1
 DV2oCUuzmrOvtIxNkRqi8badFhp+/UMRJzDNi0m5xlHk/2enH/sgprkTmsbDruNuSbzm6fqZz9H
 Yh+YGV+4c6utuQtgRABhyx459xp9vdRnb3FNRCOt2kDMeLGGAkXIjLz5XoZSXh1TpM4DRbYr/ki
 0niHcY8zaR5AHfiNKFAkyj8tngsVRTjfFjEd8LeCNTj2crnbC9QgBgMwRlblvmwqs+GMyQ8XIJR
 3DCewky+8kQRD24MohPfvTkhS86biw==
X-Proofpoint-GUID: vF3EctmPdN0k_c1gxaCg0GzoU-wEUkqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090074

From: Daniel Golle <daniel@makrotopia.org>

On embedded devices using an eMMC it is common that one or more partitions
on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
data. Allow referencing the partition in device tree for the kernel and
Wi-Fi drivers accessing it via the NVMEM layer.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/Kconfig     |   9 +++++
 block/Makefile    |   1 +
 block/blk-nvmem.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 124 insertions(+)

diff --git a/block/Kconfig b/block/Kconfig
index 15027963472d7b40e27b9097a5993c457b5b3054..0b33747e16dc33473683706f75c92bdf8b648f7c 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -209,6 +209,15 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
 	  by falling back to the kernel crypto API when inline
 	  encryption hardware is not present.
 
+config BLK_NVMEM
+	bool "Block device NVMEM provider"
+	depends on OF
+	depends on NVMEM
+	help
+	  Allow block devices (or partitions) to act as NVMEM providers,
+	  typically used with eMMC to store MAC addresses or Wi-Fi
+	  calibration data on embedded devices.
+
 source "block/partitions/Kconfig"
 
 config BLK_PM
diff --git a/block/Makefile b/block/Makefile
index 7dce2e44276c4274c11a0a61121c83d9c43d6e0c..d7ac389e71902bc091a8800ea266190a43b3e63d 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -36,3 +36,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
 					   blk-crypto-sysfs.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
 obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)	+= holder.o
+obj-$(CONFIG_BLK_NVMEM)                += blk-nvmem.o
diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
new file mode 100644
index 0000000000000000000000000000000000000000..a6e62fa98675ee9bcb9c7035a611b5a573ab9091
--- /dev/null
+++ b/block/blk-nvmem.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * block device NVMEM provider
+ *
+ * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Useful on devices using a partition on an eMMC for MAC addresses or
+ * Wi-Fi calibration EEPROM data.
+ */
+
+#include <linux/file.h>
+#include <linux/nvmem-provider.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/pagemap.h>
+#include <linux/property.h>
+
+#include "blk.h"
+
+static int blk_nvmem_reg_read(void *priv, unsigned int from,
+			      void *val, size_t bytes)
+{
+	blk_mode_t mode = BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
+	dev_t devt = (dev_t)(uintptr_t)priv;
+	size_t bytes_left = bytes;
+	loff_t pos = from;
+	int ret = 0;
+
+	struct file *bdev_file __free(fput) = bdev_file_open_by_dev(devt, mode, priv, NULL);
+	if (IS_ERR(bdev_file))
+		return PTR_ERR(bdev_file);
+
+	while (bytes_left) {
+		pgoff_t f_index = pos >> PAGE_SHIFT;
+		struct folio *folio;
+		size_t folio_off;
+		size_t to_read;
+
+		folio = read_mapping_folio(bdev_file->f_mapping, f_index, NULL);
+		if (IS_ERR(folio)) {
+			ret = PTR_ERR(folio);
+			break;
+		}
+
+		folio_off = offset_in_folio(folio, pos);
+		to_read = min(bytes_left, folio_size(folio) - folio_off);
+		memcpy_from_folio(val, folio, folio_off, to_read);
+		pos += to_read;
+		bytes_left -= to_read;
+		val += to_read;
+		folio_put(folio);
+	}
+
+	return ret;
+}
+
+static int blk_nvmem_register(struct device *dev)
+{
+	struct block_device *bdev = dev_to_bdev(dev);
+	struct nvmem_config config = {};
+
+	/* skip devices which do not have a device tree node */
+	if (!dev_of_node(dev))
+		return 0;
+
+	/* skip devices without an nvmem layout defined */
+	struct device_node *child __free(device_node) =
+		of_get_child_by_name(dev_of_node(dev), "nvmem-layout");
+	if (!child)
+		return 0;
+
+	/*
+	 * skip block device too large to be represented as NVMEM devices,
+	 * the NVMEM reg_read callback uses an unsigned int offset
+	 */
+	if (bdev_nr_bytes(bdev) > UINT_MAX) {
+		dev_warn(dev, "block device too large to be an NVMEM provider\n");
+		return -ENODEV;
+	}
+
+	config.id = NVMEM_DEVID_NONE;
+	config.dev = dev;
+	config.name = dev_name(dev);
+	config.owner = THIS_MODULE;
+	config.priv = (void *)(uintptr_t)dev->devt;
+	config.reg_read = blk_nvmem_reg_read;
+	config.size = bdev_nr_bytes(bdev);
+	config.word_size = 1;
+	config.stride = 1;
+	config.read_only = true;
+	config.root_only = true;
+	config.ignore_wp = true;
+	config.of_node = to_of_node(dev->fwnode);
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
+}
+
+static struct class_interface blk_nvmem_bus_interface __refdata = {
+	.class = &block_class,
+	.add_dev = &blk_nvmem_register,
+};
+
+static int __init blk_nvmem_init(void)
+{
+	int ret;
+
+	ret = class_interface_register(&blk_nvmem_bus_interface);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+device_initcall(blk_nvmem_init);

-- 
2.34.1

