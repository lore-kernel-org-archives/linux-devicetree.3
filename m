Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3139792A;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786210676; cv=none; b=RdcZUAstfDnURwx24WFYu7VHIdpM45E1PfVBHieOx5vdgrUpq8loWNFph73RGWWVJxFbFBnaR15bMt38uf0Z3dgEJYD5tAaApQf3aTswg+0HToiG6joCNpG8AsEJX0kEdrUX/Qe5QYhS8856hKZR05MDfaVikFymepc3KPNY+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786210676; c=relaxed/simple;
	bh=VLIAIkzo2/yvCaYnViWYTTNbA28KXzebnHrQPRF1ADg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASrb5h2pEqvPeqjul5apYKqb9Ebxjsrnzi2bjTD2NigLm+tUqb6XWk00JhbaGlo5IJY6L7iJY0jWzaGadGMkToaFLzqjli6bbHTM/2e0F8l2Qtt6x/xtONUYkY+FVSXGl3ENdn5nlbftT13xpTIm4y6SvAJtOHATbL+fg+BnKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfrNxfoN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfrNxfoN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77776C2BCF6;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786210676;
	bh=VLIAIkzo2/yvCaYnViWYTTNbA28KXzebnHrQPRF1ADg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mfrNxfoNexJIzQxmrSX8k2QkedezEAAqefndkUKZTylg6MMSQrxmq1SKngQy0uGN2
	 L3LYMTvygUtdnc0WZuyIHe5WEKrqhuavevNXEm1ZblFvaH72nt58j1BcXgQAQmgK7Y
	 JwNrsyYKDcsmlMCHmizSm3MducCRyPjQwCn2tF2oTO5c42SPULhsP7B/JD7muerqU3
	 YKMtq0pn2tzBqhBA8lqdatFwD2fINrRmfRoPTElS11N5XReYOyKxKsDhFr9r4aPHCz
	 lsXH0E8egDltI2f9LS+RvxMD9e7IVCza1NHBHlJQX+dQIk7EJvmbbImxwTv9sNsB7k
	 fu7i5lyjzixIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B836C5AC67;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 08 Aug 2026 12:37:55 -0500
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Retroid Pocket
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-rp-qcs8550-v1-1-a5a365ba3dc5@gmail.com>
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
In-Reply-To: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786210675; l=845;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=CQ3KEK5k7XmXImz5IBcsI/87FaFPYBqry03mRtUeoNA=;
 b=7BicmJQV531oyEVq4svPGPKhrfJmzzgJfX5bcO1li6LAgwjDRde0ySgNypOFRC1faMJ/mi+Gp
 wYE4GtaIMVpDjh1GjVfgOr6G6XY3a/RrXBiHlAzD1CpMN7RdeWEzdJN
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add an entry for Retroid Pocket (https://www.goretroid.com/)

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 420cf4c41354f..9719110762be5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1419,6 +1419,8 @@ patternProperties:
     description: Renesas Electronics Corporation
   "^rervision,.*":
     description: Shenzhen Rervision Technology Co., Ltd.
+  "^retroidpocket,.*":
+    description: Retroid Pocket
   "^retronix,.*":
     description: Retronix Technology Inc.
   "^revotics,.*":

-- 
2.54.0


