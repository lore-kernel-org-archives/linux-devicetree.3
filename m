Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425828;
	b=M4In/YWtU/cVcAcbNs5ZJl0ngPRpMyay0wt7abpgYOAiAhq4YaKRsdh93NTpkzkg1d0Z
	 lFGpFEovBXSM7+eszDH4gHusGyiq1i7poJNg1YK79bFTDCmuAj+DOfCKq2G68IbHCb3G3
	 Uc48Xm8zT4kd7bD869VwZhLbsA2FzACJcSZ5s0dYq1Bz/dfQXhSKIctkZzvKRDLF6mHfc
	 Scz/S97SfsC/t/a8AparJNGY+ladBKUmNpwyNRWp0lIj6o5WId0pZUCjWQTCHVPkcdoJ2
	 BIdXWwp9GCH4GvPgupArmMfZOB/oVUG55aIQMXbgBWiDc7foFESGdrTIrJth+w5dBTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M4dNFuYhEPr52SA+ny5yZ0o4zoKtkWjJLEaqwoQdUao=;
	b=R/EoiqPeK6bgOR0AmgCDZ2B1rkkFxeOUwD1Av3X2ieiqHZoW/ZNzElV0HTO16z2nOnQZ
	 VG2iQo1p5ZusP3bWmtkTrcA/IEphy3a7/3RcGIUosuEzWZ3m9dLUZDPVSr9uXIRapggKU
	 uIaBOzBkkLgBZQ5FBnJuAOvNb3tO9m06sxKxG1Fl4R3LOWxeBtt8VyvYoxvst6d17IvQ9
	 2Xt6tQF4FwnfwEEs6Sp2FcmDD7tPUmJHGrxA9WAwla7y7SVLJOriBnIswgUq5dW54XW6Y
	 IJYJNFbjK6UqelXQyx6mCzP7kg3IQZvhHv8cM6KycGQbkdeQftfsFuq5Gu9MBFg1Jwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=saEingyx;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348A8606A33B
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348A8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=saEingyx
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so27537135e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425827; x=1796030627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4dNFuYhEPr52SA+ny5yZ0o4zoKtkWjJLEaqwoQdUao=;
        b=saEingyxlHsFZ5o44DoxnUMM9n6P8Z02JQKS571b/0hFjK0zfgAaZxz0zt463sWhEd
         1k3GDCQCgpe1MyGPSS5hPhmmTpNEr+C07yiVacKwjMkAx95qvhgooFUtp121l5Wffpnj
         JVcDFEkdVO/I5QbrNJylR2R8da4nP6OsvURGIp+bawQ9oad3rJzhSXkhDsHtAmFt3AOD
         24jp/Kizs7CthRW/DZYmt+1mXR7Fxg0Vf6R1vWv/YZwUF3ReuQqY4KeVAAvy4hdwZLPR
         CDHQpyioxY5juqypMwXNOHK7jG0iFvkktB+RE200QI7hqoZ+Ax030DjzgkzAqFedfDu0
         8m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425827; x=1796030627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4dNFuYhEPr52SA+ny5yZ0o4zoKtkWjJLEaqwoQdUao=;
        b=IpElf0BYcVTgK8A0dMsjdTLHOcv4GvIjFAH8Q1W0J7OaQ6WxLWpUr+j0JmLrWKzLgi
         r9yIjTiMaR3eicKu7rzK/pFtjbmP6PwyMmX3YYGLW3SklMCwOwB2qAbLUcunVhI+h9wc
         t0XFlFoX78D5Ry+pOSo9hcOiAqe2DQ+0PBEbqo6yoNFNTKVRTR8232W1jcTyDKS+9F5s
         ZQIuEv703yjoPkRLYkBYcRH2lytDCZkjYq/FUfbv9afH76bYkATx1Z3Vswzii2xpyKIk
         ghpHQE1fgWzr9G0xGI88ewrKXps/u2T7XybqAO7Bx+SF+sBbcdQsG/aFBo0ioB69GDw5
         0B2g==
X-Forwarded-Encrypted: i=1; AL+hErFOnEHcSGdgrY1vDqomxPwhctX9q8KRTzdLpHvrsu3X5cPp/DQ01QkCaZew1CtwTfHmwNUq0je4hW84@vger.kernel.org
X-Gm-Message-State: APuU4Z9hIwRynRVo7iCOX6VVLbG/xXucRgscECqVK5r7CYkujNnQO7J2
	oTfhTvCoocbN6m4cN+IbwQvWTW3ldmd8UX0ANRZ9LJTV6VnnBOMlCsX+
X-Gm-Gg: AZFdTZcApkoz+jbk4WB8H1EpTOK4S/uRRoU7OfmVPBvzBiI4l/efvLFTtga6Kv6tMYl
	5GP63eBVWi2omSI6EwPQ8rHL+oCUYMBHrQKefwX1anfOQbJ3x+2uqaq278ZEfWEuIuh0Lq/4dyG
	Sz9SQsXnls1WUaHDwOZf8o6JE6qIv1qEljP9k7xR0E+onLxp8erQlUH9k2tGcRZ2PnMhZ2aJ4lV
	DCjklXd4/LN5zM6eR734ZZ2qjTEQb8MJuEbk9m6cjO2xT2Jtl2vfXxCtnM7i59vTa2D5jj5Tb4w
	YjAUMaewokwhkN9ifIo3xDhtLGThbdxiHPbm8huv1gzQDFo81K032fNmsDL/TUTe9BDCU7Qg6hz
	G/29cLI8rPpFAHnjVQ5jtu/hmrjminmbcxSDX0pmNmXsBXuAfVP44Z+1lCFGanEnaA5bqtZVBrg
	0Ww9+QaDz6f6/DORJieiX4QgEYVOYvr8sPIYiKHoQNojDmjTT1wOAp9LQrRVSnyxSrfEEWTngGy
	w/spASETQZ1znJj3TKxr3Rt91olSBiazIDhyqQA7OgrwojVIEb894ZXr6udxf1DxzMyXylmMz8Q
	3f+r5Y8DD/+Y5ix48e+Hv1e5H2Lc0OAOFi+issIOiUgrrzz5na7cEdqzzXezrkYOMIcRFwNC0Ak
	qmroPI9pXQa3WvXqBAFMA5Oc0JxexGnaB+w==
X-Received: by 2002:a05:600c:b85:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb8892ca5amr224121685e9.24.1795425826605;
        Mon, 23 Nov 2026 01:23:46 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:46 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
Date: Mon, 23 Nov 2026 10:22:38 +0100
Message-ID: <20261123092244.1792040-2-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

Document Exynos7885 compatible.
Exynos7885 USB PHY has two clocks (ref and phy) like Exynos850, which
are already described in bindings.

Signed-off-by: David Virag <virag.david003@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
 - Add Reviewed-by: tag

 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index a1b3d9e6a094..f644a4aa1e95 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
+      - samsung,exynos7885-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
       - samsung,exynosautov920-usb31drd-combo-ssphy
@@ -234,6 +235,7 @@ allOf:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
+              - samsung,exynos7885-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
               - samsung,exynosautov920-usb31drd-combo-ssphy
-- 
2.56.1

