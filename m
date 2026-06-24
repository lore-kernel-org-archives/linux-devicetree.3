Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30D33F590
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328143; cv=none; b=JvBorEyAAnl2lNsEgvhBLTAPH9+ipfPexMqhyOec1Sc9Y5xxb2D+O0pPYiOASmpKMlFSgBfBRf2QAAOEGWkqFJ9QDK4j2p2crxKvju6auVRx5+X/qIaq/fCUb/oYiIdOCGNLYqNewx6kxkLI+JXLW5qayCTj4WATX3W3tMsPDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328143; c=relaxed/simple;
	bh=l6Bkp9/8+2EkOUuzwzVN9Bn0oUtVH8oEIpg6qopk8aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoVfUOvKVH08OQtdKyhu6+uDk6oSrszpAgbR7O9Osw9IfZq4FijCfwrn3EGSF2cXDy7HqLhQEMWlpfl0ysuTRG184oHd+7amt0wkUCZariqAuuoCC0aO82yTetRIpLSs/oz0kqLupMBFVwSf3PwVSfaYBtyzCs/PovRRB4o6tho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC/e+WaH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdKiScWr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iC/e+WaH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdKiScWr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj0Th3580311
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VkBgbhjPlBw
	pvXuwsnQ1bZtfCf62wd2fBiuvs/fqOQg=; b=iC/e+WaHh/kGENSloCw92oydd+X
	kC6Do2H0tN/Sr3yiF92K2N5YMJCY+AZAqFTbEvENoj74RsFWbgtzgKsnMfYYtgJ5
	Ab5FvewIKeJxCmvinpU8ncszenHH/6F4CNpHjikoIyAseTi/ebpJieWT7Qbz/XcG
	H3IX46ZE4KlndzQQs24ltgHhEhkAYo6CfAktr16AyEun5gMPyFgy12RtHVDAxh3r
	VnYWJbBNBb5UX2KLtVnfpWrchKcnQxmhtqM2ZZzkIdEYcw6DPe4GsAiqQeKqly8r
	AxHbXEhtwQGpZSMnUy23V8jAh8SZqXIEKZnJ4f+tqOGH6SDk/dKSS/+/3og==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aqbvy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8bad49b171so793379a12.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328140; x=1782932940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkBgbhjPlBwpvXuwsnQ1bZtfCf62wd2fBiuvs/fqOQg=;
        b=SdKiScWrQTpJMEVDjX7/rs8qjGDUk+C5T+6KrCmDeecGRjFNAXS07FM2u+n6UxAOFh
         d4Q8V86TyYkXAufKijPEX+xxxsb/FUiQrCIfSIHvT08ZSJalbNG52GMB7ei36iecwk+h
         kdzySKftTawJD23qUrO6Yvwc0OnaxUN0/aHn+cjl8q5bxb8rBzZGRIZkIwmEljP8iRbD
         Ho6fFRpTOVqGNYf+aQjT4EUAqLFr8+nsbus8dfEx/cp8D/NREeF5figtwK9I+AmMYIRe
         6aEG9M2EB2WQapzQe1o+f6iMbEgWD1LLZ31m+E+LyG9a5z8IMFjLBWidotFMUvWOmbvl
         gHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328140; x=1782932940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VkBgbhjPlBwpvXuwsnQ1bZtfCf62wd2fBiuvs/fqOQg=;
        b=KKOcSpXzWCw9jx9+/9St8bb5Hh8R3ErxF53+Yui9nh/kv60aD3sKXuLtLg39F6bVhr
         NpH6mCYNU76UoISW++6QD5p3VLsNqHyZi0ZjxZFiJ2+hXQzd7m4hZ3UM23GA8n/YtdeR
         DPvRk8ZEi5VL/iEkpVJGDLA/vduL2i0SMJrIUJwhNDgK9DYOcmGhF32gfu8cFGTPs0kM
         hbZ/aO2Ll2fiYfFj1BrGJXI6PMlDf2xYfOe6oa20y+tXKwHh9JvN6L2JWXGabXJ2hX3i
         pxSnUX3E7U086M2GNOFQCXR/64OYJf3bj3IGHuaW0x3PIyDvFd2zkIzZKYlQWT8ySks7
         eEng==
X-Forwarded-Encrypted: i=1; AFNElJ+tR1T+nJMpaAkw4mopl40BBwS+NJ5tPzrMYy3mrwhr4XM9Z4+rQZzGAVdEDSekiXM6ZOEikxfbuSOc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2kGfVbk+m+ju5OdUjMByuTW1kN5VqfFdjwY+6FUb99M5pMEL9
	WY/U+SKMcqXAFW0Ge/fK36fQs1U8ca7SbOeJV6insGRXxwnGVAgd3Dqn1spX/uCp/JGfgX4H6G4
	EdIDG016J0J9CeF+XH6fCdsGone2na/rREyE2ufIxEgoD8wxasQpUyL1lHJ6kidWp
