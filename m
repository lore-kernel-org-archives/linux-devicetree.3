Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612325;
	b=z+gf3lkMxRilO2+tzwewLRN+LH/QAGoXckgWAN3QNMPs0gARt2ur1M2+fUsAIRZdJDd4
	 piuH6ulqgNPnWViSwtwFQ6NY8MNQ/KE3/6Ss2Aad0PPFbAQqCpu4rK6D5pX1oXksB/d2q
	 95lsu3dfRLSPHeEqkLgF2a/kvGdUWaWKfTqqUAFpbILfDEyaXv9rL9utXZKnMTviLhOcx
	 hJNw/WYmoGrMlzJJm1HNbo0qMv9A0xtphDHHrrxCOoY5GAUZmQoM9wbisrxR3kf/D6Kbm
	 PJvHcBQ+pc1a09ckgOp1ozMDtV9edvFEDTnXx3yvuzSkhowRODuPVGpKrGqJRVFyHMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612325;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=h75aEkUrkcxTbFO0cw5uCyPfhp/ssg9PnW+LsVNZA04=;
	b=D9wi9MJflhwkWhq1C16csAAFOXiLPObfFEx84GBgNz3x5koooo6abzgRHtbRmsiq9HDk
	 GQy8F+vYmJ512sSBlWuT5doMtD93K4dsDzvMRhIZHZIbgv7PUPJK+jvah2cBnASM1T6GC
	 F0B4kg7gD7RVwWzplBF14P8rnDGwI4PDsO+pLi3q0TwjZBbS26IB+xYzoSpeykUB7oe5b
	 Uf5Ex0NqBwSDO++mewHRtG1a/Hs+Db1AY5bgMzkeVTifFR49eiegKh5LZ1gWb4Rz1qpkB
	 B+jEIm+N2Lcf26OWwzmkMzGlctqqvV/C/Gg01wlAZnrQGsnZdZcPrtpgdnS8OQjmSbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=utb6nBNx;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD12606A329;
	Wed, 25 Nov 2026 13:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD12606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=utb6nBNx
Received: by chaosmail.tech (Postfix) id 0EF4D1C9FFA;
	Wed, 25 Nov 2026 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795612317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h75aEkUrkcxTbFO0cw5uCyPfhp/ssg9PnW+LsVNZA04=;
	b=utb6nBNxCO1iQD13lcYGX+SR/KB+yCFQkdoAAbNoV0F2wcTylLVsvpdA59iZhwt+lPbNBn
	LtOj7XCwVh131NmvLuYtsCAPt8NmacGZ+m6VUYho7f0eoKLvUX5GWMyWueCx7nDzJQ6V6D
	yPS6BNdIoIZ/K0PbhW/3EwDOuECJpFY=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 25 Nov 2026 14:11:46 +0100
Subject: [PATCH v3 2/5] soc: apple: tunable: Allow passing NULL to
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
Message-Id: <20261125-t8122-phy-v3-2-196e20b3537e@chaosmail.tech>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
In-Reply-To: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795612315; l=686;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=6r5CB8eIrYPysJHrZefwLcauhrBv1L4lVD2FHBotaw0=;
 b=7Hl3SSsNqQXTfHDPCF0hI7xu+JIZKPPdwv08gGMbeUKegkr4xT3fwDlP/Hr9tKYjcernMLIhr
 4JQJjPbMVfnBChztXLSPhC6GaEI+QDEWuH9MkIo7i2kpmLKblCWqueu
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

