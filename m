Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3A73655C2;
	Sun, 23 Aug 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787474151; cv=none; b=au+GiW0FAdEta1pEsQe9YSSHUU9Nv2eMzyNCBm+SvUTAjgVt+60S2eKY8ObztKrD2K/q3y0cY/iSf/s4HbKw1wM3e6Vm8Xt26WAkEfEnYI+nxkMOQTqNl5XGAinmo5QIGNUX3jUC3+bS0qCxzq4tOHBkwgvBdlrcpCJTE13H8/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787474151; c=relaxed/simple;
	bh=fypSaFdXAtNFNmFOmAKyGhkU5hxq6SpoITbmIH89J3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sSQXUQUSj4FZZ56foOF+S42bStpD+UII39c2CH1jWxD6uhap+zp8+ZDVNY7VSBauWs/9kKcucBrDdw8qIBIE/ZX0YVYiRndSyIw7ot/M8QFglWW4kzn+7GJuL4YXhFaSe6MCUBld5mvzXbHFe53YWAb007Get19M9bdDBXKhWyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYDW92+0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYDW92+0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 063ABC2BCB8;
	Sun, 23 Aug 2026 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787474151;
	bh=fypSaFdXAtNFNmFOmAKyGhkU5hxq6SpoITbmIH89J3M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YYDW92+0wGQ8S9yTihNaF22oP36iW4xgzOSIleAdzWEYGMM2oPvFbm05bAPFo+Ukz
	 FAJQpQcYEtovy+jy8MRKgNavTIJinm5Ag0kAp1NPB1tcT6LH2xLAKHGASWM4+yiJ/d
	 1lL2Tx9YZMoqAfTi/FIeVfba5amDIrgb6Ae+MR+40dC0nrlKNAuncvUEPK9pXnwdc0
	 AyMnIMO6VYfop64ivock+1+2+RORVc+iQsqeQFIAsuEbVQJGFCUnfGkhoAoqmMNZDE
	 4WNXshZeUH17hl2idOarUNbWIXA1reJPcbPhFHLhl9Yz1k+Il5vxAnRuFuqnzfP/a0
	 P7tk+vp9qC7pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AF3C5DF97;
	Sun, 23 Aug 2026 08:35:50 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock: DP
 audio + 4-lane altmode
Date: Sun, 23 Aug 2026 10:35:27 +0200
Message-Id: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBPMJKqrRItJpxoKDaUIwrsnL
 d/i/xcSRaYEg3gh0s2Jgy+oKwF2Q7+SZFcMWulWdVrL+UC7x2B3iZfjIBvslSOD1iw9lOqMtPD
 zH8cp5w8o/BthYQAAAA==
X-Change-ID: 20260822-blackrock-audio-3a90de4ac4f9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787474149; l=1091;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=fypSaFdXAtNFNmFOmAKyGhkU5hxq6SpoITbmIH89J3M=;
 b=+7+yi0gzX852t0gInBHlDBNBiFBVoltZWZgTgBl8szvNcwpHsEWahyMv5sBobudhJzJWcD8UN
 yxvf/8TYCYBAr0EQm5sjRcRNrn4fCuwn+P/u9pCgKnEb36Op/bmA5kC
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

This series contains some well-tested improvements for the Windows Dev
Kit 2023 (Blackrock).

Patch 1 is for enabling audio via DisplayPort outputs (DP0..DP2).

Patch 2 enables full 4-lane DP altmode on the USB-C ports and the
mini-DP connector. It's the same treatment that was previously done 
for the X13s.

Related (still pending) fix that makes DP altmode on USB0 work in both
orientations on that port:

  https://lore.kernel.org/all/20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Jens Glathe (2):
      arm64: dts: qcom: sc8280xp-microsoft-blackrock: enable DisplayPort audio
      arm64: dts: qcom: sc8280xp-microsoft-blackrock: enable 4-lane DP altmode

 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 149 +++++----------------
 1 file changed, 31 insertions(+), 118 deletions(-)
---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260822-blackrock-audio-3a90de4ac4f9

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>


