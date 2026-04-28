Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FBD3815D3
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777389471; cv=none; b=N4XpjXGOzwolOBbxnvoJL/YaVhBLeVEAttOPlXcf4gid5qzQvuWWvQXNpbBxwd5XuGwsnGjXoSsxYZ83aGcPrGPSj8EY1uzlDiA2WssO+cXIXDwYTlHgySRSUUrsM4XX00gL7ZO5n5wif6szlea+bPuG38AUOH0HUtdjUlcTe+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777389471; c=relaxed/simple;
	bh=uSNuIW8V0hpSA/AMFdHGivxZvSGWV1GQMwe2XzwmbVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7UusEI7ReT/At9yY6NexImQCoXm6uYv60wvfaITgrGYQ5kIbu41SHSKKScjoYSrjcjaPWyPOPzSia6T5IgFiUNl8alIVwDfovGMszzncfx+eqI1xjo1geJpReVssduYenbjXDQB8p7fRNo/och7g61Xjs4vXkvlZVb9wxtX2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Kl3gtfvM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Kl3gtfvM"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba51e69988aso1574167066b.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777389466; x=1777994266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/8nD0wR4HMebuAgJ83wvxsntol+jKIWo4zghtxRUaQ=;
        b=Kl3gtfvMlmExd1Xsqght1hVl+Z76rAjMSqMjHr7rjAoiJ8sdZwViGAwbH19PycT71h
         /yVHWQ0uJ6P9Z3ifBLcpaClf3fJc45Pdx5WcHMyLb921AFaD6ShhaxNljxGOYbGNwMek
         1olcaCIrO+DiQHpJlBEojIn+cv/rpi5fbgj2O4gxDLhDVqWegmaQq013qS5V5fS4tABY
         N2VH9VIFQPK5Ao2QYrEDAebZm+/a6kJdJbeHCq97c75ChpCAB9Qjwv85MtFnkFGVzPsw
         L96CHN59BhFx1Q0Rv2NArXmmnTbasbwVhYZdwqMxxB7iVfvtzfSMWPeBO+HUAo0/WkqJ
         BuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777389466; x=1777994266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a/8nD0wR4HMebuAgJ83wvxsntol+jKIWo4zghtxRUaQ=;
        b=sOWvWYlgYW4TeUw0sivT88AQ2DH3L2qEA4LnTiX0QU2DdA2iNfvxa49ddqJr+50yMS
         IqGyn7P8oLf8Rw2UQPtyOefNWszU1yXtG8kS6d0LTb4LX6/cki1d/xqO/PGwLi1ywKew
         rT1itk6h6UQafy+Q5KU5teSgEe/RXq632Lbdgwn86E5hGrKBvpA9oXedd9j4CskfkOKl
         bavTtYB03xvgZniPrI7ekUZPLTyCkqUvj9LrUocQP19+czOABDtuC9k58nN216bbVb0O
         IR8kpzPJ9pnYFlOK9HpK7Bu4PeT+nbvZWkB/oNo3axv+3nw/Pji19iDxn8M0fhyQsOnZ
         Z9Rw==
X-Forwarded-Encrypted: i=1; AFNElJ8kO1nrcOl7ikYIAsHqNYVROm+tYHAqRnmD8sDHu276673/1JlbAnFdYtyWo+j6BDEWokofGa9gxa2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzVv3tXzEPdEjXso+uABrkPsbcCw8Lw0RPCq6ffk/9qqWZ2DBhU
	+i8I6pL1bXINyP/Qc+gbnbjrMyKGeHbkxBY6rCzdBRrYrLRCWMxldH/mvZEBYpiN2A8=
X-Gm-Gg: AeBDietVhKOMNHK0nzbgKIROwAFh19A2tMmBInhjaFGZTt/K+RCSO9pNZwRcMt9bp66
	QKDuLJescEHI8uIwzue4Kmnw1HRg1rE+QcdSwA931rfGlMaxvIcx1mqeu70HpXLyxzet+iWE5t6
	eIuHaUaXs05p4EKNjuig90q3empCr6rEd0jCHeVzZ2NN9/7nA9ktL6rnmfXH9F29NzIvtLnWs1+
	mdIO6vTLq+FoltQkYm5Ll0MzlATnBHHDutafg61L5q+qlpMsTZJ18Pq1Ofo74riJK1lhuIoWyN/
	VEbH/foP+CJWpjKo2s/iIe8b82wTfeQJ4r9j76L/dXBaLe7WNPRB2uSbL/7UsjUDdp4vCcfp23w
	yqK7Obj9psw15Uj7wa26/xo9pYS97oZv32y1Pa1Iw/DPw4rwWUod0y2vPY/659TUu+wuyWhNScJ
	HNv07EcL9BmocAgzQK4VxubFR70hiAeRU4Or3c57VMqzLUTMkS4TfBYcgYJ3jiPcEgmNThjScr/
	Gb4YlQyCcLqA/R8wPpgZ9UHeIQ+8w==
X-Received: by 2002:a17:907:7fa5:b0:ba6:689e:2f48 with SMTP id a640c23a62f3a-bb803f5924emr208958966b.25.1777389466250;
        Tue, 28 Apr 2026 08:17:46 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c0828d0sm115205366b.56.2026.04.28.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:17:45 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 28 Apr 2026 16:17:24 +0100
Subject: [PATCH v2 1/2] dt-bindings: panel-simple-dsi: Add Team Source
 Display TST070WSNE-196C
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-imdt-dsi-display-v2-1-cf7294b5d7d6@imd-tec.com>
References: <20260428-imdt-dsi-display-v2-0-cf7294b5d7d6@imd-tec.com>
In-Reply-To: <20260428-imdt-dsi-display-v2-0-cf7294b5d7d6@imd-tec.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Add device tree binding documentation for the Team Source Display
TST070WSBE-196C, a 7" 1024x600 MIPI-DSI TFT LCD panel
using an EK79007AD controller.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index cc8d795df732..6d4133b91e7c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -63,6 +63,8 @@ properties:
       - samsung,s6e3fa7-ams559nk06
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
       - tdo,tl070wsh30
+        # Team Source Display Technology 7" TST070WSBE-196C 1024x600 TFT LCD panel
+      - team-source-display,tst070wsbe-196c
 
   reg:
     maxItems: 1

-- 
2.43.0

