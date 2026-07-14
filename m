Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F31F2D73A1
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005296; cv=none; b=WdX5p/iHEEHU6u8BbBxZG/tZMrZwoYHDoa6VsNC0X/uIH6lo+sxttSXtd47qWvtlEyyy4zRGOmWj8o0CsO+7d9xELGDBCUmgjeED8zq/FKjWV/9GGeQ/6p9GPv0gvV6o9hQyVZIyKD8zuckC+ibwjVy4S4PZU+4tPC5eJQVb8Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005296; c=relaxed/simple;
	bh=YsLwpTGhaqVF7iWdGlI4Pj+Z0iP2xzIFboO5Ma9qfnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cr33S1PLhvN18RlNe/VTKdtd6gLtnxyoRTj5ZIrsku8Gc6KNj3L4JILNWgfE4YrJZHAbs1MsHl51rS89sVy0qQFC2O4wgPJj3pCLiElBKugD2+OemvtJ9zjLZ0C4Y3ViKm/7jY0Pj+pRFDA0mQAZkbnKWdE1pju7sGF/fuSQxEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuyImtcy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0hLWLkK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuyImtcy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0hLWLkK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E382cr3556536
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Q7PMnGgKEt3DXMjVZjEtPuh5DDfSfR0O3SBMGO56lU=; b=OuyImtcyaeD6Td6d
	SP50lNtf747xv/fj1wkkUFT2aA5VlymLXAuRKNGl92NtHDWU/Ig0YkhM2FtQ4+PO
	/SRrYEGtjKUkeYxtdlePyRzhYEHIOzxpAUi9IbVJtHQlHskD4e1Yrth2G/fHpWe9
	U1Ew9c4KzsGui9eYRFxNUPmgJPYgprfxYtljE//ix9obqP8P4PzBGXZXllm/1bf1
	JXgxkoli+vPrpxoONmFFsO6CZmho+nWpd96O28/uH1XxRRW+boFtqPojhs5+jb/z
	R8jRmVig+BWL/sqwcnzV/YEiCdOiKXhNMI4/MiIh3l2kpfV7/FJ3CzkCfxRAu0Zr
	dMPx9w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ct1g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:01:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5621807a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005292; x=1784610092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Q7PMnGgKEt3DXMjVZjEtPuh5DDfSfR0O3SBMGO56lU=;
        b=G0hLWLkK1bHoPe0Ww5VzSCuJNpvgoyHxL/KlI30aGx94zOoDROuE6gDvStcnKxnxBi
         +KerI2W1NmHTIFnsFs5qq8ufFo95p+kYMIyXWaDVI1nzVajJvHeKcpdHb2GQLGFrk0BD
         E4a7GSvKtcvoo6oEPNWKW4I3Pwa1Sjis8M2ES2wdbHH3PBokKfs+4OxKdSVYjWTCkWvW
         270XACXVhKxMVrNFKJFOyAPKVe/z7FwoXSi1UNkOML3Ielx8pT8utS4mxDaajE3lHpUR
         qwdNZ735EVvsXkl23w/9NNAq0/35WoWjY8Uxkd8zD077yc+xVOJhF66P+8+lQWA5GjJk
         BRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005292; x=1784610092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Q7PMnGgKEt3DXMjVZjEtPuh5DDfSfR0O3SBMGO56lU=;
        b=TRYVI4UnD2mMBZWObzppFkjZBVG0trkSzUC483+DV0yZZrFx6ldnBSIo7n2nXh3IZZ
         1NFjicKc4+dchS7hnFFUg9G2ERjoCIFm6p9jKlNGAmY8lFBrwN1b/sGE9wj2ZRAKMIQG
         4/TG03XJn5zpBw6cO4/aL2x+5oNwP1HHUK+kN0J37jPXIE37+2TvKf4IWIRe/QdMSmPu
         EdtvKS1ZTo+HvXZm1XP8HVfz5+hg/N3BCKavARtMiyV8RvU3Ik3VO+fx0TgnDARpu74g
         RTl0a3ds5UtSvRsOvodRXm+tKd28OhmXufy06fWQMpPXvr9I5h2kwtXLgbZ1S45l4vV1
         3Zxg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5t9NkhPr/Kee0Gi1kNqDhM4uXbrTymqRyfIE9MELQJWzNlp5DW66g/VEqkMMd6a/LCvbAoE6wL7X9@vger.kernel.org
