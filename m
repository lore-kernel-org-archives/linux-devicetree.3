Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699EB47DD75;
	Thu,  4 Jun 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589930; cv=none; b=MqjG0A2CON+SiroO90Uh+CjL1cdg5wJ9mL/8cn8+GqnMDNQV2i6SSJmSPPaah3zEZqLfJAE8nQZ+itc27kb17fAYbtqRxzzmrqoOTYDk8Q7iTPCzWcxWix/qdmgoBnmnPBFez0o1La6ceKYafja9TDCM4lPqNjtxX9A6eLlB7yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589930; c=relaxed/simple;
	bh=dGAnhZyp9ThqWpBanX+G2jl/9rxp8oVAzFmh/PruNkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nP+dFyhaZdSng/Innm2WST1nGzurmHuivDuEwPMeauIJ2SmXUgWZacMBy6CHCcWjLyt3YOdtWmCYZV4WzT4DB7kUqBmUag01uy2ZzIgzKO7BheqHulWxbFjiySWwiTh6h6RfXuX7lOH/aco72F+5PT5ewQaC9k2CrB0xBd3LmlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCQodflk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCQodflk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 074F4C4AF62;
	Thu,  4 Jun 2026 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780589930;
	bh=dGAnhZyp9ThqWpBanX+G2jl/9rxp8oVAzFmh/PruNkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WCQodflkTFCnors5Dmvo/Kr5RQ54FjfLRvS4LLgPJIyAbaBvtl+rrUuu3P4D2Atza
	 l4QS1qY/Tk2WPsprQd7mguNNns05Ek+rFtCfpG793ENLODdrtvWftkuyqIsRB9G5p2
	 rvhdrhf3uEUrF9NndqdYW0TQJBw6vB9kdlceOfXy3ROkbvIs/hjv9wWlhUn4d5SKKz
	 mKgmt1Ol4HrxyReqSJZt+QsQ0hM0RULn46BZPc+laoEzaQ3Wo1LH3WbDMtUDQaywuy
	 bQcY6LYREKAJA2hpR9cc5A9wcEkqbOdqdyWH0x5uUAAX46mwYAWK3YKv+7AXeGChf9
	 9vVUyrpq27kUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2254CD6E77;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 04 Jun 2026 18:18:46 +0200
Subject: [PATCH v3 10/10] arm64: dts: qcom: sc8280xp-arcata: Drop duplicate
 DMIC supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-surface-sp9-5g-for-next-v3-10-6aa6f6612c10@gmail.com>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780589927; l=1416;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=JlRG4nTcgg3o5MKMFi2SWQY9MXhILWt8VcNKctZNamw=;
 b=sqavwTYfCveO9JX5D0x1PTWm5gw8Lfqb3k0bDVfFwXMWTPe99egXp0b48TQ/JBWig3KU5lNKl
 LVXSuuPDra4CoysDLt4JwyNiMNkCoY7y54Xi6CR+6Ps9Q35oFU19tEz
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Align with the reference implementation from the ThinkPad X13s.

The audio-routing setup specifies two power supplies for each DMIC,
but only one of them can be active at the same time.

Drop the redundant routes to the pull-up "VA MIC BIASn" supplies as
done in commit a2e617f4e698 ("arm64: dts: qcom: sc8280xp-x13s: Drop
duplicate DMIC supplies").

There is no functional difference except that we skip briefly switching
to pull-up mode when shutting down the microphone.

Cc: Stephan Gerhold <stephan.gerhold@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 60f65fd450ecba8196509a620be029314e5efc05..74e218cf8aaaa5658982c5cda0b231802712650d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -776,9 +776,6 @@ &sound {
 			"VA DMIC0", "MIC BIAS1",
 			"VA DMIC1", "MIC BIAS1",
 			"VA DMIC2", "MIC BIAS3",
-			"VA DMIC0", "VA MIC BIAS1",
-			"VA DMIC1", "VA MIC BIAS1",
-			"VA DMIC2", "VA MIC BIAS3",
 			"TX SWR_ADC1", "ADC2_OUTPUT";
 
 	wcd-playback-dai-link {

-- 
2.47.3


