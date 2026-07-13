Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168033E8357
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938375; cv=none; b=UAOrfwH6hsoLdobI7ml9xx7gFmT5h+2xT+Tkjzh8/hZwDPmwpLwgOjUEPHx1NBgKcs0At8soVKCqv8Z0YSeMFhuBDFWNONB5zFOfAVPQP/K7z5O0hHlsYv60XZ97sSDnvIUURDYajSV6qo4ijFW7P6FyZYN26gEJfaCppsbl/HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938375; c=relaxed/simple;
	bh=mE2NOrJHdxoNBGv2gxgWjLwSXG+AZyESlOGt4lA2jDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mE0C48edsdhKeGuWEgGmoVAdDB9jWYpuRAf+Ej6BKjumkWL/spsXSGilUEUwISEUNIl7QTvqFEXt73r2yZoUODVrJrGBEygIzmYuRQmcLl0PJfp3OCujZ0Am5oMhwmkNOj5aT8vSUV0fdFiOZzPArKRexvBJlL6OnauyIXQRBPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSCfBlZV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCx3Ragw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSCfBlZV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCx3Ragw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D98rm6793130
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WF5vb4LRAOTAx+Nki8DeZ/zZKC0/L4nU8n/uNSdhpQA=; b=jSCfBlZVqU+GwMwT
	lTpOiKiccdkrgjBZaTgKWSUzmqiamqxlgn5zhFoqQ6nxcaD3SW8kk3ixfa9RNDa+
	9BbAqnphm/izenvTxGqqVTScgSPuDAiddRasXfcClre8SkD9ck22a2mNsFX/I5Mj
	cxmH+6TdlE9PAsxKnM1hv9A/eo5g6alftEzhABrOF3kb4yD8mFZHcJ9y/+odF2JJ
	1LwqZn18XFIOLb31JxgDm0pPzjTmKY7mOlA7qazxhG56IT5Wn7eh1T/fwMx6TkG+
	tC9M5GB8b6jICmU1h26Ja8gucs29vlYaNkivXLJ0n1g0ixWXzkxi0Xnsqw6MAPPY
	qL0t8g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qr8r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8483e038efeso3321597b3a.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938373; x=1784543173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WF5vb4LRAOTAx+Nki8DeZ/zZKC0/L4nU8n/uNSdhpQA=;
        b=DCx3RagwcAri3rTm9kQ8lHNzWjVj+XbRfxfc3GX1GsGq7bc0FyI4zAFX9CJ0Sn5oM+
         wRVpHfFcU3+QWgzjfQZUog2n95xUbkPIqaAwr/wwSDKj5v51t0iYLKoc43pEpBLLqhVI
         H1D337jdIAAGZ1JMBT6tHUbmOcWEIuLtCsIq7UYv2jwWVrpyl1dpNhbZIHjs3nL/gr0q
         6UbHzh5ZxcafeWUIVikjVY0I8bhVhdySmWIbdlxBhLYDLCW/Jiu7/Hnr1AXrhOAKguc4
         Q8AhCUAzilI5ZkVloObmiHImJ5s+XQPKcvZuO7+rLm65KfjtuDg/cYM6Ua8fYYo4A8fp
         k2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938373; x=1784543173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WF5vb4LRAOTAx+Nki8DeZ/zZKC0/L4nU8n/uNSdhpQA=;
        b=rdTOmEo8tFDaoW610vTg4Jze/Sg1OUomN7Mqzoh/G0wCHhXKR4JOxQ7vUmAD+cYk38
         A7HjSa0o71gtrYerYHxzLA6uN1WeuL3pv+s/elpXAEDhHGaaAckQr8yZ/b2vhhmSP50s
         fgbAm9aMG6kuhKWsOA35WrcsZSQHDgpRD0c/LWpM7XVOTuknvSXDBMytqVBGWAC9Q33q
         GcrhXFeX5wIGlA3obWJ3No8PJcePcsYHrKPv/JefsIu2TCDXaBltRYLN7E9SmFlsp2FX
         WUd1zLIO4P4SBplC7k7CSFEfEtlXFCURZyVuKWRvW4urPFO6Jfpb50zC0jBYThUUVM2B
         yj3g==
