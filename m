Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559744;
	b=tRdxg56KEueIaVnXqJo50fcMnw4f0levx+GFX3admUCc8a8W74juksORHEyjWIBqfg7C
	 CrqUsus1FDrQp5zftZgPa4w8IjOrtBRy3sUSeWAnUKBcr5LmF9xSj9/QbQxoXo+aNs4ZP
	 +yQg4mvnUUmaMbMXDtRlXTQs4q5H09FhYPXi6AuRKfDMHFSryYKnOgoRB+030iaBKnONO
	 Fl6DItq610WZAiu2pUNdKaEawtouYN/usnCGvJYpWrKxDnWjpt0eqQnDuyNjZs6nZk69V
	 2cinnV1jMVNAF2Dow10yoELHS4+ee8xBa3bqYE95tgpcIoVjAqTKQoJfajwPJEZwj5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qx6anf3hBdJB8SU0X3cTGKNeyaZPKU1W0S8sS4JiQgM=;
	b=lD0kB5zI0sJQNPeS6J5mMEZDbwApfsyNO5oQlvkIoW6KrTStKv8E2sU3z7E3TAqVpFk1
	 lW+KD74yZ9cOEwoDT5bgzzVfDv9Nrn8zYntMmfEtU+NqrgDnc+BYhS8fE/Y+hy34gJ5UI
	 PRYH0pdTqQuVxhDGakCmqq6y+SdxmKAzdbeADWvP9hondzBE8IiRmy+oO1oxMX3mCN5A+
	 zrd8q+zkPWIbgutBIyNsqZAGgP2Dad1vvO5oNpUd4b7C97FtcW/iCvpFFupt0ANOtyThi
	 KA7dxNyc3NWLdyAdNyq+G3nG9Bo+fjvnLgeEEcXI+3Y+39/tRL+fity4jUOT8VPyJaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXbDGLQb;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF32606A32A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF32606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXbDGLQb
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e98798cbddso5710925ad.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559742; x=1795164542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qx6anf3hBdJB8SU0X3cTGKNeyaZPKU1W0S8sS4JiQgM=;
        b=uXbDGLQbF0w26QAw6MJrM+Gn/WE9SHb8OtRQkAj9lO266801X+jv0LVPreBz6oz94a
         B92xhj2j1To789uEuSuRZKr3zzsuxMeBmH0dbBnMJnT54gk68b70J1d5rKe7c45aS80R
         Hg7JVCq2OYsF4ORvO93oQGyjExlaRb9HVQBZGLLvF94c9QBrEFXVB16EPcRyrXIxKm31
         vh50ZnIGEI+CSKCCOrTQezfbF6rb160F8KYZoNI3fcxRDUz8kQ0PqGfhBB5JkUnV3buX
         j/5Gy7hNjzBDPzunZypx2PLkuIroU/j8E+codgCOSinm05fSiidcjrrlDIOKtWVWFv2U
         gq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559742; x=1795164542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qx6anf3hBdJB8SU0X3cTGKNeyaZPKU1W0S8sS4JiQgM=;
        b=WSJDWVzQ91g2vvs9b5lhQ+b0A4kX9MVzOL4IFujBGhE0K/ueme7VmerpWHzd8qYnqD
         TuL0QKD7kg54TQ6RaCnrAhH6pS7VmX96v5caeiSeG/FFbqwS24XpSk0N8cANT6qWh9dJ
         NaKiw2nZePl/OsH/k4/NjEoA//gxE/7o7i4BL341KrpZtIOodeRoQROg2rXbVFR7eFyW
         h/UV0BaQpnwGLdJkB3zK5lz9U6iUxdltZG/tfnjWXWhKOamqkyweOJRlgRLZZD4RX/rm
         cz2rXuUT6D+uys8OUF5OekpvbfjB9jC+ddBl+q9/LFeDLY76si3bX4SeEvzDRR44/m4W
         maEA==
X-Forwarded-Encrypted: i=1; AL+hErE3d2kRBn/ey06sUjK1K1OwhrurAfbof8czCmRpmZm2onfBkdXrNm/T8WA5dRxCWLhhqy4gXML2JPFh@vger.kernel.org
X-Gm-Message-State: APuU4Z9eAP5bfnocV4c2LHc2c431jtKyDUYxA9Pnzb+lPDzzT9J06eMs
	f0MQ8stg1cIgCqbQEW2THbJx9BXot6ZAfYmsJL/FLEaOPF3ocEcaUwL+
X-Gm-Gg: AYBFou1nCFRsmQPCgJw4SsUcuW4wro22kFAae/fJBWEpF8gDWPQXMXE4VrGYqFrXksx
	QMTWsq6D67aSSZLXKlghwJ1DvW2rnyAd29KhY/K+PQ0PTQpwF9TJtJv1VTkW0aY+qNriKm4ugER
	aTyXqhgTWE3r1y0kZOjKTYZVXaAXXi+vjW4xMCzhnno1GmOHraKrPn3aI5mYH6DHThFlQ3Ig8zr
	qzXlkQwzu3OJvYTbqTWnSVtYxxyMqJ7FtdCzCmUq+69qwJB47hDfKzuQsjN7H1n/ffCsDQYfsVv
	QdQdRM8po6Pgp3Wa4ul1eR77giqzpAu3XhucMsxViQkyzUJ+G04VkJBikUWWv78TSW6iXLxHY+J
	KT7uTLoESdnSaQhWT04BualQcrtGbM5omyCyuWXzIAPkSlOb/h/+PBTgyG03oSGB2yQ/0ptGnE1
	uG3ZCv2Wtnf1XKYdZD9e09LNobujg9Q9dYzLqlslenEAOovTMce/2nbTketOkAQjaZK9tl+1rS1
	7FSb7kDi+y1P8Yd6E3QwLrjgD1xHX4+czbOU7eKDDW1VndnUAwtp1kOL2LFNc9/DBey1h+HJwgZ
	K6JboshJAFcI+b3f1uvep+gg4klyUiwXA43my2LjLzVePep1vpUOWvipihx+UGUFmX+VivThr1V
	WKiHk
X-Received: by 2002:a05:6a20:a11c:b0:3e0:eae8:7525 with SMTP id adf61e73a8af0-3f7a8bd20camr1630922637.64.1794559742523;
        Fri, 13 Nov 2026 00:49:02 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcce76sm742540b3a.5.2026.11.13.00.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:49:02 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add Nuvoton MA35D1 keypad controller support
Date: Fri, 13 Nov 2026 16:48:50 +0800
Message-ID: <20261113084852.32727-1-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton MA35D1 SoC provides a hardware matrix keypad
controller supporting up to eight rows and eight columns.

This series adds the Device Tree binding and input driver
for key press/release events, clock management, and system
suspend/resume support.

Tested on a Nuvoton MA35D1 board with a 4x1 keypad
configuration and a 1 MHz KPI clock using evtest.

Feng-Yi Hsueh (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad controller
  Input: keyboard: Add Nuvoton MA35D1 keypad driver

---
Changes since v1:
  - dt-bindings: add optional resets and reference input.yaml.
  - dt-bindings: fix interrupt, clock, and keymap formatting.
  - input: use guard(mutex) in suspend/resume callbacks.
  - input: rename error variables from ret to error and
    explicitly return 0 on successful resume.
  - input: remove the unnecessary linux/mod_devicetable.h include.

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  75 ++++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 407 ++++++++++++++++++
 4 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.43.0

