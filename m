Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A89E3D25D0;
	Tue, 25 Aug 2026 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666872; cv=none; b=QcrTCiT30Cp12PLYUwKhWem3+ZgsxHzHcTCCrqHfR+0SSmvIzXja213R+qCj88s+ZTwMRmQL4tJs6e3cjh4BoeJZgmKzSNPk68vbgfDV3jG0nJqutnG91SkU1u7KVmvjCvWvn3rqZypcM3/kuA/vyqtjWKexUO+Dq/Y4imY80qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666872; c=relaxed/simple;
	bh=7/CabQ4SeagIrIWuSVudozA+CF3EkXHjXuEGbJRGbjg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K5n66YP3865WUNFUZyF/20rE+At/F4P3XFOz7JLex4dBFw9POJ+sK5YSiijVP9mBqE87DdzudZHhK7jbshP8gDZu2yJydKWkTw7NIQoxYDCTauaQk9fF0aHoBBF1zmBPERaHgbOWyVEUAtcoSYxZBgDNjvuhOfTrw1QkjbkJyG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=it/z2tzH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="it/z2tzH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2F95C2BCC7;
	Tue, 25 Aug 2026 14:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787666872;
	bh=7/CabQ4SeagIrIWuSVudozA+CF3EkXHjXuEGbJRGbjg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=it/z2tzHTow5ds4YsbyraMkHuQ6pL8CSy3ZS4clwvhG2nXQ4Tuvq9VpaNphCnxZe/
	 +FUjQSA7V1iN9nmFTe/RsGrctt1DgwhTgfrRF/jMqoYQF/6/3AuUL24K5aYnjmEOD7
	 IhfZaE/OsmCz8mp/5d2qSoQ6F0qkuxOWseEoX4mVGy455NYl/5mzD0IrvUbBjd65RB
	 EatgBlYYNkrc6ATjQsje0q5Smf4m/zFkKqwUPBBNSZWapvkTcALwxQFMXa2ofgdlIr
	 NfpDxAoQYSXswThFD0eA0/JCurMvqL29+Hb6t6VlRpLG03knwlBlCKyrEj9/McAY6D
	 +EpBCRkeu5jig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9B6C61DBE;
	Tue, 25 Aug 2026 14:07:51 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock: DP
 audio + 4-lane altmode
Date: Tue, 25 Aug 2026 16:07:44 +0200
Message-Id: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WOzQ6CMBCEX8Xs2ZrSEgRPvofhUPojGxrWdIGoh
 He3knjy+E0y38wK7BN6hsthheQXZKQxgzoewPZmvHuBLjMoqSpZKyW6aOyQyA7CzA5JaNNI50t
 jy9BAbj2SD/jcjbc2c488UXrtA0vxTX8u/edaCiFF0EWj63OwlamuFB3bnigyxXnK3/jU4Rvab
 ds+KINJEbsAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787666870; l=1617;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=7/CabQ4SeagIrIWuSVudozA+CF3EkXHjXuEGbJRGbjg=;
 b=qp48zbPhy96+enhQhajnEGNjkSHO5FjF8AqPqy7XIrv+btaUzXlMPc/lAxD/NArf133KYF1j5
 STHNeORJdEYB8lYztBkQPpo9iDLVbOwJpOTM6Jv52fXWMlMC+t19xzf
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
Changes in v2:
- removed the residual &rxmacro enable - thanks Sashiko-Bot
- amended the commit message on patch 1 to clarify its a replacement 
  "Replace old sound nodes, enable DisplayPort audio"
- moved common definitions to sc8280xp.dtsi
- picked up reviewed-by from Konrad, thank you
- rebased to next-20260825
- Link to v1: https://lore.kernel.org/r/20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz

---
Jens Glathe (2):
      arm64: dts: qcom: sc8280xp-microsoft-blackrock: Replace old sound nodes, enable DisplayPort audio
      arm64: dts: qcom: sc8280xp-microsoft-blackrock: Enable 4-lane DP altmode

 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 148 ++++-----------------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   8 ++
 2 files changed, 34 insertions(+), 122 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260822-blackrock-audio-3a90de4ac4f9

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>


