Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB6C2848BE
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049498; cv=none; b=H5s2veEr3RBy+95ukmltr5oVeuv9ShzVbpHOYUw+ZCbNWqSKX3bzOr/STFizis1UvGfS3a289iwV5piZuUthWrBRFb9da50yyMc4V2bHA4rjkLOCJEI54oZlRasPqsi2W84Km6HJCOn1nGAfBFUFXs8NEfMQ0TJdXFXSSiAa1o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049498; c=relaxed/simple;
	bh=MfoLK8M+cwJsqJMcoFtwkeKu04gSS+o06svNL8s3zdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJDycIfiysxZHJyrK2QA3uNA7C990zmcGdvoCUkep2Aslh9VEnGrMb7PPfeG3ayAD6HzdrXzyVEp+cfZKj6CgU8LvyneUtySobm+lARiUTkUnp31m5TxH+2COZYKvbH9fnQOX6r3Ec4Ib1Ofe1aXXX//DaZmUwmJ9J/jciqXOOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6xBjTjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HuXKonpV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6xBjTjj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HuXKonpV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EHAY5c1206163
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=; b=k6xBjTjjlCMFY+Eo
	3CjKPlAA3V0CWRFA3KF4IASSJ8C7Pz8GwNYnuoHyOk3kdGLwleJ3haABo7c8+H4D
	QnSfJNgDRtn/p9n0l0ZTMGVZ8eZ5HtARQwnnagmgX5xxwt6cD4Oql6LzFYb4caoq
	b3YaHlfRUUCt2d60seda6PPS9/tQbhfGQ6I2jND6A21umB2pZTegMv45orFEe4oi
	tXgpyK+v9fukW0o2On8ZXbsqPAnwHDXjolG7pDmso7eRMEOCGYDT7RcnuGUVscZ7
	q6T8Utl4V4Lk7Pug1zbUWhF/U98DdK50p8q8Jpb8wCybm15H7GLk1K0+0e37e7VH
	vxSBIg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9hr0uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:18:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so7989426b3a.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049496; x=1784654296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=;
        b=HuXKonpV0J9JhWwTJ2omJv8TtRRMWv5FWENsXvIvT06BUXzYrejpYiELMYrEx9Fntk
         rWJ2QwTaudBF3lqUG5W3DUerssocQUG3PsClNVu869vxXOSTvqQDAIVuvUP/+ADlnOEY
         yL9SxHOpzkCtWwoZsCpN2Ff4a5BOFfAtUtgtOP/+52STjWotpwqNcDV4mnuiZEd/2e9+
         WLrC3rqZYpKA50tf9vwzDsCqWSN8tgIwpmPvZsm3/avV0wKglASwGOdzRZI4oBlR/lPM
         Rj4pa89zsqUVB17fyKkY0tvXCm/6pzXT+kIl0GjFsUz4nwQNmSLg1klkUCYLcYSCIKg3
         nxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049496; x=1784654296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=;
        b=btumdSm0vP+wHnYkbZuWoItvG9D+J9CAHdPcyI6JFbd5xQDtHOi4AtI2tixGB/gakL
         UMDP6pc25aszmPqnYPqydUq4zhCOb9yFPmYeHVegnpgvPxrc2pCSJkXgXh7wWFsqHdTy
         SDcQ3h1wnaXYZ7PVD5jIWQO3mPT3+IVBh62fZj77tkaWnIfwTAlhXQqUsPPmD9VUGrEr
         tFkLYlZ+kitEqFZE6PXpwmEyZ59lzsPI5+RPkmqEz0AnvFsGsInCt1UwyA3YKE5ihSeR
         vcPzNEkn01/rbENg5Pf1nkdanPMUUJHWMWiVJbaEax0x8CY7TOEJqemDddLa4esWQsA1
         NIOA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8fx5FKPYRvQ4jFMKDJ9MMpQZvrOMgtbqcNheEBrYRS41469Ou6mEkkPp5tRALsjlI0X1q6ujiQUsT@vger.kernel.org
X-Gm-Message-State: AOJu0YwLClsf1NQA/zbdoPhEMFA9z9yLzE8ANZ3wMuzXLLypyao70ouh
	pyE0DVKif/5Ywmv3s7C7r9+L4fvKQN3Jj03iXsQ02m8T8FqjeTRfRohG0nCdtnE2E2gI8Mmm4Ox
	qy6uySVeMkHwBrT5gJair+y6hlLZfibBwmNK8GzMtgP2xc05ux8Mhxqzj8jcF7C86
X-Gm-Gg: AfdE7ckWVueyej7rGN25j1JmpL88DGrVBpb/Y7lEK0WK9yUFKK0zR7mNG6LUKfwccCK
	Vc6BchXn1UJbHlrY13lAAdo0K0/4VHEB5VBw7Fsja4qeogY55L2QMoihbloN5YNOBP1omdwp/HZ
	FHgG/F+teAhWWAVjtHfgQCIOD7tnCCFAtfhE7yI3QCbQoE9NG25Q5DuO96VyN1hEmtA3ioSb5qP
	gi4d4BVTUjyrE4Uv3Eql6W/UeQIpK8fyIladXnsGMNZi8a/6xw3BcFW9ycM9DCyJ6/Ubb8oB5nT
	+EDoHwBIny+MWW1GRfY0rGfYtwc8jvr9PwCxLFMjp5ym3WT56HNqOzr5L4LEgqk5o6RG2xgGdGe
	xmMCvzSA1iyFPLqklhgzZye19XpXFdZWkc6NCQ3ZDU3Hn7OE=
