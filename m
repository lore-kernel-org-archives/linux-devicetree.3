Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106765;
	b=c96czgGEFxzg5CVADAN5j30XNaxZqfEV/SjIFLNvjgVLN321fkKKYu9kZDUi8kFLOaK6
	 cwqynQduFSbBPBgnXLR26Lj+tH0taxnxZM93J4wAmZ380d//An1YeD6/xdVRBZXRaaqd4
	 THmMJzZ35aZTtQUqiqzXkT2pTm6SyMWpMUDWMLDJycQDinog5d2QA3lcFCsl0EwJ6IYhU
	 +JpUI+jKmD/9YPZG+6AxWZbA9qyZjtDloxdNkgFXneuzWMjbK03Ed5dckEh32uE4Lswsr
	 z07LI5r2+Ww6lXJ+HmpRtCbzRkupRJkGy4kdFXmqg9gEHMQ5a9LvFn25DOhJSP6tYuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=;
	b=UWVGjkMf3DuYsn6Bb3EYIbDH5u8z2EcxO7YlpokN2h035evdaRYot3BgfcgHv9aRYVzv
	 ukQQ1L6wanW9n/tM3NvVv6BajSRPzrqCJu5Zl1FcYyi/Xdc/m/W3pKoEV+ytxgb60IbON
	 1i25pzUQhz8iNTnSHoOjnYTpiig4kX3exURrtET8WRdSBUX/uicJQc1JbNMNA3wIShfMt
	 G13k1y0MN38aVQvuwA9iVbM3BhIERE2gV0oapKztfSnah/mJw7wwB7/yNWlfWMkStN93v
	 sj+oWqhs6F368cvcTlp8XayS9KyQBHwQz+3KSYaA6B7zUG6oWHxmAi2VyCUD/hmKmeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ca6+0FZ2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnyDGOWv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62856606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62856606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ca6+0FZ2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnyDGOWv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBmh3012001
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=; b=ca6+0FZ2ppaUgxtp
	qcouJXUDvv8HdbSis00zffytYt3AYzLQqN7iNpGVvxTtOc3C8XAhsNEWDJWoqAoc
	/Hn7fmNkj9yYqMkhdFM2wY32iUYFIeEHU+lnePniAv/xWlpRaA4+/WryNIe3iH2E
	OO7VYGCBHqAK2EFG7PeyYCllVHGwtEbo5fFGiph3RzVqVWt8uwHc7fE2h4RLGItd
	4VTnEGonkkNrRaUG2VYqGB1Bqb8HrrDzYSfzq22t1kskS96AIqTY/ysaOELjwK9m
	itdfZo7FWy6q1tRovRByw8WokH4QBbV4uxFrxjAzkRUbuQpB2rO3hxEQApnEG+uf
	TBf8bA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3db5yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:12:43 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b160a0ceaeso40461527b3.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106762; x=1793711562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=;
        b=JnyDGOWvhnABc5IvO3tx6hFgm90yrBmmZanZU1/xMOzDF3l6Hpx1+jMO8ETcYu+ynJ
         Fb0ePO7KxDjp41i4bpNfo77npAH6/wpJcDK7g75Z/ErharsazKFzWyl36BUNwxeshH3R
         pJ4RZhmDvo8CB9asg5IghekfUPNG5+DedRQk1wpU9XAegI5iKJvstkndB9QhN2WNrV22
         gpzNy6iAU6EX/g2JRpEgzwOX6MQ7xlwVMXUgaGR5gZ8eHPdXyIRI2SbdGrXbxkAoBfy9
         Zinr0yvmw0vprmgYz+aRQrSmYSuA1oXjhon0smY1OMcWfDGHahm0+YvUCZT07xrmaknd
         BDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106762; x=1793711562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=;
        b=i0RThmHZfh2oNUds6bkMPlZgxCwPTBGfab3HkzbImYFJyfNWL03qqp5umitm/NVkOx
         rfwMmRZ07xc6TLjemjYNepBJ650eXIauWDKyTvbKfPoEENWZzDuQNvPTFVkd6cNJSe/V
         XiM3nNSJoeS5mnc7V9AMOXDB+XW/Unzr9HzvE09FdrT2V1v8x4PzcZD8ky2J4tRqxcka
         TGpOuHfOP2h7vYVWO5T6krKwPDYlRpk52zpd/Ctq/0A07dF7PMUJ7fcYcOvbSyrlJNbk
         hLptBmGMBRcT2QTwNpGbHIFddS2kTcOMbi+ZhK0HWumRIVsotQ1Dgi+EgDBy/2KZg1gJ
         xkjw==
