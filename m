Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC61113DDA4
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083107; cv=none; b=VqvmG6e4Z6gOFc6YyZCjM0efuR9WjXg+78JiLQG8vKzbLM8DgFK+gDYJj7kf0+8TyT3dzaigigCfSaNtiqruinjOi3GyUzDGQNwrC2aTgc9nigeKyAnZMrCDgKrP1FJNtXnAE4clINwPl5fex/PVo+y5kiqmknaIf9Zs51NUqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083107; c=relaxed/simple;
	bh=+BrTZN7WjIkYYV/ZkbjuQoqqC2TZZNd5QHXxfi1b1O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ld5JkyanftXNcpyObookqTUdFufm7uKtwijVJ1B6LSfA4/kPy1SfNNxxS66XeUVrXTKurjwedPkkoUhgP2+fBXeNJkpeaaRc515tN4/rQ/z5NK3Qj8KK+vtI69CJn7SpN/h8VLzvm0k66nTxtKBNhMBP6z5eVFFnWpChK9WINAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BENxwuWz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BENxwuWz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so35252235e9.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778083102; x=1778687902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdI9Daiia1nMigPzaGMWlZI5mMBjSVg78hSdneCRYEU=;
        b=BENxwuWzcEfVexa+efgsUdenxg2Om4CEtGFbZir8iQKOP4TAU64MU5EZYBKXdyZbtR
         2R3Qm4IJpPbr1T1hw7Qouq2mN6b68v5Vi3dPlJpej8QTPpgfFduteY3PQ1D/XI73k6A9
         1O6r63JlHWbALhzdg2tOZWrdzX0qiDqbYossp2KcethocidwmvK+DvgfwF0eUpzRUXhp
         tfDxA9yoW9Nmt2CAWLuNaLsDUVFTkzmDhJzg+C7vpI7zqa7fHzgx36fmHga7XP207/r6
         JlnszvyWKsbifS/tajTPuIuvQbXZNIWw1PTS49KM6GftpOEayhqnpxEQyvy0khLTJyTi
         zRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083102; x=1778687902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdI9Daiia1nMigPzaGMWlZI5mMBjSVg78hSdneCRYEU=;
        b=nFz95wxLLzFKbw7E04fda6lNblQbvag95acoy0fGiQGZa0QpPULIQi5nwfgo05BYEd
         6ZJwfzxRU8KnW81sJVupQ9sBrYKXXAMT7mbliVaXvszIbeJzyofsgSadWZVAIfAip/H1
         FsWcCVKE9hv+LfhO0/r+HgLYa9KeFMazFf0hNrthUlCR1ifn/qalTIZLDCKFSNMUxxWy
         OoW5VoM9w/oiBK202WKVw7YdlGgmJx52MDlzQzm/p3hQRWqodFhs3ctNNwzZtrvS9MW6
         MHX6trHmUxI31OUtu8WvHfkXjSq0b60TK5NSeP2VS6hkL6DKXaT+UL+AEPb1Q4BjD/Ol
         OWLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xeGHUe0QlnPlCHQkbb3bxDcSWoV7qsphRazWkLqqkQsIC5Qwxa9JPZVQg3HhMdEYxziwXKH+ED5cu@vger.kernel.org
X-Gm-Message-State: AOJu0YyhM9KT970rN49uCfJieM36gv8eG8+dwaSxnKN4zOofGc2hm/k+
	AyfdP42so7dFAWeBE21XsptdloA062eI1LLhIEb5Rxu4NsiCWlsddJsXvJlXLDSl
X-Gm-Gg: AeBDies7e6lJ7zQz7q6RRPG7ZNLVCo6TAQzOQYi6KI3DWStm26/MLq4MfdOu+P1Sf2V
	DLRgMYikLHSCXo/KbsZ98naursH97pjwijpVD9p+O3YsoBxMFr5PzoAhkZMuKdW2Q/f4TqwRJqf
	uWNBdsETFIMVyokaEKVbFEHiTfRf4sad1SJPQdZchC2pDrfZF//7a/x/XMdL95Yw5R4eXLhsD9a
	DCN/8ScwIAxRhNdiMyZPIObUKHI/w3/prQCanTCM1w4pjZdZlRsXTJ6KKQjS2lDMZh95Jqvff77
	/OmZbfMxvqcgyqLLwNDNvfq+OlNMzDxZiuO+1IzFZ1SNQ+MB1TaQwEREHYLZPoA8CqoJNree9nI
	SfjT1sftCBzdlIqdJ5Z2DrzHAoK8Z79rw4ovMTn5Hr3zEHvlyTcQY7eN0x9M0clQPOkAcu+RNXe
	tho/C1svcNo7GMdCBtLWzFtAiXD96bdpoapXKfwSMwQaw36hOtUVNWVcY9YVeu7nqMui39zuQmV
	aeI4YoRrvXDr8vKqXNPXB8bOG/t6XCTyq6D2NlQ8RsPWhSKXR5QYVrNAQ==
X-Received: by 2002:a05:600c:a10d:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-48e51e1f013mr54008455e9.11.1778083102203;
        Wed, 06 May 2026 08:58:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b2039sm21345205e9.5.2026.05.06.08.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:58:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: rzv2h/v2n-evk: Add alias for on-SoC RTC
Date: Wed,  6 May 2026 16:58:02 +0100
Message-ID: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/V2H and RZ/V2N SoCs provide an internal RTC, which is already
enabled in the device tree. The corresponding EVK boards also include
an external RTC integrated in the RAA215300 PMIC.

Add an "rtc0" alias that points to the on-SoC RTC node to ensure stable
and predictable device numbering when both RTCs are present.

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add alias for on-SoC RTC
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add alias for on-SoC RTC

 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 1 +
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 1 +
 2 files changed, 2 insertions(+)

-- 
2.54.0

