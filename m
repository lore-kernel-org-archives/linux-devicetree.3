Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A1F47A0DA
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 19:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933192; cv=none; b=QF7+y9svliJgbwOBDr+si2tyiNbCk8ZbeUzjtGF8KAcgDJVAUc3SugTMbua2MTcs2jIlzW5xgTBr5Vif4mNy/t13sZnoi1/cP/t7GgwBkcUT8BnpDmU0fgSlgQq9rqUfSPlzF0h5bceJItMRjUi/4+8HxSfaqACgP/YcJhLCkIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933192; c=relaxed/simple;
	bh=t48O1jAHYkEC2Xl86AqMZgcd03g48vUtinaJd21pCjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rv7jmfEg7bM+5CKi6iQgqZVh8Y1cTHANcH3srx/yJUwFyXXIN50nc/2UruoHRzFkd+d0W1jQxjXKV7XNmWhFDXe5b4QmRgnnmG2hEmunjHPLvXtXxp6UeVYrl4dsyWnF8IpZyMaX5SNR/zkRhWMyAGW2fheiaJ1VF5LwYmp7TFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDEUVtrj; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDEUVtrj"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so1529005f8f.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933188; x=1790537988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lRsK/bUS1LsNCH6a4KPFVT2xb306bKtIOhyNl0hodQ=;
        b=QDEUVtrjhNfFGHm5/zdGVkX8JKU7rgXUXHD+JGPTcn5L94iovYwF60f4zoTMYQ+Upn
         w9cyaPeaSmEHaDmBdW5p0QMqZH2Pjg7j/3EUwrD6g2ja2wuV0P0mZUUCsMxrH7BV694d
         Q06FN3t76KsBiQSiC40s76e3xEYCOQUZTODYvzCaXdeXQAicIBriPl652Q6sqs7wL8uP
         M/9azwnd/rHLjiVkfZl/y5HEh9Ewqz5pPH+4mMTE6q2WLKFBZxXlaNkVYKd2B53SHE9n
         alm0sL6mFmO29ei7M53YFtGZM4lfAXTpu1bz2nVfHB8bLnZC9/YofeF+4wBN5675sS14
         yvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933188; x=1790537988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lRsK/bUS1LsNCH6a4KPFVT2xb306bKtIOhyNl0hodQ=;
        b=lbUQhw5QUNeEJ/dNvHiul7iioKxBt2rb7ibc9Fj7jxG8fHpp5nW5H/uZxSprpJH38X
         31z5fgz1LYR03sD3stFvHN/N2Pu95wDwc8yICuo9PdjOl4MnFtmiKdV1+ALiIw+k++us
         o6zJ4jOyp6zZmf8bTFG657TqrurZUUP3cEYl69SUgIMNI7bKGb9AmAX6w+BpPd8CQms2
         a9aziO7dxrGg5IPjWd1WBwair+QrMvfuAUNAiPhyaDXbXR1T39+894iEDrIDyulzbuw7
         aFITgyciw944XQsJ8kaSlkShv+CT5R4iIcqjuvvr2maB730knWdT7LY7TQGIetBgFAqN
         hRrg==
X-Forwarded-Encrypted: i=1; AKwUvByKZ66xUyI1T+aHfLWC/oRXnsacp7n+L6+Yl4dVQzP4yVVQ+ayZ9mGEzCPyQ1I+8nggf78HuRMlnZI/@vger.kernel.org
X-Gm-Message-State: AFuF++ltpeKDuQZ8slYwkm5Eznj5RVUM5NPT4QioGiYqaXv8PMkptY3R
	fMNQk0vGufS2FiOwvDWR5wBgRqUJgYpjahvSw6E5UqXgnWkhjRwM2Nt+eFsFLLda
