Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936680;
	b=YJlF0hGOMGJnpPbgz8wPC2AmL/HAFvpOKYSs+VAy1WTzPuhJTeIO34xXgKyUzvNzyxQN
	 7bQZPLf1lO9A/VUZ4E3LOKRNoCvz7soutMdd26YaHrhZNE3axew1edMKOSvYQfQD2XzFs
	 1c+ymuI9BzPQOeGAtxiITOFVCXIDycT5hMEsy0wZwgX33Er8KTlCP+0E8A6y3sERn4xql
	 PIEjBoj5L7PfSiiIojVAATnm6Xx5fldllTS3F23ZnYx4V1MI1Rj7Z56ikon5vrwnV/Nhi
	 O0mHFte0WK+HqOBC2bTHZNJqs8Z1cNrPAESsVal/IErIK6q5eauY+U0AWHZebrbgmsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=;
	b=XnCw3uRuhG4KbRJknh4NAs5j+CZDMlExQr2VWDnESevlmhaHwrsC8IvywcsAnI013bti
	 j9iRkeVkm2+mx+6pe2WRFzAyyandXKH5CLTuj8hxxKcWSpuFlUpcYWwx4qaII0+LFzLV3
	 egEBmO9KI/EfCzQ83faFdEbcEZ6PWpuymsG2UMv5g6OkwnASN8dqhjI3pHEVM5FMAVtHU
	 SxbuSgvIYb5YwJz+RZ3hdS+8GlPpix1z9GHmTCZhMp0Tp0rIFI4RzWO2Kyy0VJsXp/jqm
	 A/bKG3cwkKfqwquNhevofDssXPdYJHT8jzJpHAkfabAh4Ugsb4+oqJJP3BSPs0TbhTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=B+kqnD5k;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62086606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62086606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=B+kqnD5k
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso2132375e9.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794936678; x=1795541478; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=;
        b=B+kqnD5kc2/BWpvolwBTSXR+Bk30wcbVAY1oJgbgsqey66UMmoa1kCyF1uR+ZYTfg/
         p6gvAkNR0Do2+bYPWMRwa30Xq/6vmJTDsgGVQ6Bj1wpqQFJP0uGBD+m5YJJuuWMhdQ4F
         mrQxPa3IUb6qWkvi+JMaIlLR06AagJpWF4/iHrhn9Zo0NEnImEEKnUdXsWHjWosjR+2c
         NJXdstO7aIKGsn5HcMGfOHRSYjxr0t13YSYHX4wOD+pTQFFnttjp9N8DoxQrnsPdCWfL
         Y3vEicdZw3G7xQyw01gKc50M+7jCi0AV2pB/70TPYsd3wsZPCsBvOiMitoXb/h72tiud
         44lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936678; x=1795541478;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=;
        b=0xN5NC7anNrnONyVfl2EafaEFLxEmGP8W9Iomrg6qIi1XcprVDFjtdBhGOtBW+IGPh
         2dliGmvN4Go1uw68nc+RY14qBx4yxzC3dKKhEKxNt1Oov2bavLhW9UNEyBciJstua3Qe
         UKXABqFOcv8SFVdP7bUU5GgbEfCO32RqB8pATt56Oag86ctej0j7j1w3yXad/FGkaXMC
         nKaKob+f0QCXDdkJJGMM2dNNKWwsCR5+XuxO9gNi4XmZ7U0zNLSR9llZ3bQoUj2YqSUw
         v7hz7Mj4mLseIIQWKhGBsvSbACw3EX77PJygy8SgFmUaIJYqKKp08F9sN6kqLIM4qU3K
         Vr1g==
X-Forwarded-Encrypted: i=1; AL+hErGk3lbzZLZEJQVr82kw0Hz5m2QnmHBb/bI1SmMcT6UdNBp4TMRr3X+GuuT4sPEE5e1hDJA5vbZWDhWm@vger.kernel.org
X-Gm-Message-State: APuU4Z8//TlF7f8OB/tbFCZlTKEh8gEmrFKGP15HjVwzVdpxsPx6qapj
	4di+Noq9NAV3MD8Cleul/iud3rhutSQn9lcAS5/52pDSoYaqomlgqlVZyBtDTSHAHD8=
