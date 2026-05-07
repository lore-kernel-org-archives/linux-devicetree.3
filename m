Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE833B6D5
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141271; cv=none; b=L3XrhUtQrF8DQMA/bUgS/b5dLixgCTcZuctYVJqI08iHeIZY2l0CmS4T/BAQRnbHk7iE0Gm+LvEbjrG8wYTN1ahLyPHbi/G9jRkwdte8SUE/1LaZ8x3dI42dODQHlNON6DfCWcpYjJ27Ve+rNImG7oSt/QmCfgCyMUUnWnXxMXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141271; c=relaxed/simple;
	bh=W5f3VgOVqD94mq5SSoUgl8RjqVGcUqXh5AxCjnlOnSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nv4CYcDgq/LyyBRjMxuhC1DYpfxAZ9GZxXHXUrlWLY/oB/4RicNNPOM287sxo8RYp69M1XwptiA7Ic/gjL6kDuo0qMxokOS/ACmUPTvZig/0BxjCfJHdcHWy50yvNp2TDCqbVMceMB5E54CCHVEFdU5Jb2WQ8lu5lbHK/kh1sls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbQ8geVe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVklHxS0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbQ8geVe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVklHxS0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wvR21927314
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 08:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EwtStiKfjdY
	N1vuE0sdJTl8aW3DPwVD+4hhac6h2GsI=; b=nbQ8geVev+xiNco1AqNA287Olwt
	m1nLtR/BgSgE2clszbqL3KM6zcOqdlpkbC6JYHao6HTA5AMreTJM+ZVWyrpUUs//
	wCgqMeWyPoEIBuDxlEmvdACClSabDKzE84mXj/BqjWRUluOacxm3lust5DrgvRau
	oW75csqJz2PNoyemlfE3sld3Qrq96f3ezWtecSIvFxWRwjRzGJ6PTVcWZmsyeeo1
	Cm3S5NHcRc8eO8ffRLPBqzMDuyROdIB/yIHpOShynWQWLtbb7HVaHkzfSTUNtDXc
	so0zAHbwon49eZVjp74viExBV2H+yBPcT2lIMo3ozWGLf8H0a0YOAmyV04A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g8fu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:07:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36521936155so624856a91.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141268; x=1778746068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwtStiKfjdYN1vuE0sdJTl8aW3DPwVD+4hhac6h2GsI=;
        b=FVklHxS0iuCzlBQshNK4xil78qurmkFSvnc7k5+pEUbHAQYre+7TuSgu3N6UE/u8YP
         ChXB0nuIWzIGrq9l0TlEZfYI38sthTooQn6H5QD0X/0tYtmobaozr+nQWXNc3eWb0Kzc
         BUrLBie0rHLA16mTCFv+w8ERFz3dBDc4RMJlg914N72cBW5DxTPDAAaYDdTxmkSujYEJ
         bgwaBNGLzC0vo2JTHGsX8pFw3qLHECC5j9Dpoq54s4NdzBfAQJDT9oX/t8n/fLU49kk1
         R2GlBKSgxh69wfgBkKVIYEn8wekIyEZAv+FSzbFNFNyzNvMZg+K7oSNFgIK2oqEwbrWc
         LrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141268; x=1778746068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EwtStiKfjdYN1vuE0sdJTl8aW3DPwVD+4hhac6h2GsI=;
        b=k5j31Y6eDGAPUHBEpSLTYx64Wm1wVoGQd6VsPd4w8guWet8GELw3b3J2v6n6wXCBcQ
         FGrZFqXEPstaU61NB9Ep0ZgnFP12PQsY/Zlv8tlGXzn7sNqJDWaYh+wf5ZZcpG3S5wM6
         MD7xyhJS30sR8g3Hhwunuv9qYPnp6J1HIIny29R/zNkPgD0VJ4IUfeO0yGK+yDLv0Z1o
         BFCCjn2QTo2NzPL0YGLsIV7rsvpBnW1DfFIO5GWH4rUFpmNTTJPFB9Pkd4yL8bjVDHDD
         Tj0CxMP/2ToOc9+4bVVy4N6fox0VynM8IqnnHOLMzauLv4jINllohEWNDbg4RXeXMrFj
         ms3w==
