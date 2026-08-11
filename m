Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1746430309
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455413; cv=none; b=kiZ/LxY0jTQfQ6v3aKiEyoSXKwJEx33/PAkGMkNW01NVA/xfoSRZxgBO3lDsblfB0By9XArEo7LaBczQLmk0bhm3xQugqTyFHEdm6fyC/8HorbubD6ojIEiO2pNGNcIA9StcOgDcSfj49GD5rB88Ryutq0FkBFGdiLuRn+fd6M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455413; c=relaxed/simple;
	bh=9GwUwcDp0cWDqPeRNSC1o7QWenpp9qsp8edoOzPBWBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSwTCllH1R0Xucf9AEMjZ+Hhtl3yQa9OYsqvPFNVhH+oqFiUhcvgAmKPT+rpprxpUNIWqIwlI8P+tig79d3vTTq6/NCOAUrOe7TK11UFEQKe2HL/1Tkos3mB8QivD6knC35dMZ9fg7+oUI59Pyt46tcNSbG8OUEuwc4+g503oAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yvro932y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsEs2xqB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yvro932y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsEs2xqB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWj4h3718152
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oUCwiqYDeDo3DpzREtnih6+/Yo4qtRWcBfYiTDr4db8=; b=Yvro932yHqkvMT1m
	3+gCaZ2H59ADt3GeMp951oEZozTD//PaugBhwBC5YHps+vot4dybaDHKPB7y78B2
	mIdif1PvSvf+WhdXlCXrBX3pQdjGwporE+eYCBwpCTMg4rhK/XvcKD0QBTyYM7I3
	X1JhrLeCQjeRYwdC/oe4MFajOFLW86RDgGWKwQuIf4O2TkSiThJI80374k4t14GH
	Hy/JEzyEk6wGjL2EZB3ZIl8azAKw+53oZSRC8Spa0t4/msi7jFaAP83T2kr7c/YP
	74D15u1vAHGPkQ7vs2Qs8wMgTy21OkBER/mlD9PVhZGZrP78g/RhgGtrWHuW353b
	YCskTg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwesfj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:36:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so766463a12.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455398; x=1787060198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUCwiqYDeDo3DpzREtnih6+/Yo4qtRWcBfYiTDr4db8=;
        b=HsEs2xqBy/uapDzcUHnMQw8znhurxxHc2TujBuxaaYXhBCMfwI+bsmpnckJqWrWE9g
         VVXpHuVw1ffLYTt48ctXiCqrsbJyKhcQ6AOYJzrvyUUf2Gy5sC3D0DRSOkSn/LG2ycdZ
         UM1zmu+AwmunzeDNoq16gcjvAZ0pxsfxKmWCpd2j8p4oeYEuYDAwcScOABZVaLMQ5a90
         3mcEHZx4neChh1JFlAfIYzkMVtGQFwNOuFihoc7vq8WTOhGA/zOaxBosuBIBm+iJKfeQ
         p8xkqtU/94aXaaxqDh9q0J0URkWvIgUQvK3iCjvmLeZHoIpOSziz1ifl0HwqBRCsU7/O
         LeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455398; x=1787060198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUCwiqYDeDo3DpzREtnih6+/Yo4qtRWcBfYiTDr4db8=;
        b=LwhibfJVyheyQMxxTTtpGUpGN3mKJ3JHEMXmDzlJRr0ArF8vREGqjEgbMNnL5MOpyc
         0aAjsGkhxWTz2+q9MHj4eX+zptnplrqxuIAaPbfIrEodnboEC5owEJBicuLSz5kDcKEr
         KXXxcGBT25321DuvYETJBS8hld27j2fP4nG6fXWIWeJQ4qp8H+2hKZIoGN6Z0pWBMV9Z
         NFKWDa7I3CEYeDx9hnVrj11fYCxSWB8T52EUS9Ax6wiu4h9DMRaz2lfVgOo7Kld3VXS6
         6bZ9yn0cMDFbTNY6sfpZIzx1EjHHLcLtDAxfeI86A0QTuNz4NDHu8nrlD26VbZPZliAD
         q5kQ==
