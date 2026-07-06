Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276CF3A75A3
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349317; cv=none; b=e+J4c8nlC4w8lT/gMoQdlIwFyqbqAsAW1qeTx2ClnYzZZiEx2XdVt5qMeKiqSXe/KxK7timUQ+ERDYWdrxgk79Ep6avufSpIMZAGeDZXxhgamxQsmj1CBRiVFMLE8t3CgqA3csCeTQ+rWEv2RUa3z1UwIdoyQLQ11RhY/zLukSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349317; c=relaxed/simple;
	bh=GWx5FgcRD+mDpPY24qaILY9TnVMQBFze1SRetKPUeC8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CcXdOHEYai1kX92qFKDJwjQT3Rzvw+QW5V3LXl21p7HNPCSAq+0Ua9PuWpyRLPPoqWKZKtCXT7s/4hZ8cj4m/il+M2l3jhoaK3KAkYtaG9Q95+gEFd7yiCsTDUfE18NLboWlmhfup+fxTQ4pd5Y0IO/2YngKZyOrbaVVq63/RQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1RqDXgx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1RqDXgx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b7612475so29265145e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349314; x=1783954114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHFkYHWOg5pdLelSKYNCUHTqMpEtEJf+wOe1cZ/5trI=;
        b=d1RqDXgxNaLMXNaaq+KXe+Ofnj7OQCaapnaUV66M2hByZv6jtuUJ4zQ5BwKJUROfVh
         J1rCSaZJYEyGv8tR22y6JYIRD4YdyqQ/oe9Rsf3lxd/qeXudqMufPaYcmjVv76JXIK/f
         +4SwPtg4dEaLcXjNFEcKYUbIAkLEmeFJNRZELQpgQm77uY4YS2tqh4qDhm8GoWzAT5f2
         12+JhzrGwVoZJdpzPvIxThLAS721yfgy7kNRx6FNrS1rnP/1F0lXK62SaKa88bN4ygFe
         SIMuI8rrLNwfL/T2dOzCv2XIqh5Fnwi/tPgvCE3vHMRErNmoEJ3SO1A5ZD/+C70iWiK0
         QFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349314; x=1783954114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHFkYHWOg5pdLelSKYNCUHTqMpEtEJf+wOe1cZ/5trI=;
        b=eoIL1SLL8OaYgv4PzxX//VlMk5m6pexzXTM8TLuQrvogwfskOpVI4YxpmURQk2HDGY
         NkFK8zgFtV/4yfqYfpkRnKo5lM7iH30BuXQhN58AuMDoVWG8ezneLZFvKkr5qI7DIfXi
         bLu1YdpDkuMAixfu61mrb6fdmneZnAVHX/9lTv3EuJsroINdGqZK9Iybp0+WyuVvPJif
         4xv5JT4sZ1+BV+StG2v8dpnyAoZSx4GUolVQ0J2NTtWJsDGRSNVJBIxsNAlIGMY/P3Dr
         rscz0tL2z6Ll7adMXC5RHQr/U/Zd4t/0K6MPCuhZ/GySdO+7zQrLDBYn6aChrfR6L7gd
         p+5w==
X-Forwarded-Encrypted: i=1; AHgh+RoTu9T7tgxIDGFaUN5p++RyiYO0nGpYNpw89jdMh6b0MAERkY4q+zJjeXFj4/yfZT8d1uZwmC+kGYYv@vger.kernel.org
X-Gm-Message-State: AOJu0YxQaYszziASzZbYg9LJO/WctyTGy41Yo1oZY7HK/jq+27eD3UG2
	N/LKYVUNo2M9IBwQ8sBWP9uE+vpI7NEpjCDhjoVvVWl/1QHe7UYyujNz
X-Gm-Gg: AfdE7ckpHJDl8oAHuzj/iz/Ci0JBGvSoN4KAcSAj1u6afknjz95DxSLFWnJbfD2Kn6V
	ITLh4iVmjBK+51PUd5BJehD3S+LqkXjnpiLJwVOn7KiXKK5z8YHKqM67/Bk1ykelvYuJWy8jA/q
	xO5Gc5Jgf3t0tCUnRkPu4uiw4O9SzCPcAozi4MTQ88/SXfnN2Rt3uuzXy/2BHx+JV3+sFFfQLQi
	RTLPgweWfIXZKWZjb0N/8pk2cg2Q4ahHBTrrZmBGg+EHajaanRPe6AuLj8WjvpgW2TF9dgD2+xX
	gozr7yEW4RzQAe55p5ldXcrhN4JqKo38M2yAto2RhKKxYm0tvViv156EXotFUEoGQW1wNAHOpUI
	7jmnZZtCw3SB77XxU7eST7CGuVjNZc6RS2djnITCUtQ5zkVhZ9onObchJL12wL/p6C1ih9tciiu
	WP9Q9iwVUmYGI+z+AafRILFHM=
X-Received: by 2002:a05:600c:c16d:b0:493:bd67:316 with SMTP id 5b1f17b1804b1-493df074319mr9805435e9.16.1783349314326;
        Mon, 06 Jul 2026 07:48:34 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm26798473f8f.26.2026.07.06.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:48:33 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v4 0/3] watchdog: npcm: Add reset status detection support
Date: Mon,  6 Jul 2026 17:48:25 +0300
Message-Id: <20260706144828.3517631-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series documents and implements reset indication reporting for the=0D
NPCM watchdog driver on NPCM7xx and NPCM8xx systems, and documents the=0D
optional GCR syscon property used by that support.=0D
=0D
Patch 1 updates the watchdog binding to allow the optional=0D
``nuvoton,sysgcr`` property used for reset-cause reporting.=0D
Patch 2 adds watchdog documentation that describes the bootstatus=0D
mapping.=0D
Patch 3 reads the SoC reset indication bits and maps them into the=0D
existing watchdog bootstatus flags for NPCM750 and NPCM845, while=0D
leaving WPCM450 unchanged.=0D
=0D
Addressed comments from:=0D
- Conor Dooley: https://patchwork.ozlabs.org/project/openbmc/patch/20260705=
140100.1543486-2-tmaimon77@gmail.com/=0D
=0D
Changes since version 3:=0D
- make GCR syscon-property conditional.=0D
=0D
Changes since version 2:=0D
- reword patch 1 to explain the hardware reason for the GCR phandle and=0D
  why it is needed for the reset-status support, per Krzysztof's review=0D
- cache NPCM750 reset status in SCRPAD2 so later watchdog probes can=0D
  report the same boot-time state=0D
=0D
Changes since version 1:=0D
- Modify reset detection handle in the watchodg.=0D
- reword patch 1 to use the GCR syscon-property wording from the=0D
  applied NPCM reset binding update and drop the optional property from=0D
  the binding example.=0D
- reword the patch subjects and commit message bodies to match current=0D
  kernel dt-bindings, docs, and watchdog style.

Tomer Maimon (3):
  dt-bindings: watchdog: npcm: add GCR syscon property
  docs: watchdog: npcm: Add reset status description
  watchdog: npcm: add bootstatus support

 .../watchdog/nuvoton,npcm750-wdt.yaml         |  14 ++
 Documentation/watchdog/index.rst              |   1 +
 Documentation/watchdog/npcm_wdt.rst           |  71 ++++++
 drivers/watchdog/npcm_wdt.c                   | 217 +++++++++++++++++-
 4 files changed, 301 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

--=20
2.34.1

