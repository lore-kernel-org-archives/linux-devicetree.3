Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7884649BB65
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408727; cv=none; b=tFqIqu/r4lahwbks+K5h5BiZvtyDNTaGVySoDSQzKsGx4hbl86s3+g3/jNam950+JBvGGxGt9PVFqNohigrvOyKn0uCqB1/vswYSWxDbHJDfW6JmebPyn+soAvkXaRsFSusp11ToEF2UTXiqoL5SxIuZjhRTOkr4GC3FBPfzAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408727; c=relaxed/simple;
	bh=sibS6+PbzNU0PLhMfzlVYE7Xqoew+WZ9iiOgUjlOo0c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A53zSDEsqxmOVB3QWwgPC26S17K30+ImspqFo7jWpiAYSmCJI//sRA2ypnqD7KN7FswEJeahiI/efGReL7KBHtfRReFJRPhgH1A2FKSz4igcotKc3hU/+YBDaq8yqDufwlmB0hzi4RVvcbAcLt1a1StIdgo4A6nIZiKoQRQp9V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9jQvef4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9jQvef4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso1573219f8f.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408720; x=1793013520; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gU+rM/4AoM2OmLlkODpIkEr5BcTOLpyqHtt4WEM8bII=;
        b=o9jQvef4QMmvhdBDnKHZmXqLoOETCkIPM6pAVAGuDC7o25jSFuvEgPMEGgnIhBXkBE
         bQJRYJQPvlvQf/N+qT8iOq3Lr/fvjEvhJ3bzY3jjACsbc8pzoupUux4l6S4fz0+hJGHY
         X16MzB0gj3h3OZEgPFG/u7bncI+rPSdWfZYxh0iE04Bbewn2Rw0YWBKzzaH90Mz7yekH
         1l49CAOOJmd6R7z9lC7b9J+/PIAP+nXUfD9uwvTNtH3mtl+r9s5bacC8D9AYU1tYmGAw
         Uzk+2Y96rU+A1TtnGyq1J13xwlPRk6hpZMbT7tMgq5pXbMiKXlfqn1pnOtZemy0rlfxo
         Ni4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408720; x=1793013520;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gU+rM/4AoM2OmLlkODpIkEr5BcTOLpyqHtt4WEM8bII=;
        b=06GJVyGIxeMpW8rXcmh8nnmfS+l8fIp0TnoZ/0LRy5XIq1l6IjWgM842ZX8LM6YKfR
         LCmNsLr9ttF80GvJbbc/TQI0+9RwFsk4uVcg7tpzAsI1T7q0ZQuReTk0PYIEyKSFP0J2
         CtEJ4mqfGNgGnv7aoQwknJgAn9HtmEd2vCm3PNr7gkugMqymlty1kCXx/VO8hgnQyL2x
         6OkEqiRWnZQzQKBs/DXWQsffVMFokzxQ9hKtYiaiqwoehskLrpkaUXbC2S/f203Bd3EB
         Yznl3ubLxxTeeZdgwlZlTfwN5WsSAjaPRzseCJk037btSI1WvLm1oB0j3/AYynG23UB6
         IU7g==
X-Gm-Message-State: AFq9FYIpVmqXXfnLbPhS16FwuNjbSz4LoKmYWhQZ5xCfhGw0Fm/KpEog
	dw87mjmF94X2hOlWxwh+ktZru+OBwFpvatnlmqKLqdv6CbgxLulClBZW
X-Gm-Gg: AYBFou2HfN4+40/U7ZYoE81Z6i5l56jcx+TlgyeAC9/lzD4m1GpwC3KlBzSl+Amuujv
	K8Dzzat3nPnHcLqRPIzTPNRbHQ/4W99DJ9JcziJRNmBCywHH5GfcOx/+bE+m66qzIyhGaWZ+w60
	Utukp9t0ae9MIuK65PS83m1Z4zJcZYaTTlb3+jCfRH0ePik3HG1wLWiaTdn3K7I6DYrzZ1ParZs
	OLqjVTndi2Q3gCK8XPkPeddOFGo/jU6nHrsuVh2wjAxDbW/AS9txbVle7/Z7JN1nuqmJBHjt3u1
	CFiqp81MR7okw3bKR7D/KLdXHVxFQKzfD8W4YwpFyi5oHkzJKknGd3mpLMIwsY9VnxUlK7cacdo
	eT6dl2183JdK8trXgDTXOO7G8cJuCY2kk5n4Arh4hwxvW4SpNCkGj88ODK4tZGNU9fpKPLfo8/W
	G/NPiZLs9695yGsXlcHFSIYw52CajbKzqxCmSetuTEOh6l73Z8oaUsz/TxOVEUGSVjiqE+cRDR8
	vCdEmdc/JBcNEyKL7pg5pCKL9ZJiqzjseIMAbqmvRrmFoRd0MCz7CtCeAb6qRZS79f38+bqBJd2
	I75O/dQKVHMb63UQQVrLng==
X-Received: by 2002:a05:600c:1f83:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a1d7612128mr156524285e9.16.1792408720439;
        Mon, 19 Oct 2026 04:18:40 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:40 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Subject: [PATCH 0/5] ARM: dts: Add Colibri iMX6 overlays
Date: Mon, 19 Oct 2026 13:18:29 +0200
Message-Id: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gZs0fq5irioNWpAraRQFPHuF
 pdvMfNAIGEK0GUPCEUO7I8ElWfgVnsshDwlgy60UYVq0fmNR2Hk/TLoI8lm74C2mmxT0jgrXUN
 qT6GZr//bD+/7AXR7kt5nAAAA
X-Change-ID: 20261019-colibri-imx6-overlays-a5da84ebf127
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=sibS6+PbzNU0PLhMfzlVYE7Xqoew+WZ9iiOgUjlOo0c=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qdvk9Gbh8e+i0/dPTuiabXL8+MPu7zneko6NZo6H
 ysSLHX07ShlYRDjYpAVU2TJeKIqyKcQIuvB0ZwMM4eVCWQIAxenAExkxg6G/3miV6822KTwsHi/
 N39z4Ihps1nPpVmfIizZXEQvOy1/sIuRYcshkQVL3rQvK9EX3+EabK0vOzHaqKks+vDdX4uZy4O
 YGAA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

This series adds device tree overlays for the Colibri iMX6 SoM. The
overlays cover HDMI, VGA and parallel displays.

The series adds support for:

- HDMI Displays
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- VGA Displays

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
Antoine Gouby (5):
      ARM: dts: imx6dl-colibri: Add HDMI overlay
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add VGA overlay

 arch/arm/boot/dts/nxp/imx/Makefile                 | 85 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso | 27 +++++++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 +++++++++++++++
 ...6dl-colibri-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++
 ...6dl-colibri-panel-res-touch-7inch-parallel.dtso | 29 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso  | 67 +++++++++++++++++
 6 files changed, 303 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-colibri-imx6-overlays-a5da84ebf127

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>

