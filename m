Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0A33FA5EF
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768862; cv=none; b=UpVglQRjGisINU2bygKTeIYtuynMAGIUH/S3u9xhl2eriF8aqkOGncAxUVuok8uo2ze/yeskBK7S1o6FigNyc961iV/d/McMM7f69zdEt0Ue93Eyj3vcWuwOSNY/63dqHJ3CkKGAXQe/lHqZ6exNpaNm8MbdBBOPhKfSvcI7VpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768862; c=relaxed/simple;
	bh=bfZxbVm6xwqrZva4/bjqZKtMacFd3ZN//N6v7LMpV10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQPMPD8lj7LAxCPNPFjowLSi/fsXCQ4piO7A0xvy8L5k8+Ejoo8ePq5NNuvNMFrpL9MGSjdJrPIQ+lDXC4u6tZBsKdlaqyrPAbhaUbtP49abrTwKlC9Ag4w7nVxVALY8GRPb+zkGumXiAlXZNQfIwZdeL6cYhhq+RTFdQWh7rvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Za9oxAA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apHmfJ1z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Za9oxAA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apHmfJ1z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeRwh2713163
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gE3d/1mqNsHcbczvOKMFyfwo4Ec0LoAPoKWOy4Q3dy0=; b=Za9oxAA/rF1GkL7y
	+mI/3RVDP6D9uz3lcEGB+fbN7gbNSHIyw39ynDpsUMR8QWXxUQWyTVsVJy9UElHf
	7HeMFJZh/3h3j7vWu+zv+Yi/smAiz6I4ygvlI25wm/GiVlde2p//43DlhdJEMP0D
	KHsj2nkBJDVGWGqpayU+6c5x0DAKqjZah6TQOyzDj3tqnx1YGpOSPmhsPFxIbZkr
	PczI1101hpvJDFbM3j6C1zuGsI6UG1cGHsTaJK9vD37fkeai+24a9A+Y66zBzzIz
	01+759ZIIAqOw2RhCv937VNgHNiWH+L0SlBsC4KoIOHv8Th5rJ8x6SED4CSio8XP
	dUUuHg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89phm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:27:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7aba0af02so84343225ad.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768859; x=1779373659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gE3d/1mqNsHcbczvOKMFyfwo4Ec0LoAPoKWOy4Q3dy0=;
        b=apHmfJ1zOdSeDxUnqZGPhVN7cT8cSHdPt2r8A5tmpYOVXJwtbCk9ft4MiX6Tv6bSc/
         ge5y9e/cKtaUr3Rabd4+xvC8JLwYaRQ7GBNVpISmIJMNCR+OOZHLYX+bmuYJ8CgrJuaK
         jIO6nxSh4YXIqsTsYAFDhD4aFciQdb0Qt1pEaDR/GyIvsWLeKKkG4tU0tdmnVPLOO0v9
         PVVWF8GcEf7JKlJp8ivQBMp+Uvf38Gz5o9bmXe6njoEGkw6IN6a1lkwLx3oY49W7Qz8P
         QUdVQhex+kshr3WglUBcWa6YY7THVX+T/KxsrMdg8kWXjHpM1NkqLaq2V7D84Op0G+se
         esbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768859; x=1779373659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gE3d/1mqNsHcbczvOKMFyfwo4Ec0LoAPoKWOy4Q3dy0=;
        b=LbM29SOiz3EcDsvWtYdVN4KwCfMtdSiWRPvtJ4puyZfmDLnXKGmApDLuhC3p5rmFiq
         IoSTB2AWJSSv0h3ECZDTrGawyu/Nqn6QAwQlHB7Znm4ry7TBRddSQbRtsQ9pVvRA9xKH
         7uPVEJu+dVm8jtFJ2y8WsrJqEz9hCW0ixZcjV5uKQ7tSpmsMc33PpxHiaBl2hnHABGdW
         UsHWFcjLdac64st5oU0d/B7Nh6cpiVEGr1g0zeB9KUuLtpGvlRWAYNNptRpoYfOadLPl
         yeEpwR4eRcvpBvtMlt3MAiPBJqLUl/BeEuSb+KfT77iphM3vl83hzhK+bLE6sVlwzhPF
         OkmQ==
X-Forwarded-Encrypted: i=1; AFNElJ94sCqaM2p7Ib+6m7DyTUdC2Fx60KHJZYnhtFNybPAizG2g5A7YQcBoT/S7TsiD9Df86t7abkH7RC4F@vger.kernel.org
X-Gm-Message-State: AOJu0YzfvUTkaYrZLY34AnPc6V604otc7ZRae6dW49znzjo7RW+jepsJ
	JIAZhW0FogBEWY8FK4bgkl59krCgs6Qotw9KOVwFvDKBnnv+aVwBRUpdqzwzJrnVFjbd4HvoWoa
	H8OMwiJa+2if6vYpEU/rjnGwWUsXKtYCbqEa7/kb3fZSQtz7Eqnxc0DeHh6hRqqgP
