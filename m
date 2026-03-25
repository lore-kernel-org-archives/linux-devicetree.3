Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3170C3AEF25
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436966; cv=none; b=jwQ7ckr6Rdm6PqXyn8YxMXvw0pBzym6djXpjuhN1nuwViKfmnPRAuv365zQTej0c+pXFjyzkeIzEPmtQUqvrNZNko02+Ps6pLL0KU2nfzgLj/WLxS3ekbtP7khKo5S7Rty5LVzve7nUS34ss2OkQLLyvm+Awu7pD6GoL6wnNq8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436966; c=relaxed/simple;
	bh=bmn9oR4CHseVq+Q1yzNkzndMq0RHssJSS9rv7b6NSno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZK67DCocBxb62VZPEvIOP0BGswul+sHhEKJv8OuH75+qPmPK0BLw+JWIVflIx4ClMs1HOwf6BvH4hijTNRNg5ZLv5RoiykhWB/R+EWQtMOzn+1Z7h1acWIrRz4NcFp46By+zM4otct2/up5y+GKKvbRMlCcfDuc1LqRvzIeIQz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFqzj8El; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jml8tpvJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFqzj8El";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jml8tpvJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PAuMRo658668
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkYW84mNfsxJu25KdM9HhqHWqHHn7yyj15gOr+bOnfo=; b=kFqzj8ElIg4IuUQA
	JtxyVvgWvrtUWK8UNBmZVtjJApYGTenxxBQgJ0oPJ7sp+G8b/j4YyyyAgZstMG+u
	719uyWG6fu3MSf2pPlWQS5i7zQ3C7Ys8iuG/ap3oO9+1JHp2wkaES3doFUvH8YSN
	y118pR8e8AXGOdcrZfSQr3XytZcYlbXcIET0Iq7uMpAdmu7Ni+vUzN99E+c6L0DG
	OXmsh2UT7ERAZx6m6vnofE2XeKjbHwtaXbNpwo7zGlecCx/4rFxu3hcOtv8WErmu
	ZtEa3+1F9ihioadsQKPDjQUDGKI4SmiCtssnkJXhKhvfOmp2KCx5Sgzy6Op2XN9w
	xSOvtQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489whf13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:09:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c699d8caaso3457968b3a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436961; x=1775041761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkYW84mNfsxJu25KdM9HhqHWqHHn7yyj15gOr+bOnfo=;
        b=jml8tpvJlFUZmHid5Fzkoi6q3TyGoz+6qwAm+xxgpcL8WGG7K5/52zvbui/vAwHUWz
         wE7kej4Lw4zRsZHlkxlORUUuiw5TgdZ1sFbm2WBauORDyaQ+HqBPaK6QyK7VBudoIukR
         vBOqQRnl1pfaEFhu9q4HmP3khL++wQUITgm1WDQ1gQM9lEgkZzmiI3Ze4F9NAGK2Tjes
         RyHwq3UzM57QF6ApnCBXEZsoHZj/d+aqMTBEJPlqz3j+aHDrYnrg2KZ7w4Gq9BhClgsc
         3dYY4N1jG5r0hWVF4fjWfLyq6/xfgAzrAHKUkaeHtLpwP6bnXoxGDbmEDQtHyduqHafS
         aFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436961; x=1775041761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkYW84mNfsxJu25KdM9HhqHWqHHn7yyj15gOr+bOnfo=;
        b=PodyVZDiIvEXRAyjTvuk6q1d+QU1r/RhObaeagtEoH7kwA3dYgXb3tzG5wmBZN62G4
         AZMfrq9spw6wDEzz4j+sbxKQFPPYWW/+2r5bGZM/i319IowG2ttvQ4I5zgTAKKBmV+hQ
         9Fk1+c21JYDzZkHudHEO1VfRIjBt6HCPeK9w46D3AoapZaI9zP1lK8lS2GP0uz8yn3Cz
         e9mVJ7ELa53ZcDz7gqng3opSMc5xSto6eWB52MR0ql2cuaAg1MZ150e7fhQwciqWGYw0
         sNxit3QJUagH+nbKAIPOGuK2iqnZ4WglRQvrZOQTK6jzVB4e4EDwv/Q0RK4QA+mDxJP9
         nqrg==
X-Forwarded-Encrypted: i=1; AJvYcCVBgdTA2PV2boMHNESUTCnpthSsAcaSSIMqMUVo0GKLk73Q5vXYnMyuW4vE8IVMGub9q6mRUERP09W8@vger.kernel.org
X-Gm-Message-State: AOJu0YyCoDr0IfyM6Ut4GQObKa9wKaw5jfMhBAq/uyvdGjwJJlAW44pR
	GP6TLxVIlnt3pb3+3WSES39KInh/K5tJASp7HQpzBaDqoBKrbb0Kmv4Gbl/Vg5AzCKAJMUiIvoY
	kPQY1GioQEITYPKboYQCqa0wRuaGQb5QMS8+0l2XUzsibMIam57cJ393Au0c+a6+q
