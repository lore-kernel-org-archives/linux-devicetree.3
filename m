Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00126435A94;
	Thu, 30 Jul 2026 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419056; cv=none; b=SWQhnzReS6DtPwJbKtiVYyPeY1VN2YzX1OO+nCYSOpsPSmDWUtn6qzglyIfIFFHBKWXhfevn0O2UWtvtk2iUHlR32a9Zo09ac4Iv5593PKHESEfS8X+bOtVodbDr4EuqN/beot0LjVeG9wT1zLE6p0cQBNgRDCxoazBVZsEqoM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419056; c=relaxed/simple;
	bh=HagWrrgaVOY2dk7GGN12DLo7KTMXEEq5ZiIAEVTxqZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hDnFTyPKr4wW4S8FEL4mMqlyF5i4CAg+imgBy77bj/yLN1jD11E5mjZUe2B+ljeZ1N9TbriYi2Izo2BHWL0h0AAUIafPWkZqMciWceoEgnybYIDMzFm3UgggieuDKeZrLV5vR3J9Nqkap5T5SprNtTxdtAhSOF+T25nMy9+Zp/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwB+ZkUt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwB+ZkUt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80BC2C2BCF4;
	Thu, 30 Jul 2026 13:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785419055;
	bh=HagWrrgaVOY2dk7GGN12DLo7KTMXEEq5ZiIAEVTxqZQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LwB+ZkUt3rqYKr739S/sKifj3mUeCeVTQTmStQGO9PtqT8XXezuNze3wVR6vv+U//
	 iuRLmvQR1KztXcEPpH+9DZBbSYSdGVJUbR7JlDMzE8r9ot2sfIKAU25qNJzeHMWzA6
	 bIg8AodMEXe73tdzWpqaWAZOvgakul4eHqftl9MsT+dnQc+FsgVXMC2ncyajy/gEKD
	 Ckam1SlmAAtG2F3w6Kd+SOqLPzH/CQCQ1ETN4Ju5m59jO129pEhH9z49n0qpRPAaJT
	 BcN9Cln9g9taoVXTvt3KWqQ3FUIRw9zUqY2Mm1XFPOpelde4xnaG2SCq6h66mf3JWe
	 bLhcAsnKgkBdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59414C55162;
	Thu, 30 Jul 2026 13:44:15 +0000 (UTC)
From: =?utf-8?q?Dawid_Wro=CC=81bel_via_B4_Relay?= <devnull+me.dawidwrobel.com@kernel.org>
Date: Thu, 30 Jul 2026 15:44:07 +0200
Subject: [PATCH] arm64: dts: qcom: sm8250-xiaomi-elish: correct the board
 ID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-elish-board-id-v1-1-92f99e9722ec@dawidwrobel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TjCltL4SHUy3XAgNhQjEvycdh
 2GmQMZEmGHpCiR8KFMMDYa+A+tNOJGRawyCi4kryRlelD3bo0muKaatdbPRo5JaQIvuhAe9/3D
 dav0AcqmXi2AAAAA=
X-Change-ID: 20260730-elish-board-id-8ccd9a857382
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Dawid_Wro=CC=81bel?= <me@dawidwrobel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968; i=me@dawidwrobel.com;
 h=from:subject:message-id;
 bh=g2fcCipVqt2i1yfS91bVrhhCHQ1qcOIxuxiWk6CgcA8=;
 b=kA0DAAoWynV8R6nV7u0ByyZiAGprVS7IpwJaoOcWCNIk/6xxU2PlpnqNRIfQW/7aagx5XWc5T
 Yh1BAAWCgAdFiEELmZSvDpT6ffu6PtXynV8R6nV7u0FAmprVS4ACgkQynV8R6nV7u0SNwEAkN19
 VoNGLym2TUlAVfOUATPIQKKQt4u0HEVgo6pAwhYBAJ69dfHOjwk/NhcCL3SOv2gvvkxBkaTibZB
 3SQye/SkH
X-Developer-Key: i=me@dawidwrobel.com; a=openpgp;
 fpr=B64A778E0E64049A70C831C8B7B81FA12B282A92
X-Endpoint-Received: by B4 Relay for me@dawidwrobel.com/default with
 auth_id=901
X-Original-From: =?utf-8?q?Dawid_Wro=CC=81bel?= <me@dawidwrobel.com>
Reply-To: me@dawidwrobel.com

From: Dawid Wróbel <me@dawidwrobel.com>

elish declares the same qcom,msm-id and qcom,board-id pair as
sm8250-sony-xperia-edo.dtsi, so a bootloader choosing between appended
device trees cannot tell the two boards apart.

0x10008 is Sony's value. The downstream device tree for this board,
elish-sm8250-overlay.dts, uses qcom,board-id = <47 0>, i.e. platform
type 0x2f.

Fixes: a41b617530bf ("arm64: dts: qcom: sm8250: Add device tree for Xiaomi Mi Pad 5 Pro")
Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
---
Not tested on elish hardware: the corrected value comes from the
downstream device tree:
https://github.com/LineageOS/android_kernel_xiaomi_sm8250/blob/a04dba03999b36cc8f472c014063395b41fb1022/arch/arm64/boot/dts/vendor/qcom/elish-sm8250-overlay.dts#L14

That import commit (bf5acbcaca99) credits Xiaomi's munch-s-oss and
dagu-s-oss releases; Xiaomi's published kernel repo doesn't contain
the device trees, so LineageOS seems to be the only public source.

No user-visible impact: nothing in the kernel reads qcom,board-id, and it
is only consulted when a bootloader selects between several appended
device trees. Not needed for stable.
---
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 19aff83ecf7b..945127dacc82 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -29,7 +29,7 @@ / {
 
 	/* required for bootloader to select correct board */
 	qcom,msm-id = <QCOM_ID_SM8250 0x20001>; /* SM8250 v2.1 */
-	qcom,board-id = <0x10008 0>;
+	qcom,board-id = <0x2f 0>;
 
 	aliases {
 		serial0 = &uart6;

---
base-commit: 7f102800164990609e2b272396d45b197a55bd04
change-id: 20260730-elish-board-id-8ccd9a857382

Best regards,
-- 
Dawid Wróbel <me@dawidwrobel.com>


