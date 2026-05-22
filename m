Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9188337DAAC
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479662; cv=none; b=M+0Tr8/aFaoSRsso9jnl10/KFeZRz5LUNUuIlaHrWao0EmBakSzr6nVh5HHw74b6H7xXQN6tkroXkcN6XeyAe/wTX91M02Bcv1bMICOgmsVRGLvZkHbo/mm/vvy+p85WqsbvhdiO3y3yCs688Bo6aqaw6K0dZKQvcNusiLx4LhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479662; c=relaxed/simple;
	bh=p/ciXwcU/1o2QklsN+aMNnup9qbFvY81lSB7qx6kXXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUawgRxYoiP+u1D2O4mOX507g5YjyqY61Ql9WV+nEcwzUOYQizs7KoO7F7Afle7FSi1I/Cj+/boSGotdKZut6BmhOFunEEZzdqwQe7VqhSQIoaxf2hLFkYlqbW7IR+646pc1ZwcMFLjHkGTz/fC97m42EQFcb8psJr9z7nZ6ENY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSx5Vvjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nn6U/J57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSx5Vvjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nn6U/J57"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIE7l73344241
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RgLWgHPyB7A
	lV0l0GSTJmUsNrDkcyfP3IdUK9UW2Wik=; b=ZSx5VvjhNkzddsXWRd2NQm2DQO6
	tZOMIcEivH9F4cKCCAS8QSQcvmx/rVUucph59qPWc5P+JP6Fb+62VRjAIYG6SAkL
	M7Kb99F4PBMgQoUyR08WBDAMSS6jeicFT7AvnpNfYsjixDqXhqAqJ1xd8Vkso5hD
	uWokwRMa4eO6nHO8UZuUmX3kU5aVbVCfTJx8V92Q+GlZjgRcij0qsGLLoiVwneAM
	8kObDNUG6NMPOyxSuhABS1fc3AutBBT6yqgJzHwPMTl7CwgOYs1opbLAlmo/Cm/Q
	L/IBVr1hqtC7wP/Ln+ijAlpSY1f1P88eF6VdMrEtvGVzVMqykYwRNgqFKYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eav87r9sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so80966085ad.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479659; x=1780084459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgLWgHPyB7AlV0l0GSTJmUsNrDkcyfP3IdUK9UW2Wik=;
        b=Nn6U/J57KVcFVmN1+HbvqvHaM3lcTdjekzHIkm70i5WcTGyKEUSRUXfTXT07PeoCzC
         g54rZdgzcSM3M1HSEUCsTDkeF0OPQsJV5D9XVGDC5rOWsiU/VOczTdoJiCjT9OsESnZ9
         52cbqrsgYLS3dv1+6UPKLfj0to/coaGVbYCOCPo7Lz8C48QXPxBaxoyj9HW6JYWPxM16
         2TxKCQQVcKsr44P7C+lpAeWME+gix09dvlcA/1i9E1OyPG89Kgwa+j+qfNfPooYPyuH/
         a1ycbFDL+H3S4or0vWt0RHBxKM30vbIuGJY7ln5G1JyVghVKI1kkl2xkhsFkYY+EIVn+
         hTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479659; x=1780084459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgLWgHPyB7AlV0l0GSTJmUsNrDkcyfP3IdUK9UW2Wik=;
        b=OaONLjR+/S9a0lTnwcdQqAH8ZCAawU26fKWEtwz5sesdH/PrUTPbBaq561fX1PI1D0
         C5mfRYVu78z+rSv9MPIvbsJPgQZ5fAIx1kScy+qEpjInvp7Xw8zNTiAuxniFkMSn1cIn
         VsaweoVEYqWBu5jpbnj6JQMyXCiInzG8hU4o7Ge9HH2nOW0hcS/aLUBVe0Il6BIEKtyE
         7AfteKy+rqQCBX0H5nYue8yaxIh2udtgT5C5MokgszR+ITU1/sysbQwnLvfKT+wJKW/6
         cuiUpUSnsvIfC8ZZ+whyIb/KZ1i286fxihB92Fl4KjpnAbbpm7lh82rZ4r227K6jLdK/
         zBag==
