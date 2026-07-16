Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9921541B8D7
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202018; cv=none; b=U+kcKYWv0V4vuKSOnC4hgRuMGR3Sx8IedStTI26+AL9Iy9TzhInQFPTuvACkX6YrUGEkJCD/cqHZjYGXX3N77AsEzDhQjHDQ2TcXljAl5MPyyilujUEI9CCPek+rCTVy7BvAw1i+EmjpIwcjy1B8nyIRexq8Fz3f63VQYuIE5bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202018; c=relaxed/simple;
	bh=Im70qmgrbAmqVUaeBnO30L5OqJc05vwCNKCuum/grFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2wWLS7BM2o5erudxWEFppz/vC3c/0cSDBfHYUOzOY5OszB/F97tdNXHEJJR4aIGzEAZBymWcOMVY6RjyRMqPS0bHA0vzRoPYiUV3Qa93hs3NqbDJSVGFVwgb9mKswXNmQqg/rqLhwagJGrnog2vFZKJ4QZWL+InvioiQPeuJ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=Z3Iz1z00; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="Z3Iz1z00"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso46929545e9.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1784202011; x=1784806811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c35SvQX07tBLJsWKz/d1e1Tptdw74CrKsOw1LXa+vBI=;
        b=Z3Iz1z00DTFaHzFDBIW4pBNgfQ9NoB8nk9B7xzpBOQ68YQZ1bfDa3M/oh0cR8MFEPX
         LmVfFKwfsMRIUoFfAOc3FNxZrEL2SGIrZErV70/wx3tfbNJ9tf+8oOJ/AI59l1XFu0hw
         a+0ffcptQXRtdE7W/3MaLudM7cdBrqaqj+b/fJeCb5eAjDq6aO4MVBMFd7P8EWy8rumF
         fqo//l0q1q9xjurvdAITbBNrPPDrS8AlqL7zeoXq3tOqGCXj+cmKb0JKQev1IdG4hIJ9
         Ue+FS3TF7JZ659nVHwZkheKCDJPQDbU97dDMhFd8W0BeP/Y9w670+Xk+QQ/P4POEP6Ib
         ROng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784202011; x=1784806811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c35SvQX07tBLJsWKz/d1e1Tptdw74CrKsOw1LXa+vBI=;
        b=o3PjPfoTVpeT8CANIrtcSxNZuDrs74QXaF3tqmdpAld3DR9TFIq7wUS8UsXINIa/Nr
         u7laZV13LtSsVmFrEcU9+sWjB961JIAefwjZh2g71CtEWbkrqtwHgi22zdb6g0UpuQNK
         mjL5Khqxm4PYsOqigjSkbGMhFdmsXHtWppKKoluRiGrmRTbvC8mC1cPBbAuHMWBax7Lc
         YNO1QxfTSrJyFh6Is0tuycuiNQdEon3uEy6/dJY/Hl4l5+fTnyokTssnXvfz9Ht6NCrA
         FhpJNpGhlTbvMOfVwdRbfnYO2aTm2aLQB3MyIjiJ0ovfppxIwAj7VGuL3lDzTbTyxk5a
         pmkw==
X-Gm-Message-State: AOJu0YyzeoDz6arvaGeIBIuSD0s9WYD3WT7XC7yxLl2Q/d+JWV77JiS0
	vca8vT0QeOcxNN1wIh94BX6urUUxOeFCk39Nfz+1ZAXbbdXKSeFWC6AS/PtIvoREQOpSR/63a7l
	xwav99fM=
X-Gm-Gg: AfdE7cnQaB/1EpDlZdUdVJTXDL7S0AyWvPwaLFv5yWQd7awAJTw70TlqvGBnMuTLhq8
	YOhVQhKnFHzU1gUd/G3YMeiG7xLZpzn9ABNkp53qEdqY/V3b9ev3LRWIUOyErGCQ97Zc8jE+GYi
	wH5t4zphhO12Lm5ThLg7LIhvPn5uRyd2eN9v5MRcRNa5TphwpE92HRnegSLA84x11TLvhS5tN8D
	UlPyLrvrZQmAYrUBknChrYGkttvLDkf4oCzNYZOHZ8lQ81LkZMjzjFg3ed7CL3qFR3K4Zc48j5L
	lsiUwzlBqtXRjCeSuAJRvooljI8ZxSzE/qK0VSItOdkmGeIWwe9GksQw/kgwQd4EdRqmpakkmXi
	5/P8Ck6USGAH3b6a/ilNBjKSf3v/PPuM8NXj8RyzkC7OVSxPuGS3T7j743IXbMAehNEqGSdvdTs
	7zs8r9IQZzLJzcpGqEO1IfxRByycmq4+1ulm5v0zW1P60vDbO6gryr
X-Received: by 2002:a05:600c:6285:b0:493:c42c:7e87 with SMTP id 5b1f17b1804b1-4953c2800b3mr70107945e9.33.1784202010654;
        Thu, 16 Jul 2026 04:40:10 -0700 (PDT)
Received: from localtoast.corp.sigma-star.at ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635082csm23611001f8f.7.2026.07.16.04.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:40:10 -0700 (PDT)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tony@atomide.com,
	rogerq@kernel.org,
	khilman@baylibre.com,
	andreas@kemnade.info,
	aaro.koskinen@iki.fi
Cc: Julian.FRIEDRICH@frequentis.com,
	upstream+omap@sigma-star.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition
Date: Thu, 16 Jul 2026 13:39:47 +0200
Message-ID: <20260716113947.92513-1-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d0bdd8bb7f35 ("ARM: dts: ti/omap: dra7: fix redundant
clock divider definition") removes the clock divider definition
from optfclk_pciephy_div, reasoning that the table is redundant,
as it contains the values 1 and 2, while also setting ti,max-div
to 2 while ti,min-div is implicitly initialized to 1.

What that commit missed was the fact that the values in the table
are in reverse order, i.e. first 2, then 1.

As is clearly described in the documentation, the ordering is
signifficant, the actual values for the register setting are
derived from the index. If no table is specified, the driver
assumes that the register value is divider - 1 (see also `_get_val`
in `drivers/clk/ti/divider.c`).

What is in fact redundant is the value of ti,max-div that is
derived from the table if none is specified. To satisfy device
tree semantic linters, it is removed instead.

Fixes: d0bdd8bb7f35 ("fix redundant clock divider definition")
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
index 0de16ee262cf..615a8fb47776 100644
--- a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
@@ -1376,8 +1376,8 @@ optfclk_pciephy_div: clock-optfclk-pciephy-div-8@4a00821c {
 		clocks = <&apll_pcie_ck>;
 		#clock-cells = <0>;
 		reg = <0x021c>;
+		ti,dividers = <2>, <1>;
 		ti,bit-shift = <8>;
-		ti,max-div = <2>;
 	};
 
 	apll_pcie_clkvcoldo: clock-apll-pcie-clkvcoldo {
-- 
2.55.0

