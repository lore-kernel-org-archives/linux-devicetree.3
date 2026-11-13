Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586724;
	b=xCZy6Qnm8RZltShaHtSDeza0RQyh8xIeWXsUvdEQgtk6u+ENcI/R2bUvlwJWUQn26JIn
	 Y1kFSJfLjh56cz/xudjFdZ/m5RJuVhfMCTWMTaxPq74QFsOEvBxxeOjyBdHNip2YYLavq
	 S7TpI/snazBfhxUcdhSYy/nkIEyZb4uY9ErDgBWTe5hnpO2wUAhCX6EJhVZWe9UxTV+5v
	 zWD9st2ZlhRMUlitb4HJIMquG+SNqG9yWCQSdJYYEDzlThI93NwMOuk7blIU6yEEAVc1O
	 UD/0DH6rcRShIz+xPBExLy2+cpGaIxtOLUK67oc74syS1HnfLb5Q858MoeQKubYMbBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
	b=I7suW2Kee+e7JjLuClojxNEEdzuxmIAHeGyRFwVNDLykof3QpY7t5NRcJ4F2cWznbfM2
	 j3TH/t6E+E2JHO8Pb5t6EIJBInr+1N+sKqIuc2AlMvjPjBsiCrTofK1WoHPch9BoGvSOp
	 BP++q6TJ/7o58LjuiHg5e7sI2Jpoa+i3nEpgizEtA4rTEChglO+uMYcjNniiXsVs5kub9
	 IXQCuLgqZ/8L+JEhJl4W3XxWGDdRzhbwUHxZReX+4e9owJDJ4fOspm28Tc79cNvbwxXZP
	 VYf/jMcdttEOdHp6iOhgQwOuI5YUJoQSqxFfDR1mdKUfGSMssFdKjjqH5mrEVf7WqwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW2CnBlh;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444FD606B5F7
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 444FD606B5F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW2CnBlh
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50715c2757so187622266b.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586723; x=1795191523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
        b=zW2CnBlhNSQR9WbPdvEY1nHu1vpXRgzQpeR3yrSN56lUcI/pZtxdjas+HtPIm8XqSi
         TWLFOUCYOewkIUmW2iDbvQqCgJlMgfAMOSKE952+2yWhLejL3RNKCzxB5HXiWMo3suYe
         DxaAY1f6GArbgflFx9WoZ9OgvZoAFGxLgpfKnw5hhHe2MgJwokbZa+MT0/+zguSndgAL
         vCfISVMh3jXLRcjuy87D8WpSH63Ytc561VxNc4Jfq0JVA8ZTyd/XQdPwEmqMzaNWSFQ8
         9QzMVOHV/mFoGCmeCUGg6tLdmUiT1YZ1hdA52uOQiq1E+j6/tEtuYncspeHZjPIp02kh
         6vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586723; x=1795191523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
        b=ft99ulETE4q0Rpl9yLlZnPft6hzrIANq8Mj1tzjnpKP6XCP+TQTdwbPH8wgwt/hL8T
         AEyDXYEgOSEMrt0gnhnaEtUzY4VkVZ3Jr3EUwTWdnM6DuNHF8gAviObelqiNj2Ju22mq
         ND1mBFibsxkAR8maYZmnbTOzWHfXFmGNeH6oJ/kuUEp/SkF5cZerO8ilz3eIfwdH/dgQ
         RyX5PLMgXrLPD/MYWAeDWVuLmnISjIIK/LXu0kZekq+BYMqyV9kGbuiTIMs2QGEPJy3y
         PjJbFLpfKJ7Rc6xH04oMYrVxk/j1ablhmt4vRqkohh5xlBN/YgG7pLrp4l99d94nwioi
         uraQ==
X-Forwarded-Encrypted: i=1; AL+hErGwi5YKG5VzvIbpdMVmI7MphMp54wC2X87dUR1+dwgKqkmUkUKQDcdN+PaEPfeNF8sTee/uDsybCZrS@vger.kernel.org
X-Gm-Message-State: APuU4Z9y5fz3am41nQfSbPa/E+M0GIUywfrWzoBKYJ6Wl2M0+VEUGzFq
	h7tsE7kNv6/hZhXZ7uXCArIpFjp0tS3MxsvffX3C41BPhFgtd6aSf0iN
X-Gm-Gg: AYBFou1ROQoCcbkHoK1oJpU1k+WAy8KPyiNqEFOcm2/9wucVoCg2t6HP6+14s0chyk4
	4qx/2tVkOvLMZs+pefDCrEXZDOmJopxm1X39lmUJxpjQ49QfW1pRh8ybJUW5cI9mguhnC8UMO3D
	ysR8UEfif71HnJFKo148FmWVoYZNYPvFP9LtjTnbeQpA3XdctypkLaUJCChJAlBv310i7N1B1bT
	kZL1rvJfOoHJILtbEBHOV1Qe8EUSvZRyV71N2ea7mqO23MfAibA1gtyrT4A4e1Yx8t9cR6moqHO
	GgaGFKoNAFlYtAzniLgNIyjpDiry3kIcmHeDkKW45b9cmECYaCXf0w3xmo0u8r7mHo7uZD2ZBoC
	oOcB61iQmvbcl/iUFucZMDV2yRBG059FktkdPRTLfyAD7OIR/pD2QQDwlC/hzp14gxevy810q6d
	nmiZsj1ofYbpK/sQFV/HNHeNFYkCUnEc582kvE4RdHE8laI0ikEiJH89HVmodKpTQr1fQx8SO+t
	sja0RFWWhTxwImb+o5YCLFcrZfYQMAY96rFWtpOCJXp/dL79Xny23cm1SdNSah0gKdfGZgOh6nh
	Fd+ekfmJ0XUd1eYDb0Tb28ibkBNAzyXK1JTrBJuTrSyDdCOinYhGiH4mI+Lwoea90qC7ZD6/PFI
	7lrLSSzm73g==
