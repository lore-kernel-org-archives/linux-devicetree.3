Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E33290B9
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002054; cv=none; b=O7B3o3cG059R50t8lhdVQJkNIMdbyuvCwR4JMJ2inVD3tJQPaliBBVM831/hQLYhU7L5AUO8pvL2eDiIBITaagSIsNUoI+gBD0v8XdJop7blW+43VZ5wi7PCY8sf0pHlVN+6gZLCJ4THgDTwOE9GslF/J+16n0mP1ukkh5OGcIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002054; c=relaxed/simple;
	bh=+o5fH8rwESBYY5ifL825WThYyxoglQpkwz83khsjBQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fzg4KzMdmz2AvjBdkBawwPywpMtRFWw8uw7/MfnimmDVhc13KmbhkoFK2YLdN8V9G64eLBoTr9XIZbS4l0kt8NehNTIJ+eoNQzyel1PmjMXjtVLyP3q7jj3YWKbvM63dxlLQzLeNihlofgsa+dj8pvMO5YGvWLp01E0aE16857g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/Ds/I27; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/Ds/I27"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38f0f3c8da5so77525a91.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 10:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002051; x=1785606851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/C6bg5sGQ3dKnD0unsNwAHtT9/Xl4i7glcJbCRP315s=;
        b=O/Ds/I271zjBWDUM6yIVJqnUgiihQKlbbZZcMxj6sGvTGqZyDbBtS14wagNjp3VvfK
         C8Nl1z4R53GmUhgULAwl3hOjgeWqbwuPW+078DqWZgBOxngQFbcvoZbyZwAdUOZrtkZU
         qu4Ji+ToC1PLxbGUCFhEoe+PCHZwRgxZkncK6Lnden66x9ktZuRdwODY1W8LK3d5OA54
         XekTttzqEQd4GKmfwOXdrg66qpAjjtUEJtNOXTK6gDG8g18HpXhK9bEBeDJo4VfIY1dO
         203xTCJV3f0/RSzh4p7SnmOCGB1kKvTp/TQwqpfJR5EaRf/1O/O7XhvrJXX6uyUjCDEj
         s+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002051; x=1785606851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/C6bg5sGQ3dKnD0unsNwAHtT9/Xl4i7glcJbCRP315s=;
        b=SfhvOJMz6/GVq5lOtXnoh89saBsSVhqS75YwWTVZ3qxYW/ZcIpCIQTc1gUedjqSm7c
         3WxtoUmvukDtPweWpiqKD1RbAp1NpkJyQAuM8p6Rg8VE7xrdyInE62em/g3KBLoIYfhi
         7EKdMKqoxhuPuA1ftkjjfoFW3cFNfVT2e9ojSpya3+Mu52q406nZjpT3bRpscDRZx/e9
         uj+4wS9YYrO+qkI7tZ/PsCGg/5ayWqlBtFAI543txX/iVdyZzM84gLvqkuFUkTyHt1KE
         Z0JpCElbmAT3EXVJLpO4jJEhQqgvlT1PDBXQMticv+WlR2Xc9M4gtPuTzzkeibSJILGu
         9DXg==
X-Forwarded-Encrypted: i=1; AHgh+RrFQoVg+spqiGb7UNh8EfuyFPYHDx+T7lTNOiaSjt8ggfwAkzkd+6hioF3hPEZIKp8tvlKF3/aAZF90@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3hAxAAw0cw7zAGIs8sr6GlQHOU1e5JkTvHja4ufqAoeD0lgY6
	gkt74JBErmv+901dp+SezUArvBXw8pu1SHvThT4RWllQ0uuBy6/wHW+k
X-Gm-Gg: AR+sD13HTxwl5riiUmb+VRtmTGAv3S5CTebC7knPAr8hoPjlJrrY01sSKB/+M7WLVNd
	HWvZ+A9YGmJuGcW2nDoYgXs0HEglR2ErSUW2h9HrXpar09iozyaAgJVs+kwBJbw065+SqrYMmCn
	swWZ5eLvLvh2fEnXB/m/Y0HZP+JomzfIneOhh0bDRiA1ZtM0K5KHLgRYlzTYzmX08B08gkZ64/j
	VA+RWRXsWaEYAqWEr+21nXIFYUFssinxzUU6WQR3JXFIPl/R31IV/zfiNCivVQZnUzfdCf3hI4j
	tvx4YtezPJS40qWbDJr0j25Z9m5SZb/5wVhTVA3UM66+ZyJKceIFkpekvNRJ8rh3f5whzpMnUKA
	1pH/Bc47wxQALrf6CD6uqi2oJau+BHvn1hyZzelwtrfjxhq255W1c0UrAEZTXF5jPb86PI1U7P5
	TVWAlKLNQluco27/4Wv3BQPfAeBiWEAHmnv3ZubWJMlpztuMGMxG5YFpkxZFKA1hSXVchgaOplv
	IWjQb3Dpw==
X-Received: by 2002:a17:90b:58e5:b0:37f:eda5:516f with SMTP id 98e67ed59e1d1-38f2926773fmr2113362a91.0.1785002051278;
        Sat, 25 Jul 2026 10:54:11 -0700 (PDT)
Received: from chenyou.hitronhub.home ([2407:4d00:cc10:114a:3b0:934a:d409:94fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm3005276a91.0.2026.07.25.10.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:54:09 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v5 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
Date: Sun, 26 Jul 2026 01:53:44 +0800
Message-ID: <20260725175346.139173-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725175346.139173-1-chenyou910331@gmail.com>
References: <20260725175346.139173-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CV180x/CV181x family has an additional DesignWare APB GPIO
controller (PWR_GPIO) located in the always-on power domain at
0x5021000. Add the node so that boards can reference GPIOs in this
bank, such as status LEDs.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8bf67ee4eca5 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -448,6 +448,24 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		gpio4: gpio@5021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;
-- 
2.43.0

