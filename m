Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1559C30C15B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505503; cv=none; b=eIPP13fBUkJBIJWhJwOu8Xt7t4H6EeQLmQoGbU6MIjtujx1HhFXDhdhJHhf4EBM+vHDxBpIms4b1qpEFshXzXsS8tCtw1IvkCzYrIjt96ORL3uCHVTP52ZAZ8WbkeJD2kx4HF/LVnSnw5fH6zkrRbY/pJXoTAw4wWPUorj7kEdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505503; c=relaxed/simple;
	bh=NVdYQfItPJA0XXyEY3cnbJQtw+fh/ydqIH++dJRvtb8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iLv4YViFhwaxbvj7JptbjhVySNEUyVJitBC00eyCQZxlNWVc2+3DoVb/yoZmIoUn2ejZgW4BZwwRcURsuNeb2qZQBgxfot+dxzeks/zsg2gkpwkHWuD+vLDQ3Xs5SRtPXWqAbt1ESw3aLFORSdsKQoXISFPoHR8ly4CCYUeMSbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pT//JWk4; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pT//JWk4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=9A9zYbaJuUaZRgug8ZrC3s7r23JlUWaHGhxsMFd04OM=; b=pT//JWk4CYULM4N92ZYdKf5he0
	MiiO1JnHcatr6HpFTzc2qk+6ygvH8xWbjEf7HARV/jCxTT0yoRTPRnwKgfVs2qzdK675HtmFSAc6I
	mc0yoPFCQr1lwxHA0kFC4sGG0Ck3P6+2kxca+HDiSI/aQU6Nw/nk1rovfeSdHPdFYeExKfdOEgWvC
	8YQ6aLs2MLixN7oPWidKPXmao7SkjlYOm3GyZUVtjOPFjFOO76eLF1HpK8I94EjH3lUoRSOAKsYXY
	tnI843YISGp92vGzKMqIAO7NgCj5olK5Va68FFqhzjwz1QSg7sRDo5uiXFrrCoV4JJV50KKwTfdnH
	GRuPdBiA==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6a7p-002dV8-UU; Tue, 15 Sep 2026 22:51:33 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 0/4] drm/vc4: Reset the V3D block through the reset
 controller
Date: Tue, 15 Sep 2026 17:51:23 -0300
Message-Id: <20260915-vc4-reset-control-v2-0-cb3a25b07822@igalia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQqDMBBFryKz7hQTQzRd9R7FRRpHHbBJSSS0i
 HdvKnTX5Xvw398gUWRKcKk2iJQ5cfAF5KkCN1s/EfJQGGQtdd0JidkpjJRoRRf8GsOCbhjGhu6
 dNWSg7J6RRn4dzVtfeOa0hvg+LrL42l9N/6llgTV2RiulmrZphb7yZBe2Zxce0O/7/gG+fI+xs
 wAAAA==
X-Change-ID: 20260812-vc4-reset-control-cddf3eb8a9e9
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=NVdYQfItPJA0XXyEY3cnbJQtw+fh/ydqIH++dJRvtb8=;
 b=owGbwMvMwMVo/5mvq6zj1yrG02pJDFkr11/w51+myJ2++dRT3lDlV3d/n5xrFDU9xk5x+ypGL
 pt3ryS/dzIaszAwcjHIiimy/HgSW8soVs6uuaz8IswgViaQKQxcnAIwEaFM9r+y345kM750aW4P
 rtsf2ZQint7BeoHh28K9O5+6F7UqPvLuL9A7EhnW8Ndl/bLeD0ydOxUu8Z5hP13xpDbOJvZBQtf
 0H6+0HD7t7ljUzC5bE/ohPWDLm0cLth/XYzYStZUwmfeJVWTO04W7o30j8rNcd3yeUZT+wjFhcQ
 lbmJ28qXWDYLJXtXeewJMK65s3J7IrWqT96486dt5/t1M038RXZbb24i55WtGP7UrfzNb4fb5ZY
 GVjMsvxlUnd8e+tX+zduIXn+a3evmtr9sgfnsDpURodEPCk9HiOlI1sM79V0w4Bvt3bNPKzHRX9
 BW5dEvbqzLyTGa4dESlg9FfEM7zFIfpB+4cfbT92h1UDAA==
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

vc4_reset() recovers a hung GPU by dropping the runtime PM usage count to
zero so that the V3D power domain goes down, and then taking it again.
Forcing the count to zero only works if the driver knows exactly how many
references it holds, which is why vc4 unconventionaly wraps every
pm_runtime_get_sync() call in a private refcount and mutex, making the
code cumbersome.

The BCM2835 PM block has exposed a reset line for the V3D block since
commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains
under a new binding."), added for exactly this reason, but vc4 never
picked it up. This series switches vc4 over to it and drops the private
refcount, leaving vc4_v3d_pm_get/put() as plain runtime PM wrappers.

The reset line is optional, so device trees that do not describe one keep
working: they get the driver-side recovery in vc4_irq_reset() while the
hardware is left untouched. Of the two in-tree platforms,

  1. BCM2835 gains the property in PATCH 4.
  2. Cygnus has no V3D power domain to begin with, so the power-cycle
     only ever gated its clock there.

PATCH 1 is an independent cleanup. "brcm,vc4-v3d" was never documented
and was never used by any in-tree device tree, so it is a candidate for
removal on its own.

This series was tested on the Raspberry Pi 3B and 3B+.

Best regards,
- Maíra

---
v1 -> v2: https://lore.kernel.org/r/20260816-vc4-reset-control-v1-0-896444373716@igalia.com

- [1/4, 2/4, 3/4, 4/4] Add R-b and A-b tags from Krzysztof, Florian, and
  Stefan.
- [2/4] Rewrite commit message (Stefan, Krzysztof)

---
Maíra Canal (4):
      drm/vc4: Drop the undocumented brcm,vc4-v3d compatible
      dt-bindings: display: bcm2835-v3d: Add an optional reset line
      drm/vc4: Use the reset controller to recover from a GPU hang
      ARM: dts: bcm2835: Add the V3D reset line

 .../bindings/display/brcm,bcm2835-v3d.yaml         |  3 ++
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi     |  1 +
 drivers/gpu/drm/vc4/vc4_drv.c                      |  1 -
 drivers/gpu/drm/vc4/vc4_drv.h                      | 13 ++++---
 drivers/gpu/drm/vc4/vc4_gem.c                      | 40 +++++++++++++---------
 drivers/gpu/drm/vc4/vc4_irq.c                      |  7 ++--
 drivers/gpu/drm/vc4/vc4_v3d.c                      | 37 +++++++-------------
 7 files changed, 51 insertions(+), 51 deletions(-)
---
base-commit: 5363e01e4ff03a204cab85292b89cf90c2d1b101
change-id: 20260812-vc4-reset-control-cddf3eb8a9e9

