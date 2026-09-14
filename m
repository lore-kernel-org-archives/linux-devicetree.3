Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86148483BCD
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397987; cv=none; b=lVdSCqJbgTYajZZupLV2KdnmkNvEln3UYMhXMPHTQIWziaIolagVtzVAzqez2mfMS8SOt50jMK3yB8QDXICFFlJtLq0w/I6n+KvqTAIK8cvYEI2oHsLt346Fg8K2rxKNiDBZeqFVSMVxmzrTM9JvODO+qvespWvyVICXuWoeUOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397987; c=relaxed/simple;
	bh=PrRAHImr6yIYsW7KLCHcHGI0oKMKMwPmNh0f+s4qJFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p3NjZSXxVp1kLIhfg9ddGTQ+GJB18DiUIHMv4Fzp1SWopqCThZ1+S+WkeH4YQQUsSPzveM21Y74TKzCQZrR4q5XiKNre/MWAkQYmwGFdP7NAWqIY5eP7aAI7ZWkph5Kt8sCDbSW0xGv7rtiR0QSdHJmnnkXNTw8zzQkS5qnyGtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HW1CL6fy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SomqALhY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HW1CL6fy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SomqALhY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0TuP674455
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQixMKmo4tOht+KG0/AfOgWsqoDK9/2xnAOGm0oQgkM=; b=HW1CL6fyq2wgBCod
	slbFDff3GVj/E+9Wvi2Kdv/pwaC6D/MBor+bbMDV4pE2UYLTavEZ2SmCFACzS9p9
	s+CdDfLn/WQBHz1MF7WniqZIsd5Zf5fsnjjLStK5gSJ9YjJoZ58N8PWfyMbEkjtL
	M9Bz2dyOomKJriuK2806EhJG8WX94JTWGIV23yZCbn3nQQE5SHF6BtWh7MDtAv9u
	iAK5DOT48TEg9O6qtjgXMbC4AkODCAxlIAQ/mSWAhKIijWs3WWKriY/nSTVEnXg3
	wSGn3Mu6nFb+bRO/pnbiPr+yFRbnuDPDsKa/PlfRjZFk0QVheYDjqYeW1dFbPTBl
	GWi46g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs99kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:59:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so48380035ad.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789397982; x=1790002782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQixMKmo4tOht+KG0/AfOgWsqoDK9/2xnAOGm0oQgkM=;
        b=SomqALhYhSQmcD2Z4BxoWGJEwDTRFLfYEbTtWdY/TeiuS56byxKIz+NOhJe5W8H6i5
         QWjBlD4QUYAUQXEbBk24W+6ai9mgrdunZe6YALH6V4XYDy236GsDHB/C6vsUGcW1MjfN
         2wqNeEP7eKfWPWqezzRYth7Lha06zfjUKGHYojmi3AKN8dlL29rYLc4AsaIAqlfIvVfX
         oQbuZh/nVZ8+61ss6fhoOLzmiQrc4DhsDkRZHMiQ0Oq1GIJqUmKXsYJzXyBDT+mPxKx4
         ZSZouOp61LmarwRNIrqDremDmyYqfGCR6x+mhkcEltEp7vcoJ/cpELkeDrGyqFQXH5x3
         IDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397982; x=1790002782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQixMKmo4tOht+KG0/AfOgWsqoDK9/2xnAOGm0oQgkM=;
        b=ojaae3ekmGADrdIUmF4BHj2SQuvmrXJOC6SxaAGAFZCF2AH3kYsMGqH15FHV7kwrPA
         Tl28+BHYT9VwsAPcJEgFeUU0h1iK3BN2AO9Iqw/k6HELR0VS7pWacMn0cLzye67nSSL4
         abNguhiWIMNLk5XDdQfbQVZYM59Y5Cm7S1TdxtEjdTHA/2BiSeqb4N/ykTVdhbzHbBUS
         TWfn2NKQ68RUOdEquQc2Mf/uYjj3keSWl9kJugUyFuHqCX484oOMxHF86LU7e3DD3sXj
         xCvKegp9SHGYtpfVW4X1Uu08ss7sn4rdrGlO/mEgcJa30lEBA+dYKDIPl8X4/vhQFdXd
         aUVg==
