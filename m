Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7D028466F
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375673; cv=none; b=df8PYaqksjZEc6ob/DbmhDwZu4CT+SAsthGcOu1btWdVJf3fQoObA6vHjuZGAyZhwq6lqA8gKmiwT0yHH0KPR3DROFDui+wadHqoO0EnVV+Yah1s8UWP22fM1cY7pVwsYHGMO2gw+YVlhRFkhnLwttydRz1bSrhTqVJXSKXqrnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375673; c=relaxed/simple;
	bh=ZFl2ULHiVLTSuCGh0QihbUUuMuRf8/lPPNNp0+994S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7LBmBoiiIDiGZ4ypH2Gn19SDzzqVa7yqSaERngH+DI09n3lz4QeTseMGqBOA7G1/tyaXZKZjSx7Ygx7odETnyK4BLkfMhEuI6BrQQWXvGYZKH3i2aRLhxbzzRIpT0omBeASszRdn8wfT7GtzboMA50RwhzGuvL2jdDYUo2HPN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwUjXODH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwUjXODH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso65467115e9.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375670; x=1779980470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsZ8aDIVQOhkLMcIt92qlAZ0ISFPwApT1fZqqK+Da84=;
        b=IwUjXODH/HXEVJgjPfjlOQ6/t2eQ7isasZSFAyRhMVLY2H6CbCBxd43qWpBjpD5yIs
         YMSAcSpcyZ77fF94qsxQOjurpITDX54rY8FHM/uwAvyAmR1P1u7qX6KlTnBx9XhZHQkB
         ijDaBw+5mlJigZdHtDlUCscT6zQOX1saJL7Ky3KAaGnA60hu8yxxCz7l340sWsz4eygT
         yCkAjdAM2oNo/cKY2UkDmWAWbOelrVk9OSKOu4n1fwHfYDTipIzQnatqaHQqNjmDdIOy
         ST4uCMzTQ5S1aCWLBZcNaemcGrT/MXvwrbGi0hllEZxGC3JKSkJrP9KrThOlmx4MWJf0
         PQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375670; x=1779980470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gsZ8aDIVQOhkLMcIt92qlAZ0ISFPwApT1fZqqK+Da84=;
        b=fkbOK+7L143CLfS7zpBm/VuQe/d0LLouiiHV8G1IHgyvrgxlqp9TYhuMvky2CUxDpP
         Yl8F5pkNu14EMHP4ifD9KcylMr6YwGOlnX+BrDkfsTPRWEqIaNW+3rtmBG/tzxeS/1wd
         8KJ6TFaQKBg6mEmXpjupVvgAyfCe1kzGmTy6rlKoZsj+ZAXiZQrXvlCuDhyfyBjYY/U8
         6jkn2nA/HKEKMWMdiFmX1rJ3wBo88aXLAEL4fhTD4lupebEQbIq8Vuze+o/BtqpeLEG6
         CWs30rztQrWF9UG2ZOozEhPoZYLPBvEwvJaPNo5TzN0xdBdeMsloQ5Gn5YJGpGQ4+VBZ
         9LYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QP9UNUUvkXCnV7NxH5gqHi0EvIYPDxpAvwaJcXvKQy9sHZtabyHSofgrxjF8QU5remsbrEeumKZeQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzAD2JVb5XWAA++KOrHCMlteh/z0kuzxcdrZK73GpJFKxh1NQoq
	1n6AXHtUqkOKBoqfVjTtoeR8F7t7SVzyNdDv4OrkQ6/Z6IgOLhVBeujb
X-Gm-Gg: Acq92OEt8ikMSNuQVgMZhRiPu38b5E800fAOBEAuxhKleUcQKBZSeA6kjoa6MA+orzQ
	fC9EHChvVgAmzzOwqx4D5q/DmW2lBSOZIed2PWUVd0LkFgQuaSJIcO0NE2jm4yBS4SWNTqk1rWU
	LvmC/42YWP5r2aBF/lUN0HCAEw6TiaBXyKFLcMyYZnwmUrP4feVszOKj6HWChdzebVcdTB9j4kp
	ZQbpU8UaB03bkH7OBD+kSr9yPtB7/bJru0FuHHk5QMs0HJXP/2TCXMjXMLQoddV8V4wYMuJJ2WT
	ieqbAJS8PjE0Th/Gfl2yMVKUrSMPOk7bzWiCOY4gnCcidh+juI+zCygCYpLYvS20+legTWKA5A/
	Nj1UPIvrZWxQMQv4W1+QPjc5hYXzQ6KkqBRzqjqIV+FPuLryOveG3rgpYk6u5H5xG992QgW4fqU
	8/uWnaoIw0bUL1pc/aC6IlAyrjYZEGgA2l5niqDwLg/oR5ax1lZpHl
X-Received: by 2002:a05:600c:8b34:b0:490:3d27:94f4 with SMTP id 5b1f17b1804b1-4903d2797c3mr26603645e9.7.1779375669985;
        Thu, 21 May 2026 08:01:09 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:09 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 05/15] dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and RVT101HVLNWC00
Date: Thu, 21 May 2026 16:00:41 +0100
Message-ID: <20260521150038.103538-22-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

The Riverdi RVT70HSLNWCA0 is a 7.0" WSVGA (1024x600) IPS TFT LCD LVDS
panel used in the Riverdi RVT70HSDNWCA0 display module.

The Riverdi RVT101HVLNWC00 is a 10.1" WXGA (1280x800) IPS TFT LCD LVDS
panel used in the Riverdi RVT101HVDNWC00 display module.

Link: https://download.riverdi.com/RVT70HSLNWCA0/DS_RVT70HSLNWCA0_Rev.1.4.pdf
Link: https://download.riverdi.com/RVT101HVLNWC00/DS_RVT101HVLNWC00_Rev.1.4.pdf
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../devicetree/bindings/display/panel/panel-lvds.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 9db96dd724b2..7ed0c486870b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -60,6 +60,10 @@ properties:
           - jenson,bl-jt60050-01a
           # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
           - logictechno,lt170410-2whc
+          # Riverdi RVT101HVLNWC00 10.1" WXGA (1280x800) TFT LCD LVDS panel
+          - riverdi,rvt101hvlnwc00
+          # Riverdi RVT70HSLNWCA0 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - riverdi,rvt70hslnwca0
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
           # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
-- 
2.54.0