X-Forwarded-Encrypted: i=1; AHgh+RomoeiVeOdcgOsYzo3mSxvCQWTC/uwPkmlVdAcqsISgfF/FPrhDm9HsR+N87qsU9Dy4gUQB9Cq8JU3n@vger.kernel.org
X-Gm-Message-State: AOJu0YwlnHfTVw98GJm5hnCvkCPFEDFxkuWmjpVJ6IRH03SzvAh+Jeyd
	4U7edSOvdSCtp4AvtTfyZgXR0LpQQrh+SHLOT2Mois3nXE+tkd3FVjAR14Fyc0vEkjZSbxml+Zn
	mC9NzoKNXgPyhVxAWE7FoX5L4yw5mBIlK4cizS3yQqjUjYUXIEJLbVySwZ+9NZRxoA9VMNEUX
X-Gm-Gg: AR+sD10Mgqn0leJFVcr/K6J9ObmbUejFk4++eqiEzoF2/EXT9tpTfAqg8dMYiNJAMzf
	7t3J7X5uVGkMriwdRoK4EwF9tVRjK0qsOpvHNxuIkCeUlj5qci1Clz35cBXXyygKmYbqhys/JZ2
	u03JqkayFF6D7z+jFdvzZ5f2F2TwOJHJp6lz9XARv/8V8fdeDjhEwulZgfoqYZeh8+k0+7mhg+1
	8Ok7x2KJt1dO+Au5Itv9xLwpT5KkB7NEIs7Hc23dSMy2HFFp96QsMKNx7bUgEsX9sAXMqFf2Hua
	8G4BCgE4D4/BripEGSkLmAZ0G3gFy5ElYwb3Kv2FExB1hea+xyYc8I3xCgVqt61b8r6AB02hf3z
	CMB5m61oSxoah8wnvcnENkrHjwGpPYtEeb1G3g44w5BRG4NnEw4oURE8v
X-Received: by 2002:a17:903:1b50:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d32da4e721mr2351245ad.9.1786455398004;
        Tue, 11 Aug 2026 06:36:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b50:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d32da4e721mr2350165ad.9.1786455397461;
        Tue, 11 Aug 2026 06:36:37 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:36:37 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:32 +0800
Subject: [PATCH RFC 03/15] arm_mpam: Add device tree support for MSC
 probing
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-3-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455319; l=10154;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=AIVi958hb81+X2XXSx6u7qKrjD/Y0gF/f2A4aVpO1ek=;
 b=ORemnfVeCvtL4ULCuUmX6ypKtKVB807gbq6pY1leXIdClYwxfOjqVHk7u7/pCuRso8hPJfwlk
 i20w8+SYdoNDwXxKa6eLAsOAsiWDPtxv6Tw4VRw731kXCjZxhmF5nfl
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: M5pxP7eZTH7szPbqIZNjqXApX45C-5Y0
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b2567 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=EV56-oaTeUzE4PAi_sMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: M5pxP7eZTH7szPbqIZNjqXApX45C-5Y0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX79xA7i47MljM
 TVDjm46hJk+MjICOhXN1vwhwOvZq+xdw0orpJlpJnKJ+L3TkHar4pDw/eJ8nUG+CAHhHsW1anT8
 w91h7sJyjeQAGNgpvCmlJ6qYtS6gls0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX9n6rc0VO7chY
 8f77DFF5rvnDqCxYnjCDawNFA+Fqex1BBPtwFuFhCSRPn4McNRo4HNHUtTtOOOqCN2XLIeCHRTE
 HqWE9chaw6S/SfbqQ/WiN9xsgNI9n27bAhqg7z9S84z31tOxTk3O51HSlaun1nu8JuywFFaUMAw
 MQWZkbhcwhaf348H/DIxpo0HYYVQYGmWpmVhX8mrRXF+/bgnZwZSyEgkMJnMqu9oGCJR+UicLv6
 2CYhxSL5oGjKp3CzrLSwwOAbfbA5dX/RGj4XuvPlWRYagdhdsE3bb77xhH21+K87P4X48vQh1fP
 SMPEBoJzrpPRJ/5lcB4T325WJSr8oiG7Q45s/wZNIiQc+nvv1XdjpjrKh9cefPPqH4RxVBiV9ud
 srOypTDMHwWv5MAS1PZaDqDWepmOUlxBnkJSz8KX+g2GCPJlESFo8wb13BzUNuHPUROGMXAUu1S
 ilUnSmdhqmREASiTrcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

From: James Morse <james.morse@arm.com>

The MPAM driver currently discovers MSCs only via ACPI. Add a device
tree path so MSCs can be probed on DT-based platforms: parse MSC nodes
from the device tree, compute cache-id and affinity from the cache
nodes and create the RIS entries.

Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context conflicts; drop the existing ACPI-only stub of
  mpam_get_cpumask_from_cache_id() which conflicted with the new
  implementation that supports both ACPI and DT; fix
  update_msc_accessibility() return type conflict: drop the existing
  void implementation and apply the int version from this patch ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 256 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 238 insertions(+), 18 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..6f2854fe08ca 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -20,6 +20,9 @@
 #include <linux/list.h>
 #include <linux/lockdep.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/srcu.h>
