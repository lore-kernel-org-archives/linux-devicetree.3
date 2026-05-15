Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA17B3FD943
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859396; cv=none; b=GcJATpNsQs8/RiWB0v7PXddeU2hd2fcw+9Fa3Q8g//YvyFIv3vHO2i/yPDxNdP+/qjipjnd79lKUVVVDcyCAxOgjd5NHwWcNYZjcvkzU4yrZOpSvthggZ/BKmGKsPTuTLdaOKiA/u1g3j+thDZ6afF/PQQ00ybtfh8E8ksbV7LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859396; c=relaxed/simple;
	bh=FtD2Z1xu1lLuUsrnPnIxxBPpzBzNkmTiFU81QCJiUQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfq6UkBRwekBcfnUB/P85Kv+1U5NKWcvMgh/zQD675F4kEip1xMepnw687NHcjhZpeZLZbh2f/NOFiH7VGiUIDe4q3hhFaD0+p+MlrCTXq/Eed9hszf4tKuyb1IawaCt3IZYlKvfw+/nS3JBakVFLSKudJFJAzdPGfjW7Vnh68I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7JSjzq8; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7JSjzq8"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso14755608a12.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778859390; x=1779464190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UF/iVRP69aP8wVCrm2EY96bha6HrIsHGDErfR8s64U=;
        b=a7JSjzq8mNVU5dmauq7JPoxgutxKgsHcYOnkrP0TRSScICtK0CPZqDeRXiuN8hp7UA
         tqmBPqu8sHPRsk2qFM9vmWwun9AzWe4quFi8ojCgJUGxoI20OV8F2Sv4Pt4BQh+ZU8DF
         9/owJ8Ygl5gna+nrSnpLnG3Qrit5BN90/MiS/D7iFStPAx+M9Rz3TgeskzPhxikYNNFZ
         NoL6UE++WZJENMgM1agGx9Ycev161wkC4Xp03Q8CUpcVNmqack9O9zUpuyJv97yCGcPk
         E6OeD9t1XN8sUDS1I0HntETxdkVL/bLtMEtvIrWWXVe50i5qTWByFlsDYt3WuES5JC4T
         vlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859390; x=1779464190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6UF/iVRP69aP8wVCrm2EY96bha6HrIsHGDErfR8s64U=;
        b=Cl/aE8KiHved2kgOPfw+K6GYjLbqx+TjFKcIcGqjOKcfzWf1IwIp2WJH5st0XjWceY
         2QXtVeue/BMRkcwPMgjORY3f1Pqs/32yfzFO4X+2yLH2NCA1VuQYweuURdoJOB8N4B/F
         JTZCXOn2vmwor0/Ma6KusCZJ1fq184AQ455f8XOxuUlDsfRlsvcFhfgsXkLMefBb0XKs
         WFZUJX6U3NAFc2sXT8DGHXkaP+kpGXy0RMKdFYEzNDsRZoBUjd/Kf8avunEZvXWG0y9U
         YXpfuS8xiZylCsO62siEqeB2mX7aOtOvXhNBRtKe0FpEQkCD2WRdP1ew82BYmmZ/o0Ol
         1pOg==
X-Forwarded-Encrypted: i=1; AFNElJ8xGCcbHmOaKmhNn0s0TD6SHRww8YRlmtABbJC6aYMHLg5GAx+egHHtwwXVjMZs7DLyjSj7MY/CcHV8@vger.kernel.org
X-Gm-Message-State: AOJu0YzitD70gcxY9TGq4ZhCckrn8AG3y6jfCfeShXK314cxuXFdL4Ma
	RncJWf328GwLmRbvReHqkAs49yvke8ifjcnYW26sltOy3bDNDu6D90g2
X-Gm-Gg: Acq92OFqZTMUGonetxV4kkUBwFmKA0iUWOFlxwd1T7a3/MrqZ1bjTgr/Ejn29GTJUfH
	e8jOP9XoElTHnz8DXEFpysdWZPXCq5O46InYceQOjQKFS2WonuG40bwHB4OKqpS7WadukC+PDa7
	VHEthA+nT0zMPqgw3mQfphed2jyZsNKhQyrHzzuS1XYbNgAfjA5Ui4GXyCqdilRtHDoJNg//ZJh
	5ik5y/9Z4osivrErU/plxV+TuYssDiDC1KDZm1jfFP4qnrezGNXMawM3ehfd+dYqGuxgAXFSTaq
	i5qhY+DFoteLFF0q02HA+Bm09IT0LhG3R9Mo/u/V53LPOkiPCT5jNvIte0jXlYj7SDim5/G2TWd
	1O0TrFc8W7UY3Ypa7bSIo4G2pjTAl4i0+wfYji/H20txEwWrWhMESftqUzHHo2UOEb4FFEJWqQQ
	==
X-Received: by 2002:a17:907:6e86:b0:bd5:2cc7:d845 with SMTP id a640c23a62f3a-bd52cc7de89mr85503066b.30.1778859389931;
        Fri, 15 May 2026 08:36:29 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::6182])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d510fasm2205089a12.11.2026.05.15.08.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:36:29 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH v4 3/3] MAINTAINERS: add entry for GPIO quadrature encoder counter driver
Date: Fri, 15 May 2026 17:36:16 +0200
Message-ID: <20260515153616.157605-4-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260515153616.157605-1-wafgo01@gmail.com>
References: <20260501200749.20029-1-wafgo01@gmail.com>
 <20260515153616.157605-1-wafgo01@gmail.com>
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

