Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284673;
	b=FCE6fxYrkSKwtsXLbbJQ3K4R8zfQ1/1TGDpvFpyGulhQFRPIdnR0n0x3wGQaYUFWFVnw
	 8B9dF0bCMoLoqiMthVps4qSYduczxan8N02PhjQZqg2j3Pcz0QN8TE9Yq4A6F5CrHhG48
	 E6ZnYG4GUugBCBBghsVXxksbEZjxvcffaI0aPStUwOPbfwxLZ/GplsxCaVWo7Of4pEfHi
	 FJSbgyEBNJ5BnBVn68R+NLt/CPc6JSKw9lmDCFDSdI8bScbTehrYNxpGKbgr4JvujUxOe
	 EHv9Gtr+5Wl6burxOuFyHBQSbvGnO2X9nK/JUO6ue71LA/439wdeEDzNNkuYRbPDfjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QIk7yfOiLkVxD25N7Jdknx3McUWeTCWTPkLUjO3vpC8=;
	b=DC8b/Cxk94ixREZF7EGAzWTXy85+8SkN/wWlsQ0fHbtgaI8DEAuVGC0Fknis7FMzYJBR
	 6QQwrIKzcIuuc+ofn0zLIuCVS5AH1VdZtsZvlONdkp2oRqd1zgCh+dok3XQazBsEMJAzp
	 5YNXm+LKus8FrJt0GVm59FgtbHPr8MdMFpIk2IaFDbqw3zVKQTZysO8/+qiCH4ArxidjD
	 GMesmcDsQsKHfbhbjYcxaUnMBapS9wZoBJ02OquyAKifDh6hhJmStOo7WyI1nK3R8COPF
	 07Q6RFtMhN93Jciq+FohUP7MgGoDUYeww/fmpVntAiQay2cqLp/6DZS5TLXNuwXZ+0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Nls7tOlh;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6137B60A2610
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6137B60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Nls7tOlh
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so1820435c88.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 20:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284672; x=1794889472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIk7yfOiLkVxD25N7Jdknx3McUWeTCWTPkLUjO3vpC8=;
        b=Nls7tOlhV5pZnDP5SA7wGjZlskDdpomszAEHguU9UAKEnKXx56JHXUqZNlcz0bKEan
         /NwPPNCKfXm/kHIxP4EzXijgG9sWyKiNp+kv5aA0x0oMzSuRE0gnuOLmG7kUP9G8YAe5
         HHZ5kjiTm8Ad0hGm4WQnGYD+qloLX9Va4VSynHCtN5vu1fCDVTeZ5cy2R4jtCOHHpwti
         k7D9mNEf1/aHaM3i1D81WG8PsB4Nr5jtvfWlJiy1m+8nPN+LlQTEIqjIDfUOrrqma5go
         /gT6R2/BMkNg96NgLYDCWXL8tmIbZWtuSz6bFjInKVjsCpb0/SvsQtXfjTtASbD3q9VO
         5k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284672; x=1794889472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QIk7yfOiLkVxD25N7Jdknx3McUWeTCWTPkLUjO3vpC8=;
        b=nPdSBhjL2dyb73yoVgDPxaBRdsKSAOfhufH0Nq0eINyLEOOvlYUqKdsv7CnloXXp8C
         wQRQhEmEUjLa9UcCeVRiLY0+04xrF71DbHPnmixqIl+vqoh/Kmuf6YhMzwV8/CiikuVH
         5RI9OxTWxp4ALAcsGwnWTUxtRJGp/JcWUmGxIaTdLnj+lHNIfM1HBpmh9dOgtQXsAp/n
         aLoFjkKeMEETptTVPMaJvZdnojavbIUJxb+01Udhu2K9Qwbu+98xpYaT0yf12ZwWIVUV
         MsfElUEa9yJMQlqd+qEk7iFJ7x5cdMMjz+fU2VsytplRVZ4ru+TJKjzS3OTaALi/ac6Q
         /Vgw==
X-Forwarded-Encrypted: i=1; AL+hErE0/rhLPCNSLLLpyL1+4FfOEHz/HcP/d77ePDJHSnhGVEmb/Asp44cwL+vPAc/bocOSHBgjRqesqmLA@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dz7xzcF96zwVre1ag6+r0GgrDhkOlWwdgDVY+v3UN6mLwbqRy
	g9k8kgU6QHehXyHM6NwpMwW6TTp4gaZaOf+tOBvfBQ3tS6lc101ODgGLxj8b82v2Lg==
