Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D553AEF24
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640297; cv=none; b=gJ7mCr4vi2OYhUo9X1qzIoxqVSmEGjhOrMnlerSeeABS3C8QGgdrw/R18fNfZ1uBbSMvb5lXHO/wXp8is/a1zBywXGGOEhECT17JNaqjHY5rMQag85ruuyhJ/cNKYO3Tg5xGv80rdC8M8vmPyhYLuwV0wX/r8O/ZCc+ARfOudI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640297; c=relaxed/simple;
	bh=CyI3VfpN7ZvgkmfHWVT3f4/oL+YMTP8zz6uM1V5D2I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFyTPBIddMUw7vi7EgND/G/wUGY4ODUUW6QUVAEjpvQzBaPA4j0dqSZlC2Fjxjq9W21P2Dl2EwFGJhjse8YXdxZSpas8JjhpceKCToskao/eTSivfJSmHqVZFxG5Knsb7hltTExeDcuupMD/VJ/C+MRw3kh61jcyiOW+JRwsk5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckYXAHeX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWYzzX6t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckYXAHeX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWYzzX6t"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387XkMk1259505
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDvhAf2B9DrbLm4bHF1kl57Fvn2pa47nhjegElwkOHo=; b=ckYXAHeX2DZAVL0h
	T1oL24KRmw433Q2fXGuZzfpimH/Op1Q7IDiKVUyjumU5Y/E6bR4VkMMycXfJPKmE
	5Vl8Q9Kwt93tvKNyorZexvZMtxICZh/EZ4l1ec/4I8eJLGRBFnVhLhxSjf0TZ1Xl
	mMgOXBY2Dd1u8gaQPQ9p8NfDfvp5VUiyQM1vsKGTl92S5HZoNSJxbwUa8dy4Zti3
	XRtrsdWCHWxP+qsC7iLoWJC7FlxEYgklG/eHGmQxMtmsj7xxGUuwdLfWxSQ0Tur5
	/noXrfEI5Eievoa0pHBjUyV0N1wF4mpntXnqQ1kfxPM4JCJl585h5rqLnlo2ME/8
	q4/MGg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttsums-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:24:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so3864451a12.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640294; x=1776245094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDvhAf2B9DrbLm4bHF1kl57Fvn2pa47nhjegElwkOHo=;
        b=IWYzzX6tln97v76JqwFL+deynHIljJ+n362kDh3e891N6h2fEZH+Ek9VrGhxD4QZGF
         2TL4C9yVzzK9aJJ3kOS+Y1y5JlVjGuYXZIfnvOl81pFuSJQVnYqI1u6eQHHoPEoiJ1Ad
         d+F1QYMxeJJBrsxtFqnZi9+d4qfLv5aZYtIA4aje8jvcEGPNJsgxeF+dxY3i0EA18OQC
         d1jHSDgS+Y+31wWfCQQnFDwipPZR51ij01HgeRbnnuMq5twyH+dv479Da/fLkafFtyOG
         N1XsbJD8A6s9+yosm2WonAiDIfsz+EsRPOJtrm90w773HtPO+p/BXKobHx5Un5fvH+yv
         XiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640294; x=1776245094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sDvhAf2B9DrbLm4bHF1kl57Fvn2pa47nhjegElwkOHo=;
        b=Egmx2TWDFFCetwN9138VA9+m7N7wYB50PvkICG9c/h48TBAC42kzUQa1cpe4B7nJpm
         yIX91SwTSfviIFoKx5zSxwbY3DoKwtaKiHmUqHDrRZckEvZJtm2ZggSJd49QnnpquN0r
         GmAqObCFady+7Cw1roK28/ApLU3JJrrU9C8nPgExzI8rXWpJRraCYcE99Ry9sawXUCPT
         C9yj3ibOZ6uFFZrrnxdgQbBDS/5lz+QvNCTxGkxi4NlAiVxjjJyNFTjcPRQ/7JNwr7mj
         WcneiLfcsc8dbeMrIedpdpawfUX8AUx9/CknRk5YM5Ek0DKHmIWAF1kATAk4WFgt1Tj2
         /+rg==
