Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264507;
	b=04Mv+CHWziXmKIqM7QIa11CXqQYs3Q8caPVsG+x8Gv1y6xLGr6gDUY/sJnkKnL/DSjgR
	 +9hNFZKvzLS28oeE3hvMqxqIiRk9qi8jHhRbb0tTs/G4/92dmOvY3uKVW4g91OI40UEYc
	 7ADslNfd3ETvoy1RL5/mq+5dA+ImjAl+Dy872x8HiAuL7z1Ei1+3w57jfKyid1FYLBbwN
	 3/jlS/Mj8nUgIm0nAPdDurS9VRx9PIGaGDT5VNavKF99LpMUvUdxrJXEvf2DLjPhNnzb5
	 SpXG3EjYs5sj7xGuOVIleCwDw73orCLQgd+jS9MYZoMaLh20nFhQic21TAuVoxMFkxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6c7FsVt+6kZf0MJjLIZNdKyh8QTMehkeel45ASz2OUw=;
	b=dECIBneVCuI6nBkrLwqzcptAHFekiMNCzIHmwL5H0Buyoljp7P+uW3l1R5UHr3jXoqYD
	 3PziFidIq+eUEm/xia5tMNWw7rj3YmstuNnemRmaDl2+DuMNUT1QJZAy+7hXDaD7+CviI
	 2MUBWrJzV8fBzDQikAAgCC1e8KTTct9fGzsj4vHHFKo4Zz4gpX3WteCsQItcyO9Hy88oU
	 cVw5RW4GyCp02bl/47t7n/UFqZgx+dIKGYPUl2Yf63Ip53qczElsQHIjt3Oso87e9yrJ8
	 CL/bmRRZsrdx+QHKqJDptg74qzAYiEV/WN1a5CnH5ooZObk8g6b8JrWp9xvvmVL+r/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MNDFmSaO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EMvH8+no;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6255E606A330
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6255E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MNDFmSaO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EMvH8+no
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vQ6K3457734
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6c7FsVt+6kZf0MJjLIZNdKyh8QTMehkeel45ASz2OUw=; b=MNDFmSaO7kMlN26q
	oGHHdpOH/8YkKDkEUCUHy2eDbpjLstGJv/1WYWpqXsHZiV8rFP96J6Qk5VCjJlAu
	9jyOr7U509jGuOhfMOLQCkkLA8EETdp5/o04X9Sl6FPIIA7iFDj4pEMekZWk3g9P
	nUoC5tuGbmcBJqh0+9IZQSt3pAzKeB0vdNNJT5WO6CERo1iZnlIwcKzCIwTCmCAJ
	tqyi35h77KZ9jbouMZZ8gbc2jkoTFbDjvJMVpR0MjL156qC/2/TTb/B2Aji0Q58p
	1LJboJCdmg/WGKX5JUsWELKM7NlH1l3eq69n6P2O13yL0W8CHj5DAITSKGzAVu2p
	g6Jm/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpb27t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:01:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd66551e02cso2086344a12.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264503; x=1793869303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6c7FsVt+6kZf0MJjLIZNdKyh8QTMehkeel45ASz2OUw=;
        b=EMvH8+no1UkMPuWzMxdRKVsaYKvuSGTacG3SqIvdzRHv1XrMtl8VAMMwMo7S55ahjg
         GKzu/97oQmEhavabzWkAkmlZb6PdJRgDxSIFSsq7TguxIPy/wfwbZcfQ5jRHi0/JM1yM
         ztg4AZCGmyNGKL4rqQE+Lv9if2qA3jHd1+a0Q4qLJikuat1rl2psqjBXpCMEBdRh9bn/
         /hkcQ78pmMTdzfrZKn7I3z2aU7sSyXhNPCopyIb6eNLANuT3LyOJiobxZf2FyHalr670
         8X2YKVkkPgEAlU4pPrYDkAoQ7Eursvjb3fqjHvkDJRH/4JDnUg8z6shLWxf+haYfX/+1
         RkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264503; x=1793869303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6c7FsVt+6kZf0MJjLIZNdKyh8QTMehkeel45ASz2OUw=;
        b=TlR1bYugWrWyT3yF+QIEf5NL/FhvbonjnTlD8yddDA/xTcMZdyqkvyGFfRed3bgriQ
         JMMjSNVkXKryQ3iU5QPhrgLgRnNSpN1gpH7F0avBmeW06LMQjJyLDvF/JbeqHf3n5QFP
         x06IsRiJqr4v5oElniWAooLVaDq+8nfrhjpWEsrdGgxpCNc/QiJuzvX0i8V7Y4RnjlQF
         6FP5cxoY/xR5Sap9lifkGldOVOCcl/bUqtVbub5yIz8GbPz0A21LyLoJXJXhyFhStc4c
         1WLVgS9fXi6972/wLCFZgzhDVwZGLvKDSZIrkKFkrKq0utxvoRuAGbglbQ3OBzml3ncv
         NKBg==
