Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501805;
	b=Q/jZe4r39FS8XmWshH76FAgGO8LZiFpIBRn2JgyE6XjbbffBggRZStRvm5Jj/cZpDo8t
	 Njx1hkC2txeY7q2jxEnP5S/hzMP7zyP+0hQacpbok1nH57aaaUQLx3gwENg7e/P2FHrzi
	 iuoOOT+uUSuWD4tUyeb+ooU9J8vFFtfl+OWz6H0GlBaNysfBUJ57WBEp7sEl74waNAQe2
	 zypLRUpttWEz2iiYgs8drbex1WoVoCVikpAnNL7DIxWaNqgYE1pmYQ7WP9B/+O+s6ImMZ
	 CwpOng/jWKTYxQfEBLoccJjw/kJ++2fIN0JwOB1TcU3vKqWGG/FC+inX5Y1hqUNcFNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rli4VgxJjcOffz1T4VqacG0mFNteJvCejK8yAgJ1Be4=;
	b=VCKYxizq8IlqNcO+KmxsvaD2F0BbbD2CGno1KkH5aS1q0M7oNZanIw5fWoAPmPPr4glb
	 ukOp5UD2kh2To/hxq72a19zd8dhpkN2RyO2yNchgrDnTYOnYpq9H75UnrghNpvjVz+owO
	 yWCarHkXDILvr+Kj5TFYho7HNCDSnn/G1vD57Qi6V7YLrxek9Tbb0IPsSdAIJ31OCqE7B
	 mncVett568qpm86cU2uaV4vaJ4lnLOoxlCfZXGZ+Tbb02kckyYIBgT6EcPH6DXKwg3kzh
	 mfnPj7o3VkohN81q53wXeh0VQrP9DhptRUPl4NOo7QgxrPpZ9f+Rd/9rh3ZgBcANYlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sqNz7Zsr;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A38606A322
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A38606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sqNz7Zsr
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3a476ee8669so900167a91.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501805; x=1793106605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rli4VgxJjcOffz1T4VqacG0mFNteJvCejK8yAgJ1Be4=;
        b=sqNz7Zsrxd55uG/B6us92Pw/TLQNulXvvIfer/shQmXOMbcyz36wr0dN0EplY99W0q
         ZBmeLwHr3bInkhrOVWq1KxTwQ/srXxN59IZu9Gwpnl6kHqEmZl1m6/MgNeCJXEvj4DGS
         6pcJlbNfVlahs0Lq0369ogt+7Enxqbf372/QJxzPc+S3lly+6yZT8/XbjlTA1i2IigQC
         YF7XJPpMjF9JCBvom98uE2OP7xuvkVb8M0e94VAb8lbZlscxZybA63sP0fUHCniNPw/I
         CMcCuE9GlrEyxE6iZnQe4BQHeYaDbMtwm09zayCj9o5/3vZvtsNfaK59P4/mZxGDtGhc
         9HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501805; x=1793106605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rli4VgxJjcOffz1T4VqacG0mFNteJvCejK8yAgJ1Be4=;
        b=Kr/nbBCXQM2hTq1MEnlWAOI08gkvjZuXvV/pPA+UtG3A2U3a8C7bvCxnCxKwGNlqrD
         rEZXK3CwDqdkq5i38t3GXbYo5qa5L3AcRWCMHabs8jsYnlSfeIFdlIxm0tqt7m5ktsZn
         HaSVNigC3zHVhFZ2ojkntIL83gJY/7l7h20XhIrhSA3/+WjjPLJqTJzDZRHijJ67Lqa2
         EZS0Eaw+YHGIZn1lOT2XBK6MpEZtRrGsp3wG8PObt5KuGcRkIDO0UJGXZ/pDhxrEBGiQ
         YpeZU4/x2rahoy8Qf0fMM9gRbrE0qLtDunasXbV8FNsJf6qF6BVIhBPr1Z1Injioh9e6
         9YVg==
X-Forwarded-Encrypted: i=1; AKwUvByFT1ZWyG7Kbb/mzrg4u1WWqUPeUPPzkrg2L4ai/Mc1jdqspjeRsPSFemmR9pkHq7jUBP77MyoE/eda@vger.kernel.org
X-Gm-Message-State: AFq9FYKtWneD64goRLbO7Ve3McrFz/CMNxncD30AksT6OooJMIgxjru/
	oBaoJh1MKK5fxI1g2qiWFnTkaxxeTgMKjPZx+cfH4eZVXCU6IPGEz2jSai/Tdtaj7tI=
X-Gm-Gg: AYBFou0XLnImPytA6SzS/lrALIaDFJVvcyD7ftD4j+Li+2hTb+HuKIu878gH3xdu6e+
	Migya6tgf7RDQ5zINH5hI5svZt5otGSv8QAbPCdEGMlZPn51uCZLuup4uA0Mf2UL9aQ/injjVc4
	e4mF/OVG4CJX1Wv/ZiKJdjIXTllSY/3CKWkRpHMqeJ5w0uqUQtg+StccNB7nbOli0bHZsrJGe30
	l5w41TTpnWhdjyGzsF15eaMkYg/Ke2q0GIB3mXCxFVzFQXVtHOd/fIyHyElzmMBr4oKuof5XFwb
	bDeJ0se+5DTvJ9t1jCsE+5dPDlI23XzlxhMeMUWqrHoy8e2Tfy75Egme7Paeau4vrh+fgOinDJv
	7UdC97fWtgucUv0XdsgTfFUpxy78vMSFZ5AjzGAVWq9aObj1IJB8YPqSmTxAYsz8Y5OeWrWU9Xc
	hu5W11HpWAMjRw0xFZQqjwT5fQZKT5R+iXBps5HpT+Z55sOS7Wqnq/QX8=
X-Received: by 2002:a17:90a:d010:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3acef134b64mr9027170a91.20.1792501804482;
        Tue, 20 Oct 2026 06:10:04 -0700 (PDT)
Received: from Linux-PC ([2a09:bac1:1980:20::1d3:a8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm10131496a91.4.2026.10.20.06.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:10:03 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH v3 0/3] drm/panel: Add Smartisan TD4362 panel support
Date: Tue, 20 Oct 2026 21:09:31 +0800
Message-ID: <20261020130934.2289011-1-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017083531.766557-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
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

From: Lu Chen <tianshi12127@gmail.com>

This series adds support for the Smartisan TD4362, a 1080x2242
command mode DSI panel found in the Smartisan R1 (trident)
smartphone.

The initialization and power sequences were converted from the
downstream device tree with linux-mdss-dsi-panel-driver-generator,
and the driver was tested on a Smartisan R1 (trident).

Patch 1 adds the "smartisan" vendor prefix, patch 2 documents the
panel binding, and patch 3 adds the DRM panel driver itself.

Changes in v2:
- rename lab-supply/ibb-supply to vsp-supply/vsn-supply (per review)

Changes in v3:
- drop <linux/mod_devicetable.h>, drm_mipi_dsi.h already provides
  of_device_id (per Uwe)
- carry review tags from Krzysztof and Conor

Lu Chen (3):
  dt-bindings: vendor-prefixes: add smartisan
  dt-bindings: display: panel: add Smartisan TD4362
  drm/panel: add driver for Smartisan TD4362

 .../display/panel/smartisan,td4362.yaml       |  75 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-smartisan-td4362.c    | 262 ++++++++++++++++++
 5 files changed, 353 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-smartisan-td4362.c

-- 
2.56.0

