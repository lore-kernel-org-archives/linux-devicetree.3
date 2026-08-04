Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com [45.254.49.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBF2439F7B;
	Tue,  4 Aug 2026 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831771; cv=none; b=IV2viEh6ayj1lqyCw6+mw6fKeWjEvWrvTpmnHnW+HHiW/Vu7aU6HRBwCQ45UUQ8dpZwGMziPPLlpwKMTSsfgGhDhd+6gXIKGBDEPHfRjGPyoyEd8x/LGfqN1nPpiaPZWiRnW4Pb44Lj15ly5s1Qh3Lyki1ZCOhI/3QwyjG+ZQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831771; c=relaxed/simple;
	bh=iI5BEvZlPh3C+7MqLlaUqDeOqp7IZqJIQHDtp0ck1MY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YmFNDVaIl4+SufX8J8HsWQht4qWwKKp1hjsN210UQWki5diFEgBeM8QJ/VEl/EolFCGM7MwpjFQJJ1mq6whj7T3aBFdblbiliEmOAcNuXzKu+WmROMQrrsOXZ+3rgkfZ19rRKklbYNBwaw+xmxY3gtpAV/UuqZJwgQptlOv0h+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=B0O3LnFK; arc=none smtp.client-ip=45.254.49.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="B0O3LnFK"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48b4ffeb8;
	Tue, 4 Aug 2026 16:17:23 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 00/10] Add HPD support for Rockchip Analogix DP
Date: Tue,  4 Aug 2026 16:17:07 +0800
Message-Id: <20260804081717.741404-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fcbd94c8a03a8kunma7b8cbe762b05a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSx0YVkpOGUtNHUMdS01JQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=B0O3LnFKaGEGcuqFzDxOAAhsrpKAclkoHT8Ss10xQwo8ENT20Orwa4IN82hep3lXA6CRwdqQDTMci+Z3POAAX82poTM6fWsHjSh7L6bV7FjURLE6vCcCANdDb5XUKb72MCOPWVDUCOBvHUXifcf4/Lp8Fhvo2mnRJRT+AsCmf+o=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=XEJwkzKAxzdmwnFl/XhAo3dBSYt45hv0UwpouGA/PdA=;
	h=date:mime-version:subject:message-id:from;

This series improves the HPD (Hotplug Detect) interrupt handling in
the Analogix DP driver to enable reliable native HPD pin detection on
Rockchip platforms, and introduces platform-specific HPD detection
schemes with fine-grained interrupt control.

On Rockchip platforms, the Analogix DP native HPD pin IRQ requires the
DP controller to remain powered, clocked and initialized to generate
plug/unplug interrupts. The previous driver enabled/disabled IRQ during
bridge enable/disable, which left no HPD detection when the display
pipeline was inactive. Additionally, the interrupt mute/unmute/clear
routines operated on all HPD interrupt bits unconditionally, lacking
the granularity needed for per-event control.

The series reorganizes IRQ and pm_runtime management into bind/unbind,
adds IRQF_ONESHOT to eliminate read-modify-write races on interrupt
mask registers between hardirq and threaded handlers, converts the
interrupt type detection to a bitmask-based scheme for fine-grained
mute/unmute/clear operations, and configures Rockchip platforms to use
the HOTPLUG_CHG interrupt with a 2ms HPD deglitch setting for better
stability.

Patch  1: Move enable_irq()/disable_irq() to bind/unbind and hold a
          pm_runtime reference for Rockchip native HPD pin mode.
Patch  2: Convert analogix_dp_get_irq_type() to return a u32 bitmask
          instead of an enum, accumulating all pending interrupt flags.
Patch  3: Add IRQF_ONESHOT to prevent hardirq from preempting the
          threaded handler; remove redundant mute/unmute from runtime
          IRQ path; move status clearing before event handling.
Patch  4: Extend clear_hotplug_interrupts() to accept an irq_type
          bitmask for per-event pending interrupt clearing.
Patch  5: Extend mute/unmute helpers to accept an irq_type bitmask for
          init-time platform-specific interrupt mask configuration.
Patch  6: Simplify analogix_dp_config_interrupt() by removing redundant
          local macros and leveraging the unmute helper.
