Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0373043B2
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231645; cv=none; b=mAs+mNJSdTi/uG1A3HQNpB/feM7qcKeCFA27+UD/zRHuv1GqBNmB8KLR33INqNtXRWMMUaHiyznxg9mTwdTmxuGOHfILsVl7kmIVXhvz2JJasmB4E92fPPbOExKg/9CXlWyCE5kK97HIJ827PKtu1szirCIwDdAt4l0maJGtHwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231645; c=relaxed/simple;
	bh=GB0v1r56p2oKIDWODMeWfe2Saf0feOje1AnHCDa5egc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GShuAXDQnOiEzHbcNaX51n7GQqLvpF32OkGz8YOuynSL/VdAqXGEtm5isaxGndEifmhklPO8Cl/IaJKKN7BaJDEpWGsK9bqWcg9OVZeIja8ozLP0brpofbSYrB4lq2fT3Jaiw0jE3ltAhwwvvcmD3TDKCTJcf79BvcvI9UvsbxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb/xaqsO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb/xaqsO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4923139e940so490545e9.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782231642; x=1782836442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6zsFhyNg4v20o6k8uh0sFiRqoOz/yr/BnKKUxkYNu8=;
        b=Hb/xaqsOYWh00j+By+dzIeD1W39JXmnFX3rygPSF4rkYGobjv3cj7tUjEJcdbGhdaW
         V0TkZPtwXyk8h2WtZbLn158jGAeCb1QNvaPemTxjanJtWM+BSU98lj7aLyEN2AZMEKkl
         hgUARZgbqVXC4vFI3q6FL/ZxeOxX+67EGAlEYmRmJEqQUMD/bObqNy3dO5tJfnjixDcJ
         YCuF/NPZc2lToyBqm+H347cwtfEmWIiwr/i9DrpvuTRVpAQl5SRljeKEN0Qf4yQ/qKyv
         2p6UdMhRlqGRSrW4bsZdqMXRPsr7eS3SfeNWeSJLisKSPjCk4N5JuyF+RjnBoYi3yefQ
         WsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231642; x=1782836442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6zsFhyNg4v20o6k8uh0sFiRqoOz/yr/BnKKUxkYNu8=;
        b=rvak/VDzyjZ5jAlOgkVKF4XUboy7h18bE4yy8S1/q44fFhK+y774ZO6QXA2IKC/2hE
         lL8E5JDZELuZJUFDnCGJwfZiQC1gvnB7VDb0X3w7UVdNDNQq5FAdKqjCQLr4qBcKSGyZ
         i44H/xkSAZVI8/9o3Byehu1WV0qg+Tvu0JuWitA0Y7+KzGWUmKgNZT7lj64gBpRkLysW
         V3OYyLQeFM9UeHnXwxKQA9wHtOns2e44u6VD9FzTEggOpCY4cDt/bkfuo0YaiKvpo2/U
         FA+azjH9wyklFllE1UXH6iC8MlhRwcMNN4Axb1hIA0HXcXyehIPJts7Z6bSvdH0UT3xs
         UYOg==
X-Forwarded-Encrypted: i=1; AFNElJ8UPJ9iwW59wWpRxJA1kQEvlp/tpYZ57kEIzReUGNumNrjGBCvS0hozFvCgdxEVL7nBMQqIl7WX73by@vger.kernel.org
X-Gm-Message-State: AOJu0YxmkFd6OQlBhVNR1FycYSfXcY5VkoZGP5V/1mooLaUkguy7RcDo
	61DQMh3KD2e2oMLRtYgi0M73dovH+MoQOdq7WydubdfGebzkkaZS4KL4
X-Gm-Gg: AfdE7cnoFVw+Ms97KTPFUPb6SNEIIrSrQmK0SCXjB988MCZjWubw5UsC/PjMI55P7Vj
	W2BYrVFxKTeoNKtHG9uPMfltgLoMj2eEnhOgmDf21fBH6zjaBVLyHb8FWFWbsK70G7AHyf9kTqZ
	m0GdFsrDOBmHdJ6iEIS3QmB9Nwm2DCzRmandCZIntyG5ANfeOSOeSHuaV9Td5iZWwTU/wmBu3vG
	t6WYIYGPF/Yd2mnqFzTdptQs8Am4+nQIDapD7OjpIz37ZtVUAdET8475ce4zReHuLJDbHZRmKbq
	n3A0tsV7ThogB4uRYLQNirQyKFKmFgx2iUgn8kgJZJY60Z6XPyFjJS7Mkpy516Ctnl0IANf/88R
	kdA+dVAOS+yD+eq/3DR4XHm4ASlFgvN+nac3LSvvgrS6cnPcgb0rCzSa7Detv+IOS/DX2Zyb9PL
	NpOy8Bgt0ZhBLMU43/lv61Tvn/1v9TbnPnxi9e
X-Received: by 2002:a05:600c:4504:b0:492:432b:d78b with SMTP id 5b1f17b1804b1-4925b35d6camr50930705e9.15.1782231642037;
        Tue, 23 Jun 2026 09:20:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:866b:1811:6889:f05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923914fsm315495185e9.6.2026.06.23.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:20:41 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] dt-bindings: clock: renesas,versaclock7: Update maintainer
Date: Tue, 23 Jun 2026 17:20:37 +0100
Message-ID: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Alex's email is bouncing. Update the maintainers list with my contact
details to take over the schema maintenance.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Ref [1]
[1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/
---
 .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml b/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
index b339f1f9f072..990d287d0a90 100644
--- a/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Renesas Versaclock7 Programmable Clock
 
 maintainers:
-  - Alex Helms <alexander.helms.jy@renesas.com>
+  - Biju Das <biju.das.jz@bp.renesas.com>
 
 description: |
   Renesas Versaclock7 is a family of configurable clock generator and
-- 
2.43.0

