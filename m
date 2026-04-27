Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950AA369970
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311388; cv=none; b=iid185Ac26Wagw3rkYZqbpseBfKLw0iwHAleXq+7SHZ2rOVxwlaxjUqWmZLp7L81SWEkMP+XTFFcJWwy7VaGCSXy6182pux1VLl0thsHJqEZcrs7TYx7f+/3DBIwbiJ44F7Oglke2FNyc7fqojSYah3b8dXRwALTKEf+jCypMys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311388; c=relaxed/simple;
	bh=P5d6Br3dWmkgJQvTmqm2xZfcEwgYOHL0jl0KY/yqwaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxS0EbYbJb8u/7YmoGW8bSlHcQCGdW6RqHKuQndpua2fTHmkP4pj6G+5a4amCSHr8Ckj4M6IyVRmY3jZe6lCwEMSou0j85ehToLpNMz5vyHcN6KTofRcj7zSjgTuU1hujVMxgeN8mH95iy8jVGLqG8o33xNwPzatjQWj2QOOlvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLfgE/n3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITU+9Vck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLfgE/n3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITU+9Vck"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RC5ao92006188
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRd/LNkrvRz1DsBjodx4Y6wMCeOUpdwMyOE0mSsx0jA=; b=nLfgE/n3NLAQO07H
	0zosDqQfqEQjScnNt3HdiF+haVytSMbYo4fPnVXcRyUW1JhILaI+0VmSR7TD+aUt
	+wd2Vmy2IVb2duRtoifqu2NTR7IK64zPljOp6OcUSXzXRs2hYvYTSuT7VTT3tIQC
	jL9Dkw3XxIMSItcQqxc3iUFy+1SHqS/4JoJjFGEkw8GPQPkVMmAREyXzWIh59r3D
	0n0epqwsHtnTiv5etpMsum036WWDncxBbmer2B+j4riNIKiaPr514/QcXAi7xnRl
	8yCrbuvjl0LJpiBhf1bzPfscJiEGk6H0aW35roRjHNKgxZcXJDWQXwpbd/nPHLte
	EXj/FA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkh8cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b79f4b35b7so44769575ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311384; x=1777916184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRd/LNkrvRz1DsBjodx4Y6wMCeOUpdwMyOE0mSsx0jA=;
        b=ITU+9Vck4uGiaBuGFVzjftjYYzWEXI9Bi0thw0kHswtXySmvpq1u+wCyFUJZY3J7Kb
         50GP9XiQgKuEs/93driHfOOOeHpcYUUTmYvABbp2EtgGGdmIxcUMmvDx+AXD7GzCdV/+
         JhZx0ywgqWJK0rMe+kkgnfHMt1AAtoCwFz/8YPhnCV3AfveiA219niQZAuuW8LpYySla
         OplMQ/7b+9OL13o/NG1stHwUOvKbHFMKyg0B+Zq70Lp3A1xYPE8IX6mGKEvq5Hf3VhnS
         x/OPmP0qLfHIZX8hGFwPny8ZrUTGs+vlHPiKVj/Won9AChICQCxua0JEmQSX8lHf20r5
         lt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311384; x=1777916184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wRd/LNkrvRz1DsBjodx4Y6wMCeOUpdwMyOE0mSsx0jA=;
        b=K8SfRDiwwj7k6Wmy5ZVeEG3gyTCcYtM6rJK0R0c9m790shKOcz0II6ArdJni5yAMbQ
         dAUSMr4n9CJqA8t89YpFj8oDYytRRZiF5rDokX93vOt4EQt3QJ2mtvoQT4Pkac9uMTLy
         PBo43CELnFs3mjFvM52+DM4AMg7wD6dFNPgEflWfVJ2b+dP4MhMOVx4brwkXEUQ9iKKW
         KDJUHbsAXyws52G8ZxOPLBK0CyIEg/UNBpdV8nmDrj8OHp/3l+bJmPdktNboOakdhT7k
         uLZkLXOkZZXXYmgjSxrfS//VD8wsfJprVZZFxTUEmQqwgO5Q+Ia4hhEnHUF67MhFwGiy
         D15w==
