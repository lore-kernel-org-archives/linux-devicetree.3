Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A0B397352
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272996; cv=none; b=Gky0zTIcvG3b+pScAlufArSdw7/Y9RqAPzN0+NJfEHaXUzFgyorMkxYx+mmkFSzZ3g8tzMzUPrShaYwBsHEV1hOGk6ZGPYBDlkFyWgAxkf4tLiDhGvbIkkZT0xRPazs5KRrJ/HUDwO/AztnrYrsdqO/2Xx5vonAoM+nQ4Wflm6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272996; c=relaxed/simple;
	bh=8Lf4+lLevsdpQrvn2nihJN74Z9rfOIw0rByerUqqz6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s30Aah+7ysCQ+PgUMCDt3u0gW2WRrK9ShauKXJKNOqXV3F2yk0xTdOUCRxu5aQC+tFKvuIy+nVPEOU2s5n9EFH3BjAbRIUbeg79MI/ZTYPMjgXQ/sZS8m+mee4IBgb0vbnM0P5juAAgOs93vS9tDjEIsFELD7vKSUsR7EWmuLsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGZMf6eL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGZMf6eL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11369C2BCF5;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784272996;
	bh=8Lf4+lLevsdpQrvn2nihJN74Z9rfOIw0rByerUqqz6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dGZMf6eLmjyNNLXd9b2yGlmYE6CbR0XNRGmBHyIoD8N2P1vkVTP2uGVLOrX0yvPpp
	 EjbN+zgACeX0iywKTBkieG6AV4LPLyfqrrHTe//cq/vF0vFQ8YOGfX9IE1cE+/Pl5Y
	 GMGrMv7exFI+lnM+hQx+2A4olH1+WLNFOqfOr8FmgGcWRyMLN8EQ6VU3VBlw51RfEV
	 HBhXWcDfcVHia+yD7Yr5zABFAewADLkf13s4QPNPdpRG06tbG7MZXfzTxauOJYeODB
	 IEjfxNOa4bYzDTbEdhu0S8QgTHh7b216BXbRy1KNzkLcErpR/1lESE+u1aSdnBlwQC
	 TveIwHrkY5QFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AD9C4451B;
	Fri, 17 Jul 2026 07:23:15 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 09:23:02 +0200
Subject: [PATCH v4 04/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 pull up on rtc int pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-nanopi-m6-v4-4-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
In-Reply-To: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784272993; l=849;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=h+9FQ/CrUXYqfYWONzEvidoezdThjgDJgIAcTKsFU6g=;
 b=mO8i6cJ8nbYaWCl+a+1Gjt9K9jc4RSPsCS9W6nY/emDF9W7llAQKhu1q8bXpNeVldUlt1DToa
 vQQJSr6QvxDB22C3NfcQsUgiIOIYHD/+0Kn0Jd0STua3a6x2abaGiYZ
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

All boards in the RK3588S NanoPi familiy has a pull on the PCB for the
RTC interrupt pin. So there is no need to enable the pull-up in the SoC.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 6b8ca427e0f8..2d3ebcb9cb22 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -420,7 +420,7 @@ hdmi0_tx_on_h: hdmi0-tx-on-h {
 
 	hym8563 {
 		rtc_int: rtc-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

-- 
2.55.0


