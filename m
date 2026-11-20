Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185719;
	b=me/a0MsCK8SdCa8V+TKScLzztS0F5b/392QvMLTefLNsSj34x6+GjmunbEDrBj6OLI1X
	 9etN+0ojXk3EjGz8YzwYw65omsFq/kaA2UKivVha5/7DX0KdYC3uV17D4mLQl2H3Ds9F7
	 GdZT36VqxDNtZ3O+5ZMY4N9kTuhrWQRDhf/ris0i63T9B3Ysfhdc9LsHGuCtI+uONyDXu
	 rG0HMpYk9jfYaOY45r9W/exYe7g1Q2HB3iNKqV/+85bfN8g68usQC2JVjbqGYzjK9YsLD
	 VkeWH/myy1vDaNErmWESW6IBXztiajlEviF0GsdGweh+ObrT07PzJKfsDm6zBad4fCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
	b=gzVh3mC2QyW9suLu5Rnb8T0/usGXVT3LxIpVhHq7YHGPuGyGyhpRiobuRqb1SVxwxmMR
	 E/h+F0X+Jl10ycY5rYAyzoLzOicosFciQRM1YmouAoz261YJFeD8Sudg+6/bI+EDFUQdk
	 LCxXNOnK/Ty2EDM1fnrhKXcQDmHC/FyCzgVCUeCLP2C0DGerC26XO/P9YCQSMqcur33kL
	 vRZ4GgxHR6/FJmXAKZSHTshk7J0rLAYsk0mpM4Q/Rqt5OUPNsBoitCfYzZsJkHk01z8Rv
	 wXda6agQvwRN2MTpX2XULFYYFjpcOAFPkt3U9A38mGZ9/ez1ofVKEZgVLDrcQCqLhPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HiASel8C;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50363606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 14:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50363606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HiASel8C
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f046b0adc0so3621325ad.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185719; x=1795790519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
        b=HiASel8CxYyQ8aNgIRv1RIniEER6l7YpmzpLpGMLEl9BpNYU0y5PnV4kYvB432T7pJ
         9ECO334uzemuXBDQIcoE9CzqRJSCVI0HMRbWQBEOcz07Cn/C/ntMETzdl6RnLNpWICOk
         cZj0A//6vyjhPkBc8/HqNLVwQqG0DwhMP+b5FoCoi2HhYiuaavEzAhYMyN6VbOaV90sz
         J9i9meyDcm9UbygaK6Vi9jju5wTig4VWCUPkcyYYFKKdcKEpHQgN5jCNfgQo/cN/AFYS
         H+SyKHy2HziViLJrXBZ38ShNfupCeNWzw7ZkhqzGtxjO9z3ClpBsinxp9pZuy8NjmVZT
         fPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185719; x=1795790519;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
        b=lSXtuLZpSb1FEwn8CvoCMs8ANxyFOH6PNU3GOhTMD82W+QDEqEPoy7k37MD+9baLZo
         XshCKcJTXvR9y328EaYRxNRTHEgLo18Stmsd84N4CzJm1+K/nZ5VcQTBQBEfUxk/iVcG
         RQhSaScXkk7PwM0xAnQ/PPvXPYACauyIzfhCStsjd3Xay9rViV4ZWDSLVEXoptKhlMzn
         PqsX3xKRD/NaxLbZlzM+yL1Zlb7iPvJdjA7Gkhr1njdcJZ970dEq3dTpSaf1iRSDk6iw
         mSFG2/1EdGu8hMBgfV5PKAcbzRUpDkyuc83BG7SRjgRuecKkNCTC9HzIV+gDs8x8J3JG
         mK3g==
X-Forwarded-Encrypted: i=1; AL+hErHq7aHokzUl18sZyIY5uhJJ9wV1fUufRqXHa93PscRduW8i7MMgzJUeFGeQEJHpTP2QmKPzELUiVd35@vger.kernel.org
X-Gm-Message-State: APuU4Z8VcNIxrN1btSBNFIEepJ8NRGzLsR7W7R0xZZ4MWy3aSOEQCSZa
	vMR3ZFUhJUkN7x91fR8tXO4Ia6FkgC2xPxiIlRUvvra8Dd8QxJ0zQ0YYyfkrZE21