X-Gm-Gg: ATEYQzzX92dpCwrFP7xywEUw6pa5tezuCC+o/AkQ3N5UoJjJ0bsCTKkMjrKACApofLo
	QRDeaOrdBzw7fU8qAFTdfnvRn51JE9kKAhBU5/7fwT9N6eYyWtqVCI1hy6Mtv0zSSO8h4RStpk+
	yl4EJvW07pz4OP/lgmGAphP+42B+UDvlvf2leCB9cfMLYrrDbG14rTh6QgJTVCm1iShX+WtJ7mB
	BtXufsVmIpCAGaRY40AEx2op/PhmbtIrzC4BCicXqjrBpfiKsVH82Abj7I5uvjhWy6uDij5OZyg
	nQsVAePCj/9UrrZ8GqUpB3MVNUxPxhigBWOjXELv4TrlitZRVKnB+eEVBnMwNhFkGlIacgrzKzS
	t+WHlrWx1FaIHU5rnwTwxlSmds8xL0NqjzYz3XFUW+N1geKnikGNBaUu6
X-Received: by 2002:a05:6a00:a88e:b0:829:924c:3482 with SMTP id d2e1a72fcca58-82c6e0c86f9mr3070700b3a.53.1774436961039;
        Wed, 25 Mar 2026 04:09:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:a88e:b0:829:924c:3482 with SMTP id d2e1a72fcca58-82c6e0c86f9mr3070656b3a.53.1774436960441;
        Wed, 25 Mar 2026 04:09:20 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040da7besm14615911b3a.49.2026.03.25.04.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:09:19 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 16:38:22 +0530
Subject: [PATCH v11 1/3] of: Add convenience wrappers for of_map_id()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-parse_iommu_cells-v11-1-1fefa5c0e82c@oss.qualcomm.com>
References: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
In-Reply-To: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774436938; l=8620;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=Bsp9hT6sgzNh1NrIZ0uduUy4Yj5U0gq9szC+ECoPqVA=;
 b=XTgGqalcyL/WLhRInaGtXLu5D/HUpXAmnrAFKW3XHxKkbT0f80fJnPG6NgpusUQ/1o+/QleBf
 abe0ppIcpOUDCujoSS9v/HAMK3rslqgr+MXWDyY7MfIW3OAe1ZlOh+0
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-GUID: nz9b6YtGN2oSP3pEuWOw2wZ7l96v_J1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX0VXrZTrvJO7O
 OLjhi8ygJ7Z5P2xS63PWsMlJHO82U9hloDu59Pxi5GRx7XoPMamMK4XQU2g0P+YOfzK2QDlOUG9
 rvadV9PISCYfo5qRow3phLXwYYvmMESxnFKpz2aJAHOqzaRdxJ6rzjIxEueesa/PmsnO0A7Qm1z
 UNGNlZkAVDwFMhg2khVGNPl827jJuKO8fuWv1+h1FKV4Ocj0Nr5RuDxZCobNb9ZiH/HsE4jdJVl
 7ftVjk689HuWjHR6Jz/uIO/8zDRzBsDJdXiJ8n4pTVmUa7PywqS+VWM9tvBo7AG1kpiNYB9nMBd
 4xykxornUDtJ78h8U8WlRcx35tUYN7CxGchkrXV0If1CfMqsApUJGmgXuErNzVuaow8WqwGhMN0
 sNQKTyf5ZW0T7waCR7fHRkDNnA/O4t5rSQkwlo3h4PW06032Ng+dyaUVE3IELUJuwJayeCa98Br
 uyWQfPks9VnIA+dGg2A==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c3c262 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=1XWaLZrsAAAA:8
 a=EUspDBNiAAAA:8 a=f4O9XJQV64orvU1ydW8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: nz9b6YtGN2oSP3pEuWOw2wZ7l96v_J1w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079

From: Robin Murphy <robin.murphy@arm.com>

Since we now have quite a few users parsing "iommu-map" and "msi-map"
properties, give them some wrappers to conveniently encapsulate the
appropriate sets of property names. This will also make it easier to
then change of_map_id() to correctly account for specifier cells.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/cdx/cdx_msi.c                    |  3 +--
 drivers/iommu/of_iommu.c                 |  4 +---
 drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
 drivers/of/base.c                        | 38 ++++++++++++++++++++++++++++++++
 drivers/of/irq.c                         |  3 +--
 drivers/pci/controller/dwc/pci-imx6.c    |  6 ++---
 drivers/pci/controller/pcie-apple.c      |  3 +--
 drivers/xen/grant-dma-ops.c              |  3 +--
 include/linux/of.h                       | 18 +++++++++++++++
 9 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