X-Gm-Gg: Acq92OHkZ12s4d7UYT4ZYtQ/SmsEK7a0qLLVolP9WLFKt/VH34KfHaBxNnCvFCpZgHh
	EzYOO6PoODMB072GNuQh06gVYJH7CwOn/k4eqR4a+xh9GATllTg4Cq2/HszWf5VugnV9RWF81DR
	fs+3Kzz/RMOV/sIUsq3dwpWL4A8Fts6t1qiIv5krlXm1Jf6hZCxFDLkY7Gt7xu0j6ofzt0x1t5h
	ISdTe7ffmFwqW4t6FHyFBB7V8GlvnkZWtlMoaQnmdbm71MUU0ZG/jRDFiv+11yRCPH6Su2ALIej
	EUmMTCL1BamzyVwLHyIuAOWi+/jANAlycX9CymzBtQhUB2yY1Habu0mNt4P9t7OMA0HZlAZsGhd
	0SvlRG1QSy+9EZiydj6dvBPWEzkNSrzzZvMd8ALM/N2b9nOae+5TokJ1jRnPHIxeSr8v1
X-Received: by 2002:a17:903:120a:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bd2ff2a51emr89557155ad.31.1778768859252;
        Thu, 14 May 2026 07:27:39 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bd2ff2a51emr89556465ad.31.1778768858626;
        Thu, 14 May 2026 07:27:38 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:38 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:45 +0530
Subject: [PATCH v22 04/13] firmware: psci: Introduce command-based resets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-4-28a5bde07483@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=6677;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=bfZxbVm6xwqrZva4/bjqZKtMacFd3ZN//N6v7LMpV10=;
 b=9VP2h6vkEBUeop0sGH+o9wi/BYjMPJpDm4SM0A71zlJUWo0XDTwDWz2RdsH182u6VrBzGPm6m
 uAduIwm2DyGBXkPoCr07IxmqXWX2D4r97bu98kkKpDuxmVeuv6PtSxo
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXyv8x6hgPfriQ
 YW12U9o3UtbRelyK7WfkgJY9D3+P3DyQwOvDs+HEvEPbkn05UQi/EJRgT3fswosTOu6AE3nNnlc
 JIs9OgBQDwe49SemK7WzEfhG+g6lJl4wBqhiLz5tmWPN0JRzp+SNUP9TbWoDRaGkHb2GG0cslEu
 hhTaHVJuXhN7BpMP9E+4n9BgzXGK8w9xJiVYqf0PCO33meLttpn6pic3D9UhA9jFjpvNTVovlR+
 2Jq61TyeypioUH9o1tw5XOMBy+ME5A48nqaootpTmJNPpZfHT0CqgtE3FAxPfgt/tDWru+MQl/x
 FbS89dsOUUKxnGc5uLk3GQKq/c1AWleEEwhpOAm4XP0tdIUnSWBpo1qWBLZ8OOjJUhxp4cOU3YB
 Ejv7ykFa/df66/Gce9lv9mXD9toEhSyvh4aB9cAFa52VE4m+yKJ0xY1+yBRD2n4frkPIetGkMKb
 erslLu4K+tO2EYCppxw==
X-Proofpoint-GUID: Aj11NuAvpqK6LFVikZIBFf6BdSqpnnEp
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05dbdc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=syBxKCaIGq6wZv0syL0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Aj11NuAvpqK6LFVikZIBFf6BdSqpnnEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146

PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
ARCH WARM reset. The reset patch is selected based on the Linux
reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
for vendor-specific resets but there's no mechanism to issue these
through psci_sys_reset().

Add a command-based reset mechanism that allows external drivers to set
the psci reset command via a exported psci_set_reset_cmd() function.

Define predefined reset_types - PSCI_RESET_TYPE_SYSTEM_RESET to map to
SYSTEM_RESET, and PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM to map to
SYSTEM_RESET2 arch warm reset. Interpret zero cmd_reset_type, for
predefined reset-command selection via cmd_cookie. For non-zero
cmd_reset_type, check for valid vendor_reset_type and set the psci
reset_command and cookie accordingly.