X-Forwarded-Encrypted: i=1; AKwUvByB8kc4i7cFGeAfBW2Fx6/BqBgrDfD8KU8Uskov540aZx0ljlgnteu7Pia+Gz/379MLx7Bw+C9jqGcP@vger.kernel.org
X-Gm-Message-State: AFuF++mRi1+X75pOYbYwrWWUYREnLZ6Boc/qp7UvRGn/VdViKy26EZEK
	jEM2hpFrR88nSCQFEZTGPwhY8hqM6B79K85KxxQoYr5D3A0ILndAquzR+nfkDk7gGHK/usT8k9y
	Itj8umltza8Miar8qhM6qo7m8e9mP1PjsOQMK0mjO6+D6wnBPtfIsOss06EgiW7fs
X-Gm-Gg: AYBFou25+Ft1wHmJekEeqY90RqZ9hS8YXDKRwSU3JTBfhtNbEOK2r7CUtZn6laW8+Fz
	bUVFoR8AzB7fOcxOT4vJu1eGux4oAQzrut7KhI0u9kxF2g6Icaaz5Kbbl1QYAy/oagVJRW7+cJm
	UbykC/XjRTv6dkFfPoWkyH94tt2lDjkLwBnGEDBeK3cuuexpKXxBRsxOwM43ruL96HYJga7mrV/
	Eu0MWq11meLVO8DQdg8Gapsd9WOEpSw2N9e9Pw7gPdTH26EY9+ESwCVJwK6aHhbAkCkXPP2897M
	jF16ipK4Y14vP128pyzMkc+sSZOJUq6RpqQyT3mV/H6buPcytZNh2/GyDxtyqYdoVBCaFGVgnOe
	JDb33hKtYIkU3WI/QpIuIZj6J8i93UW+lcDoj
X-Received: by 2002:a17:903:1b50:b0:2db:8ae7:a5d2 with SMTP id d9443c01a7336-2dd6c5f39camr63812825ad.9.1789397981539;
        Mon, 14 Sep 2026 07:59:41 -0700 (PDT)
X-Received: by 2002:a17:903:1b50:b0:2db:8ae7:a5d2 with SMTP id d9443c01a7336-2dd6c5f39camr63811745ad.9.1789397980906;
        Mon, 14 Sep 2026 07:59:40 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.07.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:59:40 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:06 +0530
