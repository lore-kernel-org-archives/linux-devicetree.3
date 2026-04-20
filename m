Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3E3803CE
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657139; cv=none; b=RFUWgpvTYc4TI/bzgUBTgGdQzyFbfL87CFwF9N8ectEMIduUSNUtiGHllbBBKWVUu6MkVaJV8pQGQzcbszfixUkfHwdRRtS3sZA5jrB+wLsmyPVwOQOdvmJ/l7hA0v8p93bSta4gD28vMp/2ROsZVUEVEg2xw86syx4jnlmMs/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657139; c=relaxed/simple;
	bh=qEPubHN/en3xJSrIY0y5ea9J1NGOSU02/DAZIFKb9Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmiT9/w2nOpw+OjhwFgeIZpdichpGO6zai7togeXCSjJaasG7NVnPpq+eB0L/ZidlF0pDq4oDbF/1aEsTZahAhIE8Bftjx8FTPH99/+sywP+aYC9HiYjySyN7mBgaXOKpw2r/hkJXuuJyk+36kSI97HUMCbgz318gzn9wIGUuCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzlCVUtu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkIIYgTf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzlCVUtu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkIIYgTf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J7Kstj2703900
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iqLM1jQE5Y+
	PUN2YvZ5CDChRnmyQOGitI/me3zx9dy4=; b=hzlCVUtu1Rq3p0jbnyNFNOQ2aKI
	eqwRJCb3i9bAxOsGLnVimaDTAOKA0sllD/brxhPo+Wd0jSQpSRyRTbvguhwgcYWV
	mvdoNKEP5n/tcPjoqS6tSJQJ89flq6LKeaPbPjx3JLZ0VU0mFej/UG9sZdoxHi04
	Mpt3SGlXwXc8M4HbP7uhJNGfwopySojfP0xNda8uk2u14UbzDZHiCGv+MHXFT9G/
	1/Z7ldiQ7Ad+nGQW4fe8MyMg47r6BXPECrQXGF+x54ftHYHjpybNxK/YPt85qTNw
	hYXWWlS1UBIwUnZRe9GW7D2faahDgFr+ocK1HcIC1iok+qEkkfNJwUk+NGg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261uvjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:52:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c73b00bd1so4182627c88.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 20:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776657136; x=1777261936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqLM1jQE5Y+PUN2YvZ5CDChRnmyQOGitI/me3zx9dy4=;
        b=BkIIYgTfVu+AMCkgXnFsd9ojZA1HKADX3G4QJoP1o7BLD6r9Ua0hSk0D8UzlMhLsyJ
         vM1Vj6zLkGcKtagsy++tcCZW3U3klVmKI3ldhw/752Z53qLzBT3i/h2CoG0wbEhDfjj1
         Q7pmFYp+LGWF8QMeiYD43sslmxGp1Z2LfuYzoZIZMIFkqNHoCLHI/92ecEgPapekr3H5
         yX5XvogxBR/wFBvI2uDuzCTmT9MSge00misyJhKzjgUbjKDE1nxbfkEW6vRoDVm6/l4M
         T4iSp7Ekdrgu8Lw7Xswofhwn7AZSsD+YA0+EA98Xy7Lh/GE+TnD49pF1ZFURyqvEBCxM
         Mfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776657136; x=1777261936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iqLM1jQE5Y+PUN2YvZ5CDChRnmyQOGitI/me3zx9dy4=;
        b=EXSq++WX/BOYRo/hVF2oflyLWbjBU0JcJHogc/eDZGMs29ElXSej1rB5JBtSlolVNR
         lU/rEpkPJYkvr9OOXfFfzG4R5X7T7q6HcidvGBFmik7GE88tIe8nbx9d4IVSFbgNH/6V
         DyBj8wk6A/K2NyfkDgfLFddqaCLGenDb866ij2+qAznsQGqJl1ru5P/iuWIQ6oOynv9f
         1ctvjZK6u/JGfbqHBkTFNtHK9c18Bqlo+cqwG7mN2s4VAPDw8nle5c0BxbrnkSp5kyqj
         DE2ic/6TwSj+i/bZMcBkp/iZ2m7SYXAg6U32JA99sGTi4byTuPZkB+yLgv593IjbMg8d
         P7Eg==
