Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CEE35AC2B
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 06:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629787; cv=none; b=AwzW57okV8U6K/9wRSXF9OdEsLiFlfXIWUjBxHc7eEcB18l2+vrNXadzESe0g/NIjVQeY3urpg7TyBlgCOZpuK/n3vuVff+3Y5AqHS58Sk3W7wq35H6C2licUMOJg7VnPYndhXertxCrB5y8nbIWht1cXYuhRpMCN8gFy63qgJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629787; c=relaxed/simple;
	bh=Ojw2XeZPBcO0787VyUie7rj+4Ma7g0T8xNVC4PF1Jrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lfbkazr5iYkfcVlKfVdwFf19kKzViVo7pu38Ms6gW6pOJHwcLurV4MlRSJ/yffd78zZqsD3ePD2jQdzm5VaXDAbekjB+aakDtz0MtZ4+JsvZXLi1I45U26AtWH01e4aI7T+GBPfWXb6+9mTO1XhgdAI+he/RoFTE0qGfoCZmBro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=li+w/e86; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="li+w/e86"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cf7683a28so3468824f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 23:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775629785; x=1776234585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9VJseYyqjYECOQkMOXlPXSaVSDXv6yoeL00c5Xqt/k=;
        b=li+w/e86GuxHUL0cmny1PDt423ROC8L6EnSZjP0jTrnAMqC8THQALwz1ghM/zv+tOB
         p4EQhrPGQMcdtvJYNQ9BTBoPeuJAazAv4CxHDFdB4pR3uivWxP9KE89PYCVve0PwLGJk
         8MNF11inYHXe3Mgxlr6K5ESIQMbhrWUydjTDqWck1hkrgg4fL+mQLKHpxCUJ36aWjtws
         OKf2F5wAxfOEJK3kbfQVGhf34amchk5mTmKOJjipctQrVyEK0dX2M/UK5+FRHpUd2Igb
         ujIsiAmrE1+ghb5OVl6kIJdKbXNUXofiGRKuei378kadBqVOljPgwHQPXPEwwfaEFt5O
         mEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775629785; x=1776234585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9VJseYyqjYECOQkMOXlPXSaVSDXv6yoeL00c5Xqt/k=;
        b=BzHSsG7j2MIEtgVckeLUiUFhH+7JTuw69VwCGYqJjnNRFmTe55KKGEjE/c4oDfbnQY
         lyHO1IJqHuj6gTChsdmRjxWjfgkkDUDAnZDNmHS5410xg5SCOi9Z+mils0ZwUuN4DTSK
         Ios9JonYkD5IWiQyguqCoCXSL5N8mxpYxcEKdDjNDNv9uPGTKHqMDJL+N5vFMZOiHGHi
         im4gVRbKDN1A/RevTMn2u63xPbr/o7oGEBxRFRwirf2qsofhKQJmUevQENmQ8ew9MHbP
         AfdCBsEs4tsJaRsvkI3F8h95pyF5X7aRXJuMyDguKKtpliKMtCXkoGxw+z3yAWZlfLMe
         AVcg==
X-Forwarded-Encrypted: i=1; AJvYcCXbbU5hXnYOF+Tuln4BeL8v0A8S7C5L0jqUvvsPjaC13WgnNmMnjbuLRXhuyw5aYMAINQL4xDdf2nLx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh1zOwAQpYfuSOPyVU7eOCk4cvrgBAVCrU1k9wfsDJ6L6qeCVB
	fwTqeovK9soLZfs7l9AQNTYY996TjiHEr/vCGfgvdQY4B+aFdCsz9s1A
X-Gm-Gg: AeBDieuHbIwtxqNsev5CvQcuqPK+Y48ch45lTjyknY4yft2/gS/TkO3pSGv+VMMgYwr
	BnmKM3lIzyCNAkt5jmEAp0trqr5KkKTM+Jzbi79ycweatgYoqTXnd0BYok6KF8dm/b6Zzo1bQfZ
	bAopPM6axxIT55Ctc2i3eaqDexB0PK/nXSHH2+nQaeaMXvhnFBDYNp0hXG/RbVsxTBPYycIPN0E
	SQVDCO/cmFzil4tlZVzSxlFcqlLSqzdUr3/fsw7fdjsOiQhOV/PlIvMm1UErNzefE0xFxf53Vym
	tqrCzhFmkKAcAISndXgJST8qVJKwbBZfuGVfj8SrE8oiTYYllx8F7ZtKS7t10uqDcdm99vV0fV0
	51Gano9cdAN/XY4MRgmAlQuMXxZSdhDy3u+5YxXjqO5j1R872nlxr+qUcLGmVf+dZCCOML9oL+Q
	t4ov6wnCXBOwv2YfZoDoxYNqJrsUTb5jGOVJCJ5GmGwgw=
X-Received: by 2002:a05:6000:40ca:b0:43d:a58:b076 with SMTP id ffacd0b85a97d-43d292e89a7mr26799287f8f.44.1775629784416;
        Tue, 07 Apr 2026 23:29:44 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm59905521f8f.33.2026.04.07.23.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:29:43 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-leds@vger.kernel.org (open list:LED SUBSYSTEM),
	Pavel Machek <pavel@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
	Ashley Towns <mail@ashleytowns.id.au>,
	Dan Murphy <dmurphy@ti.com>,
	Gergo Koteles <soyer@irl.hu>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>,
	Pavel Machek <pavel@ucw.cz>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Roderick Colenbrander <roderick@gaikai.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-binding: leds: publish common bindings under dual license
Date: Wed,  8 Apr 2026 08:29:42 +0200
Message-ID: <20260408062942.7128-1-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Corvin Köhne <c.koehne@beckhoff.com>

Changes leds/common.h DT binding header file to be published under GPLv2
or BSD-2-Clause license terms. This change allows this common LED
bindings header file to be used in software components as bootloaders
and OSes that are not published under GPLv2 terms.

All contributors to leds/common.h file in copy.

Cc: Ashley Towns <mail@ashleytowns.id.au>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Gergo Koteles <soyer@irl.hu>
Cc: INAGAKI Hiroshi <musashino.open@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Olliver Schinagl <oliver@schinagl.nl>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rafał Miłecki <rafal@milecki.pl>
Cc: Roderick Colenbrander <roderick@gaikai.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Corvin Köhne <c.koehne@beckhoff.com>
---
 include/dt-bindings/leds/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 4f017bea0123..b7bafbaf7df3 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
 /*
  * This header provides macros for the common LEDs device tree bindings.
  *
-- 
2.47.3

