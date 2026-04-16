Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62B3A6EF8
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776372536; cv=none; b=NsG2GsUZdx15s/AnUYw2vXIyb6zdtekeiWJtdiDe2ECAZ4x3qvaZqddwT10o7J0XqHkmIaGQnvMzLoJ8+MNUYtmTM9Zhf5QAl1opcxNxjARTqcqt713s7U5qMjQ8qBy6Wqr5bKiUKlGqpzfHHU1TdGPaLJciEzXjwMtNjovcCmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776372536; c=relaxed/simple;
	bh=FtD2Z1xu1lLuUsrnPnIxxBPpzBzNkmTiFU81QCJiUQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLFGdRBMDx7CYbpzFw5UP2W4PxdSZBg1hxtQ5FKTP+7TjiyjA1qTiPA0FZDVhOGEYSRkd3xPRZ7fJLYFs0lSiYnVDvWuiekVuhkM4+w7dNO+A6/594G31e945QdGso1JxOyei5mAJPb/o1oVy8INJMsW+7zvONL4iXdGcENH2Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCe3VUTq; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCe3VUTq"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9c01854477so1638166b.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776372533; x=1776977333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UF/iVRP69aP8wVCrm2EY96bha6HrIsHGDErfR8s64U=;
        b=aCe3VUTqh2Zev397j6VRnBtS4qyp2l9EQ2ccFXgyA0fBQh1QvQ3NFFb/nSxCStuROE
         buZD0D6/FJHtOzzD4Z5rxTYcAwsDCqJEUFAtrsMEc8N4hD0x0kQx/T4QD3qXnW06RXkT
         bg7a391OnTtUQvFn3GGTKqIifAEX5cv1zSE+7OgnhfWM57WZawpLNHNG6/ohL/ZTp4SF
         4In2EHge4w/Cuo3im9eDnHtuU+g9GkDMQFpNZAyJJiBsnewpNpPW1QRtkzs9fXvyMVJS
         I2vjWo0M2HMmGMQo8hXD1vQbUsJ4q2gwDXdazXOjHmnHjbLvhGxcxKf5f3sSO/RJAsv9
         YlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776372533; x=1776977333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6UF/iVRP69aP8wVCrm2EY96bha6HrIsHGDErfR8s64U=;
        b=B1Gb/WmgBd3qkWDwSR7581aNTSqCmOgNghSbWMqXD+PYXv3XvW7sLfeS5xZOylmK8k
         BdeZrA/xL3sbl6p+ZNByqZ15WXrQxUMS1DX91o00sie2i/dMWqqtuIDJSbZjAnw25VfX
         8QLpbEq0vVVUnq9iiTMrTFAZTeXPsHRSxS7KIbGeco7rY1/MDfBdN7a/WybSUhb0lCyG
         g648he2GFrRzbD9x11g2vByeXKslghzN08/tvosJJc6Qc23sVXAQ/cSXNktglVM723oU
         xA1M3XDBqj7W3UQbSTv4P3LAE7diaDEJu2HvjylDnElDCv86RZIWQyf42vVau4Dz2KDf
         BrCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8C0Zgqm3CLuJhdkhjqsjz0c8REQ9UKKHtWYSPvQvr5HgZpUjSN46S7Gp7F9b6zClrIMokSaOKqhj94@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuaf0lnKM5cXjr45SEErb/RGAiTD6ebxnUvH6BW20lSvibolXo
	GJPzXy0H1IYmKqEEonTCFjVxmRnaMIY7XYltyltkQsytJZcICXyq70W5G1BOVg/V
X-Gm-Gg: AeBDietr6PduBi9gauJxDWazchpdDbxavkbobaWhndIfU0bdwCOZSey9EEI0N4BfLw5
	cpoEJXMr13G8gJ9EOIXO2DHJBcvCrK+oxvE85n1z39E9HqDmc0jVrFn7JhC+hecChE0OE/Q5aik
	a9Hasv6X7sjU7NbtH6s6IoorVj/Vvsr2IHRuO9xLa6jSzFLi5tMYkYnqluR3DqACj+XzRdLUHJk
	tISMKvHE+4IrpkzYwkZYq4LXBuAT6ZfsYupa6ECgqvhv3u8tnOYk4JKsjdq1egM1kKZjriSDpBJ
	YpN/a9fHynWj6SQTp6nbkmjHBYhWM1RbpVQtJ9QXChHtjQTh8neVRiYCF8vOF42D587eM9khva+
	UK6V6js+GoQPYyrQAR0bVJ1I0lHRXu2882FmaYogBhUveLNunBZd04cApURgJ1dlOs+lnjJwPKu
	5oQ9ayN2YS
X-Received: by 2002:a17:907:3f8d:b0:b9c:69df:4d9a with SMTP id a640c23a62f3a-ba41e4fd421mr1290966b.37.1776372532434;
        Thu, 16 Apr 2026 13:48:52 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::d908])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6723800b6f1sm1437962a12.26.2026.04.16.13.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:48:51 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: wbg@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH 3/3] MAINTAINERS: add entry for GPIO quadrature encoder counter driver
Date: Thu, 16 Apr 2026 22:48:19 +0200
Message-ID: <a935f0399608773f052051a8792e2e5c77066942.1776372319.git.wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776372319.git.wafgo01@gmail.com>
References: <cover.1776372319.git.wafgo01@gmail.com>
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

