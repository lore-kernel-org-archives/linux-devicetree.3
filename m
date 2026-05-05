Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953AF1DF27D
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992851; cv=none; b=luigqnUgx7cMqoUA999dIE2yHwNNMPvUgoYwyv7nvtkW45hzAMP0NbJjFtM9r1XHydlwV271SF6V7ChNsL0AgGt3tUY2pWk5IvYdG5JNRiIqNSAYWmnEGLYJHstl5Xg/par2f992nK8Z5Vg8WWZXVw9WmFW9Gevk+gjKO5IGygQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992851; c=relaxed/simple;
	bh=iMU3DpYEt6DQC0zDMTljEwIwuTHDhTEQdQhp/5OALpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tsjxJFW71v7yu5ZCrgHvWHQPjG/d+KLJtGZ9X21H065/xWQUCk/pOtx7OFqBN0Ax6OPg0NEim4tTIgI2tFmgZ4Wf6kXpfzKkb1i+mUzX9LWSivYJSr7Ca2xyRt1wF19g8ZPvuFHQRk8wn8Z6xPykCy25Gvhy2GaAbsFR0hLrF40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgGo7my5; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgGo7my5"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba895adfeaso5765671eec.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992844; x=1778597644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cEuY3xrF+GY6CciBovDXE63XwQObE7NxSwqBErA+J0g=;
        b=HgGo7my5o0BqXb26qc9zqOraHkN5p1vCrViAuvliAOGR0dFWTG/OKkBbbQhvpH3lro
         SjwDvbtMLvYUwrYvmgRV8TNyZH/R2610YXa1hmxswvRghp981BaP/+PkiWKO6EjNxhEc
         yEb5gqXcowgawUOiZPN1e5S6H5HM0PmLJ2VF8No2rCh7XBEqu7NppFi69sI3oulmJwPg
         YjS5LNcyWWzz9dpt8savMWgT0HiZ5/ohTczTCAjuGDjP9hWYmfbCh/jna1QUbvN8a6Nk
         QnnSvJPGzVbaiKqHwkfblGxydeDW9tGAl5Xh4jJGde8rtjCXLecBeOpTKDLVlfFh+9z7
         Z85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992844; x=1778597644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEuY3xrF+GY6CciBovDXE63XwQObE7NxSwqBErA+J0g=;
        b=gO+y6I8+v3RFBFxjXmqkBTv9Vdb4bAxPff9FFQdR5xdUpLSFZPBY3axhpuhGhNTz2e
         rQtjdVgglj6KTtS/zIoAIFC3pij14dNd/cEjsKt+fr0ACyXI5nyKlju19cCe+wbj/9XQ
         bthCjYs8hh7B330XGPZq93UgnSsQ/0Qg486NzasWKy79ePRqmlFawjb1L09wvoDcQKNa
         M4SBFLtE2J3qjNkmS5+f4MdRSAltJ0SdEfy+LUkbOWfDNOn+73nI5v9P7oA4Jn+nlCMg
         JqWlS1kDyGRCjyeJtJFvD3IF+JEbwfSI4mJ6kR2ZIfMYGpvIiBpY5zXp2J/9+5LEMF8T
         8TCA==
X-Forwarded-Encrypted: i=1; AFNElJ9mX9fy73QGuJJd8iE+ok4rhvnVH3FedqnnrstJP9wDNB+VsSGr109M2XcEh9qqzU47cN5ibcFO+V/f@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZfig+thyf+UWxzRGf9jOY4xusG5OJ2VLkDaOjucuL8Ayh5gx
	yEmBEHTqR9xtmGalksnBHPQ8sx02jxMz52qZJbzXoA0haTypMF1THyb1
X-Gm-Gg: AeBDievivY5LWiJx/U2IqIabu7kZCmy1WvdKrOeQnhBIZM8JCgpb9iGeZxl5yrduysN
	14nRzy84yPUPYEuHEI4nYZ2WaPQBnUk0k7hc+vu6KwF1+vFvEjko2pQW3MH0NH1UVNQbMT+UwZL
	Bj46KvGL32WTh4HTu5/9IzS51rmRMv8pAVlWmwKqVRmra9ghpPzfp38PtjSBfmUT5+4LEP/3nGK
	fM7yD+0v5tUAyeKSf85hm+QOSUBsA4ssKuYiTtLmD5KpVUMZ7JA3wEcA0ecmW3RkEvkRbriB5oO
	A3FSdYC6GEO6vrLhjfu7CKdIhn3bMO3sufA+DOhvLwzNbR+47wyj7SpcflVmmb/6+xGmrf35p6v
	l27sZtaLkXjNEOMFrA6cRTzVzhK2Z054UAHAj2c6WduhIvNNbQ/qSq4BHOhxxmrZrhk11ZOko/k
	3HlYp6xXN6NpK9BMLNvmaNm7YUaBshdco=
X-Received: by 2002:a05:693c:300a:b0:2f3:986d:2d01 with SMTP id 5a478bee46e88-2f3986d9397mr2342431eec.19.1777992843487;
        Tue, 05 May 2026 07:54:03 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:03 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v4 0/5] leds: Add powerdown gpio for is31fl32xx
Date: Tue,  5 May 2026 22:53:49 +0800
Message-ID: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series primarily adds the powerdown-gpios support
for the IS31FL32xx controller.It also includes a fix and
dt-bindings updates derived from previous attempts [1].

Patch 1 and patch 2 are based on a previous attempt [1].
The driver-related updates in patch 2 have already been merged.

Patch 3 and Patch 4 add support for the powerdown-gpios property,
which corresponds to the SDB pin of the IS31FL32xx series chips.
This pin is used to enter and exit the hardware powerdown mode.

Patch 5 fixes errors introduced by previous changes. It impacts
the brightness control function of the IS31FL3236.

[1] https://lore.kernel.org/all/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v4:
- Fixed compilation build errors due to missing header files
- Link to v3: https://lore.kernel.org/all/20260429154449.730880-1-jerrysteve1101@gmail.com/

Changes in v3:
- Replace shutdown-gpios with powerdown-gpios, follow gpio-consumer-common binding.
- Link to v2: https://lore.kernel.org/all/20260428023401.330308-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/all/20260428003412.322032-1-jerrysteve1101@gmail.com/

Jun Yan (5):
  dt-bindings: leds: is31fl32xx: convert the binding to yaml
  dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: leds-is31fl32xx: Add powerdown-gpios property
  leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
  leds: is31f132xx: Fix missing brightness_steps for is31f13236

 .../bindings/leds/issl,is31fl32xx.yaml        | 200 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |   8 +
 3 files changed, 208 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.53.0