X-Forwarded-Encrypted: i=1; AKwUvBx1O3nCi6oVJuTdYyQiRCtcBzDoCOdVY95p9pfmZZMz/oVY9Z8i8y+hnxIhpLNDfOAU7FgpFyzgIENX@vger.kernel.org
X-Gm-Message-State: AFq9FYL5KIAbLMtJ+vzb2X+Wct2mP79kHBg9+ZjUl025n77L14HAkKcE
	RouAh+v4ro2Lq7AONCNWiYLNsOMwzn9QpFjb4zHOwxGJ1CcVc+9d9roITDutD80PHCiZs2CqMnJ
	usdmxdqtUGcQa5l8Pl6cQcUReDIlX98Yqw7vHAVbjQSn40Ge7e7gHk15G9cv4KaCq
X-Gm-Gg: AYBFou29JE9q4r08Q8RKCJCabmTgpjElUZq2JcyizfwISfcKjCs7GfbIuipmuuEOVYp
	1SYPdPhwujhD58h4X5nu+r9L7QdFtgmiqUErHZIGeoU+9hA3n56DNJqUIiHeSO3PQ14ASil54to
	DtZ8r8kHt+XpZ5D9ybE/W9x8v7mrwv0lwUlv5CWpAo8iz1qKA2/wyzQPg030ZtnlPBNiPXl733D
	B/Lf/YCYUZ7BL5wFDAfgh82o47dvbvqobMrKOysBY7qcIY5cG3r28FztOU+852T7vFNAUKEa2Bu
	A+BCjn/mXzu3N8htZsMZDy8U/gtJJX2Wlp0Os6+LWr2ZQciiTjBL54ULt63elP6GwwNKtQuJzxC
	DZN3sSz0vAIJPD6udSONdOK6mcowYsc9G4bmHV5hDdCSc/W5VokySDT2KKum1/NlPVb3ze44iOi
	ZGH8M/+/yF
X-Received: by 2002:a17:90b:2887:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3ae5822b129mr3774413a91.37.1793264502550;
        Thu, 29 Oct 2026 02:01:42 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3ae5822b129mr3774366a91.37.1793264501941;
        Thu, 29 Oct 2026 02:01:41 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:01:41 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:30:57 +0530