X-Forwarded-Encrypted: i=1; AFNElJ8D1guvhGL3StWFX11d4i7O7EIq+nUcJ6PQmdNXgdqPWUEoI1o5O+l+SJPnyCOuOvhCztbVwwhqcSnp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx44NKPRRIE/5juL/eSW6oHGOjOw7MCFbO2emPmaz3XPj5YLcU1
	Qkp0FAX3YYRcXRHgET6cSiyXPPKGKE8hutM7MtURfj3wmkO3JFttaclBMyZjwrVMph1btd0J+bz
	kevKKY9bXvNJgXAFjBziP/AmCdtVxc61W9YVjzjjuGTOXp6aNWChAGFtlUGrBRj9uqHT8VaU2
X-Gm-Gg: AeBDieshSHEmh73a+Ar/GAFchYEj78Mavj3KRKjFU8qd0vvEL1fyHewZkwx2N4nKOkF
	X/cQhTHYe0MEr3SeTJ44B8eQ1pVWJs80WOx0vDPUvimGL+FqKcyJ/4XFcPCbgH4CquZw5K1DDiY
	+qTSZP1EDxoHl6OaMjMeAdyJhpv91JVcJQHt3FFgtK05IvED0MvUFUgFCeLldbXA0q4g+tQ+PWB
	gdh1+xl6ljVgGJs+yutju2mVV8du0DYVMAmqzLVD9DaWbEUHCT9ExpOHeFOpi3M4erPfNB9cSoB
	q+m6N18HIYwz+fUaNjW0cdFwg5GQQ0Zlz7+4DJjEc+rqljqi68hj6CWkm7SLj7lQg1j2P5ukiMs
	gjMMZ08k3S6JL+osvDQjtiQuFFEj/Swf/0CVh4j1FdjXkI9jyaWBRiOZDm9HD/P8z9Em/ZQ==
X-Received: by 2002:a17:90b:1646:b0:35f:b50e:defc with SMTP id 98e67ed59e1d1-365ac080794mr7328409a91.16.1778141267900;
        Thu, 07 May 2026 01:07:47 -0700 (PDT)
X-Received: by 2002:a17:90b:1646:b0:35f:b50e:defc with SMTP id 98e67ed59e1d1-365ac080794mr7328355a91.16.1778141267178;
        Thu, 07 May 2026 01:07:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0560fa8sm1986094a91.1.2026.05.07.01.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:07:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 3/4] firmware: qcom: scm: Add minidump SRAM support
Date: Thu,  7 May 2026 13:37:19 +0530
Message-ID: <20260507080727.3227367-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc4854 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rvpxAYJ4qTt-cjm6DxwA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: j1xPHac1Kq5l5TGCDv7AzGiYc7cD8-W7
X-Proofpoint-GUID: j1xPHac1Kq5l5TGCDv7AzGiYc7cD8-W7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OSBTYWx0ZWRfXzSdzyigMsXX4
 7urlze8ImjXJiBzWPBIlEx0L3fHVh3LLAh1idoOwyH+G5vpE+Ee89EIrOtLDRpxwPmTonCXKp3g
 NxTLVqPqfOSpGr0x1NJjWwPMQ80/dRmYoBkaHl/bxE8i42kqQb5qsTng8QmJmO0WCO9HvfK7ipQ
 hlt2FygJs+JHYrWYovtjuqfof4zsl81w8JUEPZhmeP5OY8s87KNs57vftkCIcL4vh/1yvIygee4
 Y1wqKOK9y3gMksCBxMjiyNlIwRA3JQ62xWO5URUOSCmSHq/haGf0J/rH37buPV2kZ93T5A1biJ2
 pFNjUTSYOXBDeLwT+sLlTdh5HqSzZb4wrVJPNpRPcW9o3whhpKCxuHcDlXaGltbQNvIlESZBtTk
 7/PdXn6EJPWGT56bpkqPlvxUemXNKUNFyKG9bknXh15GMd2Yik4XZ+Q2eMU6IHR9IVtU5c4w6Hc
 794UeT/HiMyXuIUaCxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070079

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
to deliver it (USB upload to a host, or save to local storage).

