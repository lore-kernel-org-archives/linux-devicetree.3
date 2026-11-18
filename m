Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013897;
	b=oK9+BerXBqpHWTgHE1iYBWfB3sh1MMwb14i15RKc1zbHx7E0kp9ITb0elAj55msJy3Hs
	 pa38V2WSLCvyNB0qSrmAMHiEobSMT5ciIy8R3HyAzr3r7ZifLn0WvwNiCZCJSHxstBUpq
	 fhrAO6SrlcddX9CfVuNqR8LuHQQSx7sVlP+sn58Y8UD+5gLxuyEQrYWhZ4psDxOzjQ2zk
	 UHrHcqBNXCyxAgoQgKXpaDi3bXJp+r1T0jwzVeWGwHyaG9smVSC/Of2AlVa7DmWnsow6B
	 1KE9d7WVD+vY+Ley7BJrVSgddg4TFZUG3gk/rWV/RmPrnFpi8DvqWRTRmCf1f0lvMcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013897;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=pu/Zc8lWUl4Jnr74f98ic/pN2AH2QRpGA1MQ3JEWhKQ=;
	b=cXSkKhC6YWIT7bqOFg3flOumr2AhwrO34R/nHtjKT80Mjl9SbDGzFCjACa65dOCJzt3j
	 dsplg31VmYXha+hMSaM1NIXQ8AIUhMvJo8RVXvSJ7kDYEBB2WQbGMlEayVRJ8GOgS8+PK
	 07V26SnHA9jOAoSW/3Q32LZv/Tl7fJ+nhjm06kztMkkhVxmz0g48aALAUuhGQgqigkiEi
	 7v4enIWRHkv9mivJwCUmDJVNFhzIBemouL9ZqDjUUAsWR2KTNMgLF40jxjpjGMBUNgUdb
	 luJx0FFiHm03KCgOdxHy9pZB02ZbKvp/tvDqhX3uCP82gCy4A/ezNsT2UxXu63VTR9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4H5SIKk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7577C60A261D;
	Wed, 18 Nov 2026 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4H5SIKk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795013897;
	b=SoSOg0l+wrngvklntDOYtZ9WSK64rxOlpACqmGCRhGwhzJ1SwGPgA8b1mn/F7bmZ2zpU
	 exWsEwoY3+SBwykGQ0fKQD8RQlWEea3fPrFbDXeL4/o2Gq1GS0P/mlXP11O4evkB3yHlY
	 HQ787V4mVGP1J9ApQBnvabZJSksDydMYMGJcEFULWm5rJKeo7fSd0Ehtp51wcCgm6+55a
	 8SlhGin+CeUT0DHeZdyNRa77gCCLqhKDiyWtzFCzOWNcuF41Ot1lhNgwl/1HQ48C709sV
	 MD50J2p+etNBmbtQKSzccPwTP9RBEnsyem/TRpw16obp/ToBGoSV3FPv8F0f2PiKS/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795013897;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=pu/Zc8lWUl4Jnr74f98ic/pN2AH2QRpGA1MQ3JEWhKQ=;
	b=FYJQbjxGfB2ilHHuTdCWi9sg2yn+j61wLVXyMf0CBAJhgkDMBfJslymMjcA8ROBwZLVm
	 9aHHY4EmhIQ8iDACsWM5JjiynkxFbVpx8h1M5H7JwJGQd5ZiEwR1SsZiObYnLhSxONKDC
	 OxOb3KSmzhG+Ry95ekevBx6Q5i1/pV8Yd49YiEKnrqrsTlcvSEAtchpLyy0d65nI6oyom
	 0jV8hUEeUPavnw8MSu/6+nfKKkbWX/xbB/A9misX0BZMqCdoX3kIqE9FCjYII7jUQhqe8
	 8OlA029GwkGxVWM/ofsq0TKUiE4R7b+0L1FDRKVLgpmykhzXNvtnsJe+vd3SkE8nlVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78AE81F000CD;
	Wed, 18 Nov 2026 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013897;
	bh=pu/Zc8lWUl4Jnr74f98ic/pN2AH2QRpGA1MQ3JEWhKQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=n4H5SIKkVyAt8HZyplafcs7eB8PJEdWcHqaCbpzFmrb4kIzHYzqIWHQ1A88A19JCO
	 8RsORUwte12anA0oRRG+SCxwfIkZIf6L717oy2DHMVjt/rFyQo9Y3iUh7e8fjuChSu
	 Ft8XZoeLyNY5cFD+45gklTCflm/MwAlU1nCC2tski9Vm2GytnK5uW+TVWWWkLkl5Fr
	 Cprb1QAXnCUG2jJ4kXVk0gyggRY8xppaBZjlxRcYxTrPf5oda25dI/7dUTsBn/jluG
	 gGEuYxmPCkAvafMCDEoKqufiWqr+AJRIHBvq0Uzlio08tjOBSTcFnNe2eBVGenY12a
	 wht2CVvU0pWfw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CA47A4ADFC;
	Wed, 18 Nov 2026 14:58:12 +0000 (UTC)