X-Forwarded-Encrypted: i=1; AJvYcCX1KBQnZK9j1Ik382TuTVN2Etr4YNhHEYKwcDW7MEduKv6034wLI8ern6Sixu9d4M++Gx4Y3J4e2S3t@vger.kernel.org
X-Gm-Message-State: AOJu0YxVhXQ4QNEmkUWutX/WSQYaD2WDtr1rvBJYZ3M2t73yel/r0NkQ
	o8mIUhCsYGoH39KTr4wBd9uYsylOed/gk49LRsVUWaQetPpJJDHT/6ye2arl9zN5TTZWuWtfiXG
	jNWykFrhpPI/hDvmJh5Pbn7bHQsrYNgAPh1ywhZocORWt8wUdjyBs0ajDF4VOxa88
X-Gm-Gg: AeBDiesrqYc6uq3vBu0dA3jUU024D/NoQknJYUEIoYv5jtvqPyo73wEDelfHmsjVZKb
	4gde4uUGncBRjA+Ai6JS5+mfvyE4tHRoF3eP8WbODCt9kXOvB2sAVyPZVDG2HKTsoMmGqW/l9IT
	qsJDoUnK7ww9FVe1V5sQFVj8wvQgrLRSDfvj2cHf1Z+7S3KCIq7lOIBK5hloMLA0K2ayZ/mkrAa
	BSDEfas0Oh51FD5fMzWrvaNjvWAZ3jb92xV38XfTvH89ailPgDDtBC8pyWjSnPxXuLjhRZ9nAma
	AbHcqenSmNjMfxyIdCcGi3FumVZqISxE4QIbm2vszXOTJSOnLFb1Zn8ruyV/o7rTw4Ks8YaeknU
	Qo9PWqGdrrAVQ2biRfutvc4gTi50CeBNkRXqC6rQ5OGvGZ7a8xBBsCqGJ+ja9A71kNtFwvItBd9
	0GZTM89gYvP9bieFI3Z+4d7ESwcJSIQCuAV84l93JVwMr7HeQAy0yj/E39
X-Received: by 2002:a05:6a20:7346:b0:39f:24ad:ad11 with SMTP id adf61e73a8af0-39f2f046df4mr20634359637.9.1775640293504;
        Wed, 08 Apr 2026 02:24:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:7346:b0:39f:24ad:ad11 with SMTP id adf61e73a8af0-39f2f046df4mr20634329637.9.1775640293018;
        Wed, 08 Apr 2026 02:24:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm18274413a12.31.2026.04.08.02.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:24:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 14:54:38 +0530
Subject: [PATCH v10 2/2] watchdog: qcom: add support to get the bootstatus
 from IMEM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-wdt_reset_reason-v10-2-caf66786329f@oss.qualcomm.com>
References: <20260408-wdt_reset_reason-v10-0-caf66786329f@oss.qualcomm.com>
In-Reply-To: <20260408-wdt_reset_reason-v10-0-caf66786329f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775640279; l=4422;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=CyI3VfpN7ZvgkmfHWVT3f4/oL+YMTP8zz6uM1V5D2I0=;
 b=dQg7F/41tHFheDpFaSfZTB3oEOJJt/EN7mICP0FotiZPPuCTe0ltklrG6bCQqTlQ/VDk/lNWg
 e3JDu6gdXkcBjCYOs/q4jEzgI6kSgNusosSqdN3pG7KkyixcwZePuvK
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: KAk-jhaP6oXN2yr7NAzYSE593vHpzA91
X-Proofpoint-GUID: KAk-jhaP6oXN2yr7NAzYSE593vHpzA91
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d61ee6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qKWHfwwlgvfnR6H4MV8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfXwngDC7WYS5Co
 YIrDQCRLBMCQae5yZD0uNyTP6A9fHY4KcehEzLpXZkxno9g96kjf+cnMocws7xUaNTkUtMqvKUp
 GVYr1oo3qRS5eT42sczE/jXVs8+bcPl3Oq8Wyr8pLktD5p5/5G1hW4SAeNAo8ykPwmxeFHF5fvz
 4pmtugXeaUoL5tTvChXarNgqQnvf3kKBh1towKewtGfoTVmbir6BrhjuMDtjZdv8GJqMYWkesXB
 R9twhs2nOKUfPf8PDT1ahJfmkh4OKLSXUK4ZX+WZfWeW1s2v2yCF08317sNscCSl42M2bTo5r9C
 OOJWj35m1sEJjgwz16S2RaWYPe+pgX4xH3ysoWYfKh5a2/ko+ZW5qtEA7OMNsVoI8+43cliJh5b
 VxsN1u9c0IFhjJL4fX4dhRDFHOZfFCmPdwTag41au5dvX3792nJ63v9As0l9ZA1b7OfT5apIHer
 ktpvjuxi7XD4H9tAS7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080085

