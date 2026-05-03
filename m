Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C95F373C1D
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777827409; cv=none; b=jSz7XRmooGj8UT2gS+7uViCTcvxJPzdTQfWBb2OYRNUKMQ6Kjv0owBild9Dz8SGQTuqr7Q+v3CiBGOxJeeLrZAdCQokNnNAzXNWz1l5cJRKLUPmmxkaX7N/H7959kHbqwf6f3NE4SqykwMh6A64Ydf2sL9eoYLhYrcSy6r9nZO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777827409; c=relaxed/simple;
	bh=s+fCfZHLa6X9SMmDSFUNu1bAbwkL7DXvsPml84Dvs5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o4Lv9K1NQCez/PevKq86MTTMSXhcanhZv0Gt1JKj6TORGQYOLLF849UJb+yB3Id3tAtfWQ7p1faBvJw9gmF0ikH/yMOMs+J7ALbbB9QY1sle+Jgfmb0gMQ/qcHevYop2mHbUn+lTALwkleYo0cCLjsGqKjCPP0BzwaIw/RUkFkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVlbbXg1; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVlbbXg1"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so4283125a12.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777827406; x=1778432206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okJJ4tttwzmNc8QujxJS2i7vSuTKHRYvo6XVfeNiU1o=;
        b=TVlbbXg1xtlVSi8v/YAj+LMS7s/2Bxr6XrjSfEythoPHOjm7jwV5GMQkJ0FBqKOhl8
         9Qdfk10C/gkQJvtYtSWQkOdxe09CzblWamk8uTl/XJ6VNjLTuW7hWMkrM+znDrcj7ql3
         u4d9pohAAxg78oE1X+Xr6PDY7R6Sx2kUVg9hWSC9Y6d30RITFfbql2MhIkXbJDuJkK57
         9n9xYvpeZpbVV3GUw/rkSt9MIlg3ENO84OmfLalm0ANddjzADthbt07U59TCWwROGTBd
         /W9zg2g9XZz9fouGNPkUZEDLWEIOytNKg0+M6+nzR7T4la48EtLhkwDqZrHuCphn9OBU
         HFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777827406; x=1778432206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okJJ4tttwzmNc8QujxJS2i7vSuTKHRYvo6XVfeNiU1o=;
        b=ILyKZxytqpc0ncHNUNc9JYaUuYIjQ2gQHbvKcKno1r0sqBk1n+Xc9s3uXV3ealf/vZ
         97X8NC4upBCdzjAkBcpB+zrsOpTRgEo0rCTIgWNZneDVZr32b8Ihcuck2Bp0q5r9PSzM
         hc0/RkvlHZLLQfCiIx49/k7t/AJHQT4iVYdNLzyODfcpngBaesLF1FQkXP8fVmXWrmI2
         vfsii4Y311u0l8p/sdlxhYqPnHG+c/Nzh/EaHPvvaOO4WxYfmaw/F7XRU4yneckM6dVg
         t+3vDpyVJwzUARN9NnyR9MOLW1YxxWn6/5vHOyusTWET6hnDdbouW7rTOVUiJqDAjoRZ
         h4LA==
X-Gm-Message-State: AOJu0Yy5GLUxhWWhkDEAFnYRafnxDb4k8dTLmyePCI0LvaXHKlJ54Clt
	vGOkhhSxyQwOBDdh7xfAWXtHgKE5WgGQVHdoQYrE/GP/mIM8lObZVyZv
X-Gm-Gg: AeBDiesOTIBSt6lQT08qNRlPHS3CUQ8wtvj9HmVwOLtSct7BimjfyLX1HF30ZiVNJLx
	pmI9jJAig3M1DcHaxryG9NL+zt1K+sFWrv/5T4288N9N6AIKaNyKEzbQWiN+gYxu6oNo0fSUHHY
	XDuPme5GFaK+h4sfuxsYlSSPIR4o6/KP8v2LCODd5d3EfTtZgk2VISP02JKZz1PMjpXtfk174hg
	megyjKnxjhoqcYPfYaS5N5UZeRcVaFdGcCNfybubT9FFGiqn8Zsc2ZMbfv40ss2iqZuf/N3Op36
	N7+VN04U8XnsrL9blvoRe4dJaVNUK0qSfbBc3/UjqSezApWnbBxocpzpKYYf/0CtUZQrXwv8kB7
	EwXcq4bVBQc4AJ0U9EstRRmZsasXLRbG9eQ5HSx877wcq1MgiB/Stq3rzLL12HDGAuMmmKoEFBO
	SRYoDYWih5jMXaRmy76OHTyQk=
X-Received: by 2002:aa7:db49:0:b0:670:8b30:a897 with SMTP id 4fb4d7f45d1cf-67c181252aemr2008173a12.1.1777827405545;
        Sun, 03 May 2026 09:56:45 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b8579891fsm2713649a12.0.2026.05.03.09.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:56:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 0/2] power: supply: Add support for Surface RT battery and charger
Date: Sun,  3 May 2026 19:56:32 +0300
Message-ID: <20260503165636.216257-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for Embedded Controller found in the Microsoft Surface RT and
used to monitor battery cell and charger input status and properties.
Controller works both for UEFI and APX booting.

---
Changes in v3:
- fixed i2c_smbus_read_i2c_block_data read size

Changes in v2:
- srt_bat_get_string > i2c_smbus_read_i2c_block_data
- added devm_kasprintf return check
---

Jonas Schwöbel (1):
  power: supply: Add support for Surface RT battery and charger

Svyatoslav Ryhel (1):
  dt-bindings: embedded-controller: Document Surface RT EC

 .../microsoft,surface-rt-ec.yaml              |  63 +++
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/surface-rt-ec.c          | 389 ++++++++++++++++++
 4 files changed, 464 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml
 create mode 100644 drivers/power/supply/surface-rt-ec.c

-- 
2.51.0

