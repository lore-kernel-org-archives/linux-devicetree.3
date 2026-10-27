Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102464;
	b=zZWWb3FA2sXldueWXsOraLyZaAE0+4kiTeXEWpaWWJCifMcdjEkLAk9lu6mBV+J17UKS
	 lnAFMgkXA3ebV3TlcxR5MiAtxQNOEOBiUvUHP/nWzNH/IEIjWVOWHCL7CRXdkyChyvrwf
	 FH9dCT581XZBUDRbfReJbTL63RMCy5aqwgGuC0G+Ycxq5yyFYkrwEkHeLWEMXTPUK422r
	 1xFxK8JmNBb0RoX4uc05WB57k+d7Q1UEk3VnBW1bFyPdXUjBs+NfDrlAxZ6I8cfG22rA2
	 dl5UmJxzHrgUoattTMMJu66PGfeOri9oqkaQJQY6djQBKBRFaBzI//1eSqjuk7E9Q0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
	b=xT661WPy8ZGcSQ79hm47maYKDybuy43Ui+qwD030gfhLJR7E1Y9z+VqzpRClJXYWYS+E
	 hcIhmnW0FvzFTh9F7EI6PYCJZcfE9MKDb125u/HdxSI0DbzBHAof22KjDR1+7olCl5xZ+
	 eKLlokmTmMcJ1Is+CTsAxEZvAI/VcFD8v6HHmRHD9+GvCvy7MPspzg/kKUMfWOdkliY5L
	 UfB+Old4tLjMNYDufboMCT2xj0OthS9Z6S+sWxwKkWyVyaQsa3vgLh0IGUujbgSvhKSel
	 jCjLT4c8ktJUljos+bVAejoTqicfntuC9cyhfXKgpWpe9spH3cUEzK4o8APWG9v/NVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TxnE6HkS;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F060A3803
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793F060A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TxnE6HkS
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so5274412a12.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102463; x=1793707263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
        b=TxnE6HkSm/cAlbvKMme5D5UwKuEoIsGqzBXQWe5BAeNxcrBBNg3gamuWAv0zjMcLp1
         C25hq3LrHYFU7tBgWoYYbL1/P0S9KUNsVtF0hg1a0OOU2jZIn8saECLD7IkiUXMlJN82
         WvNgK1t3oR86E1EYtHaxka1TEwGZ4httlFXNNltQuZsezGrafGFnBSQyiDodQO6bUdfj
         b1vp2wkO5/9lJD3sscinQljbsYNe6ungHs08+hEjEJKthJWfYFGe3o+46U1GT2iWmDpL
         hlfj2KgoT3xH6dEYYLtlRyIZ+Byip2Os+8Za5NAkoBFigQDL0lGDkAxCGySfcD2ZF3O9
         YgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102463; x=1793707263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
        b=yIj4X8qSbfrx9vh0PCvtG8xelW4vS2SIO4PDQTe9xcmAa2gQTzhuR9shHY0asVAGwl
         VT5m1TdLajp2yXGkOoVzhWdW3KIC8pE7An15rVh/98nLWkgflh0ixH1elKos0T3hsHod
         EyORWGqaL/JgNTIry4bElKTG1QslvfjNB9Tt+lSpgwJ0C7L2NcdXWssPLeNHtxjoQlgc
         EKKbGdSJcRWJlYB1v5NCA8w8SpD6zOf1u+kyRS4MLxolGU3st0mahFEkm08xkVV4nA8f
         DvFsDDug2kuZHLuIxW+WxnlCTQ+NleY23eIGEk1thZjhUE+2D5cNzsnmiAneQEPCjnyB
         bBig==
X-Forwarded-Encrypted: i=1; AKwUvBxAOXsVt2MuhUuDag6hW/ZszPxZZxN/OAhqr1EjsTJpY0LKHhrjWEj0oVq9+X+eeGv5Y6miqgBO2XcS@vger.kernel.org
X-Gm-Message-State: AFq9FYLS2aODdP5ll0/ysNKkPKco2uQPwieSWbFYqFMqnoub/FkFacyg
	5tCKZ400eMWXcZjJf/Njlsi1MFWKOFaSYO4y4KPZyW86hM2LPXYX5WaR
X-Gm-Gg: AYBFou179nInvsMcmNddpDfpMdk6Lk9vm/kUn/tZkPeirjTs0j5vbLIwyIjWIRYS8lv
	Z9hDI+bAbhDRnnrnmrNtCkEp1o6SQgf8o0pcpQ3axctRWLIEL4Vi0fs+cDVFe3rl/7VAWE1ZptU
	3Y782YSsH5Tu2nh3fF87QyqprPJeK9yfLsW7xRbTOgAhg4aWxAbaz4SfhaikOJ8r9I70GAY9AK2
	mjGkOzBUufl8eT3O1I758ePxWRTs7cRjfVUiHy1ArbtNt3tJnnvgw4Dhj5n8BiAzvbmtsj/HU8e
	byyKb5DCkOxFGCmMbRojfqjqBucwBWzRrZiTHtbYi9D/mmmI+TbFOccWOhd82ymh9Jow4cHMIoQ
	WT5R0GsrvUyQS5R12ho9CZvwUdm+eEMM5lcaT6z/Lu0Y2IjY6+Xrd+sImyJnmuTpwVIJWbA6a61
	0gECJ0m76pGSHKG3CvjFNsvf4mUf1Y7ddyjoqfPC3vo96ejIFxxgNFLF1pJTCLtdWDs2yHzvEeC
	xBu5m3KZRApH1vl8TYUet3PIBbBYj5K6ZE5mgzVuwu4XoIdHMluqEphR+tKyg==
X-Received: by 2002:a05:6402:b04:b0:6b4:1037:2b6b with SMTP id 4fb4d7f45d1cf-6b44311e24bmr7137730a12.45.1793102462588;
        Tue, 27 Oct 2026 05:01:02 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:00 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 5/7] ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:17 +0200
Message-ID: <20261027120019.93611-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Wolfson Microelectronics WM8994 codec provides three DAI cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
index 0db04a90ac6b3..39bf1af7c3ab8 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
@@ -69,7 +69,7 @@ properties:
   SPKVDD2-supply: true
 
   '#sound-dai-cells':
-    const: 0
+    const: 1
 
   wlf,gpio-cfg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.53.0

