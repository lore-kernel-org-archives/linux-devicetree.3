Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A36485505
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639460; cv=none; b=CfwCyuoklgAQeYYbQwS7P9eVoBDq4IMPgy2hpnG6yb9ko0jE7W1iMDF8VkSYxqLWKwyb1QG+MyeOOe5ZFGGVR+NDRRR/n5J4DoA01y5Qw/BNd8jmZuJA1Ztqxq2VSDAu5tPrlmZ0eJ31bC0jQh8J8I6TOekclnp1hBT8wKvB/rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639460; c=relaxed/simple;
	bh=s7GJ/XaGA4Ke+jhR04V47QIZNMCVFAhn5d7oOCfSKjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYx5nuGQDByOe4vuUY1oX7E92CnNQII2ISv70ENeCJCJWYIwCa2V2DMdJu04NXWrHz28RFhCUNdOKb2eNtnmCzhLZkO6EPhB4SrFN7XSD0awcdpfVK1gdPNNeGTdKTI6kbRTk2sj27yF2N4JZsP1hiACukAJdnCA0Eck/XRWHFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StGMtCsf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StGMtCsf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957799b92fso138625e9.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786639457; x=1787244257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzP4xqIsstfeVL1p2BEayzggpWH6XvsfreBjrDZxCS8=;
        b=StGMtCsfbge0mN+8mrEA4bxbhvQzWVQI7KF/kOD5ex6HRIs8lD7zaCgiVh/lOqIQty
         ZWRZMj3RJiOLhtsYgCh8wy3lkfsp5nwYFoePErVTn6tSQL3XiZIRe4J+kL0vh+fE6SKM
         SkvOZY6Xpo3YLb3fd1ue3Okwur4Vibw5H2nQgJERplPcxEsqpCTE3hhFYglEZoadycf3
         HoJJBMXE6hpBuhKWfiyzhjiC9jC3CN7U42dmu/tz6+LtrXJaef9LpNd74nKADUcScojC
         cxovwSinsMxANjRxylfg0SzCK4v6Vq+LzziJwgBvxErH/5+cRMsNI0LfNZyDi4q0v1Hc
         G/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786639457; x=1787244257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzP4xqIsstfeVL1p2BEayzggpWH6XvsfreBjrDZxCS8=;
        b=KTtQu/fJn5E8nHdtmQtdUiCgPCW4tq4re0Hk9PiOlJGwqH+MQYzS57evsspxGwFSar
         L8QjKW7MT3v3cNCn8I/j7Nsw4ChFwWGJ6VZQdsiHQnlnmRQJYt7SeYB3STZU8pKWeChk
         DZLAg9z8fHPMlK2eAEylf8qj38YoDAR51MK1GuFVNuGZ8hXPrAuu0Cf9kgDhhOTkt3Xo
         o8GNbrmRpckByfG5zFu1Sg6n9muUzYYihi4DS75JKeBFGbsMlBOKBsSprpm7/DM0HiVH
         6xSc3z3FQ2zNy+sD4ISG0sWG8VZEqZdAwnXllMEHF8eJ0ZNDOMg9bYfYtlDVAZdrV+Rb
         fHBw==
X-Forwarded-Encrypted: i=1; AHgh+RrZ68DfXEQeH3n/WpGN4xl4sos4kKNgXhvSP+wcg6CvwpyzdHub65RoCf3qBznWPA5Wm8qEfd/9Tv+q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4nMp1USNThfqmWkQOvN4A5aClxzW2B+1OgsgWTRutr0gtc25H
	BwL3OOEaOAWfu1OnrI6ZvWkv9D5xC+WSDQVuL5ilBXY1Oz4U0AuLxxcv