From: Alexandre Rapaille via B4 Relay <devnull+arapaille.atlr-engineering.com@kernel.org>
Subject: [PATCH 0/3] msm8974/wcn36xx: recover Wi-Fi after a WCNSS crash
Date: Wed, 18 Nov 2026 15:57:58 +0100
Message-Id: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
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
X-B4-Tracking: v=1; b=H4sIAPa8/WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0ML3fLkvOJiXYgu3TJD3bQ0E7OUJAPTRGPDZCWgroKi1LTMCrCJ0bE
 QfnFpUlZqcgnIGKXaWgBmx6bscwAAAA==
X-Change-ID: 20261118-wcnss-series-v1-ff46db05a31c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Luca Weiss <luca@lucaweiss.eu>, Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org, 
 linux-wireless@vger.kernel.org, 
 Alexandre Rapaille <arapaille@atlr-engineering.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795013892; l=1299;
 i=arapaille@atlr-engineering.com; s=20261118; h=from:subject:message-id;
 bh=n8yc64Of0fWZA21WPMBAjcjFUjAVUPNfN5qZlFFTgjA=;
 b=dpaJKsS/juYfwL649WABQZENlJBbG0CSt4JcWP76DIQsmjbq6WYGPqFEPosdK4mUTQFxjDjL2
 j32TXZ4SamWALlqXNrknkI4jl2C1PlFhOWdJlM3yvi3hodUyEquqK9X
X-Developer-Key: i=arapaille@atlr-engineering.com; a=ed25519;
 pk=xskH/sIiNU/aZCeGeBB1TK/AuiG3MXlX0m2wMlbMl08=
X-Endpoint-Received: by B4 Relay for
 arapaille@atlr-engineering.com/20261118 with auth_id=1560
X-Original-From: Alexandre Rapaille <arapaille@atlr-engineering.com>
Reply-To: arapaille@atlr-engineering.com

On msm8974 the wcn36xx re-probe after a WCNSS crash fails on an IRQ type
mismatch (DT edge, driver level), so wlan0 stays gone until reboot; seen
on deployed Fairphone 2 gateways.

Tested on a Fairphone 2 (6.12.113 plus this series): 10/10 forced WCNSS
crashes recovered in ~20 s; unpatched, none did. Build-tested on
next-20261117, dtbs_check unchanged.

Patch 1 is for the qcom tree, 2-3 for ath. Patch 2 needs patch 1 on
msm8974, or its WCNSS IRQs would turn edge-triggered.

Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
---
Alexandre Rapaille (3):
      ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt trigger type
      wifi: wcn36xx: Do not enforce interrupt trigger type
      wifi: wcn36xx: Stop waiting on a dead firmware during remove

 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi   | 4 ++--
 drivers/net/wireless/ath/wcn36xx/dxe.c     | 6 +++---
 drivers/net/wireless/ath/wcn36xx/main.c    | 1 +
 drivers/net/wireless/ath/wcn36xx/smd.c     | 8 ++++++++
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h | 4 ++++
 5 files changed, 18 insertions(+), 5 deletions(-)
---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261118-wcnss-series-v1-ff46db05a31c

Best regards,
--  
Alexandre Rapaille <arapaille@atlr-engineering.com>


