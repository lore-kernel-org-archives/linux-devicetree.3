Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E530B3E63B1
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768873; cv=none; b=OIsiUoUrqhfMe/Gdiq1ONHecTFzEH5DuhrIl0z7W/DOd4czOdYH5XZTBT4RUnAXqLVVRWccs1slfK/KnLWRCfKf10s5MXsUkAPX23QWTVlkVs3BFFrX69pUN+slxUHG7vbISyuADzH1nKWW+BfwDBHpj2JpQ28dHrud441umezc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768873; c=relaxed/simple;
	bh=zy6phBmn6YUnIF3yMbnynygcUzKc7Xs5rKA2+rssLxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfJhZr4cyo3pOU35SkB1eXX3z4Nr7EBmMXatMiYG8kToseJOnvgySfJOiuQ4s/QA2zKRlodCYV09rlzogo6yumgLCprLs/pnxJ9qGwcGOHv5apKpVGldDzzIs0xkqKqRL5yad7NleMOW+LAWz5IFAJKs76shuQjqIwhwYS10MiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SenOmO3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QM47F2TI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SenOmO3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM47F2TI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUQa889402
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Co9KGzjyAfh6/8ptbNjM0OYv30ONMomjFd65fkZltNc=; b=SenOmO3QnE63wWhA
	yRPJJdzXKOQzkLrZILzZun0TFusH2kWCvrLSBLT3MktU6UfbacTNPEm4B02WsULt
	/pj21sCQvL9RU1fFNrxcDvSZWDNcYpH4ZPMAwegLoFXfI9MD1EsILT2k5b9mFP/4
	DUKWSS3ZYJBaqxAfoN2ySBG5PvLk03oixYlmJzjMCyPUELHhGT2o5B6c1hosVHP9
	0/U6S5NBKigII8epskKYgw1hRzsxgJUmh4CNXlxaqTkTdKL4hAsMd3EjVlJwYOcr
	hmWF3JTmkFSeZQUGejIe6YVRHkwEG3IUuk0fq+13IBp+DIEfeJ915AwPaxGUvpRU
	9x5RwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjm90s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:27:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba268cb5e6so71811555ad.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768870; x=1779373670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Co9KGzjyAfh6/8ptbNjM0OYv30ONMomjFd65fkZltNc=;
        b=QM47F2TIBxHyts+tkwSKnK1a9qCzi83f9Xmc72kz9CGvMCT4D2YXYugiPGKfMdzUb3
         VF2Bw84Ff8aE2SY/B5XvLny53N/Alytir+DHsr4UCc30WkWffmnvcZkhdCP6KiKdXQde
         ZzFuPM6ec9QEiOM0Pg1Mrts3LiR6zkfz1VJwvPNMri9ToDIugB2olq9tEBY5o3Bj3qk7
         meqyHjoO/3bAT9ZLmnz6+JSwaYpHT5kfmtvSlnPQavOW2H8EfcFlw2VdTAKoG45ipboT
         E+geALm/5JL1SVYyhuR5rWwyRotwH4pg2z+Qpf+JXKtlAI8U0pef5n23oOcqh6JH0/lT
         2WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768870; x=1779373670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Co9KGzjyAfh6/8ptbNjM0OYv30ONMomjFd65fkZltNc=;
        b=CBaeFo1E9iNrEXzrfxYmQ9dJABHcU62pcr6Yl19xgwTqQr6EyaycoNqFRWWM0dhw8W
         TkGtHlO7RXqh6GCDjYFOCX3ViBq0QH85Y9zqhFkRNemT/rGLSG0D1+mOKKh8cBpBqy95
         Ah6fCMlACPm/aAZGT648oJV8z1duW3UgDIc2hTa7F0PK4riipAt1lplAsM/2pa17V3SI
         Lo7fATFwVxJD2z514ljHg63PQ/pwry6Q9ewEIr0C5X/lO2LuuMRgbwfcauNxCMY1MpnE
         EjzcxYHcHcci7vK5lFZLZ8ey7JtvpR/+z4uCgKAuVc5zJpYSO1wPYP6dRdfTthIStwwV
         wJpA==