X-Gm-Gg: AR+sD13ptIfNDdIulnvG/kPiV1BKgDOx5lGCUUTPuAYvZjDLO6mueyKhLhDw0laRaeB
	6D7gx4vnwrVdfr8x6hRQ0SMNwF3GSx+nh10WVZhKGuQMR2+FefqV7w2j4BGTJhi0Hc/pU97gpNc
	4R4n+1cqS8bCOh+wbpHGKhpy2LCwDSpceARioTDxsuR8ZP+PnaQ7T1uyHQU9WxyU4a0Xcrb4XWh
	QHL038YculyIaXs4MWb4iJU4mC4QgFGNt7uYgE6O/a8Ulirsk3QMzV8QbybjtzM5SybP01Cnihu
	JXaLAwpqXt5wt07fMfQHljb0drUZnBo+KsiEiHiGO0kJ7iV3tjWXYsuljcSr+rjuZh9THb8pDFj
	d2sLidw/psQXtaVI9E1PWLtZha8L4AXPEaXqQxIEVxVzDCCV1i9dcFWkfGgDjgIaUWAZsaJlmAf
	whaq2YiDhu/50mabPwt5nw5bM6/303VadQzA9sUNvTw5FarJ0OOrYoqxi6PRbUxEOZ4Ahgpwmad
	cydOUWczJ5J/koYb/9jqTE76vcp1K+ha1fY6G+6Rd8TAC/6luvSpzvLRGoUpxAboDJsHFdNWoqr
X-Received: by 2002:a05:6000:1aca:b0:481:3db3:8eb with SMTP id ffacd0b85a97d-48159edffe0mr5610370f8f.1.1786639456881;
        Thu, 13 Aug 2026 09:44:16 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B911C00586200462B420123.dsl.pool.telekom.hu. [2001:4c4e:1b91:1c00:5862:46:2b42:123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b1d90sm603116f8f.22.2026.08.13.09.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:44:16 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Andy Yan <andyshrk@163.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/14] Support 10-bit YUV422 and 8/10-bit YUV420 color format on DW HDMI QP
Date: Thu, 13 Aug 2026 18:43:51 +0200
Message-ID: <20260813164356.9625-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Cristian,

I tested this series on an RK3588 (Orange Pi 5 Plus) with a sink that
actually needs it: a Sony TV with a 256-byte HDMI 1.4 EDID -- max TMDS
clock 300 MHz, no HF-VSDB and no SCDC, and 4K above 30 Hz offered only
through the YCbCr 4:2:0 Video Data Block (VIC 96/97/101/102). Without
YUV420 output this display has had no 4K mode above 30 Hz on the
Rockchip HDMI path.

Base: drm-misc-next dc2f9f7fed1a ("drm/komeda: Set display/writeback
clone masks"), with the dw-dp v11 and usbdp v13 series applied, plus
three local patches: board DT changes enabling USB-C DP Alt Mode and
pinning the VP2 dclk to V0PLL (DisplayPort side only; HDMI ran on VP0
from the HDMI PHY PLL), and CLOCK_ALLOW_WRITE_DEBUGFS for unrelated
clock experiments. On top of that, the samsung-hdptx clock fixes v6
[1] as the runtime dependency noted in your cover letter, then this
series.

Results on the HDMI-A-1 connector:

- The connector now lists 3840x2160 at 60/59.94/50 and 4096x2160 at
  60/50 for the first time on this setup, and 3840x2160@60 shows a
  stable picture.

- The negotiated wire format matches expectations
  (/sys/kernel/debug/dri/0/state):

    output_format=YUV 4:2:0
    output_bpc=8
    tmds_char_rate=297000000

  and clk_summary agrees: clk_hdmiphy_pixel0 = dclk_vop0 = 297 MHz,
  just under the sink's 300 MHz ceiling.

- Cycling 60 -> 30 -> 60 -> 50 -> 60 re-synced cleanly every time,
  with no errors in the kernel log and the VOP interrupt rate at the
  expected per-frame values throughout (no underrun storms).

To be explicit about the scope, three things were not covered: 10-bit
output in either format (this sink's 300 MHz TMDS limit rules out
10-bit 4:2:0 at 4K, and my compositor cannot force an output format
to exercise 10-bit 4:2:2 -- I can retest with modetest from a console
if that would be useful), and the 4096-wide modes were only verified
in the mode list.

For the series as tested above:

Tested-by: Igor Paunovic <royalnet026@gmail.com>

[1] https://lore.kernel.org/all/20260811-hdptx-clk-fixes-v6-0-75bca0ee5753@collabora.com/

Thanks,
Igor
