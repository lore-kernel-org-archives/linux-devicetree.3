Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879923A9017
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311366; cv=none; b=YUds2TNGpFWPJfiXjI9MH3hjcjmovDHRemWfjGvIFplO0OCWuJNSOQYKXPOjaObg1i+ZOcvzEir3ZC1+L6L3M3gOlrpxHMDa2x4QXvZA5JAKdvzkJ7oXIpfE1q7XVnw2MVoBPcnAvqmAI+3sG/0b3WtChB4L4ZxcpTFYgmExadA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311366; c=relaxed/simple;
	bh=lzropSLLuEUOTlXB3lVSMDCK1IZ7W79RN88MySMJil8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oN+DBJN82ZNsaehq+wQVE3+d4nX/DTIzF0nnMuyl8wFsP7zF4mr98Vi5imOycRkvtS7IzfgxZYha1HhbPcclxb+HPl0AalnidRUcTRcE4Ce50jCA5Wn36vknZ0NmVIsxT/5BEePLNy9DAIQJjBQ7lnsYvpLGvZXL2Nb97qMEho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BswXOTsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxOGN/C0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BswXOTsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxOGN/C0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLVht3760666
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCiNA24JLGnW+ALPlEr94KdNN1Dg8+VWxK2km+y6x2o=; b=BswXOTskG+3prOc4
	FTddRVN2lV4PCYS8uOSTVqn5NxfgTYMz0v5f1fcQefm7AjKbL01cOo57B7+DMJrz
	TofHv/LRT2uPdMsgdYap+BiXQkTRAWofVxb13DDLUx+gj+FOR5lyGvbkOXphd9KJ
	q8wGlIVErkHWUKIVsBPDsZyYIDIomm+8y/Jvv5D9QXIjH8lNr3CcIIiujiBG8pW6
	eRaB5xfihyzp/4AlUK6Lhfjs0hMi4YAezUOasbKKJfI0HCEWFP2+X96AhYlktmvx
	JJsT73MLpTzNEZtCWCTx56k8b5jRxIfsxYn8vGVuB+XKvWwop0NB117Egu7h5h7+
	y/7yNQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtacdrgmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b465bf993cso107397385ad.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311364; x=1777916164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCiNA24JLGnW+ALPlEr94KdNN1Dg8+VWxK2km+y6x2o=;
        b=kxOGN/C0hM2IHgggZ9CZDY2JY0dw58E0Vf9P5vrUM/O2u8dtPdYzWBt9Muh7gObHd8
         +V1vovKsab3+f2kK1AOwq/H0onKI+aJVC+UgGtEbojKuqNfRT+xTko5vScpnEF7/EfzZ
         rCM9MyoK19fHyVbTyKHuMsRcWYvKPLN5LJlb3RJJNV7wG2mCaKWbxYjjg+jg15TYN1HV
         KHg1F2eIjlTs0YAZEQWnZtm/nnJGZvd2Pn74TA3zg6y2Rj+XN4K1yHreC8tRqgbwTwlo
         RWcl3/SJN8GYLzE6jO6gXBJ4tvxuiJXjud6Utb8dOMidhPSEGWXkzx/YsTwWKNZn2aVZ
         2BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311364; x=1777916164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GCiNA24JLGnW+ALPlEr94KdNN1Dg8+VWxK2km+y6x2o=;
        b=GRiIddVIIK2RMzQQbBdh/zfmE9fS8dty5myR0Dis34Qz2+MdY7v5aTcMS54ibYw6+B
         5Byz1t26nTyjI+bh0v63573uPLH9898N1ua534dnjpm3GmbGdaXxGS7//TmhFgmu1fZP
         +c7xKKF3luQK7xrgx6jUtwU7MlG7mnA/gDJNAhK39urtyDEnwND+GRPpbb4wkVsvKoS+
         w8qCK3EOCRU63X4uxLUS/Yak3wCa7mLn76gFLqaEyQysMbqa4abc/rCex0Ddsdz5S/2y
         YTZTkVOx8NYQPXomO6pHulJLYwZStkax3QxO9c5sKKbA5xBy2bw72N3syIVJlzvIGNEe
         t63w==
X-Forwarded-Encrypted: i=1; AFNElJ/jiKmWKnqnQDJJyvoQBTol7R+BSM5w+Z1v+UpUYT2R4agWIDC75sg7uzpwhrdoZclai6c570YTsAap@vger.kernel.org
X-Gm-Message-State: AOJu0YwfHAVQETH9xbrgXE7VkZxJHfOjIFrGQQXyMJTDLGR40E4vW2eG
	boSNaIY9+X05SoRLmIVyBVEk8plWNAHgbCxf13/d+ypCMXBkLNHxUySUgJ7p/WYuyvMD6UN5XoK
	4rc8x2TCjf2b+djE4aysyDj2uFP+HJSt25UjCfPKXjSyRRaeBEVgSWx759OhD2+y0
