Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005AC400E10
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807225; cv=none; b=ik3MH+7kBptSsCwAU2df+xLecYIVWOXHPBxBi/qfTomNjBvdAuFy84pv/mRWmljq+rdlryhTbdQ+cPIXuEo6JrocQM7c7NDgOA7I3VE0lUmWkbfgggKwH3+7hc2s80aLC9nBK+yJJRG4WmNJABdh6ujmNsAXCeMFBtLUTZI8iEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807225; c=relaxed/simple;
	bh=Sqbs2OkiSdwuY7yyEzdomyWRGXYA8rO5hY6K9hT0/W4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NZmdTPgmPWc3is5a6d+3SmqfgUliXQBjUwDORTMFGRNZ/69zxv5cvs4EVl1rKUHP8swrOIx5Q4EUnviA12BUtCPw2OejGST6dd/NZ4zTU2QTNx9KCWfxoBFEyEZ3tzmMk4w9A2T2BKKVJ2zgglBunx7jGXbMcaHGid0B1Zol/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F5vVh/a/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5vVh/a/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so7674040f8f.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779807221; x=1780412021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW3FGEMYl3HtrO5py8lQ+JYd7M0lWOH5Fx7/bpcIlXg=;
        b=F5vVh/a/1e3jRJftQLFlxC3rNB5bS90muDoj+qFSQvlPVDasatTDMXKYzX0SLIvGND
         UFeCmVDXH0YJe1J+0pGUeCFagiZ3X7BMte1/eEnkquBGKCwfOIiW00rfryBLErtmGadW
         XY9HcUEXTe5fVucbf2NvtY1t/tVk0DQ8VZz9BWNgmqJn/GiHxAxzbCh6XmC9r8fW2vsp
         g/Sd9mMm2nOBZtmuLebxcB6U2LslOpL4F+v2qOzJyBbsMaX9pbJN1anzEopOoNT7NQsf
         VQ+igFaa2dMZ+U9R6aDj1Mlkz94MW8wMNGgup4OITut1Szr782SQrBrj0YCVZfkotiod
         Asow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807221; x=1780412021;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VW3FGEMYl3HtrO5py8lQ+JYd7M0lWOH5Fx7/bpcIlXg=;
        b=qLyJiNEfL7xGNwxSLKQV5G2q67J06238Znbgj44c9f2/oHE8RhGZWBPvuXf0qZlEa9
         bEQSHlyLpnvxMGfgdg26NQARcqkkKKT+8NAA5Wn/yd9YyDTREtDSBMKi4qcBFfKimmcz
         iYvScD6kesW7SPnHoPCHPm0VVxrgE1eyB+OBPWgMMu8SoUYxC4iZNeKJ+dMKeGd5u8NC
         BbkXfQas3j+63plhIe0r7+yRwYl+O2cJ0kwRQSbRQ3o84JRHy68s1/2tebGGVup7d1BY
         hUA64wkFsFPi4y7BAVGLI6llamUP3+LjIdrGlsxnmGXoD7J2WUbOad70sXUOMLNMtZ3N
         1/lA==
X-Forwarded-Encrypted: i=1; AFNElJ90WLg2OYLNcWiew15l/xAZPvF0jP+yCpJ555iooPH2RYphQBwcsYhH34c4nuMwkAImNKDua4gsZGK1@vger.kernel.org
X-Gm-Message-State: AOJu0YwJI8LwjHKr4nR2EqucSvYKmmKxMBfhzW0rOzs6siGNNeQbUVb4
	I2F43owAHP6OHPZ33f5/GI1obBXJzz8++7eNT3bpaUKXkUkMx6mvW4d3KistkJkvaJWL4znZ+1k
	R9UZ7WSc=
X-Gm-Gg: Acq92OEs6DyLCLAZVx2EVMALhSNAOImVHHjg8fF4UmCIbHXqIgaSzrCpMHOZeyE6QGu
	UyZsXC99wy8czBn17FMK7COp1CSiLawqWzzRmWS5dQQsrWTzdp4oYuVc7h0llWwvt5+s6k2JOGN
	1QU3Bmy7j9sS37xGTqX6VDiV/WMdUB2wYP8S9PDpRBwMDbU7GmS/1yYKRCeOQYPW6/DvopSnibb
	hE5wba2Y5QAID/5Xt/pcOSwMm2Slux2/afYzSB000Qur8Txei7vHHhOrGivDvGuCj8rQA1jyu5C
	B7fvmQnQ3cLGtFB9QYm4AcqwR+P11o5ba4vGYKfgmXOfKPzzK1DCDIypiw/F8kTc1FrcuG32zTf
	FxUBvFYbBNkN/QA7oaQze9ABa7xnVE1v6b4fQqqUAqYl+tFlTHbXcmA4M20+8LOBrtHflGrPI3q
	N6LbSHRtDBDz2iCPdBNQyuGmG0yfFmE6gCNECQn+xgUWea
X-Received: by 2002:a05:6000:258a:b0:45e:6a3e:1ddb with SMTP id ffacd0b85a97d-45ea3128db3mr35001389f8f.1.1779807220786;
        Tue, 26 May 2026 07:53:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d49132sm36278884f8f.24.2026.05.26.07.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:53:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Vitor Soares <ivitro@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
Subject: Re: (subset) [PATCH v3 00/11] arm64: dts: ti: k3-am62-verdin: Add
 display and peripheral overlays
Message-Id: <177980721984.3070642.16547338359984019493.b4-ty@b4>
Date: Tue, 26 May 2026 16:53:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Fri, 22 May 2026 17:11:04 +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays, expanding the hardware support for
> the Toradex Verdin AM62 SoM. The overlays target displays, cameras, audio,
> and peripherals available through Toradex carrier boards and the accessory
> ecosystem.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[04/11] dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and RVT101HVLNWC00
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3c3c5fb9b36836d279ebe370189d68a0a3387362

-- 
Neil

