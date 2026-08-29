Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D944C353A9B
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985503; cv=none; b=NHSquHyj9nTQ5pA0rInCrvH0pnd7+aIMioCcEof3k1FkattVMNBZJ8BOWPBbfGfFBUW3V+oWEy2WGhmeGPa53Dl4KKYprmApyAwCft/DLcBOKH6CQormp5IpRT0Wq6HbPFZhejiTx5u3szOuv3JIHboXfpnb6YiFaGiws5jWBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985503; c=relaxed/simple;
	bh=jP2B8Oq/SxivmT2+4bp6q/xxtMABghG2HFb3rq1F3l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3yzgYFohGaO50I3pDfnZqrxfboDtTvm6lf6wicaAt1TDB8Sn3mOg6NvAimbE62gB0Tm2rUZhz4FjAvGUBy7Ud+cbcxy8EaKWOjoog2NtDVxE3//wQ64nE3X8GBw6Ufqwh1GFFUKjPAdIiCXX8ESnfZoZ8CurLvRzsxL1ZzduGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUKpH4u4; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUKpH4u4"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so1314992a91.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787985501; x=1788590301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5O2ZS9+ansg0/IUrCuwtyZKXd4BjLxjahxk05rb1blQ=;
        b=CUKpH4u4wbfgVsXjqNgQpCom2St/IR3sBjGtAh94rjYSiLD6/Sw1bMDatarQD1we0V
         qMXeU2RnUrPP5yp14bbSI2ohM2rRQXfFrceyoPj83FJZDORM3p1Ob7vcir+PIx7HsEgP
         GU/UKwHfR10/YHxVOH/yRGl2SJpKgJtgebIaMMVmS9hO7a44fUXoGB8xqBqcwR8j45O0
         ZUuEEKZJR1YrFf/wjfJA1hptBqwsa7bRaJI7QKNmU5XTdXcbK5Lyc6xnftGZLK7vX9/z
         bj8bh9bYzcjUmTRkNexFyWFcgFVN8/ayK1bR+FLYYSNRgJ2n80uL5k9QvkLMQrxzskv6
         xahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787985501; x=1788590301;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5O2ZS9+ansg0/IUrCuwtyZKXd4BjLxjahxk05rb1blQ=;
        b=BCXBztQRYqi4oXD+ga/K/dKm0Fa+KV3yE98mtDk0bAKp5TLsJJTYVbpT2SEetdWror
         tZZp4ZFBzWIiNsg3zH4x7NoPJTZ3c5eLsoxrni7SUN41nTv0D8PnPvulL+35lhvNGLFO
         fc1MZ72lW3xn5xTKVPRFuzPW6lLNd5sk3lAk/bbK2BD9OJJhBgGlkSENNPfzfHiRJbgy
         hTb5YWbJ0oAUdBvvHmlw5eTCvKKg1nJ97BZPphSWEYEurScKYfUxqSe0xs5gt3cdBgF2
         SGYepjEZsFFc3d00C19GH1PrBfvVLfwEWseQfVi3UcMtLLAY2c25vsMXeGl5e3L5T910
         9MAA==
X-Forwarded-Encrypted: i=1; AKwUvBxH2aOgr4bV1OWHGeenxFHwSCpa/5mVUtoDBnQxMS+wC9I1SQIeW44q+v/ewaQLz40jF1jl9fFqKj+p@vger.kernel.org
X-Gm-Message-State: AFuF++kAzsLxdqdBTdERrm/5/OaEYsvYEwCaSTdBrtwXWCIbjQMBAjvR
	3BJDJCb+iwdvci6UborffIxaNZvCWLi8O7VNpb58jR36NG8kbe2EMoo=
X-Gm-Gg: AYBFou2GoNlFh+cNP4CwNM3w5lusLO72fMC65gvqZBkCd71FQRZRJGsKutA7FY8a5Pc
	B+Gnj+mANSqiiuEMWG8A/U9wo1lNmMIkCurvi5gTmU1udkk8KtH5rg/j+lhOBlWlL0/nXoMR/5h
	JJWzEyA4wAZNmU3LQM+qshn1Ulhm5IYBsCgDWQe71ezEdThv6+FrYsGYbvlkzV/0IL33CxTiKvh
	MGL4dD+ohWTYhoesUaw+tLkm50S48+p/0i01rPzCDYbWE1TwbOzNj6YbqZVizbIx7ozvkayNQme
	xtxKrYsylfOMxRgSeO6s5D8N0PDYcsFiVdcImACogJsggT3YtMZ7cIFzU6N1+RDewhoPodCW0y4
	PbAeE9sfOTJPz722wTkXBrV4ZzmVYfZLvN1hnsx65XgCoHrIuqsICtliRCoCXiewW3g55eFGbpQ
	RqQWOJKpMh1m+uhLtOwaIJB7RGhoAT9bYqE6Z0lqf5KiZ2zUWm8eMKe/1Riyppy71XbmuQoqIBh
	o4c7uLygm0PowFzgrrcnWtxNuj4U/LqH21Q+HwgaWuEnTdI0Q==
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr22749011a91.13.1787985501343;
        Fri, 28 Aug 2026 23:38:21 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm10957539c88.2.2026.08.28.23.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:38:20 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Sat, 29 Aug 2026 03:32:15 -0300
Message-ID: <b02861a81badc32b414147f36e0c429969aae225.1787973729.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787973729.git.nico.antinori.7@gmail.com>
References: <cover.1787973729.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entry for the Chipwealth CH1115 dot matrix OLED
controller.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59d60df34dfa..dff105e5f01b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8581,6 +8581,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/chipwealth/ch1115-i2c.c
+
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
 M:	Simona Vetter <simona@ffwll.ch>
--
2.47.3

