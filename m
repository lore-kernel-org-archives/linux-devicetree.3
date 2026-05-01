Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD742314B
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 20:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777666079; cv=none; b=UyJ0xovjdzorw/KIyEABYXLcLyMZuhJIU15nM7G1xIN5tn90SBc4Y5EvEDS0AaCRJGrM0abKdOaC/VMXE5xT2uVJqLvfUiCm98Z4JS2BBDTt2NMOLz9muZaJaByaPzNilN8Wbz0+6gQENiJKHUTBQxDL4DgSN22jtVS4a4NuYgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777666079; c=relaxed/simple;
	bh=FtD2Z1xu1lLuUsrnPnIxxBPpzBzNkmTiFU81QCJiUQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bxvbC6ycWgI2vYexwTEBLEmQGhA6b6q1Zwra1XkIP1Np56yvzfD9M+lf0DatAV1NZlAinrAl4qHZi1ETZpicuqsZlRiw7q+Jpm/kimjdk178FoYtO+f6njxaainD78z39VbFPCroD8t/gD/OMpmhq4Ju6S60NKmXvx0YzogfuHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuVQZ5zo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuVQZ5zo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso19431095e9.2
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 13:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777666075; x=1778270875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UF/iVRP69aP8wVCrm2EY96bha6HrIsHGDErfR8s64U=;
        b=WuVQZ5zol4gek4M15hnluqs6aFLPlftHDTLgSo1h2YZ8HiefaW14wx3vM2NuUhc5hG
         67ZfXZ9mUKFeMX3q8uTov3gKZXUXEaDlP9PHGVjnV+jPtKYU938NfCn82yDC9eqgvk7A
         /uYmjAINE2wXnw78qWVkQqmJJJZnJqymsKc7e8jjnMe1WG0u4es2VIzQyLSH01koQANc
         6sGh9FNccNVS/uJWyh+4orFhkUp/qPVRw0i8PO0lOndkKu+Lv0E7DivygDh6DmOqxCaA
         x/RjQ997bAdM+VjhATNc3rYV4iXhaWQYt+fU/hTsjgVELVNoJ/wuh+UV6+H9tMccKVtx
         KG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777666075; x=1778270875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6UF/iVRP69aP8wVCrm2EY96bha6HrIsHGDErfR8s64U=;
        b=Ewm0YKXc0hjals1fuBeo5ajCypZbJ26dwbOzGR6wX82DR/KwxhzSbY+Qz+kxRlfW1K
         CLHNTRGIbcguTg5DYqv77iPxywLfav9K6qHL2qIp2XACcMOFn9gZsp+xDldy+EGzENya
         A6b/lAFDHC5KConu/SOWAd08kz0ORpXqMTENGnjvV3xj2bvpYreiaRtmYtukvtKolV1a
         vktkQr5XYYniyBG5RC9NGzV70Ek0NfUMbsDcLh9mi9n5g/WnK16ZAc/zEZH1kwIRVFO4
         zbXeRtkC/lxzknb2Gs+Oyq6AwiRPQJoKqnRujaPsOxznKlyOM4Y8a+HD0JJssV5+Zy9b
         26gQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MBvdpvgrtBvEVa2bfjz3kDXYbvixlOAm597s/9ndVDRFRET76F7Uhb3xMFAKmkHnlnU3s31C/wqi3@vger.kernel.org
X-Gm-Message-State: AOJu0YwAkyOMuzR+xRwyW2GUBND4KzIdTRlv1hz4UbKkkyICPsvXAZvt
	2xb5NpFQo0EtqEz0+NAeXe68YQ1ZGhtukIIqymkKGkyJPmM7Xa/DI0RCq7ygJxXd7QM=
X-Gm-Gg: AeBDietSW3V/mGE8rNWPeDTugbK92rh3HKu4XjE1LU+89wjrlh5nFROhDdg+gqOP6/D
	OmWlgqALBno3DCHYIbO0bnbZzaYWkV+ULTIzti6+9jY6irdfpxD6Be3c/oiAuJVrHj7KqjPUASY
	YoXqm2j+QiKPVA9PMZ2Vxjp5s9SVrfaM36uyHiKYX1zfHGxNT+iRCIty6wCqerKZ0qnJDbSuiQJ
	7N+hVCUYdLtpiPkEXmFMyZKwYYSLTCEtxY3hvBq+yD2w1g4F0o0FOpJdmwxXgfWtjZkyNiL6A1k
	c1hwHbxcJnTdYQO635paCZxtLV599keCOhpvOmFEEafFP4ADYSsPm1B4D3+MW9gULHQdlLnVoEo
	1fPlcb2zP8Be/rI+K3fRjO0770VpdZwR2ZdrHYppEfKxPUSiZLnyWrh8cJcys5QIMAhhzc/M0lT
	Gdzsppwz/i
X-Received: by 2002:a05:600c:859a:b0:48a:7f90:2231 with SMTP id 5b1f17b1804b1-48a9865f859mr6273835e9.19.1777666075135;
        Fri, 01 May 2026 13:07:55 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::3323])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe953besm26829325e9.2.2026.05.01.13.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 13:07:54 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: wbg@kernel.org
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor.dooley@microchip.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for GPIO quadrature encoder counter driver
Date: Fri,  1 May 2026 22:07:49 +0200
Message-ID: <20260501200749.20029-4-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260501200749.20029-1-wafgo01@gmail.com>
References: <20260501200749.20029-1-wafgo01@gmail.com>
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