X-Gm-Gg: AYBFou1vKB3mfIakD1u9NkISfktODCxt2M/suSS/SQMYoBBNfczydck4dNLELs4WPN0
	mWgMPEwkJjAVsSQ8Fi46t7+GS9Xto/j4rqHFik9VQJSE7gl/e6mxyGKB73/fXSh7/OamLg2gpYP
	ZjLigNNB1bVtjzr0PtT6b0rBkhGy8+QZaNcc+3Px/KFrNxYmFETc2GqO8ZlEXqJ/174OSJDFCz3
	CyhTZLMJFQB3V5/UZwlvQAoLP+B8wVbgD8eJMg7I4JhsOFax9l3kadelrbCIP/gghllQt1f/Niz
	WJcI0Z+EFpo8kgcWgjtW2QR5Mw3FOFsaOwDvANSwDHsQMyajMoDdL60aR/0Au1X5a3osvuxyldc
	6LCHHnz24sC6lRKkh9Z9NLjQD+s7pfHxXIedyV7QJYKN6lWzrlHKZKbNnGp6X+hy2yX+tun0AaX
	fg9Qgdp3bQ1sPZJQTILpY3efkmUAuZfQ2ZJTfF7uUuNVjqd8eEKSDqQIwQRnTZEFQekEuzc/4dp
	n35g7NBh/DBSLP6ZZmR3gecORyIqhMsSISIE74FnSPIK0IHEDz533dHZuCALQBRVk7IEbYTfqTZ
	FwOJSp1RUXPCB4u8p688g++SZjqjD17J0f74NIYieJjdCt5GXbMicrLqKZgK4XZnhNvf3yA9Gy6
	Crio7vcyujI2hUyFj
X-Received: by 2002:a05:7301:c08a:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-3751f45ff67mr1728608eec.23.1794284672193;
        Mon, 09 Nov 2026 20:24:32 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:31 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Tue, 10 Nov 2026 11:24:03 +0700
Message-ID: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794284248.git.jjc@jclark.com>
References: <cover.1794284248.git.jjc@jclark.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hardware-supported PTP_SYS_OFFSET_PRECISE to the CPTS driver for
TI K3 SoCs.

The system counter of these SoCs, the Global Timebase Counter (GTC),
can export one of its bits on a push event output, selected by the
PUSHEVT_EXPBIT_SEL field of GTC_CFG0_PUSHEVT. The Time Sync Router can
route that output to a CPTS hardware timestamp input. The CPTS then
timestamps rising edges that fall at known counter values (with bit b
selected, at k * 2^(b + 1) + 2^b), so each timestamp gives an exact
pair of PHC time and system counter value.

Implement getcrosststamp with these timestamps when the CPTS node has a
ti,gtc-push property. The property names the GTC CFG0 syscon and the
push input to which the router delivers the push event. The router is
set up separately, as it is for ti,pps. If the input is one of the extts
channels, that channel can no longer be enabled.

A push event timestamp contains just the PHC time, so the driver needs
to work out which GTC edge it corresponds to. The push input is
normally disabled. For each getcrosststamp request, the driver reads
the GTC, enables the input, reads the GTC again, waits for a push
event and then disables the input. The timestamp in that event must
correspond to the first edge after the earlier reading, provided that
edge is also after the later reading. If not, the driver retries. The
driver also has to detect a push event lost to an overflow of the CPTS
event FIFO. So it reads the GTC a third time when it takes the event
from the FIFO, and retries if that reading is a period or more after
the expected edge. After three failed attempts, the request fails with
-EBUSY.

Usually drivers capture the pair in the callback to
get_device_system_crosststamp(), but this works only when the capture
is fast, because the core calls the callback inside a timekeeper
seqcount loop and repeats it whenever the timekeeper is updated. So
this driver captures the pair before the call, and the callback just
returns it.

The choice of counter bit is a tradeoff: each attempt waits for half a
period on average; a longer period makes retries rarer but makes each
attempt longer. The driver uses bit 15, which at 200 MHz gives a period
of 328 us, chosen after testing a range of possible values. This is
sufficiently long to ensure each attempt fails rarely (0.2% to 0.9%
depending on CPU and memory load); failure of all three attempts
required extreme conditions (50 kHz extts flood with memory load).

The driver reads the GTC through the clocksource, which assumes that
the clocksource counter value equals the GTC count, that is a CNTVOFF
of 0. This holds on the tested boards. The cross-timestamp in
dwmac-socfpga makes the same assumption.