X-Forwarded-Encrypted: i=1; AFNElJ+jJfWvKkTo+nhCbCoLq+t5HJ2UT5DmfJAxK+wzXEhi6T1RFLwWArrsmWd6TsGc2angXA7yJhUVrdw9@vger.kernel.org
X-Gm-Message-State: AOJu0YxUHAifiRfLgUPkdkMkY5D3DQz0b0oTF04enQOgZ7A/Lma/h5aa
	HZXGedj9Jt5Soij3TpRxGz+xURL1IJkldn/o9eagTpYyW3mGniucYWA7+8tjQ0/iAhfzKaNFNEQ
	xteVVmc2MD8Qhcw3u51cQGsSRtcBQngjSgCrdr4NCOEhD0/v+cwvO5+qG5WFYV0bc
X-Gm-Gg: AeBDietQ1aaYRGSHAJXJd5anG/l2RrYWQdU+QGqBbOYXpVc85IpOL24eGducDUY6p4b
	pNQOE++gsKDhbgiMVWcvWebONMzdEsv+W75wDYo5tc03dLoOiQZLmc9FzNhlZzLOtDN1+5QJ0Nc
	oExNeniTcK06Hr1WLLujXJfjmMlsfUNEct0H96dWCnAeWXqpuV/IrFKVPZgkdfJBbsLbNAXF3GQ
	cRePpyEQ8miaqYeulJrGiDs8BJYDcyR1jW8YyxKC2q9iqCUoJXIayTP9I/o2wYTWjYTwlBdUxUu
	zbztLVxoyCYQxgPXOLJuCSGHo+hLzmLhfICTXN3WuxTXaCHJhrnrSJqxtGScK0B7AcYXdAXGN3z
	9hXxiK9fMLga7bUgFjzo8j2ah13Kcvny2XXLgneXBa1VW5TtnRUAku/MgMoaewzSM6ynyITnmxb
	TTTHo6UJ8Vrax+z2Cx
X-Received: by 2002:a05:7022:ff45:b0:128:ca6f:adf2 with SMTP id a92af1059eb24-12c73fae276mr7457629c88.32.1776657136501;
        Sun, 19 Apr 2026 20:52:16 -0700 (PDT)
X-Received: by 2002:a05:7022:ff45:b0:128:ca6f:adf2 with SMTP id a92af1059eb24-12c73fae276mr7457589c88.32.1776657135906;
        Sun, 19 Apr 2026 20:52:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20c55sm13056111c88.13.2026.04.19.20.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 20:52:15 -0700 (PDT)
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
Subject: [PATCH 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP mailbox controller
Date: Mon, 20 Apr 2026 11:49:32 +0800
Message-ID: <20260420034932.1247344-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzMyBTYWx0ZWRfXwY+7Vsp4aTcl
 BiapHjipM8O4qmbQj6qVOwDOB22rN70Z4+59KAR0+b7udLyohLI+IiaIt33tXRR/Kd/nnI26zi2
 2vVkMtjvGYe61Pr3qBXsghF1l85LpMpdIMCvU8XL0ZHBwNzaUM+ygyWY0zfIsKK+m3VL29k1n81
 McEdvJ7hHvmo2/aVZoOEFiRxvyhHtq6OyYukxUpnkwldZeCMQTrU6igLFfZt7a/dk3Yj87vtxEn
 Xi6eFz4B1tWE4aZma6hVSL8ICLivYLVcWMXNCHFb7ebg1U3lZdXlSyHBv+avha6Usts+VtQwH5C
 PJ9l3Z9ZPtqNCVgGtF7XwlVUospzqNjc6DvXDsF+o0x/peDGW3rdeRGicyQqOnkMHLRkUWdcnEe
 ucczCiriS4lyCdJJr21meGX8VIp+Y24o/5WoLuk4vfrnVTyLEBDNURhC4Evw2ik2bkT+8LcnoIm
 BVsymLf1jlZlMSMhthA==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e5a2f1 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OYxAFmqQ0AEWrUtYbScA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: Gg61hIIBgNYWL1luUqok_hDv4lDKLyqC
X-Proofpoint-GUID: Gg61hIIBgNYWL1luUqok_hDv4lDKLyqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200033

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
 drivers/mailbox/qcom-cpucp-mbox.c | 37 ++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 44f4ed15f818..624a4e9eb6c6 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#define APSS_CPUCP_IPC_CHAN_SUPPORTED		3
 #define APSS_CPUCP_MBOX_CMD_OFF			0x4
 
 /* Tx Registers */
@@ -26,15 +25,23 @@
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
- * @chans:			The mailbox channel
+ * @chans:			The mailbox channels (dynamically allocated)
  * @mbox:			The mailbox controller
  * @tx_base:			Base address of the CPUCP tx registers
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

