Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC361488228
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846927; cv=none; b=qr0+4zSTSq26Iqslbi2aWPJ2172/KWSd8IUZkfOC8jXPedQkDrbfAwenRsyGtXYojkRZm/adgomZk+w7/lj4y5T4p/yoF6CJLGzmggtKGis2MgH37yhifyw8F123aEXcsdtScJGe1hjYj8SXDNOMf25bHCXbCMs2RFn9mp+Q9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846927; c=relaxed/simple;
	bh=I8krKhJahgIEJ7HiEH76lvoj/BYjFhFqiLB5U5WP74A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oxK2vJj8fQV3hpbnC9TLr/hbXKrOJyMHPedVw+Q//UGuapAGeVSNSYnC0M2Hsz1WMVLpq1G345lN1RlBJw7I74wSUkP536mclpPeun4NPNxhLYHQ8tM+UxxAUp66yY8+1mKy3r8w9Hn4Ft+7qDox2X5bor8WKBhe9ZaJvffLMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVwY129Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQA4jGsl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JVwY129Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQA4jGsl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFc9hP164808
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPlM6Y0iVHV+fOjO00taADkuu2MuBiXuc3s9hjMOFU0=; b=JVwY129YOPuk83p1
	OS9RZY4wq1W/fBzbVhYuzQ46IQYLJu9nhcJJE3s/iD58RZC46hZDN3V9kJ3WjGOs
	hWPlvWLjLUQ0T22iu+0H4ntZykCjCuf2OaAcjGenuInkJrWOeCUlLVEKSNUDx9nP
	B4YyI+t7M/DENNv+8QgnCzMs4sg6DtTTSwdgGZ1PDwXzvXcUJMvvja9rHLz5hsH6
	33R0G2Ko8JB+pczAODx9Z9UsnljogPXcdL+eVMH3u50OiGsgNXOr8e7MICq9OOjw
	gfjl46ekKYQ47F+KzWahu7RUDq5W7u5DRom1anSB+zQ58GtxwMEVTHOOQdTwI/n4
	UIvvxA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjft3e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so118351a91.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846922; x=1788451722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPlM6Y0iVHV+fOjO00taADkuu2MuBiXuc3s9hjMOFU0=;
        b=YQA4jGslZ8qXWKlKfAE3LMXRQE12rYzrrOzovZdFosBx5U/MQfENvslCxlvBWkMZBQ
         cagyn7ZwlNHkMT8SV2Aa+x9Q5O2mCIXKYTWHQb2zgtgKu6BW9lZEwVi19muzdQTdAr2A
         9EG9r+qOd/uIcxWBvqIdyTewN5AAKrZzaYaEukAA0ekzi9PSC8ngRQfFrtvKO72Rh+3V
         SeYVJQGv3y4Xb7MghI8BMXSxyYA2I3SmC8TqdACC6YLJa6gsL1UJQrSU57Tvrb7ZgQ3s
         MJnYwdRMB+1GDQYx1vlL9dHRLz4ptNgr1r4RrB6NzDNOCEa4NV8C5ZGg3t7AqNNRbNDf
         cv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846922; x=1788451722;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPlM6Y0iVHV+fOjO00taADkuu2MuBiXuc3s9hjMOFU0=;
        b=ctTBqJ9QOql9bjnUgrWn7SoGCiWYKTuYvCabKivH2lDS9a3uAxHd0V/NR+7bM3i73Z
         uvsKZGxymc6K9YCLQL0f5cf2ZwXXmCfNeyC2OB1lSczy7TohUWT5ztUhpvAmOjUJIHvZ
         rGoG1tp1kugT0n5Qlv8yS3s/mXBpgZH5SHaj8UqCVXpmIl9W7+HbxGTzfEeAU19XcPCX
         Ema9wQ5zWyB10it+qZ4jz0hV9fff6SPfJQ7M6zoyA6BZFRIwf7uSIm1TijS/m9cPAcbX
         qOkd7UYKo6ATUWcKHqAWKThXQbSa4/9dVtELArr5bSRww3yelPanqu05CWjVy2erbNNL
         p2MQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8Amt7+6eZPcB0Z9Xz6fs5z2m0iHLxIQR8jrnOVoeVoSXcWq9Jfgm8IFROi5XLffIA9bRgjx03emm2@vger.kernel.org
