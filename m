Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAC42C11F3
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309904; cv=none; b=tyiWZEOKgXvi8iC8FCJUx1hGUF7ehg38U1XWFfpKbipzwugLtJGbWNwdvlpWdFdXzTVTsrnFpb+v4NLEWWvaPAiY4Jo320xweKoBJ1eqdQwKZeT8TM8GPPR5O6LhvpbnkKPno0shWdMDNn3ygGLjh8zNMuNGh6vuJR7JYs9rJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309904; c=relaxed/simple;
	bh=PSBsdqT+sBcPCV2VzBDoN0aTW8ELufQDnrojHfAS3LY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7PfvKaxp/gorrIWP2mi4dSxe+9ZmswUMcD2Usnjwq/e3mrvmfRQGEdnGKQJUfFWk7+RhaB33RPKkHwFyqEFtz6R7Y3cjhT0Z2EOY4Xu30NjME+JvD/4IRONdIzUpstOzbJ04CVlLsK5ih7xV1zA7iIDBPW+A0yyG2HM83bDeq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5YZNmIr; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5YZNmIr"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-42c08cbae4cso5768828fac.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777309902; x=1777914702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWxnwwnK1m7QIiM+kHUhFi9CGYBGNw3PT7/C0xFv7DM=;
        b=D5YZNmIrKfS7YPF7uuwMVfsyddBqyFQxRD2t45plJ+wUlCZRBK85Lj2uO7paDZs4NG
         6s1is37fihNgV47FMkUWGgKyGZpUHo2H8msrCwGlztHkaMkt93CKuHIX440FNwp7++li
         YF/5Dgl4hAgRVyNBJqv/75ous+XqjIkKEgjbI1AdF7W6qZcy2gT5wBiyDkGkaISbtdXn
         MJTLfzWipmcEG+QpvRG2RNBrFvSTYaRHC6liVv09JSKHQl8EBqAnORiwaYJR0GTjEpSN
         NqqxZzrNdMbxIxGYDQB0UBf5nxIGFOs5bPYI8cnyaWc3vxiEtNFcG5Ou0cws2WwJQfNE
         unsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309902; x=1777914702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWxnwwnK1m7QIiM+kHUhFi9CGYBGNw3PT7/C0xFv7DM=;
        b=dtd2M/wm9qY9HfTUP+qnNkJhCB7GyttGiINId3gMKHLjJBizwL8T3RKn0rpunfloIr
         kAf7+VkDL10Ab2+aRy/GWBZ/xD4ddQE8CY4MGPyPbqKQbZUjlnw5aTT1YXWUwggeQUee
         FAq5ns9fjjMFN+HRAj8QFJ0NE8EbYWeReGKvV54w1M9SENXogQacXsbpcJMhmkVwa0UE
         puynNjQO39nqHMFr1uDl1LGHNGxklNwKnabNf45RxhxhyHV2zXDQvdoszt+qKyIYz+iP
         hWQYh/GnJfWxzuYaLHj8YgSt6rdEfsn6HLmcW8H3E16D+SoCOogxeidSdPDxSLuNFGiU
         BpFw==
X-Forwarded-Encrypted: i=1; AFNElJ+0E0mGbLO0JY6qCSx7PNj+Eqz4vCkFORaA/AqmBouxI1R+bfBTX6lZUek86ALr8C9uQmMrMvxFhGsA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy81zzzdpM3JaStl5hTAihVDYTsg2Tk9/EXysz/Xzo5fhuV5oRA
	PVft7JU7LBr2O138m97tsscVi/9iqSBD0ZYEMORzSv2W+PVzFPVjGQdE
X-Gm-Gg: AeBDiev7AzmIhiVv4ZVGABAywiie0itwF0VJAUiyYK69xlIXYJJeUP3/MttwPJETLuk
	zkDQUtlAWakjiNCpprLDITcN2PoQFylg1fhXEaSsDj3NxjR3abGNGmihaAxnsluy2pJ9BV9wcCm
	4uOpFxbltyFp/u405kGsVS73uXYAqAFaGNPPy36zK36x7EOo/ae/1Z5nNG/ez7TRsK2TuQVTr7P
	EcXEIwVUBdmE5hx+vv6cAaaKdHycDwPyGaKgqCfmyLnMioHFvI9XxcFVsL/aK76YwCnF9M4flNA
	+U/y4q7Z73OlHmGkPovmBXcXgN3iXkwwUwfSiKKU74Bfq4BytxN49e8ylVOSTNLeomgwYDLNXQF
	NpbkhKhgpGsQRhiqQM/mHf9dL57DdE1TtRIW3jExukWV6FVcmbHqM+jCDhyevpIvzOp3nkUJ6CK
	svRT8jmxXkbNQKtqI+A8dzegUKYRgOp/U=
X-Received: by 2002:a05:6820:150b:b0:67e:160c:36c3 with SMTP id 006d021491bc7-69462ef3455mr23999976eaf.48.1777309902045;
        Mon, 27 Apr 2026 10:11:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6955036558esm10261236eaf.14.2026.04.27.10.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:11:41 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/6] Add Anbernic RG Vita-Pro
Date: Mon, 27 Apr 2026 12:09:08 -0500
Message-ID: <20260427170914.5062-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG Vita-Pro, based on the Rockchip RK3576 SoC.

Chris Morgan (6):
  dt-bindings: power: supply: sgm41542: document sgm41542
  power: supply: sgm41542: Add SG Micro sgm41542 charger
  dt-bindings: display: panel: document Anbernic TD4310 panel
  drm/panel: anbernic-td4310: Add RG Vita Pro panel
  dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
  arm64: dts: rockchip: Add Anbernic RG Vita-Pro

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +
 .../display/panel/anbernic,td4310.yaml        |   63 +
 .../supply/sgmicro,sgm41542-charger.yaml      |   99 ++
 arch/arm64/boot/dts/rockchip/Makefile         |    3 +
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 1317 +++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-anbernic-td4310.c |  291 ++++
 drivers/power/supply/Kconfig                  |    8 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/sgm41542_charger.c       | 1045 +++++++++++++
 11 files changed, 2844 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542-charger.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 drivers/gpu/drm/panel/panel-anbernic-td4310.c
 create mode 100644 drivers/power/supply/sgm41542_charger.c

-- 
2.43.0