Subject: [PATCH v25 02/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-2-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=12507;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=PrRAHImr6yIYsW7KLCHcHGI0oKMKMwPmNh0f+s4qJFU=;
 b=e1x01LDqpNHrIpzvQj7TEKdGPaA75zRoFMybskfHBu3mRbgEr7lGt17uA8xm0pnwonlFQAviQ
 +04sJ8J6HnCB5JKoO3609kA14neYBlMihvk7bMDzO1tfV6/PaCX/Gvy
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX4JqFcXfFieVA
 Rud8Itazz8/E8e+GpPFt6TdWmOvH5A9jD5DPDyGFSEebgFOoK10hic3ek57tHH/89RbG+bm/x9s
 /g5O0+Fxrk7lfZ+Xrs30qsZCRVUoR5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfXzksShSyas2F8
 qrRrwLf8kHXqGMOQBiFdT2qhgrQsNIPaM1eHtGNxAG3RZiCL7e6Q8XNOVHrv0qycNux/VXYHXGt
 HiuA9ai04DTTBrhmifpOVhFJ/zu0kiJdCTk5tSThen917l9w8Upei+sctk0ro1ViVWQXXoBq/hM
 aq7trxQMduHGmapWx7+/ts63GStFh6aRcKfuAfpoL0OICNtdgaRyugJpkVvrOMzMwcaoFfzw87t
 1+pR6ZeWAlINM9qY53aMMdXPalSNq+sy96oYxOWCRKlsqB9OdjQOH0Eb5K/TYKLIE1oniGnVBYe
 BQjAuV4Ziut8AQZDn3SZSjJlFXBk1/7nKME4sbMaQSCu+jApg0tGmQaZmyjBDCtgjS9fRa2zHau
 HCUoDzakEltvjsiOGlXAP1jNZpck9/m/lukQCCTKJZuG2+btWTYbUEyUU1r/1Kc66V/aRgEfR49
 T9LfYGiZ6scwS7h4Fhg==
X-Proofpoint-GUID: JMnpWwQkO6XkcmwNpOOu41_OJ1wwP3PK
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa80bde cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S_7UqdFmbgqGN4e7PDYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JMnpWwQkO6XkcmwNpOOu41_OJ1wwP3PK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Extend the reboot-mode framework to support driver-defined predefined
reboot modes. Add a centralized initcall to initialize driver state
along with predefined modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |   7 +-
 drivers/power/reset/qcom-pon.c           |   7 +-
 drivers/power/reset/reboot-mode.c        | 192 ++++++++++++++++++++++---------
 drivers/power/reset/syscon-reboot-mode.c |   7 +-
 include/linux/reboot-mode.h              |  26 ++++-
 5 files changed, 175 insertions(+), 64 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index d260715fccf6..700732ed0f5b 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -51,8 +51,11 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 	if (!nvmem_rbm)
 		return -ENOMEM;
 
-	nvmem_rbm->reboot.dev = &pdev->dev;
-	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	ret = reboot_mode_driver_init(&nvmem_rbm->reboot, &pdev->dev,
+				      nvmem_reboot_mode_write, NULL,
+				      NULL, 0);
+	if (ret)
+		return ret;
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582..f63996994a25 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -70,9 +70,12 @@ static int qcom_pon_probe(struct platform_device *pdev)
 	reason_shift = (long)of_device_get_match_data(&pdev->dev);
 
 	if (reason_shift != NO_REASON_SHIFT) {
-		pon->reboot_mode.dev = &pdev->dev;
+		error = reboot_mode_driver_init(&pon->reboot_mode, &pdev->dev,
+						qcom_pon_reboot_mode_write, NULL,
+						NULL, 0);
+		if (error)
+			return error;
 		pon->reason_shift = reason_shift;
-		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 328fa37598df..fd61de226383 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -30,12 +30,12 @@ struct reboot_mode_sysfs_data {
 	struct list_head head;
 };
 
-static inline void reboot_mode_release_list(struct reboot_mode_sysfs_data *priv)
+static void reboot_mode_release_list(struct list_head *head)
 {
 	struct mode_info *info;
 	struct mode_info *next;
 
-	list_for_each_entry_safe(info, next, &priv->head, list) {
+	list_for_each_entry_safe(info, next, head, list) {
 		list_del(&info->list);
 		kfree_const(info->mode);
 		kfree(info);
@@ -119,6 +119,80 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/**
+ * reboot_mode_driver_init - Initialize reboot-mode state
+ * @reboot: reboot mode driver object to initialize
+ * @dev: backing device
+ * @write: write callback to program a single magic value
+ * @write_array: write callback to program multiple magic values
+ * @predefined_modes: optional predefined reboot-mode table
+ * @predefined_mode_count: number of entries in @predefined_modes
+ *
+ * Exactly one write callback must be provided by the driver.
+ *
+ * This function must be called with a valid @dev before calling
+ * reboot_mode_register().
+ *
+ * Returns: 0 on success or -EINVAL if callback/predefined mode configuration
+ * is invalid.
+ */
+int reboot_mode_driver_init(struct reboot_mode_driver *reboot,
+			    struct device *dev,
+			    int (*write)(struct reboot_mode_driver *reboot, unsigned int magic),
+			    int (*write_array)(struct reboot_mode_driver *reboot,
+					       const u32 *magic, u32 count),
+			    const struct reboot_mode_entry *predefined_modes,
+			    size_t predefined_mode_count)
+{
+	if (!reboot || !dev)
+		return -EINVAL;
+
+	if (!write == !write_array)
+		return -EINVAL;
+
+	memset(reboot, 0, sizeof(*reboot));
+	reboot->dev = dev;
+	reboot->write = write;
+	reboot->write_array = write_array;
+	reboot->predefined_modes = predefined_modes;
+	reboot->predefined_mode_count = predefined_mode_count;
+	INIT_LIST_HEAD(&reboot->head);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(reboot_mode_driver_init);
+
+static struct mode_info *reboot_mode_create_info(struct device *dev, const char *mode,
+						 const u32 *magic, int count)
+{
+	struct mode_info *info;
+
+	if (!mode || mode[0] == '\0') {
+		dev_err(dev, "invalid mode name\n");
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
+		dev_dbg(dev, "reboot mode %s with zero magic values\n", mode);
+		info->count = 0;
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
@@ -160,11 +234,38 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	reboot_mode_release_list(priv);
+	reboot_mode_release_list(&priv->head);
 	kfree(priv);
 	return ret;
 }
 
+static int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot)
+{
+	const struct reboot_mode_entry *modes = reboot->predefined_modes;
+	struct mode_info *info;
+	size_t i;
+
+	if (!modes)
+		return 0;
+
+	for (i = 0; i < reboot->predefined_mode_count; i++) {
+		if (modes[i].name && strpbrk(modes[i].name, "\n ,/"))
+			return -EINVAL;
+
+		if (!modes[i].count || modes[i].count > ARRAY_SIZE(modes[i].magic))
+			return -EINVAL;
+
+		info = reboot_mode_create_info(reboot->dev, modes[i].name,
+					       modes[i].magic, modes[i].count);
+		if (IS_ERR(info))
+			return PTR_ERR(info);
+
+		list_add_tail(&info->list, &reboot->head);
+	}
+
+	return 0;
+}
+
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
@@ -173,7 +274,7 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info = NULL;
+	struct mode_info *info;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
@@ -183,52 +284,36 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
-	for_each_property_of_node(np, prop) {
-		memset(magic, 0, sizeof(magic));
-
-		if (strncmp(prop->name, PREFIX, len))
-			continue;
-
-		count = device_property_count_u32(reboot->dev, prop->name);
-
-		if (count <= 0 || count > ARRAY_SIZE(magic) ||
-		    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
-			dev_dbg(reboot->dev, "reboot mode %s without magic number\n",
-				prop->name);
-			continue;
-		}
-
-		info = kzalloc_obj(*info);
-		if (!info) {
-			ret = -ENOMEM;
-			goto error;
-		}
-
-		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
-			dev_dbg(reboot->dev, "reboot mode %s with zero magic values\n",
-				prop->name);
-			info->count = 0;
-		} else {
-			memcpy(info->magic, magic, count * sizeof(u32));
-			info->count = count;
-		}
-
-		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
-		if (!info->mode) {
-			ret = -ENOMEM;
-			goto error;
-		} else if (info->mode[0] == '\0') {
-			kfree_const(info->mode);
-			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
-			goto error;
+	if (np) {
+		for_each_property_of_node(np, prop) {
+			memset(magic, 0, sizeof(magic));
+			if (strncmp(prop->name, PREFIX, len))
+				continue;
+
+			count = device_property_count_u32(reboot->dev, prop->name);
+
+			if (count <= 0 || count > ARRAY_SIZE(magic) ||
+			    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
+				dev_dbg(reboot->dev, "reboot mode %s without magic number\n",
+					prop->name);
+				continue;
+			}
+
+			info = reboot_mode_create_info(reboot->dev, prop->name + len,
+						       magic, count);
+			if (IS_ERR(info)) {
+				ret = PTR_ERR(info);
+				goto error;
+			}
+
+			list_add_tail(&info->list, &reboot->head);
 		}
-
-		list_add_tail(&info->list, &reboot->head);
-		info = NULL;
 	}
 
+	ret = reboot_mode_add_predefined_modes(reboot);
+	if (ret)
+		goto error;
+
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
@@ -239,7 +324,6 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -272,7 +356,7 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 	if (!priv)
 		return;
 
-	reboot_mode_release_list(priv);
+	reboot_mode_release_list(&priv->head);
 	kfree(priv);
 }
 
@@ -282,17 +366,11 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
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
 
 	return 0;
 }
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7..7d3a95e8dfd7 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -45,8 +45,11 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	if (!syscon_rbm)
 		return -ENOMEM;
 
-	syscon_rbm->reboot.dev = &pdev->dev;
-	syscon_rbm->reboot.write = syscon_reboot_mode_write;
+	ret = reboot_mode_driver_init(&syscon_rbm->reboot, &pdev->dev,
+				      syscon_reboot_mode_write, NULL,
+				      NULL, 0);
+	if (ret)
+		return ret;
 	syscon_rbm->mask = 0xffffffff;
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 29ae39935d69..560d8b4d67ac 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,14 +4,38 @@
 
 #include <linux/types.h>
 
+struct reboot_mode_entry {
+	const char *name;
+	u32 magic[3];
+	u32 count;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/*
+	 * Optional predefined reboot-mode table.
+	 *
+	 * Must be initialized before reboot_mode_register() and remain valid
+	 * until reboot_mode_unregister().
+	 *
+	 * If a predefined mode name duplicates a DT-defined mode name,
+	 * the DT-defined mode takes precedence.
+	 */
+	const struct reboot_mode_entry *predefined_modes;
+	size_t predefined_mode_count;
+	int (*write_array)(struct reboot_mode_driver *reboot, const u32 *magic, u32 count);
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
-	int (*write_array)(struct reboot_mode_driver *reboot, const u32 *magic, int count);
 	struct notifier_block reboot_notifier;
 };
 
+int reboot_mode_driver_init(struct reboot_mode_driver *reboot,
+			    struct device *dev,
+			    int (*write)(struct reboot_mode_driver *reboot, unsigned int magic),
+			    int (*write_array)(struct reboot_mode_driver *reboot,
+					       const u32 *magic, u32 count),
+			    const struct reboot_mode_entry *predefined_modes,
+			    size_t predefined_mode_count);
 int reboot_mode_register(struct reboot_mode_driver *reboot);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,

-- 
2.34.1

