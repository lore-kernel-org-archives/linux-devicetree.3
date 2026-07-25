Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A5F389106
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 03:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949593; cv=none; b=tM1U7xiZU0O8tDyytm/qaC+zsmba5X9Xj843yEGRN1CuiU+Q0Mp2ERQ6Xg9r72mljoY28EnuymoMDbwz0WB32nWnUduZkXksWWxAXHw/uDL16aMVdiDN7GKu15UwnUWd4ZGKJHrR4g1IJP+fdGO+l2W9FVLnJEJvlOeTpJ8olrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949593; c=relaxed/simple;
	bh=w6ttYgU0lJiv/SJUYAPaXSKPoe0j2NwHgYQpCKODV1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5BKyfLMySltwhtnuvSck3uKMjnjJir+xvnk6gz6pKLYi1/GyPLxowff6UMOW+g0F7yVuCDLUGyOBFUPmf5QY9vv7spPJk1PcVum9gP/r7qluvx6RCPUk6m+VAPWsZn9cBNuGul0JMVqsMXgPKgF6DxAo/r/khG3CViBc9UNn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Chjdcqve; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Chjdcqve"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c8c1ebd68a1so683540a12.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 20:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949584; x=1785554384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPm4vAPFuqHX+tZvYjtk0Fs8fzHRPkuRBc0bjXwe1GI=;
        b=ChjdcqveBv+j98UA3BUm5jM9h+n2ym4s/+4heEtse7qfCRM9EXeZyCjSCzq6VhF4cd
         R0HHyAv9WFequNhlMXsK04hdZtN98FtqvRGyTzNnlIcQUQvzHAw5nma0B2ErQdhduiOm
         3IF+5wD2UhZiBn7LdJSrOB5ThHzSBf/HrTJCU36qUQ7wjNGYpbvzWAklVdUBWWNgRbX4
         oZOjXHRkToS8V0l99osKBGa82rJPygoeF0EFsA/IBeomZvEW0Dfq01QtVXWg39JUInfF
         0ErbuGfTTxr872+vJFBnXYZJs4T0i9TwObRrsNuMJvS4jEk0tevA9wZ9KqdYCoPDQtgw
         kqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949584; x=1785554384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPm4vAPFuqHX+tZvYjtk0Fs8fzHRPkuRBc0bjXwe1GI=;
        b=ckZqGj5HP9evC0K8h9s3sCyD6DiRtZ9WIvDGN+Ar0+hxptiIyXk2A/J6NNlYoNcVDH
         oip8d4IjlwhdCXJauqvZJluvV/W9qxbUKUOBeLfpfQ7CxLdoHQVf2nYNcKUXaY+p38bm
         3bWDTQ6ZucvtKWBG7mpWDtbx8kvFkMOOl2Z8Ox+N8Oq4I6oqykF+Atr/XjmwdFGgnVfE
         U2W3kjqJe9j9Lal+R1dZz/4cUh/NsWC/oAOADsStBPEyjEaJPAjUJWQa54Yf21G36o2C
         4NcWoWVki8eim2fjyB7wPB3tSY1ehlGJofj4F1I7+fiOR1i+IwQkO66KiSGhn37fPmRE
         Yy9A==
X-Forwarded-Encrypted: i=1; AHgh+Rq2q27LH8yrKtNuxNqGGCnjZj6SSidJ8E21bnsqbhZtTFxxgTFJ1DFjCGheaDGkc+ZZaqPPHTO81a5U@vger.kernel.org
X-Gm-Message-State: AOJu0YyIGUPD8HOlciXp2nhRk4tJB00i32GuHxCiN0bUYYbfAzOPA9GW
	oWLUGySDTEvb5tfF6dt2vVmUNeHJwWsvfSq0+EzUJKzdIVH72uWRkUev
X-Gm-Gg: AR+sD12dLKibkLWkoe5Kn0/lgYmj/oB6UF76KpJwYZWmkz2E9QBPiRgdGxnOHSzReB9
	wSSMMGP7ZxH5hukY28yMdfkTzPnPrWo5ABED9bqzFKM+EcHhHufH2uacV7EDA0W2kQKoK1WELjq
	dKheT2g9SAWpwejBXlO4mYFsQu3qdzGuffsL0wK2o95E2uauGswUcBg61KNyzYYDJyxBgw4xUeO
	sk7LMycSaPc2XPcllIC5avNgLxrL/AMXB/FnhhCmVpe6ZnzDqtgy6OfeaJ/p3mJDhlBvS80e3kw
	Faf13uOVziYSzOuLewoGOVsgjczLjz2m5sfKayqWjCne5srJsstQu9cLkJRov9TjK7Npc5onozO
	SJVZIWWWrg9+Jv8eiKQK9dEvFz7IkKFczGyOmyDWJTusTNcbnZx2qWFA=
X-Received: by 2002:a05:6a00:4c11:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84e5942eaecmr647092b3a.13.1784949584567;
        Fri, 24 Jul 2026 20:19:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:43 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:49 -0400
Subject: [PATCH 17/17] riscv: defconfig: spacemit: k3: enable display
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-17-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Enable the Saturn DPU and the DP/eDP controller as modules, matching the
other DRM drivers in this defconfig; the DP PHY follows through the
controller's imply.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a4..c38853d69d55 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -191,6 +191,8 @@ CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_SPACEMIT=m
+CONFIG_SPACEMIT_INNO_DP=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y

-- 
2.43.0

