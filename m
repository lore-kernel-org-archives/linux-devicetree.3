Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240433;
	b=VXTSEi2/UTbRw/1cLGsBHaztsTP+y/h5iad1sUOJPW2wqw9GZm0nQ5amYkVL6PhSAZMf
	 k8CkZc7cywP+UuQzozFMZ/PqR0f7T3pCfLLBrvlApqkNtOOuzmZ+qmsDaGyjaOsn6XIkC
	 Qik0giaU4exTE9kEI/OzXs4KoLkqLnbugjVBICu2YkEwYZx84NuamIdnLwnrij4NentBm
	 2ADRjzkme6qRywhSTkvCEmqrpdBZFNKyDJM1uhyztREYAazwvegV9w2fK2Pvo7yxrXFdx
	 lJxC0KGU52a5grCGLOFzyj7QFU0NVJSAz/isA41e50W3D7J4or31PL3EEmPx5yb1Tng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YeXOVU3Dlu3RGzoo7GptmhPvzHeqqfiDgx6SA9rp6Cg=;
	b=HglWoQhui1bKxTR6CbBib0pTOlnSgzwOj6vjBOZc8IgYTnABXWYzpxpuazeBr6AlaSvc
	 yubUpX0DuajgrUHQ2JafnGw7bxu3bLGRAP1SANlXtwHkML3icIF9w9RDABnaSs0hMRbqu
	 BKW3FLt6B1HiUmV6rWolK/Ph6tnVjcKrLirBuHPjwsLD5WwUH0pAzZW8x/cTsmzvfHBA1
	 z2hcjBSF4McTPIqnZS3NuGEznHjZpmDULatl07l/AP84vGqDLiLcnb5dTBkSeC31/fil6
	 sTymxJ/AmfZfsHZczV5rTl//i5e4dfy0QBY95dBRRoXHdboIQEEpV/cV/RWmp86q86Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uU1oOHlD;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132AB606A33E
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 132AB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uU1oOHlD
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so9566745e9.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240431; x=1794845231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeXOVU3Dlu3RGzoo7GptmhPvzHeqqfiDgx6SA9rp6Cg=;
        b=uU1oOHlDsF8Y5LSlHRRXu8+SaFMiIGnbX1Q/agAJo6293qZ6ILwjIdvFJjvAxtQt33
         L4BjvoNufBXRQyWBmgBOI9lRiIl8wPyi9wo9vmnGXR3mNcOYeE6/UXPpE+lynYVvrZAk
         FbrKH+/cTSnMvlG75HxKlvZx8IwBjFTmxa787PEXCD/g9Jlucm+ZzIx1yfI+A0RWu1qp
         s8JomLL+w9ItdOUpR5GgPjoDyXeVLsEbqhHROy9T2GgIKbiizSeYgtjk8f3hzTNVxN6l
         lQ/S9HlIrI9QCxv6yq0Ww7CDEg9joGNsh648mOQCaQ+c/1F210GxzqkGsplUT93mWLAV
         iOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240431; x=1794845231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YeXOVU3Dlu3RGzoo7GptmhPvzHeqqfiDgx6SA9rp6Cg=;
        b=PfZMLjYBoiUauASVwzBTseG9ork34vzpbHbNvkcjKaN//1hv9zWFpI+iuaCkkojRCl
         vMgK0gjtEacKdkg4N3ImbVEgGh8FawnyVO7RE3Xtb4X3l86ZgXDQC00gBFI1Sk6V8+bt
         xzyiEZZyC7vK5xpyv18IErvF1Zp4i0x1iMlqebzr3pbZVwS2BuscrSy3aqyUWlRlReFi
         yzVEnho8mu3iUeH0BS5K1Dsraj2ziS8rBWq6HXY8MIh1ZoNuo8E8zuDCDJhp2e8Wsu4j
         ZaWNzS9Ns90k39+USIbPVvUjFx+ai5DUvym4zceMJk7IW1f9wms69pLY+PvzlI3ZeajT
         UmLA==
X-Forwarded-Encrypted: i=1; AL+hErEOxz3IWYBKXOvkNzIdsa4Ov35aubpfsULc2WyJKfC1gTunFlyZccVAnohn/jaMNbSV+H6HZqSRqr8V@vger.kernel.org
X-Gm-Message-State: APuU4Z+bRDxYbZVIak4HeCwuPN5a/F31dTGAJrtU5YJTFtDb6NpJdcOF
	03Ist8IwKPcF07YkkTUM178USDSNTpS28jp20EjDRPLdgHD6qEsPo17B
X-Gm-Gg: AYBFou3szL4dRscYqppRsruYP57vQcDhwAgY4OcQcKp47wCde5SE/6v11lK/GA4Jq2X
	gVOtfoQ2ND2SOf1zEYUwqNcYrcEhQmrH4p+uTLsEIihIMPIkTwF7zjhktWha7BkBQX0Bp4Mpekd
	TEALxy6iST2NXXiSmFvvMGqPefYwZwsx3il7avHZJN2OeaN0GpNLTXV+iqy3JQuBEPmGJGvOcWm
	ueBf10h9WCwFjy6F9kLUexqos77hzwD7xNcQ+j2Melb85xMGvZxRhC0nk81nqf+fA6Ke/IuwceA
	jhHizOd6C0D6xvw97LCCp6l/T0ZbesbVtrAap0wvUvwxCi4PbTRMTsNVfo655c1eYi6yEEu54lx
	WGJ/E+PxgelLLYKKfNIxCWnueTwi8uaJJyziTS7suFx5LufQnkm6W3VfjpcSyKd4FXGUWEqQbfN
	bDOo0QCVnSb60QtPUXnooDp/oX0yKC3g1Kt7wd+Gk2WD+utag0XIze8rPK4w1lFLOqxdsKY1c1J
	e8KpDwDFofm7F9dMWM7U9wcG3qNfHuxFnkKNtumTMHiNpHYx1xyIvL74itcHmMcYJHXkdqC5ZqK
	B7kueeby6YYQVnyzG6PCW8wvYnxXaWEMIoUOswCoowmzrsrW3koudIx4NdUOow4auWZ+p5Ss736
	1dVrker5kB3dEbGhRMVBljQIGnH2Z1HKfIT5Apvr9boRswc44lN3CBiwVlxaJEuo=
X-Received: by 2002:a05:600c:34cc:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4b960da49admr82912395e9.6.1794240430762;
        Mon, 09 Nov 2026 08:07:10 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:10 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 1/3] dt-bindings: display: panel: ilitek,ili9488: make the port optional
Date: Mon,  9 Nov 2026 17:07:04 +0100
Message-ID: <20261109160706.2272332-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109160706.2272332-1-romain.tisserand@gmail.com>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
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

The panel is a MIPI-DSI peripheral, a child node of its DSI host, and the
driver does not use a graph port. A port is only needed when the host
links its panel through the graph; other DSI hosts, such as the Allwinner
sun6i-a31-mipi-dsi one, link the child node and have no output port to
point at. The PinePhone panel is described that way on the same host,
without a port.

Keep the port allowed (panel-common) but no longer required, as for other
DSI panels such as ilitek,ili9881c.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index ea7449273022..016a573893b7 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -32,7 +32,6 @@ required:
   - iovcc-supply
   - reset-gpios
   - backlight
-  - port
 
 unevaluatedProperties: false
 
-- 
2.43.0