X-Forwarded-Encrypted: i=1; AFNElJ+N1dCOEJf1Hjm4X/IhitF05KXaysA2wBvPkTdA2mnpmDylQYHv/bTKgPMxESfWp5k/UIooLvB7vCYS@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMy3BKrmroUSHlB2eHNNm84Ow4bQs0lPNv1hUIHcEXdqcTXTh
	6LZUoMjbnSeK039T/E61Npc+xDJ9ZXNkQxTX3cbsOuzPXr2dvHCFqogjRwK1uThB+4zVVD5Jgql
	noI9XRDxzzocL7pySkugrxvXy3xfPxA/zKE05ht808XNWCAvBhPsPH5Om+6fFxPyL
X-Gm-Gg: Acq92OGSALtgx4/ojRKvEDr0j/8SAKW1BUfg/ua335hSNH/qtIkpMyxis+7cOBcTQq6
	UwXzF1HH1YEQdUcbUjyN4UpYz3Gi/rXG8n9X0M04fGfvu9gmOua5SdyQKAsadBKyltGp9GFipbD
	PdoSD4IUYT6ZvA8Ij98WVgV+JF4q2VfaT96Yd26Wu3wK8tL+mTKTuktqp6tFmOx9V3NRtNC/Pkl
	oUh3KJN72Y0K+w9812oByF3m+gMObmrEDq4+1bP+EpMOG9IjIRQuZz2OqZ2XiDs9o4OCEuG6Bux
	rlvZp2/NhmJHFEy1haxQFWeNMVEXP9ga0Xgs6pmQ6Ud63dUrc5bK+vdVfqmS7oUxYzNL0oJEtgu
	jQ9LTC0jIzLfNPMz5jcnJoq6YKucVJ9D5WqoeEKnd2tCI/BxpOkc0jly9rQ==
X-Received: by 2002:a17:902:f545:b0:2b2:5515:661c with SMTP id d9443c01a7336-2bd275d92damr87019135ad.31.1778768869378;
        Thu, 14 May 2026 07:27:49 -0700 (PDT)
X-Received: by 2002:a17:902:f545:b0:2b2:5515:661c with SMTP id d9443c01a7336-2bd275d92damr87018725ad.31.1778768868794;
        Thu, 14 May 2026 07:27:48 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:48 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:46 +0530
Subject: [PATCH v22 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-5-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=5883;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=zy6phBmn6YUnIF3yMbnynygcUzKc7Xs5rKA2+rssLxA=;
 b=SOurAsIULUWVWnJZOndTZMct4VFZr1u2Qapeo+oUrIUQwcqZ5plrR3in3w2SSdcmSeiomghti
 dBATCO7Obm2AUFSeYeVbBRsuAT6XlSS3J08SRbq7QHtjGuIgIwz+5Im
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: eJeroWmCEjGRJWi_VRAfQdIxePCJeUdN
X-Proofpoint-ORIG-GUID: eJeroWmCEjGRJWi_VRAfQdIxePCJeUdN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXxYGlqsF3tmYQ
 NQoSzM+bc2RLEyngu2T0AqIS4HBMkMhzN8tdQ5MAJVco2tlCbIHKy9hnZE/1DL9eEWF+4MwwQqy
 LK1Marg/ugpx73DPA+4rSpXOKK8HjCk1Y74ed3wRckyU99PE+aFuO57NYGIxQLchn0sMt1kbGmT
 vTxhg85TKVKd1t+o7c6fxXNtKBeDvuNLiNrlgj4TlnVRY+oid8aNfMMLtpsTyGEzIskggBZlkCu
 OYEV8CZth64pnEpFYr1mOOGStH136To/thKtf0zhi15M5iDG5IGeN3mH4VNdfTniTmwbdTHv1kF
 EiHx0IMmvv99KSmIhuhvhloVeLgmckpve6GdvihfF7397yZ+AooN3A2atoqrPkwhIK6ICUoV72q
 ei6Vc8zqQYrV7engWt2C4TgPrt6pUF9n4vRnUKc+lSKOE6TKhfG18qZ762OmAK7EHGeDOwn50aq
 EsnmVVWhtnD1qNFXSmA==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a05dbe6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=wfThnEy5_2w5d1iZ5YkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146

PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
Currently, both the PSCI core driver and cpuidle-psci-domain bind
directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
introduced, would also need to bind in the same way, leading to several
drivers attached to a single device node.

Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
PSCI child cells. As the first user, register cpuidle-psci-domain as a
child cell.

Update cpuidle-psci-domain to probe as an MFD child and use the parent
PSCI node for power-domain traversal.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                           |  1 +
 drivers/cpuidle/Kconfig.arm           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
 drivers/mfd/Kconfig                   | 12 ++++++++++
 drivers/mfd/Makefile                  |  2 ++
 drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
 6 files changed, 60 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f877e5aaf2c77df8dea7135ffe3617dd61504fc6..36ba42209c0b332813a296880cd55798a5592d2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21341,6 +21341,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
+F:	drivers/mfd/psci-mfd.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index a1ee475d180dacab245510674514811aec337ad3..1a1316d11e0a2e4f61801586229f5104e2435865 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
 	bool "PSCI CPU idle Domain"
 	depends on ARM_PSCI_CPUIDLE
 	depends on PM_GENERIC_DOMAINS_OF
+	depends on MFD_PSCI
 	select DT_IDLE_GENPD
 	default y
 	help
diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..a2d01810f2957abdfa52ae66503dc0cbb205f163 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -17,7 +17,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/psci.h>
 #include <linux/slab.h>
-#include <linux/string.h>
 
 #include "cpuidle-psci.h"
 #include "dt_idle_genpd.h"
@@ -122,14 +121,9 @@ static void psci_pd_remove(void)
 	}
 }
 
