Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690969;
	b=TJ/gkRL1udn8m2StPrkNTn4npQC6Vp3zMkuoz8oZlbJmihbAdE0ZT/R2EbXy7/KeEqyK
	 36lDb+jqxKuu74W95es32QPbCPEmGzBJgj4plbv9aMFLO5Z56MocejKwaAFNQ8FEPoK6c
	 TWXDZ5awKrUsyg5k1egXyKQrB1WOwjoubUDdsDobQdf8XGtG8VvvoOFzX9cHtWJXWpVR8
	 UimoxBbkCyWSGen8/OWvRRiWqXvhwQvGJxacBbn7w9CCB659qYII/B2h4gMu31lmPMRPM
	 DPtJ6ksVPbbdKpNKtgRNdn4uq1EnxQ0rZENw0Li7AgeQShYxnEkhCE67mljt69wdJHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690969;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zQFj3ohXXKJNtzT891WGzt/tJZd/i4b5W1/3UD7wxug=;
	b=YM3BQO71EQW2qdwuXUzSDRm9VeSt+YtNyKtRT5ZEnzMCZsMIYJMwZIHqF4pNOVWD5u/S
	 CzZ+vbB+Cr7vn6ZdvskvNZ+5dKiKTz+kbgvfngZpZpjs8LsbTtamD6NAWbmCmLVRRKxMh
	 MMFSegQqolpo0c/Y0YMOG4Jal6l8gRUZz02XGwEFSg5OuXdel1vKQ7aO9XY2kuMUN3mGL
	 ldgHzinQPqo7bAIN7wwqjWUuofFw801xub0AwurkGX3LdV/Dbs4XKv5Tv3i8326U2nJRV
	 EztDgxYNkzuAM5EPKpvBNT041h+2hDyA5flimgLzs4EA1MjezG5z8PAIuNCiiV7l+Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=W1+hD0Qg;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A01606A31E;
	Thu, 26 Nov 2026 11:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A01606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=W1+hD0Qg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zQFj3ohXXKJNtzT891WGzt/tJZd/i4b5W1/3UD7wxug=; t=1795690968; x=1796900568; 
	b=W1+hD0QgqkMSf731BK0YntJZVMfhkQMhUVORjGDVqouj/UopKlSbF3l/dbh27xc0XHfVuP1V3G5
	FxqGVku63W/MExE92aQizwZ3OpbemgIPaAcl8jeeRZ2SpWQLvCEAKWlkLOR2nzU0oNcS7X2b4q0TJ
	wL2oZIyjrmQ4LxTVoYRdGwStlZNMPCeT+/ok0sFhQyMWNEqzXMCd+Q+X0RJuJ0k7tZ2o3Gz1qfF5f
	y6YuodZfckc83ZQfKzLaJa4BoteMrvFoZvQMbzjEhurQqyGxapJQjknUhCAh91zImGC1XvkENoCr0
	IWCo7/VWyvt/Nw+LImVTnaioyDeqS3bABcXQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/3] ARM: imx: Add a more agressive idle mode on
 i.MX6SLL
Date: Thu, 26 Nov 2026 12:00:53 +0100
Message-Id: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
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
X-B4-Tracking: v=1; b=H4sIAGkRCGsC/3WNwQ6CMBBEf4Xs2Rq21Bo98R+GQ4GtrEohLTYYw
 r9b8OzxTWbeLBDIMwW4Zgt4ihx4cAnkIYOmM+5OgtvEIHOpEWUhuJ91yl4UpmEUNSp1UuaCpM+
 QNqMny/Puu1U/Du/6Qc20SbZGx2noP/thxK33zx1R5IIKadEqRUrb8km9My0d2dkBqnVdv4nYo
 de/AAAA
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
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=3326; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=3y1MjYnUQP1b4i/yB5OBFm8L7NSHxZ/2T79EJ2IZZrU=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBGo20QiKQj2Kk6TYiezX1vwmhPlg87VpjS5R
 MDTZEeHB2eJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRqAAKCRCEYUX6QCjc
 8doQD/4xNG0xsfpcIWVuJNun49d1/vLRPIJ/NmKqBZJLk2gZCbQmMcmLZ/UzMzp8jzUPNfm4dPp
 AZqRZKXCBE4rrk7A/HEPhOjnvCLkd7EuSL5iiD+YuFVZx5xVdg61TlRC2yOkfjLRZIIZsvnEfWU
 Ys9wA7fj5JHGCLQfyEmWBMDslmZgmCrJqWqRTdM4Ke/MHdsNzyiVuu2TZGv/Xz09AMi/NZmWNu+
 4qHNFJdAxi3Xkzrhx/3e9h4h/5N+uspi0YmGb3N2/zeFTsMYfzmrUhd2vD7x82jBFK8QpfiZD95
 G35+059aamcwmTtjzwK02f5ljVf4piOrC5xEwitb/ShWX2p/6RdsoTMJJ4dSg5o9J/iCpwYSc7Y
 6TxF116CgVXkAHyk+JAfrrTb5k/5UT268u1tMnZi8qVP/2F+0BYfvE1jwJeSXYfMRt5wBRhh/Ch
 F6GcgSpp/Hjuq03APY3ll1M4meKTCfLzJALhJnbBMmSASUGs8/rW/hczrJ6RRnQhlR+UkGy8SsX
 3RTRT+YTG2EwTLNfx/4gCNtEiFbgDQNN9xzYlZwHbSTMMWtOOnROjN+0MWl8czLKCe4/WG224YH
 gD3fjLusGdFRroL6dQGdCQpMkZF1NxEuZ2pjtYAIVHeY/z/XwPHi3dtSo6FB6ZK5Vw1wENGOUAO
 AOHHknY4VLyQJeg==
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
Use 32K clock for the timer and the clock source to avoid that
dependency and allow the timer to be used in stop mode if that low
power clock source is used.

Other things preventing entering that idle state:
- imx-thermal driver: probaly needs some notifier block called by 
  cpu_cluster_pm_enter to avoid false alarms like ti-bandgap does
- PXP and DCP drivers are missing RPM, so they keep clocks enabled.
- serial console: needs to be unbound

With these patches are applied (and the not-yet-upstreamed EPDC driver)
I can run a loop displaying the current consumption in every 20 seconds
for about one week. Power saving is around 70% in such
situations.

Patch 1 and 2 can go in independently,  patch 3 should go in afterwards
since it will break things if the timer driver is not prepared.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- honor disabled idle states when rejecting the new state
- remove redundant imx6_set_int_mem_clk_lpm
- more comments
- do not show new idle state on other cpus and when thermal driver is
  enabled. The latter to avoid misreadings until things are fixed
- block new idle state on dcp activity
- adapt min_delta for clocksource if 32K clock is used

- Link to v1: https://patch.msgid.link/20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info

---
Andreas Kemnade (3):
      ARM: imx: enable STOP-ON mode in idle if wakeup requirements permit
      timer-imx-gpt: Allow 32K clock to be used as a clock source
      ARM: dts: imx: kobo-clarahd: Use 32K clock for the timer

 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts |  5 ++
 arch/arm/mach-imx/common.h                         |  1 +
 arch/arm/mach-imx/cpuidle-imx6sx.c                 | 54 +++++++++++++++++++++-
 arch/arm/mach-imx/pm-imx6.c                        | 31 +++++++++++++
 drivers/clocksource/timer-imx-gpt.c                | 17 +++++--
 5 files changed, 102 insertions(+), 6 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261123-imx6-idlestop-b14454a91e67

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

