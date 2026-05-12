Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F213955D0;
	Tue, 12 May 2026 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608101; cv=none; b=DPJbhLAEUOn1KsLN8GvD6KBOCqCzWe6cAumAYVTwerGlts75nSP9zoPrQjeu4XAPTobAc8Y4nDFvZDqyuG8XPC68jTaHF76J2pHWqpHV3dmrEW+A4+FN+pJfMwQyucv2+jQk0U7EaLqVbqzGq2RQu0cob4lCzz9vtcUHDiZ/8FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608101; c=relaxed/simple;
	bh=yzhiuLK/wwcykh5U1JFLwd/q+FY8atYPjgq9u4+qZks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFS+B1yApVY8PotChU97xcVxv1wrISypexRqZZmqCIXkSLousOO7uBWM7FJxdubarIg5excpQHokUdAz6XW3lgZJmV7qoC6Ycy1JSLAeTTJckOM9t1Ar8DrzeqXgUJFaVBHnzzLa3yl4OEcPZ4wLgJ1PdC0BLjIiblmU2JgcpcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2p3tdPP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2p3tdPP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9E5DC2BCF6;
	Tue, 12 May 2026 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778608100;
	bh=yzhiuLK/wwcykh5U1JFLwd/q+FY8atYPjgq9u4+qZks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h2p3tdPPiBxd4jfwp5pf4CGb4gm4BX3HMBXI8IgvRMjKnd5n3CWSKkfgYerEHo+AR
	 1zu/4AX2GawWwKLB2frIT8Bjh/WITgHmJPZrlBKMOO+3/lsiWDXtxty0kv5f3CRs5U
	 ooEt0/Chv1XCg0GEPkCKqT1WR1No4h4riMKppKQ0WM/OarMyjTU0dOE4hR9ddN3Nov
	 X8Bmt0xLp0ZCauGOvyVWr3rVrK6XSq4V5yAf/6yfnd9DvFGEhWI6NgnRw+QeglxB2Q
	 MUW/qjvFlQqeFy7DRk+w9zefKoJXU4HUbStxH4gKuAYJnkdmItxTwJOLqxvL7YVahl
	 f8z3V2WpBUrMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A905FCD4F25;
	Tue, 12 May 2026 17:48:20 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 12 May 2026 19:47:28 +0200
Subject: [PATCH 1/2] arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux
 definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-add-kvim4-sysled-v1-1-7178719a43e7@aliel.fr>
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
In-Reply-To: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=Vceb+Rx57Kg52Yl+xM01/jcuRqzhC1zMhtRZU3GpSrg=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZz+oM9/rIHYgxu7G+yVuoqFlDmfPno/EeN/ov7/ot59
 X/6zzS1o5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZiI+GlGhqkicoyPj61ZFWio
 +TQ+5qTCFd8COxf/nVLZbzKumZ1kmM7I8O9/UkNpaTBvvkTtJdavt1YmiUhsdvzZWKyxViLuqoU
 GJwA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The pwm_ao_c pin node was incomplete: it was missing the group name
suffix, conflating two distinct pin groups (pwm_ao_c_d and pwm_ao_c_e)
into a single, ambiguous entry.

Split the node into two separate pinmux entries:
  - pwm_ao_c_d_pins: uses group "pwm_ao_c_d"
  - pwm_ao_c_e_pins: uses group "pwm_ao_c_e"

Both alternate pins are not yet referenced by any peripheral node,
so this has no functional impact on existing boards. No backport needed.

Fixes: ee6e05a49b93 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..62f6b9baad28b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -400,9 +400,17 @@ mux {
 					};
 				};
 
-				pwm_ao_c_pins: pwm-ao-c {
+				pwm_ao_c_d_pins: pwm-ao-c-d {
 					mux {
-						groups = "pwm_ao_c";
+						groups = "pwm_ao_c_d";
+						function = "pwm_ao_c";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_c_e_pins: pwm-ao-c-e {
+					mux {
+						groups = "pwm_ao_c_e";
 						function = "pwm_ao_c";
 						bias-disable;
 					};

-- 
2.49.0


