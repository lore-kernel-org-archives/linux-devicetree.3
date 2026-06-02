Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3960A258CD0
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 20:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433232; cv=none; b=ci3mw2q3WDhhJnjKN06/PVFMsfSWNE4zVuiJ7ALlsZl4Suxb1lfeIkYnH6eUFLUN4Bepf5+sD68mseqrBRyhbZdZjZbx96uhpu6UDeVbS1C9IYjq9D9krkcu5qGhBd5HHrXTY3mP6nXSKo9Gn7Hw5/3XXJ+1+hIgkDYvZgXG9Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433232; c=relaxed/simple;
	bh=CH5jEkH/7DtiWKRIAoey1zT04jj0PVsEEIht4C6SGRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+n7FH+m0DOjhEH7xYrrU77qeyAuchuOhO7uuMCDdLj9+7GNIGu5XeCy54sXba/SR3iJD41dNwjwb91HUKQiVpK8BzBuedpJZYwBDL7eE1BEjjbG54JGw4nLH5S9c++4IbW/hvNZ2YPYVR5hzJzsdd7Rk60kOWaDqXbstPtOYXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6byGlGz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6byGlGz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso113119805e9.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 13:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433230; x=1781038030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+zSDqbjDhTQXHHFgjfSwZJRVdEr3LaMQ8oiOrRUKac=;
        b=c6byGlGzI/L1Gtf9ar+6zcEOMhNYYnEVKtZemQPfrsmddyy3ZqBWiC4S2g0+7Fn/1S
         1hrs57BSxXWA3C8uv0T5EbWiTKIo/reht++La/ZvunOWjug+HrOi4HOq4Sb6ZlGZw1pM
         edZkI8Wt7LsJEl+FHEUt0UNqaRK95jATgW96i511dlaAxemjb4oSlfrfG3JeRhVvQvdQ
         kOdVzmp5O6n0QLwtS8GDjqjDryqOJim56aEW8sA2BshAIJocXNdBAdHJ5QXtt7zeWomD
         UPdaq27rjUVoKMJnhh6vbPzIF7uuLUBtAJM3sL0brOZVNK5hpZ0xYk/xsuwSWS/JTdv1
         badw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433230; x=1781038030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+zSDqbjDhTQXHHFgjfSwZJRVdEr3LaMQ8oiOrRUKac=;
        b=KzerM5wViQN7bP9SxVwpjzWs17xtOYghRiXI/+4j4M0DcUbVAFlkORLt0s8VlF/RD6
         mYkOrXsTG6gwtDyV+3/weGJTXyaKsL4uKibXTDKuvKUhKLqzXfrdL4ZHxEr/BIw0w1zg
         fvfNhkT6P3MFTBuYG76tON72P5RhzZT4VgS5ehboG1US9vgH0Le9BBBflpl6NW+/is7j
         Z6zk5gRQVwgaV6FU6EH8LFehlGhf+nlANn9UIdIfcUV7bd/t9jeG6E3EHo4/KBoqsM6c
         0IIJLDg2IQsWl3MZDoXcbDmRPWnZRX58uJ4RDkB+jEEfnvnJRApW+YglhvqIfdmQzWy+
         B1IQ==
X-Gm-Message-State: AOJu0YzSqYa/8XEKiIK4IWzQlkO7BdTie8B+Ga3HdrLwHtC5lgAeyc80
	YQh+0qnbRw6Ym+KnYa4Ywad3sr+Gh1xI7ac3czPPrJkEi4Y6D6gC+A8x
X-Gm-Gg: Acq92OEsYsVZV/i9u0KcLupV3xrDLRLu3NIWZg2H0sTRtTVWKyxBu+1dwkHiu8cQwTQ
	yBopdd3evdqr/60sV1CPdMrHd1kwwxmnd+AkEuJV4gweRggbrzVr/sIyMih3RESwlRK6kWZR4KE
	T/fW0WR+cyShXwWuWfAqeln34b0JbmEa87oyA3UUF2gdzPOsiRHyBZiuiQ0mXXDtZKC94L5iLUQ
	HfKYAG+B/C6kqb/hRlw2dt8xy43vHl6jnCeyUzcfW/8XrdpXmjkaXl6GVsXJYZXYkUuz2eZDr/y
	HRpiMAi70NNvC4CB3AtGTwM5vdbTOw8yKVPIvLPtHC35n2tYFrKbYaYrvzumPEJCXHZE0tjEmKy
	ZEATv6hQ92O08u2f2IKBF83Dw+IW8RZOpnhH5VnfQuRO2o175LCD/n62xOEUn9oiAPbfvvA1+NX
	7PzxYw7O9c7dBgGZDk1NfcQ8/uL7KELEg9TP/+aZTJ0ronOP/AfUS/Ma1mF2nfBreKGi2KhneaV
	k7eKZYHeo8gpvG30BOVx3W3GMLqBs78oLOO7IZkIqNu2hJ2EQC9Q2tp
X-Received: by 2002:a05:600c:5288:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-490b5ec053amr6618515e9.9.1780433229685;
        Tue, 02 Jun 2026 13:47:09 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm1957833f8f.26.2026.06.02.13.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:47:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add PCIe support to RZ/V2H SoC and EVK
Date: Tue,  2 Jun 2026 21:47:05 +0100
Message-ID: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds PCIe support to the Renesas RZ/V2H SoC and enables
PCIe on the RZ/V2H EVK. The first patch adds the necessary device tree
nodes for the PCIe controller, while the second patch enables the PCIe
slot on the EVK.

Note, the driver and binding patches have been posted separately [0].
[0] https://lore.kernel.org/all/20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057: Add PCIe nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 140 ++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  18 +++
 2 files changed, 158 insertions(+)

-- 
2.54.0

