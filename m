Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8FF309DB1
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776628788; cv=none; b=gXpR6q5VL71gE0+jMDVPik628Yl2jZiwCVOH5rN8YMou7JL3/0ZjYrFejCwhp17PDAHthxoLHwEuzEs6FiHtdjEA84WibjJAGfriUSRKnrIbux2/FtEgJOVbK+ej4dYDKd+jPZuNHbSth7as8b/64ykPNLWIPyptU1KgtK0tlhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776628788; c=relaxed/simple;
	bh=FtD2Z1xu1lLuUsrnPnIxxBPpzBzNkmTiFU81QCJiUQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0U8aXMY8NQCNdL04RER/5igawTz4/ZUTt+5Gjy5HB0LaoolZd4ZA/Rh/X7xqXh4TEyqDCaHZBXhh6HYoJ8xU0079ZFYy+PKiRYB3TEoUy9oMJvQN76VOkwUedq9+I84Obe+H/1El0Mu6oHorluBMY3mEZGbJfapXKg0OD3d3i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHLy62ZZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHLy62ZZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b8efed61so24318245e9.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776628785; x=1777233585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UF/iVRP69aP8wVCrm2EY96bha6HrIsHGDErfR8s64U=;
        b=UHLy62ZZKNv0MjXNxAFa0Ft6T4rc3vnVYhcRCdPvMFlrIwSNIUxvMFZGlVpV/C4DgH
         V5D1CuVU4aDWhXSFR3BVM2PNj+mGWwrMHqhvvlMbIzr6R3hISk7u988APcGXRFiJ7Ryt
         TxKTIXpv6/zM1BcjSeD3InBsDye8RI5Mi7+FiI9mx/sLPjauEXXTPKJfYQfGycecB3OJ
         U0xI8cTmHSZXarWa0NEo12hE0bRmnE4yQqjOsBs8IGyo8cQYUVi84v0TRd+YdB1h7Oul
         zo/fwltiQEG4OABDRDZjwitkrrEiYJQelzYR3RGTy9XjCATcqzOH2usrKoWeiryLZthx
         FGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776628785; x=1777233585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6UF/iVRP69aP8wVCrm2EY96bha6HrIsHGDErfR8s64U=;
        b=O3o2zWwu0Ap7JNgYIsdGeUAkrOP9zu2D/kr919whvIU3F3LiynhJcOkfJ31zvVcY4d
         M+taXWV0y4wBr/a4pSaWHxPsD6em2Njgj9QNEXrjWdpkXAL6pMvWkjriXwPmTKkqfsV1
         6Pz7jPo+zANXcGiDQtO2ElzKUa8mLMIojIx/QPXga0cvhwWK61sH5sRSAnjKc4NAYvOM
         LX3NGleUUfapnmKYFBIqsKnxW+c1MfSwgNwLw6VnPWRP9H/OohUAW/tJpSFYAHwx9Ket
         RJcWk/dTjbU/tS88/oteMl8kdLZygfPPfY5GD66zgeUurQSMA3P2MiyuO5ykMH3v+XeN
         Euiw==
X-Forwarded-Encrypted: i=1; AFNElJ/leSYkUTy6tnDh11hkNo+B7XlWpqLJYhpiaqn3miH2k09heCy3qlDJfyHLxqKnV3HzYvJG2rcClacn@vger.kernel.org
X-Gm-Message-State: AOJu0YwysIiLB++BtsUE+Mw/+il/byvwtqrLxnENup3ZP5EGQlO9licz
	eVuk9r3wbH/K+fs/1u60bocqatSmlUMlI9W06IoM0FqrZpN2OyYgmY/5
X-Gm-Gg: AeBDieuCLHyeTlm5TY7EvZb7bKKOvtmgmJWdS4fgRN/rEyaABy1P46hnhelP5oU25XA
	hYSFVES9b0vHOOljEbhikTQThl58cSqcMXmaOMuBdk1QedhLKhfDfLIJfRGeggTAGglTyM7Ou02
	QzDlmuBzkp8YjprEJ3YgR3Be8Nunp+15X6tPZ9pEZdpuoy2kl5Llclv/diE1dvT3u7Rp6ewX+zg
	f3K44eCrmEEFWLHqKBzY+Fa6OkN4PjuAvuonRM6FxUA2mRitQkL6UI+yZV4FL71JovC93qlxvO0
	BLNRCUYAZtSvsjLGFEvQhU6w7Z+Uu2mAa9+l2fuZzROXBOh2R/WBv9UzAL3CpfsBHfCvXa2FQPT
	4dv16BC8TUImyQ4/c4GK9i0qzd7eDUTxq4eD+vn5kIMIdOgIEc7IdU050oWb7qb06lqmKTrY9Lv
	sfTdgnPKTQ
X-Received: by 2002:a05:600d:106:b0:488:a2a1:62cb with SMTP id 5b1f17b1804b1-488fb8b5753mr98476615e9.13.1776628785173;
        Sun, 19 Apr 2026 12:59:45 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::d908])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46471sm22482179f8f.28.2026.04.19.12.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 12:59:44 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: wbg@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH v2 3/3] MAINTAINERS: add entry for GPIO quadrature encoder counter driver
Date: Sun, 19 Apr 2026 21:59:08 +0200
Message-ID: <20260419195908.12202-4-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260419195908.12202-1-wafgo01@gmail.com>
References: <20260419195908.12202-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for the new gpio-quadrature-encoder counter
driver and its devicetree binding.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06a8c7457..fca62baa7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11018,6 +11018,13 @@ F:	Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 F:	drivers/gpio/gpio-sloppy-logic-analyzer.c
 F:	tools/gpio/gpio-sloppy-logic-analyzer.sh
 
+GPIO QUADRATURE ENCODER COUNTER DRIVER
+M:	Wadim Mueller <wafgo01@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
+F:	drivers/counter/gpio-quadrature-encoder.c
+
 GPIO SUBSYSTEM
 M:	Linus Walleij <linusw@kernel.org>
 M:	Bartosz Golaszewski <brgl@kernel.org>
-- 
2.52.0

