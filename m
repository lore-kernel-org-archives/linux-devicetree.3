Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900736E48B
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408607; cv=none; b=sbcJ/aRHUm64BITMPK33El0HTsc0I3o7BInddPHmFQyNnCe5T5vJ+I2YuUEb7DpxEWCPOC7eCCQk66YjXtziBysJUIo3AKqc0BGfjOInb5DQPtF3b1TtM7HCbnxZ2yNCmuNfHK6NnAuQvfzzmAwUAmNJl9A6ILNFog28Vk7gphM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408607; c=relaxed/simple;
	bh=xcfQ7/KvXVMirdcq7c98K6jioNdwwVEOkzE1auEGMZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSFjPyylkBh874T3mHcxBPFMDxiqD88J++qEWGT63JRXkv6cyMi7iIfmByls3JMHvhrGsSmgwUoO+oZwKKFLxwAIXTcNqnCWnSBwCuj5jUV29o1JnSQcDWuCh3QRZeX2OSSRP5AzxwjSuXuQSyU1l9p7d/UxyeCku/QNZAkoLdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+sPICYg; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+sPICYg"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so371011e87.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 23:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408604; x=1777013404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRVCqY8swwC0PUrYKMetJYUFRU1Yu0YEh2/EkBz/11A=;
        b=E+sPICYg6G8oxvSmf+1nhHYboIFa5DV89GX5ZJo8IVoKFvCGKdb6443X5XR+XFayzc
         5dSXzAxuqw4a/Xc9dmJpcmqKtG56+cHkM96hj5X0z5vXU2ghHDqQ4328z8Rl1tJHI7Jg
         YfemmI7GCIIhmiCnlf1aLRXnxN02fzVjNLy+SEK7GmXJiIdcV/pzpnyJa95dUJgtIcBq
         xTqZVVrmZZNMJ2J1I3uZyzk7dG9X8Qw0ro2wzKyWr08pL+/AC5BUhPx3kumz1hOjgolg
         japQCxEcqG0VFYNAV6a0X9OzeIFwwUpKyTQHZNPMm0uTMdYnFfrvHuZUG/30U56XOpsM
         BXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408604; x=1777013404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wRVCqY8swwC0PUrYKMetJYUFRU1Yu0YEh2/EkBz/11A=;
        b=aqzq6zpPCHOoBYZ6iVFRjAk28i+dBnMPB5kPEljxHY9h/1HbKgs7tObe2AMpCIC/oL
         2tQexYSbQ7cI8KjxVBc7LYSU4/8zEntYhWCL3ahLcUbNRUHeDNkOQuTTqZgPaRJghcG+
         wJ8e6q5+DY5ccqpqftif8RJGvW0TgPuj2e9cnnF31+ss2X4BJghaVPcX2ZvHs1kmWJfR
         Dqlt0tCghxycE1P18tkY8A8Y2MqZ7cG1vVxhG0Ar+G/eGJdP9m+KXNRrYaERD3Sfb4rR
         1HJUQbggi84s+SlNWlItUaJBJC/KqAjj55FAHzeNim/8ZIHopDoiQoRAJH7V+M/4EFI8
         Fqdw==
X-Forwarded-Encrypted: i=1; AFNElJ9QSNR97LwEiyPABmrLatqy/a9JdqD1AcCgupHgOjvw7WDIATz+1ptajqVCxoy7MYgeCIBoo8gCXdwT@vger.kernel.org
X-Gm-Message-State: AOJu0YznjJ8edpnjbvR0RJJqDJWfPk277uX9g3C2RkHEKerrM4RSuR8q
	/WjlQD8v7vKr7VcocNF3qz1HTcoL+SpEA+R1dpplCUJSHcCJMU2QvmON
X-Gm-Gg: AeBDiesLskGosMETas/ZG8Mb0dnZArxznDhM4XFWHw+kb3Db0nPDUuawKhdOC+MkY0A
	pSysl2xQ/mIh5WqfeWBQpmsUsrIbG0Ca0DuUVH1OAxePgu92N4ysaw7B7XtRUW03LUHlmIF6fAi
	Hrfv8Ytw9PeTvGRPjpFaIGhKskULMoz2IFul1z3q4a1WbTuVmR2/7U5CqdCMA0FA0QydW29ffOv
	oUysgnmebtqNv4kAZw4X+QXk/TXEvtYVnXC4NScUxo0GtKf1wExgsStgeHEDO+V/cv/AZViA+RI
	zgEuJ3KgeVtwu3jzlJI9DrhedGmzioOFIkbP02V7+AhnJ10lVVjXQDV9iVbQJjqXwGBkTYEcVDF
	WfxsxSaEjC1NR32FoxJqiMSZC5o9IApERQEa+Vs4Mv+ZxOObYAQU5Uq+tQwUScI12C3kTm66aWo
	DuqcrPn7ns4VrosmJEPo/zKfA=
X-Received: by 2002:a05:6512:304d:b0:5a4:b02:66a2 with SMTP id 2adb3069b0e04-5a4172e1bd6mr507559e87.27.1776408603471;
        Thu, 16 Apr 2026 23:50:03 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm153202e87.7.2026.04.16.23.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:50:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3 RESEND] dt-bindigs: display: extend the LVDS codec with Triple 10-BIT LVDS Transmitter
Date: Fri, 17 Apr 2026 09:49:51 +0300
Message-ID: <20260417064953.20511-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417064953.20511-1-clamor95@gmail.com>
References: <20260417064953.20511-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Heidelberg <david@ixit.cz>

LVDS transmitter used in the Microsoft Surface RT.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 7586d681bcc6..0363201f0e61 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - doestek,dtc34lm85am # For the Doestek DTC34LM85AM Flat Panel Display (FPD) Transmitter
+              - idt,v103      # For the Triple 10-BIT LVDS Transmitter
               - onnn,fin3385  # OnSemi FIN3385
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
-- 
2.51.0