When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
in the WDT_STS register is cleared. To identify if the system was
restarted due to WDT expiry, XBL update the information in the IMEM region.
Update the driver to read the restart reason from IMEM and populate the
bootstatus accordingly.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
function qcom_wdt_get_bootstatus() to read the restart reason from
IMEM.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v10:
	- no changes
Changes in v9:
	- Log the error message and continue with probe instead of
	  returning from the probe
Changes in v8:
	- Picked up the R-b tag
	- Updated the comment as suggested by Konrad
Changes in v7:
	- no changes
Changes in v6:
	- Reworked to get the restart reason code from SRAM region

Changes in v5:
	- Use dev_err_probe instead of dev_err

Changes in v4:
	- Kept only WDIOF_CARDRESET and dropped other codes
	- Renamed qcom_wdt_get_reason_reason() to
	  qcom_wdt_get_bootstatus()
	- Moved the existing check inside qcom_wdt_get_bootstatus()
	- Dropped the device data and put all the details in the DT node

Changes in v3:
	- Split the introduction of device data into separate patch
	- s/bootloaders/XBL - for clarity of which bootloader is
	  involved
	- Mention the sysfs path on to extract this information
	- s/compatible/imem_compatible in the device data structure to
	  avoid the confusion / better naming

Changes in v2:
	- Use the syscon API to access the IMEM region
	- Handle the error cases returned by qcom_wdt_get_restart_reason
	- Define device specific data to retrieve the IMEM compatible,
	  offset and the value for non secure WDT, which allows to
	  extend the support for other SoCs
---
 drivers/watchdog/qcom-wdt.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index dfaac5995c84..49bd04841f0c 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
@@ -42,6 +43,7 @@ struct qcom_wdt_match_data {
 	const u32 *offset;
 	bool pretimeout;
 	u32 max_tick_count;
+	u32 wdt_reason_val;
 };
 
 struct qcom_wdt {
@@ -185,6 +187,7 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
 	.offset = reg_offset_data_kpss,
 	.pretimeout = true,
 	.max_tick_count = 0xFFFFFU,
+	.wdt_reason_val = 5,
 };
 
 static const struct qcom_wdt_match_data match_data_kpss = {
@@ -193,6 +196,40 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 	.max_tick_count = 0xFFFFFU,
 };
 
+static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
+				   u32 val)
+{
+	struct device_node *imem;
+	struct resource res;
+	void __iomem *addr;
+	int ret;
+
+	imem = of_parse_phandle(dev->of_node, "sram", 0);
+	if (!imem) {
+		/* Read the EXPIRED_STATUS bit as a fallback */
+		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+		return 0;
+	}
+
+	ret = of_address_to_resource(imem, 0, &res);
+	of_node_put(imem);
+	if (ret)
+		return ret;
+
+	addr = ioremap(res.start, resource_size(&res));
+	if (!addr)
+		return -ENOMEM;
+
+	if (readl(addr) == val)
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	iounmap(addr);
+
+	return 0;
+}
+
 static int qcom_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -273,8 +310,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.parent = dev;
 	wdt->layout = data->offset;
 
-	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	ret = qcom_wdt_get_bootstatus(dev, wdt, data->wdt_reason_val);
+	if (ret)
+		dev_err(dev, "failed to get the bootstatus, %d\n", ret);
 
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second

-- 
2.34.1

