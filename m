Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350540;
	b=IuxbhiRrBFNb+nmxQN78y+4KMk/QqMobE6p3gyW4jc9xEBZX8x2yvLVrM8IzUYITSuA2
	 TxV+NFiQsXgfy9j96XPsx9GDF0Vl5fOL3q70cFIRQCPndZVLdF44bfxqCDXbaV43RrKJo
	 cgRFs7YOR1LbYwpYR+aRqLHYrBObZ8Q0toPfig5T/a+tZpykg9Uy+fnI48honX+Wctiqh
	 e/JP9UFApe7qx3WbR/EYQgtn3ODyzy0RpiekIKPe0MaR5wT0nPMjaHpzLyAHEcVYnkCno
	 vgOCmDp59od7/OwxjgaF8Id35Wc3wZj6Bd185CnyjpGQCxBMztL1dFP85KEFy4Dha7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350540;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=h75aEkUrkcxTbFO0cw5uCyPfhp/ssg9PnW+LsVNZA04=;
	b=yJQaTPF3drw2DTKa3QWSvvvjIoH/Gi1yK3qVO3k/x6MNqTXRE0J5wUYXXMnlcfZCGrSi
	 gmr129sleb1vr/kaD/1imySd628zGLSSO617xgX8Rpl4AxyrUIg1Ck9BJGvJz8Ov/vU8y
	 88LkCTW7itmXll2hFPBI4Pg4b9n/p/WeWeqwmyrWUSt+ZYIjkTLMhHqYpTBnlvU5qpDgm
	 vZCiU6TOINb3OpzMVAjSHYUoKZkdOg+vvf5veAyS4r0jVDbH7kCnXik8g73rEEjz2vz27
	 b5htaX8Cs1YHXFr0ZTWlEDxxEn1XuUmi+GkSkyVpSEgKwY4CRzXOHkLMOSaj98NGvcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=iNRkE0GT;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A68606A332;
	Sun, 22 Nov 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A68606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=iNRkE0GT
Received: by chaosmail.tech (Postfix) id 378841C8A07;
	Sun, 22 Nov 2026 12:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795350538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h75aEkUrkcxTbFO0cw5uCyPfhp/ssg9PnW+LsVNZA04=;
	b=iNRkE0GT/c2pHOFDIFLAYDrjwwfN7LhfCbK5QfHFh7pZAYC9iNuZDK4Zetq5MI3aK1XsKq
	mB+B/+M05BWh1Kxey+0U5prnpUiS+pkZ5Xm9Wx6PcziBzYvapPx2FhDHgQzOe8CC8oN6UN
	e5auh9Qehe3+AIpBihhNnrdY736FFC0=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 22 Nov 2026 13:27:58 +0100
Subject: [PATCH v2 2/5] soc: apple: tunable: Allow passing NULL to
 tunable_apply
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-t8122-phy-v2-2-8d5c8fdf31ba@chaosmail.tech>
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
In-Reply-To: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795350536; l=686;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=6r5CB8eIrYPysJHrZefwLcauhrBv1L4lVD2FHBotaw0=;
 b=DulbLg78Z8L89fh3v/KHZ+EdoUN6XeH472y6cUCC9orxgl6dBjJ24Xfxpb5prFk6j4Sy37oTm
 HE2jxXxVtDnDJutYsiahpSH8E6f0RTXZg8FuRuSO5a5D6SfIjW02r6E
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Make it easier to have optional tunables by tolerating NULL entries and
doing nothing when one is passed

Acked-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/soc/apple/tunable.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/apple/tunable.c b/drivers/soc/apple/tunable.c
index 659323839171..e89e8f9bb455 100644
--- a/drivers/soc/apple/tunable.c
+++ b/drivers/soc/apple/tunable.c
@@ -63,6 +63,8 @@ void apple_tunable_apply(void __iomem *regs, struct apple_tunable *tunable)
 {
 	size_t i;
 
+	if (!tunable)
+		return;
 	for (i = 0; i < tunable->sz; ++i) {
 		u32 val, old_val;
 

-- 
2.56.1