Subject: [PATCH v27 03/10] firmware: psci: Introduce command-based resets
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-3-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=8099;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ePR4OuoTlUavycOVnXKN78dPp96WxpPQP3RUTs/YnxU=;
 b=rFbPZmpQdrMFitTL60GQw2xS43zXmLQ65T6z/ZnbKBnAtM55nRiTudK9MHSlNoVNTfO7347Q9
 JKX0IJKBKb8B91rmnZlD4+DVdl3qs/YajGXshizrLE+unwyBdyA70QU
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae30b77 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=njxsUegImOJjkw56WvUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: J2qdrmRydPhR4GAYE8zyz_lE9nGnWT5e
X-Proofpoint-GUID: J2qdrmRydPhR4GAYE8zyz_lE9nGnWT5e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX6bYHeERvIGmU
 G7F0C43jW9Sirn+bBvXA+7j7Y2oMYhFoDdkCdI2XOa2YOaN6d3C7KmFH0pwtxdmVpHeKVGeEoZy
 H6TMDAO1XlxmbWMleiV3DjpvoXzMalY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX9gGefwYyjeZT
 gqZ7+x2cbIEbBJgagID5GLsvf3lGHXHsU2tpulX0YVKJjq1T5Os6RP3O5U0XRzNNZ3cq8p4GINt
 HRjVpC2K1a/tI35mwTMtJL/cjh0gBlE2nKLLP+kjl2PBAM+MfQZJPEyeS2pviF6KPJRE6A9m09D
 Hp+zEsp46/YB+fH9452P5DqDk29DHVj5rVT1KuI3QblFKFWqHAw8i/Fkjx+vO+i6YzqiTNTUvgC
 kNuVeyuyR7OBveDv/3UUvcCXD49jDs9i6EgxOik18TY80wLz27jC+z1qV+TYk0ItKci45tQ5BKb
 R/h6owX8EfasyVv+B2/eEHdgcS5XqPewuWcwwLQjtt3x9/ZWy70OwYjtAzqV75mvUaUug37jzzi
 wRktcNlhLzscUOAxJsIriXdvD0btpUaG8TqReOrYkaxMgK7JJJ1qmm/MSUutaXu7c9QY6EYv2CF
 NtjcfWmGCzT4zClrAXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
ARCH WARM reset. The reset patch is selected based on the Linux
reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
for vendor-specific resets but there's no mechanism to issue these
through psci_sys_reset().

Add a command-based reset mechanism that allows reboot-mode drivers to set
the PSCI reset command by passing a reset_type and a cookie.

Add support for the following reset commands:
  - SYSTEM_RESET2 vendor-specific resets.
  - SYSTEM_RESET2 ARCH WARM reset and SYSTEM_RESET (reset_type = 0 and
    cookie one of psci_standard_resets).
Unsupported commands fall back to the regular PSCI reset path.

Default to the existing reboot_mode-based reset flow unless a reset
command is configured. If a kernel panic() or a emergency_restart()
occurs after a reset command is set but before the final PSCI reset is
issued, ignore the reset command and follow the normal reboot_mode-based
reset path.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 117 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/psci.h         |  15 ++++++
 2 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..d489ba5d147c 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -11,17 +11,22 @@
 #include <linux/cpuidle.h>
 #include <linux/debugfs.h>
 #include <linux/errno.h>
+#include <linux/kconfig.h>
 #include <linux/linkage.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/panic.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
 #include <linux/reboot.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
+#include <linux/wordpart.h>
 
 #include <uapi/linux/psci.h>
 
+#include <asm/barrier.h>
 #include <asm/cpuidle.h>
 #include <asm/cputype.h>
 #include <asm/hypervisor.h>
@@ -51,6 +56,15 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+struct psci_system_reset_cmd {
+	u32 reset_type;
+	u64 cookie;
+};
+
+static struct psci_system_reset_cmd reset_cmd_data;
+static struct psci_system_reset_cmd *reset_cmd;
+static DEFINE_MUTEX(reset_cmd_mutex);
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -80,6 +94,64 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
 
+static u32 psci_get_sys_reset_fn(const struct psci_system_reset_cmd *cmd)
+{
+	switch (cmd->cookie) {
+	case PSCI_SYSTEM_RESET2_ARCH_WARM_RESET:
+		if (psci_system_reset2_supported)
+			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
+		return 0;
+	case PSCI_SYSTEM_RESET_COLD_RESET:
+		return PSCI_0_2_FN_SYSTEM_RESET;
+	default:
+		return 0;
+	}
+}
+
+/**
+ * psci_set_reset_cmd() - Configure the PSCI reset command
+ * @reset_type: PSCI SYSTEM_RESET2 reset_type, or 0 for a standard reset selector
+ * @cookie: Vendor-defined SYSTEM_RESET2 cookie, or a value from
+ *	    enum psci_standard_resets when @reset_type is 0
+ *
+ * For vendor-specific SYSTEM_RESET2 resets, @reset_type and @cookie
+ * must contain platform-defined values.
+ *
+ * For standard resets, @reset_type must be 0 and @cookie must be a
+ * value from enum psci_standard_resets.
+ *
+ * The reset command may be configured only once per boot cycle.
+ */
+int psci_set_reset_cmd(u32 reset_type, u64 cookie)
+{
+	if (!reset_type && !cookie)
+		return -EINVAL;
+
+	if (!IS_ENABLED(CONFIG_64BIT) && upper_32_bits(cookie))
+		return -EINVAL;
+
+	scoped_guard(mutex, &reset_cmd_mutex) {
+		if (reset_cmd)
+			return -EBUSY;
+
+		reset_cmd_data.reset_type = reset_type;
+		reset_cmd_data.cookie = cookie;
+		/*
+		 * Publish the command only after both fields are fully initialized.
+		 * Readers run from the atomic restart notifier path and must not block.
+		 */
+		smp_store_release(&reset_cmd, &reset_cmd_data);
+	}
+
+	return 0;
+}
+
+bool psci_has_system_reset2_support(void)
+{
+	return psci_system_reset2_supported;
+}
+EXPORT_SYMBOL_NS_GPL(psci_has_system_reset2_support, "PSCI");
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -306,8 +378,25 @@ static int get_set_conduit_method(const struct device_node *np)
 	return 0;
 }
 
