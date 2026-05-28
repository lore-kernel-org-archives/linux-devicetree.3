Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853272F691F
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951765; cv=none; b=VuyuspJ10gATRzqlCHxZGRLe8JZZrqRxWb7TPeCmrQQ9nVyQvfiFuoaMpN0i6PLSsHzTZKuMjgZifLLZ9L9/v4prIrUQyfdAXOaf7BYJFxrNEQzJj+q05tGEzijxnLU/enNnAbuaNv+ELxa39MV5M2pNu9kG9D5hiVwDuLELVsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951765; c=relaxed/simple;
	bh=hDoN54MTD74gN4yN4xjB0MzcxLKrEqzy2G25xlC0dUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXzlHwS34GZfeeymsEpx5xgsjjTzXmN3alvA7Pf8g0vP1kAFWFPtyTUFAxZ6QBV/nTWCBKm7p+CffoSZKGN6NCZAAH0hUxAAFRxdywBQo0W1E2/sIjVSSwnYpK7shgA4Vrii1PXPl1ilxHUKX7ILDSEDXwBpwrRdiVRQzTtweIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcqXxFNJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcqXxFNJ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso67834095e9.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 00:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779951762; x=1780556562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sP4Ad5E3RYrUNHKmcQKUr55iNcUkio8ThdQe9K6CwHE=;
        b=YcqXxFNJ6GXTQ9on4lhVcZOBsRiPGlPLOwNS5we5IkCXmjawgk32bY5fN5/6mH0fqE
         QOM8DDB8dmsPb8+UCgQAwwFwm1x7W/npSSvuNRTR5DF9CJ0iB+J3/UDdVkLxFiqZI1hi
         pGIH8/mZZhQg7mvdb0Nb86cD/1UTKCpLwdgYEWjU4SdI4+s8nLf63FHKD+VLZzODSW8A
         vxEPbM7ONua2wmZmtsB+XpyzlZmgK2UUNqwP+yjLF/eP7VLh9UiHmP4mtdSxiDPngbBR
         tov1EWfPJ5iC1iTa1jVwaePJb6W/xmGDlVwYMtldeaNpZqPRWTskUMVSzMcCzsUnfHTX
         tIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951762; x=1780556562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sP4Ad5E3RYrUNHKmcQKUr55iNcUkio8ThdQe9K6CwHE=;
        b=NA5dskegDjqi+8ZGK0waj+sR+AkRuhBs3a3lWGw/3ZzTkw3ODChT0U3KL9c+e5R6HO
         uuOw+AGhBK9sEYBIN/VnP607CyppD4C44JpMF856tBfCS0Q/dV2AjN/vIGD9KfzQlZlI
         bOijebQSgyXPPW4CENMHVLqlbve1eMt76w9KiO1qdhssAoj+nXWZT9lb5Tsi90acZyQ8
         DRn67Aqg2vRpZUMkc0tW7YwtOWGqqRjy7kczF+qHYent/P5DNmzp3GmNeesLj4Lrvv8m
         n5TYDqTxHpd12dW17Lvob5o9kllD4P/0+Owo46ZRpwI8vHk31CQZzzeBp+v9lYZRM+6s
         CUJA==
X-Forwarded-Encrypted: i=1; AFNElJ+sLh7AgQ+b96Ih/asxP2m4Vp+dTAu1bp0JuGOHRGuV/FTRJIabYbMkJjUieFxXV72n0f9yP9Mbis0n@vger.kernel.org
X-Gm-Message-State: AOJu0Yym6nO5InSQIOTZzjJV+k7EkPaaLZjHeZ6TS/1WY80187jN51+m
	odnS33L2xG5SlMUerOH7j1UyGTu6wpR1mqEq7pW4v36aQXq3ouN0nHWm
X-Gm-Gg: Acq92OGj09cS89RdGnY9Ob9epuRPn/9h0muUcziwCoSv+i9Kt3TTR1GwqNZvQKiihyv
	3eVkhtjTxHXY0enS04d2dkb5n7lLOHaMBTnBX5FmQLuou40HcLZbwi2HQ9L9UTqSgKFIHLwgE61
	gBZoB8SN2gtvaJaPByzq2TZoSQOrr8jmDe8VxfdKku2/w0aGmnyP1QZ0U9cR3hMMbWEzwqvisGR
	HizfyRDnSIg+/aoNmWQh/h1Di4D7axJk0uFSXKM/Bb0D6GVWVv8uAs2I5utgGhY9TuBK6rwMGGO
	KHiVj1zC/h1eWiqAvwd4F9J/3NslbdgJhuKlm2eDvHT7lkcct42hCcDHDd1WBL/owEA+84zqVMI
	C03sM4LhC0AaLFE4b1cWRkDZ3+Of1ktwt5pSy4gyc0L1RQAhObiJxe0uKCoY3oHByP+HeaXJoJz
	VLnUw2V/TcnW2Ub/EGwDU0znoGiSqn2/5cMWKZQW0bRXRhpBp6LdtHHGVC1JI=
X-Received: by 2002:a05:600c:46cc:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-49048df2f57mr406833635e9.26.1779951761659;
        Thu, 28 May 2026 00:02:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c724:a823:10ad:6b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm28528385e9.2.2026.05.28.00.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:02:41 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Add RZ/G3L SMARC EVK support for I2C and GPIO keys
Date: Thu, 28 May 2026 08:02:33 +0100
Message-ID: <20260528070239.33352-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series aims enable I2C{2..3} and GPIO keys on RZ/G3L SMARC EVK
platform.

v1->v2:
 * Dropped scif, i2c SoC dtsi patches as they are accepted for 
   renesas-devel for v7.2.
 * Updated commit header and description for the cover letter.
 * Collected tags.
 * Updated the macro value for RZ_BOOT_MODE3, so setting the switch ON
   pulls low, selecting SDIO {CD,IOVS,PWEN} and GPIO4 active.
 * Updated comment for SW_GPIO4 as it uses a single-pole double-throw
   switch.
 * Updated macro value for SW_GPIO4 such that SW_GPIO4 == 1 would mean
   that GPIO4 is enabled.
 * Updated keys device node with !RZ_BOOT_MODE3 || !SW_GPIO4.
 
Biju Das (2):
  arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
  arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices

 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 55 +++++++++++++++++--
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 21 +++++++
 2 files changed, 70 insertions(+), 6 deletions(-)

-- 
2.43.0

