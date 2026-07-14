Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFAE305699
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049442; cv=none; b=b2To7M+x8I49vRIaankHCELvZ+xjMi06InZ4mQS5c5lFnBbSYqLa+Q4ui6EMbaPZ8ifAeIKnqtY5aYXVF+78nZuc7Rzbk2m6enORvz39hS8iuVFqcF8jgfHAHc6GHolXV0u4eo5C7PnA/WOmx/iYN0/NbcQP0tRaAcWEVm9r5Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049442; c=relaxed/simple;
	bh=ArDByZmc9csepA9CgZHxb5udyEDuHBpra4BchbwKAAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INp/BlqQWXp8K+/ACP5H8sliNfVIo9RO4xfVr2MHgG3ynubgfFco0VtEx5JLVjxqJ1S/wbrauVZbebh9dJnQLetWex3dK49OG1mBUQysqgOYo5ZSyuTTeuM8VLXZJHHhHYOx8j3TmypJA49Zgpp2zJ76tpcI8Ppv/dN5Tbj0zxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9vpqXLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLGkeVpj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9vpqXLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLGkeVpj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EHAkHD1177123
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8RHVAAusaXxeQXX0sh5hgTNs/wTLofhUSlbBBflIiB8=; b=j9vpqXLcq3UCn70u
	MptbTjSVyuO5QfS6c5Mt4IqQt7ODSmXjCxXb6zzAcquG3QatuhRkWE7p3+EQ2K9/
	HH9Xx4NXutZ0ZqKZisjB10iqw5MiM14aB1+41jl2mxUveSzEQLMkvT1G00yLW8lI
	Lp97zuSuMksFjpxUQUUx5vt1POL/LyKrcz7HjepjaD0ZgPtwMVBLmD4HTnvQBdR1
	tpDMedJI1xmyjV0EGXNkikagRiNZtVKeTz2YfLFPfEWFASudYcZ8VbamoM1LBdO6
	PqbRsrhXGUT4RD0FLxN1vCILMQysjD0dF8wPYUeHy9pUqjok7J3RSGKXtMg/PyFY
	YCS1bw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kr0ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:17:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a4d8fd6deso1634782b3a.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049438; x=1784654238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RHVAAusaXxeQXX0sh5hgTNs/wTLofhUSlbBBflIiB8=;
        b=hLGkeVpjUmLPywthG5XzJEpnTSaiQdgjtTtUAQsGgRW+oBXO5pGHOgwoBiRnWKBx8U
         Qr0KswPdpJjimKvf/FdIATpPjJplWcxhf79ABpzAJp3EauPNFJtazM3eIZ4Zke+j3iWn
         RzY34jQc/0LmONNhlnq+Gf3qeH9A6sZV2AEFZhoIzdP8UfSelajwsoAOwgcuo6H8Ifek
         dpRKqJj6/1WaTjcame8N8EF8ljtdAqIdSmVNJjihkGmHxOc8Ji3nOOYL0ID9aPTxQJGe
         txyFoRdoXV0KTFTPYiYLW9/K2jp3YbQArX9+IBgK1bjUv+t8zbvgGjhh/CtQVeMqJcNL
         rAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049438; x=1784654238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RHVAAusaXxeQXX0sh5hgTNs/wTLofhUSlbBBflIiB8=;
        b=M6Ml1J+7HJWIkI60mET8/BH3Nm/wbTvMSKjmJRq6J70lBPWq5Y0kKqzUBkSti8pFzX
         kUVijigmVMxXT7weDH3V/CDeaWSg0NW62kHalDxwMdu6NM/Odw4XQ8YcBzuLDzw22FxR
         /wPPou+SvGtdVwKfSPxS1QMNffElEF9MaF7ttoMHvAboQBIQ+Hh5uNVf7gStrjpe6REB
         MFpfKR4U469nGqRi92SODzAM/ekMPjBlEsz5jYcGk75oYW3w7vDJkSKW+PnRuWxnuCyg
         RjJpOocdkuk8EqfCJns/JXzM7J0LoO9mI2IWg9b0UYPmzhzkSVWPg4PgSF+At0FDAceX
         gxBg==