X-Forwarded-Encrypted: i=1; AHgh+RrJt1GbU3oRx7Askf/K7itUPT18M5EaTsG8yfEhjZKY5S5lDEDQ7WYzyTaI/9arQZu0YKwjDiyuQVfr@vger.kernel.org
X-Gm-Message-State: AOJu0YwOhXekHD3QV5wCErRDz+VI5aE+MhqnWxHyBmZDAYsuswoXYphd
	X+pRKAjPteYwUqkcKeqf3bYw5SXlfWYe4PxqGeoRLl4jCGWFH7iI7pRn+LG75bpneFxAeh3aWU/
	YzNGJvJIU3H5/xLCevpcypF4JpCP9jTLnWERq6QV4JNy4gZsaLBjcifh7VcwTK/CX
X-Gm-Gg: AfdE7ck7OXzoXKWf/6Wrckr59Uzr2LWg8sypW7viMhMgK56LxDUrBRSzXd8iv9pZMYJ
	3Zn7MoyGDoXtMJlQbAYc0T9OBhNqUqfLUXreMcty4BLObSzQghYjirgjh8QwZ0RNGH+u3ohoQnN
	lTzM1PTv8nRw+yn4BsXL4Xe68PvN5Of9HvWskWvHZal+7mp4cXp7Ft60kVJavcXlzXj8vTtobnz
	FnEsqLqlyK/88Cx7+WK1sqGs6tcDawi4BgDRDhwIi0/+mGMiPA0Bmq/rTBhSSPccEpbzOmbhXdU
	z9iegC2kW0aLIFX3IjAquhKM8zze8N0KBFCpJEmDBEpl3Vxpt6/Ch134ddzlbnI4A/YgAp1RY+j
	6Z+xMp7WBFPGZpcIOKzKCRCvRJpfqOCR4oBzbh+s1
X-Received: by 2002:a05:6a21:32a2:b0:3bf:6237:4d4a with SMTP id adf61e73a8af0-3c1108c0ad0mr9582164637.24.1783938372645;
        Mon, 13 Jul 2026 03:26:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a2:b0:3bf:6237:4d4a with SMTP id adf61e73a8af0-3c1108c0ad0mr9582129637.24.1783938372135;
        Mon, 13 Jul 2026 03:26:12 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:11 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:42 +0530
Subject: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=8212;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=mE2NOrJHdxoNBGv2gxgWjLwSXG+AZyESlOGt4lA2jDE=;
 b=6hB4A5JUCdcjPjDBS8E9RnqPqOu7fN2p9bj9L1bmCYfeO2z7YGHprFsohO869aIxwkC7v1Ifr
 uEITKVpxrc9DW0NOMT6M4YJhVXfJkZ1D2cRJgF7nV5BCJJEnqC3dcCM
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX+xxLfP6Ki9Ex
 6KfYzneo0YIVd2LUd1VRygs4clqH6qOCWYHzUSKdhilaf2IifBn4qHWTZnm4C8zPXAK5N3Lotkr
 fzZXyUV41L0EI4nQMH2lulOlbccewfwK5jIDuREnjuRN3tN1PUNCgysv8rqF9bApIFbhgUDgnFN
 sql7S33LfJnCgpOKeaSSNKdzqdAor4YssD9pfQp6KLBJtscVo2qtovd+LOIWr+CfgVdnMSR2J7Q
 1OEet4ffHqK+OV9nCiKVrwXItShRmocN5N7sMhpvp9FYy6VC+BZQi92tpoZo7FbPE7yLad43E4+
 kEjN6WdWgLo0r504Dhf5djPSA+l9pLzB+YLf0MOyzCGOWzLcAk1vcVC7dWfUcQVpbEWXr02ga61
 vIkdeNErW8OPDOm+2EVFKoGv/zjMNtOr0WAHuje3MkfjQUc35mVPO/qPR9mNR7kfEhD+pfxoBPS
 OxA9xno3pB3Gvm+kWuw==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54bd45 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Pm_V6pOYiEt6IFNPE_0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ROBBZSvR9ZToMWKdWT0Eaw5VcoI8T3Th
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXyg0mKds/vblo
 qWePIDa1B/X6BHEE9sKjF978qw+YRGo85mmAQSY26hvP4qVOu8kRibxiiY9q9+ugcqnpDo1TGyJ
 9YpZo2pPii0GtCiXWK86VRJ1bE4XzL8=
