Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C019644B
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251210; cv=none; b=LqdT/+xu7RtfUFuid70W6+4Oo6NvseEUMy5WqT6SGih5NA7inPreEcHXEL4Ehc27CwJmS6GEcFkS30uvwNgagq7Ny+qRBXLHwsHgONXglcKYM8NnvMf1ponFRBvoU1kyx0sn0VP59GwZjgO+RBm84qazWRe0tzha6hpOd7IXQCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251210; c=relaxed/simple;
	bh=W21W00WdNPd7hVLGmTsWpexG3nKdXTn4uQpavl6fcMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzYD+/3iA48UYvj2EVXMi10qYc9SHbrm4rm1hZh+t0IjEl/2sAnEVwF0u1rW9sNZnP1C23M3cO05AD8F5aqkK6E/tCh9BRMlIR6lBmZ7+ajC8ZrhuyL6lK0TIW+ajz2+KtttwKToLC+sUvi/6uIr4s1b1EB19l3OigsgKqRtxeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PbrGbWbL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMFuny/I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PbrGbWbL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMFuny/I"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QLetcX2259155
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C0wuxUvjpfq
	GGqQtmkibYN/vNESQHvxRn5wfp08z134=; b=PbrGbWbL88ub0y20O+3AiKGuPMB
	XDbvzDDC+GuZqudF8Jp36DfAqDN8iZmSrAmSY5u81kdL9VDNsWva/wmVZYFvK7mz
	27FsDka7mLFabDg1HvDQqqw3e1hxF11E40LDlzG6rVW0+B4mmRBKMukJZKTAHedJ
	liZKkjF+VAfRFJ6cnLZyTGl7w70W15oHTqz3hIKvKwsJXQa88qTacrNx6aHjq0ZM
	xDhDEaSoqhl0yyKofb0+wyTzIU12v631MVcEC3akyW+PvOCqw2GpS8uaifY/pvZ+
	FpL69NDAJCDaSjssZoiOuTk3Hjhx/JueN6h+SWZ9PT/TLaLiI6FaAF6axvA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drp07kut1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:53:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c35f2c09dso12149772c88.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 17:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251180; x=1777855980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0wuxUvjpfqGGqQtmkibYN/vNESQHvxRn5wfp08z134=;
        b=XMFuny/IRtoyRh5y38oMeSovh5N1O+VuOZugT7UhJwx9cma/dW5+jdxV2hnrYhBQEm
         bA7l/SQPAqR3ZQdt51KmXy2Viu4dzevlzkSjwH95MIehgVg4og1z5pT2igPxYghXM4uV
         9DOyZ5BGFB6HQM/bUjMcsLBSfzMl5GtDNjfcLAWfO17pg6zy5zJOWgt+sXpl0WKwkgxd
         apkPG2LoO76iMlJohrj4ZgFpzhAUhqYFJXBMoMj7i5KLernlPQDR0asUkymobiMRALt6
         N39/RO+IBYjFg+ze07mmt2llc0s5Gjj8JKwWCZ5JsLGJymXxndncitn/9Tpl2eCdj+BY
         IMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251180; x=1777855980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C0wuxUvjpfqGGqQtmkibYN/vNESQHvxRn5wfp08z134=;
        b=SDDNWBHdnHFQPCANhuwN33AfF1NROQ5aQJEAmRS3W2lP8BAfzTs1/YTmki10difRQf
         wZgCcbeTwsziGWjn3gMop/Teb1o+4GSsbt+MV58Npsbm1Sqrh4YFj9JL144wvOIUegVa
         jkiaJPaCKuXmN1TAH4L1M3gDgm8lPBgyCAD2eNltdkTkzXRZjvaYFJ7zXxsqpglcAFDG
         SwT0juO8xHd0d1uFUDFz3NcqVWi8ByAj6xeO251vRBgSv++BHuEDoPKwatT7Brwv2R18
         NEeYZnHtx+9MX4NXfiaKyvmvGnmaJRN9TfXzHkIK2LsO1ZQ5HxzdKDB9JHYKL50BWHiF
         3SyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wN7XdLnVMY9Q4vdzkk8qFmhyFQGYncgkgvYUA/Z6X7RS4ZuD/48R9hrhCsTZJaRyYO0+hFJFBuitQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy044i3bE1oSsjNxbVJNanqjpynibn6UqpWFdbz2zJScYm6TSxr
	FJ3GAQJgweJlHbxqrNnIIfmr1EJl6UGpd/aznAIMyHG16JwdIHKm37abMWeENv4gJHUECWOqWsb
	LdhGqgw2wIlb0b2xl7+iGH4jLZap1EC6/0k9dVdpvuZktB0mcQ5ZbXJ8K8Q+KOs0y
