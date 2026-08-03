Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5B3377ED7;
	Mon,  3 Aug 2026 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766920; cv=none; b=b0YjmqCxtNFCqIuPInb+Fx1wl2wC5wB88jyAz2tj3YPRkb4hX5Y9RqGqGKl1Prkj7gi4jg7z05/QvbX205fAo3ArQlpdiGwa8KUwWMlmU1aPGDph2T4dELkJ06ptvCmfmzPj8sUqkePiNDNWKA4mMoN/tRO7xNQO8Uw8apYgasU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766920; c=relaxed/simple;
	bh=r/J2lJyHZ0CoKbhoEdf7bdU4Ld2xyIOu5Ik6dQHDit0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jtg/u5KOHLOkwMEeqeaZzczYhJO2bK2bukIzN3GSl354bcXTx0Orufftx89Wx3vWx9EXtxrhQH6n5Z7bH4f9Fdi/a2XC6pn/IoiShAfjJG6p+LeJSqOKoyzFhQPvH9BccXXW9WYrFpiK28ZF/Yaz+S90FjEoLoZQ+gwPPDsu36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBI5/VSm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBI5/VSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DDE1F000E9;
	Mon,  3 Aug 2026 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766918;
	bh=Y/WOqbRJsz+nO1gOIrvJEj4ZILrwHh44zY+hjxrM2t4=;
	h=From:To:Cc:Subject:Date;
	b=lBI5/VSmx9ZCTWYYi9iJQVSNuc82wi9u0GgP5N/qvLbPoWUp5qQBEnQY2BPw1ENG8
	 TMaAwoVN2wLAuZfvvZFi5LZqQKovz9DfyOswSBKCXxfyGx131ORVYJbxT1AiH7OM1d
	 BAzykEudjlaKjrXXaEZhjuaTf9WKq/dgrM73vaKr5PgsweGt4yGpRxk/a86kq9SnDq
	 ca5m8jXmd6j2wIEYaKC6z23U+47ptjSAwWxeT7wrCu2vLsO82z6kE9rcVn9UIdvWhV
	 STEmOsEDtL6fPNfrIETYaxmSUslTVSbRPjASAL5w6hZRVw0yzBSk0G6228OwVqHW41
	 qoQMtayizy9/Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] i3c: dw: fix APB clock name
Date: Mon,  3 Aug 2026 22:02:24 +0800
Message-ID: <20260803140224.12648-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dt-binding doc says the APB clock name is "apb", but the code uses
"pclk". Since the dt-binding is an ABI, we can only fix this mismatch
by fixing the code.

Fixes: a0d48ebf39ce ("i3c: dw: Add optional apb clock")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..0625587f1527 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1579,7 +1579,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_clk))
 		return PTR_ERR(master->core_clk);
 
-	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
+	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "apb");
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
-- 
2.53.0

