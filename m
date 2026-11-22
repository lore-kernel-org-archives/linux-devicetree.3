Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324426;
	b=sIUZK9pEhkX+AR86GnOWqDGfXtVWNI4Jhe+g9mkmbX/AN+sh19uSh+8DU/Zcuku+qDIS
	 dVKIg+c519IaRDhRovp/GGP4TJ5tOQPCDMn7PNHA+8TC25pRnSRxRMluXuHbY9Bz+HpHF
	 Yk143GZ5K4KOCzP8zWoBmF5SznfKz3DtRpQ6EpG8Sfz6ZfwD85uTGxggbeUKqgpK1vXph
	 Zc6fEld7hYiek2sIHNV2ZVdeKWQGdB+rq3jTJSNxiMaovTgL1II8eR8WZeR1go1ZzVbrS
	 pFhKPNk5P6IY/tIlAgsT7eSvSEqEnBbnaZGLMO1MlBjvX5YiUBmftdqWoIxd4gL3tOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324426;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dQj0j7tPM1tfUXlYijiNtQNmFpJoIc5ASgifM+NcoMY=;
	b=N2exZIH9K3zLX+W/GCvX9AY/xmb1fPvRGqgM0to7sUcJ0X8Ld2CzCPb+zIrHMaZ//Ia8
	 7NzNbIk3mHDB+T0GgZf5dEWP7dSzaodTuCiFyvzJsPeH/3EQkiBF2mMjWYJbuwovTu5Nq
	 KXGIEf1xUZlnzeOvlxhTWQdReTAl1NCHq5riSAEI7z/ve7tYDKqkFMbsE1mYGnL3N5/wj
	 4VLnKnVt5yiPCp6EZB2j8T5+Lr/8WWFte+Oo6D/FBCMx62Ejirej12wpd7MsD6VIiiwdy
	 sODkZ0wJIQkjvIU051lgWZdR4+Az2kmcBaUOfZRD+iNyYlBasGE5cBjfcKGfmKlShyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8qB8OBR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D696606A331;
	Sun, 22 Nov 2026 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8qB8OBR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324426;
	b=CXgl6fSmms8sGPdzC/vlCtYQKRcP57V5jQvivQQd9dOh2MwzVSdnJQkWs/ymFEB4/1xS
	 evv4mcD5nmFJic2pRQv5sbAwL3S8JnJNs1VXp9yEapEvv71ytd7Q17G+cYRSAhcbEiGEu
	 wR+JAJFfg6ToBzdtDfVoONsUQM0zE7E1A0h/FB9e/KAYeVZ4pNlb6kd+m3tIBDz6/eyk8
	 xk2jpr9t6nyjX2tntT7N9iyyA9CiJ46oX0kNAb4HVUiLyDVFRgqmLbqyHCfo0je7seuRk
	 V5K59lhFXO04+9BH2LwgCBK7nt+w/nG+R4H78lJXYPM87TZVwDOJUUrb89KrqvhSoZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324426;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dQj0j7tPM1tfUXlYijiNtQNmFpJoIc5ASgifM+NcoMY=;
	b=Juqxx4FwubeYG7aH5tgmCGveCIK3c40ZCoVeIFbs2SIsbmG+uWP9iNGNLQmW32liWNry
	 er/XAB1uhR2PG3a0oy9WRBr8hUWQSDISseLGDm6RoMBdv2xDUtcuUtn3gGTvlBOb92CUN
	 W1Gs2S0zfHlVNvgbHYqqgBClb+mFDmx7woVNz6w4e5qC9Ly2Mk/GUiN6TkcJ1CeeDfugv
	 vySURgI2D5JBna9tCwFvjvEN0VORcjqHv15gtxIWKBsriorrfXArGPJH/Rqdu/u6GdbDY
	 6NQ2DTRlx4G3Jp6SKRyrCiSE0g39f20ZW6CeACYvG9Pplu6o+T6qWriGmOqf3Zq+mlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC8BB1F000C0;
	Sun, 22 Nov 2026 05:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324426;
	bh=dQj0j7tPM1tfUXlYijiNtQNmFpJoIc5ASgifM+NcoMY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Z8qB8OBRF7b5zeo7CpxIdHvWnK51rvIuKW0bTaWQU7uxEW1Gdqkh2BtjHHTRWTULD
	 oz5Z0YvPJkZQXq/u+mceN6z89JGtECvYe+deG5Ui1OD8qsMlEnVKJ1ecl38TsZhUhT
	 heV4i2I0fjYuttqVMqT1LZvEBJvuClo9N04g6Zx9LmbuffvFIT2M6ZikFAEd3hy+h8
	 9V7R+3dseb4DFcgZm+KxGY1pSwL/dJQ6tGrnnL0GABPJM+ru4vzJwH2JBPCALeYIOA
	 UlI0M7e5JjDHl0Uos8v3bDlOW+SG4w0XpJma3kgevzt4wfGIUQaPcS0p816rgBhgTv
	 LbZPFwn1+Q4Tg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5DB0A4BF2E;
	Sun, 22 Nov 2026 05:13:45 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Date: Sun, 22 Nov 2026 05:13:43 +0000
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus-fajita: Add the battery's
 design energy
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
Message-Id: <20261122-b4-fajita-battery-energy-v1-1-ce6f0d69947e@enser.io>
X-B4-Tracking: v=1; b=H4sIAAZ6AmsC/yXMwQ6CMBAE0F8he3aVNi1Gf4V4aMsCy6GabSUSw
 r/b6vFNZmaHRMKU4N7sILRy4mcsUKcGwuziRMhDMehWd0ppjd7g6BbODr3LmWRDiiTThibojgZ
 LN9taKPOX0Mif33X/+Du9/UIh17/a8C4RenExzDWqvKzXs0EJGo7jC9YC32ycAAAA