X-Gm-Gg: AfdE7cl9cR/svr7xMuEwPNLXYA10J7TQ+osduIFdClYIQXCUku3JAcyd6nudsjEeDu7
	9mDAhdXcU129DK20C5gJta+YBRJVJ9USyj7BnkPfArxeuvYHcPxa6E7UZB+kAYpXKOzh33ni2CY
	BMtabRxxXjjBGY53zfTDEpKgJnZBCwRtXdRhunef3ljf1zTWUVRdSd+NOB26ecXQoj8N0lZDRvo
	ttOFrHYN07ohBKxQFTtSRH9TALkfpK2lxR6sDhPGJRV1feEm+7evE+SqSnvhk3P6w+zY1oDQeOF
	/y+sbRBYvrnEPMcSyw6r48nzZgdMT8vZO/ALH7mFNIauv3yObagZVGgN3YAGhS0dwnlqXnzPFCo
	HFIwviMU0tseoStCjMwSc8wYbLz8Bjegdhq1zSg==
X-Received: by 2002:a05:6a20:b7aa:b0:3b7:d8d5:2340 with SMTP id adf61e73a8af0-3bd2d0b4f76mr5461830637.11.1782328140297;
        Wed, 24 Jun 2026 12:09:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:b7aa:b0:3b7:d8d5:2340 with SMTP id adf61e73a8af0-3bd2d0b4f76mr5461802637.11.1782328139670;
        Wed, 24 Jun 2026 12:08:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:59 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 05/19] firmware: qcom: scm: Add minidump SRAM support
Date: Thu, 25 Jun 2026 00:38:16 +0530
Message-ID: <20260624190830.3131112-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX6cWfMO/2XP1o
 Hytarxu/CGo/3DpQ26Q9hOz10J7Wm17rrNPvtvZXqOwhjNCVu1F7XRg31C6BVWEueBZyu5MV6wV
 V521BVa2xGwZAsVeibTt40UcwU6XV0g=
X-Proofpoint-GUID: X-9WT586JhxJoVDE2zItl5X1oxp1l7eJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX9zgI+wYGLUOD
 24l9170m7bxFQzUQ1xTjP5W5zAs7HtMPTPxHS0e7+tW+M7mSVP+Du5TGLpRaVquoOsW8YKt6Hu7
 BTr4lAnaqATlcDFK7zJeTwoHjoNPxyZjrN7NNHIcbfD8NAus38JUExZ2RvUW2ydNn3xqxUpn3dm
 ZUd0Ry8kpiTPRE9ubb9B1HYXxaoGcD39bmqVTzVH8Cuh2H3xKKR3kUAS84JYpL0hqsa7anLNJyi
 XoBYgUxQzZLkKcHC1yrgKE/3V0yBUfVaetU1j9IViQPNclc/cijgJXScNmP80GL4tAVE2W9dKLO
 ZiE0mrhDIhMD7wigkdxJiQqRUwJO7+ENFMN4mW5QyojMN/72f+/Pu3jlac7HzAIo7lGF5UyX7TF
 Jj4/KIARNetKt+Z75ATDvvSukhrZog==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3c2b4d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=rvpxAYJ4qTt-cjm6DxwA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: X-9WT586JhxJoVDE2zItl5X1oxp1l7eJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the operating system (OS) and boot firmware.
Before DDR is initialized on the warm reset following a crash, firmware
reads this word to decide if minidump is enabled and collect a minidump,
and where to deliver it (USB upload to a host, or save to local
storage). The OS is expected to select one of the destinations.

The SRAM region is described by a 'sram' phandle on the SCM DT node.
If the property is absent the feature is silently disabled, keeping
existing SoCs unaffected.

Expose a 'minidump_dest' module parameter (default: usb) so the user
can select the destination. Only the string names "usb" or "storage"
are accepted.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 92 ++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 83e4810f1c53..ba5cdeed8a04 100644
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
@@ -568,6 +583,14 @@ static void qcom_scm_set_download_mode(struct qcom_scm *scm, u32 dload_mode)
 
 	if (ret)
 		dev_err(scm->dev, "failed to set download mode: %d\n", ret);
+
+	/*
+	 * Write the destination into the always-on SRAM so boot firmware
+	 * can read it before DDR is initialised on the next warm reset.
+	 * Only written when minidump is active;
+	 */
+	if (scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, scm->minidump_sram);
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
@@ -2737,6 +2783,47 @@ static const struct kernel_param_ops download_mode_param_ops = {
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
@@ -2754,6 +2841,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
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