X-Received: by 2002:a17:907:c06:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c5096328858mr256085866b.17.1794586722589;
        Fri, 13 Nov 2026 08:18:42 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 01/10] staging: media: tegra-video: Move driver to media/platform/nvidia
Date: Fri, 13 Nov 2026 18:18:10 +0200
Message-ID: <20261113161819.36847-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

The Tegra Video Input drivers are mature and developed enough to be moved
from staging into the media subsystem. No other changes are introduced.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/Kconfig                           | 2 ++
 drivers/media/platform/nvidia/Makefile                          | 1 +
 .../media => media/platform/nvidia}/tegra-video/Kconfig         | 0
 .../media => media/platform/nvidia}/tegra-video/Makefile        | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/TODO   | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/csi.c  | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/csi.h  | 0
 .../media => media/platform/nvidia}/tegra-video/tegra20.c       | 0
 .../media => media/platform/nvidia}/tegra-video/tegra210.c      | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vi.c   | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vi.h   | 0
 .../media => media/platform/nvidia}/tegra-video/video.c         | 0
 .../media => media/platform/nvidia}/tegra-video/video.h         | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vip.c  | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vip.h  | 0
 drivers/staging/media/Kconfig                                   | 2 --
 drivers/staging/media/Makefile                                  | 1 -
 17 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/TODO (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)

diff --git a/drivers/media/platform/nvidia/Kconfig b/drivers/media/platform/nvidia/Kconfig
index b211b46877f63..53f34308f5aff 100644
--- a/drivers/media/platform/nvidia/Kconfig
+++ b/drivers/media/platform/nvidia/Kconfig
@@ -3,3 +3,5 @@
 comment "NVidia media platform drivers"
 
 source "drivers/media/platform/nvidia/tegra-vde/Kconfig"
+
+source "drivers/media/platform/nvidia/tegra-video/Kconfig"
diff --git a/drivers/media/platform/nvidia/Makefile b/drivers/media/platform/nvidia/Makefile
index 428415ff83de1..97a94b60fee93 100644
--- a/drivers/media/platform/nvidia/Makefile
+++ b/drivers/media/platform/nvidia/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-y += tegra-vde/
+obj-y += tegra-video/
diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/media/platform/nvidia/tegra-video/Kconfig
similarity index 100%
rename from drivers/staging/media/tegra-video/Kconfig
rename to drivers/media/platform/nvidia/tegra-video/Kconfig
diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/media/platform/nvidia/tegra-video/Makefile
similarity index 100%
rename from drivers/staging/media/tegra-video/Makefile
rename to drivers/media/platform/nvidia/tegra-video/Makefile
diff --git a/drivers/staging/media/tegra-video/TODO b/drivers/media/platform/nvidia/tegra-video/TODO
similarity index 100%
rename from drivers/staging/media/tegra-video/TODO
rename to drivers/media/platform/nvidia/tegra-video/TODO
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
similarity index 100%
rename from drivers/staging/media/tegra-video/csi.c
rename to drivers/media/platform/nvidia/tegra-video/csi.c
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/media/platform/nvidia/tegra-video/csi.h
similarity index 100%
rename from drivers/staging/media/tegra-video/csi.h
rename to drivers/media/platform/nvidia/tegra-video/csi.h
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
similarity index 100%
rename from drivers/staging/media/tegra-video/tegra20.c
rename to drivers/media/platform/nvidia/tegra-video/tegra20.c
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/media/platform/nvidia/tegra-video/tegra210.c
similarity index 100%
rename from drivers/staging/media/tegra-video/tegra210.c
rename to drivers/media/platform/nvidia/tegra-video/tegra210.c
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
similarity index 100%
rename from drivers/staging/media/tegra-video/vi.c
rename to drivers/media/platform/nvidia/tegra-video/vi.c
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
similarity index 100%
rename from drivers/staging/media/tegra-video/vi.h
rename to drivers/media/platform/nvidia/tegra-video/vi.h
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/media/platform/nvidia/tegra-video/video.c
similarity index 100%
rename from drivers/staging/media/tegra-video/video.c
rename to drivers/media/platform/nvidia/tegra-video/video.c
diff --git a/drivers/staging/media/tegra-video/video.h b/drivers/media/platform/nvidia/tegra-video/video.h
similarity index 100%
rename from drivers/staging/media/tegra-video/video.h
rename to drivers/media/platform/nvidia/tegra-video/video.h
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/media/platform/nvidia/tegra-video/vip.c
similarity index 100%
rename from drivers/staging/media/tegra-video/vip.c
rename to drivers/media/platform/nvidia/tegra-video/vip.c
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/media/platform/nvidia/tegra-video/vip.h
similarity index 100%
rename from drivers/staging/media/tegra-video/vip.h
rename to drivers/media/platform/nvidia/tegra-video/vip.h
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 644aefdb9d41e..8a5f6dcc49adf 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -34,8 +34,6 @@ source "drivers/staging/media/meson/vdec/Kconfig"
 
 source "drivers/staging/media/sunxi/Kconfig"
 
-source "drivers/staging/media/tegra-video/Kconfig"
-
 menuconfig STAGING_MEDIA_DEPRECATED
 	bool "Media staging drivers (DEPRECATED)"
 	default n
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 584720e91327c..b8d874766371e 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -3,7 +3,6 @@ obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
-obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_INTEL_IPU7)	+= ipu7/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
-- 
2.53.0

