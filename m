Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792902103;
	b=qvZJuUOXDssJlKo5aS4TdSLH/otf0CcsZL82ofG01NpkoKLtcBf1aYuRS8uI1ow+7PrO
	 lE6YMKwjhHQ0kv4P2mGMdBnqsn4e/FsFxoCOUhi60fIDuz9bjYb0VOLk0FYOZYif4zqUY
	 L7iJ/1E+RgYtJcwJh01mOisWkBEoT6rKep4/SAd8oIDxWAoA65tT/Fqf4iiBrQCeycIhQ
	 YPv92R1nfOlnQHuvVzMaNlNM/jkALA9avCVoTs6LQihAjtjq1u2Y8rPCN3JkAoUbSNMWi
	 BIJVGrpXyZVHcoDZJv8sqmUDHgPKz3GQ1uTmVsAog2laAy4MqZgdY7NTDRCLIhlPkSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792902103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gqe9/wURKqdOT1UabYNdxAv4jjOqbP4c8eLmyHIJEnI=;
	b=KflwKbtlTtXzDGYO2RNAXd7IIOquK/78Xy3Z+s/FSceGzEMlhXB3A9rBZTULurOEvq4I
	 4zQedPmKL1L9ne0toVj7nhnyl70nhcKZD38xM/2lFOEbGOujzlFBVudK4NLU+aiOt6WM1
	 zU6pBr+c6fLanCwv1J2gzFRNVFF/ahc7Plu0hknzmIrGvuhBl+XOwYiVFBTG93r5u4rfa
	 g1pienxKniD/JKVQeyxwTUaY4P//uE8DZl0X9TgmKNgMdahy8tPY418mv4m9PDXm41GKv
	 m2kTyWQDKICsqZVoMAYZXOEhOMT5KYAEMhvTJoR0s4ZmuPo+nDCJtdM08iVnLTwyF2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VadF36wZ;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47837606A33E
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 04:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47837606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VadF36wZ
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1931ff67a29so4190321c88.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 21:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792902101; x=1793506901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gqe9/wURKqdOT1UabYNdxAv4jjOqbP4c8eLmyHIJEnI=;
        b=VadF36wZPk9pirZHFomcGHWeLccH/EfN2avZYdf3Ew9s8Jnq8ypKZd2X2PY3Npuhqa
         PQdCIsUetHJxJIHdN9pepuVGECZjjtu+9cVJ6GLlSp3Jy4Uf0KKXB7YkaWm6UONOCcrW
         Z6BTrIwCyc715BPpljaU7uve370iWU7NkTHDWZhFVympH4aUbaB4ZTIe3hwzstKKDe94
         sf202CUy6Et+clqkYWCLsoW0wC/oYmSD9+USPrWgUyAbrb1HdJi+3diliVsPrmScyMel
         EOTP8gkZyPD9zGUkdlFyAt5567hPRiYhJlzmilq9V702mLFGbX6nNgqXZ4PAbEjgjdBG
         SE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792902101; x=1793506901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gqe9/wURKqdOT1UabYNdxAv4jjOqbP4c8eLmyHIJEnI=;
        b=vQW3XtfW3D302Z5Gs+jXQMm5vysyCRXrQfIw/7U8+zHAwOGX0WKad2AgDNdSOjdcU5
         K8cK8A1Fsn5pKgqpZNqDz9yIEz+tV+CWqto3sMnXYUejJt8+kiCjkjy8eSnvFdBinekF
         Ko7NRfULms6Ul195Vex2OUF11tHp+VdDoV9i1MjWuh3nt7s9K1Tcxy/S5FPKXZ9sAUUi
         obwXa+ocKnajAy4V8QXyKZ554sSRfq8LI7NWjDUD9ygo19dYXm7lvd4vSn43IE/nAflj
         3vNO5FhvcVRT+CwXgdD0MTT/dw92f1bg1yTsIzdjOnbDYi1qBUjBa43Ifg4P3j+tufYI
         Kgjg==
X-Forwarded-Encrypted: i=1; AKwUvBwE6ld9i4ycjmvpn8kTjalzYn5ak2CkBOWptdlKOj0OJQi4Gp7wysBmgxc8v/RHStmNbgmgbMZ2CoZp@vger.kernel.org
X-Gm-Message-State: AFq9FYKNJyEO894rYY85BGTPI9HOtls/L2/g6aE9EQgdzFwlzLCy0LiG
	N4kKhu96QtDLLq9gyIC9avm+TabS+/GisPiAbB8qD2828+A40KBzttQS
