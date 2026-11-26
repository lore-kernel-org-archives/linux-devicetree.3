Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690969;
	b=j1omugamXGcrgJyO/eS1yp+GJXBC6nTBkRnMb6E+dYK5s7dUzigrhQpAqA2RpgD9mL+X
	 zINfS09krFy9ycVDULOVPLRWqGvCf29lRVWnqv6tAKe0IRxs73PWDGoaQAnKnkLeR1rI5
	 TAe6FFW6u/g00+KkAXCcxXptg96+IZhorWzX0/gNdizsxKBd9YRhJ6Eq9BRnADV3F+Obh
	 kyoG3rkvjBcgqX5NAokXPHJYWnd+6fgHUaIQulpgUZcLmq1KFNejs2rPvY8exXwYRv/Pt
	 JIxz7W99PJOes1YddQhm7ZcbDOg4Jyzkh0JVDywcUfIW4MTXoDzI5ls/hdq6IQoQ9jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690969;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9IdHMMbuye28MG1N1+EIFoZNhCivuWQFrrAdjyqCNjo=;
	b=Ck6/4PxojiMMvKAGMk5B4gEy483PIO7upizuyBAfVXesOdQoZQMCE6IL9HchW82WM4ed
	 0g91c60+1gWueIZniRjGx2PeNIQQLCkQi3ttkcpbxXrDezLvVRWiQ4LKzG71nd3r9FLxP
	 YqSC2BecJaiq3QWgVBKQ2ZQsRv0PKJZmdTuT2hV2XyneaRWbPTw0US8eENWdYrnHEOd33
	 diSN7JojK4DFFpYd3HAJ1s1czRl/q+IQpyoqv+WIFjsCBNpqxnT3VRjtPkBxm5RmfV/wa
	 n7t4+XfIJfTYTkvwUSoOV5e+VTdz3YYPYBmA7rKqS2TIDLEAc5cLjFoPruABnE1NzCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=83pCpQTR;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5B7606A326;
	Thu, 26 Nov 2026 11:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F5B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=83pCpQTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=9IdHMMbuye28MG1N1+EIFoZNhCivuWQFrrAdjyqCNjo=; t=1795690969; x=1796900569; 
	b=83pCpQTR9vGmUoSgDg4GXqH4orZoLS6ChQ9KeHyIeJdf+oY2Sspx2k7RY43yMJXhxzTB0DWejTY
	Ox0x8VAR6lW6tnTt0iHcgQOG6fjGppG1Nfbcu4awhTjIRO/TOqK8fO5snP424J38YaouIepCVchSG
	AyaRXoDvqEtMYC6VfQds+uffcRVp9xJsI5UhLWC5tnc6ckXr1eze1Qv5++XYtUkiiWKGkeu9dZq98
	WL17DOJsRnUqkUmo1SGG5QBIkA4ZPtvCF8p0kiG1MLfxYc8TMd5Bl1bIrM0MUm1G6AkDSBx7LQvu/
	2uKCfjzBMa0fzPanAvHuIzfP4+i7uo5smOww==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 26 Nov 2026 12:00:55 +0100
Subject: [PATCH v2 2/3] timer-imx-gpt: Allow 32K clock to be used as a
 clock source
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
Message-Id: <20261126-imx6-idlestop-v2-2-c6987e7a392f@kemnade.info>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
In-Reply-To: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=2586; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=0tK0It/89Mk1v8dt4LN/eij+sq22nwXBnCv/qcnypmA=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBG8ghAnJK74UD2DhFiwPDN8rbNLchU+k8vxF
 8E8guv9xTKJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRvAAKCRCEYUX6QCjc
 8Y1lD/4kc436aFhE40SpSwZ0oxIDQ0Au2qpEokCgreptv67OD//tKduETpSG5Sa+/BDEKZEHJrU
 0Iniv5C4fhe0D0B/Kzwv2pqSuBNIPVKL4kPxcgUq6C85FhcVQ0r0ZTNF3YG0uPY821DjqOHRp0P
 Jr+xIpC86nIeK5GZiuEorldh3rhtrmXZkjZBHZdrz8Mt2HVyqDQxLhk+fE2QAwGy93F/WhoKgRm
 /1Bo9YIWjCND6t5UiE/GN5Ewr39TwxL1v4AVc9s7QV0NSTQGQV/Wbp8FvaO+Szq53TrYlXm+DZa
 gHXDgrcFLOHDMVjG9ZI+mgfkyzEqRVPE5X7Ofuc4yapfhvp264ertoOeyyaXhZa9gAWze85BVpx
 E2SkKHDmtoYNz8h6zzCyHhhiiYdJ9V5/vpgUwQMrobMG8bIfsW2rdm7zVtq/90cCyAt02OE4JwR
 bzh9SyTR/rP61eacPnqXrgCPz8Me8vmeTCCQsQl09QAxZ4uNUp1ARuexIJk+bDrpc7sMCMUeQEk
 lFIJdDkw5zM4mUAeCSVK496y8Py+TaVGVnNMrm/HTJ40y7o2BT4CNCplyfQ3Ho21ANF5KfYIRBL
 tKv+gSz5VwRk4waAahFKsjZsNovdMijRK2eObPxQhfltC3vtH9HRLTcgXmSMvgnI4KlhqCXnGcg
 vJFfRFhBa0qvVvg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