X-Forwarded-Encrypted: i=1; AKwUvBzioX9GAefJSiTiceQRKg0DJy+EefW1fIkjfFTY5oFdsf8xha2G/nxXkmNh8nznyY+KwLBhIVNKXYGx@vger.kernel.org
X-Gm-Message-State: AFq9FYIQbLLegWGwRic+ZQJoXCAUImg6+QyAvP3sObIjNiYO2K8gEItf
	WkQLK1MZhgOM9oeW4cW/zWbgS/gqbTXSVazqzT9YyXCl1WU0DlWvIpaZfTbwsUKAGzCCNvXQM+7
	G7hqzx8q6l1QWK+eXjmY9Fp5xTmA96a9kay0hnG3FaZDAxvUw7iX78TcENBe59v9m
X-Gm-Gg: AYBFou2pYIRXJciekvLcJ4PLe7DvrBjyq4a5w3Vvsh8M3Nr1wDgstzznFyTT92uYpMg
	x9VLPCa2Q5szyt86ROMQlmWD6brD5m96QWq+Yf5nRoUcELFC2gjOUqvkOMXRCBeneML8SH3qDDY
	ChxjDYGgxkTyzYzQoPAT3KEcLNeeKBSzTCNUk3gTFTIRldqnRTaKSU/1OenZoTEX6xZZ4Y01i+O
	F9wVYCR5gK6C1H6jqeTTerXdm9BnGOIc8NAszg1SBjfmktGSfTpbjjMxD0R5k/N9fFOygION7UG
	pRgAu48t1LBAJ/666aivuSA1NmMeOGSHVMgFpYBYbVbLeM12MP8O1YeLrjNC10jKo1LipdtsESa
	PZbOMZHnh9+9UEbGUMxNPMraB/M9D
X-Received: by 2002:a05:690c:660b:b0:8b0:ea15:fb61 with SMTP id 00721157ae682-8b166c4cec7mr58168677b3.71.1793106762177;
        Tue, 27 Oct 2026 06:12:42 -0700 (PDT)
X-Received: by 2002:a05:690c:660b:b0:8b0:ea15:fb61 with SMTP id 00721157ae682-8b166c4cec7mr58168437b3.71.1793106761634;
        Tue, 27 Oct 2026 06:12:41 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5ea7b9sm10743547b3.32.2026.10.27.06.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:12:41 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:41:09 +0530
Subject: [PATCH v3 1/2] irqchip: irq-qcom-mpm: Register MPM with cpu_pm for
 RPM notification
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
Message-Id: <20261027-b4-shikra_lpm_addition-v3-1-424abcdcf824@oss.qualcomm.com>
References: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
In-Reply-To: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793106749; l=6732;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=B2aw8nOLksP/v4UrXDlB3J3clvj0LTblXgAVl4nQhYc=;
 b=8r7GMgNARmMKCP7BrzhVEKlMvq+X1jK6HAV27ijgwbGiHeGozq+Bjl3yiccR06SC0Zrmg4NXX
 flKAt7sOzQdBYfWuCUBzpJ8/nHjrCALlvkkogadejIqKIkC6R/r6XMz
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX65TRdT0DtVZ0
 h6M0Dny9026buTIoLZcrNKXvnXI8DyU/cdxZfc+Qcifu1e5C/WDcmAcZecxk/hAfEmnB+NGP4BZ
 2jnmdFSoS7pq5Xlq/SiDQudSgde/bJw=