-static const struct of_device_id psci_of_match[] = {
-	{ .compatible = "arm,psci-1.0" },
-	{}
-};
-
 static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.parent->of_node;
 	bool use_osi = psci_has_osi_support();
 	int ret = 0, pd_count = 0;
 
@@ -181,7 +175,6 @@ static struct platform_driver psci_cpuidle_domain_driver = {
 	.probe  = psci_cpuidle_domain_probe,
 	.driver = {
 		.name = "psci-cpuidle-domain",
-		.of_match_table = psci_of_match,
 	},
 };
 
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268e93d1557ca6519ac96056e37e221..df912b3391459a78e958fbae5852fd93ce3165ca 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2376,6 +2376,18 @@ config MFD_KHADAS_MCU
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_PSCI
+	bool "PSCI MFD for psci child cells"
+	depends on ARM_PSCI_FW
+	depends on OF
+	select MFD_CORE
+	default y
+	help
+	  PSCI MFD registers PSCI child cells and exposes them as
+	  platform devices. Child drivers are probed only if enabled in the
+	  kernel configuration. Select this option whenever a supported PSCI
+	  child driver is selected.
+
 config MFD_ACER_A500_EC
 	tristate "Support for Acer Iconia Tab A500 Embedded Controller"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28afae975ac61d282b3b85af5440119..36e872b11b995135a04ca24c33fd3a4d08e4f49a 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -24,6 +24,8 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
 obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
 
+obj-$(CONFIG_MFD_PSCI)		+= psci-mfd.o
+
 obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
 obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
 obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
new file mode 100644
index 0000000000000000000000000000000000000000..7affd6bb09dd83452664edeccb09290fe4f43186
--- /dev/null
+++ b/drivers/mfd/psci-mfd.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+static const struct mfd_cell psci_cells[] = {
+	{
+		.name = "psci-cpuidle-domain",
+	},
+};
+
+static int psci_mfd_probe(struct platform_device *pdev)
+{
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
+				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+}
+
+static const struct of_device_id psci_mfd_of_match[] = {
+	{ .compatible = "arm,psci-1.0" },
+	{ }
+};
+
+static struct platform_driver psci_mfd_driver = {
+	.probe = psci_mfd_probe,
+	.driver = {
+		.name = "psci-mfd",
+		.of_match_table = psci_mfd_of_match,
+	},
+};
+
+static int __init psci_mfd_init(void)
+{
+	return platform_driver_register(&psci_mfd_driver);
+}
+
+core_initcall(psci_mfd_init);
+
+MODULE_LICENSE("GPL");

-- 
2.34.1