The SRAM region is described by a 'sram'/'sram-names' phandle pair on
the SCM DT node. If the property is absent the feature is silently
disabled, keeping existing SoCs unaffected.

Expose a 'minidump_dest' module parameter (default: usb) so the user can
select the destination. Only the string names "usb" or "storage" are
accepted; an invalid value is rejected with -EINVAL. Changing the
destination while minidump mode is already active updates SRAM immediately.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 95 ++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f65b132004a5..b57f8cce7a8c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -57,6 +57,7 @@ struct qcom_scm {
 	int scm_vote_count;
 
 	u64 dload_mode_addr;
+	void __iomem *minidump_sram;
 
 	struct qcom_tzmem_pool *mempool;
 	unsigned int wq_cnt;
@@ -141,6 +142,18 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
 #define QCOM_DLOAD_MINIDUMP	2
 #define QCOM_DLOAD_BOTHDUMP	3
 
+/* Minidump destination values written to always-on SRAM for boot firmware */
+#define QCOM_MINIDUMP_DEST_USB		0x0
+#define QCOM_MINIDUMP_DEST_STORAGE	0x2
+
+static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
+
+static const char * const minidump_dest_name[] = { "usb", "storage" };
+static const u32 minidump_dest_val[] = {
+	QCOM_MINIDUMP_DEST_USB,
+	QCOM_MINIDUMP_DEST_STORAGE,
+};
+
 #define QCOM_SCM_DEFAULT_WAITQ_COUNT 1
 
 static const char * const qcom_scm_convention_names[] = {
@@ -568,6 +581,17 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 
 	if (ret)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
+
+	/*
+	 * Mirror the destination into the always-on SRAM so boot firmware
+	 * can read it before DDR is initialised on the next warm reset.
+	 * Only written when minidump is active; skip if SRAM already holds
+	 * the requested destination to avoid unnecessary writes.
+	 */
+	if (__scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP)) {
+		if (readl_relaxed(__scm->minidump_sram) != minidump_dest)
+			writel_relaxed(minidump_dest, __scm->minidump_sram);
+	}
 }
 
 /**
@@ -2055,6 +2079,37 @@ int qcom_scm_gpu_init_regs(u32 gpu_req)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
 
+static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *sram_np;
+	struct resource res;
+	int ret;
+
+	if (of_property_match_string(np, "sram-names", "minidump") < 0)
+		return 0;
+
+	sram_np = of_parse_phandle(np, "sram", 0);
+	if (!sram_np)
+		return -EINVAL;
+
+	ret = of_address_to_resource(sram_np, 0, &res);
+	of_node_put(sram_np);
+	if (ret)
+		return ret;
+
+	if (resource_size(&res) < sizeof(u32)) {
+		dev_err(dev, "minidump SRAM region too small\n");
+		return -EINVAL;
+	}
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
@@ -2748,6 +2803,41 @@ static const struct kernel_param_ops download_mode_param_ops = {
 module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
 MODULE_PARM_DESC(download_mode, "download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode, mini for minidump mode and full,mini for both full and minidump mode together are acceptable values");
 
+static int get_minidump_dest(char *buffer, const struct kernel_param *kp)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(minidump_dest_val); i++)
+		if (minidump_dest == minidump_dest_val[i])
+			return sysfs_emit(buffer, "%s\n", minidump_dest_name[i]);
+
+	return sysfs_emit(buffer, "unknown\n");
+}
+
+static int set_minidump_dest(const char *val, const struct kernel_param *kp)
+{
+	int i;
+
+	i = sysfs_match_string(minidump_dest_name, val);
+	if (i < 0)
+		return -EINVAL;
+
+	minidump_dest = minidump_dest_val[i];
+	if (__scm && __scm->minidump_sram && (download_mode & QCOM_DLOAD_MINIDUMP) &&
+	    readl_relaxed(__scm->minidump_sram) != minidump_dest)
+		writel_relaxed(minidump_dest, __scm->minidump_sram);
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
@@ -2765,6 +2855,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to find download mode address\n");
 
+	ret = qcom_scm_map_minidump_sram(&pdev->dev, &scm->minidump_sram);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to map minidump SRAM\n");
+
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);
-- 
2.53.0