Disable PSCI command-based reset by default and treat invalid reset
commands as no‑op. psci_sys_reset() follows its original flow based on
reboot_mode until a reset command is explicitly set by
psci_set_reset_cmd().  In the device reset flow, psci_set_reset_cmd() is
called in reboot_notifier phase and the device reset happens in
psci_sys_reset() which is called later in the restart_notifier phase. If
a kernel panic occurs in between these two phases, the reboot should
take its original flow based on the value of reboot_mode. Disable the
command-based reset in such case.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 75 ++++++++++++++++++++++++++++++++++++++++++--
 include/linux/psci.h         | 19 +++++++++++
 2 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a3bfa6441503f667b0ffdfcd72536..4e0710ab09cdb0af7280ff4334aa1ea1bfe95aff 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -51,6 +51,16 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+/*
+ * Encoded reset command:
+ * bits[63:32] = cookie
+ * bits[31:0]  = reset_type
+ */
+static u64 reset_cmd;
+
+#define PSCI_RESET_TYPE(reset_cmd)	((u32)(reset_cmd))
+#define PSCI_RESET_COOKIE(reset_cmd)	((u32)((reset_cmd) >> 32))
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -80,6 +90,35 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
 
+static u32 psci_fn_from_cookie(u32 cookie)
+{
+	switch (cookie) {
+	case PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM:
+		if (psci_system_reset2_supported)
+			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
+		return 0;
+	case PSCI_RESET_TYPE_SYSTEM_RESET:
+		return PSCI_0_2_FN_SYSTEM_RESET;
+	default:
+		return 0;
+	}
+}
+
+/** psci_set_reset_cmd() - Configure reset request for psci_sys_reset()
+ * @psci_reset_cmd: reset command encoded as cookie[63:32] | reset_type[31:0]
+ *
+ * Save reset command.
+ */
+void psci_set_reset_cmd(u64 psci_reset_cmd)
+{
+	reset_cmd = psci_reset_cmd;
+}
+
+bool psci_has_system_reset2_support(void)
+{
+	return psci_system_reset2_supported;
+}
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -306,8 +345,24 @@ static int get_set_conduit_method(const struct device_node *np)
 	return 0;
 }
 
-static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
-			  void *data)
+static void psci_handle_reset_cmd(void)
+{
+	u32 psci_sys_reset_fn;
+
+	if ((reset_cmd & BIT_ULL(31)) && psci_system_reset2_supported) {
+		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
+			       PSCI_RESET_TYPE(reset_cmd),
+			       PSCI_RESET_COOKIE(reset_cmd), 0);
+	} else {
+		/* cookie part of the reset_cmd decides ARCH WARM RESET vs SYSTEM_RESET */
+		psci_sys_reset_fn = psci_fn_from_cookie(PSCI_RESET_COOKIE(reset_cmd));
+		if (!PSCI_RESET_TYPE(reset_cmd) && psci_sys_reset_fn)
+			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
+	}
+}
+
+static void psci_handle_reboot_mode(void)
 {
 	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
@@ -320,6 +375,22 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
+}
+
+static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
+			  void *data)
+{
+	/*
+	 * Command-based resets are configured at the reboot_notifier phase.
+	 * If a kernel panic occurs between the reboot_notifier and this final
+	 * reset, ignore the command-based reset and let reboot_mode drive the
+	 * reset flow.
+	 * If reset_cmd is zero, there is no command to handle.
+	 */
+	if (reset_cmd && !panic_in_progress())
+		psci_handle_reset_cmd();
+	else
+		psci_handle_reboot_mode();
 
 	return NOTIFY_DONE;
 }
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc42ba1ca751c7862fb4ad8dda35a4c..c2458291a3faf5ac89b1528dae2c9b805a2dd075 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -21,6 +21,21 @@ bool psci_power_state_is_valid(u32 state);
 int psci_set_osi_mode(bool enable);
 bool psci_has_osi_support(void);
 
+/**
+ * enum psci_reset_type	-	PSCI_RESET_TYPE for SYSTEM_RESET.
+ * @PSCI_RESET_TYPE_SYSTEM_RESET: Standard SYSTEM_RESET command.
+ * @PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM: SYSTEM_RESET2 architectural warm reset.
+ *
+ * These enum values map PSCI_RESET_TYPE_SYSTEM_* constants to reset strings
+ * issued from user space. When user space requests a reset, the cookie
+ * carries one of these values, and the PSCI reset path translates it into
+ * the appropriate PSCI system reset call.
+ */
+enum psci_reset_type {
+	PSCI_RESET_TYPE_SYSTEM_RESET = 1,
+	PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM,
+};
+
 struct psci_operations {
 	u32 (*get_version)(void);
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
@@ -45,8 +60,12 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+void psci_set_reset_cmd(u64 psci_reset_cmd);
+bool psci_has_system_reset2_support(void);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline void psci_set_reset_cmd(u64 psci_reset_cmd) { }
+static inline bool psci_has_system_reset2_support(void) { return false; }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)

-- 
2.34.1