X-Gm-Message-State: AOJu0YxPrC3yyxbedx7onDXeoI8j5W24EquUb05d6lKKU0Xx/DyPe/6K
	zl4eRj4vHidZLnYYPGs/Z/zXGCTREWNHCSVtcqS8Rxw1+wNcn5Kj+eUncIhRBs9RKr97j9czQ5b
	NYPskkyPvWfAQckVAc7kUvWZPVq6bP4yFbWoBD6CjdR8D2fdVpvMRvHB+T6vGoISG
X-Gm-Gg: AfdE7cnX/CO26ym1nBCVbGrXZkc2aUHTLv3dxarWWZTIoOxG8Mu5/ec7cg5zj+cfcHO
	gxEveGE7BdJMC29Qn0gx6OInGG7XnUwbx8d7m6AYE+YaNlFlVuAvJOPG76Ab0ZJNmmKAZwxkdiC
	jkQoBNeUJqwzLDVp5M5NhrX53L9ASq7i+gdgQj2ICfMRZUboIGjW98ICFLBEKCmyPpHeEneaafm
	8eUdMMpKYL1mZTf5YIyCUC7KYYaQST7XTfcMqs06HTnvfNv1aFNp9cYKuC50G8G9aNgVIwZjafE
	PD/QeC5AJEazn0k1NB0PNuDWRRaT4hehYXVPqePjxxc9dYygJw30Wjg8gPOtgHgqkLGCs15VPfm
	+wkblxjU4R1aPVaT1Ps+erYsHQjNoOK7uh8xyOJ/gB/NJutc=
X-Received: by 2002:a05:6a20:43a9:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3c34d71bb83mr2676492637.37.1784005292036;
        Mon, 13 Jul 2026 22:01:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3c34d71bb83mr2676442637.37.1784005291544;
        Mon, 13 Jul 2026 22:01:31 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3c1f77fsm9327406a12.32.2026.07.13.22.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:01:31 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:30:23 +0530
Subject: [PATCH 2/2] dmaengine: qcom: bam_dma: SCM-assign descriptor FIFOs
 to a remote VMID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-qcom-bam-dma-vmid-ext-v1-2-cef87c57b7dc@oss.qualcomm.com>
References: <20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com>
In-Reply-To: <20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005277; l=11852;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=YsLwpTGhaqVF7iWdGlI4Pj+Z0iP2xzIFboO5Ma9qfnA=;
 b=ZsUDjnVnh/sMw/a+1xiTf2gQ3IQcfaeTTNYThrxbzfsGWnUoLTpjhV2iGAFYLb45g3igQn54N
 CL4Omg6fjswCLiWWigAaE7LG3cdOPodSAJu5YQQebYxOEWtyMZBvZMi
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-GUID: 0OVcfgFY4j5nojCE83YKMETpBnoiYeB8
X-Proofpoint-ORIG-GUID: 0OVcfgFY4j5nojCE83YKMETpBnoiYeB8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX2T6HyI8Powt1
 drYNQGqWudiu2lBXlB72w/3QGhllR3ZqCQCwq4eP8C+S2LLV1aIW2WQVKJKWmlgxLNnTukDDcLx
 MLOnV/9om1PnrD0LDYY0rTRiB00/d8U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX4mAnxYH1kNgO
 RhoEUUTTvAaDwGjyDBWNeijNIrnuREKDNxcoz5kJhL84gBWP5/P/diDfonX3DJYLRPlL5FUZNpP
 /2Kh5WQmsqt/pw1FCSDbE8HTcm9oZY8rFCnhX06Shc0InKDUflz7jlNZzq8tpHZ92ZExvHSyilO
 qD0xm1t7GynXcsO/G8vRAu/hNrAy4x/rITue7aOwGcxvwvyxRQVJbbCfypAJzTTqAhVW4ZV18+T
 xQ+psnndVb1lc/NDXC9qDaPNrPms3VLVrPlDR14v4PfYZSjdySlu6+GrT3kP7OAxjHRvMSHL5dC
 iw5zEtQ4tfC9FXu+AcWdU9ZBuTc9VSDg7LBHpXwHAvu77QUHdKwPpxeAMQC5YiSWlJ6tD5liWi6
 448GI2XUcki55mto2sKqeBNqFSgXMl7Su2igsOBXi9GYpa5CLysNRFbgM9sL5Wg265gcp/2qonE
 cRaN/Au5aZZ9ERJ4a4g==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55c2ac cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=azI0fGm_GRQW7rPTH3cA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140047