-static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
-			  void *data)
+static void psci_handle_reset_cmd(const struct psci_system_reset_cmd *cmd)
+{
+	u32 psci_sys_reset_fn;
+
+	/* PSCI_1_1_RESET_TYPE_VENDOR_START identifies vendor reset types. */
+	if ((cmd->reset_type & PSCI_1_1_RESET_TYPE_VENDOR_START) &&
+	    psci_system_reset2_supported) {
+		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
+			       cmd->reset_type, cmd->cookie, 0);
+	} else {
+		/* Retrieve the psci reset function from reset_cmd */
+		psci_sys_reset_fn = psci_get_sys_reset_fn(cmd);
+		if (!cmd->reset_type && psci_sys_reset_fn)
+			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
+	}
+}
+
+static void psci_handle_reboot_mode(void)
 {
 	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
@@ -320,6 +409,30 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
+}
+
+static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
+			  void *data)
+{
+	const struct psci_system_reset_cmd *cmd;
+
+	/* The function psci_handle_reboot_mode follows reboot_mode based
+	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
+	 *
+	 * The reset_cmd is configured at the reboot_notifier phase.
+	 * If panic() or emergency_restart() occurs between the reboot_notifier
+	 * and this final reset, skip command-based reset and let reboot_mode drive
+	 * the reset flow.
+	 *
+	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
+	 * calls to reset the device. If it returns, either the reset failed, or the
+	 * command was unsupported. Fallback to reboot_mode based reset flow.
+	 */
+	cmd = smp_load_acquire(&reset_cmd);
+	if (data && cmd && !panic_in_progress())
+		psci_handle_reset_cmd(cmd);
+
+	psci_handle_reboot_mode();
 
 	return NOTIFY_DONE;
 }
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc4..e81b1cdeca51 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -8,6 +8,7 @@
 #define __LINUX_PSCI_H
 
 #include <linux/arm-smccc.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/types.h>
 
@@ -21,6 +22,16 @@ bool psci_power_state_is_valid(u32 state);
 int psci_set_osi_mode(bool enable);
 bool psci_has_osi_support(void);
 
+/**
+ * enum psci_standard_resets - Standard reset selectors for PSCI reset
+ * @PSCI_SYSTEM_RESET_COLD_RESET: Standard SYSTEM_RESET command.
+ * @PSCI_SYSTEM_RESET2_ARCH_WARM_RESET: SYSTEM_RESET2 architectural warm reset.
+ */
+enum psci_standard_resets {
+	PSCI_SYSTEM_RESET_COLD_RESET = 1,
+	PSCI_SYSTEM_RESET2_ARCH_WARM_RESET,
+};
+
 struct psci_operations {
 	u32 (*get_version)(void);
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
@@ -45,8 +56,12 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+int psci_set_reset_cmd(u32 reset_type, u64 cookie);
+bool psci_has_system_reset2_support(void);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline int psci_set_reset_cmd(u32 reset_type, u64 cookie) { return -EOPNOTSUPP; }
+static inline bool psci_has_system_reset2_support(void) { return false; }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)

-- 
2.34.1

