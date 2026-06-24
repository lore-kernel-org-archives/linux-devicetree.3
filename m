Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CDE3016F5;
	Wed, 24 Jun 2026 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782315957; cv=none; b=M0PNMF5GBFUFjBSrsurHk6kCwdM96ZzSXOFGKaYSYyXwzn1GdJgNHTjsNqSPcpEyIkbSwRCtB9/Mmy6Wpj9rpLqOuj4B0WlB1dsM7o2zmlOXnw/EvriJegP3CF2Ovx2hgENw1kg+3vtgMGZhDTETYcYPeGwbWeWh6gdNagmnQQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782315957; c=relaxed/simple;
	bh=36brmetKtrVC79sVumiN9i3JG3kddwy0+O20pABEssQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDe9ycsqMwTfQb1jkf6YAw2EUM4JtkglpUj85YwYc2fkkBQy6Q6FZC3k9QAG7WfJViLZN67gT11ibA4v6uKUi2uhiieXm/zVOHgX7ePZ9uqArZ3gdyOJLiWX8tp+deguin6rpmM/feHIgGXVmqrLZPuuS3vxJMuN/ikjdSPt1pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gY1VQqs7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gY1VQqs7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC51EC2BCB7;
	Wed, 24 Jun 2026 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782315956;
	bh=36brmetKtrVC79sVumiN9i3JG3kddwy0+O20pABEssQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gY1VQqs71jWWgmWiq5CNFJh/CXJFDBOKXz0IMNPjlkFgfN3TB5vF4WBm752mLgMYB
	 dGrFkva8j1DBuoIcHTf480ottQ5HWXlKGOIXnWtLtnpFp4aJSnnWN67tAI748YCJNV
	 PT3aLIwpLtqr1UNmWd9M+ICYJ8eH4HT2uJpB/+Jn+A05JKMo4KJoyd1dUR7EGVQOQC
	 PLqBRKgAPQdbAxAWd1WIg3mHUB0ABqpZ70af5zq+44l21MIwMJHxjHkY2NRgprg4kw
	 7FgVtILTFCvVKmy/r6E+ZDOdthIUdZguYCpXHI8BNzS5GXUsI+m1Bk7HQpOvlKUn9Q
	 h/3Osrhj5nuow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55C8CDE001;
	Wed, 24 Jun 2026 15:45:56 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Wed, 24 Jun 2026 17:45:53 +0200
Subject: [PATCH v2 1/2] arm64: dts: mediatek: mt8395-radxa-nio-12l: Drop
 redundant i2c2 drive-strength
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-nio-12l-add-i2c-40-pin-v2-1-cf3707a6aaf1@pardini.net>
References: <20260624-nio-12l-add-i2c-40-pin-v2-0-cf3707a6aaf1@pardini.net>
In-Reply-To: <20260624-nio-12l-add-i2c-40-pin-v2-0-cf3707a6aaf1@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=m5Cx5Z1IWJ++CWhQ3mc1twTHRBYJFzAA/qKlYFYZhuo=;
 b=owGbwMvMwMFoHWf/eN7xty8ZT6slMWRZ/97sedvCKo+7fEqerwwrv/y/74Kpf9LvCH5jtBLrf
 TlRQ1G2k9GfhYGRg8FSTJFljYQyz7f1r07d8eiYDDOIlQlkirRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOgYM3BxCsBUF1Wz/5UT4fJ//z+5RmDX9y9Lxe6xd7jsqgg74CyyLfDv5ylaiVc7cj7l+17
 s5BHST/nfK7Hnr9/Fxls+F5f5V07unKFkGruGbWqS2aHl+9Z4KQg+dmCo2FdWGHZq0qU5rBKfN3
 rlnym4pWBjHrldYaJWiqTr7VWZtwNuZASpTr3RzmZrKuHkrjHdwezHpg67pj3GF/ezRj181i3EJ
 3TnQaLl5oLTVTc7n7A/Tn7lzOn2yWtyyfFzMx/yaAT/sLaevWDxg/VvbS0n9/NOKtxux3pt95XZ
 3+LzD9dG7vQuNam576un5iYWdnG/5v60ekPnhTbnm2TfiQjeeh6qJ/HyQLksz6XWBdOfdCqa2r2
 fXXZNBwA=
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net

From: Ricardo Pardini <ricardo@pardini.net>

The i2c2_pins node specifies both drive-strength (mA, standard driving)
and drive-strength-microamp (uA, advanced driving). These are mutually
exclusive: the generic pinconf parser logs "cannot have multiple drive
strength properties" at boot, and on MediaTek the advanced driving enable
bit makes the uA value authoritative, leaving the mA value dead.

Drop the redundant drive-strength, keeping only drive-strength-microamp,
matching i2c4_pins.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
Assisted-by: Claude:claude-opus-4-8 # vs Sashiko review of upcoming i2c3
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index bf91305e8e4a5..589a5f07d5dde 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -784,7 +784,6 @@ pins-bus {
 			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
 				 <PINMUX_GPIO13__FUNC_SCL2>;
 			bias-pull-up = <1000>;
-			drive-strength = <6>;
 			drive-strength-microamp = <1000>;
 		};
 	};

-- 
2.54.0


