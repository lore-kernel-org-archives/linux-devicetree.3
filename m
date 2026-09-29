Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062A04F93C5
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677730; cv=none; b=CtGhg48ciy2t5F+1i5jTSPoWJYdfNKvOZ9ZpnmNNly1FbxiGZQzjR5DHYqP8IA1ZYqbCTj7sjYeRY7MwAlql7p4Ld0h9Uf+hIha8TasP5Ay2Jq/xpSdjaSqvDNNtX/OHpzWT7cI+PMLE2D2FbUjgOSQjG0bfzhjNv4S1Q/ndkpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677730; c=relaxed/simple;
	bh=nD0jQ0sanXtfhte+cS4Eb6xgGbAdsdiqP+FoF7tBRHM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k4rzqIDJdhInXa7+HCvyycw0CVnBcqMEjrjizk8Tn9VMcb/NBSVRWNM+s8FTLnpz8hnYyzJ9Q/WS8735NG4WFMNCFb2tjRcVqGjN7f73erEr2qDITP1a1sZ0AhY5DM1/guTWmOSeV9nLKtZe9eu94+RQaq/+sNoZk8CFdA7f2tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=86AxwoQj; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="86AxwoQj"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so22708605e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677714; x=1791282514; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OjnLLZEy4NZ05RWw4wcrVNfIfzQkE+4cewTuv6QJdW8=;
        b=86AxwoQjp8tyrf2rh+EQ/6k0rZuE6nFtpDLR1dJRe+laj2umkWNcfzBMQEZLMdNnkc
         AtYlntrifj20TwAzWMaLfWxTrW9+BMDVg9PSWo32cxAO+PjIBQJ1huKgGdeQBVJ+iLm0
         MJetV8cwW1ZyUVONHG/7NEPC9xieRWcMdOQ7D0vYqbM/qXOGQNlrv374Srxj7kWygDqK
         iEmO6ZSSx28ifgWPLQf4pL56rgSvd+jAjb0SxCcu1mBPzFVrX+4IdM0SRqAclTmeOX8e
         H6fws2aKiKiWhhVbePt7fV9MlwPwLYk1ZmBtHz8TmrLGQwhwGBvQc4O6fKeCNrlBnrm4
         Loww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677714; x=1791282514;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OjnLLZEy4NZ05RWw4wcrVNfIfzQkE+4cewTuv6QJdW8=;
        b=Z4wcKUs7pxlYULUrJ8o7VqU6GX4aO5m64YbQSA9bF/PQyu4KjAqiYJWLkI9oYI7jPu
         hAH7WIKt9GgqhvtTc70AzroGWlkjZ/r6zBtKU40kc7bsv/ogJLRIV12I1PiOT1eS6P43
         D2v9u+LZkkulU7oeIePeVJp8dvrkDpvU+yS1Hy/q/LlwMFVRwV7CIrwDWOP8uI10O6Tc
         DBWje2y3T6yZeFpxpQsU2OXMmB91+zaRakDpn6n3P4p2bg71UIkzvYRCJPL3ojJfQ4d5
         DI18loQCs6IhL+uGbXe2jZmU96y+sf3YoRJrfyUVUQnXwhxgs0qohINe/kuHc8pZQn1P
         ffNA==
X-Forwarded-Encrypted: i=1; AKwUvBweLg909QB5RKsZdtOCEjlvwYg2PJRueFwcRWMIeHXSUnV97l2SAQr2vyfNyxtOincDbYKnER/gN3wK@vger.kernel.org
X-Gm-Message-State: AFuF++lXgaheOFZgIRTFV8Oi9+tnoIf3AaKLtWN7wUX9tPB6YBIzVnZ4
	F5Td4QdRgO4M57pcrYDUzpsi4mz/ABY1GwlCjJD27MjgPBn+Qfb9miyFTUq9BuoujcI=