X-Proofpoint-ORIG-GUID: ROBBZSvR9ZToMWKdWT0Eaw5VcoI8T3Th
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation introduces a hard probe dependency between MPM irqchip
and CPU cluster power domains. That is MPM irqchip needs to finish probe
before PSCI power domains are probed. MPM irqchip can be build as module
and can get later inserted where as PSCI power domains is not a module.

For in-built driver cases too PSCI domain gets probed first and later MPM
irqchip leading to failure of CPUidle states.

Detailed flow of the non-working scenario:

psci-cpuidle-domain.c probe
--> dt_idle_pd_init_topology()
    --> of_genpd_add_subdomain()
        --> genpd_get_from_provider()
            --> fails to find parent MPM genPD provider
                --> returns -EPROBE_DEFER.

irq-qcom-mpm.c probe
--> of_genpd_add_provider_simple()
    --> genpd_add_provider()
        --> MPM added as a genPD provider.

Now when psci_cpuidle_probe() is called to probe the CPU idle states, it
tries to map the states to the mentioned power-domains.

But since power domains probe has been deferred, psci_cpuidle_probe() too
will return -EPROBE_DEFER.

commit af5376a77e87 ("cpuidle: psci: Transition to the faux device
interface") transitioned cpuidle-psci to a faux device interface.

faux_device_create() calls faux_device_create_with_groups(), which ignores
the probe return value, and destroys the device if dev->driver is not set.

This will lead to psci_cpuidle_probe() not being called again, resulting in
all idle-state devices failing to init in SoCs setting MPM as a parent
power domain to CPU cluster.

cpuidle-psci.c init
--> faux_device_create()
        ...
        --> psci_cpuidle_probe()
            --> psci_idle_init_cpu()
                ...
                --> psci_dt_cpu_init_topology()
                ...
                -> dev_pm_domain_attach_by_name()
                   --> __genpd_dev_pm_attach()
                       --> genpd_get_from_provider()
                           --> fails to find CPU genPD provider
                               --> returns -EPROBE_DEFER
                                   --> return value ignored and device
                                       destroyed

Move the RPM notification handling to the GENPD_NOTIFY_PRE_OFF callback and
register MPM under the CPU cluster power domain.  Use runtime PM to report
the default RPM_SUSPENDED state to genPD so that the CPU cluster power
domain can enter low power mode.

If MPM has not registered with CPU cluster power domain, utilize the CPU PM
notifications to manage RPM communication when the last CPU goes to power
collapse.

Fixes: a6199bb514d8 ("irqchip: Add Qualcomm MPM controller driver")
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 97 ++++++++++++++++++++++++++++++------------
 1 file changed, 69 insertions(+), 28 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 181320528a47ac1bde6cf7d2d0a9f79499990092..01fd1843172aa22760d359281e39f0d9394bab6d 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/atomic.h>
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -18,6 +20,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
@@ -84,7 +87,9 @@ struct qcom_mpm_priv {
 	unsigned int map_cnt;
 	unsigned int reg_stride;
 	struct irq_domain *domain;
-	struct generic_pm_domain genpd;
+	struct notifier_block genpd_nb;
+	struct notifier_block mpm_pm;
+	atomic_t cpus_in_pm;
 };
 
 static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
@@ -292,10 +297,8 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
-	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
-						  genpd);
 	int i, ret;
 
 	for (i = 0; i < priv->reg_stride; i++)