X-Forwarded-Encrypted: i=1; AFNElJ/CSDcrcjE7P/Zeoh1uhh1XfVoNyP2VhfGc95dLewtCi/qdjI0LHwvmhh8M3qBe888+8mI9qCFJhJ/q@vger.kernel.org
X-Gm-Message-State: AOJu0YwexjfifechTq0oYOmr8WERAvjTHCpSaYo2AEdBkucp21i7InVG
	5GhUSje6yc+wqa6pe4OAx7XGcYOnO+E9ZFaXzxgKzvqYvmTZ73+8nIdqHf2hDGiiqmjStG8ZHlH
	9zUeV4n/I2EuzrnmeVTYFUIAPQNahrcNm3gAJ4jhUti0fGRNuLvj0dBzvSwWFH7kt
X-Gm-Gg: AeBDietBjVWkfKMkI4w+RNSLbFgDb03uaRqmL5j0tePhXDtMOf/hJ1ooTnvgrBiFKwK
	goKvsLtqQM9fynd+JOQE7wQbby76JjjhzXTIui3syqrgbCkpFfHXVjOuyJ/u6qk4tfUEcfPTItJ
	9tLYWuIVl3YBWMO30sVf9xeilMsnjH45AZyEwjwxu2bdTz+MiHUDLAT3Qe02Oi5LftjiH2hOL0U
	UXHzqFYPPqNuYxsMnyzmgdSpAXdtOMsTB+WlzHVokHIh8Jz2H2Y4W3v/d3edYfF0Msr83RvaRS4
	JHB8geiPl7A7hRd0kNY8SpSOBkXorCUC99U9DfPpqaELGlJdAlJ+RFQ3qSF13RWR+a4eM8fiQoG
	dW1VJaxJByY64TVw/EtrG73JB/9MMLjpRalZ2paTkC5Cfx8+fgU3zsV76Vd3m9roKTEKt
X-Received: by 2002:a17:902:ce11:b0:2b0:afbe:4e14 with SMTP id d9443c01a7336-2b97a960cd2mr1555645ad.40.1777311384264;
        Mon, 27 Apr 2026 10:36:24 -0700 (PDT)
X-Received: by 2002:a17:902:ce11:b0:2b0:afbe:4e14 with SMTP id d9443c01a7336-2b97a960cd2mr1555295ad.40.1777311383693;
        Mon, 27 Apr 2026 10:36:23 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:23 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:47 +0530
Subject: [PATCH v21 07/13] power: reset: Add psci-reboot-mode driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-7-dcf937775e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=6423;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=P5d6Br3dWmkgJQvTmqm2xZfcEwgYOHL0jl0KY/yqwaY=;
 b=+SQenioOGcW7SFDLo6mJbiDF2OjPf6L5ZwJ8rzJ2IHrPTqZFE9/b7EOq4UW8Y0mSKF95PGCxY
 F6xXYyiRGuFD8AOML3Jm+c2FQF43heEHHn353zsVf967jshES3lBeqB
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: B30YDsuZ_KDVsN24Ah2N0QsLWfCgHeE2
X-Proofpoint-ORIG-GUID: B30YDsuZ_KDVsN24Ah2N0QsLWfCgHeE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX2kfXkGOsk6lV
 6GesL80uMqbmnaFliatNZe41chIn4kx0StJ7hqyKXnVjQbKwbboCmyiaqMUTfyn9kpMXQ1Oc/pq
 1SUSxLSAcycB0KH4o/44hxOlBDcsfNYVGugt9KWYIbVogzjouH73Y4xdkt6yjDZhvwQbW1l41Kb
 Y6ilbFtQ6FsbK+menBHHgL5DwJLkcaIwSPvZnIPBfmaRxSuf1oM/vzvDuBx9WDnu4PkUWFVmGmm
 dcRj2uSG1IsrwHQshVwIYAwmvY3COJ/M8Vn1V+oDoYPW/v16c67cZLcGJKQhHOzbPSCcpEs77lc
 jzdaQCqmfyhIKiXQydcHAwRDYSgHSzOMW12sBTB7l3/8euevpJxRMlhC0ekvTcZSs6+qIUVkZw6
 LKSfDGELhycqOqFRk7xPwGYwNTZDkmRe2MO6RFK7f/TTX0MAoQcZi+K7Dgs1nezK7TLCmq8EAJQ
 O6H2fISC1zG2PIdql4w==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69ef9e99 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ywhReTWICjBcZAfHApEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add a psci-reboot-mode driver, and define two types of PSCI resets,