X-Gm-Message-State: AFuF++m0gbN1pTpEL0Zha2mYNHJlvLxzGDOVpQgfDhFu6NR2VMFPO5IH
	sSDSdpvRVnNNTvFCGkNXUZgtbQA06bQ7IbWNkAD+ohyRisSC4m0H/z2EgJrx2k37EPlFQq7kR5R
	f54eGgyLm7pUHZosF2QluxqoBqpWI1CFV7CsNOaucrclOn3L/NfQ1/GCXYe6WP19f
X-Gm-Gg: AR+sD104NNyiXjp3Yy/Ry+hdDwMFUUeBFT3aetEtdCqs2q86j6F2vE1oIqqIWFDRgze
	LKMOIrt3Ze2GE/h/3KOfos49yD2xK9hFDZbADWlnhOWwp25os3H+GZzA7+AZAAL0LkbUGjiQAzp
	3hryqkvFwZA1xL0HsLK/DNsTSr9cP5VFKf7g5IxCI8XfDK8JwNqGRPj3DCiw21xom4uvOvuUuus
	bqejVpE4m0CLD7j7EOnNVJYG/hr4P+Sa0ilmJkx24uacYcwS/brlpTX5PPh1CTwU70cdMtPJtxg
	k7fYX2UG01+y+iFg9CXPD+6jFuUVDzSA51cVCscgua52tT/e+Zi9YEEHCn+KOkOV2CXQCDsWVUX
	RM/4hE5D27CnmC8I2jBpsGNAvIyZGMmaXulvmQwLVRHwkUu2RV2IZlU00F20=
X-Received: by 2002:a17:90b:4d0c:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-396d0dd5069mr450703a91.7.1787846922351;
        Thu, 27 Aug 2026 09:08:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0c:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-396d0dd5069mr450573a91.7.1787846921737;
        Thu, 27 Aug 2026 09:08:41 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:41 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/11] soc: qcom: add ICE keyslot partitioning driver for guest VMs
Date: Thu, 27 Aug 2026 09:07:18 -0700
Message-ID: <20260827160806.1295313-10-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Hg99ORvopErJMTfVSoFugM5-5Pm_oYSA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX1P2IXd4FBFgY
 5+5/MQxtFZjWXw+U2lY9Xyr2Vyi2NotqQt2b0uojo3ebCSdbDbjBdSQq0vklgcTEl1McHY16goA
 8KIlCFmuFyH0O7E99/Cd8/oa11Uu/V2OIdWlIefI317hfkUZBa/0yRnMVQi/oN6TNXRIp1BE7lw
 OBedBu/efrgGJC08HeUiQUOzsuv3qtrWGftVzqqtGA/NvpEuc4InGBmg1w6eF+zg/wlP20oTc/+
 TM1jawQpqyaEgyQKx4fVBCJGy+PqpMgOFmJsYxarN/WyrjavjWfxjWkc0+W/ojLtTJLzYsROGNk
 1MU1keIua2QUvIroIJs83TiWVBxgA/2oPCWzfNB9uXkyuenNM1udlNlKlUzsDyj4eVNQUKtE8Qu
 C3RzUN3EU00g8GwKHwFDBjXa5caFEU84nLlTc8kBVPtx0foFSzGc2ZRyUv0w3eTs5US9/6SAmU+
 CQXEA7N1WUNsOEyHc4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX0Qs215h5I0VF
 84gEdrVO7kdoha9/9xDBc7u0HHl7bAoMLzqQ1/H/AMjIejE/O6B3BgyIx7OOxTqxDu6RbI5cKaL
 qVgz4hFDOcQhJcPBy/8C6grK4c5PMDk=
X-Proofpoint-GUID: Hg99ORvopErJMTfVSoFugM5-5Pm_oYSA
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a90610b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=w3opuUzClo5xMoDqJE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

