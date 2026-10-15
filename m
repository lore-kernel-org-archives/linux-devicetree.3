Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1BD3B14BD
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041644; cv=none; b=AOsq0n/zFUt8MkRAlRei9zSOl2+SlV+mvXu3OygCV5Ex+Hs4vqRUodmEbFOqNB1a0PzPJ11G+IkRmLoIeEDJzJWsGUqSfz1EswuOfRODeelGZy1fqLntSX7Yg3/4OLI8vTxHUtS2Kx+28fVPb7Hcw2m4LfLIE4LiD/rg2US69QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041644; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ssxRsdSPOh1r8A/4v5+fABdxTXgR+fmug6IT4wil6YUW0fjhfpTu3ILSAPFs5OQDxhxVXxjmJBUi8mMFRR1rtCHau/WTqtTjY5wntk11OjXQRhLfYq8apSQNgJZvTFU5XD25yzBJolR1ZtEXf7Zoo4yen5EhtrThdWJnuofJbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+bFMeNC; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+bFMeNC"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35943f55c06so1598848eec.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041642; x=1792646442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=n+bFMeNC16QxkHowkyZZdcBZF+iwwaAxkGiKXiZzqELskTBfXYPWZpxIOGrZzOWW0d
         SVnf6uguN05UPRKHoHzm/c3Tuz1tMmv0AzbqRNkL3lWTcVcyiCknNUEURX3D3yHJL1Kl
         +shsmDKkbKf2pxuGEbqCSnLfqPGkywUBSBvjnfgDLm5aDxpUhZaYpv3CLeFCWDKloHv9
         VFktgBM4eqFlxZ0ibyPZH0amgmBnZWn//NAOpw71PpeLuWKKuI14FkCOaEdSijtfTmI/
         h6yKqkZNK4ieZF6z5Do5oXIOiDyK198E/cpbFQcQFKh1mW28+6QcNu7j81DU3TOmqJcI
         h9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041642; x=1792646442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=bXm4vcQd6P8avwlQLzPCyxdEgsxk7rDtTRVeoKAnFlmGoHz3K1xbQJHcHpsAGgJCHi
         LVgf1eyIJm8+cYsKplyM2WFwGVSIgDQHPshSdFsaYkJct6bHx8nLi9VIZN5ItzcVDS3I
         Ml96zte84O5quktaRx2cywb5iRA91aRaR1Uv86TDNiiXcce27Z5OP6Xi3nrL+i6a/TAY
         zvV0xjLJMz4o6uNNG2vkiM7ZpPLP9MaQBhLC+TFX4OLhdyiA3oBFjv7mTYll1NfXVh7X
         3GMejNkYOk3Y9fwViXz2Dh4j6eUW3d26K8ayK3YIrxH5C9wh7iQS1hcSmywh0oUkAB7i
         SZmw==
X-Forwarded-Encrypted: i=1; AKwUvBwBx0S9C6Z8BbbTKnFboy2DTluk110DKYTRGgiCDDto17bQPo3ZsLLwOHllbbN8XVMjU3HY69xwgQ1W@vger.kernel.org
X-Gm-Message-State: AFq9FYLvHsj9c7gcg9KmL93CTZseRBwmrPf1Yr7niebKpROekV8n/FVx
	3+hGNK7aI+jvJs8PlqhFbQfSSkDIsmYT/iyNxGsF5dI0uxBbqTMhlaP2
X-Gm-Gg: AYBFou0932TrFIXCJ0UJjx/misAtiEDuHugqxQvxxidJkhbZdFivcWur5R1ZOkwLpcY
	65gNoQ1TIW/6ynHIHZt86s8WSqZRPhStvYjfhx3oQuzsuN7NzqgeIt2cR8yU0sHqyx+91ZUUCnZ
	QnL92Xk/IwKptZw3MEDNufLP0cQxEY91RU6fmpGJ2pEjLsyr5b7BrJ5TW496/Wc4RAmrW7Prx5B
	FTTtVN7F69XdVpVi/fpk62lluRSVgtH3MhyOvFbA5YqKbLgSmKDtzoE7KIY8ukngqalivWeDl29
	W0Vn2G6xiNbB8Qg9uzrBG0muoLzWmlJCt0PIlwjxUwPWeBN3lwZPtyF+mYaiutnG8k3+9u52YA3
	nH6VY4PWVsx5F+XvFwV7R3j65a6Wgl5DsWPF1WC6ibLv9pLtSZa8MGEzoRDTzVXqa1ADhFJnxOJ
	QauV2ws7YG+pMlEmwWxs1J56McF5yD6hr1oiUyvIKXkWGom9b5xv+lfXOS/ESWz9AcEWcJ2pnWW
	yJnx2+czecYcYXyq2ZnpaW7jLlf/w5PF3T30wehPnBDDd1dNf63aJk=
X-Received: by 2002:a05:7301:29b3:b0:351:77a3:55f1 with SMTP id 5a478bee46e88-3536c593e65mr25970438eec.19.1792041641930;
        Wed, 14 Oct 2026 22:20:41 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm12923112eec.25.2026.10.14.22.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:20:41 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 3/6] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Thu, 15 Oct 2026 05:19:23 +0000
Message-ID: <20261015051926.13752-4-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015051926.13752-1-sreeshankar0910@gmail.com>
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