X-Change-ID: 20261122-b4-fajita-battery-energy-4c26ed5e9505
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>, 
 Hex Lindqvist <hex@freenixos.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324423; l=2515;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=deghCqiCJANOaAyPTby9MMGyOUPEwGJ7upq4xsrZF8k=;
 b=MeBE0hwlq1FbKxadWmdNqFHN+TiS9VoPkPHqQK0v2FtkTHR0mpDeSHXr4LRBGn9FA2RmvbnP2
 sN3XqwSFEZyAhEobm5a+B1u++GX6KT7e4boPANQOKiM58gCFPZIvSsR
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io
Content-Transfer-Encoding: 7bit

From: EMCP333 <emcp@enser.io>

The fajita battery node has charge-full-design-microamp-hours but no
energy-full-design-microwatt-hours. bq27xxx writes the design capacity
and design energy into the bq27411's data memory only when both are
set, so neither is written, and the driver warns at every probe:

  bq27xxx-battery 10-0055: missing battery:energy-full-design-microwatt-hours

The power supply core also leaves energy_full_design out of sysfs.

Add the design energy. The BLP685 pack is rated 3.85 V, 3700 mAh and
14.24 Wh typical (3610 mAh and 13.89 Wh minimum); 3700 mAh is the
capacity the node already uses, and 3700 mAh x 3.85 V = 14245000 uWh.

Some replacement packs carry a bq27541, which has no data memory
update; on those units the property only adds energy_full_design.

Tested on a OnePlus 6T whose gauge reports DeviceType 0x0421
(bq27411), with this patch on a 6.18-based kernel. The first boot logs
"update design-energy to 14245" and no longer warns, and
energy_full_design reads 14245000. After a power-off, the next boot
logs "design-energy has 14245". The boot that writes the data memory
also logs "cfgupdate 0, retries 17": leaving config update took 17
retries, and the driver warns after 3. The write itself completed, as
the next boot shows.

The code and this changelog were prepared with the help of an AI coding
assistant. The submitter has reviewed both and takes responsibility for
them.

Signed-off-by: EMCP333 <emcp@enser.io>
---
Also ran on v7.4-rc3 on the same phone, as this exact commit: the gauge
reports DeviceType 0x0421, energy_full_design reads 14245000, and the
boot logs "design-energy has 14245" (the data memory was written by an
earlier boot).
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index e9d1a1c6ac..dc3a7a8f97 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -16,6 +16,7 @@ battery: battery {
 		compatible = "simple-battery";
 
 		charge-full-design-microamp-hours = <3700000>;
+		energy-full-design-microwatt-hours = <14245000>;
 		voltage-min-design-microvolt = <3400000>;
 		voltage-max-design-microvolt = <4400000>;
 

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261122-b4-fajita-battery-energy-4c26ed5e9505

Best regards,
--  
EMCP333 <emcp@enser.io>