predefined-resets and vendor-specific resets. Predefined-resets are
defined by psci driver and vendor-specific resets are defined by SoC
vendors, under the psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |   1 +
 drivers/power/reset/Kconfig            |  10 +++
 drivers/power/reset/Makefile           |   1 +
 drivers/power/reset/psci-reboot-mode.c | 109 +++++++++++++++++++++++++++++++++
 4 files changed, 121 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 333b01fa00b8fbd15e6f31a6b9af47600411624e..8cebc2c7e161c8a226802a4102756b4ed6034395 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21240,6 +21240,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/mfd/psci-mfd.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 124afb99febe92450b6ae322aeed3b63fa2070df..d9d1f768b8691abc3b32f2675519f2ddbaf19b84 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on OF && ARM_PSCI_FW
+	select REBOOT_MODE
+	help
+	  Say y here will enable PSCI reboot mode driver. This gets
+	  the PSCI reboot mode arguments and passes them to psci
+	  driver. psci driver uses these arguments for issuing
+	  device reset into different boot states.
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index d7ae97241a838fe1b536b2f911868e7590d12e3b..02948622fe3d00e165f941108ab92ecb66b0f0e8 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 0000000000000000000000000000000000000000..29f53d2f50da8e34e714adef9507d340bc4130e2
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot.h>
+#include <linux/reboot-mode.h>
+#include <linux/types.h>
+
+/* Predefined modes use reset_type = 0 and cookie in magic[63:32]. */
+#define PSCI_PREDEF_MAGIC(cookie)	((cookie) * BIT_ULL(32))
+
+struct psci_predefined_reset {
+	const char *mode;
+	u64 magic;
+};
+
+static const struct psci_predefined_reset psci_resets[] = {
+	{
+		.mode = "psci-system-reset",
+		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET),
+	},
+	{
+		.mode = "psci-system-reset2-arch-warm-reset",
+		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM),
+	},
+};
+
+static int psci_reboot_mode_add_predefined_mode(struct device *dev,
+						struct reboot_mode_driver *reboot,
+						const struct psci_predefined_reset *predef)
+{
+	struct mode_info *info;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&info->list);
+	info->mode = predef->mode;
+	info->magic = predef->magic;
+	list_add_tail(&info->list, &reboot->predefined_modes);
+
+	return 0;
+}
+
+static int psci_reboot_mode_set_predefined_modes(struct device *dev,
+						 struct reboot_mode_driver *reboot)
+{
+	int ret;
+
+	INIT_LIST_HEAD(&reboot->predefined_modes);
+
+	/* Always register psci-system-reset. */
+	ret = psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[0]);
+	if (ret)
+		return ret;
+
+	/* Register arch warm reset only if SYSTEM_RESET2 is supported. */
+	if (!psci_has_system_reset2_support())
+		return 0;
+
+	return psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[1]);
+}
+
+/*
+ * Pass the encoded magic to psci_set_reset_cmd.
+ * magic is encoded as reset_type (low 32 bits) and cookie (high 32 bits).
+ */
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
+{
+	psci_set_reset_cmd(magic);
+	return 0;
+}
+
+static int psci_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reboot_mode_driver *reboot;
+	int ret;
+
+	reboot = devm_kzalloc(dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	ret = psci_reboot_mode_set_predefined_modes(dev, reboot);
+	if (ret)
+		return ret;
+
+	reboot->write = psci_reboot_mode_write;
+	reboot->dev = dev;
+
+	return devm_reboot_mode_register(dev, reboot);
+}
+
+static struct platform_driver psci_reboot_mode_driver = {
+	.probe  = psci_reboot_mode_probe,
+	.driver = {
+		.name	= "psci-reboot-mode",
+	},
+};
+
+module_platform_driver(psci_reboot_mode_driver);
+
+MODULE_LICENSE("GPL");

-- 
2.34.1