X-Received: by 2002:a05:6a00:4405:b0:845:d286:1fa5 with SMTP id d2e1a72fcca58-8488974b096mr13460090b3a.52.1784049495844;
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4405:b0:845:d286:1fa5 with SMTP id d2e1a72fcca58-8488974b096mr13460058b3a.52.1784049495426;
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:37 +0530
Subject: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2622;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=MfoLK8M+cwJsqJMcoFtwkeKu04gSS+o06svNL8s3zdQ=;
 b=qc68dV4YEQckF6aiIfbEhwnkSEuflVjvhtpo0b0PGXV9fx3UjJfg2D23zCw4Y79QkpPBLReqM
 GuYHD88XpFyCNQDG5Cmiuv47u8F4gUERJM9WMx/92hPByxGmUSwjnIM
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Ib+3n2qa c=1 sm=1 tr=0 ts=6a566f58 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qQQu7YRYY0fa_xNKXW0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: XD116gWILFSIIOUnG054bbvzkSeVqiA_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OSBTYWx0ZWRfX3eA8RnjTjPlV
 a6T9z63wU2L/bRwcGLOMfSX/oZ9FvYU474lgbhhOpk1UfR+y98fVhNMTxR3dsydzmzPldGqeg/q
 qSzSDSe/zyyTWuypBLTTpsowfuaXjYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OSBTYWx0ZWRfX4eaRBcXMcGJr
 NUOXPjUpaSAJRvPTuo1CfXjsDf3da7MxKYdOWnbkJ8Pvfk3v4Jz/SQHmXfkijTpujmPzNa3rhKQ
 POxYn5kUzM75MoioPs/YlwltaopixT3E3P8TMNqqF71lA775Ok7A222GDWJ6HJtQkNNYQkNRJXI
 n0M6jls/3ANnUWIx6GcDFCUuBsfsBlxYHI7BUVv8RW8TYLTcJ7mEf3uFLo1jl7mgbulF36O6qvk
 8neAr4nw2m3BMcWeuhAc5nY4o+HD528Gokoa50oVycAdN1nRzQtx+OKeV0yG68Hnv5zH663x4Ky
 /jki9+1xqqx0A5C/pU7wNjjOR8fxoKnb/sl0y68ZXbNmElAvmgqzQuIzYtnKr2bhmU7VNtY1sVs
 W0VahU/5lKgrdLcO3Veut6JNjsXcMfZf0YKT/OCotQfao7hXT9CF7fbG1C4JBLVJqcSHu0TvQSZ
 Wevn4uATAp+vi4o0ykg==
X-Proofpoint-GUID: XD116gWILFSIIOUnG054bbvzkSeVqiA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140179

The PSCI "reboot-mode" node does not define a compatible because it is a
configuration of boot-states provided by the underlying firmware. With
the new firmware-node based cells in mfd-core, this node can now be
exposed as a proper child cell.

Add the psci-reboot-mode child cell to the psci-mfd driver with a
named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
reboot-mode failures.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/psci-mfd.c      | 30 +++++++++++++++++++++++++++++-
 drivers/power/reset/Kconfig |  2 +-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
index 7affd6bb09dd..8c6b78ac471b 100644
--- a/drivers/mfd/psci-mfd.c
+++ b/drivers/mfd/psci-mfd.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 static const struct mfd_cell psci_cells[] = {
 	{
@@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
 	},
 };
 
+static const struct mfd_cell psci_reboot_mode_cell[] = {
+	{
+		.name = "psci-reboot-mode",
+		.named_fwnode = "reboot-mode",
+	},
+};
+
 static int psci_mfd_probe(struct platform_device *pdev)
 {
-	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
 				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+	if (ret)
+		return ret;
+
+	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
+	if (!fwnode)
+		return 0;
+
+	fwnode_handle_put(fwnode);
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				   psci_reboot_mode_cell,
+				   ARRAY_SIZE(psci_reboot_mode_cell),
+				   NULL, 0, NULL);
+	if (ret)
+		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
+
+	return 0;
 }
 
 static const struct of_device_id psci_mfd_of_match[] = {
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 93e4029d9506..b736a80eda00 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -350,7 +350,7 @@ config NVMEM_REBOOT_MODE
 
 config PSCI_REBOOT_MODE
 	bool "PSCI reboot mode driver"
-	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
+	depends on OF && ((ARM_PSCI_FW && MFD_PSCI) || COMPILE_TEST)
 	select REBOOT_MODE
 	help
 	  Say y here will enable PSCI reboot mode driver. This gets

-- 
2.34.1

