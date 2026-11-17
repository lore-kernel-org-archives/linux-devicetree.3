Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912213;
	b=pPCXynujZ7rw8brgbI38uSXtHXuhWx+y0H2zc1wm7X45GVwQ6hmamLgufm7qtjZtWptv
	 T+zXLJboN1VCLwIKZVQUCHvUPOrwmNfEsKkaL/BquRWqX4yArI6KvFIQ9UkZg3yMEyVSM
	 0N8clT7BB5mm0/lMCI5ffgVCTwZ4wEBZLGJRsvg3eLwrLAi3wghvaOZrGoZ0G6PhWVI0E
	 qf3RoiIiu6KvLWR/twxFPa4KggbtZNsvlu+Tf8sasE8NbBss6+x6+7VptQAc8g/5UIdtE
	 C8aiWDpC5n6RZmLokL4lf8r+eZJ3TZKB6fVtksmbCJ5smZU0wnm0rxErr/qkp0ct0Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fWKlG9ut9OnjMEtwMHS/T3DByfAeHsUx60jI3HbYtPM=;
	b=eJGC7BWRNwXb7XVDSJoA4TQ6a22FXq5+Wh1SpeE2lYQ3/d560RfXSQhc4GMPv05kMSJ/
	 9uQ1q7OjUwppHiE2wafw/udCivcGVbYCFlNpCAf8hNT42GKZ8TAkfHlkT4hI/bCBA969I
	 U99cQL+scEXrvlRgl0mHnZg1Ysgrz9R5yPq+DmRo1d0cvQWY/U82RqhEg4HIyxEvxGksQ
	 c1MA+rtIEGapDSTDhc/eQZMzqt8RXryUHXhp4rDrLEqnJPUz7Mn2g4fR5+S27MC8eDxMm
	 6r/OqRbL3heXE51PCUtf8BI5UuvolgTdntZDqupyDXTj1prE3RdzaEy3kg7IEw3kU5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAnPmUwK;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B251606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B251606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAnPmUwK
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so5428595e9.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912211; x=1795517011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWKlG9ut9OnjMEtwMHS/T3DByfAeHsUx60jI3HbYtPM=;
        b=QAnPmUwKicRTx4iRInpZcqPhNbEAaGbB4dWv9Evoal4CifofIpC6D7oUbrgXVF+6MO
         joZGzr6V/UDwuCGmlky5/aQKoVaMeVuu298kOV7dQdv0ox/yWFwlHheivp7PtqAuXhOo
         Ou4M4a5/AnL0x0L2HRDIhN9b5qZhyVspQbyd0bXKE53abcuORMwgdu80RTT3EwPQwwW6
         wIU7cFLLlraiUQSvOBJ5DpLsJ51Wh7NWwJ3UmOGIVesJOO/gXcx5cqELSviO70/xi/BG
         y1WknTjvwugybOPGG0ovXe2SupMjJISN9Mr2+SGkB9wGTQFvMSUTePlTM7qabndTqJCD
         b24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912211; x=1795517011;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fWKlG9ut9OnjMEtwMHS/T3DByfAeHsUx60jI3HbYtPM=;
        b=YXKLypBsNAH2ZnxC0H9eAbv5qjK8+TLGjw+V/SxhXnHhN2PwNydZsXIco6CA+2VgKJ
         IQasTgIAsq27Tx+AUf4HL0a7vLXuaNjLRnbvHbeUYNFAlYrGNf6dLQpLTrMfqSoa3j1t
         dif465cQfycYm8n0Vv/ECIkfKbcPK01ItdAhbu6Sfmc7g1QgmA53EJOuyfC25/Wp+AFs
         AS9nhct1jzM7booMJq0Xa9OZjRgekkCl3StSrBj+Wq0SVRHQgKW0mHasMXNnFu4vs7q6
         4DrKS+Kayyb92iucrLNoNG8PbAmIVlgJNYOm58Y4cD2ev3Lemdd1LXzeaf2wYA7rr/Dh
         HeUg==
X-Forwarded-Encrypted: i=1; AL+hErGnP1Hp9VZ9Ser/l0LOimbY6gf/eBK+Hda1/+u0MYtnEQnTx8aJsLDaMNTuJv3oGl02o+WNPIfaHuqP@vger.kernel.org
X-Gm-Message-State: APuU4Z+uCjp0kmcAed1x42JlmGqanLqZBjIaOuxBsBOZabYaZOI7agTk
	6WZ19cj9f8SdFMXb4THKnPD7Qdn3KpDzw5NBCvZukdEDs0hY8fzlyOhf
X-Gm-Gg: AYBFou1NUSNIvYtQAnPSWcp9BxogoWwny9LtfEB8pdhWymoz5DXacLsLtDk3N6f7hqt
	1a6XtwNMLRBdeDJp7fqH5f7Xli/uBf2x45pdtTzGfEjzNDM3OQJ9gIUIvMGXbUYzFH86rmF3ptH
	qrHnTEA0jm3WgIk7trlpy9rl48azvSKDivD2ZWDTLv6QPsQLarocY/Bs5KsU9U5tAztZQTIh7b/
	lVA76ASqdrOmN/h8md7Nj1ZErDKvbukREGgGQQ73RJYhMmAoE5tVPK/aYGObC1of2hZP1lfdYb5
	GGDoKdyXS0q4jKZDGTUP5eAAcMBco/qS9pKz6bG6Qt7rvEb3N5yI6AfuRcQ8vAb4WTMR1LBsg1F
	X+VF5023GhDlD500j8LrSynKM2kpbtKUmsCOEazkhUr7ZSmBt89yVwBHM3apnApBEjHgMC2jkFg
	lUsyj2pu1sbCZg/D0tGxB+v+LtWvGj7V9v4z8uyyXjc6a0UftuuTX9PXQN6Sx4kFXVdvi7WnDM9
	6dqi5MLCcIjoEw4/gJzhTWFfGRIuxjrrs9cBMLOfSqdiwJ1jZFeVdHfGNfZL/C+hL1wRZ/ljClW
	GHu3S8ipiMw=
X-Received: by 2002:a05:600c:c176:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb7837a1d5mr49452725e9.5.1794912210884;
        Tue, 17 Nov 2026 02:43:30 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm61091805e9.15.2026.11.17.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:43:30 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH 0/2] power: supply: add standalone S2MU106 fuel gauge (Samsung Galaxy XCover5)
Date: Tue, 17 Nov 2026 13:43:26 +0300
Message-ID: <20261117104328.1176951-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This supersedes "[PATCH v1 0/3] power: supply: s2mu005-battery: add
S2MU106" (https://lore.kernel.org/all/20261116074000.355176-1-tadilhusrev@gmail.com/),
which I am withdrawing rather than sending a v2 of.

That series extended s2mu005-battery.c/its binding with a
samsung,s2mu106-fuel-gauge compatible falling back to
samsung,s2mu005-fuel-gauge. Sashiko AI's review pointed out that the
fallback is unsound: a board using it binds through the plain
samsung,s2mu005-fuel-gauge compatible with no guard at all, which
still exercises s2mu005_fg_get_voltage_avg()/get_current_avg()
against MONOUT registers the S2MU106 doesn't have, and the resulting
garbage current_avg can flip the reported POWER_SUPPLY_STATUS. Patch
3/3 of that series added a has_monout flag to keep the S2MU106 match
entry out of that path, but the binding still allowed the unguarded
fallback, which is the actual hole.

Rather than patch around that, this series gives the S2MU106 fuel
gauge its own compatible and its own standalone driver. It only
shares the S2MU005's STATUS/RVBAT/RCURCC/RSOC register layout and
scaling, not its device-tree node shape or its MONOUT path, so there
is nothing to usefully fall back to. samsung,s2mu005-fuel-gauge and
s2mu005-battery.c are untouched by this series.

Both patches were drafted with an AI coding assistant (Claude Code,
Anthropic); I reviewed every line, built both (arm64, 0 warnings),
ran checkpatch --strict and dt_binding_check (clean), and tested the
driver live on a Samsung Galaxy XCover5 (Exynos850; re-confirmed
2026-11-17, kernel 7.4.0-rc1-00023-gdcb8b91fb779+ #30): it probes, and
/sys/class/power_supply/s2mu106-battery/ reports plausible voltage,
capacity and charging-status values that track the device's actual
state, confirmed across a flash/reboot cycle.

Adil Hüsrev Tepe (2):
  dt-bindings: power: supply: add samsung,s2mu106-fuelgauge
  power: supply: s2mu106-fuelgauge: add standalone driver

 .../power/supply/samsung,s2mu106-fuelgauge.yaml | 47 ++++++++
 drivers/power/supply/Kconfig                    |  8 ++
 drivers/power/supply/Makefile                   |  1 +
 drivers/power/supply/s2mu106-fuelgauge.c        | 240 +++++++++++++++++++++++
 4 files changed, 296 insertions(+)