On Qualcomm SoCs where the BAM is powered by a remote processor that
enforces XPU access control (e.g. the mDSP on Shikra, VMID 43 / NAV),
the BAM reads the descriptor FIFO as an AXI master under the remote
execution environment. Without an SCM grant for the remote VMID, the
first descriptor enqueue faults with an XPU violation.

Parse the optional qcom,vmid DT property as a list of destination
VMIDs. When present, SCM-assign each channel's descriptor FIFO to HLOS
plus the listed VMIDs; num_vmids being non-zero is derived purely from
qcom,vmid, a board-integration property, not from the per-SoC IP data,
and is distinct from qcom,powered-remotely.

A BAM with configured VMIDs has two properties that shape the channel
lifecycle:

  1. The remote firmware owns the BAM's power and reset. It may remove
     power during error recovery before the driver releases its
     channels, so any pipe/block register access at teardown can raise
     a synchronous external abort, and a local reset is redundant as
     the remote re-initialises the hardware on the next power-on.

  2. TZ does not revoke the SCM grant when the remote powers down. A
     FIFO assigned once stays assigned across every power cycle, and
     re-assigning or reclaiming it while the remote is mid-teardown is
     rejected by TZ with -EINVAL.

Handle both by keeping the descriptor FIFO as a persistent resource on
such BAMs: allocate and SCM-assign it once on the first
bam_alloc_chan(), keep it (and its grant) across power cycles, and
reclaim it to HLOS and free it only once in bam_dma_remove(). If the
final reclaim fails the remote still has access, so the buffer is
leaked rather than returned to the page allocator; the source-VMID
bitmask stored by qcom_scm_assign_mem() drives that reclaim.

bam_free_chan() on such a BAM therefore only drops local channel state
(clear ->initialized, decrement active_channels) with no MMIO and no
SCM call, so the block and pipe are re-initialised on the next
power-on while power is present. The bam_chan_init_hw() pipe reset in
bam_dma_terminate_all() is likewise skipped. reclaiming the FIFO is an
SCM call, not a register access, so bam_dma_remove() stays safe.

Platforms that do not set qcom,vmid keep num_vmids 0, make no SCM
call, and leave the alloc/free and register-access paths unchanged.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/dma/qcom/Kconfig   |   1 +
 drivers/dma/qcom/bam_dma.c | 197 +++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 182 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/Kconfig b/drivers/dma/qcom/Kconfig
index c71b0b5d536bdd5242df645454d8dc673a2ea659..8f20b33bce84de5fc48caa7411258c69b5b7e79f 100644
--- a/drivers/dma/qcom/Kconfig
+++ b/drivers/dma/qcom/Kconfig
@@ -15,6 +15,7 @@ config QCOM_BAM_DMA
 	depends on ARCH_QCOM || (COMPILE_TEST && OF && ARM)
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
+	select QCOM_SCM
 	help
 	  Enable support for the QCOM BAM DMA controller.  This controller
 	  provides DMA capabilities for a variety of on-chip devices.
diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f3a16f97e0d4b86c945c252d97f57..389ca1a9d70e814b722bcc51f0433ce0214a2042 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -389,6 +390,9 @@ struct bam_chan {
 	struct bam_desc_hw *fifo_virt;
 	dma_addr_t fifo_phys;
 
+	/* SCM source-VMID bitmask of the FIFO, 0 if not SCM-assigned */
+	u64 fifo_src_perms;
+
 	/* fifo markers */
 	unsigned short head;		/* start of active descriptor entries */
 	unsigned short tail;		/* end of active descriptor entries */
@@ -423,6 +427,10 @@ struct bam_device {
 
 	const struct reg_offset_data *layout;
 
+	/* destination VMIDs for SCM assignment of descriptor FIFOs */
+	u32 *vmids;
+	int num_vmids;
+
 	struct clk *bamclk;
 	int irq;
 
@@ -559,6 +567,126 @@ static void bam_chan_init_hw(struct bam_chan *bchan,
 	bchan->tail = 0;
 }
 
+/**
+ * bam_parse_vmids - Parse the optional qcom,vmid property
+ * @bdev: bam device
+ *
+ * Reads the list of destination VMIDs from qcom,vmid, if present. HLOS is
+ * always the source owner and must not be listed. Absent property leaves
+ * num_vmids 0.
+ */
+static int bam_parse_vmids(struct bam_device *bdev)
+{
+	struct device *dev = bdev->dev;
+	int n, i, ret;
+
+	n = of_property_count_u32_elems(dev->of_node, "qcom,vmid");
+	if (n == -EINVAL)
+		return 0;
+
+	if (n < 0)
+		return n;
+
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	bdev->vmids = devm_kcalloc(dev, n, sizeof(*bdev->vmids), GFP_KERNEL);
+	if (!bdev->vmids)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(dev->of_node, "qcom,vmid",
+					 bdev->vmids, n);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < n; i++) {
+		if (bdev->vmids[i] == QCOM_SCM_VMID_HLOS) {
+			dev_err(dev, "qcom,vmid must not include HLOS (%u)\n",
+				QCOM_SCM_VMID_HLOS);
+			return -EINVAL;
+		}
+	}
+
+	bdev->num_vmids = n;
+
+	return 0;
+}
+
+/**
+ * bam_assign_fifo - SCM-assign a channel's descriptor FIFO to the remote VMIDs
+ * @bdev: bam device
+ * @bchan: bam channel
+ *
+ * Grants HLOS plus the configured qcom,vmid VMIDs access to the FIFO, so
+ * the remote EE can read it. The updated source-VMID bitmask is stored in
+ * bchan->fifo_src_perms for bam_fifo_can_free() to reverse.
+ */
+static int bam_assign_fifo(struct bam_device *bdev, struct bam_chan *bchan)
+{
+	struct qcom_scm_vmperm *dst __free(kfree) = NULL;
+	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
+	int i, ret;
+
+	if (!bdev->num_vmids)
+		return 0;
+
+	dst = kcalloc(bdev->num_vmids + 1, sizeof(*dst), GFP_KERNEL);
+	if (!dst)
+		return -ENOMEM;
+
+	dst[0].vmid = QCOM_SCM_VMID_HLOS;
+	dst[0].perm = QCOM_SCM_PERM_RW;
+
+	for (i = 0; i < bdev->num_vmids; i++) {
+		dst[i + 1].vmid = bdev->vmids[i];
+		dst[i + 1].perm = QCOM_SCM_PERM_RW;
+	}
+
+	ret = qcom_scm_assign_mem(bchan->fifo_phys, BAM_DESC_FIFO_SIZE,
+				  &src, dst, bdev->num_vmids + 1);
+	if (ret) {
+		dev_err(bdev->dev, "SCM assign fifo chan %u failed: %d\n",
+			bchan->id, ret);
+		return ret;
+	}
+
+	bchan->fifo_src_perms = src;
+
+	return 0;
+}
+
+/**
+ * bam_fifo_can_free - Reclaim a channel's descriptor FIFO to HLOS
+ * @bdev: bam device
+ * @bchan: bam channel
+ *
+ * Returns true if the FIFO may now be freed. On SCM failure the remote VMID
+ * still has access, so the caller must leak the buffer instead of freeing it.
+ */
+static bool bam_fifo_can_free(struct bam_device *bdev, struct bam_chan *bchan)
+{
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	int ret;
+
+	if (!bchan->fifo_src_perms)
+		return true;
+
+	ret = qcom_scm_assign_mem(bchan->fifo_phys, BAM_DESC_FIFO_SIZE,
+				  &bchan->fifo_src_perms, &hlos, 1);
+	if (ret) {
+		dev_err(bdev->dev, "SCM reclaim fifo chan %u failed: %d; leaking\n",
+			bchan->id, ret);
+		return false;
+	}
+
+	bchan->fifo_src_perms = 0;
+
+	return true;
+}
+
 /**
  * bam_alloc_chan - Allocate channel resources for DMA channel.
  * @chan: specified channel
@@ -570,16 +698,29 @@ static int bam_alloc_chan(struct dma_chan *chan)
 	struct bam_chan *bchan = to_bam_chan(chan);
 	struct bam_device *bdev = bchan->bdev;
 
-	if (bchan->fifo_virt)
-		return 0;
-
-	/* allocate FIFO descriptor space, but only if necessary */
-	bchan->fifo_virt = dma_alloc_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
-					&bchan->fifo_phys, GFP_KERNEL);
-
+	/*
+	 * Remote-owned BAMs keep the FIFO allocated and SCM-assigned to the
+	 * remote VMID across power cycles (see bam_free_chan), so allocate and
+	 * assign it only once; the block and pipe are still re-initialised on
+	 * every power-on below.
+	 */
 	if (!bchan->fifo_virt) {
-		dev_err(bdev->dev, "Failed to allocate desc fifo\n");
-		return -ENOMEM;
+		/* allocate FIFO descriptor space, but only if necessary */
+		bchan->fifo_virt = dma_alloc_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
+						&bchan->fifo_phys, GFP_KERNEL);
+		if (!bchan->fifo_virt) {
+			dev_err(bdev->dev, "Failed to allocate desc fifo\n");
+			return -ENOMEM;
+		}
+
+		if (bam_assign_fifo(bdev, bchan)) {
+			dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
+				    bchan->fifo_virt, bchan->fifo_phys);
+			bchan->fifo_virt = NULL;
+			return -EIO;
+		}
+	} else if (!bdev->num_vmids) {
+		return 0;
 	}
 
 	if (bdev->active_channels++ == 0 && bdev->powered_remotely)
