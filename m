Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5C3BD64B;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283268; cv=none; b=Q6h+LPjeTbVnD3pF0Y7bqFp06MhtFzjR9fnmuwhQFYUlbG5t+0Qoa0WOtPT2vDTi4f8TlyrT4RnpfXD3GW82yvm+f0mYbyXT3EOLOuU6VJoaKSL06GFXMOZSefz3OODZZiRyLKWVHoNpowP8alFOeZUTvqGnFWEWleNyIC6s0As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283268; c=relaxed/simple;
	bh=vabLmCmKX/+J3rXdTqzfikoes1bTZz70L0DuNHGncL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWXQK7yGrtVZkkgqVFtexT2h4GqLwMzoLCjeUy2UPBK7+sWZssF8at58M7vJ2vbnbkDVSOPHeBrGQ2AN9WDfjGKJ2xy2KOkMc6uOA1yvvn5ciZ/DNjK8wQBDMfJJsqtOuyvhsLMvqri22JAzqzxCmZDcyHa3d5aNdSl7WKvVxso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeibyQZw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeibyQZw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F05AAC2BCB4;
	Mon, 23 Mar 2026 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774283268;
	bh=vabLmCmKX/+J3rXdTqzfikoes1bTZz70L0DuNHGncL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WeibyQZwLasTSFoGRAaju2Rv2AK9ThGo8i+CBZsPBLXRQHdnEHSwVsAi7ije7Rxm/
	 LXUHpnBYTrYO+sn6bxBcoNyMphdHTmY1f0dL2XS3yIWBWNYYNIXltP5X6wjhW7+DPJ
	 6X4uU52c/jngpORoKAowS5kq6dOnYU2G2cE5SOfb1hm2NoYSuHOk02GCDB4Eehhoqe
	 N/R2nAZgU6AyJ1Yt0IpVdZTQTVjyP0vLNNYHk7r5lYeoEylD0Z05IfKykLi74nGiz7
	 7FC9e6FPGdiKuUdT0oq4EJ5fSsh+HLfJmySVDgRwlnaEZumXkv69S4y5el5DYgJ0uw
	 jBVpAyNMsTmNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC007F483CE;
	Mon, 23 Mar 2026 16:27:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 23 Mar 2026 11:27:43 -0500
Subject: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add AYN Technologies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-ayn-qcs8550-v4-1-33a8ac3d53fa@gmail.com>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774283267; l=899;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=51HjCxTlAcVkrzRblUjcKootVCBtxWuWQ8ylYfvfpOM=;
 b=0X5u49dIQdEXO9jdAppLYKcg+dF9p4YDRSo0qbeev+kBhTAT/Pq9rX6UL3U5TwFpN+Qm/y/9R
 NPSOZNlMs9WB6WObrnnFpaUs/5MkRh5/B7y7bZ73gwIiVrfnnYNucMD
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Xilin Wu <wuxilin123@gmail.com>

Add an entry for AYN Technologies (https://www.ayntec.com/)

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 306343407019fe74bccd931a78ecefc6889e3fee..e20d9dc6a8322b79a5d80e7d3f7135c2b4cfa2ff 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -221,6 +221,8 @@ patternProperties:
     description: Axiado Corporation
   "^axis,.*":
     description: Axis Communications AB
+  "^ayntec,.*":
+    description: AYN Technologies Co., Ltd.
   "^azoteq,.*":
     description: Azoteq (Pty) Ltd
   "^azw,.*":

-- 
2.53.0


