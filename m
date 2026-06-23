Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C43D1CC1
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226363; cv=none; b=HknfXGQBRCxy4Vyqj7vUErBG0HOJf4YeSWWIAr4js4QQE5iGhpQqYc733K8k9cN9Ybdu/41q1bkRWAxWlzjuQeffEskwYxZSf35j5fIJ+J0UixHGLs1SFMunn4PsZgXOYi9Kgj1d1eeBSoWQmqQxHL3gNJrFzupMho18bMb0mk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226363; c=relaxed/simple;
	bh=CADuPPHBFTGamZXiLDVwfcLPxeezA49Zbw+re0HVbOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPSVL65eKMtfGK0Wa4qUM7L9Dz916zQUwLFOnD2dn+Mlccccb++z06HMM5MmTC46ebfDo6tXCSBeuEqqJXGPSfPNBVC2NXXsCQ09GNo6rPC8e7xY743zs92FK6F5pHrFQh1tO8S4lSNKT2cKE789PTL7u3K2BLtEWKfeIaeJcpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLwOCHlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gK4oJD72; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLwOCHlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gK4oJD72"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYdl4113363
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B0ZrDubUMv3
	UsfDfx0OoaWw1HQVC6S6Wq7xyx/eBxqU=; b=HLwOCHlmT0pbctt3AL2B4KECHEQ
	z96FH19Yupn/8HcDB6GeB3eXnyFaMGwi6N8bB5k6xClW5CECYyF/NQMH3JIkVlR1
	gzfkY9lCq7iv6eAQx9hlCNbJCoh/guJmGx64+vcKzJAch5gd/htA0lGUhbz63F4S
	ZO6BOPNCU+9/e5COQ0IiG7f53GfeVmwvB0Nfx1jRxDMOBQeLw32KZD6br02NS168
	0dqWIIMC1kD/YC148Oaagg/wO0Cc/3rokwys9bXWAHhh7RB2UwodpiPskui3dcG9
	lnfZNV0SlH3tF8NZAt9ghefIOvEJRHBoTxbqFT0H8piATX1wvn/SLH1yNDA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvt392-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c554284973so6936075137.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226360; x=1782831160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0ZrDubUMv3UsfDfx0OoaWw1HQVC6S6Wq7xyx/eBxqU=;
        b=gK4oJD72eBZHQAQnT6xf1EzGpzR7+vEyfGJJMfRzZDY+Ky4cvZF0h0ntt2iVwRpUB2
         JWI4ugXHOxFp0eDPa3gTQ4SwGLJDvjS7UYMIfPDj/82ep7uFVdpwX6cqxzC7QNUWZ+Sw
         3JAq36TXz4Mo8osdFOH6cyqUI+WNngmrKGwDxVrStQcd80vS/YpjstESciXquujK0wXv
         JRu/3WUHsNvpeCumoW0c8QTXjqTwHPuedWugH9qP50bBA+OcHzvYzDMDzcKoiB0QJxjC
         ScG3ivR5/o7/KxIpXxKj58G6aWpUb2Ey92z1bageiGMCKMtMPNwo08vH5qAS4sfr/c+f
         u+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226360; x=1782831160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0ZrDubUMv3UsfDfx0OoaWw1HQVC6S6Wq7xyx/eBxqU=;
        b=fwtftQrjudKmHOdnbCKmrBYZqBr2Rb1ToddfBw2hri9YY7e2/yVuOzpUWfuRH/ohwP
         akAkcx5N0wusBi4ilstgAd1jcrekUzd0OBrtpEFnWXUNWzbtQmV2EuTnDiyDK5aa/QVP
         A8/KRzlUHuBZYpxtNXR8W5uFag0LSLi7P+kYCh5ionsgjmxkq0AWiiPFtNql3t4WEx8I
         WZvuMEf8tNt0bwjT1Cg5lAOCy59MY2CqtD0yTVoL8Ea+q3Dy5KU2d2wHbGEtWNKmcStk
         rRVS7kbt6yh+McjT7pQJUlWAeXueDBCT+tfBl+jtRrUbVyxNi67TL7AD5dCUTvD4gHud
         V0bg==
X-Forwarded-Encrypted: i=1; AFNElJ8B2DNHGPqe9liZN6yVNg3BGBpD/uF94mteyu9xCPP6JaHQlKRrQhFhJt4fQXetLAdvFESMhN8u9vut@vger.kernel.org
X-Gm-Message-State: AOJu0YzOuEhJMhmlDoVwnHQ5momiI8WdRuN+pLU12HofgpXMlBclyiEW
	Ic/t+/moLFPkUswupZyadpUQvYFlh78ZZgNGjxfUpkxN/suw/eQIvJiXDjpGS9qcQx/tCXrBpVs
	5UtMJrtX0XWmdMY8i35pDPsQcP7S3rHDqV3FBiFZR84a4QjoP+bY9usY1mP7iqs20ZS74rRNj
X-Gm-Gg: AfdE7ckCIuz6jkv9OsOUeHzcZreaRhE8cnXC41xQ1mIR82bXTSZClMcQlYUEgX/5h8g
	9Ly/Os9YM6HzHJviOjP7Du3LPdgoYmmvZqpFotN2E5vPRchhixyAwwn1dkl7WSv+i7hroV+5e0Z
	KspnEBkFcosJ/YbvakRcNjZyZSLn1+Faqf742ZhXsjCXqDvmIPpP+b+q0XYQ4hPUatyUBOgrAYl
	9JIuvRLwRz5L/QOZI+JfHWFn1DKwITzFPhvMJ6ODqrEVH7Btn5u/srL7gNbFZw0dgq6NGnd/H2b
	BIvRfZ98692S+KtzUbT/Ib0XagoRX9Pq5h0yf7Zku8SmW/VXv4jDBzTYe5k5RQaqaK3H1mHZihk
	zq06ED89VIVheuPrQHfI5AxmTReaZaKHBctRrRTDjGTcElhOv7AV+VPlOveaWn676Va/7rjAX+n
	Tpg7kz+TGlSPc+QiCStaMjYeEipg==