X-Forwarded-Encrypted: i=1; AFNElJ9UqbeP9uqiB7CGyTBntxvKR7/hvY10y61zOdv06d00S7P2lrrr8BcRcB+uhw15ywRJFb9Ju3CB5Hai@vger.kernel.org
X-Gm-Message-State: AOJu0YwkmzPsV/tvJCH38lwMXae8B7de+ldKAPnhqgruPz1QzN3iEbJ8
	pMj0s+QKn38tb/z+oJJvdQ/tyqFK4ap0fLGJsgTn7/Wu3anGLxpocG9ony5IFLwXDqrfjmWP6ZV
	7m1gBZ5li7GEYnHaIufzewSsX83hyJNnYvbSfv3fjS787HSTo0cfVJ311KBPyXuGD
X-Gm-Gg: Acq92OFj3fD1UcuEBu7ZOrEa9Ajh/wLL/UGiKhrzjHYP6viIOIHwxLKDscssUXkNSJr
	UTyjB03A2yYjb5KxIu5a+ACog6JxDl1NHlx+YqCB0+49OetYIDWHOE0ygsB28sjFU+6vV87QHYV
	ie5e9P85oktPjU2zmFnYECqdlCrv5IIvRWFHArB/x9tdes39OVYHFzAPnvwYXDlvgS1yEcVepuI
	1qu5sAOH8dnVsX4GyfjUS9IxLkkh6CL3uAu2lv6jt2UefqDdyg+DqGtxfpRuvdAOTIGM7nDxNII
	iGMcI71rVM6vpDHUIFjGy2a0QZnjr4rdIHdFjGMjlaX/qvNXLXFuw3Th476lM7Fx0h29vl74n9Y
	IMCzF29ZJiFyMhEoASio6j1lr2xwgcY0KETWYDe5dtWqt4m/w
X-Received: by 2002:a17:902:f64e:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2beb06d144amr51010975ad.13.1779479658607;
        Fri, 22 May 2026 12:54:18 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2beb06d144amr51010595ad.13.1779479658023;
        Fri, 22 May 2026 12:54:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 04/18] firmware: qcom: scm: Add minidump SRAM support
Date: Sat, 23 May 2026 01:19:55 +0530
Message-ID: <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX8p+liSjDRyRh
 3OSUe9YCgS8Q6eteLqdnbZQEp+uMnOlsuftXDK74erf4Orn2KgLQ1p0X0AfRXrGsYd4LAMQSKPe
 C9kYl1BDSq3BK8vqYOwvbHEoiCOHONxubyNSg30yjtvGY1cSfutqwpS7WUqVcQIYyBACPgPprqV
 THXbdmXRcWJ4UXjSu3FUk0FCKxic6PQzLjr+2Oxxk/BkccRa6u0XPzk0quCc5XvOpncmbZNeiF6
 1o/x7oX3gmlf3OWFVPVYe909IixslT7JEWQmg3a9no2LMrZRfYE08v14PdRI3cZzcOP0br239tW
 vKBep103c+U4S7vyPrw1gzr2GyQqT/S2DCaFi0JqexSkpInBliPC9e+TVyQuywdMOkKFqAB4jlP
 0GV25XE2gAA3Ooz02N5DSvskqQkNoQ/EfYJ0bRGn8oqtIkhhqG27/5wyjn6sfcRigPieI6fSIHP
 7vukzfkpDdABhJI70OA==
X-Authority-Analysis: v=2.4 cv=dbiwG3Xe c=1 sm=1 tr=0 ts=6a10b46b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=z9Wl_b-Q9SImGVoSLTYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: jHAIzYii-1ElhxlpDiZS_a5UwiH0B9JT
X-Proofpoint-ORIG-GUID: jHAIzYii-1ElhxlpDiZS_a5UwiH0B9JT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
to deliver it (USB upload to a host, or save to local storage).

The SRAM region is described by a 'sram' phandle on the SCM DT node.
If the property is absent the feature is silently disabled, keeping
existing SoCs unaffected.

