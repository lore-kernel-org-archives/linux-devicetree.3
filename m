Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C98B3BF680
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643582; cv=none; b=aK/fdcL2g8cWC6zyQCcANJPOF9/Gp5GDAHKrM5gawFACjJNa68jHQmxeZ79zYlVb+9lvbEud4MdoGuYgOV2UYVVdaaioQ5CK1tdbbtuEn+Q4BdzRxOB1I43cUCBI0RyceZ/YcLNxnzmAAG8WdQGUla64Gf69YVQ+ejX/FV8g5G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643582; c=relaxed/simple;
	bh=DjNX5gZc/D+U2BXi73d2NzYnyku+i1c2bZwR+jErVvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7yY9PdponxjWfeVAtz1dg3G+Tb/BZWhOu/qsuFZhI7EZNaXuPgfJxr16nbHq+NVWWnjLvHWhEg80d7t5paU9NgXrSN+4Cj8ZubTi8N4k2NwNMtWt2GsiJLieiIH3yhYJ6yvtFlWiFJ5L06wWzmH6vvsP4NKiIRKaMkoonxVxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=krgXH9pU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="krgXH9pU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso14705965e9.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777643577; x=1778248377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlBdgMSaBrvj4nn3fTIofsiAJVqHoduoWGd4wbf6uD4=;
        b=krgXH9pU8b8Ox4OfTuleyRt5XjJMOvbG/NfnAs9cRSJ6jyKFcBWjW49KzhdGWIVQKo
         zXrqWtqAE5c4pTw1w8fnguLGrRXrtIerLBYMGCUkZp99OrC+yZsH+a4sp1n+Se67HjGo
         W4C2DJLTPOdpvyHHKBxkB7FGGe8odzvgBlqzZMc7sVkAJOuE8nPG1cMhuzV72NgD+erd
         7H9mHtzOjEigh/XLVQMWzGYYO4+nFxuN8FiC7Q+TzoJVbvKnxHh77tNsbtNKEDL2QD+S
         8JcAUCcXv1JlabDPFgE3ZoUbzAWaipFpIYwdKMVYY9NVoDbSZzT2+v5DwyKftb+qLaT5
         8LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643577; x=1778248377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlBdgMSaBrvj4nn3fTIofsiAJVqHoduoWGd4wbf6uD4=;
        b=qKtyDXEYvNqftEJxdlwDGfbwbT1mha81XtFPBcTYDAavTQ/k+oGhU3BEm9AJP4Hyoy
         TKK7GnH0GaexaykA5gl5Wx6/EVwVQ/Hl4s1bDtJBCiLL3SexEhfedH/T7W7Oax7iCCib
         ys0z5KKHDsC/8dJs8w+9ws0OGJUHraWiWao3ZTxHYlwE7MbEVGKMDXGvbPCezdYpNws6
         y6e8UpjJCo6zO+CVzkWsOCwjKqTy2Zw6K+3wI1J+SGO3Tdmh3OW54NnzL400mIBEYDTo
         8WOJMoW1/174Uc/+WqtAO80gFuh3IU5xUZhSAgYDwHIhvvuyPWUwsDyXC/srIosGxFSi
         Urrg==
X-Forwarded-Encrypted: i=1; AFNElJ8h5y+C2OsxmeGurKPg8tUjNKTI3fNGI/cLcwS1cPEPKvlvbdP4eItD45gvjIVmRat2HfXMGZK6LaVY@vger.kernel.org
X-Gm-Message-State: AOJu0YznYNYOaPPPV1o53dnwn5/FFa3fX4SOo5b6S/wNF5zvxj1kVwpd
	mDlGIha34uYb64u1EDv254ViQ6oXlbHwm9JZhtJtmR1AOFhAu/QajxbNbBxJoro4vYs=
X-Gm-Gg: AeBDiesOQGjSLiGZijwzxHLcHHqwGUDt1erjBjU/jgZw9kIw7RDL6D+boY3rhGEX1Je
	UFIMxGSo4ZP3o3KvDtEUVH3sKdoX4PfiulQ4oWTk97QLAtbwZ5q783e06zOC5T3pW+ntF/blS/m
	HUyDedLSrj1GSHs3uG9bzc2TPL0By+s1PrSy/flNcRiWGmDlRv/1ml2RjsCg9UPNFPG8y8eg6et
	CzE3p7hEL1N2rQjw2WrYYBlS5dktz/heFjIm7oQfPrr0us1SJkBqZJK7/lcMavq9URRXsU3zun9
	w7N0GsXmx/0MVL4vrn0sgjQXS19GTT2xtxRgN56Ujf6eOmOEPMOmcopWAao2JgYhLJZaksRUQqm
	Vwj6iVeuvQWDJ2DM7j9ZFE2amqY2eYaF2Y/ZKBnkRWkRmHWsCrHVDIRtYEyEkjzm40rKepk/i7G
	+un8/XetkWdqbRRlJ8xrL0k8SICFYyDhLWvlZ9uoZ8AYf9p6l6v3KrCli3uXUE4036Hwhm+A0nR
	9Ur1ghGmhUt7PPsYM8=
X-Received: by 2002:a05:600c:a119:b0:48a:75b9:5e07 with SMTP id 5b1f17b1804b1-48a844f4de3mr89135795e9.11.1777643577053;
        Fri, 01 May 2026 06:52:57 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm143934275e9.7.2026.05.01.06.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:52:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 15:52:47 +0200
Subject: [PATCH 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-fp6-panel-v1-3-e09cb05651cc@fairphone.com>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
In-Reply-To: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777643570; l=724;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DjNX5gZc/D+U2BXi73d2NzYnyku+i1c2bZwR+jErVvg=;
 b=Y2pJ0AUuHyu+EETploINL6flChxL+nyB3pK50wKvLl3v72jYTSoxvGfIDclaN0/CdVAkrGmir
 NanfOodzP6WDAj8JVb7IBI6qsyJ9NM6FbF9JLWK4/bvdAzjAevbGEwQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..cbf62bf623ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1007,6 +1007,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.54.0

