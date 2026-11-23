Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465935;
	b=Ksa/CUgz0GQAtXnxmmKeWtaskFAqE/3yfYvV3sYOdpgH0LODctiU8wt2JPGXGrQJykbX
	 YL7ROmTW9QCMFpDYlTGIRUVwpUwqxRiqbu2kSXfdUb7kiQP+UFnSMiPl3obPatDwm4Tdy
	 1RyL7tDgDeY3kMMUUQFElZm1wEbH5UY23Fk34TvcRdIs89qKUmlAVQZsPfstUUt7isQTH
	 3+AW8ykjrNaMRcZqa1rYnFz0d4eLatm0R/SjXwDyGcr4i5Y9ruCnfaejMdQ4GXqVq4vi0
	 Yc5/7nINFWPc929jVmbiXz1d0T3YHOhAYtKVXzwBgT9fk/PIQflJWpzYsGh8++Iep3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465935;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=H3n6mAsS5DvYsC96ijuqCARg8ELNAIedKoWS8muN3HQ=;
	b=rsQZw1ABf19uXJh6pa6nnUfHS1wjPi9lkYJ/m83w0/LuTDgevhMzfNlqz6pkzWFzsBhk
	 F5FTbWO09wp1uh1s+7pMi0carGevCTQ42t4gLrJMl/mSzc1RyESkNH2noatJI5YK83R5I
	 B0l3WrfjbN4YmfrWB+srI5yGezntZQH+7gsddSuduOMorNQNZtk87gJtCeyuzOgCGe+qJ
	 pt5yKdei9D/I0JuZ4fGzJ8LVNb+tcPSQCRF8AY3eb259J2+1vGHAoTMiPF793iQHVlLBE
	 zlzt3LqK/YVNetjkghuu8TZUGbnXZKBq+gtXOHkiCok09XsKNVyifZMBUAfmWMTELJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=SS4uHr5e;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60812606A684;
	Mon, 23 Nov 2026 20:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60812606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=SS4uHr5e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=H3n6mAsS5DvYsC96ijuqCARg8ELNAIedKoWS8muN3HQ=; t=1795465934; x=1796675534; 
	b=SS4uHr5e94Izgf+RwhwPWln/unuTem+ZGsp9zhozC7gkUYTahsuVTnqWAGWTNFEr5i1DzYBlchz
	VJFUEkvXgwyGJSdw282MN+ACX+oN841LPjCLNYkMbOdsk9DX14wtXbKUiRNNtcE8AeiG2sHBGINr3
	xA5KUt35ywUMIvSGHYH2QYU2bnXKJzEu0c2EZ0exbn4kQxZfWhNbpijBZ85ezFYRKL9ghwnrgSduO
	GdN1QcHgaYysmZHYJAi3NIOIsHf03CNLZP0YmjIPDgX/5NexcEKWWgTRtsg6I4ADdypMVWhEg1V3F
	dMBbvV5YhtezNqVjhwtTzzX8yhm/bwMqKIjQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH RFC 0/3] ARM: imx: Add a more agressive idle mode on
 i.MX6SLL
Date: Mon, 23 Nov 2026 21:31:18 +0100
Message-Id: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
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
X-B4-Tracking: v=1; b=H4sIAJaiBGsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNj3czcCjOgWE5qcUl+gW6SoYmJqUmipWGqmbkSUE9BUWpaZgXYvOh
 YCL+4NCkrNbkEZIhSbS0AaYt1WnEAAAA=
