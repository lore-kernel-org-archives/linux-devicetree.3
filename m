Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58931DED5B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 19:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244696; cv=none; b=PpRL69V9VfkOTzAKYwdoygM9jrJbeAGBI1/Dqr/5wQWou0jPpd7jqH9ysVmvm1tYPA2opSJI1Ji9znTF9ooW9aTXfypJYARDfZwlkMBKypb+wmMfxtMGEz03b/Tmp6XRjZVHPCeu+i2Q/D/Qc5ux9NEs32/lwSaJwBiMyP4CiQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244696; c=relaxed/simple;
	bh=aDlwTIbmP0eq4yY/HUqq/7PBE58+pXXAamTk3uEsU+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d6WlP9q3+dsWczbc9zCSMO8DUqDpsweoTt0RrDp3Bmasy4Xfn/drgF29jxx+p6XkuF4D7Q3n4hfzu/O4sCDSGA8u4kiERL6rrung4fmqlwdJBerwv0FMH2iivo76PCHON9j1hS00kAdRY3mSt7wbOjiXN0ev0/Y6Qz9EmPwqNk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3xz+rVr; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3xz+rVr"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13981833e13so290251c88.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244693; x=1782849493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=APSMXL2QA/kOTC2fqsHTZZlYL8XNY6Eh93NOD7Wrt+4=;
        b=K3xz+rVrmkbsXRDXM+xKZjA4vJfnzoE6dQC5OzGK6psbaeMxMtyUsZHUK4PNtx85fT
         qV2RoEUzKknQxzUUctJylzfN0ZMqkZBLP+QtaH/PND2Gb4d/B3vQX3STQlWM7Jmnx1sn
         HcChmmtvCXQg5Kj2gWMjIZOnPT3qfA2hDJVW6z5gUNvBJwcnAKDS0v7tLpffC92PvD8z
         FSS1WjQDS6YTuMSj+uqYcibfQsMXF6hHj66mMCM8O180qtG83kmDbbj1ONqPKHae9mO6
         W2h8ANCZO49I4UQGun5hwJLN/acilSQVQm4XZYSvQPFopdWaUpuEui4XrUo0zEqFR8UG
         GUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244693; x=1782849493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APSMXL2QA/kOTC2fqsHTZZlYL8XNY6Eh93NOD7Wrt+4=;
        b=IJ7pN4ndy3AbqJvXzM8EljDhzg75+7kvQyjtyUycOibs9CM9mi6M8qcaqXCGRmLV6v
         HvSTdXIEktVl06BzoxeCMY42J2NeEjdEiEdTM3El2mw0iEtXtxM8tC4X9H+4NYFqF4US
         lCwoSySLqrwyz7EE6xEDJjOKBgewr8aHGwj8ltbDOHcOO765180gMquSQhoDK96LZjfM
         9E1ifa4FrKbnXmMw51F0MvVIU/ui7ZI8582SXpR07KBcVu4s0gePrdFwONAxo0MJIEee
         NX2jnBZCwDkrxWfpSTfYyMpc6Zaa8OJAWC68GOLZK8DzvK328cvMVvtDyfXpZsoa71LZ
         V0cg==
X-Forwarded-Encrypted: i=1; AFNElJ8MoLfawFg53lCeeXY4edqP1eiKKDB5vO8Wz7Xij2flOd/jI58f+AKvA7XIzMSOX6ttSAL5nJsBKFEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxnYMem0Na5QkDv3k7azmd5GsUmHfvSaLOS95TqHcKr91wzjBw+
	CEW2vkGJgzF/wHeD3XMpIGxLoRj8Dmbad2YjsahdIqJArnEfWgYN2QSe
X-Gm-Gg: AfdE7clr1ui8Wx/2ghqJ5o0V19PVedk2RuVlEOzUpicsHZscy2MAFQvpBv50XDpHS+Q
	81PipJkQENUnMGmkYhrATCnzAnlnUP+uWcO7VEiqQ4RQro4bBRPq0vHvagvF+Cr2Fvd2LZKywYj
	FA4b4jWNd8Pb+QP/jz58JEQmYGmZIBoadIvHHh7c3scJR2t0q1UBRvnY3L+u9yHgNm+Y2Voz2Rt
	qrhRcHb8VXN2K8vpK7bZrHMPvcOFzJSKWLr6551cbhHFFd6UirPm+rTMAiIhuzomKMGVUYJwANd
	Gr5ePZSlGmbKODyb5e4M3SNxZZLtzg7wwmHzRG+hIZ8MHDwD/S8gHIAuht2GSZ/hJ6Ex7EgH0fP
	rLfVOpf820/bvEuSauaeed5byOyqoTIhajK6CgCi8zRHr6GtPiGsj/lamUU9l9SaeF86nNKTgaH
	KlBUyWXLwd/bkAwN/uz19/MoAIEov8QK3cc326ItMcElIyJnzrBrVCOA3u+01nSTaEa4DpWSJFz
	gX9lCi9HBCbnNBngUe0eAwmYwRIwncurV4DbLuIDFo=
X-Received: by 2002:a05:7022:439d:b0:137:8db3:73a7 with SMTP id a92af1059eb24-139c5dfa968mr3114369c88.31.1782244692728;
        Tue, 23 Jun 2026 12:58:12 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:12 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: leonardo.costa@toradex.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Tue, 23 Jun 2026 16:57:36 -0300
Message-ID: <20260623195741.495734-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

This series adds device tree overlays for Toradex Capacitive 
Touch Display 10.1" LVDS V2 on Verdin AM62.

The display addition covers two interface types:

- Native OLDI (LVDS)
- DSI-to-LVDS adapter based on the SN65DSI84

The Opto Logic vendor prefix and panel binding for the SCX1001511GGC49 is
also added.

Leonardo Costa (5):
  dt-bindings: vendor-prefixes: Add Opto Logic
  dt-bindings: display: panel-lvds: Add compatible for Opto Logic
    SCX1001511GGC49
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    10.1" LVDS V2
  arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with
    the 10.1" V2 display
  arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display
    10.1" LVDS

 .../bindings/display/panel/panel-lvds.yaml    |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/ti/Makefile               |  15 ++
 ...zanine-panel-cap-touch-10inch-lvds-v2.dtso | 109 +++++++++++++
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 143 ++++++++++++++++++
 ...verdin-panel-cap-touch-10inch-lvds-v2.dtso | 129 ++++++++++++++++
 6 files changed, 400 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso

