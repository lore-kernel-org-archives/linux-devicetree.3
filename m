Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925C93F4125;
	Wed, 17 Jun 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691641; cv=none; b=QDZZsT5oBUr+BpGU8MXVWsZkuRACLNrIB7pQZB0WdxDRdudXzn1zxrf/N7cuFdMetJkkHcPdXJpbwIKRmkDrs0WKG40YePnFr9Vk1vuSqEs9u7SA3RDVHwLZoUVK/VN7EcDTl95Kt/owBM8APGOHovbxazbpIgNXvpCVLmcEo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691641; c=relaxed/simple;
	bh=xiAyrh+SXE0b4N4ueT5n6rqHhH4Di07Kz2gzOVjxjY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jOrth7g9pDQKkIj/znmRoeeCntzrxwxxUN1hkItrotQP+Anjow5INIcDZqeC7e1NLYjcQYT+RX/iIeqRJyN7mB/ClGDtXR0BH2L6yPHZAcKujtWj6824HWKxn7EfLqwfSnGNCvW1QUJoc6I8mKfC/ntLkjBIDXu1dJu6+JoBaus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+HTW2Pg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+HTW2Pg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF22E1F000E9;
	Wed, 17 Jun 2026 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781691632;
	bh=INquSL7Y5cnzXtGbEvtaW4heAKduQ2IN62ykEM5bhk8=;
	h=From:Date:Subject:To:Cc;
	b=B+HTW2Pge8/lJvlk7E9WTYbwCYWI2JJqw4cJmJVF5FoFEggpvqBNKMLnQiGC/L5P5
	 UMagBEwUOPJoNMGUhvZckN2BwE58/ULmGwkqjepIfVygrGRXUVjgR5wlk0Oxn7ZISM
	 7dgDuFeDLbYroF0im1kXutw0PdvROyI2382M8YXmBl5HHVHgoNWb6EVuw96ctGHa4a
	 GRSco6cHnYLQvltnvT4yoUIrA/x2xcz0mWAe70nbIERN4zOGf+gQbqZKe4r8VNU9ow
	 TybYPzg8wJ/vF+XOofpVc3wO3e0VaaY6PokQFtFEv/pYwWJEisidCWUkbtKX8Msgam
	 1pjWf9iZdyK7A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 17 Jun 2026 12:20:26 +0200
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Remove duplicate
 includes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-topic-monza_includes-v1-1-fcef9ce489fb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrBtILGrxKqUUm/zqFJtIRkupe
 HejLr/FewsJIkOozhaK+LJw8AnmkpHtG99BsUumXOelLk2lpjCyVZ/g/82TvR1mB1EorqhQ6Ft
 rHKV0jGj5d2zvj9Myv96w0/6idd0AFB8LDHgAAAA=
X-Change-ID: 20260617-topic-monza_includes-e53e7e508f1d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781691629; l=1015;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=i8NJ8IM+F7Wb1x0re+SxCLIPUqjfFjEdgSh2OAy0/z0=;
 b=SMzbX2BrnYbbh7pxaMrm1s0PGR4oUpcn32NtI7Xi0fS8bV50Zk0C8sbCMx/AJ+OHth46wsoIV
 vtqQSq1hiykCUUKpIAjXaSSJt9mrghNNPUnq8dBtaFsMpUYx7F2ZOvH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

monaco-arduino-monza.dts includes monaco-monza-som.dtsi, which aleady
includes monaco.dtsi and monaco-pmics.dtsi. Remove the duplicates.
The resulting DTB file is identical.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f..f475e2078451 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -9,8 +9,6 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
-#include "monaco.dtsi"
-#include "monaco-pmics.dtsi"
 #include "monaco-monza-som.dtsi"
 
 / {

---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260617-topic-monza_includes-e53e7e508f1d

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

