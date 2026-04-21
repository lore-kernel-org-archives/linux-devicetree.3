Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9402F289340
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776629; cv=none; b=gr/t3dfuBh/WwDTjJenZskasBmyjZaWN18p4dUWA/sRSpeVPOWINLpexTRHk0C7sCgodQ3KHhxLJWgePODY6k+OqrikKtXXjeHEVVKODOaNRNHwULh+6SWOQwpPXIUFT9feJ1xmY2PDHA+kspIuDWOZT0lYq4kXLIDVFZ3T9oqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776629; c=relaxed/simple;
	bh=SkpUDeOdXaUmVZSiQpDPBB0OX+/cQpp7HJiAsiYMJRw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=F5uFI94WmAna5bM6THcCLbYtPF6RJ9xHJtZP1AznCeafPIMPJ/kDfk4gXZm5v6o97PZfwOJQpzYeRfFBjjrKOAjLoJGzE2Y13R8gu7J7RJzvkBiznzVuWIWEqjdKe9leRsRasOcsFp+J48N2IfLlop62+HzZuDoqlesY5GK0G0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6OIyRx4; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6OIyRx4"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso764492a12.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776776628; x=1777381428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpOX5RXqNUjplHgJxW+vYUkumMwwbJe5HfVnVND0CgQ=;
        b=G6OIyRx4MMsY3eZfln5HaNb3yzQWF8Ah30+fW0ofJXU4xsKCPzfllWr9WXsyDYvyrY
         OmZ0gI75AXKwWCVMgJ45Dx6kc9HPZjls1Qow8Neoea4BOIDVYSF/jOydXahmIGp29Viv
         J4FJqnL9fN3gPZV5zxVMnxN0AtIYY9uiHwpJiCKjMCPSJ+iOKDGPMtRsWQEKfQv8raWp
         /9n/DriQ4T6J9pQ6H6WuqvLu+kgRWlAbBhd9CI8yO1pkdAD4Y54Ku7jVGKayjOqlavPc
         fE4+Dnle3inmA9NsLBwqw78kP2fVHGVRW8WfPJ2jTDBt8OLrhN1lKut6KsQt49ozN1UP
         xUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776628; x=1777381428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpOX5RXqNUjplHgJxW+vYUkumMwwbJe5HfVnVND0CgQ=;
        b=REeRqk9yjsRLadaMD8zv6a/L44CbZ8L6JmNQ70AcYpRnnBxSWSDJ+FDZM8ggAAbS+f
         mi8Dyr+Z5jj23UwYfjbab1Vve2Hc/kp/hXgsPtLASdDmbg5z25c2baZTV18eB2wWvfwE
         WwS3c1Jiwk395c8lPSqM3VJksJhwqLBVbuaJ1H55wnIbZMzH613c/U5dAxi2AabNwXFQ
         mEfVr01rAeHNYD2y17EC1C566zHvHTO9+JN9iFTp3LvHiXqvcvXrO4WcIpsO80IqatNi
         t89lTeoNkL2zlEI6h+tKxLIzTn2exukzKOsaVZlTlIK3TGY3l15R6zgjuIVbfo2TxA72
         Y76Q==
X-Forwarded-Encrypted: i=1; AFNElJ8u0iJeQXZ1rK22TasZu34SEWPjI57FUOYQiZNRjwxF3tdI/hCmHZV5JSM81ojXh8RTKJp2epV0sx05@vger.kernel.org
X-Gm-Message-State: AOJu0YwNKOMHJz4pNB5GJHwpSNDgQKKX4VS/9Tqdp7k7UhaKMBcbs4ck
	WKZpotHvaYfPD4S2ae1FrhRihKRYUeuOm0vL5VlcPT0bkHOfUiKKDPiclyD14g==
X-Gm-Gg: AeBDietZV8r9EmE/D5chTgQVMEp+l91Wz/6IWwGfie8v/wAF5XxZLg4WKFWMR6lEFjQ
	rLDXYsehVHP/eqmZCnYNBDlfpX6BLuD1ye8813MhzKdc/nXP1SLh2OFi9lcQbJEmP4WaWVr43uq
	WJfgFeqJVCNQp2M53QAZEyzSXZXzXaxCVvs4FGQodlPTLoH5xrz2QPrqY8d/+S+jKwtbzFSaeHL
	NcBA9kE4OuVojCc15pcXrCpc266qHwUpEWYZwxL11iQpv27R8QNaxBabDxVRiwowRhWGSpBWFV0
	S8GVfSSNpfzkAMXCEUscr5Y6yBAmnd9+eoVo2K6s2RZfRzfrcerc9mTNEyvKpQqzwQsYgSghSXM
	iE7nBmrgM/3cJfH3o6fv34H0ErHpRPGFQb49WtHkhdu3uIbsnlbQmqGkXWNKj3WWUrIOc2D5tKG
	KVUlwjdvNH90F+TkXPYWC9wCWyX2DIjEaWk6ScFoN/vOA+60TRMCohPj+4i9KRoa1Ykpn/x9RRs
	6DEfbHsOWATkdT7CnkXm4g=
X-Received: by 2002:a05:6a20:3c90:b0:39f:acae:f12e with SMTP id adf61e73a8af0-3a08d748ad4mr19977605637.22.1776776627679;
        Tue, 21 Apr 2026 06:03:47 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm14456484b3a.3.2026.04.21.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:03:46 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1]  ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs
Date: Tue, 21 Apr 2026 21:03:40 +0800
Message-ID: <20260421130344.2751662-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Santabarbara Device Tree to include several GPIO expanders for
NIC, Switch, and system monitoring.

Changes in v2:
- Add system power fault alert and E1S GPIO expander interrupt
- Add switch board SKU IDs and power good monitoring
- Add NIC1-4 power good monitoring, reset control, and fault detection
- Update the commit message
- Link to v1: https://lore.kernel.org/all/20260129073749.3155383-1-fredchen.openbmc@gmail.com/

Fred Chen (1):
  ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs

 .../aspeed-bmc-facebook-santabarbara.dts      | 125 +++++++++++++++++-
 1 file changed, 124 insertions(+), 1 deletion(-)

-- 
2.52.0

