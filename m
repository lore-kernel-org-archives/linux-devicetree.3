Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570139;
	b=XyvO7ud4ZOuWyU8dbeH7eegEs9EoXRyb4ulPywyqZfPtpTSo6xB9PEia3WZNT5roLHX8
	 RnO86hcVfJUqg+047ERUTyS9ykl5Wn/MPwEIuCtEZnhWr8WjHUwET/YoHBd8TO8lvIbHZ
	 4oLScvr8FwOvhxu2cZkuN0mdOgd4bWQFjx4DJq203CPZdWNLapFRcvGj8jf5VLSZnBVXK
	 iHzGcJpYcszPsfatpTOwUcScAHlj+4gj9cdVF1v41PuO8fNlcmFFaF9PxFctwlfVqekWf
	 u3UPA8YUaRwvhy60RTyLRAWazpcBMJOJOqkRU0AStuT2o7xtBQhOjap7TXUkCEYm6nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570139;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=m8uflTso+qkylFTdVQ/JR31DY9iTOBX4x+anRImiGxU=;
	b=QdmEENe1y2egZd9CAzNlhTnzoXgd2him0iI6kBB2P7u1OblWe68F8b6W8EOh+s1T08Qt
	 NTulVl7Pk+ROCvGjhyeX/LeFxb6ntHuj+zdZpLaDp2klOq+a9xHUZpTAbLT77L/sduLf4
	 tfEr6KWmNPmJ3M2zRQlJREVKCQekxRvhl3kpimeFm7sTTb77PTT7IprDrzA6Cpk83W+hu
	 QkEzUJIA6yZi2H8yq+KQiZgdcfigshVjigwceUUSDepT2ZZtovoqWrBtzZtttcrZo9z1B
	 HzSeFkWaBc8Rh/1NG3ScqvsG+xoFzBrkaE4k7KK6q1X2ClIyUOB652UZd5zUEXyHYOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAsuzcvH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128AA606A32C
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAsuzcvH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570138;
	b=UCEjMc2MxXTUNmfYLyH1iRNMazX2+xgRhlebtgd9h+GahmbN0qcGxoxXTkwP8fsK1dt9
	 G4ikRDW/5kHjr5zAVs0PuV/441JyBllPNGqM4Xy4mWdlY7SKhJsUNAQ0M+qKN4bn2YBTY
	 L1Ob3yzRHaGjpOQ6iJ5gWbVNPOiv3Fe3ZsE4Jg9A35QpbO+M7jIivLZujDDFgDD6Teu2N
	 WageeYstFZZGUHU56NtQ6O7HjyIIR35p7+zSTZueG3JI2l0Cp6SvQd7iKqIiETyJpnoSv
	 anFKxhK+CElZ8e2rfTcWkOIS1YvkvvdACfCHbYQ7fL338d0PkB0JE9rPjGCT4fj9xQw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570138;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=m8uflTso+qkylFTdVQ/JR31DY9iTOBX4x+anRImiGxU=;
	b=q5sZZtwMb9s2h3jsuIAzDNZaXhHWh6zPQYo6s1lXFM4nnfZ+7KpXVwkSXhA6RvWZlCIi
	 FOkfDvccJZtO9S97F9Cr/LKQWufxzZxmClk1c5PwSJ51o4yEcMFXyEuBtNSgOVDY/ZsMH
	 pfjeJWR1chswkceWf3um/qRpcDCoLXRaVsplKL2Xzzc0hrsInPs/zqhb3o9TbqpzI0ih3
	 Ut7rbbrr7WEnXPZS3rnxyrUoiZSb2cdmQDBKSc9wMONQGqyet5Ln+MfeJAesy/eye3tB2
	 NKko0gE+j+xJCu6zKeqLg9ii+t/mfFSl5kUzM7m9ZKy4kx9DPjfn5qLb2gwfEUrHpng==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7EE401F0093A;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570138;
	bh=m8uflTso+qkylFTdVQ/JR31DY9iTOBX4x+anRImiGxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MAsuzcvHw1y/ZLulYc+sDQEVwpT8xCpM+QUhG/gpWMHfVs6vMEFh0gswwLiCHFCOd
	 AYz0Jx125kkWbD/U/Ov1qWuHg6AAjsLAnxqFBrr4KAt/aZR3hlR1gMO9FJ6Mo27Cj0
	 RzNses0Ufagys3W+uh0FcoK3suD/lAJaiP6OeXTdkrDHVGsHJZv8hvAnM8S90jQKTh
	 /YzLYPab9Wz8g17t98mH2CesY9kTiHuGZMrktNP42xgWpaasQBDEqq7qDnFxhrRs+8
	 gHTY3GzULWKRwGRDD9tMV4zdarwaqL8SX/j3xzs14BzHw3l95XSpVyLReWg8P6CB+i
	 LKQU1EHIzf7uQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EE97346294;
	Sun,  1 Nov 2026 21:55:36 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:20 +0100
Subject: [PATCH v2 2/9] arm64: dts: rockchip: rk3588s-nanopi: enable
 mmc-hs400 and add supplies
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
Message-Id: <20261101-nanopi-m6-improvements-v2-2-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=882;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=NtjmoS3gzjTskgyS6fKoVKwOyEqnn+MuBZ7YOy3nJMY=;
 b=O5Y+nwXb2ANscdU32sZmXZtO31VFMc9bTAk7BixJHkDXBFHbNLKKC1xYk76OyXjb3bmvuTKGF
 52AmnStFmGDDmTqh6+yVVG6Sof/vwQHkLaud3hhDvbtVZ/OqUarL7E9
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The NanoPi 6 series all support eMMC 5.1 HS400 mode. This also matches
the vendor device tree. Also add power supplies while at it.

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 8c36268e98768..8c77ee71ebf85 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -390,7 +390,10 @@ &sdhci {
 	no-sdio;
 	no-sd;
 	non-removable;
-	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
 	status = "okay";
 };
 

-- 
2.56.0


