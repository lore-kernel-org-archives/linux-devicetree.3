Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B70486400
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988520; cv=none; b=Gt4jd7d8cm1hBUobrPUZnvLjzspU/HQSWEeqhBO/aScaVlvitXuo8U3wrHdKm5lNGFUUxElmiHC4k8qeeR+dYomufEXlYrWpIEZH2XoLh/miF0+Z+NzCcrdWFGCAse/Awzpw4+TqbxQ6SFter/ASY8ZBwuithuF38Z82DHgwwPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988520; c=relaxed/simple;
	bh=U1zoqHEzQaVfkPpLFBsMt1Td7qlfJLQuz9lR4MKL6Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jixZZ4ZxMKXBGtO3zdlqHRxWGhJOfVdjnNhABg/f9KFJHznaTLx7wh5PNh2O68uYzU0y0V8MEbyJT4T1LQbLBVUyGg6iyJvXdW9jzLHqXf+5Mcpkhp01XLpL18osLkTfqLePE/p68UIM60AlnJKpRGizZ8KzfFzg1VXBDKH+4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rai0Z5SP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rai0Z5SP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso29113195e9.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988515; x=1790593315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8398NpXiVKPAd2ACHhvzXWJuPnh5bd8fgXOc5fmJggw=;
        b=Rai0Z5SPdwnE/WudB9SbaT5qV6f1C/lcWAmyHAezn6vns96xzGBZ2VQ5Q1rgD21I3n
         0DHmv2YZDgrsjlUbYUPTV7QASwzYkHvKB0X8OQ89/+DSnShAdYmzGR+NniEZa5zNyBi/
         NwJmeZT+5o/1DnF2oZCCSu73ivrowH6QpOLQYlflF6YbBd+c8Oqdoriu92j5xYLv0Hxo
         HRPgDcJpL/Zkh9AR11yeW77QcLodYKvR/2aA6Q2wMtoTkbzJ3pI17OU3pug3hFJW+uo4
         J1TG3fRkYGbDBWkWd/oR8kBeNrYBd4iAfjPr1cQQymKVB4sfbQYbV1uUml6KceieDV4i
         C37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988515; x=1790593315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8398NpXiVKPAd2ACHhvzXWJuPnh5bd8fgXOc5fmJggw=;
        b=e7JTbR4ShSzay8CsU/V/i/BOrksjsquiQ22RAjG4HaAxm6a/9AB2c4epwNcvWYgEGv
         mdiq6Z4KYsYIHkxzDtVkn/tHLSXScJ3XVCY00nHLqQkWhaaYrPJu43gcg1aKWpwHO7Y3
         SjqdbsJrCNadDbWAi2g2tkiAug2fNKS4+X6dIiyP7oTS6QxSP7pilyMX3HH1xZ63Qlsf
         7YuwtIHLghpNbWwgHL9Ll66pVKIjgVz4YBvNc+pI9iY2fMoQsaAb0l/+Nzb8UROMIp71
         jlGrmh5C+ohdEfFq9+I00MiX1JA6QFYuuVF5PfrTMB/7m6Lp7//GhCsjxElS6jq7/YE0
         9kQw==
X-Forwarded-Encrypted: i=1; AKwUvBw0QgTmxSOWVc5sBkUmQota0peCVbjB6AzRjaITCtfTjDkYolXBrwIdksxlz45Hur+PKf83eJ4U0td0@vger.kernel.org
X-Gm-Message-State: AFuF++mXYiySN9yuzqJoTskUaGpr1zB9uamDFhpvOXykk+WAT1kGT6EJ
	7YJVnj3I1m9D/tvQLtJzxuDneZJYCPfObcKl71lFGamewGQq+V/Ri2op
X-Gm-Gg: AYBFou18mlo9kdQp3fgvXGok4KtozUhg0nDNXnxlE3A1xlJeHshiVQHTWdJN+94ctMm
	gVm8x6/DYv+x7n62ibDOdjdOybt9vZoTctKghahCgJYB5X5yKR9WeWZr9fQS8IWSx8gc6Rnce8B
	mMtfLhHP/eyxtzl8UpbMyMw8YgkV9m4tAS4EGQiDpzTzIaclVXupmBhBFuMuX9giFFkEgIet5tt
	hgL9PY65/BxKe3ZJScr04aFK9RJpOCM6CKYL4ttIBZoXL7HfpRjWnfU0AM12FlAqYKRD9y+izTF
	95AHlojXrZnCVFklqeWAjhEcCtOZIn1IhgmSZ7S1S4TdF4q5zgNPe5uP16ybuY9Vb9gZWl8K9ik
	I97/RW6fQ8o6OcbAl77BNh5QZ8DXrNMi7HMvxorEVxYEFfTtiRZg2Xo9Q1i69ExEmZEpT6CGnIg
	SvYaE21eW55P6LRNuPC0bAiVzPZyHJ1ukCn2BTVnMYwR3grMe78DvrI5QlWm0isnZHtyGmPbkLP
	1NdwAEXEVdRy9hJ/ik2fsw4Z4AcmJhrxdRXRA2CyXpfb1reF19Mv39d8WWsHHHNTB7o6yKYaygU
	mybX01w=
X-Received: by 2002:a05:600c:a085:b0:49d:25b0:cc60 with SMTP id 5b1f17b1804b1-49fc5747f7bmr150529555e9.29.1789988515344;
        Mon, 21 Sep 2026 04:01:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:856:ad4f:1ab5:71b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bc34sm214267425e9.10.2026.09.21.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:01:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Drop unwired ADC interrupts for RZ/T2H and RZN2H SoCs
Date: Mon, 21 Sep 2026 12:01:41 +0100
Message-ID: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series drops unwired ADC interrupts for the RZ/T2H
and RZN2H SoCs.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: iio: adc: renesas,r9a09g077-adc: Drop unwired interrupts
  arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
  arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts

 .../iio/adc/renesas,r9a09g077-adc.yaml         | 10 ++--------
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi     | 18 ++++++------------
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi     | 18 ++++++------------
 3 files changed, 14 insertions(+), 32 deletions(-)

-- 
2.55.0

