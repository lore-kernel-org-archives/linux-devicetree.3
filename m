Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBFE46C85F
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932452; cv=none; b=RlL3CTt8oAwgpVgdy7u0D49p0+DsSRPHr0lanOnO0+6hatBwaBl6p2D9ysGiWLkriKVt6L0yVInI7WV+ZFzVyWpmNu8oYtWnwoaGdnlTRfoVS69jZV1xM/ngxE3YaipwVA16IAa1TSz4+M6Y5ywditlSUshcCaoNIY54UtIK0+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932452; c=relaxed/simple;
	bh=f7yF4xfFFHIj3dQvLZwaPrGUwIwSiMCTUNahiYRsF5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XT+76AweviO88RJYdJvEaUQDzkSQriaEDmVweGan07ZUoo4qJeqxPubrw2ztCMZTwi8wZUX7fvFgS7Uw6CUZBAkVVNyHxh3zXlyxcxsmKq5tIgB1NyO844mtr1cQCKwc/Bh283absjN0mXDv5EpVJC/pxCNGi6xzrJUUSyzsQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=C4eYpnMU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="C4eYpnMU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso5960405e9.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932449; x=1786537249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P/7dhBSgukk8ss4p9GXKM7Hns3H6z46vF+Aj0GzKdlA=;
        b=C4eYpnMUwvO0Cqql+suM6pyz0UNqQpSmIeCbhbUOOruKmULqzPJzspPt78rtTLq2Dx
         ZICyQhUJTAzX1460ySAoUr7/XidbL63SiecUAoLL21kFXpZsEtIvk5xcoyoMoqOWoXYz
         MDm69FDmKcKt+G5BgFQtIcDuCg1KSMDAS+sFj9EJH41PhLwvJfykk0bFgGVVbRKngvN3
         7T/8cADcS3qoPsYGoQU1JlphokyNX21P9iGg62zueRRCWq9DqSnyfSTKgEZ5JVRShx51
         U/qJKh8xRwXcOMm/kuiqY0Vi/WJHisRXyrFGTYxjNkBJplDJU3LSqDzTdweFZqAcxC1u
         Pl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932449; x=1786537249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/7dhBSgukk8ss4p9GXKM7Hns3H6z46vF+Aj0GzKdlA=;
        b=dRDa3DpzUcp4sCHjwqpacyWd0o0o09cRk7U+AWKjwWHdiH/5SVenKw+nLNxFpR/BGH
         tAtFQNtP4c39hKnScITpg2UP6ZUgSj4OmbZPPxG7hPHXvmhjp5LJmTLopAozq9/vq9Jz
         FryrHZhAkmhe8/onMbbDqyA1WSvp3iBzq4adXwdnsr4ZSHlt/DQS5LdkOC97V9RH1wqI
         y1f/sCjmYxBt5/IOhEUJd4HJyI5GW7DCX+AGXofFbHnT5xsE/9LylxbdFQEX+istDKM6
         krqAznJ6M208dypz1DZYL+OaaS8sKYkYvcw+oM09M+ZYF0HNIztxG2RKKFeott1sVXt2
         M8iQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKazTkeq32Wv6qEFQM16qj2ALJR6X8UQZHIiA14tgKOAtH0QT4n1RoZ/THZoxv74lzNH2NoJR4fOlu@vger.kernel.org
X-Gm-Message-State: AOJu0YyShuy2bGWE7cgHsD+TOpSD0wRT1DdVUrNi0hXPzKhga7cByoYA
	moyK4Tok6XJT7YECWVPWzi+srdStiBwKKEkjtpyFaPFKhO5nmK26mo7oYSLPepIm8i8=
X-Gm-Gg: AR+sD13iKgeIvl0iUW4FFhMuV6uRWu/l/dnu06SUovxEJARvX0geDvm/uXM16vFLv8U
	rH+fT9b33QCEfHmsc5JBBf6Wmg5jLN+54yK2btE5D3Y2LYQB+g71wpAixHRgfFdSJp5xKaxJ3XH
	lZzGA2B/RxeBvdCmV2BIzR8eLazdkwNhydbdOkbnqpEreT1MafDsP2N1gkb+5rNcjwzEV8BmvXI
	fzVQKNhczKerkCNkjvGuPuwKB3Yw/nkcr5pUxMr514nhC3Y7qBRCWRAw5OK+Cd4Qp4rGHrNpjPU
	+bB2rGyQ8mhfUXwo+RDVQdKRFoepw775iVz67W5o2fgQiaD5aUzojUme6+5n72hq+od/p6s6vW3
	AdBH09UIDsTOMIb1iTB0pELNQk8z3G89Oc6DxmojgU5Z/TvowpXsN6aWHgDU4LR7heLnPVWGKbp
	Ah+jNfOGbeqWBEdXmRUZ4UVxEAdlEgna+sze2E4dpAVWjxWGIgzLwf+Z2QX9LU7rNJIlwBXu+bX
	flU1wM+QorQgXcaEETxRvMDXFjGxAIuo9A2acQwPXswvz78cBbuAPjgnen+hpfGGBH83NNwYeRI
X-Received: by 2002:a7b:c7d6:0:b0:495:4b42:8677 with SMTP id 5b1f17b1804b1-4994e7d17c3mr61632935e9.18.1785932449558;
        Wed, 05 Aug 2026 05:20:49 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:49 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4
Date: Wed,  5 Aug 2026 14:19:53 +0200
Message-ID: <8d24d424b3504105394055de268e0a11515635a9.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The VUART 3 and 4 are VUART over PCI.
Set this flag to indicate this information.
Also set the syscon phandle.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 7c02633f2bd6..fbd7ab6332a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -722,7 +722,9 @@ vuart3: serial@1e787800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				aspeed,scu-syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
@@ -742,7 +744,9 @@ vuart4: serial@1e788800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				aspeed,scu-syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
-- 
2.54.0