X-Change-ID: 20261123-imx6-idlestop-b14454a91e67
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
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2710; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=Hxj0SZ3rC+SPvFigy5m6+QiE4mX53fcOuVFZ5Bi27dY=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBKKmZbyCj/we5x+baOU/ADXBrxjmg0W4muH6x
 QEQOnJoAb+JAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawSipgAKCRCEYUX6QCjc
 8WrsD/97uMR+tAVbPbcosjxxdibZzavWR3FLDAHpesQUukjgItYmQ/reMgRGvcD7NmA1/K3ovto
 82iQEefJnzz/LZdsOWBTfAQczC3Zabne1Str3ZFOXKwTQC8oLVLsnpSeqFh0zM75jDggNui4i4S
 NQQGOUjUYQT4KMeIZY5UYv5Cw7Fnauo9GAy5fmSZtJlCUNKS7cujlTYmwJabY41CtwI4I+vZgtZ
 R14zuNKX1Vn9KTYAzGBIcP6xGoRtOYJwTkC3ewULcLJIhRxMxA5V+HpJGaSiu2BiGLmlfwXNoSN
 zrXze/Ke2VydtJ8SskPhAoaDSqdYKXauzwaL2TX3aQdyHnrXGooriSMmydcGhy0g5rkrIw1UWJC
 ffbd0dba++JZQ1fidQrvw69PENWoGEg2oxbr6HTf7Llh1wKiUHCj0zI551gbQHL6DCPVA8Cs8Np
 Wf9V+uyFUDsLmZ+8S9fXlzCw6Xn14HgD7RpR7pP+u6xk8S1wUSU6AdydmGssVdYaIq+hGDyqr4z
 4suAH2XsgJlRB+ywfuQDCTnPIh5fcAZw0viEB5Jev3aJW+7C/IBkSlC4gBhdZ282ZIoASPRvSfH
 boY98KXQi2C89iq3RIA8MM5ObaCt7h5AupdBH0k/BdfBOqN7/9d7aj6VTdgSqSWAuFXgtiYiMvW
 bFPk5EimRzpa77Q==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

On Ebook readers there are often situations in which the system waits
only for some GPIO IRQs and no module is active, all the clock system
is using most of the power, not every clock gets disabled via RPM,
esp. those are marked as CLK_IS_CRITICAL.
A usual he situation might be mainly wating for touchscreen input.
Since nothing needs to be sent to the display continously, clocks
are not in use. Maybe some frontlight is consuming power, but if it
is not used in maximum brightness mode, the clock system is still
using a significant portion of power.

In contrast to suspend state, that is not forcefully turning things of
and wake up only on selected important things when the device is not used.
E.g. you might still want to have frontlight enabled.
Vendor kernel work around this by adding an extended suspend mode in
which more things are disabled, e.g. the touchscreen.

So rather add another idle state, which is only conditionally used
depending on clock usage.

System timekeeping is currently using a high speed clock, which is a
major blocker for this idle state.
The imx-thermal driver currently needs to be disabled, maybe some
cpuidle notifier block called by cpu_cluster_pm_enter() is the solution.
PXP driver is missing power management, so it should be disabled, too.
Also serial console needs to be disabled.

Use 32K clock for the timer and the clock source to avoid that
dependency and allow the timer to be used in stop mode if that low
power clock source is used.

With these patches are applied (and the not-yet-upstreamed EPDC driver)
I can run a loop displaying the current consumption in every 20 seconds
for about one week. Power saving is around 70% in such
situations.

Probably patch 1 needs a more clean solution, Patch 2 should be good to
go, after that patch 3 can go in, too.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (3):
      [RFC] ARM: imx: enable STOP-ON mode in idle if wakeup requirements permit
      timer-imx-gpt: Allow 32K clock to be used as a clock source
      ARM: dts: imx: kobo-clarahd: Use 32K clock for the timer

 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts |  5 +++
 arch/arm/mach-imx/common.h                         |  1 +
 arch/arm/mach-imx/cpuidle-imx6sx.c                 | 42 +++++++++++++++++++++-
 arch/arm/mach-imx/pm-imx6.c                        | 23 ++++++++++++
 drivers/clocksource/timer-imx-gpt.c                | 13 +++++--
 5 files changed, 80 insertions(+), 4 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-imx6-idlestop-b14454a91e67

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