X-Forwarded-Encrypted: i=1; AHgh+Rpis2d3vR/rhzZsUE9eIptWoNUAMFsHaZTlr+3SjrSrg9Y2DHalFMuLKJeGkbi5j+XQGghOuWGIiUq3@vger.kernel.org
X-Gm-Message-State: AOJu0YzWDhQZiyLj/90yiq+swVxdrLZb180oSnoMcPj3Wzf4jmsNHLV9
	Io+r0VEx7VPj49fLdmM5kKKf6g/rbUwnSXSytGQYI6afna/h72g1AL1v7nySOKID1psDE/eoEnh
	3+dWGEbfse7cKf3GPy7b43M9IekUacBWIXgugiP3b5W0/kMpY6wUC8dpQi/2AD5eD
X-Gm-Gg: AfdE7cmyiYDtBrmWXHmvzkEtAKkH8hKICsN0uJd2bdHCRSUV1UP2owuegEqPsYYsz48
	bHdZSdTUDImgp0sN8vNiMEtYTViPxDXI4zade7BkIXfOOwTmuKjwF6AN2byrFASI9JXhdFDkhCj
	ceynzXJ9DQSyA7Xf4PQvXW/0XEby46ruCf6TYbyOCK1STh8Jm/XUAPT0Qox0CGTlwsM229IUHr7
	1HKCMzif+IX7g6MS4tfZWYiijQg2rEB8QvrdJYJXFBwqTZeZSRo+a1mqIDH7w+VElvXMwYh6d3c
	nxE7MkRbDhHTxFxVL7mAyg3D5ajaRpNyaE0jTrcFWZ5LPuQ/NfvUwUSPFb8ZJ+8abkuQ3B1NUIT
	9j17K6WD5xigapkcm3JxNRHtwFC5IXJatWSn7dRBmZFn9XeQ=
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-848897d2bc7mr12964243b3a.36.1784049438087;
        Tue, 14 Jul 2026 10:17:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-848897d2bc7mr12964194b3a.36.1784049437398;
        Tue, 14 Jul 2026 10:17:17 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:17 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:31 +0530