X-Received: by 2002:a05:6102:685d:b0:72b:a25a:60bb with SMTP id ada2fe7eead31-72ba25a669fmr6040860137.10.1782226360209;
        Tue, 23 Jun 2026 07:52:40 -0700 (PDT)
X-Received: by 2002:a05:6102:685d:b0:72b:a25a:60bb with SMTP id ada2fe7eead31-72ba25a669fmr6040778137.10.1782226358197;
        Tue, 23 Jun 2026 07:52:38 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:36 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 06/12] ACPI: scan: Retry acpi_device_notify() in DT-ACPI hybrid mode
Date: Tue, 23 Jun 2026 16:52:19 +0200
Message-ID: <20260623145225.143218-7-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a9db8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=wPdX0GlK9JqYqbOWQHgA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX65qtM65WFWxY
 zAIjGIfpLgORdjrQVz8oFSFLTifRNGOriJZwEkY50XLEdCamgT1M3bnj2o5mhmPXkPegALE/+IR
 omQSZSmO+FXn1orHS9DWzCH6SF4Ag/c=
X-Proofpoint-ORIG-GUID: NXkIlH-OLJXSEzVrKLd6u3-nuFrmQUKA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX3N9BwBnmMgNb
 GoeEEcoAHqui9Ad0hhh/myuuUoT2buGlsumqpYkqi9nc1Y0Shx1KCBIO7CwrDfsWViNgstCDmmM
 9ghvkqEPVsMtepNYXFBo9m799+eG5661RoZclyG1o1hsoBnuW10ORbtsOqKyNgeWEhwF37qEgGo
 4X7gp/cSff+goLsyFi4SDQu7/pa1kE2Aiaz9Kj6eqww1NsR9LKJahtyapjwSQcPLRJNznQw3B37
 Q3zt9E9PZyq5UraTyXgMxORlASlOY+PtDRA+6J6UxZbV7PlrM/5WLN0ps95Xc9lNJATCy9YUsSF
 1qchQKvHW3+X9aIltPQ6aHoIw5QDtNHSwODHGYxb9DhTUBXLR3S+u80lw3UHDfsAsP6NCmEJvzK
 4VDP01M8Gtm7rmH9TfwyfJAWWxLpHhxZKtPT8qqQG1XZWujs553nSDo1mPhc691k3fnFSsI1glK
 f4rS9pdz2/9wjWHCWoA==
X-Proofpoint-GUID: NXkIlH-OLJXSEzVrKLd6u3-nuFrmQUKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122

of_platform_default_populate_init creates DT platform devices from
an arch_initcall(), so before acpi_scan_init() runs this causing
acpi_device_notify() to be unable to honor "acpi-path" properties
in DT-ACPI hybrid mode.

Re-call acpi_device_notify() at the end of scanning ACPI devices to
fix this up.

Note this relies on the driver which may use the bound ACPI fwnode
to only register after subsys_initcall(acpi_init) has run.

TODO: It is probably better to add an acpi_platform_device_pre_probe()
function and call that from drivers/base/platform.c:platform_probe() and
dot the setting of the secondary fwnode for platform-devices with
an "acpi-path" property there. Basically moving the "if (acpi_dt_hybrid)"
block in acpi_device_notify() to a new acpi_platform_device_pre_probe().

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/acpi/scan.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 4836286968e8..b305c03e8504 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -21,6 +21,7 @@
 #include <linux/dmi.h>
 #include <linux/dma-map-ops.h>
 #include <linux/platform_data/x86/apple.h>
+#include <linux/platform_device.h>
 #include <linux/pgtable.h>
 #include <linux/crc32.h>
 #include <linux/dma-direct.h>
@@ -2818,6 +2819,22 @@ static void __init acpi_get_spcr_uart_addr(void)
 	acpi_put_table((struct acpi_table_header *)spcr_ptr);
 }
 
+static int acpi_scan_retry_of_acpi_binding(struct device *dev, void *data)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	const char *acpi_path;
+
+	/* Check primary fwnode is OF and secondary fwnode is not yet ACPI */
+	if (!is_of_node(fwnode) || is_acpi_device_node(fwnode->secondary))
+		return 0;
+
+	/* If there is an "acpi-path" property retry binding ACPI fwnode */
+	if (of_property_read_string(dev->of_node, "acpi-path", &acpi_path) == 0)
+		acpi_device_notify(dev);
+
+	return 0;
+}
+
 static bool acpi_scan_initialized;
 
 void __init acpi_scan_init(void)
@@ -2881,6 +2898,18 @@ void __init acpi_scan_init(void)
 	if (!acpi_gbl_reduced_hardware)
 		acpi_bus_scan_fixed();
 
+	/*
+	 * of_platform_default_populate_init creates DT platform devices from
+	 * an arch_initcall(), so before acpi_scan_init() runs this causing
+	 * acpi_device_notify() to be unable to honor "acpi-path" properties
+	 * in DT-ACPI hybrid mode. Re-call acpi_device_notify() to fix this up.
+	 * Note this relies on the driver which may use the bound ACPI fwnode
+	 * to only register after subsys_initcall(acpi_init) has run.
+	 */
+	if (acpi_dt_hybrid)
+		bus_for_each_dev(&platform_bus_type, NULL, NULL,
+				 acpi_scan_retry_of_acpi_binding);
+
 	acpi_turn_off_unused_power_resources();
 
 	acpi_scan_initialized = true;
-- 
2.54.0