@@ -161,6 +164,163 @@ static void mpam_free_garbage(void)
 	}
 }
 
+/* Called recursively to walk the list of caches from a particular CPU */
+static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_node,
+					     unsigned long cache_id,
+					     u32 cache_level,
+					     cpumask_t *affinity)
+{
+	int err;
+	u32 iter_level;
+	unsigned long iter_cache_id;
+	struct device_node *iter_node __free(device_node) = of_find_next_cache_node(cache_node);
+
+	if (!iter_node)
+		return;
+
+	err = of_property_read_u32(iter_node, "cache-level", &iter_level);
+	if (err)
+		return;
+
+	/*
+	 * get_cpu_cacheinfo_id() isn't ready until sometime
+	 * during device_initcall(). Use cache_of_calculate_id().
+	 */
+	iter_cache_id = cache_of_calculate_id(iter_node);
+	if (iter_cache_id == ~0UL)
+		return;
+
+	if (iter_level == cache_level && iter_cache_id == cache_id)
+		cpumask_set_cpu(cpu, affinity);
+
+	if (iter_level < cache_level)
+		__mpam_get_cpumask_from_cache_id(cpu, iter_node, cache_id,
+						 cache_level, affinity);
+}
+
+/*
+ * The cacheinfo structures are only populated when CPUs are online.
+ * This helper walks the device tree to include offline CPUs too.
+ */
+int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
+				   cpumask_t *affinity)
+{
+	int cpu;
+
+	if (!acpi_disabled)
+		return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node __free(device_node) = of_get_cpu_node(cpu, NULL);
+		if (!cpu_node) {
+			pr_err("Failed to find cpu%d device node\n", cpu);
+			return -ENOENT;
+		}
+
+		__mpam_get_cpumask_from_cache_id(cpu, cpu_node, cache_id,
+						 cache_level, affinity);
+	}
+
+	return 0;
+}
+
+static int get_cpumask_from_cache(struct device_node *cache,
+				  cpumask_t *affinity)
+{
+	int err;
+	u32 cache_level;
+	unsigned long cache_id;
+
+	err = of_property_read_u32(cache, "cache-level", &cache_level);
+	if (err) {
+		pr_err("Failed to read cache-level from cache node\n");
+		return -ENOENT;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0UL) {
+		pr_err("Failed to calculate cache-id from cache node\n");
+		return -ENOENT;
+	}
+
+	return mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
+}
+
+static int mpam_dt_count_msc(void)
+{
+	int count = 0;
+	struct device_node *np;
+
+	for_each_compatible_node(np, NULL, "arm,mpam-msc") {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
+static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
+				  u32 ris_idx)
+{
+	int err = 0;
+	u32 level = 0;
+	unsigned long cache_id;
+	struct device *dev = &msc->pdev->dev;
+	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *parent __free(device_node) = of_get_parent(np);
+
+	if (of_device_is_compatible(np, "arm,mpam-cache")) {
+		cache = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!cache) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+	} else if (of_device_is_compatible(parent, "cache")) {
+		cache = parent;
+	} else {
+		/* For now, only caches are supported */
+		cache = NULL;
+		return err;
+	}
+
+	err = of_property_read_u32(cache, "cache-level", &level);
+	if (err) {
+		dev_err_once(dev, "Failed to read cache-level\n");
+		return err;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0) {
+		dev_err_once(dev, "Failed to calculate cache-id\n");
+		return -ENOENT;
+	}
+
+	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+}
+
+static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
+{
+	u64 ris_idx = 0;
+	int err, num_ris = 0;
+	struct device_node *np;
+
+	np = msc->pdev->dev.of_node;
+	for_each_available_child_of_node_scoped(np, iter) {
+		err = of_property_read_reg(iter, 0, &ris_idx, NULL);
+		if (!err) {
+			num_ris++;
+			err = mpam_dt_parse_resource(msc, iter, ris_idx);
+			if (err)
+				return err;
+		}
+	}
+
+	if (!num_ris)
+		err = mpam_dt_parse_resource(msc, np, 0);
+
+	return err;
+}
+
 /*
  * Once mpam is enabled, new requestors cannot further reduce the available
  * partid. Assert that the size is fixed, and new requestors will be turned
@@ -481,16 +641,6 @@ mpam_vmsc_find(struct mpam_component *comp, struct mpam_msc *msc)
 	return mpam_vmsc_alloc(comp, msc);
 }
 
-/*
- * The cacheinfo structures are only populated when CPUs are online.
- * This helper walks the acpi tables to include offline CPUs too.
- */
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
-				   cpumask_t *affinity)
-{
-	return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
-}
-
 /*
  * cpumask_of_node() only knows about online CPUs. This can't tell us whether
  * a class is represented on all possible CPUs.
@@ -1985,17 +2135,42 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  * corresponding cache may also be powered off. By making accesses from
  * one of those CPUs, we ensure we don't access a cache that's powered off.
  */