Patch  7: Configure Rockchip platforms to use HOTPLUG_CHG interrupt with
          2ms HPD deglitch; other platforms keep PLUG + HPD_LOST pair.
Patch  8: Skip native HPD interrupt register operations for GPIO HPD
          mode, where hotplug is detected through an external GPIO.
Patch  9: Restrict the forced connected-status shortcut to panel
          endpoints only, so DP connector bridges rely on HPD detection.
Patch 10: Handle HPD notification from downstream bridges (e.g.,
          display-connector with hpd-gpios) to short-circuit
          analogix_dp_detect_hpd() when connection is already confirmed.

Tested on RK3576 with both native HPD pin and GPIO HPD configurations.

Native HPD pin mode:

  &edp {
      status = "okay";
      pinctrl-names = "default";
      pinctrl-0 = <&edp_txm0_pins>;
  };

GPIO HPD mode:

  &edp {
      status = "okay";
      pinctrl-names = "default";
      pinctrl-0 = <&edp0_hpd>;
      hpd-gpios = <&gpio4 RK_PC1 GPIO_ACTIVE_HIGH>;
  };

  &pinctrl {
      edp {
          edp0_hpd: edp0-hpd {
              rockchip,pins = <4 RK_PC1 0 &pcfg_pull_none>;
          };
      };
  };

Display-connector mode (DP connector without HPD GPIO):

  &edp_out_conn {
      remote-endpoint = <&dp_con_in>;
  };

  dp-con {
      compatible = "dp-connector";
      label = "DP OUT";
      type = "full-size";

      port {
          dp_con_in: endpoint {
              remote-endpoint = <&edp_out_conn>;
          };
      };
  };

Display-connector mode (DP connector with HPD GPIO):

  dp-con {
      compatible = "dp-connector";
      label = "DP OUT";
      type = "full-size";
      pinctrl-0 = <&edp0_hpd>;
      pinctrl-names = "default";
      hpd-gpios = <&gpio4 RK_PC1 GPIO_ACTIVE_HIGH>;

      port {
          dp_con_in: endpoint {
              remote-endpoint = <&edp_out_conn>;
          };
      };
  };

All four configurations detect cable plug/unplug events correctly.

Damon Ding (10):
  drm/bridge: analogix_dp: Manage pm runtime and IRQ for native HPD pin
    detection
  drm/bridge: analogix_dp: Return bitmask from
    analogix_dp_get_irq_type()
  drm/bridge: analogix_dp: Add IRQF_ONESHOT and simplify IRQ handling
  drm/bridge: analogix_dp: Extend clear_hotplug_interrupts to accept IRQ
    bitmask
  drm/bridge: analogix_dp: Extend mute/unmute HPD interrupts to accept
    irq bitmask
  drm/bridge: analogix_dp: Simplify analogix_dp_config_interrupt()
  drm/bridge: analogix_dp: Use platform-specific HPD detection scheme
  drm/bridge: analogix_dp: Skip native HPD interrupt ops for GPIO HPD
  drm/bridge: analogix_dp: Restrict forced connected status only for
    panel endpoint
  drm/bridge: analogix_dp: Handle HPD notification from downstream
    bridge

 .../drm/bridge/analogix/analogix_dp_core.c    |  87 +++++++---
 .../drm/bridge/analogix/analogix_dp_core.h    |  12 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 152 ++++++++++++------
 3 files changed, 175 insertions(+), 76 deletions(-)

---

Changes in v2:
- Split IRQ enable/disable logic, handle native HPD pin and
  GPIO/force-HPD modes separately to avoid unbalanced enable_irq()
  calls.(Sashiko)
- Add separate patch for IRQF_ONESHOT to resolve interrupt mask issues
  triggered by interrupt preemption.(Sashiko)
- Update commit messages to align with newly added IRQF_ONESHOT related
  commit.
- Move ANALOGIX_DP_HPD_DEGLITCH_L/ANALOGIX_DP_HPD_DEGLITCH_H configs to
  analogix_dp_reset().
- Add new patch to restrict the forced connected-status shortcut to
  panel endpoints only, allowing DP connector bridges to rely on HPD
  detection. (Reported by Heiko Stuebner)
- Add new patch to handle HPD notification from downstream bridges
  (e.g., display-connector with hpd-gpios).

-- 
2.34.1

