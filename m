Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CF01A9F90;
	Tue, 28 Jul 2026 00:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198014; cv=none; b=jRo4BsrpBRU9pPCI2hSlObALJL33RsW1Jopk2rj4reI0VzAwrhszphlrkL7gG4Z8D7Q5VAPKz81G9KpafI9dwp3FhKIGpYPsUev8ECTvHtif7aFfjjiatkyTdiDUv7u8p82sfORNFFDKBeHHuug/1oJqZIzoOIC0sH5Lq3nto3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198014; c=relaxed/simple;
	bh=seaKMCkdk220nTtDtwSjQrhoXckUsBUm7LzHunyvoVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfzplRnLVbbYUTcnqfSIn4CFwKnSboFBqHEA0pWjiGi7k6zQVRIzrvF7ZBmLzhZV2nT8an6mLBQGFHgOoCkcaFG/f8/edIOWTHgvkEbJvvN1moku82/uKly1zk1Sr+4piJBxQNVpXvI9Z2IbiJrXgmsVe41jNMrWjrZJ0Urh4go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6BY1Zub; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6BY1Zub"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCBF2C2BCF7;
	Tue, 28 Jul 2026 00:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785198013;
	bh=seaKMCkdk220nTtDtwSjQrhoXckUsBUm7LzHunyvoVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l6BY1Zub8vS8u4eYYXPQJHk/RiGoeVQfyLNFHMb5HlF+TXdKc4Vg7dAc7X7M8jP3R
	 P6WO+Lb91iXCvC0Kajnbw5rT8XxbYrEa8J0d9Du9xIQ6PJD8p8GFiIze4qXhsREiid
	 rDT2Dy1gUrG+KOLTfV/uNLYVA+k7ok0upIbLAKOP5gKzHUrUrG3TklX2UVFQIUFq86
	 Qdok/5frelTNjJ7q2XE8U53kC0fO6jSzNsuAy7wCE77q/iHa+1jD4VDm6TAabyn00+
	 Ys3bCEp583ip0+CLfe3bj/8eDdDVTXoexgwguqp3GGe+793QRtg87BEzLIypj1q32w
	 Q2dbp9dnet7ZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5EBC531D0;
	Tue, 28 Jul 2026 00:20:13 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 27 Jul 2026 19:20:09 -0500
Subject: [PATCH v9 1/6] dt-bindings: vendor-prefixes: Add Chip Wealth
 Technology
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ayn-qcs8550-v9-1-e3db456e10e5@gmail.com>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785198012; l=829;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=z8n3DC7zMwXKZYVjPNclTj98s/g77Ad9HNvCEU7LOTo=;
 b=clZW/4VbasoF0wdnWPirIqL82SL0XqvSV1h6hmAYQzP6chZDyU2nSkrhaDcbtvF/DGDJKP++S
 AY07rc6Tk+pC7WKKc+VjzYLUjlbao9qn8naO9zy7q8XoQ7lQAniMDbm
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add an entry for Chip Wealth Technology (https://www.chipwealth.com/)

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e6372ae22caeb..488bbd95ea5bc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -327,6 +327,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chipwealth,.*":
+    description: Chip Wealth Technology
   "^chongzhou,.*":
     description: Shenzhen Chongzhou Electronic Technology Co., Ltd
   "^chrontel,.*":

-- 
2.54.0