The timestamps are not corrected for the delay from the push output to
the CPTS latching the edge, estimated at about 11ns on a BeagleY-AI; the
driver similarly does not correct extts timestamps for their input
delay.

Tested on a BeagleY-AI (TI AM67A / J722S), on the MCU CPSW of a
BeagleBone AI-64 (TI TDA4VM / J721E) and on a BeaglePlay (TI AM625).

Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/net/ethernet/ti/am65-cpts.c | 289 ++++++++++++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpts.c b/drivers/net/ethernet/ti/am65-cpts.c
index 0d71147f3c29..70b0d43bfe78 100644
--- a/drivers/net/ethernet/ti/am65-cpts.c
+++ b/drivers/net/ethernet/ti/am65-cpts.c
@@ -5,11 +5,13 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/if_vlan.h>
 #include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/net_tstamp.h>
@@ -19,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/ptp_classify.h>
 #include <linux/ptp_clock_kernel.h>
+#include <linux/regmap.h>
 
 #include "am65-cpts.h"
 
@@ -128,6 +131,10 @@ struct am65_cpts_regs {
 #define AM65_CPTS_EVENT_2_REG_DOMAIN_MASK	(0xFF)
 #define AM65_CPTS_EVENT_2_REG_DOMAIN_SHIFT	(0)
 
+/* GTC_CFG0_PUSHEVT_REG */
+#define AM65_CPTS_GTC_PUSHEVT			0x8
+#define AM65_CPTS_GTC_PUSHEVT_EXPBIT_SEL	GENMASK(5, 0)
+
 enum {
 	AM65_CPTS_EV_PUSH,	/* Time Stamp Push Event */
 	AM65_CPTS_EV_ROLL,	/* Time Stamp Rollover Event */
@@ -152,6 +159,11 @@ struct am65_cpts_event {
 #define AM65_CPTS_EVENT_RX_TX_TIMEOUT	(20) /* ms */
 #define AM65_CPTS_SKB_TX_WORK_TIMEOUT	1 /* jiffies */
 #define AM65_CPTS_MIN_PPM		0x400
+#define AM65_CPTS_GTC_PUSH_BIT		15 /* 328 us period at 200 MHz */
+#define AM65_CPTS_GTC_PUSH_PERIOD	BIT_ULL(AM65_CPTS_GTC_PUSH_BIT + 1)
+#define AM65_CPTS_GTC_PUSH_TIMEOUT	(20) /* ms */
+#define AM65_CPTS_GTC_PUSH_TRIES	3
+#define AM65_CPTS_GTC_PUSH_DRAIN_PASSES	8
 
 struct am65_cpts {
 	struct device *dev;
@@ -186,6 +198,13 @@ struct am65_cpts {
 	bool pps_present;
 	u32 pps_hw_ts_idx;
 	u32 pps_genf_idx;
+	struct regmap *gtc;
+	u32 gtc_push_hw_idx;
+	u64 gtc_push_ts;
+	u64 gtc_push_cycles; /* the counter when the event was read */
+	bool gtc_push_armed;
+	wait_queue_head_t gtc_push_wq;
+	struct mutex gtc_push_lock; /* serialises crosststamp requests */
 	/* context save/restore */
 	u64 sr_cpts_ns;
 	u64 sr_ktime_ns;
@@ -290,6 +309,21 @@ static bool am65_cpts_fifo_pop_event(struct am65_cpts *cpts,
 	return true;
 }
 
+static void am65_cpts_gtc_push_event(struct am65_cpts *cpts,
+				     struct am65_cpts_event *event)
+{
+	struct system_time_snapshot snap;
+
+	/* keep the first event of a request; later edges are not used */
+	if (!cpts->gtc_push_armed)
+		return;
+	ktime_get_snapshot_id(CLOCK_REALTIME, &snap);
+	cpts->gtc_push_ts = event->timestamp;
+	cpts->gtc_push_cycles = snap.cycles;
+	WRITE_ONCE(cpts->gtc_push_armed, false);
+	wake_up(&cpts->gtc_push_wq);
+}
+
 static int __am65_cpts_fifo_read(struct am65_cpts *cpts)
 {
 	struct ptp_clock_event pevent;
@@ -345,6 +379,11 @@ static int __am65_cpts_fifo_read(struct am65_cpts *cpts)
 			break;
 		case AM65_CPTS_EV_HW:
 			pevent.index = am65_cpts_event_get_port(event) - 1;
+			if (cpts->gtc &&
+			    pevent.index == cpts->gtc_push_hw_idx) {
+				am65_cpts_gtc_push_event(cpts, event);
+				break;
+			}
 			pevent.timestamp = event->timestamp;
 			if (cpts->pps_enabled && pevent.index == cpts->pps_hw_ts_idx) {
 				pevent.type = PTP_CLOCK_PPSUSR;
@@ -620,6 +659,9 @@ static int am65_cpts_extts_enable(struct am65_cpts *cpts, u32 index, int on)
 	if (cpts->pps_present && index == cpts->pps_hw_ts_idx)
 		return -EINVAL;
 
+	if (cpts->gtc && index == cpts->gtc_push_hw_idx)
+		return -EINVAL;
+
 	if (((cpts->hw_ts_enable & BIT(index)) >> index) == on)
 		return 0;
 
@@ -797,6 +839,226 @@ static int am65_cpts_ptp_enable(struct ptp_clock_info *ptp,
 	return -EOPNOTSUPP;
 }
 
+struct am65_cpts_gtc_push {
+	u64 ts;
+	u64 cycles;
+};
+
+/* the first rising edge of the exported bit after cycles */
+static u64 am65_cpts_gtc_push_next_edge(u64 cycles)
+{
+	u64 half = AM65_CPTS_GTC_PUSH_PERIOD / 2;
+
+	return round_down(cycles - half, AM65_CPTS_GTC_PUSH_PERIOD) + half +
+	       AM65_CPTS_GTC_PUSH_PERIOD;
+}
+
+static int am65_cpts_gtc_push_read(ktime_t *device,
+				   struct system_counterval_t *system,
+				   void *ctx)
+{
+	struct am65_cpts_gtc_push *push = ctx;
+
+	*device = ns_to_ktime(push->ts);
+	system->cycles = push->cycles;
+	system->cs_id = CSID_ARM_ARCH_COUNTER;
+	system->use_nsecs = false;
+
+	return 0;
+}
+
+/* select the counter bit the GTC exports on its push event output */
+static int am65_cpts_gtc_push_select(struct am65_cpts *cpts)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_update_bits(cpts->gtc, AM65_CPTS_GTC_PUSHEVT,
+				 AM65_CPTS_GTC_PUSHEVT_EXPBIT_SEL,
+				 FIELD_PREP(AM65_CPTS_GTC_PUSHEVT_EXPBIT_SEL,
+					    AM65_CPTS_GTC_PUSH_BIT));
+	if (ret)
+		return ret;
+	/* flush the posted write before the input is enabled */
+	return regmap_read(cpts->gtc, AM65_CPTS_GTC_PUSHEVT, &val);
+}
+
+/*
+ * Read the FIFO until it is empty, then accept the next push event. One
+ * __am65_cpts_fifo_read() takes at most AM65_CPTS_FIFO_DEPTH events, and after
+ * a burst of push edges (a request that wakes up late leaves the input enabled
+ * for many periods) more can be waiting. A push event left behind would be
+ * taken for the next attempt's. With the push input disabled no new push
+ * events arrive, so after enough passes every old one has been read even if
+ * packet events keep the FIFO busy. The lock is dropped between passes; a push
+ * event read meanwhile by the IRQ thread is ignored, as nothing is armed.
+ */
+static int am65_cpts_gtc_push_arm(struct am65_cpts *cpts)
+{
+	unsigned long flags;
+	int i;
+
+	for (i = 0; i < AM65_CPTS_GTC_PUSH_DRAIN_PASSES; i++) {
+		spin_lock_irqsave(&cpts->lock, flags);
+		__am65_cpts_fifo_read(cpts);
+		if (!(am65_cpts_read32(cpts, intstat_raw) &
+		      AM65_CPTS_INTSTAT_RAW_TS_PEND)) {
+			cpts->gtc_push_armed = true;
+			spin_unlock_irqrestore(&cpts->lock, flags);
+			return 0;
+		}
+		spin_unlock_irqrestore(&cpts->lock, flags);
+	}
+	return -EBUSY;
+}
+
+static void am65_cpts_gtc_push_disarm(struct am65_cpts *cpts)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&cpts->lock, flags);
+	cpts->gtc_push_armed = false;
+	spin_unlock_irqrestore(&cpts->lock, flags);
+}
+
+/*
+ * Enable or disable the push input and read CONTROL back. After a disable,
+ * the read-back means no event of an edge captured before the disable
+ * reaches the FIFO after the next drain.
+ */
+static void am65_cpts_gtc_push_enable(struct am65_cpts *cpts, bool on)
+{
+	mutex_lock(&cpts->ptp_clk_lock);
+	am65_cpts_extts_enable_hw(cpts, cpts->gtc_push_hw_idx, on);
+	am65_cpts_read32(cpts, control);
+	mutex_unlock(&cpts->ptp_clk_lock);
+}
+
+/*
+ * Wait for the event of the edge at counter value edge. Returns -EAGAIN if no
+ * event arrives in time or the event may not be of that edge.
+ */
+static int am65_cpts_gtc_push_wait(struct am65_cpts *cpts, u64 edge,
+				   struct am65_cpts_gtc_push *push)
+{
+	unsigned long tmo = msecs_to_jiffies(AM65_CPTS_GTC_PUSH_TIMEOUT);
+	unsigned long flags;
+	u64 popped;
+
+	if (!wait_event_timeout(cpts->gtc_push_wq,
+				!READ_ONCE(cpts->gtc_push_armed), tmo)) {
+		dev_dbg(cpts->dev, "%s: no event for edge %llu\n",
+			__func__, edge);
+		return -EAGAIN;
+	}
+
+	/*
+	 * The event handler read the counter when it took the event from the
+	 * FIFO. The event of the edge cannot be taken before the edge. If it
+	 * was taken a period or more after the edge, the event may be of a
+	 * later edge: when the FIFO overruns, the CPTS loses events.
+	 */
+	spin_lock_irqsave(&cpts->lock, flags);
+	push->ts = cpts->gtc_push_ts;
+	popped = cpts->gtc_push_cycles;
+	spin_unlock_irqrestore(&cpts->lock, flags);
+	if ((s64)(popped - edge) < 0 ||
+	    (s64)(popped - edge) >= (s64)AM65_CPTS_GTC_PUSH_PERIOD) {
+		dev_dbg(cpts->dev, "%s: event read at %llu, edge %llu\n",
+			__func__, popped, edge);
+		return -EAGAIN;
+	}
+
+	push->cycles = edge;
+	return 0;
+}
+
+/*
+ * Make one attempt to capture a push event. Whatever the outcome, the input
+ * is left disabled and the request disarmed.
+ */
+static int am65_cpts_gtc_push_try(struct am65_cpts *cpts, clockid_t clock_id,
+				  struct system_time_snapshot *before,
+				  struct am65_cpts_gtc_push *push)
+{
+	struct system_time_snapshot after;
+	u64 edge;
+	int ret;
+
+	ret = am65_cpts_gtc_push_arm(cpts);
+	if (ret)
+		return ret;
+
+	/*
+	 * Read the counter before and after enabling the input. An edge at or
+	 * before the first read reaches the CPTS long before the enable does,
+	 * which needs a CONTROL read first. After the read-back of CONTROL the
+	 * input is enabled, so an edge after the second read is captured. If
+	 * no edge lies between the two reads, the first event is of the first
+	 * edge after the first read.
+	 */
+	ktime_get_snapshot_id(clock_id, before);
+	am65_cpts_gtc_push_enable(cpts, true);
+	ktime_get_snapshot_id(clock_id, &after);
+
+	if (!before->valid || !after.valid ||
+	    before->cs_id != CSID_ARM_ARCH_COUNTER ||
+	    after.cs_id != CSID_ARM_ARCH_COUNTER) {
+		ret = -ENODEV;
+		goto disable;
+	}
+
+	edge = am65_cpts_gtc_push_next_edge(before->cycles);
+	if (edge <= after.cycles) {
+		dev_dbg(cpts->dev, "%s: edge %llu during enable\n",
+			__func__, edge);
+		ret = -EAGAIN;
+		goto disable;
+	}
+
+	ret = am65_cpts_gtc_push_wait(cpts, edge, push);
+
+disable:
+	am65_cpts_gtc_push_enable(cpts, false);
+	am65_cpts_gtc_push_disarm(cpts);
+
+	return ret;
+}
+
+static int am65_cpts_ptp_getcrosststamp(struct ptp_clock_info *ptp,
+					struct system_device_crosststamp *cts)
+{
+	struct am65_cpts *cpts = container_of(ptp, struct am65_cpts, ptp_info);
+	struct system_time_snapshot before;
+	struct am65_cpts_gtc_push push;
+	int i, ret;
+
+	mutex_lock(&cpts->gtc_push_lock);
+
+	ret = am65_cpts_gtc_push_select(cpts);
+	if (ret)
+		goto out;
+
+	for (i = 0; i < AM65_CPTS_GTC_PUSH_TRIES; i++) {
+		ret = am65_cpts_gtc_push_try(cpts, cts->clock_id, &before,
+					     &push);
+		if (ret != -EAGAIN)
+			break;
+	}
+	/* as other drivers do when a cross-timestamp cannot be had now */
+	if (ret == -EAGAIN)
+		ret = -EBUSY;
+	if (ret)
+		goto out;
+
+	/* before can serve as history_begin: the edge is after it */
+	ret = get_device_system_crosststamp(am65_cpts_gtc_push_read, &push,
+					    &before, cts);
+out:
+	mutex_unlock(&cpts->gtc_push_lock);
+	return ret;
+}
+
 static long am65_cpts_ts_work(struct ptp_clock_info *ptp);
 
 static struct ptp_clock_info am65_ptp_info = {
@@ -1135,6 +1397,7 @@ static int cpts_of_mux_clk_setup(struct am65_cpts *cpts,
 
 static int am65_cpts_of_parse(struct am65_cpts *cpts, struct device_node *node)
 {
+	struct regmap *gtc;
 	u32 prop[2];
 
 	if (!of_property_read_u32(node, "ti,cpts-ext-ts-inputs", &prop[0]))
@@ -1160,6 +1423,24 @@ static int am65_cpts_of_parse(struct am65_cpts *cpts, struct device_node *node)
 		}
 	}
 
+	if (of_property_present(node, "ti,gtc-push")) {
+		gtc = syscon_regmap_lookup_by_phandle_args(node, "ti,gtc-push",
+							   1, &prop[0]);
+		if (IS_ERR(gtc))
+			return dev_err_probe(cpts->dev, PTR_ERR(gtc),
+					     "Failed to get GTC syscon\n");
+
+		if (prop[0] > 7 ||
+		    (cpts->pps_present && prop[0] == cpts->pps_hw_ts_idx)) {
+			dev_err(cpts->dev,
+				"invalid GTC push HWx_TS_PUSH index: %u\n",
+				prop[0]);
+		} else {
+			cpts->gtc = gtc;
+			cpts->gtc_push_hw_idx = prop[0];
+		}
+	}
+
 	return cpts_of_mux_clk_setup(cpts, node);
 }
 
@@ -1196,11 +1477,13 @@ struct am65_cpts *am65_cpts_create(struct device *dev, void __iomem *regs,
 		return ERR_PTR(ret);
 
 	mutex_init(&cpts->ptp_clk_lock);
+	mutex_init(&cpts->gtc_push_lock);
 	INIT_LIST_HEAD(&cpts->events_tx);
 	INIT_LIST_HEAD(&cpts->events_rx);
 	INIT_LIST_HEAD(&cpts->pool);
 	spin_lock_init(&cpts->lock);
 	skb_queue_head_init(&cpts->txq);
+	init_waitqueue_head(&cpts->gtc_push_wq);
 
 	for (i = 0; i < AM65_CPTS_MAX_EVENTS; i++)
 		list_add(&cpts->pool_data[i].list, &cpts->pool);
@@ -1229,6 +1512,8 @@ struct am65_cpts *am65_cpts_create(struct device *dev, void __iomem *regs,
 		cpts->ptp_info.n_per_out = cpts->genf_num;
 	if (cpts->pps_present)
 		cpts->ptp_info.pps = 1;
+	if (cpts->gtc)
+		cpts->ptp_info.getcrosststamp = am65_cpts_ptp_getcrosststamp;
 
 	am65_cpts_set_add_val(cpts);
 
@@ -1276,6 +1561,10 @@ void am65_cpts_suspend(struct am65_cpts *cpts)
 {
 	/* save state and disable CPTS */
 	cpts->sr_control = am65_cpts_read32(cpts, control);
+	/* the GTC push input is enabled only during a request */
+	if (cpts->gtc)
+		cpts->sr_control &= ~BIT(AM65_CPTS_CONTROL_HW1_TS_PUSH_OFFSET +
+					 cpts->gtc_push_hw_idx);
 	cpts->sr_int_enable = am65_cpts_read32(cpts, int_enable);
 	cpts->sr_rftclk_sel = am65_cpts_read32(cpts, rftclk_sel);
 	cpts->sr_ts_ppm_hi = am65_cpts_read32(cpts, ts_ppm_hi);
-- 
2.56.0