X-Gm-Gg: AYBFou0ToDKSuCRAAlga3a21fwnJTt49+xxj6jdDOjfM8wZ6fcr9M92PXeWQk7M2JtG
	tqTAUELkcHqCORLPEa98/FPhpas3ZqnbLAmrqpL1jiUGHareXnCn6OH61zqXJAr/aqd2JrSX0q0
	eyQlvM8lkBZdZu0G5mh9CCd51M7mXMX+1EOuhUN1T/AsiR95tAqsxXw+RN3g4uDIgmKuBjEeKrx
	hvWpulMpj+xOG7RcG+A9UKO0XU22qoK1NQOsWOEyTD9b+2+ZrnvVHHk9hjv/w/PAjZWcUvYATNx
	9XxWEywd9eQx+CL1nG1KsY0NJC/xiMPjYpCqTyrHcdv6s5MBtVSDe2aZ0wUcifc6TgNrHCXqoux
	cQqRib+UZJeqWrlREjmVXHUH01dpgE0S4ADCuNdsZRRpy7kJwOpdCiNHcm8RuHQ5Iws937wCPpY
	EF+rSf9/A4ZtAib4GcJUoLvSUqWpG1X6bQBC12tTRvLcNU/ftM7Mp0Rfoky/wWcKhrpQNDo5C+g
	o9Zwy996fY2NScBfw==
X-Received: by 2002:a05:600c:198a:b0:49f:ce78:356c with SMTP id 5b1f17b1804b1-49fe67023femr268059845e9.29.1790677714116;
        Tue, 29 Sep 2026 03:28:34 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:33 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/5] power: reset: syscon-reboot-mode: Add support for
 Rockchip RK3576 reboot modes
Date: Tue, 29 Sep 2026 14:28:17 +0400
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0K6dkxpSwVX3sOwsHSQ8YeSaSUaw
 t0FPIDLl7zvfZOIyIRRHLNJMI4UKfQLqF0mmu7SXxHILyyUVFZWqgRngO+6OFhgdCEkeAaP4HU
 pDerKt9KIZTswtvTeuuf6x/HlbtikNbYaHcUU+LMdj/nq/fsYc5BgC1NaJ7XzJj+1DxoG5H2PS
 dTzPH8B4FNEVc4AAAA=
X-Change-ID: 20260928-b4-rk3576-reboot-mode-d3804e39df04
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582; i=alchark@flipper.net;
 h=from:subject:message-id; bh=nD0jQ0sanXtfhte+cS4Eb6xgGbAdsdiqP+FoF7tBRHM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnSR24Hn36M+tdhN73vMn2dv5+A7vic1urqA+dy0K
 GUb2eCHHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1tRxGhkeGK8/VXUmyZrOYcDszYNPaNR82PKzOOuRe6b9XaZNouyHDH265n3t
 KDv94cDB6pZ1E28/UYKuKxnWzJsVOrauLnR14lR0A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip RK3576 supports reboots with a specified boot device priority
mode, allowing one to override the board-defined strapping config and the
OTP programmed priority setting.

Supporting it requires several changes though:
- The boot mode request needs to be forwarded via TF-A to the boot ROM
  (upstream since TF-A commit 2a97ba20e901 ("feat(rk3576): forward any
  boot ROM boot mode request on reset"))
- Some power supplies need to be kept active across the reboot to prevent
  early boot code from running into a synchronous abort
- The magic values for each of the supported boot modes need to be defined
  for the OS to use

This series enables the above with the RK3576 EVB1 board as the example
user. Other boards will likely need a close to identical change to make
use of this functionality, but need testing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Fixed a leak of the dynamically allocated syscon_rbm->supplies (Sashiko)
- Uninitialized access to supplies[].supply (Sashiko) is fixed separately in:
  https://lore.kernel.org/all/20260929-regulator-get-all-v1-1-e887c66a47f1@flipper.net/
- Link to v1: https://patch.msgid.link/20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org

---
Alexey Charkov (5):
      dt-bindings: soc: rockchip: add boot ROM download boot mode
      dt-bindings: power: reset: syscon-reboot-mode: allow supplies
      power: reset: syscon-reboot-mode: enable supplies for the next stage
      arm64: dts: rockchip: add reboot-mode node to RK3576
      arm64: dts: rockchip: name the reboot mode supplies on RK3576 EVB1

 .../bindings/power/reset/syscon-reboot-mode.yaml   |  8 +++++
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 16 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 36 +++++++++++++++++++
 drivers/power/reset/syscon-reboot-mode.c           | 41 ++++++++++++++++++++++
 include/dt-bindings/soc/rockchip,boot-mode.h       |  2 ++
 5 files changed, 103 insertions(+)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260928-b4-rk3576-reboot-mode-d3804e39df04

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

