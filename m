Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241E17A30A
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 20:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775333091; cv=none; b=mfLqTCymdDW3RLNJKmWAo0SFppmxKVxuJw3R1FGFQmGuUZB/YPwlgD9LaoLbHnlfLbrIC7V0wwtjBiosr9z0UwVZYi1PeGBQZkh+tyjxtDMiRLdLi9vzYLaekCukwTwYE9gVSG6Yt1Qqd1D0/UlucY1ZblgImU1+La60ECOxj70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775333091; c=relaxed/simple;
	bh=SzIa5UNDdhVfkuxaLthNbbsPFK1RlUJZXOwkzCq1A8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ibNThGwuh0J1IP2kpPXls8xNDFKZIubFSArvVUog/54TKSmDnYnLCsuAG9MaKJNTYEwpU/A+3ye7TT2lfy5eSH4fy4/46Zs726UNYV7T8H3yCyU5iwqmpkpv4dohDV+MzHnMEwz9nYE80s3zGfD8H+wC4NPlonpPkXcDfQfRC2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2GYl9qU; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2GYl9qU"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6055de93fa8so917210137.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 13:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775333089; x=1775937889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1MQ6/dIVlDkLkhz7sEG8ZPD2tsrLrbIS99Jl3sqf2Sw=;
        b=E2GYl9qUz8J6jo8OAZwkkOtoxxwPfXtRCarERCeZoEGiF4grUmbKL9Pb9h/nZrgQDs
         wxM+9jF5vEXYIV4+mPEG91+g8avh6uRwmBR7KhWf7s/LpAh7UNe/LgqJkCv6Ym0jDdt+
         s0r7gPiaFHA8JoRjGVXRtlGhJxKdsAnf7pdrxvzoLUnkiFVYHVPlaowgP1EMipjFPmkB
         EWF0soS53HQpY0SOP4qqtAPRLXL4ocNnIAdMxpHI9sYjpXcilsfuiA/3qssZxoPF0xPw
         2BND17B5VHCfDScmLc1BFUUKjSUbF3NUz5aeIegb1WatPIZLoNzirT3AaIVZm0z7+csE
         3k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775333089; x=1775937889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MQ6/dIVlDkLkhz7sEG8ZPD2tsrLrbIS99Jl3sqf2Sw=;
        b=M2Je/7Cgu1EGbzomwT1vMSXH8HUha4UIktQzjIleSMwm0MRNFRsY4Giegpjf1M2asO
         G57pSeZaGXqdAH5eAKLlCUNrVL9PXxC5pDdvtPKcJEOR+zAdYrrkRH60TiTceXmkKBHa
         jWwrLUlTZvDkUiUZuz1hsDXox6WdbpjoQP4un1H2nS6EYsHhCdCqEGBoLmFo7nlMAJut
         eJE6l/puzMTZIhNhkH39RLPV4C06vaw+wXhM9v3xHFxWAND90nI/w0jzUzrqi+800xe7
         wlHPJs3IXy8wr8NzpVUkE/BLwqPRNLxVmFxE8od02se+GCa7gh/IPLY6WqaaJBr16kgf
         v8GA==
X-Forwarded-Encrypted: i=1; AJvYcCXMHOCe5yPo6OF3FZ8l11uYYKRy3zpOTOXSBn7mLhCVZzqQCzbTEXIgwmtvGNUXglHhglb7T+X9jFBA@vger.kernel.org
X-Gm-Message-State: AOJu0YxmXoCfAHibsC9Y5xeV1Nhz2qCKECg6jqUQaMTeLaJzTTRU4ZMv
	464GTdcSkrht5f+KiaUOxJc6t+x9aAT56MpKZ6oyz9D43nSCFZo0e39G
X-Gm-Gg: AeBDieu4yUzp3XE4Qv98wQa1mllnPO6CYdn601u1IBq4pIesGXmRXxvB/pV/wu6YqMi
	aJ/HBBY5fchd9NTnIxM76e/lkj+2/Ufv95C/FZUTVH9HDd7pF18GlKdoHP/g3diWMr6edV96puA
	Jt/wfh9q/vkQQxxWwpAI7CewiQipVsXrpnyl7BckiYziz+gxwZH2fuTYBdALn+nIHPGNGhPUKH/
	uedjjDggsFbSDKtIfKQCjaJXktlwqk3rz++CJ94WIsl33ECfO0KykvKYIDPl3fcAf+e7yqSrZLX
	w6Wt4cYA5C3zGZ7wgKhZCXRJcnECoQdsVt3F2Hx3VML37QPJsH5CW4SLaLpAgas9ySdswW7H8N9
	DKYtbozdeKv6/FOUW83DPW2v4yo4kjpa7ATJ50KXvvt7670NdPfnSLdrq3y0CzNslXH9k01hhQ5
	c5ZX3pOk4Mfq2NUQE3L33o0LFeHlJYjK435xjA/FYSHmEEJARWdm5xJVNI24IriG26A2RdTQ==
X-Received: by 2002:a05:6102:605b:b0:5db:fe0d:7fd5 with SMTP id ada2fe7eead31-605a4d76e3dmr2210872137.10.1775333089480;
        Sat, 04 Apr 2026 13:04:49 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:fafb:5a7b:510a:6309:f015])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605b214b45fsm5120113137.5.2026.04.04.13.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 13:04:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: display: rockchip: dw-hdmi: Allow resets for Rockchip HDMI
Date: Sat,  4 Apr 2026 17:04:34 -0300
Message-ID: <20260404200434.1954651-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rockchip DW HDMI binding sets unevaluatedProperties: false while
also inheriting from synopsys,dw-hdmi.yaml via allOf.

The Synopsys binding defines the optional properties resets and
reset-names, but due to dt-schema rules these are not considered
allowed once unevaluatedProperties: false is set in the Rockchip
schema unless they are re-declared locally.

This went unnoticed because most Rockchip SoCs do not wire a reset line
to the HDMI controller in their DTS. The rk3228, however, does use a
reset, which causes dtbs_check to emit:

Unevaluated properties are not allowed ('resets', 'reset-names')

Re-declare these properties in the Rockchip schema so they are accepted
when present, matching the capabilities of the underlying Synopsys IP
and fixing the dtbs_check warning for rk3228.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../bindings/display/rockchip/rockchip,dw-hdmi.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index 29716764413a..59fb084bb4fb 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -113,6 +113,12 @@ properties:
       - port@0
       - port@1
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: hdmi
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.43.0