X-Gm-Gg: AeBDiesL8boVsL3AbeZdrWR11tFpAk8TzeTMX58g0tXCj0H0uQKiYRAHU1cS0ZUpNqN
	iKdgBpYVW7+ZaAIS+6WD5Qgo5wxvty5esXaMAEW7wrCzUT4EzkmfNNG/GtDnAjgEttk2k+iua+2
	ji6RxPSVnXoqoaxxcpaA7fweJo+nGWWKpXc9y03Bo7S22pSHU25mAg6P3sFMySZ5bRbzpUVP8uU
	xic8dawJ4GSeXTcmHgmho376naATuVFNLlI5Vt8Zv/BOHUkEHamqKipJYkhA7SftnumoJweQGNV
	dtJt4/mNDko1nMeQGqvDF9U909aoWYhJGPpb38vihPI4MMASxDjZdOskwWY+YYMeweitafU4TSK
	+VtEJCHvFNAX05YXb4YaFeZDV44RpjLu6FvV8NKEMmo1q9+6CL25Fhmg5Uwb8lK8H9jwBz7Vdw0
	gPy32+Yr0/ieG0SSDA
X-Received: by 2002:a05:7022:b87:b0:128:d375:f1d4 with SMTP id a92af1059eb24-12c73f98f83mr20905401c88.28.1777251180331;
        Sun, 26 Apr 2026 17:53:00 -0700 (PDT)
X-Received: by 2002:a05:7022:b87:b0:128:d375:f1d4 with SMTP id a92af1059eb24-12c73f98f83mr20905380c88.28.1777251179792;
        Sun, 26 Apr 2026 17:52:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dca2c1c16sm11449051c88.5.2026.04.26.17.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:52:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP mailbox controller
Date: Mon, 27 Apr 2026 08:52:36 +0800
Message-ID: <20260427005236.230106-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=69eeb385 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OYxAFmqQ0AEWrUtYbScA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: E_8k85OfuSjfSBzVmqYOt2ydO2JfkiWK
X-Proofpoint-GUID: E_8k85OfuSjfSBzVmqYOt2ydO2JfkiWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNiBTYWx0ZWRfXzeA3EJaEaBh0
 OVRbEUV+fn8jOAw7iEnS+kDpudiUXr71ClCrQedTG23EGkfid0ASophfD5g28Tp9QkMjYUyvQoX
 Mgaz7Fvo6RhYrtfolXHmXioCzl/TS86Qaxx/IBR78BdsPVL1D6Mri3Z0snn3Me50whOz6HNFsU2
 8sAwVYgavdTCxVxOqeXGv65UInp3ew4tkPW7GpwUu7OPBK1nl2cFrL7x/HGFxEOX2CJcP+bFMgb
 l7h24kWqzfLZgrF9x+XX1KPIDE1UwIc7DJ/E0wXppZGDysPX//aArwW59JqmRoJrHpbIwc7bFfU
 nQySvoOeQOoCW9RECCfELffw0DRbt62HhoYB7TeUqyzykbHVJp2OdLUAQJQDTdVNk0oj/+hbvHH
 UU/yenOTVFNrVdBM2IwDrtxoaqo0zw1RWkzHv9Sku/dL6a65bzeJOjJTqGVqfwdPJo7VBQv5bmq
 U6jCL//gPCcJFodblxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270006

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