Expose a 'minidump_dest' module parameter (default: usb) so the user can
select the destination. Only the string names "usb" or "storage" are
acceptable values.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 92 ++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 52432469badc..5276a77834a0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -57,6 +57,7 @@ struct qcom_scm {
 	int scm_vote_count;
 
 	u64 dload_mode_addr;
+	void __iomem *minidump_sram;
 
 	struct qcom_tzmem_pool *mempool;
 	unsigned int wq_cnt;
@@ -141,6 +142,20 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
 #define QCOM_DLOAD_MINIDUMP	2
 #define QCOM_DLOAD_BOTHDUMP	3
 
+/* Minidump destination values written to always-on SRAM for boot firmware */
+#define QCOM_MINIDUMP_DEST_USB		0x0
+#define QCOM_MINIDUMP_DEST_STORAGE	0x2
+
+static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
+
+static const struct {
+	const char *name;
+	u32 val;
+} minidump_dest_map[] = {
+	{ "usb",     QCOM_MINIDUMP_DEST_USB     },
+	{ "storage", QCOM_MINIDUMP_DEST_STORAGE },
+};
+
 #define QCOM_SCM_DEFAULT_WAITQ_COUNT 1
 
 static const char * const qcom_scm_convention_names[] = {
@@ -568,6 +583,14 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 
 	if (ret)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
+
+	/*
+	 * Write the destination into the always-on SRAM so boot firmware
+	 * can read it before DDR is initialised on the next warm reset.
+	 * Only written when minidump is active;
+	 */
+	if (__scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, __scm->minidump_sram);
 }
 
 /**
@@ -2040,6 +2063,29 @@ int qcom_scm_gpu_init_regs(u32 gpu_req)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
 
+static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *sram_np;
+	struct resource res;
+	int ret;
+
+	sram_np = of_parse_phandle(np, "sram", 0);
+	if (!sram_np)
+		return 0;
+
+	ret = of_address_to_resource(sram_np, 0, &res);
+	of_node_put(sram_np);
+	if (ret)
+		return ret;
+
+	*out = devm_ioremap(dev, res.start, resource_size(&res));
+	if (!*out)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
 {
 	struct device_node *tcsr;
@@ -2733,6 +2779,47 @@ static const struct kernel_param_ops download_mode_param_ops = {
 module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
 MODULE_PARM_DESC(download_mode, "download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode, mini for minidump mode and full,mini for both full and minidump mode together are acceptable values");
 
+static int get_minidump_dest(char *buffer, const struct kernel_param *kp)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
+		if (minidump_dest == minidump_dest_map[i].val)
+			return sysfs_emit(buffer, "%s\n", minidump_dest_map[i].name);
+
+	return sysfs_emit(buffer, "unknown\n");
+}
+
+static int set_minidump_dest(const char *val, const struct kernel_param *kp)
+{
+	struct qcom_scm *scm;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
+		if (sysfs_streq(val, minidump_dest_map[i].name))
+			break;
+
+	if (i >= ARRAY_SIZE(minidump_dest_map))
+		return -EINVAL;
+
+	minidump_dest = minidump_dest_map[i].val;
+
+	/* Pairs with smp_store_release() in qcom_scm_probe(). */
+	scm = smp_load_acquire(&__scm);
+	if (scm && scm->minidump_sram && (download_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, scm->minidump_sram);
+
+	return 0;
+}
+
+static const struct kernel_param_ops minidump_dest_param_ops = {
+	.get = get_minidump_dest,
+	.set = set_minidump_dest,
+};
+
+module_param_cb(minidump_dest, &minidump_dest_param_ops, NULL, 0644);
+MODULE_PARM_DESC(minidump_dest, "Minidump SRAM destination: usb (default) or storage");
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_tzmem_pool_config pool_config;
@@ -2750,6 +2837,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to get download mode address\n");
 
+	ret = qcom_scm_map_minidump_sram(&pdev->dev, &scm->minidump_sram);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to map minidump SRAM\n");
+
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);
-- 
2.53.0

