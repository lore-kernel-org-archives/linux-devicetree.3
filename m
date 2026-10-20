Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517822;
	b=h0uOs2nzcgzYkUUURm5tq5x0eT0OswNmaUZf2HwFQsYt3ntBAenTPC7inIz/d5YX+x3E
	 Y1xZAGc+rj3ZX+nNVtKUpxKuJcnnIDYPXmzFEHos0lmNGsY4tdHiNNSMexNx72cMnHE5v
	 C4GBeJmeQmGzMdJs0klw2XUnhT2uoiNpeUM2Cb6JF5hcR/Z/nYtimkvNvKIEG+gmnEN9f
	 S5wtJtFafoOG62R+645eRiYkAD4vx5ToPCE95MdWmJYQOJLULGB0bFDQ8PR8NvW0OE+J8
	 pzZ7GtiesihN9WMlTdnQ9KaJ1o7flBJVlAD+P9M3QNvDHXokutG3pFbYBdA0PJUBL+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=p6YIjcn8R3ZOEwQLRqdgk+fJ160q9grF8VNTfO0qN3LWc0HfmKzHVCRb5ZrfTI4mY2EH
	 UPaeZ/LzKieT4Aock952p/dHAq4/witp4YCsVa7qd9oL5SsuUyBWdhg7q4sftgXvRVx17
	 VsFRfQt+vRyoT/pdcXgKBY48ZCL5YOBBAzVJQcNy8yp+Xu7TjwdegAvpIzE+rgyrnZybR
	 /2zdYmWwDx0/sYb9/muUzo34nmAH8TXexqgFuSMLI9SEZc8kvuOiUJTXCAmcEams+tuNF
	 nBscDPsX4q+6cW8QrPvxs3Qpx0mCpwuVC0PBFo4o/2C0qKwSgI1yVNA2oPUVhScOlbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kpAWwkFI;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172EF606A32A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 172EF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kpAWwkFI
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a01933b584so25054895e9.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517820; x=1793122620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=kpAWwkFIF9xwPv2rF4Urtm/z72bnzw5wHjMRnjnWDZxbuO7568i6CG5x73NUlEKKry
         mx4b3vUHZiLTbrlxfQ6kXksr3dCLRwWiSDnIVvShyL42ACssSuvYZH14lS0Xkl0J7Qnu
         2F/5fMrlzhcFCbD/NgUIr8NegG13j3QAdsulLO9FsOLYpA1zmr/2egF6qSuhdCwptWcK
         AUrr74TZmzZMEFYl7CLnyzFVu58owtm8P87VwPcNzJBtHRujGkGcreuzRRtR6lKn4lKq
         awiJaUyI5dNBLJpkJ5gz4iQMyBDgXVeKhMonvHKjh/ZXQYbUUqlfwxsKRIdOIEohtEcl
         igxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517820; x=1793122620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=iiF+h90/0hbvcY2SYYiusjvuFiCALA7hXT9Mk3QGYLXJ7iwu9LM2SCZZcjbvkRQBHz
         /Cy27jcu1FUy4xEISkfoiuUxyyVQIympyxThDbfPayXmwh8fOD6M+jR3QzARNykXG3RW
         vePYmMoodVetiBomQhHdhfub6EpTeBDeEnCPMFnh6aOXjEiTHTQA1GTHLRsHiYvKIH3s
         IfvwXZVxBXA1ip88d2R10QQwII8UKLlwuxhjcHQeb63kXcP6OqjZTbAmw7mIZHBYusOp
         rw5YrxDv6/koyIF3QpfSqP7TLnPrMmSVGHOmBtM5aITrgNVHPaxhhmJn21b8NS0OXO/d
         yvQg==
X-Forwarded-Encrypted: i=1; AKwUvBwV5KVLjn8WWv+tlPpAKc+59v76zwRBmMw5cw/GSN18Sjv0pCBi7UIqWiJQqFMKIEvU91HGbbQS8n7C@vger.kernel.org
X-Gm-Message-State: AFq9FYKfb3OcJObIbVlpr8tEQnUzX2XaVjl+VubFWm4MtTa+uc1gzIkJ
	ugO3OJD9eqlCPhLGUZUKjHvoDmRpANeInRc/eKy1EfiMZwtoXFUWuKlr
X-Gm-Gg: AYBFou2hp/LEVvDbt5U7cbonMOgqLMTofjG91loJHCYXz/9j8ZvsDSqmADOoLts4IFS
	in6k1Zh+NY7mb1rUXXVXH0qLGSu7y3PB8AhqsLGsq804+Offwvkxty1nfy7cRjcfKAnrmmWbUqr
	17Oykr4ib0IzFwmYWAAy0vdEM+Tctcag5Wu2uXlCqcY3Md2TZ8dNAScpfldhcu0q01omM/aXh23
	tkfm7fx5XAqlHPM031ftRxvO9smNvOOg/1c/c0u8paZLyLoLZdu6QLi/iN6BYVaRWwTcOfzNIic
	u5axx8KN0FAyitqLf3MRF6ObJwdQ2H+d7G1ty6qqwQroSzQK/vQmPToZUOlOhS4RAfsbvKKiY81
	XrSkpzZE9ktnHjawkRk5VHmqxvUiTJ20HY5Wm5fIT647cw68bBV6/QjewclHs0/07XbpH7SQavo
	5dsweo4aN80nGgK97eXycOK8RhADBoi6pqTO+UnUv0GekniHH/3iis08+Yy87w7A3UUA8=
X-Received: by 2002:a05:600c:c87:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a1fae2a902mr22956085e9.3.1792517820215;
        Tue, 20 Oct 2026 10:37:00 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH RESEND v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Tue, 20 Oct 2026 19:33:23 +0200
Message-ID: <20261020173556.632798-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