X-Gm-Gg: AZFdTZeALq6TIiguZISs96ltzoh0Wdu2AacO83qhPoBZvG9Sd3z3yszaunThk+qfqDQ
	Cr0YaaoguSw7cOCN9HABIjFH7v6GPRmRxXtT77bUpCodCKnVAQVvvvKce82xRV7mbaM8+49zTmQ
	wBxu5oaV55M0Z/mnaiY52+UMsVHb7gKzqwnD0jXP5UMW20ImagQ8/JQjsalFrblnDP5OcLWfPh2
	QwKvYvfOqgp/z1UVAqiC6D1GS+64Z2Y4hOAVvQuetN+o3Gd6nFLo+344QcFfbbuMbHmjqB8PEnI
	+bQVyMxucy/37b6WyEtb9mjBNHX4YZ/+NLchNITQarsDOpb1DABHQgYrY/2uBqbbaMlsbxPRqXP
	UD93nh6PDlA026k20jXUm/3HOspOC8kjdlClE+s2ksqFqHNmiKlFf9L+1aAcyliFJWOagr93QHh
	BF/0gEbg02VNfNleewxd4cRp1mvwZfhsKTSUEYMI6uHdOydLvoCs1I8hjy6S7aUbyyq3rpuk4XC
	DNp10hzisWmMyxGrZDIal0I3nYDeUHvP/IzHU6/keYdWVPHFU22Qlfk05ORwgFnJvQrVPMPzKbY
	TAC06eoq/1XoWThSx/PWSha/Jy4tfyGObegyF1nG
X-Received: by 2002:a17:902:db08:b0:2f0:3e48:8cdd with SMTP id d9443c01a7336-2f03f16acc0mr33951835ad.46.1795185718476;
        Fri, 20 Nov 2026 06:41:58 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:41:58 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH v2 0/3] Add MT7629 RTC clock selection
Date: Fri, 20 Nov 2026 22:41:43 +0800
Message-Id: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/13NQQ6DIBCF4auQWTsNQ5WCq96jcQGISlK1AWJsj
 HdvcNn9e/93QPIx+AQtOyD6LaSwLtAyUTFwk1lGj6GHloHgQnItJNoa5/yQQmPMDh+1UoPRtSV
 joWLwiX4I+9V7dRUDa5JHG83iplJZ/J6xpIhIl/0UUl7j9+I3Kq9LIs7/pY2Qo28aeVeyHxTJ5
 zib8L65dYbuPM8f34Co78oAAAA=
X-Change-ID: 20260926-b4-mt7629-rtc-7488fa94b1ab
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

The MT7629 RTC mux can select the 40 MHz crystal divided by 1024 or
1221. The integrated Wi-Fi needs the /1221 source, but the clock
driver currently exposes only the /1024 source.

First move the clock counts used by clk-mt7629.c out of the DT binding
header and into the driver. Then add clock IDs, the /1221 fixed-factor
clock and the RTC mux to allow selection of the approximately 32.76 kHz
source from device tree.

---
Changes in v2:
- Add a preparatory patch to move the TOP, INFRA, PERI and APMIXED
  clock counts from the DT binding header into clk-mt7629.c.
- Update CLK_TOP_NR_CLK in the driver patch instead of the binding patch.
- Rebase onto next-20261119.
- Link to v1: https://lore.kernel.org/r/20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com

---
Chuanhong Guo (3):
      clk: mediatek: mt7629: move clock counts out of DT bindings
      dt-bindings: clock: mediatek: mt7629: add RTC clock IDs
      clk: mediatek: mt7629: add RTC clock selection

 drivers/clk/mediatek/clk-mt7629.c      | 12 ++++++++++++
 include/dt-bindings/clock/mt7629-clk.h |  6 ++----
 2 files changed, 14 insertions(+), 4 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20260926-b4-mt7629-rtc-7488fa94b1ab

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>

