Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496279;
	b=J+b6+Ssv5jxsGgfcl7CnLN6a2hY05Wkf+LKgKaVyDry4hf1GxXeYCaprBhsqx8zIkdAL
	 sELfZi8VZBgWq7RNc76GOge3gll8XJ6drCCbM1HBnuWUmjti2UaFLeAokx5WtLc2f6t9h
	 9tD4v4VdcuPqN4lnzI1Y2OwXaFDHJm38MsPrmI/6kefvjBRDW2FQxPnTquQDHo9YU0IYL
	 scfdpYycC0Roeho/RVR6HrlQq2npiC+qDkraWFZTjfFlOs7rCl6wAOqh+gOl0hd5F8x8Y
	 zA9fCMWtk8V8sJiZlLVeD1C1nt/qhBru80TgXUzYLyTAMJ7atAW74xkvDUcZiRamyag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UwtiDq8akIpNUxZs9Wt9YPgQZRmwy3QXWky9nu8dZQc=;
	b=0sx1634XWr9naGnyvOP5Rjrk7ThwgDACKEy4Z2xWUvsf3JB3fMOhKDL1ESsCGXUA8j2T
	 /7Ucf5klQmYcMb1YnqM7CbFQ0r/rwvpFZdobL/SSY/Qww8NRlbRNGtHPnRJjmRIgLwvvv
	 lFNrUTBiuJIpLmnKorC3vGuoIOmOxXLQnKeu4hUC/lIbZ/2dicmvPLooo3Sz0pgM1r+/q
	 byDkyM0ivXYFks4QzplLywi183Flk6cdkkx0YsREOQdM2fcNPAM5yCqvLJ31E13jMruKE
	 zwdKVSUyIX2Fy9XSZPgdcAtwf2dd+zJjRZ5Pc+MSr4tPFEJbfaUN1rg0PGDurwfrRew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=BYTXsqgT;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8577606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8577606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=BYTXsqgT
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b060ec084so2202276f8f.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792496277; x=1793101077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwtiDq8akIpNUxZs9Wt9YPgQZRmwy3QXWky9nu8dZQc=;
        b=BYTXsqgT9sz5M+uneTF84d4El9GL4n0FdWFfmq6U8qugiiHTGYeBkUnYwja7WwYPJ2
         WsoiPwY/5oHFHfFONcObV1bY9hfws073qq6CjvCyhjAyfWAZO2fCFidm7a7MmuWgxElD
         g5D1OLe7JxnB9+F0rOIU29jWfAyC+BF7Mvc9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496277; x=1793101077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwtiDq8akIpNUxZs9Wt9YPgQZRmwy3QXWky9nu8dZQc=;
        b=ZUZ0pEYCJWZcY9cyqcUuCGXii0S3o5RXvHQPA3tbRNcI6BvMYyJ5NcUgWyv8n7MfeX
         42p8en6kKU6k5H1zYr3QjH2L0qDwNLa8/dPxCdz41KlREH/hLN+PkAE2d+9byFXV/P+u
         SC2a0ms7k5k/LiT2avnHLER8tN0m5xkvEZ/4ysmH/MrQKEWFjhgJ+tklO/y7YwakvaDd
         QQSdjvP4rg8evmE0Hg2Ja/KlX6zeCf5v4yqxhzBtmzP9LiI9JVB3JMCp3T1Vyeu4UatX
         OnF1Va371GinbJs1jE6Icitvj5Bn4w1oUQxy/D/TizxwDIMBZ3q/CBF9MRnwLnLl8qLs
         4Ejg==
X-Gm-Message-State: AFq9FYJzIT1f5H4Eywb9riYpbwZuyNcHOhBuRUbFZEfxzSIhqrnCSDpf
	KSFd6GL//d8HHb87axT5FRJ9RIo4gBMG7eGOyxDy9q3DOPTgAFtqymyrRUnowixpzvWPqo4LMLi
	sv/EcoGQ=
X-Gm-Gg: AYBFou1owC3HJX1AElikXE6xH1FTPCX0xlhdmstSfYIHdKkvMuaAA+WV6ygBSKimBxE
	KBVO5JLTOvE3FamieHOhu7NH162I3HwhTxlqsOn4SWlt2ej1h08qMQ7GyIjGatgWlh4AC1+JeTl
	Oi66DTcGNScsolCAnd4cs9eBL11ZbGWpZwMVoAf0bKHmd18Sq81W0QvLPkju2QQx7xim2e83iwY
	ddlo15BK3UriRrqs+GkAsR9RMqFJq1pJ5UQKM1899p5TcnvOR1pDKTSGTaJHLDKSoKGg442RmEI
	jFgIwdob6VgIZSrHdpNm0S5MhGa/lxtn47k/cYT5iLWo7SOGi266uZAjfcJQxTDwBbb1GFW7N2x
	Mb1IAmLmYuv/s/WcQyuJ7vW1MuC3U9aAPDN92pMZOR4/JKnZGAjA/dMNkuasy9p4lbYmMLyOrR0
	rHAXlowHl3UXYrvkflm4Wry9+Nq315DnygBlZybaXODXaMLewe+LybLwvdyTIVHUoIj0mzMYFQ8
	0hvkoHJq47cz1elMAxGR4bmXh9tze+UM8umCa8YYsBAqznjITi6SQ1QTa8sg7cCKFxqRAvP9fWt
	VPvfxC93
X-Received: by 2002:a05:6000:470f:b0:48b:efb:4a66 with SMTP id ffacd0b85a97d-48e07978c74mr22040347f8f.6.1792496277013;
        Tue, 20 Oct 2026 04:37:57 -0700 (PDT)
Received: from thinkpat.amarulasolutions.com (host139-112-32-195.dimensionesrl.eu. [195.32.112.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d83a099sm4709728f8f.57.2026.10.20.04.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:37:55 -0700 (PDT)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Axelera AI
Date: Tue, 20 Oct 2026 13:37:15 +0200
Message-ID: <20261020113717.189082-2-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
References: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
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

Axelera AI is an EU-based provider of AIPUs for edge AI inference.

Link: https://axelera.ai/
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v2:
- Change name to "Axelera AI B.V."

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..1267d9e2d859 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -219,6 +219,8 @@ patternProperties:
     description: Avnet, Inc.
   "^awinic,.*":
     description: Shanghai Awinic Technology Co., Ltd.
+  "^axelera,.*":
+    description: Axelera AI B.V.
   "^axentia,.*":
     description: Axentia Technologies AB
   "^axiado,.*":
-- 
2.53.0