On Qualcomm platforms the ICE hardware has a fixed number of physical
keyslots shared across the host and all guest VMs.  A userspace
virtio-blk backend handling VIRTIO_BLK_T_CRYPTO_IN/OUT requests needs
to translate a guest's virtual keyslot index to the corresponding
physical ICE keyslot without letting one VM access another VM's slots.

Add QCOM_ICE_SLOTS, a platform driver that implements bcp_slot_virt_ops
for the /dev/blk-crypto-proxy device.  It parses a
qcom,ice-keyslot-map device-tree node describing the per-VM keyslot
allocation table, where each child entry maps a guest_id to a
contiguous physical slot range [slot_offset .. slot_offset +
max_ice_slots).  Entry 0 is reserved for the host; guest entries start
at index 1 and are excluded from the guest-facing translation so that
blk-crypto-proxy cannot accidentally route a guest request into the
host's physical keyslots.

The driver exposes two callbacks:

  get_guest_slots()  — return the number of ICE keyslots allocated to
                       a given guest_id; used by BCP_GET_CRYPTO_CAPS to
                       populate the max_slots field in the virtio config
                       space.
  vslot_to_pslot()   — translate a (guest_id, virtual-slot) pair to the
                       corresponding physical ICE keyslot index; used by
                       BCP_SUBMIT_IO_BY_VSLOT before calling
                       bio_crypt_set_ctx_by_slot().

The singleton pointer to the parsed table is RCU-protected; the hot
path reads it lock-free.  Probe validates that no two VM entries share
a guest_id or overlapping physical slot ranges.

Note: This patch is submitted for visibility. The keyslot partitioning
is based on the current DT-based keyslot allocation with vm_id known.
We are aware this may be revised to use a TZ SCM query interface in a
future version of this series, submit it RFC for design discussion.

Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig          |  18 +++
 drivers/soc/qcom/Makefile         |   1 +
 drivers/soc/qcom/qcom_ice_slots.c | 232 ++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)
 create mode 100644 drivers/soc/qcom/qcom_ice_slots.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 6c632d114d45..e1f383b4dc63 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -294,6 +294,24 @@ endif
 # Options selected by other drivers from different subsystems must be outside
 # of the menuconfig if-block:
 
+config QCOM_ICE_SLOTS
+	tristate "Qualcomm ICE keyslot partitioning for VM guests"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on BLK_CRYPTO_PROXY
+	depends on BLK_INLINE_ENCRYPTION
+	help
+	  Parses the qcom,ice-keyslot-map device-tree node and provides
+	  per-VM ICE keyslot accounting and virtual-to-physical slot
+	  translation for guest VMs sharing ICE hardware on Qualcomm
+	  platforms.
+
+	  When enabled, guest virtual keyslot indices are mapped to the
+	  physical ICE keyslot range allocated to each VM, preventing one
+	  VM from accessing another VM's keyslots.
+
+	  Say M here when multiple VMs share ICE keyslots on a Qualcomm
+	  platform.  If unsure, say N.
+
 config QCOM_INLINE_CRYPTO_ENGINE
 	tristate
 	select QCOM_SCM
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 6d4b7546d1fb..952a57554f9d 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
 obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
 obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
 qcom_ice-objs			+= ice.o
+obj-$(CONFIG_QCOM_ICE_SLOTS)	+= qcom_ice_slots.o
 obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
 obj-$(CONFIG_QCOM_CRYPTO_VIRT)	+= crypto_virt.o
 obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