-static void update_msc_accessibility(struct mpam_msc *msc)
+static int update_msc_accessibility(struct mpam_msc *msc)
 {
+	struct device *dev = &msc->pdev->dev;
+	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
-	err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
-				       &affinity_id);
-	if (err)
+	if (!acpi_disabled) {
+		err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
+					       &affinity_id);
+		if (err)
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
+		else
+			acpi_pptt_get_cpus_from_container(affinity_id,
+							  &msc->accessibility);
+
+		return 0;
+	}
+
+	/* Where an MSC can be accessed from depends on the path to of_node. */
+	parent = of_get_parent(msc->pdev->dev.of_node);
+	if (parent == of_root) {
 		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-	else
-		acpi_pptt_get_cpus_from_container(affinity_id, &msc->accessibility);
+		err = 0;
+	} else {
+		if (of_device_is_compatible(parent, "cache")) {
+			err = get_cpumask_from_cache(parent,
+						     &msc->accessibility);
+		} else {
+			err = -EINVAL;
+			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
+		}
+	}
+	of_node_put(parent);
+
+	return err;
 }
 
 /*
@@ -2123,7 +2298,10 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 		return PTR_ERR(msc);
 
 	/* Create RIS entries described by firmware */
-	err = acpi_mpam_parse_resources(msc, plat_data);
+	if (!acpi_disabled)
+		err = acpi_mpam_parse_resources(msc, plat_data);
+	else
+		err = mpam_dt_parse_resources(msc, plat_data);
 	if (err) {
 		mpam_msc_drv_remove(pdev);
 		return err;
@@ -2136,15 +2314,51 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id mpam_of_match[] = {
+	{ .compatible = "arm,mpam-msc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mpam_of_match);
+
 static struct platform_driver mpam_msc_driver = {
 	.driver = {
 		.name = "mpam_msc",
 		.suppress_bind_attrs = true,
+		.of_match_table = of_match_ptr(mpam_of_match),
 	},
 	.probe = mpam_msc_drv_probe,
 	.remove = mpam_msc_drv_remove,
 };
 
+/*
+ * MSCs that are declared by the firmware as being part of a cache may not
+ * be created automatically as platform devices, since there is no
+ * dedicated cache driver.
+ *
+ * Deal with theo MSCs here.
+ */
+static void mpam_dt_create_foundling_msc(void)
+{
+	struct platform_device *pdev;
+	struct device_node *cache;
+
+	for_each_compatible_node(cache, NULL, "cache") {
+		struct device_node *cache_device;
+
+		if (of_node_check_flag(cache, OF_POPULATED))
+			continue;
+
+		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
+		if (!cache_device)
+			continue;
+		of_node_put(cache_device);
+
+		pdev = of_platform_device_create(cache, "cache", NULL);
+		if (!pdev)
+			pr_err_once("Failed to create MSC devices under caches\n");
+	}
+}
+
 /* Any of these features mean the BWA_WD field is valid. */
 static bool mpam_has_bwa_wd_feature(struct mpam_props *props)
 {
@@ -2963,12 +3177,18 @@ static int __init mpam_msc_driver_init(void)
 
 	init_srcu_struct(&mpam_srcu);
 
-	fw_num_msc = acpi_mpam_count_msc();
+	if (!acpi_disabled)
+		fw_num_msc = acpi_mpam_count_msc();
+	else
+		fw_num_msc = mpam_dt_count_msc();
 	if (fw_num_msc <= 0) {
 		pr_err("No MSC devices found in firmware\n");
 		return -EINVAL;
 	}
 
+	if (acpi_disabled)
+		mpam_dt_create_foundling_msc();
+
 	return platform_driver_register(&mpam_msc_driver);
 }
 

-- 
2.34.1