index 91b95422b263..63b3544ec997 100644
--- a/drivers/cdx/cdx_msi.c
+++ b/drivers/cdx/cdx_msi.c
@@ -128,8 +128,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
 	int ret;
 
 	/* Retrieve device ID from requestor ID using parent device */
-	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
-			NULL, &dev_id);
+	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
 	if (ret) {
 		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
 		return ret;
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 6b989a62def2..a511ecf21fcd 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -48,9 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 	struct of_phandle_args iommu_spec = { .args_count = 1 };
 	int err;
 
-	err = of_map_id(master_np, *id, "iommu-map",
-			 "iommu-map-mask", &iommu_spec.np,
-			 iommu_spec.args);
+	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
 	if (err)
 		return err;
 
diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index d36b278ae66c..b63343a227a9 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -180,7 +180,7 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
 
 	struct device_node *msi_ctrl __free(device_node) = NULL;
 
-	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
+	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
 }
 
 static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 57420806c1a2..ae04487bd614 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2201,3 +2201,41 @@ int of_map_id(const struct device_node *np, u32 id,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
+
+/**
+ * of_map_iommu_id - Translate an ID using "iommu-map" bindings.
+ * @np: root complex device node.
+ * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
+ *      stream/device ID) used as the lookup key in the iommu-map table.
+ * @target: optional pointer to a target device node.
+ * @id_out: optional pointer to receive the translated ID.
+ *
+ * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
+ *
+ * Return: 0 on success or a standard error code on failure.
+ */
+int of_map_iommu_id(const struct device_node *np, u32 id,
+		    struct device_node **target, u32 *id_out)
+{
+	return of_map_id(np, id, "iommu-map", "iommu-map-mask", target, id_out);
+}
+EXPORT_SYMBOL_GPL(of_map_iommu_id);
+
+/**
+ * of_map_msi_id - Translate an ID using "msi-map" bindings.
+ * @np: root complex device node.
+ * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
+ *      stream/device ID) used as the lookup key in the msi-map table.
+ * @target: optional pointer to a target device node.
+ * @id_out: optional pointer to receive the translated ID.
+ *
+ * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
+ *
+ * Return: 0 on success or a standard error code on failure.
+ */
+int of_map_msi_id(const struct device_node *np, u32 id,
+		  struct device_node **target, u32 *id_out)
+{
+	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
+}
+EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 6367c67732d2..e37c1b3f8736 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -817,8 +817,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 	 * "msi-map" or an "msi-parent" property.
 	 */
 	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
-		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
-				"msi-map-mask", msi_np, &id_out))
+		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
 			break;
 		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
 			break;
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index a5b8d0b71677..bff8289f804a 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1144,8 +1144,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 	u32 sid = 0;
 
 	target = NULL;
-	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
-			  &target, &sid_i);
+	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
 	if (target) {
 		of_node_put(target);
 	} else {
@@ -1158,8 +1157,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 	}
 
 	target = NULL;
-	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask",
-			  &target, &sid_m);
+	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
 
 	/*
 	 *   err_m      target
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 2d92fc79f6dd..a0937b7b3c4d 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -764,8 +764,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
 	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
 		pci_name(pdev->bus->self), port->idx);
 
-	err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
-			"iommu-map-mask", NULL, &sid);
+	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
 	if (err)
 		return err;
 
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index c2603e700178..1b7696b2d762 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -325,8 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
 		struct pci_dev *pdev = to_pci_dev(dev);
 		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
 
-		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
-				iommu_spec.args)) {
+		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
 			dev_dbg(dev, "Cannot translate ID\n");
 			return -ESRCH;
 		}
diff --git a/include/linux/of.h b/include/linux/of.h
index be6ec4916adf..fe841f3cc747 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -465,6 +465,12 @@ int of_map_id(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
 	       struct device_node **target, u32 *id_out);
 
+int of_map_iommu_id(const struct device_node *np, u32 id,
+		    struct device_node **target, u32 *id_out);
+
+int of_map_msi_id(const struct device_node *np, u32 id,
+		  struct device_node **target, u32 *id_out);
+
 phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
 
 struct kimage;
@@ -934,6 +940,18 @@ static inline int of_map_id(const struct device_node *np, u32 id,
 	return -EINVAL;
 }
 
+static inline int of_map_iommu_id(const struct device_node *np, u32 id,
+				  struct device_node **target, u32 *id_out)
+{
+	return -EINVAL;
+}
+
+static inline int of_map_msi_id(const struct device_node *np, u32 id,
+				struct device_node **target, u32 *id_out)
+{
+	return -EINVAL;
+}
+
 static inline phys_addr_t of_dma_get_max_cpu_address(struct device_node *np)
 {
 	return PHYS_ADDR_MAX;

-- 
2.34.1