X-Gm-Gg: AYBFou35vEjXaYAdthRFdAOwQ1NnjLJyUD2hcfWxyAOYCGZ47gblEb0Q0H6QON8c+ec
	zw3QIvK5dn2rhalrIJiUnejL7tppUel9bPm0e7o+hHFmF7MJ8MCOBJ/GSxijhLtS9t7t9m6vf/F
	bln6tVBaeZh/GI+jijdlS2OKOjRtUpHaycn7syqn1UqOypgtwr9bgZh/O8griEvnGvYQ1ZsBvv8
	7WDKfHHWp1hf5pojozdva9Yb7uxoY8BZK3iq5OCjUvpOk5ztZOlwQHsjWVxFzW3yH/I5NIdAP9A
	HVHzHXdxCjqEy1FapXV4AY5ATD6SZc+qLcnx1JuMC2OHbuTPLpbqP4caDt2MAnrpW73JyV+E77u
	jIrGHNMptdG/L3NwMm98ay43D+yvabGY82BGGD+l+UXS0ubzA8pknoCZKdwzJqqLG9KlfDc7/JW
	3f0wxa9X+YmgQIwBh+4YkNoPlm4FsFl8YOSq1CO3LTkpIacsVQ/BJ2GEIBkxnTEFquKqAM/X2Uq
	yls8TIQbgSHolRAGnFVBsmRt1KoHaAl02fr8YIRU7nvNV4vX0FYAkrF2m5N1EUo5Pm5CcHiJy33
	s+NgtfZYAnw+HTlZZT6HgNUq8LHZ3Yzdnnh3fLnaf5b9bUHfnTPv8CAc
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb6a2db52fmr181094395e9.0.1794936677610;
        Tue, 17 Nov 2026 09:31:17 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm46870735e9.4.2026.11.17.09.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:15 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] Add MediaTek MT8196 SMMU wrapper interrupt controller
Date: Tue, 17 Nov 2026 17:31:03 +0000
Message-Id: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFeP/GoC/y2NQQ7CIBQFr9KwlgQoUOpVTBcf+FVMaCtQNWl6d
 9G6nGTevI1kTAEzOTcbSfgMOcxTBX5qiLvBdEUafGUimNCc847GYnivaY5xpa8Ey4KJGi+Y5KN
 ArRypyyXhGN6/6mU4OK/2jq58U38j4WOtd+XQiIWM1M0xhnJuACwTKPuRWSWBmbZDZZzutOJOg
 vXgObSCGTLs+wd5W3VKwwAAAA==
X-Change-ID: 20261117-mt8196-smmu-wrapper-8d2041f2e65c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

On MT8196, the multimedia SMMUv3 comes with a MediaTek wrapper that
merges its interrupts into one GIC line, which stays asserted until
each of them is acknowledged in the wrapper.

This series describes the wrapper as an interrupt controller next to the
SMMU node and adds its driver. System suspend is not handled: the
wrapper and the SMMU lose their configuration if their power domain is
turned off. This is to be revisited once arm-smmu-v3 supports runtime
and system sleep [1].

[1] https://lore.kernel.org/all/20260929034510.2023173-1-praan@google.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      dt-bindings: interrupt-controller: Add MT8196 SMMU wrapper
      irqchip: Add MediaTek SMMU wrapper driver

 .../mediatek,mt8196-smmu-wp.yaml                   |  70 ++++++++++
 MAINTAINERS                                        |   7 +
 drivers/irqchip/Kconfig                            |  11 ++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-mtk-smmu-wp.c                  | 145 +++++++++++++++++++++
 5 files changed, 234 insertions(+)
---
base-commit: aab02e49f0b54a0837e58c67651c4abdad1a3208
change-id: 20261117-mt8196-smmu-wrapper-8d2041f2e65c

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>

