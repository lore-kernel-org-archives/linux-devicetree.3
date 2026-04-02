Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4466131715F
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 01:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775095183; cv=none; b=KIrQIdwiAs7dxPBrFoBsIY9PIavMXdOu18HK8Se2oMa+oT1B63OQ0UBlyMxxBzuHfd7/hdUtDZGdWLnjz/w7Vn/Tv9UJYsX83nt/cLXeW4HetgfEQDBzffjEj3OECH+CM1+nIHnRiNR6prAld5X6XtAwKoSZ/Cey9WDB+UKoN2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775095183; c=relaxed/simple;
	bh=BDcoGzUEgpCGDfndnWpejoVBe/vKuqQ4SnpVtpHMd0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmFpaKvRSh/k5FMoKooCobSDwhtbOU0rsk5YFwFr/1JCWdY2T4gaSx2O4MAtO7Yb95WhCVB1j0tzsKuTO3/wGNkGJp1+Ez1b+WgTMfJp1JbYtU/JXkcLXwfpunPc5OKjIJkwQsZo3zUU0mi7k3rY2ys2/fbJDQw3kRS7qmA41Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JyUMCfsE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JyUMCfsE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b2429f98d0so1936675ad.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775095182; x=1775699982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzHrAn4/x3CwheBfg3e0ZTKZNKx+9iUkLN9KNaFrA10=;
        b=JyUMCfsEzJUvnAMUaH8pFk7JOJz5S6j4yc2RPRMEDvcR7+AHkR2RcjSaIaWqcS1bk1
         pYXgyC2RR8ANzfyWQI2dZu03PBe2k9eQDah7UHIYUoXK+HKo+CrxeS0+HybIbbmEtud1
         M3Tr2cQDeNwYp6bFGqBDUUyAFrSsM5AQoXgXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775095182; x=1775699982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fzHrAn4/x3CwheBfg3e0ZTKZNKx+9iUkLN9KNaFrA10=;
        b=nDz0N8m6f+AMxcEjy9DUjJjKSNGJvKTq9pYZxJL++Dwz76DIOrYUd1E6GhLnLq2BX5
         ZFj5KrEs0UlOzXBnr7WqZ3xB2iv2y0jFptC4fOWjUCUNI6VVYenIjdKOS+Gq/O9juJhA
         Z0uH+Z8HZC5hG0Havsfw/Y5sVmxv48oAt3J9DLt7FpI3gaCgS5bnJsgZhqf0R/rEC6ZX
         m3rEOyzAUbbV1KCqAAzKKx4t8hE21nf+X0yIEgEf8wIrrqPHAi4Rki147/QAW50QdSJ5
         2/30fUsd3Nyej7xnKP6OPGmHrI/4wqmqzhF+j0PKdlkhC9OmVi1msMk2YliLfJGkcATv
         I1UA==
X-Forwarded-Encrypted: i=1; AJvYcCWYp/GDwwqe3Mie16LstwM06Ygubz3lRIekEE057BWW2H4WBS4aSvFR7SOi4hhpNIdmETc4T3pxBN4k@vger.kernel.org
X-Gm-Message-State: AOJu0YyEUhtGDAUtS49p9EIuIk1RpmXXeEojEyk1w5I2kyGRt2c04SDw
	9eryuQ24ye4aCnT88byOjyPatT+vfY2NW9CjIEOiJgeynNIA1fRJC84isMS0F4Zmsg==
X-Gm-Gg: ATEYQzwwzIoXQ5hFrUyFrAsH5F/Atbk7twY9Yr2aNnkZ/GXrki7wKTwEUacsvtwNVDs
	m1ME1QaT++zCvvWbbeu5EUJ6GwZST2sECiqSDsLwmXdbzLhpfn92HZtyP2bKPIqYa6ToiQziYlL
	iK9PAxGTO7cX39a2HaKsutEWPv9k/hiRUVON3OFh2jH/sLHQgIMOXWXk/wPjlZXyCGGedjeSzxu
	ZyUHNx7lw7tQGuoGarylo1jwchn9FzJmaFz/VaWxovt10YxILr2Nf+RfbtxujaxjnFn6kCM+cRL
	abK2B37AhZUHeYFQrEu5UKMg+XAN0WxhHJ3X2CA7Cgbf8mOzuQgY0snn06URyxZDlrbD9mWzLA1
	4NZRrc7lx53FhJnZmDDIL6zQdM0zr7egTmGOLytbsPQGjPml3b4crMWCrvC3WvwpLjSXvLgRKSp
	Oh0bMUjt16gbyHm1fjTKp+OolOLvtDVd4vT7oZFYtbqjOYfZP9TSDT/X5RRxSjZHggC5tdz2yd6
	NrsBVPKfIYos+zlwf2HBzj4Qx4Ifa9oDw==
X-Received: by 2002:a17:903:b8d:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b269c9b80fmr50932815ad.27.1775095181703;
        Wed, 01 Apr 2026 18:59:41 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm11187535ad.29.2026.04.01.18.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:59:41 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Thu, 02 Apr 2026 01:59:38 +0000
Subject: [PATCH v3 01/11] Documentation: Correction in HID output_report
 callback description.
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-send-upstream-v3-1-6091c458d357@chromium.org>
References: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
In-Reply-To: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775095180; l=1213;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=sHkk34xkCVNuYNvgvLM4yfgwiPvB0kDmMlwDb9gzQSI=;
 b=sWAbum2KtSMvIZHpotQFRl3qPX0w5lDPo0wVXGjdcQZ4Iy/Q1lBj1M1z1kObb2Say/DR3abDE
 qMXRcGAYSZjCwmC4SoKf0troiioLGh8ZBZYI6TTyyS5zWbVHFTQHQ7k
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Originally output_report callback was described as must-be asynchronous,
but that is not the case in some implementations, namely i2c-hid.
Correct the documentation to say that it may be asynchronous.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 Documentation/hid/hid-transport.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hid-transport.rst
index 6f1692da296c..2008cf432af1 100644
--- a/Documentation/hid/hid-transport.rst
+++ b/Documentation/hid/hid-transport.rst
@@ -327,8 +327,8 @@ The available HID callbacks are:
 
    Send raw output report via intr channel. Used by some HID device drivers
    which require high throughput for outgoing requests on the intr channel. This
-   must not cause SET_REPORT calls! This must be implemented as asynchronous
-   output report on the intr channel!
+   must not cause SET_REPORT calls! This call might be asynchronous, so the
+   caller should not expect an immediate response!
 
    ::
 

-- 
2.53.0.1185.g05d4b7b318-goog