The Nord SoC CPUCP mailbox supports 16 IPC channels, compared to 3 on
x1e80100. The existing driver hardcodes the channel count via a
compile-time constant (APSS_CPUCP_IPC_CHAN_SUPPORTED), making it
impossible to support hardware with a different number of channels.

Introduce a qcom_cpucp_mbox_data per-hardware configuration struct that
carries the channel count, and retrieve it via of_device_get_match_data()
at probe time. Switch the channel array from a fixed-size member to a
dynamically allocated buffer sized from the hardware data. Update the
x1e80100 entry to supply its own data struct, and add a new Nord entry
with num_chans = 16.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/mailbox/qcom-cpucp-mbox.c | 35 ++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 44f4ed15f818..862e45e8fbd5 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#define APSS_CPUCP_IPC_CHAN_SUPPORTED		3
 #define APSS_CPUCP_MBOX_CMD_OFF			0x4
 
 /* Tx Registers */
@@ -26,6 +25,14 @@
 #define APSS_CPUCP_RX_MBOX_EN			0x4c00
 #define APSS_CPUCP_RX_MBOX_CMD_MASK		GENMASK_ULL(63, 0)
 
+/**
+ * struct qcom_cpucp_mbox_data - Per-hardware mailbox configuration data
+ * @num_chans:			Number of IPC channels supported by this hardware
+ */
+struct qcom_cpucp_mbox_data {
+	int num_chans;
+};
+
 /**
  * struct qcom_cpucp_mbox - Holder for the mailbox driver
  * @chans:			The mailbox channel
@@ -34,7 +41,7 @@
  * @rx_base:			Base address of the CPUCP rx registers
  */
 struct qcom_cpucp_mbox {
-	struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
+	struct mbox_chan *chans;
 	struct mbox_controller mbox;
 	void __iomem *tx_base;
 	void __iomem *rx_base;
@@ -53,7 +60,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
 
 	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
 
-	for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN_SUPPORTED) {
+	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
 		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
 		struct mbox_chan *chan = &cpucp->chans[i];
 		unsigned long flags;
@@ -112,15 +119,24 @@ static const struct mbox_chan_ops qcom_cpucp_mbox_chan_ops = {
 
 static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
 {
+	const struct qcom_cpucp_mbox_data *data;
 	struct device *dev = &pdev->dev;
 	struct qcom_cpucp_mbox *cpucp;
 	struct mbox_controller *mbox;
 	int irq, ret;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return dev_err_probe(dev, -EINVAL, "No match data found\n");
+
 	cpucp = devm_kzalloc(dev, sizeof(*cpucp), GFP_KERNEL);
 	if (!cpucp)
 		return -ENOMEM;
 
+	cpucp->chans = devm_kcalloc(dev, data->num_chans, sizeof(*cpucp->chans), GFP_KERNEL);
+	if (!cpucp->chans)
+		return -ENOMEM;
+
 	cpucp->rx_base = devm_of_iomap(dev, dev->of_node, 0, NULL);
 	if (IS_ERR(cpucp->rx_base))
 		return PTR_ERR(cpucp->rx_base);
@@ -146,7 +162,7 @@ static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
 
 	mbox = &cpucp->mbox;
 	mbox->dev = dev;
-	mbox->num_chans = APSS_CPUCP_IPC_CHAN_SUPPORTED;
+	mbox->num_chans = data->num_chans;
 	mbox->chans = cpucp->chans;
 	mbox->ops = &qcom_cpucp_mbox_chan_ops;
 
@@ -157,8 +173,17 @@ static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct qcom_cpucp_mbox_data qcom_x1e80100_mbox_data = {
+	.num_chans = 3,
+};
+
+static const struct qcom_cpucp_mbox_data qcom_nord_mbox_data = {
+	.num_chans = 16,
+};
+
 static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
-	{ .compatible = "qcom,x1e80100-cpucp-mbox" },
+	{ .compatible = "qcom,nord-cpucp-mbox", .data = &qcom_nord_mbox_data },
+	{ .compatible = "qcom,x1e80100-cpucp-mbox", .data = &qcom_x1e80100_mbox_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
-- 
2.43.0