diff --git a/drivers/soc/qcom/qcom_ice_slots.c b/drivers/soc/qcom/qcom_ice_slots.c
new file mode 100644
index 000000000000..364ac93077c1
--- /dev/null
+++ b/drivers/soc/qcom/qcom_ice_slots.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * qcom_ice_slots.c - Qualcomm ICE keyslot partitioning for guest VMs
+ *
+ * Implements bcp_slot_virt_ops: translates a (guest_id, virtual-slot) pair to
+ * a physical ICE keyslot index using a per-VM allocation table parsed from
+ * the device-tree node with compatible = "qcom,ice-keyslot-map".
+ *
+ * Device-tree layout:
+ *
+ *   ice_keyslot_map: ice-keyslot-map {
+ *       compatible = "qcom,ice-keyslot-map";
+ *       #address-cells = <1>;
+ *       #size-cells = <0>;
+ *
+ *       vm@3  { reg = <3>;  qcom,max-ice-slots = <16>; qcom,ice-slot-offset = <0>;  };
+ *       vm@52 { reg = <52>; qcom,max-ice-slots = <32>; qcom,ice-slot-offset = <16>; };
+ *   };
+ *
+ * Each child entry maps a guest (reg = guest_id) to a contiguous physical keyslot
+ * range [slot_offset .. slot_offset + max_ice_slots).
+ *
+ * Entry 0 is always the host's own reservation.  Entries 1+ are guest
+ * reservations.  The host's entry is used by ufs-qcom to size its
+ * blk_crypto_profile; it is excluded from the guest-facing translation table
+ * so that blk-crypto-proxy can never accidentally route a guest request into
+ * the host's physical keyslots.
+ *
+ * The ufs-qcom driver reads the host slot info and validates all entries
+ * against the hardware slot count directly via the OF API, with no symbol
+ * dependency on this module.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rcupdate.h>
+#include <linux/slab.h>
+#include <linux/blk-crypto-profile.h>
+#include <linux/blk-crypto-proxy.h>
+
+#define QCOM_ICE_SLOTS_MAX_ENTRIES	8
+
+struct qcom_ice_slot_entry {
+	u32 guest_id;
+	u32 max_slots;
+	u32 slot_offset;
+};
+
+struct qcom_ice_slots {
+	struct qcom_ice_slot_entry entries[QCOM_ICE_SLOTS_MAX_ENTRIES];
+	unsigned int num_entries;
+};
+
+/*
+ * There is at most one qcom,ice-keyslot-map platform node per SoC.  A single
+ * global pointer is set at probe time and cleared at remove time.  The
+ * hot-path read (from bcp_slot_virt_ops callbacks) is protected by RCU;
+ * probe/remove serialise via the platform driver guarantee.
+ */
+static struct qcom_ice_slots __rcu *g_ice_slots;
+
+static struct qcom_ice_slots *virt_lookup(struct blk_crypto_profile *profile)
+{
+	/* Single UFS controller: profile argument is not needed. */
+	return rcu_dereference(g_ice_slots);
+}
+
+static int qcom_ice_slots_get_guest_slots(struct blk_crypto_profile *profile,
+					  u32 guest_id)
+{
+	struct qcom_ice_slots *virt = virt_lookup(profile);
+	unsigned int i;
+
+	if (!virt)
+		return -ENOKEY;
+
+	/* entries[0] is the host; guest entries start at index 1. */
+	for (i = 1; i < virt->num_entries; i++) {
+		if (virt->entries[i].guest_id == guest_id)
+			return virt->entries[i].max_slots;
+	}
+	return -ENOKEY;
+}
+
+static int qcom_ice_slots_vslot_to_pslot(struct blk_crypto_profile *profile,
+					 u32 guest_id, u32 virt_slot,
+					 unsigned int *phy_slot_out)
+{
+	struct qcom_ice_slots *virt = virt_lookup(profile);
+	unsigned int i;
+
+	if (!virt)
+		return -ENOKEY;
+
+	for (i = 1; i < virt->num_entries; i++) {
+		if (virt->entries[i].guest_id != guest_id)
+			continue;
+		if (virt_slot >= virt->entries[i].max_slots)
+			return -EINVAL;
+		*phy_slot_out = virt->entries[i].slot_offset + virt_slot;
+		return 0;
+	}
+	return -ENOKEY;
+}
+
+static const struct bcp_slot_virt_ops qcom_slot_virt_ops = {
+	.get_guest_slots = qcom_ice_slots_get_guest_slots,
+	.vslot_to_pslot = qcom_ice_slots_vslot_to_pslot,
+};
+
+static int qcom_ice_slots_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *child;
+	struct qcom_ice_slots *virt;
+	unsigned int idx = 0, total_slots = 0;
+	int ret = 0;
+
+	virt = devm_kzalloc(dev, sizeof(*virt), GFP_KERNEL);
+	if (!virt)
+		return -ENOMEM;
+
+	for_each_child_of_node(dev->of_node, child) {
+		u32 guest_id, max_slots, slot_offset;
+		unsigned int j;
+
+		if (idx >= QCOM_ICE_SLOTS_MAX_ENTRIES) {
+			dev_err(dev, "too many vm entries (> %u)\n",
+				QCOM_ICE_SLOTS_MAX_ENTRIES);
+			ret = -EINVAL;
+			of_node_put(child);
+			goto err_free;
+		}
+
+		if (of_property_read_u32(child, "reg", &guest_id))
+			continue;
+		if (of_property_read_u32(child, "qcom,max-ice-slots", &max_slots))
+			continue;
+		if (of_property_read_u32(child, "qcom,ice-slot-offset", &slot_offset)) {
+			dev_err(dev, "missing qcom,ice-slot-offset for guest_id=%u\n",
+				guest_id);
+			ret = -EINVAL;
+			of_node_put(child);
+			goto err_free;
+		}
+
+		if (idx > 0 &&
+		    slot_offset <
+		    virt->entries[idx - 1].slot_offset +
+		    virt->entries[idx - 1].max_slots) {
+			dev_err(dev, "slot overlap: guest_id=%u overlaps guest_id=%u\n",
+				guest_id, virt->entries[idx - 1].guest_id);
+			ret = -EINVAL;
+			of_node_put(child);
+			goto err_free;
+		}
+
+		for (j = 0; j < idx; j++) {
+			if (virt->entries[j].guest_id == guest_id) {
+				dev_err(dev, "duplicate guest_id=%u\n", guest_id);
+				ret = -EINVAL;
+				of_node_put(child);
+				goto err_free;
+			}
+		}
+
+		virt->entries[idx].guest_id = guest_id;
+		virt->entries[idx].max_slots = max_slots;
+		virt->entries[idx].slot_offset = slot_offset;
+		total_slots += max_slots;
+		idx++;
+	}
+
+	if (idx == 0) {
+		dev_err(dev, "no VM entries found in qcom,ice-keyslot-map\n");
+		ret = -EINVAL;
+		goto err_free;
+	}
+
+	virt->num_entries = idx;
+
+	/*
+	 * Publish the singleton.  From this point on, bcp_slot_virt_ops
+	 * callbacks can resolve virt via rcu_dereference(g_ice_slots).
+	 */
+	rcu_assign_pointer(g_ice_slots, virt);
+
+	ret = bcp_register_slot_virt_ops(&qcom_slot_virt_ops);
+	if (ret) {
+		dev_err(dev, "failed to register slot_virt_ops: %d\n", ret);
+		goto err_free;
+	}
+
+	dev_info(dev, "registered: %u VMs, %u total ICE slots\n",
+		 idx, total_slots);
+	return 0;
+
+err_free:
+	return ret;
+}
+
+static void qcom_ice_slots_remove(struct platform_device *pdev)
+{
+	bcp_unregister_slot_virt_ops(&qcom_slot_virt_ops);
+	/*
+	 * Clear the singleton under RCU so that any concurrent ioctl that
+	 * already took the read lock and is mid-lookup sees either the old
+	 * valid pointer or NULL, never a freed pointer.
+	 */
+	rcu_assign_pointer(g_ice_slots, NULL);
+	synchronize_rcu();
+}
+
+static const struct of_device_id qcom_ice_slots_of_match[] = {
+	{ .compatible = "qcom,ice-keyslot-map" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_ice_slots_of_match);
+
+static struct platform_driver qcom_ice_slots_driver = {
+	.probe  = qcom_ice_slots_probe,
+	.remove = qcom_ice_slots_remove,
+	.driver = {
+		.name           = "qcom-ice-slots",
+		.of_match_table = qcom_ice_slots_of_match,
+	},
+};
+module_platform_driver(qcom_ice_slots_driver);
+
+MODULE_DESCRIPTION("Qualcomm ICE keyslot partitioning for guest VMs");
+MODULE_LICENSE("GPL");
-- 
2.34.1