X-Gm-Gg: AeBDiesGkbAWGU5PIrGhkZ0Aqxkwr0xPMSn/Wv2QlqmpRPUcog1aEl9ZXas4oY1gX6n
	HPMBmqkTpIDq3c01/mDpPizGE+yiCzONdPMFpywPQQ9pFRmf0a+N8N5mTymMt742ykceY/5nefN
	+kVf97WLxvGbmPKqTKPLFBJPyLSqOZwPBxL6xgfyMX4g9ife+QijT6ysewMpDXmeykI4omqnwG4
	oCDH1iWgfWDQHVtaYm70cgyY05repnERA5DvSSExQLCNMUCtgGdlrmvWlIpw9mdeuYausT23GQM
	fjhSC4bpfgEUA93X5hfCEnXomX/aJalaejd93p+v/WnmhxotUJOfn8icRVveKTUUIvpnfbJllGI
	O0lF8+AMaG8TdbqIID8gjsMFjlNcx9hepT+5VV4FCo5CylrB54TTtIA1VVWzIzKEt3ZiL
X-Received: by 2002:a17:903:3503:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2b97a9661cbmr1763595ad.24.1777311364012;
        Mon, 27 Apr 2026 10:36:04 -0700 (PDT)
X-Received: by 2002:a17:903:3503:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2b97a9661cbmr1763215ad.24.1777311363460;
        Mon, 27 Apr 2026 10:36:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:45 +0530
Subject: [PATCH v21 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=5704;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=lzropSLLuEUOTlXB3lVSMDCK1IZ7W79RN88MySMJil8=;
 b=Yax9prFDQv171HwJK8GhB9i1LBifVuZuKjaRqdRPhgOa/XGkco6ROfooGv8bt0WStsk62OajJ
 3ndcItGxp8SC2hfvo1UlvIJlnuM8CXU8VJPMMcPr5ymXTPII1gaX4s+
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX7wpmR7Fm0U/w
 /BWFvVuRtpYsd4zJcPqgybnrQZPkCuDmVUD7qkEvl5vLEbHfhGQySWPmc4y01DKllZ88gqoqRuI
 +Gi9g/PA8EPRdVVDdhgfVj0lKo5Cpfx8MpUFKAaLa24IbPUgWPtsGlXlHQXMUy4Z1YKV76ZkxDJ
 HvxByGAMs4jnoDI4sZ4Co3Nn1cHvQQl81ZddzAdG7CZuCe6eMkKHoQneFSeXoodwDSKYmRSqVJY
 pexO5DhS5XDoLkCLZcYMgfMKUrD5FqZG3uCYTdOq80B9tbJfokBhwreSE7xEz9Un590R85VXRuW
 u6SchcyeRK/XIn50LV5bkY3Y1h0DXY5RUufo7Rz+FOjGlVnbnoRArBVZ0N1byWU4/1lAkFmjI7M
 0REZ5X77ALQHhP+WsE+itrCfaI9I4nSS6eRvg9+HIzss+NfT/HHPPHnJtkHwtiqtDouRyMemPob
 Y5EotnZbH1FSkrDod0A==
X-Authority-Analysis: v=2.4 cv=QsduG1yd c=1 sm=1 tr=0 ts=69ef9e84 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=_6Fr27BeRXDgthG3VUMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: xuyAo5XqTXS7pYLYlNkKueISxF9Kk0qp
X-Proofpoint-ORIG-GUID: xuyAo5XqTXS7pYLYlNkKueISxF9Kk0qp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187

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

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                           |  1 +
 drivers/cpuidle/Kconfig.arm           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
 drivers/mfd/Kconfig                   | 10 ++++++++
 drivers/mfd/Makefile                  |  2 ++
 drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
 6 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c871acf2179ce16c80b404027e6b969c7787a6bb..333b01fa00b8fbd15e6f31a6b9af47600411624e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21239,6 +21239,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
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
index 7192c9d1d268e93d1557ca6519ac96056e37e221..75ea5b47315cedfd1153899eef28614a165a14f5 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2376,6 +2376,16 @@ config MFD_KHADAS_MCU
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_PSCI
+	bool "PSCI MFD for psci child cells"
+	depends on ARM_PSCI_FW
+	select MFD_CORE
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

