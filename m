Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110615;
	b=nHidcRKKYcxA6/v/g6nDcnj9ROm/qmiyWem4aqLCG+rsFUPECCUCCuFXEIFFb+7d6Szt
	 cYixtm10k5A+nYhVI/LvLZ/Hjg/SIXi/eZngKNSfIbdJZjqc9YyBwzPZTTJyuJqlDlO/k
	 kMbGOf1G0Eu4M2+0X2WRQzBBGBw0v1qjlmfKhOTLgby8Zm2+FeO58F5td+HAp45ayFx3e
	 D2ij3/H6awc+c4A4IOFKLSYBBPUQKgz2GKBsE4qkJ7Cb/CR1j2YTDsqm+iLIn5jM1STua
	 ep97LBpU/CBm2qj9U3yjow+h5/QkVeMtcZePP6XrTBrQmZfqwxf7cW/qkhUtyucTgpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VaJ32hdTW6OdgBsH5EJWCERCqsHcMt1Z/thd7ws6mpM=;
	b=Eh2qEc6ku5DsZGh5ujNTv/lH9mlShlLh/RRhIuOyovtUuIAuCIS78OJqXlUFdIemcKi0
	 I3FCDVYfNEXAJ350egPDylQn6TOD4SE01/HcSmT1iH7UfphAixUeJhi1bPsxSD3iXasK/
	 YTroryNUvANjc77OXuEDnmyFlbBeq40MJmWSNUasu2U6YdF5zLRXr4owP29vUNidcxEJL
	 B7sYcUh9oc9vDSefFD72qxAcUbo+bz8SoGobtsl9TVuD7FZ0Ef962EPznurQKEgzeIO9t
	 TdzoqP6C3ZGrfyVMfDE0ZYngz6ced8EdXJtvwyZdNDvQ2WVeSHso/nTu3QKfOV5ICOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=g3XD3WOn;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B5060A2607
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B5060A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=g3XD3WOn
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49465892f7bso2091975f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110613; x=1795715413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaJ32hdTW6OdgBsH5EJWCERCqsHcMt1Z/thd7ws6mpM=;
        b=g3XD3WOnMdsJFDEykQoDr1yoI2Ub/9w2hyjJixXgE5sY7EuEC6aXaSUX4dGIt6DqNK
         SOHsRGi8PSmlch6qy3qjIgF7U9PrEyx/Jy5IwrJXiqkDYDivx/QbQY78tg96+LVHBKtD
         jbxR3ktY4KV6imDUzRuVrMSdMHEbXesVNc+sD4j4SJrJlCTtIC7/El4ddJbDNzU8+L7S
         yOLiDZW9FtRRJz2KmT4q9auuwU6WN+ZSLQ+aZgBh22Ix7kGanQOsiQW+gJEeCp+2I5nS
         Kfn5BrHHYT2Q4basE0JG9NfGfgEbWJvvk/kaVA/RkyaskTLPbViRN/4qaEOoLdLTYB0I
         G5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110613; x=1795715413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VaJ32hdTW6OdgBsH5EJWCERCqsHcMt1Z/thd7ws6mpM=;
        b=bU6gAXZ9px5vB7A2KQYcA9Dec8KZ980A08omY1LZ04HiEDOLOS0zdQS9V8iPQL1bz1
         SkEh85U4Vl6Bs/OsgG41Hyn88UcyZ5ltBaEHvEJP6wOuYxd/Y2sstwOF8V9zFznrJQ/V
         C/ew6rqOqrP27sDMxBf9vjn7mhDPgxJNFNlwPgAnj+qaZ1E5GKloar7UUKi+2iEJgbMM
         IfsP+0TtO59r3r+FaBC+GxieZ2BSNGcFtQgGBheK2/DD2daBtCcwLAc62GsOZSGO0L/Z
         78runNmpQRCOyqNLHfJBIEdwK/UruuwhI0krjl7FkrgZJlbjcj2P98A4b6hE5oMnk7rY
         oLzA==
X-Forwarded-Encrypted: i=1; AL+hErEp8Px8yTcdtqZo6wDkDAyjbQxoLn77ck4u7YFQPla/jEx7HWfQHWqY6nY8Yu0wcPadpgNbS3lUa8uj@vger.kernel.org
X-Gm-Message-State: APuU4Z+kcgXoXBt08q0GpPiZu9IhX5ivIMFX6MPlOmRVXlHYl7MmYqg6
	RUegd3I6jYO+irVXIu/ePXd4dwrRAuaZzFbDqabWuA3DgAa8y+u6UE+6zRNF06e1gB9hMFXelB5
	Pz/O9388=
X-Gm-Gg: AZFdTZcOLCtiKuJHp02x6jiTUN8GnOueXlhsptH1A+QGLE3LegBHyHSeUzNWQxhROIW
	JsX1/wCnCSvbBo5EDEO0dkixQXlrEXgMAeirN6NaZt36Oau8rPzQ+2bgS2bjpubTbs5t6sQ4iId
	X02pg1mtSuSQ4do6MrFeGlypK+IBndQaYEDV6LshHGuN6y44VN0EDi2Q/Rcok3pexhbW0K2EpD8
	5Q6BUe2XI/2HoH8Iac1S9B4gjR7NuIPyyL2hfzFaFoiGG/pTPzv4ISY6zQAuQJZ75x0pDQXsgSP
	LbEQwzZqIQJJpeLxuFyRWa0xxnTS4ukpxoNm1QdhE4XsH0O0dgl5ElYAFD/2ZuHDYHOVF+y00RF
	KsNAfkFknFqu+sdZfbCv/eGklJifPwsCucR4yvF2TyE/eNQ0kcbOt7PYmI9Uld6RX5+Wf6OGszn
	ZOp+0xAFbTiONEJKCdrK+N1QzIHb/W7sP3vH+22jDG5v1QTm/jkHrfd7yKuSNd1N02tTnM+iHKj
	MBvMtfrQxdqytW4ZWhURJUuNTrx+nBarZ7ItlplF+3G9h/mdC2JRxRcCzjw8bxXUY0P24Q8MIT9
	I/F+WEI106jBM0OCIr2xLSNSuk/FvVJlUkQZ1VU4lyzE3O4HlxBN5S4adXrmKlaCSpWtmmbgrH4
	J8CV0KMq9NemqS3DnN9wyGVrFTCWDbrcxNMSqcQUr0WvC2qbwu14it65y759fn9au1J4SV0TA0/
	/Upg==
X-Received: by 2002:a05:6000:2313:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4abb4d70071mr190135f8f.39.1795110613162;
        Thu, 19 Nov 2026 09:50:13 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm310363f8f.45.2026.11.19.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:12 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 06/10] dt-bindings: vendor-prefixes: add XRadio
Date: Thu, 19 Nov 2026 18:49:58 +0100
Message-ID: <20261119175002.458988-7-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

Add the vendor prefix for XRadio Wi-Fi chips.

Prepared with OpenAI Codex.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..066c2e90f289 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1959,6 +1959,8 @@ patternProperties:
     description: Xilinx
   "^xnano,.*":
     description: Xnano
+  "^xradio,.*":
+    description: XRadio Technology
   "^xunlong,.*":
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":
-- 
2.56.0

