Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793825995;
	b=AZgkP7T34zM5HxHDFx5pPf1VeUrMRFoSgqB4KVEehZgY80L4o7TtfCDIJVpve4fYLqG8
	 wOrFBUswMhg2Zri6kDY/cy/6DDjkV1/RV1zKwjRJnPUN6dzepxyAbcHBwuO2FZ9id8PSx
	 YuWus6u8BvuY592svmzM3KHQwTxwCFvFEtMGOk8CwbAJTPyR90RbKF8dvVC1MH2/r2nQ5
	 ftoAlAp/t5JhcLb5IN+Fsm39KkqfJ0BJm1dsATPpUblnt9o1LZxyIBlha7FUfJidcxowJ
	 wpajuFwl19lpx3dbomWvZBLoo+SW75DGYVpC+wPaQdXJwiGCSuq6cfrKEtqfpP6JlAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825995;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Fh+ACEbd+2yeqgDmFjxeuuMrHA8VR1p1REYatt8k/fk=;
	b=E5xMUjVRj9l8lkAlVidz6x4k+OQaCoMbaZ0Dh1Gr4ZThBIK2M8+SXv1rZt392N/pjDqX
	 PIk2JOWt/90PiNXC3TOrW9DglWY3bcTnqITywmzzRO1+iEfO0H6fdxKiUUd4X/VboTD2H
	 q7QSCyjtrG1rxXA18Jiwa/BO6Y2CfetlTMMIlkpneJz1P0mWjbz/NJ/s0sqDJVeOInODK
	 uh51FR6zKV7upyXcd9wPjDcjtYmGK4z7rmBzxsJEHfTwA1rLTExgUMxe36fWP0+8CATLn
	 kmi9BWYSCiERx3jgB5gQhKlFl37LjU11WFFaXAWVGu1UAEulhCIukZXIzL0i4lzL9ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hlal74QU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31960E752A
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hlal74QU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793825994;
	b=ny8UvKePUlDuRas6KfKrnZSG/QsMsc4JE3XLsehSh0bwlsEGfgvUFiJJRLu7Nn9chMLY
	 AFvRhH65ft+S66m5drrGLMcYSh3IyK7O9nHL8S1Sqyzsh5FuHHKgccMBDTaylQ6pY7qx0
	 /BRIOtyIjxAFFM/rRy+Z04GHUglFYIaTC0MnwPWkkA4TcOa1jFu92+Bf0JlsCLttdUxxm
	 uCt8gCLsQOF8c7flcZCFo5bMs02HQooF/xAtqXEqQMLosE2DwN4I0VUdB/tpChrxaIQia
	 NuneMqW3crqL1LizDONP3rJo5blWxvQ6vLilg7Kyy2uxJGHVm5mQzmljrhHAziWkzKA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825994;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Fh+ACEbd+2yeqgDmFjxeuuMrHA8VR1p1REYatt8k/fk=;
	b=f3wo9hFAfKrWtW0GgET+AjitzL/nR6NpYCuSE3086cUGwhzb8/bVojvNSxvJt+Z5ksyY
	 /Xe+gJUDXXgwgeoJt4o56iZP0PpW6Qpwlw6N6ZgDcs3m2Rs/Xna/5K0pJ/oEaRwzstjtZ
	 fesgrdZouopiyPT76+NQF7QSwvJkfEmfROxo6BLY0NBmPZ+mf05XHtNuF2fNABpoTJT1q
	 dlctQgOllwbLO46eXoGPBaqt3UnMFVBrnCm+4zFy6YV4C1WYzJJJUlOiVwGAxh1z4b8CT
	 BH5r8DL+PXYnSMshn8CxQ7/c8aqspJfLtxNzFzpYUzEVI0Oax+QAWRBh3r5LIOumPtg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AEDD1F00A16;
	Wed,  4 Nov 2026 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793825994;
	bh=Fh+ACEbd+2yeqgDmFjxeuuMrHA8VR1p1REYatt8k/fk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Hlal74QUViW87iAGXgcmurXWwPs0nti1LkIq/p6fVgaNSByc1tw6UoW/WAv0hA/bJ
	 H1cPpsjcaSNV8GvYQBzO2CEIAWCR9hU22q6bw+bumJ351Fb1b0HwshYBjpLFzgfueL
	 41D03cNK08L6YVEEMHFwg815YXfX8RIzQVAjFeIKcbKWtsRpxEuiRLVI/O29z8N8TL
	 XyWEQz0njgKY8zfLl3/sFZWiJMYW7uxJ3CzvX2bYUiWd2w1wKbhXkpCehu9eTG2pKq
	 F+Hxrp+nNf9UJz8XJ9/QC0g2YoMSHnnA8lYiXjGUT7YO8MrhgYwtSJ317TKyDjUPxK
	 QlPHnuje1O5FA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D0D0646FA5;
	Wed,  4 Nov 2026 20:59:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 21:59:21 +0100
Subject: [PATCH v2 1/3] dt-bindings: arm: rockchip: add FriendlyElec NanoPi
 M6V2
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
Message-Id: <20261104-nanopi-m6v2-v2-1-dfcd8714f48a@gmail.com>
References: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
In-Reply-To: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793825992; l=1010;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=kMzMgde44rYz24ZMLHKoVZSaRZSmvu1GOyj3r3/eQTI=;
 b=F61jD7PkYeloWQ2Ucc5RhDzJjMpJAizwJBCvxrPVZlPen0NNLQEVy9sm5+85FT7QuNWDQO3W5
 g/DuJyGZNa6CPe9K7GHhAQCaGB0PsnFd2/9UWqwBejigJ7wo1bnzkTv
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Add device tree binding documentation for FriendlyElec NanoPi M6V2,
a single-board computer based on the Rockchip RK3588S SoC. This board
is an updated version of the original M6 board with a few changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 456ad1c58e7f5..01a13aaf3e8fb 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -398,6 +398,7 @@ properties:
         items:
           - enum:
               - friendlyarm,nanopi-m6
+              - friendlyarm,nanopi-m6v2
               - friendlyarm,nanopi-r6c
               - friendlyarm,nanopi-r6s
           - const: rockchip,rk3588s

-- 
2.56.0