To avoid depending on PLL infrastructure for timekeeping, prepare for
using the 32K clock by configuring the clock source accordingly.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/clocksource/timer-imx-gpt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index 8335bd7f8c6ce..85fd36fe1c760 100644
--- a/drivers/clocksource/timer-imx-gpt.c
+++ b/drivers/clocksource/timer-imx-gpt.c
@@ -50,8 +50,10 @@ enum imx_gpt_type {
 
 /* MX31, MX35, MX25, MX5, MX6 */
 #define V2_TCTL_WAITEN		(1 << 3) /* Wait enable mode */
+#define V2_TCTL_STOPEN		(1 << 5) /* Stop enable mode */
 #define V2_TCTL_CLK_IPG		(1 << 6)
 #define V2_TCTL_CLK_PER		(2 << 6)
+#define V2_TCTL_CLK_32K		(4 << 6)
 #define V2_TCTL_CLK_OSC_DIV8	(5 << 6)
 #define V2_TCTL_FRR		(1 << 9)
 #define V2_TCTL_24MEN		(1 << 10)
@@ -271,6 +273,7 @@ static irqreturn_t mxc_timer_interrupt(int irq, void *dev_id)
 static int __init mxc_clockevent_init(struct imx_timer *imxtm)
 {
 	struct clock_event_device *ced = &imxtm->ced;
+	unsigned long rate = clk_get_rate(imxtm->clk_per);
 
 	ced->name = "mxc_timer1";
 	ced->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_DYNIRQ;
@@ -281,8 +284,7 @@ static int __init mxc_clockevent_init(struct imx_timer *imxtm)
 	ced->rating = 200;
 	ced->cpumask = cpumask_of(0);
 	ced->irq = imxtm->irq;
-	clockevents_config_and_register(ced, clk_get_rate(imxtm->clk_per),
-					0xff, 0xfffffffe);
+	clockevents_config_and_register(ced, rate, rate == 32768 ? 3 : 0xff, 0xfffffffe);
 
 	return request_irq(imxtm->irq, mxc_timer_interrupt,
 			   IRQF_TIMER | IRQF_IRQPOLL, "i.MX Timer Tick", ced);
@@ -314,14 +316,19 @@ static void imx6dl_gpt_setup_tctl(struct imx_timer *imxtm)
 	u32 tctl_val;
 
 	tctl_val = V2_TCTL_FRR | V2_TCTL_WAITEN | MXC_TCTL_TEN;
-	if (clk_get_rate(imxtm->clk_per) == V2_TIMER_RATE_OSC_DIV8) {
+	if (clk_get_rate(imxtm->clk_per) == V2_TIMER_RATE_OSC_DIV8)  {
 		tctl_val |= V2_TCTL_CLK_OSC_DIV8;
 		/* 24 / 8 = 3 MHz */
 		writel_relaxed(7 << V2_TPRER_PRE24M, imxtm->base + MXC_TPRER);
 		tctl_val |= V2_TCTL_24MEN;
-	} else {
+	} else if (clk_get_rate(imxtm->clk_per) == 32768)
+		/*
+		 * if powered by that always on clock, it is feasible to let
+		 * it run in stop mode, too, allowing lower idle states
+		 */
+		tctl_val |= V2_TCTL_CLK_32K | V2_TCTL_STOPEN;
+	else
 		tctl_val |= V2_TCTL_CLK_PER;
-	}
 
 	writel_relaxed(tctl_val, imxtm->base + MXC_TCTL);
 }

-- 
2.47.3