X-Proofpoint-GUID: 407i1mkI2sH-zI_M6zGCK1RjQPUjskdE
X-Proofpoint-ORIG-GUID: 407i1mkI2sH-zI_M6zGCK1RjQPUjskdE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfXwEozQyejQ5dp
 KU/mema4KpYgAkRv+gzZG6w2N5/4n0MlIq0yJAWz+X0Sbk2YthZzPS9iI93VW8OHM/E8mINCv9S
 lATSE3GuftWJjucebCcS0uqVtm/FrIRdzf3bUmm1JOgzgKJX39P04QDlutU+O42CB1XAurxug2z
 hnrqDb+/FWdiGIA6Tb2dyNVGN6EeJOsbKBo07+SyfgzTwos4heHm8PVdZc3OfspkVXHMWnC+TQ3
 /nqueOasEjITOCNSgjEERDqEmsoVPH/tJ8ozrCL6cFCkWBk6bx9ldY57n39PvdUEDUMCPzPuHxN
 KYXZcp9FEV5SgiDiwSspu0qfBCy8WDzNwc9B+A/QqkJWkGoQ5Pb1IE2i06kZ7mpyJljH6wfOZ61
 mVmt2koFdmBZIONK5bIgQPzZOZZJzoHL1HQWEkZlzoTuxjDoNY/cwm+nYJZ5wA80StA6bEt5oeS
 THj2zsYvj7NVk8S0arw==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0a34b cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=lt-0Ylhkz4Il63NEeiEA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270052

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 104 ++++++++++++++++++++++++++++++-----------
 1 file changed, 78 insertions(+), 26 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 181320528a47ac1bde6cf7d2d0a9f79499990092..136d126f0ea24bb10b5183d6ce47b630aa77b0cf 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -85,6 +86,8 @@ struct qcom_mpm_priv {
 	unsigned int reg_stride;
 	struct irq_domain *domain;
 	struct generic_pm_domain genpd;
+	struct notifier_block mpm_pm;
+	atomic_t cpus_in_pm;
 };
 
 static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
@@ -292,10 +295,8 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
-	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
-						  genpd);
 	int i, ret;
 
 	for (i = 0; i < priv->reg_stride; i++)
@@ -307,10 +308,52 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
 		return ret;
 
 	mbox_client_txdone(priv->mbox_chan, 0);
-
 	return 0;
 }
 
+static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+{
+	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
+						  genpd);
+
+	return handle_rpm_notification(priv);
+}
+
+static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
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
@@ -415,26 +458,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
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
@@ -444,6 +467,35 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 		return ret;
 	}
 
+	if (of_find_property(np, "#power-domain-cells", NULL)) {
+		genpd = &priv->genpd;
+		genpd->flags = GENPD_FLAG_IRQ_SAFE;
+		genpd->power_off = mpm_pd_power_off;
+
+		genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
+		if (!genpd->name)
+			return -ENOMEM;
+
+		ret = pm_genpd_init(genpd, NULL, false);
+		if (ret) {
+			dev_err(dev, "failed to init genpd: %d\n", ret);
+			return ret;
+		}
+
+		ret = of_genpd_add_provider_simple(np, genpd);
+		if (ret) {
+			dev_err(dev, "failed to add genpd provider: %d\n", ret);
+			goto remove_genpd;
+		}
+	} else {
+		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
+		ret = cpu_pm_register_notifier(&priv->mpm_pm);
+		if (ret) {
+			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret);
+			return ret;
+		}
+	}
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		dev_err(dev, "failed to find MPM parent domain\n");
@@ -473,10 +525,10 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 
 remove_domain:
 	irq_domain_remove(priv->domain);
-free_mbox:
-	mbox_free_channel(priv->mbox_chan);
 remove_genpd:
 	pm_genpd_remove(genpd);
+free_mbox:
+	mbox_free_channel(priv->mbox_chan);
 	return ret;
 }
 

-- 
2.34.1