X-Gm-Gg: AYBFou0ka7tr0O08RLT1YKU5L9QLQyS6zUHdHAzcTXDR71Gt0z2EEbJVK+JKOgTWCiW
	5FWNZyTxAQ1WpzxJs+HbNqdl3es+hr+mRzEPDhWGKoc5G0N+900+TOVeVIiDiqYygZjH5Hd2/wq
	4tyC1oUsrRkoiVJ0jA3p/ixQWFn3HS2shWYmH4j4scALdeQucHNcZXxINRfEvO1WvGLWGSEUdkN
	rdBb+75AnpZKuCv0N3B3w5ucgxAis3U0Fl/lswEti5NiTo0FvsORyEoP5OhgC34bQMGqI+Qeh8U
	p/MXrW7Qgw1wnht4voHj/rVefEfKFT3fSeLSdm5M8GFaYEJ41CE8Ari4yYX/QfoPRAyuZbixUxj
	knL8o0pRgbAKO/bUUCaMHyTYhWHgAz7YeluldE1MCLByLWbHCEeWQuvJ8JzbbSPTcXHadXRmCVk
	eq+s/1pUlvmC1cj7DOzjsJKlo3ugc3l75wzCI0KSslCKbBc+YA/SKrNWruZB7KHl4A3pt6nhtGR
	Y+9MrB5aYGDvlMsKkXDRrBWrkLdsMg3UViGaWBXnWgwQd+ujg0q0OKC5IbzB59znyUVkUawMc4p
X-Received: by 2002:a05:701b:4587:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1993499dc8amr4576394c88.16.1792902101335;
        Sat, 24 Oct 2026 21:21:41 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm14037825c88.11.2026.10.24.21.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:21:40 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	manikanta.mylavarapu@oss.qualcomm.com,
	varadarajan.narayanan@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 2/2] remoteproc: qcom: wcss-sec: add IPQ8074 support
Date: Sat, 24 Oct 2026 21:21:00 -0700
Message-ID: <20261025042100.1356088-3-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025042100.1356088-1-dencity7@gmail.com>
References: <20261025042100.1356088-1-dencity7@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add IPQ8074, which uses PAS ID 6 and needs the PRNG AHB clock enabled.

IPQ8074 firmware ships M3 as a separate image whose load address differs
from Q6's. When the node names its regions "q6" and "m3" and gives a
second firmware name, map the M3 region and load the M3 image into it
before the authenticated Q6 image, keeping the order the firmware has
been used with. Load M3 without updating the Q6 relocation base so
da_to_va() keeps translating Q6 addresses. A missing or failed M3 load
stops the Q6 load. Probe fails for a malformed named configuration
(wrong names or counts, a compatible without separate M3 support, or
overlapping regions) instead of picking a different loading policy.

Without memory-region-names nothing changes: extra regions remain
coredump-only.

Tested on a Netgear RAX120 v1 (IPQ8074 hw1.0, WLAN.HK.2.0-01792) only
with the equivalent change on OpenWrt's earlier copy of this driver.

Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss_sec.c | 97 ++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
index 4837825d1..a4ebb79d0 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss_sec.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
@@ -7,6 +7,7 @@
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
@@ -30,6 +31,10 @@ struct wcss_sec {
 	phys_addr_t mem_reloc;
 	void *mem_region;
 	size_t mem_size;
+	phys_addr_t m3_phys;
+	void *m3_region;
+	size_t m3_size;
+	const char *m3_fw_name;
 	const struct wcss_data *desc;
 };
 
@@ -37,6 +42,7 @@ struct wcss_data {
 	u32 pasid;
 	const char *ss_name;
 	bool auto_boot;
+	bool separate_m3;
 };
 
 static int wcss_sec_start(struct rproc *rproc)
@@ -106,12 +112,43 @@ static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
 	return wcss->mem_region + offset;
 }
 
+/*
+ * IPQ8074 firmware ships M3 as a separate image with its own load address.
+ * Load it into its own reserved region before the authenticated Q6 image.
+ */
+static int wcss_sec_load_m3(struct wcss_sec *wcss)
+{
+	const struct firmware *fw;
+	int ret;
+
+	ret = request_firmware(&fw, wcss->m3_fw_name, wcss->dev);
+	if (ret)
+		return ret;
+
+	/* M3 relocation must not overwrite Q6's da_to_va translation base. */
+	ret = qcom_mdt_load_no_init(wcss->dev, fw, wcss->m3_fw_name,
+				    wcss->m3_region, wcss->m3_phys,
+				    wcss->m3_size, NULL);
+	release_firmware(fw);
+
+	return ret;
+}
+
 static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct wcss_sec *wcss = rproc->priv;
 	struct device *dev = wcss->dev;
 	int ret;
 
