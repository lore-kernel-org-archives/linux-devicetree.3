Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D392B1C862D
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 00:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566965; cv=none; b=tE/nYtaO8WBnlpTKaInrnhHFWHxd6iGGhohnR/aXuOe/qhk8SiuDqrERQwYqsVhzDL3nr/MiR20nKqeIIEPpzXCWW9zrkFAlcfkKQekVT8yKdP+wgIDoZyFviVHecrbWIUAZuDqeumC8hYUjlvmcnJ3EH/QT3Eg+8a0PT0c43Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566965; c=relaxed/simple;
	bh=Z0eqXMInzFdWundp0bdyqvyQWa4WYterHClI/OnGILA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+p0hfJHSgPYOfiirHkL2dBzd7esHjA4UqDqHJHi4b7CvugRqJmlfvQYlD7NDyAkhSxhze7Obk7iD2VzEXoaQM81MvMVonxZkT2QmKpQv7v4yCnBVmpoVHJPYoOArcRc8GFqVADsYWJU+H9Y75MyaFUw7eizu1h3Vg892a+0V9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fucYi3dP; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fucYi3dP"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52d5bfa4bafso21203271cf.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 17:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566963; x=1789171763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5lvUDKi34eWgpEQ9bn1qS/2tjyT90hT4Ul3KLa+Q40=;
        b=fucYi3dPfRb/u7nOr0gUdD3Ka/yaeSL0KJtpSf6GwvdQrt/fCh5kRd7JzaPBe47xQV
         EH0VUYp62gWD6xkoZMHEfuLjhfxSESoHA1OJNV6YtBqVpxKeVDRQs6LfhMWWPTrlUKgt
         WdP2HNq2uHbTWx7aaFyfNXsAiM6CtVXlxZ87YngTQfmZdJ1vyK0QM1YrGMjJ9f/z5Qel
         nFVRqNr+mrRxy1LZqhdZkIRN2XUX+rzeDYnbSFrhsFG1ByugtGtm0wXhCCmLSfvObacT
         C5+sbPWKvl2wPepZgaxxZJjZdJ86jwzrt9sNsA2BzRZNfyIkKmV57ZxAu8vbY39Manma
         AqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566963; x=1789171763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5lvUDKi34eWgpEQ9bn1qS/2tjyT90hT4Ul3KLa+Q40=;
        b=sctfN/emLnbtesdZ+2RMcZXs7N0wHGp2EkFcArrUACJ0R5sMBpz2MBMd80f5gPrBAs
         BGQnLX+p3nwLM2wGCbZFVpEVwlfpmQxN2L6V6ijJ8oXMksWYPK82D9+e5X8ZuNUocSnZ
         LW39/DXeZhdrVzjfWPf/fO1Z2ERVZOe0bkILeq2JKMThuQRkRMN/WKA1hOBKblDhVf1i
         YFl1ao/+6GIOqCfJfoMdBYXKsllbrL92rbpGPUCndElIl8vM1fR5MIbKBKJen3FonXmd
         IcSNB4QnaL29kU1m+bvqr518Ov/s6/qeZtdNESm1qYIJhjGoxJ9FzUEMi+alFwDEdQhE
         wOAg==
X-Gm-Message-State: AFuF++kYGCzIjKMTlCNq/pL9mYWrZavHQRlR1+n/HESxfAd76N85q7oF
	GHuRvIKe7vt7p8RTf4/doyvauzHJKgNAE86OE5AbIjVMDyyMAlDewNg7YnKyeE7F
X-Gm-Gg: AYBFou2We1j6R9nREDibNT07O1+PGWpIhFoSSpFVf1OcuRiddYsggA9qE1v9WvvJ+9D
	g8sTUgOkKrE8XKeVIVtLIbYeNZlJACaCfqQjO1pluZ/aBeq6stos9UPr4zs1KsDs8sziAxboNO7
	0+UUZJv0sjA+oAyDUVu3lkTRKD3Op5+0MoUlqB6jzT7Rnvm2OobgFlXZhQvzZ0E+OUtE4rEXTHK
	zUm+/vz/sxxFIc1EAr9y9j2TmeGsRXr//3EtVdqtJethsQYMo/dD3EgM5HhWgITYfiaoaCcWV2j
	C/xUdbr+bkw1S5/ye/I1XQpZvlFGPWGij39s7UkThLGGDn6ob/N+Z07jvm0D1I+3F2/WEdjTbUj
	JpBLzf08hFDoZiyFrNe8qPx3+L28JgQEUkyHF9YbFO1y6DiUf4tebMc2+hqPl4t0Nyjcjea1aEt
	lbUXJOLddHFx1+djmjwI1n8EKQESmEA2V4UhQly6ckwdOeoTWx4AwHiLZ1EC197vbVY2BNxKcHP
	79o2V6zYHZzwnHlPwIOw6NimIWaP7WzBwfDi1VSpgds6uVuu4LHMRiGl1FoN9NO3SbC/rTdmOYs
	UXvqAFr0SOGmcW/zYTXkpzCQSB5At0r7VpN4Lw==
X-Received: by 2002:a05:622a:258d:b0:51a:896c:9aae with SMTP id d75a77b69052e-53054876057mr102752221cf.13.1788566962767;
        Fri, 04 Sep 2026 17:09:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53053ef5af3sm33158421cf.0.2026.09.04.17.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:09:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
Date: Fri,  4 Sep 2026 17:09:19 -0700
Message-ID: <20260905000919.155694-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
expander and is register-compatible with it. The addition of the
compatible in the driver missed the documentation update.

Fixes: 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi pca9655")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4631388a7d91..563f61e6e543 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -67,6 +67,7 @@ properties:
               - nxp,pcal9555a
               - onnn,cat9554
               - onnn,pca9654
+              - onnn,pca9655
               - ti,pca6107
               - ti,pca9536
               - ti,tca6408
-- 
2.55.0