@@ -613,12 +754,29 @@ static void bam_free_chan(struct dma_chan *chan)
 		goto err;
 	}
 
+	/*
+	 * Remote-owned BAMs (qcom,vmid) keep the descriptor FIFO allocated and
+	 * SCM-assigned across power cycles: the remote may already have cut
+	 * power, so pipe-register access would fault, and TZ still holds the
+	 * grant for the next restart (the FIFO is reclaimed and freed once in
+	 * bam_dma_remove). Only drop local channel state here so the block and
+	 * pipe are re-initialised on the next power-on; skip all MMIO.
+	 */
+	if (bdev->num_vmids) {
+		scoped_guard(spinlock_irqsave, &bchan->vc.lock)
+			bchan->initialized = 0;
+		bdev->active_channels--;
+		goto err;
+	}
+
 	scoped_guard(spinlock_irqsave, &bchan->vc.lock)
 		bam_reset_channel(bchan);
 
-	dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE, bchan->fifo_virt,
-		    bchan->fifo_phys);
+	if (bam_fifo_can_free(bdev, bchan))
+		dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
+			    bchan->fifo_virt, bchan->fifo_phys);
 	bchan->fifo_virt = NULL;
+	bdev->active_channels--;
 
 	/* mask irq for pipe/channel */
 	val = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_MSK_EE));
@@ -628,7 +786,7 @@ static void bam_free_chan(struct dma_chan *chan)
 	/* disable irq */
 	writel_relaxed(0, bam_addr(bdev, bchan->id, BAM_P_IRQ_EN));
 
-	if (--bdev->active_channels == 0 && bdev->powered_remotely) {
+	if (bdev->active_channels == 0 && bdev->powered_remotely) {
 		/* s/w reset bam */
 		val = readl_relaxed(bam_addr(bdev, 0, BAM_CTRL));
 		val |= BAM_SW_RST;
@@ -767,7 +925,9 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
 		if (!list_empty(&bchan->desc_list)) {
 			async_desc = list_first_entry(&bchan->desc_list,
 						      struct bam_async_desc, desc_node);
-			bam_chan_init_hw(bchan, async_desc->dir);
+			/* Remote-owned BAM: pipe reset may fault, skip it. */
+			if (!bchan->bdev->num_vmids)
+				bam_chan_init_hw(bchan, async_desc->dir);
 		}
 
 		list_for_each_entry_safe(async_desc, tmp,
@@ -1282,6 +1442,10 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->powered_remotely = of_property_read_bool(pdev->dev.of_node,
 						"qcom,powered-remotely");
 
+	ret = bam_parse_vmids(bdev);
+	if (ret)
+		return ret;
+
 	if (bdev->controlled_remotely || bdev->powered_remotely)
 		bdev->bamclk = devm_clk_get_optional(bdev->dev, "bam_clk");
 	else
@@ -1418,9 +1582,10 @@ static void bam_dma_remove(struct platform_device *pdev)
 		if (!bdev->channels[i].fifo_virt)
 			continue;
 
-		dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
-			    bdev->channels[i].fifo_virt,
-			    bdev->channels[i].fifo_phys);
+		if (bam_fifo_can_free(bdev, &bdev->channels[i]))
+			dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
+				    bdev->channels[i].fifo_virt,
+				    bdev->channels[i].fifo_phys);
 	}
 
 	tasklet_kill(&bdev->task);

-- 
2.34.1

