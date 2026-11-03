Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719910;
	b=Lb+0aVVh7jX0WHl1Jn3IflDF2s1sUsorrng0N5fAqnnRU6NqBXFaFWdtVotOnttWOJbx
	 tgexjFHYs3z7ArPfyDBy3db7CVgVx82uVv5WAV4rK3mX7qSEu6hHSlcij/VvZPJJobuwH
	 2Zhs+4KyaNkh7ne+l3sC17cwxkkcB37L6uawWHGdqvsgGrDkIjqIfLU9TAiHRVlJ9v9Yx
	 GLbsNZfBTUFIEgs8CUT7R4Wecxhw0geEJ5TEwWIkZG1M5BpjaamHYfllGi+oIuel5lW+b
	 egVjrQcgDwuSUWur7QpU6C/d3T0bArN9RKVVLFQ3xEHNcicZj3ltPZ87BYVU0MgbpAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
	b=LVcJ6quD8yINxfcxMS+EYBSYrtDApiNdmw0mOOnuHGQZccY+V8T8w+uwiY1c0/NbRKEM
	 Uqx3DKyueZktTQ8678gulHzFXri7YeOJA5q1chnsN9vi3w4Ovnf2RKOatSHlioGgrOSdz
	 DyTuWOOdr3/pt+atsmd3e9rTlUOEnhIgFrd6UJRuoG+VhDIlMtLefVJ7rwFwrJlNV90Tk
	 cVrK7KyaOkXrlHIoUevnyUrosnCO/JsQdvWuHwWa298fc8h/sXxX/r5mChwVu7bn9PvqU
	 iOONrH5nnFuL9t+zjROag/SGUVgdxwYsXL0jLhaCdffnncHS3ieZujDewBHl+pNJjzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sojIxkPq;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB233606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB233606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sojIxkPq
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-5326cdde017so1293600b6e.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793719908; x=1794324708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
        b=sojIxkPq6NLi82zW8xNQsD4MP9WPH5h6qCYkF9Kk46qMCBe/xhI8U3grEGxHJ1YptF
         7+kJVMIOSv5IVdByY65XNntCqgvyqmIvBxVpfaI5Vog4+ZTqnk7NlYKBKpODqF7I8IJs
         qphSzJjX1J8SGqohjFiYyLc5qhFnuujPI07KUhtA+s5q3mgLZ2YF1lIevprNy3RKRZHf
         2ZG0Iv9g2q9VkjG8GnXwcw54/PJezNEnpA4HvjSy32NPk3QBDvs1ame4WpTjnk1RbSAG
         VRdhliP3GaAvEot2uDzDa6TRExwA9AzyjX0rZGAue4WWPtMSvgpL+IvMMKDQIypsiPGj
         YNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719908; x=1794324708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
        b=B9pLrFCro0CfzJgq2Xi/A8x2XInLO1+djN3PvqgI4q9uuejCn8dwffwiyM/9ZmMJef
         2ReG/Uc3lyd37lmG4Y1IghcMFm9jwotya5sQeri5UtdT8exDE0zRta87WhITWQtjnzmH
         /dqFmYW2uz08iE/abboZgqcz3DRypMsqlIE3m6HoYFQzuYUqj55s5HNm0lu86XlIFXMT
         MOJxv/DE/11oyhfTYqR39gD/S9e5X50NdapeaK5G/59paI7CXXJT4dnBVCsLci3SULZa
         MciHsB6RGCjclgeZ10kfJRmGR1hVoJonGQFom8QIj8OS6be3n3x6qR89Id2MaCFlksfh
         E7Ag==
X-Gm-Message-State: APuU4Z/rMfuQJCiXybVMqIsca84aohRYHEUiw1G+e6xDTkuT5U9rKdTd
	jP1lsyLWG0tlTrN2oL5Wx6H3CSE0KKQcoY8GyK9lDdnub8Ir6vXXNa84
X-Gm-Gg: AYBFou0m+j6gBX7g8v3qNfJ/mOzuM8rPTIKSeWg6nKCFSRCsLM1UBiWEidNk6qHJbVq
	8OX1ykm49i5Piyap14YlpW2PafMUmF6pLQ5Fy2cAtEV80ZENJbmvCizVQfQYxDbGrMyRg333w0q
	f2BzdflKnvQvrAk2depKSWHXqxtDPGwafhemuIxNQCKNO82DI+AmHHkyX72unYh0draA8VmKnwn
	yWP482NKeAsay14fm9wSMPAZY/+/X1bdbHGjNU0cfhk8xyh/zBiO7TtVh577EIJ1oN3cSST4cnz
	qqh4gBvObB+dgfVq6ANQjRzcb6ohXDuNTA6UZkPdZ7M+x9aVAbXVfjuL0smvnwplstVsOL9KrEB
	RYsvMbtkF8qdbuBFcEeFNFe5eyt/V7nUU3gezS2yHEvGYVpmopbM0xH2XWWQpfkJdF03ik4h1Ld
	mTLy/t7MybU2b74pPfJ/jwKLU1U0GKfs7Npq0XlS52lwzkxcTYdGSL1d8XZQ2l8zEV7hof3tKz6
	8rsNt9QkzPRSpB+iYaefQ4ITuMGz0i+Kl73lvLyw8H33Hn6/eaNUw76/Tf1qEvMlOpW7MHL27W/
	S7uan/MkKnKZ3ibH9FFymnOutMCN/fXfraeqRN//5ku9jixpWv/5
X-Received: by 2002:a05:6808:1a02:b0:4f9:6348:cd3b with SMTP id 5614622812f47-5640dd6a370mr8851018b6e.41.1793719908538;
        Tue, 03 Nov 2026 07:31:48 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11599188b6e.6.2026.11.03.07.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:31:48 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Tue,  3 Nov 2026 09:31:43 -0600
Message-ID: <20261103153144.343764-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103153144.343764-1-macroalpha82@gmail.com>
References: <20261103153144.343764-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for Rockchip RK3568 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
index 6d0eb0014eee..b245a3051d66 100644
--- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
@@ -24,6 +24,7 @@ properties:
               - rockchip,rk3228-timer
               - rockchip,rk3229-timer
               - rockchip,rk3368-timer
+              - rockchip,rk3568-timer
               - rockchip,rk3576-timer
               - rockchip,rk3588-timer
               - rockchip,px30-timer
-- 
2.53.0

