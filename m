Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C585333D4F3
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573880; cv=none; b=AbL4MJNXqA2rW5Y9f5eOX5EHnxh89PazES9RoPo9+HpQWd2CLMOQ0ADx1I1E3Z4oQxCyJyeNPlSFEFj5pf9eEw8AK+7hTi9nSbx4zHfWnD6n0F2NZmaPzRP7uHm/oCJ0UIsoykIjUfdkIHBHczoo2BYKqo4XO9JzAn1OtWkxmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573880; c=relaxed/simple;
	bh=cyqmsmFaUhWO0usCsRhXLb1p8EfZ2EfkZtfAQtdHSG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMcV8hEyoCxsE/4lqNvK5+BtHVma7jw35vbCQMchUnRTsP6oaGZxF8MK96ocWS20ciicerpMAO/f8Yxwr24bunPJzZXt+sEm2CcmbsvBFYO0sGLUbluZs/syo8kqJZHRZDGKfmp+YLnqXl33vBew8iN1ARhMDhdIp0S6tGNq4z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcGu+MWK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcGu+MWK"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso5419753f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775573877; x=1776178677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2khtJu6y4LBtKzkynEVHeXEXsp2G3dQZozt2yDEDQ5I=;
        b=AcGu+MWKaxBlR9OCuaRg/7FY7dedBby8JeBdw3lXPsl+7J9IQeRFcI96xzHyd3rbOX
         Sp+Pp7Evcke/1ZnhMNLq1M8hAe6jD9GZb0N7uqHadPus/OspDp4N/Vj3Lsl7famsIb8q
         tln/3snA0MZJVlTfzmYD33emyfNcZayHPSVrLHhywnNGFOgkB0pZOSoUHzNtdWiau+iX
         s6KIapwhGmoJ387YqVtSmoY9PuhBp49gmdTBZQ60PWS/zN09gXYLySbmHmqLmxJLQ8E3
         ZOX/38psK82LqIUX+JPUDocBMNY5ESGhIbjmkEbL6AUA0qaneI70yFhjUJI6zmD8O6mp
         89vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775573877; x=1776178677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2khtJu6y4LBtKzkynEVHeXEXsp2G3dQZozt2yDEDQ5I=;
        b=Kd9KIbMrt+qkfIlhy3ZzLOknjMlq3GVC+mNJ+xsTuOqVdZA+rhaVyd+1HRNoLM5aWP
         JwwA2WGEOUkKu0Hb7MK4gTMV0QYBJMjf91WQdU2EF2xUBMy8+youi+jrf3DpcHBkImJ0
         Jo87Qe5YpkLuj8I75h5Tk5+cAu+bWa1jS601r2LaBlGhGKV15jU0U6FVI/1RuBWxsTdH
         cr4uBb4ifR8baKTt75jHCTa1wCenADwVdSE8GXXfzgHeY/kQpRPrshy85uyrTjkpaGJZ
         jXw53UCWLTYtesM3auPw79tv1T/fCQFWeqK5C82dCZraxaYob5yZ3tHS3jc6Qpn/tyBE
         yRqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDTJ3UBScxhad3hj3RM/yF9ESzso1Jo0J3VbDUpA1yPImdw+ARgcnnhZUfIYPd2O6qDL3OMO/u+aaw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtr7YGJGQGgJgZCKnm91ygQ9RSwgZt1wLSjw9nHjveiqnpNmX6
	Pxqp9fn86BGfaXqb9tOTM7A0OF+2AWECPxpJmcriyvrH+FJPwCIzrmJm
X-Gm-Gg: AeBDiev81cled9rHXgs2Av4XIi/qk8TDbXqKWst52GCx6twWC/RZ9qvVzHhHElKb7Z1
	0oQC1W9YVo/gGfyPklaoJvy81VvY4MgPWxjyeczu0PbOcuLzZWuejcSnHHwTUI3YJVJKM5Jx3uU
	lpYIV5aDwLmCQvEzdfMEfWTkvvpe4Th2fDFP50BrPgryqaAcvueW5LnHIkzeg1w09fkKXyV+W7d
	3YSzBNC/6z9qysx7L204W3FYIgmLSI4f73+DCTMng9YtihnVlybPxRlb64wytLEUDKw5MRWkpQ/
	HgstRZVlEb+9GIhS/aXl8WswQUJdpTuMTkROCzalrrcLp5OHphCDaipITJSobcM9vy0qvxYuvx2
	o2hBkGy9FYKvFrWfS77vR6Gr3XZ2fZieqhpIY77FEefN4VHEuPcCQaSzrUUkAHe8Kvde7CX1vJG
	I3Zhz198eueAojpZZiR7nUUnwG1RD2MrOFW40tDmk2SGTSJwh6
X-Received: by 2002:a05:6000:401f:b0:43d:2be:e4e with SMTP id ffacd0b85a97d-43d292ff520mr25307993f8f.46.1775573876941;
        Tue, 07 Apr 2026 07:57:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3f9a:11a8:20c3:fe58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm45207018f8f.9.2026.04.07.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:57:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/2] Add Renesas RZ/G3L RSPI support
Date: Tue,  7 Apr 2026 15:57:49 +0100
Message-ID: <20260407145753.101840-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series adds binding and driver support for RSPI IP found on the
RZ/G3L SoC. The RSPI is compatible with RZ/V2H RSPI, but has 2 clocks
compared to 3 on RZ/V2H.

v2->v3:
 * Added ordered DMA names for the dma-names property.
 * Dropped the tag from bindings as there is a change related to dma-names
   property.
v1->v2:
 * Rebased to next
 * Collected tags

Biju Das (2):
  dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
  spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)

 .../bindings/spi/renesas,rzv2h-rspi.yaml      | 28 +++++++++++++++++++
 drivers/spi/spi-rzv2h-rspi.c                  |  8 ++++++
 2 files changed, 36 insertions(+)

-- 
2.43.0