Subject: [PATCH v23 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=13281;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ArDByZmc9csepA9CgZHxb5udyEDuHBpra4BchbwKAAw=;
 b=XkgmIxYqF2biUxhGTDhazu1bx4+168Trm1jCPnrjets3o17sJQbSvBWrR9IfVOIVER3v9BIz7
 E/fRP7x6CLaB4UJJT7p622harlN38F82A04WOOEnhnQ9cff6bPQf3Bn
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a566f1f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QUVuacwPHT3dDyYMSdgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: p5d_ADO9-curRP0icxhYkdKyPHF3TUxo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3NyBTYWx0ZWRfXwbPp+/T7fbgV
 z9XtZWNVRengF+7j3mKs9PvBKL3mp8o3g3at9Px5MMPY0fyWeB2x+InoYzN2gwc56PLfNeQsOIh
 BABcm5rDxPedNKgSO4U8SYuQheko6uE=
X-Proofpoint-GUID: p5d_ADO9-curRP0icxhYkdKyPHF3TUxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3NyBTYWx0ZWRfXxPnGLevjOQ20
 qzXpQqtoKeRanMVEntMpR5DmFwUSWkbNlIl6nEorCw+vRu4sN5bu+1oecLXMofxCisE7nTV+ni1
 NvvY+JGcB3+hjFRb+hRACwHE+uG+ibfQmfix5HEFBiHeN1NGhoThJ8MJisxQsmgy/7PNVBzg4sT
 urLuyVyDca3u0tt9BT5QbQWKlgC+FFAe/aXdL564lNpCH02f3pKsR9iIkNDA+fh6Z35VoqS3dn4
 Jr/LnzK6M/YcnOvQFg7uG7HRSjlqsifnpemQrIu07a4MqBhGobbC4EkakpGyB4uwo0bom7YblOw
 BfS2jea1lpM9KIJJnAp52mo2ZrncXjOH6m9HWajCfKVcIpJSoa8FwPuwkiIqMoUFiiQ8MbV7BkO
 F6/21Ptqszx+gQK3sBg3KP3cQAwm65KpjaZYWiP+xgs58xV9Ie2vZLkEUHayTg2qjgh6SOBpjHp
 1xftKvicHlzeACQ+zXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140177

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Extend the reboot-mode framework to handle predefined modes alongside
those defined in device tree. Drivers can now define their own
reboot-modes and register them via the framework. A centralized init
call has been added to the reboot-mode framework and adopted by
existing drivers. This ensures driver state is initialized together
with predefined modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |   4 +-
 drivers/power/reset/qcom-pon.c           |   4 +-
 drivers/power/reset/reboot-mode.c        | 192 ++++++++++++++++++++++++-------
 drivers/power/reset/syscon-reboot-mode.c |   4 +-
 include/linux/reboot-mode.h              |  16 +++
 5 files changed, 175 insertions(+), 45 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index ac69b5f39fb4..4909c65ca02d 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -53,8 +53,8 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 	if (!nvmem_rbm)
 		return -ENOMEM;
 
-	nvmem_rbm->reboot.dev = &pdev->dev;
-	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	reboot_mode_driver_init(&nvmem_rbm->reboot, &pdev->dev,
+				nvmem_reboot_mode_write);
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index a508ab26d03f..5f3c6002ef8a 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -72,9 +72,9 @@ static int qcom_pon_probe(struct platform_device *pdev)
 	reason_shift = (long)of_device_get_match_data(&pdev->dev);
 
 	if (reason_shift != NO_REASON_SHIFT) {
-		pon->reboot_mode.dev = &pdev->dev;
+		reboot_mode_driver_init(&pon->reboot_mode, &pdev->dev,
+					qcom_pon_reboot_mode_write);
 		pon->reason_shift = reason_shift;
-		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index db2129c72341..08d5b58fce71 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -32,18 +32,30 @@ struct reboot_mode_sysfs_data {
 	struct list_head head;
 };
 
-static inline void reboot_mode_release_list(struct reboot_mode_sysfs_data *priv)
+static inline void reboot_mode_release_list(struct list_head *head)
 {
 	struct mode_info *info;
 	struct mode_info *next;
 
-	list_for_each_entry_safe(info, next, &priv->head, list) {
+	list_for_each_entry_safe(info, next, head, list) {
 		list_del(&info->list);
 		kfree_const(info->mode);
 		kfree(info);
 	}
 }
 
+/**
+ * reboot_mode_reset_predefined_modes - Remove all predefined reboot modes
+ * @reboot: reboot mode driver
+ *
+ * Reset predefined reboot modes added via reboot_mode_add_predefined_modes().
+ */
+void reboot_mode_reset_predefined_modes(struct reboot_mode_driver *reboot)
+{
+	reboot_mode_release_list(&reboot->predefined_modes);
+}
+EXPORT_SYMBOL_GPL(reboot_mode_reset_predefined_modes);
+
 static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct reboot_mode_sysfs_data *priv;
@@ -117,6 +129,58 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/**
+ * reboot_mode_driver_init - Initialize reboot-mode state
+ * @reboot: reboot mode driver object to initialize
+ * @dev: backing device
+ * @write: write callback for programming magic
+ *
+ * This function must be called with a valid @dev and @write before calling
+ * reboot_mode_register(), reboot_mode_add_predefined_modes(), or any other
+ * reboot-mode framework API.
+ */
+void reboot_mode_driver_init(struct reboot_mode_driver *reboot,
+			     struct device *dev,
+			     int (*write)(struct reboot_mode_driver *reboot, u32 *magic, int count))
+{
+	memset(reboot, 0, sizeof(*reboot));
+	reboot->dev = dev;
+	reboot->write = write;
+	INIT_LIST_HEAD(&reboot->head);
+	INIT_LIST_HEAD(&reboot->predefined_modes);
+}
+EXPORT_SYMBOL_GPL(reboot_mode_driver_init);
+
+static struct mode_info *reboot_mode_create_info(const char *mode, const u32 *magic, int count)
+{
+	struct mode_info *info;
+
+	if (!mode || mode[0] == '\0') {
+		pr_err("invalid mode name\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	info = kzalloc_obj(*info, GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	info->mode = kstrdup_const(mode, GFP_KERNEL);
+	if (!info->mode) {
+		kfree(info);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	if (!memchr_inv(magic, 0, count * sizeof(u32))) {
+		pr_debug("reboot mode %s with zero magic values\n", mode);
+		info->count = -1;
+	} else {
+		memcpy(info->magic, magic, count * sizeof(u32));
+		info->count = count;
+	}
+
+	return info;
+}
+
 static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 {
 	struct reboot_mode_sysfs_data *priv;
@@ -158,7 +222,7 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	reboot_mode_release_list(priv);
+	reboot_mode_release_list(&priv->head);
 	kfree(priv);
 	return ret;
 }
@@ -171,7 +235,7 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info = NULL;
+	struct mode_info *info;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
@@ -179,11 +243,16 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	int count;
 	int ret;
 
+	if (reboot->reboot_notifier.notifier_call == reboot_mode_notify)
+		return -EBUSY;
+
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (!np)
+		goto predefined_modes;
+
 	for_each_property_of_node(np, prop) {
 		memset(magic, 0, sizeof(magic));
-
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
@@ -195,35 +264,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			continue;
 		}
 
-		info = kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info) {
-			ret = -ENOMEM;
-			goto error;
-		}
-
-		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
-			pr_debug("reboot mode %s with zero magic values\n", prop->name);
-			info->count = -1;
-		} else {
-			memcpy(info->magic, magic, count * sizeof(u32));
-			info->count = count;
-		}
-
-		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
-		if (!info->mode) {
-			ret =  -ENOMEM;
-			goto error;
-		} else if (info->mode[0] == '\0') {
-			kfree_const(info->mode);
-			ret = -EINVAL;
-			pr_err("invalid mode name(%s): too short!\n", prop->name);
+		info = reboot_mode_create_info(prop->name + len, magic, count);
+		if (IS_ERR(info)) {
+			ret = PTR_ERR(info);
 			goto error;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
-		info = NULL;
 	}
 
+predefined_modes:
+	list_splice_tail_init(&reboot->predefined_modes, &reboot->head);
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
@@ -234,7 +285,6 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -267,7 +317,7 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 	if (!priv)
 		return;
 
-	reboot_mode_release_list(priv);
+	reboot_mode_release_list(&priv->head);
 	kfree(priv);
 }
 
@@ -277,17 +327,12 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
  */
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
-	struct mode_info *next;
-
 	unregister_reboot_notifier(&reboot->reboot_notifier);
+	reboot->reboot_notifier.notifier_call = NULL;
 	reboot_mode_unregister_device(reboot);
 
-	list_for_each_entry_safe(info, next, &reboot->head, list) {
-		list_del(&info->list);
-		kfree_const(info->mode);
-		kfree(info);
-	}
+	reboot_mode_release_list(&reboot->head);
+	reboot_mode_release_list(&reboot->predefined_modes);
 
 	return 0;
 }
@@ -312,8 +357,10 @@ int devm_reboot_mode_register(struct device *dev,
 	int rc;
 
 	dr = devres_alloc(devm_reboot_mode_release, sizeof(*dr), GFP_KERNEL);
-	if (!dr)
+	if (!dr) {
+		reboot_mode_reset_predefined_modes(reboot);
 		return -ENOMEM;
+	}
 
 	rc = reboot_mode_register(reboot);
 	if (rc) {
@@ -352,6 +399,73 @@ void devm_reboot_mode_unregister(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_reboot_mode_unregister);
 
+/**
+ * reboot_mode_add_predefined_modes - Add predefined reboot modes
+ * @reboot: reboot mode driver
+ * @modes: array of predefined reboot mode entries
+ * @count: number of entries in @modes
+ *
+ * Add predefined reboot modes before registration.
+ *
+ * The entire list is discarded if any mode entry is invalid. An entry
+ * with a zero or negative magic count, a NULL mode string, or a mode
+ * string containing spaces or "\n" is considered invalid.
+ *
+ * Predefined modes are cleared if registration fails.
+ * Call reboot_mode_reset_predefined_modes() if registration is not
+ * performed after adding predefined modes.
+ *
+ * @reboot must be initialized with reboot_mode_driver_init() before calling
+ * this function.
+ *
+ * Returns: 0 on success,
+ *	    -EINVAL if invalid entry is found in list,
+ *	    -EBUSY if called after reboot_mode_register() or if predefined modes
+ *	    are already set, and, -ENOMEM on allocation failures.
+ */
+int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot,
+				     const struct reboot_mode_entry *modes,
+				     size_t count)
+{
+	struct mode_info *info;
+	int ret;
+	size_t i;
+
+	if (reboot->reboot_notifier.notifier_call == reboot_mode_notify ||
+	    !list_empty(&reboot->predefined_modes))
+		return -EBUSY;
+
+	if (!modes || !count)
+		return -EINVAL;
+
+	for (i = 0; i < count; i++) {
+		if (modes[i].name && strpbrk(modes[i].name, "\n ")) {
+			ret = -EINVAL;
+			goto error;
+		}
+
+		if (modes[i].count <= 0 || modes[i].count > ARRAY_SIZE(modes[i].magic)) {
+			ret = -EINVAL;
+			goto error;
+		}
+
+		info = reboot_mode_create_info(modes[i].name, modes[i].magic, modes[i].count);
+		if (IS_ERR(info)) {
+			ret = PTR_ERR(info);
+			goto error;
+		}
+
+		list_add_tail(&info->list, &reboot->predefined_modes);
+	}
+
+	return 0;
+
+error:
+	reboot_mode_release_list(&reboot->predefined_modes);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(reboot_mode_add_predefined_modes);
+
 static int __init reboot_mode_init(void)
 {
 	return class_register(&reboot_mode_class);
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index 983b1fbf614a..0c7e11276e6f 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -47,8 +47,8 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	if (!syscon_rbm)
 		return -ENOMEM;
 
-	syscon_rbm->reboot.dev = &pdev->dev;
-	syscon_rbm->reboot.write = syscon_reboot_mode_write;
+	reboot_mode_driver_init(&syscon_rbm->reboot, &pdev->dev,
+				syscon_reboot_mode_write);
 	syscon_rbm->mask = 0xffffffff;
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 34a81e4b4f95..b216c7595f7e 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,18 +4,34 @@
 
 #include <linux/types.h>
 
+struct reboot_mode_entry {
+	const char *name;
+	u32 magic[3];
+	int count;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/* List of predefined reboot-modes, populated via reboot_mode_add_predefined_modes(). */
+	struct list_head predefined_modes;
 	int (*write)(struct reboot_mode_driver *reboot, u32 *magic, int count);
 	struct notifier_block reboot_notifier;
 };
 
+void reboot_mode_driver_init(struct reboot_mode_driver *reboot,
+			     struct device *dev,
+			     int (*write)(struct reboot_mode_driver *reboot, u32 *magic,
+					  int count));
 int reboot_mode_register(struct reboot_mode_driver *reboot);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);
 void devm_reboot_mode_unregister(struct device *dev,
 				 struct reboot_mode_driver *reboot);
+int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot,
+				     const struct reboot_mode_entry *modes,
+				     size_t count);
+void reboot_mode_reset_predefined_modes(struct reboot_mode_driver *reboot);
 
 #endif

-- 
2.34.1