@@ -307,10 +310,59 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
 		return ret;
 
 	mbox_client_txdone(priv->mbox_chan, 0);
-
 	return 0;
 }
 
+static int mpm_pd_power_cb(struct notifier_block *nb, unsigned long action, void *d)
+{
+	struct qcom_mpm_priv *priv = container_of(nb, struct qcom_mpm_priv,
+						  genpd_nb);
+
+	switch (action) {
+	case GENPD_NOTIFY_PRE_OFF:
+		if (handle_rpm_notification(priv))
+			return NOTIFY_BAD;
+	}
+
+	return NOTIFY_OK;
+}
+
+static int mpm_cpu_pm_callback(struct notifier_block *nfb,
+			       unsigned long action, void *v)
+{
+	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
+	int cpus_in_pm;
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpus_in_pm = atomic_inc_return(&priv->cpus_in_pm);
+		/*
+		 * NOTE: comments for num_online_cpus() point out that it's
+		 * only a snapshot so we need to be careful. It should be OK
+		 * for us to use, though.  It's important for us not to miss
+		 * if we're the last CPU going down so it would only be a
+		 * problem if a CPU went offline right after we did the check
+		 * AND that CPU was not idle AND that CPU was the last non-idle
+		 * CPU. That can't happen. CPUs would have to come out of idle
+		 * before the CPU could go offline.
+		 */
+		if (cpus_in_pm < num_online_cpus())
+			return NOTIFY_OK;
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		atomic_dec(&priv->cpus_in_pm);
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	if (handle_rpm_notification(priv))
+		return NOTIFY_BAD;
+
+	return NOTIFY_OK;
+}
+
 static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 hwirq)
 {
 	int i;
@@ -327,7 +379,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct irq_domain *parent_domain;
-	struct generic_pm_domain *genpd;
 	struct device_node *msgram_np;
 	struct qcom_mpm_priv *priv;
 	unsigned int pin_cnt;
@@ -415,26 +466,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (irq < 0)
 		return irq;
 
-	genpd = &priv->genpd;
-	genpd->flags = GENPD_FLAG_IRQ_SAFE;
-	genpd->power_off = mpm_pd_power_off;
-
-	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
-	if (!genpd->name)
-		return -ENOMEM;
-
-	ret = pm_genpd_init(genpd, NULL, false);
-	if (ret) {
-		dev_err(dev, "failed to init genpd: %d\n", ret);
-		return ret;
-	}
-
-	ret = of_genpd_add_provider_simple(np, genpd);
-	if (ret) {
-		dev_err(dev, "failed to add genpd provider: %d\n", ret);
-		goto remove_genpd;
-	}
-
 	priv->mbox_client.dev = dev;
 	priv->mbox_client.knows_txdone = true;
 	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
@@ -469,14 +500,24 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 		goto remove_domain;
 	}
 
+	if (of_find_property(np, "power-domains", NULL)) {
+		devm_pm_runtime_enable(dev);
+		priv->genpd_nb.notifier_call = mpm_pd_power_cb;
+		ret = dev_pm_genpd_add_notifier(dev, &priv->genpd_nb);
+	} else {
+		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
+		ret = cpu_pm_register_notifier(&priv->mpm_pm);
+	}
+
+	if (ret)
+		goto remove_domain;
+
 	return 0;
 
 remove_domain:
 	irq_domain_remove(priv->domain);
 free_mbox:
 	mbox_free_channel(priv->mbox_chan);
-remove_genpd:
-	pm_genpd_remove(genpd);
 	return ret;
 }
 

-- 
2.34.1