X-Gm-Gg: AYBFou10qiRnRNvdeKDV5xShEqEOFDRaVcPlQXMUNMBD6tdJ9gdASFYXA3bwJPKMdkC
	4Wut5zJ8mDg/rC1FI2kfMoYaUFbeiZO6SlnegCgVmrz/TuQdY/PRfRPBZ1yRF7Y/Y2eedhIox8f
	AlmxBzRnbl8BoIdZLRHGUHv2ulZzz2JldUX04+EV1GkWOSy+p+bpg4P687xbbPZXSFK3OrqcfFE
	m86zJxuuE2KjtRo6SbPMliLa9EJLB3bho2DfamcRBFySD5czWa3iYAqhSwn8detGAoTFpZ2mljX
	kRj66LQxWA9LPx+YmIymIneKl2y2HW1nUbVg0eVoIs9s8NwAwQpE5F+oNo8qXgtnGPbjFWuOJFX
	8IHU7x+e+XOM4Dc1yzdX8kuANYf1LtMdpm82X8ovDwMlLmPDgQEEgDG7Dfb5e9Ref8B7XxgFl3n
	33dPDMxZ0StS9zT7MMTfSqLfDSHovhpMzzLNWCwanBnGr5aE/shGUF0yUj36rO0ZPUSHczQI3dD
	188yG0o1TbsRYCFxeLAU+zODaI0NhUMOqxQA1eQK7zMB2GRQeak++mjxkok7GTzdaoZFiDS34Md
	1O+olOVDXEQDGA5C7yZ1Ifq5SLQSy77Y0cPhaWEyE/mimMI=
X-Received: by 2002:a05:600c:468c:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49fc56811dcmr122160665e9.4.1789933188393;
        Sun, 20 Sep 2026 12:39:48 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm168250455e9.1.2026.09.20.12.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:39:47 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	u.kleine-koenig@baylibre.com,
	Leander Kieweg <kieweg.leander@gmail.com>
Subject: [PATCH v5 0/2] drm: Add DRM driver for GlandaGPU (VHDL soft-IP GPU)
Date: Sun, 20 Sep 2026 21:39:42 +0200
Message-ID: <20260920193944.110983-1-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v5 of the GlandaGPU DRM driver series [1][2][3][4]. It
addresses review feedback from Thomas Zimmermann and the automated
review bot on v4.

GlandaGPU is a small VHDL soft-IP 2D display controller, currently
targeting a Terasic DE10-Standard (Cyclone V SoC). This series has
been tested against a QEMU digital twin and on real hardware.

Hardware/VHDL:   https://github.com/stiangglanda/GlandaGPU
QEMU fork:       https://github.com/stiangglanda/qemu-glandagpu
Userspace tests: https://github.com/stiangglanda/GlandaGPU-userspace-tests

Changes since v4:

dt-bindings:
- Mark "interrupts" as required in kieweg,gpu.yaml, now that the IRQ
  is a hard requirement for the driver.

driver core:
- Replace iosys_map_rd() in glanda_blit_rect() with
  iosys_map_memcpy_from() into a per-row scratch buffer allocated
  via drm_format_conv_state_reserve() (solves the unaligned-pitch
  problem without breaking uAPI) (Thomas Zimmermann).
- Add drm_atomic_helper_shutdown() to glanda_drm_fini(), after
  drm_dev_unplug() (Thomas Zimmermann).
- Add an all-ones check in glanda_irq_handler() to guard against a
  disconnected/floating ISR register (Sashiko bot).
- Add .shutdown for both the platform driver and the PCI driver
  (Sashiko bot).

The Sashiko bot also flagged drm_gem_fb_begin_cpu_access() and
drm_gem_fb_end_cpu_access() as potentially sleeping in atomic
context. I'm keeping these as they are, since they were added on
Thomas' recommendation in the first place.

Regarding IRQ handling: as Thomas suggested, I made the IRQ a hard
requirement and removed the polling fallback entirely. That fallback
was legacy from an earlier hardware revision that didn't support
IRQs at all. Since current hardware always has one, keeping two code
paths around wasn't worth the maintenance cost.

Because of this, I also had to mark "interrupts" as required in the
kieweg,gpu.yaml dt-binding again. That patch already carried a
Reviewed-by from Krzysztof Kozlowski in v4, but since the binding
changed, I'm not carrying that tag forward this time.

[1] v1: https://lore.kernel.org/dri-devel/20260714101146.200416-1-kieweg.leander@gmail.com/T/#t
[2] v2: https://lore.kernel.org/dri-devel/20260730173643.256052-1-kieweg.leander@gmail.com/T/#t
[3] v3: https://lore.kernel.org/dri-devel/20260824195418.17707-1-kieweg.leander@gmail.com/T/#t
[4] v4: https://lore.kernel.org/dri-devel/20260913205007.118552-1-kieweg.leander@gmail.com/T/#t

Leander Kieweg (2):
  dt-bindings: display: Add GlandaGPU binding
  drm/glanda: Add initial DRM driver for GlandaGPU

 .../bindings/display/kieweg,gpu.yaml          |  56 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  11 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/glandagpu.c              | 655 ++++++++++++++++++
 6 files changed, 731 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml
 create mode 100644 drivers/gpu/drm/tiny/glandagpu.c

-- 
2.43.0