+	if (wcss->m3_region) {
+		ret = wcss_sec_load_m3(wcss);
+		if (ret) {
+			dev_err(dev, "unable to load M3 firmware: %pe\n",
+				ERR_PTR(ret));
+			return ret;
+		}
+	}
+
 	ret = qcom_mdt_load(dev, fw, rproc->firmware, wcss->desc->pasid, wcss->mem_region,
 			    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
 	if (ret)
@@ -206,6 +243,51 @@ static const struct rproc_ops wcss_sec_ops = {
 	.parse_fw = wcss_sec_dump_segments,
 };
 
+static int wcss_sec_alloc_m3_region(struct wcss_sec *wcss)
+{
+	struct device *dev = wcss->dev;
+	struct device_node *np = dev->of_node;
+	phys_addr_t q6_end, m3_end;
+	struct resource res;
+	int ret;
+
+	/* Unnamed extra regions keep their existing coredump-only meaning. */
+	if (!of_property_present(np, "memory-region-names"))
+		return 0;
+
+	if (!wcss->desc->separate_m3 ||
+	    of_property_count_strings(np, "memory-region-names") != 2 ||
+	    of_property_match_string(np, "memory-region-names", "q6") != 0 ||
+	    of_property_match_string(np, "memory-region-names", "m3") != 1 ||
+	    of_reserved_mem_region_count(np) != 2 ||
+	    of_property_read_string_index(np, "firmware-name", 1,
+					  &wcss->m3_fw_name))
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid separate M3 configuration\n");
+
+	ret = of_reserved_mem_region_to_resource(np, 1, &res);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to acquire M3 region\n");
+
+	if (!wcss->mem_size || !resource_size(&res) ||
+	    check_add_overflow(wcss->mem_phys, (phys_addr_t)wcss->mem_size,
+			       &q6_end) ||
+	    check_add_overflow((phys_addr_t)res.start,
+			       (phys_addr_t)resource_size(&res), &m3_end) ||
+	    (wcss->mem_phys < m3_end && res.start < q6_end))
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid or overlapping Q6/M3 regions\n");
+
+	wcss->m3_phys = res.start;
+	wcss->m3_size = resource_size(&res);
+	wcss->m3_region = devm_ioremap_resource_wc(dev, &res);
+	if (IS_ERR(wcss->m3_region))
+		return dev_err_probe(dev, PTR_ERR(wcss->m3_region),
+				     "unable to map M3 region %pR\n", &res);
+
+	return 0;
+}
+
 static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
 {
 	struct device *dev = wcss->dev;
@@ -227,7 +309,7 @@ static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
 		return PTR_ERR(wcss->mem_region);
 	}
 
-	return 0;
+	return wcss_sec_alloc_m3_region(wcss);
 }
 
 static int wcss_sec_probe(struct platform_device *pdev)
@@ -237,6 +319,7 @@ static int wcss_sec_probe(struct platform_device *pdev)
 	struct wcss_sec *wcss;
 	struct clk *sleep_clk;
 	struct clk *int_clk;
+	struct clk *prng_clk;
 	struct rproc *rproc;
 	int ret;
 
@@ -270,6 +353,11 @@ static int wcss_sec_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(int_clk),
 				     "Failed to get interconnect clock\n");
 
+	prng_clk = devm_clk_get_optional_enabled(&pdev->dev, "prng");
+	if (IS_ERR(prng_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(prng_clk),
+				     "Failed to get prng clock\n");
+
 	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
 			     WCSS_CRASH_REASON, NULL, NULL);
 	if (ret)
@@ -310,6 +398,12 @@ static const struct wcss_data wcss_sec_ipq5332_res_init = {
 	.ss_name = "q6wcss",
 };
 
+static const struct wcss_data wcss_sec_ipq8074_res_init = {
+	.pasid = WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+	.separate_m3 = true,
+};
+
 static const struct wcss_data wcss_sec_ipq9574_res_init = {
 	.pasid = WCSS_PAS_ID,
 	.ss_name = "q6wcss",
@@ -318,6 +412,7 @@ static const struct wcss_data wcss_sec_ipq9574_res_init = {
 static const struct of_device_id wcss_sec_of_match[] = {
 	{ .compatible = "qcom,ipq5018-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
 	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
+	{ .compatible = "qcom,ipq8074-wcss-sec-pil", .data = &wcss_sec_ipq8074_res_init },
 	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
 	{ },
 };
-- 
2.47.3

