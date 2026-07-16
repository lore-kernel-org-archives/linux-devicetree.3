Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7396C3812EA
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218811; cv=none; b=P6oYsp0z2Ikkg8jrIhHeVJvDqW/yqwBj6Ufnfm3tIAiyQwG2OPom4VneCdVWOq2b2BkiBJcl3BXrZYwRPQdg9BWJHFB2UOWWlDFT+3IA0JFI9jsB8JFTjNrKyYMPmKO+LZILni6KhI0bXv36jfKU3nr0BBBzrwv/XN4TT+ear18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218811; c=relaxed/simple;
	bh=CClZ1DQD375LN3NkdB6GfVSSlLOVs2NSqQ360o4BoTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNe07Etmv+v3t1GK0K9sQkbmNqqzdyk5DBT4msV1GL8AyC/X57OmVzcOalgbiVhm9GdNjUuGlgG5LJQIiEHGSXmP8qbGzZoWmll74wmRVtO4IbjLIkvYMJtMpu1YsUgsewBoBn+7kBavB95nPOxcE020bo+RQnrrhvE1GArcEGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCgKZfWZ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCgKZfWZ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8453427d3f4so6204690b3a.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218802; x=1784823602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRF0ZOAvB4ErXLTfeB88x2r9MQSH6nK3/ZT9LGhKsEM=;
        b=tCgKZfWZTz5EaMe6ZRjK1TB8o/z97W7iBaOEQrGoCxdx2czbUfdfmq5r/PhH/qHMOG
         wgTU08Df9Clj+lCqYINH324EoUnuT+tCgL8+0DDV7z3SxbpTsipb5DmTZMnNyfR2h4qu
         7a+/LvXUq0nK8JoFLpRz22YpQdJeVD1CAWh8u3ZJOpEEyrH784hPP4BsE3mrNT4CgKIQ
         /hv9x73h2nLPxA4Ps6U2QD3x9RMCR2lQpP/mQ82J8EVLEHrBH5X6QAo+9NOe4nCSz6fk
         ydOIlvxu560gEfEk7ZTvo73B8YT/HhvPLq345IXV/lLakBJRVVXeManjdXHE/xZcfLIi
         s2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218802; x=1784823602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRF0ZOAvB4ErXLTfeB88x2r9MQSH6nK3/ZT9LGhKsEM=;
        b=DZ3u0u/qvJYdNV1lK7T7vOKl2lUnb4FI1m3VK6+wqUihUWrZikKx73J8JSjyJkzC2J
         P0A/RZAuGAG79UQWVMRbQ3nmvd5q7E13+/hn5VdsCxR14NE+CBxhsiTaC1k+34xgCm8t
         VUh9SUWSR9/IMt4v33uAFXyCzVkg4YxRhCj6fb4bnej4ZDZgHHHF+Rl9CdJh0uhgpAaO
         UZhs1uV63n5JrR18zv73ooc2QSNwkPZx/PNX3N3vxCbJE4EX7QDWFjPKURCcPz+nC6fn
         /Cx8SPWrH9aVuRYSNQJA89nx+K5KL4Xh8wiD9Lj1pLta8b6GuQCB5x7pxNZxi/yL/drQ
         J5pQ==
X-Forwarded-Encrypted: i=1; AHgh+RpydbIZ7JQHJov5loooQXj4BbVp2fgeU90PnKbLueiUKTWdHfi3ozCcI7a5sUjN0aV9Qbqm+DOK9jXa@vger.kernel.org
X-Gm-Message-State: AOJu0YzbYQcRFsR/9OrRMDRvsiOPIt3rZ//31alrVKklNFcA0CS1ktTS
	ERTuUay26BrVMhGli1M++TLjE73MtQ0fOaxPle1wkLkr2P7exNU4NO0XL6a2wkJg
X-Gm-Gg: AfdE7cnf4ERRosmqr/uDuP7mZH2nEwBGdYoz3m44GA54HjdH1gCR29VxdaFoYv2SlnD
	jMC4aXCji82YZAm110Nm3Y6z10XX+4y5o/5Jz6qwMF53RGQwiNj0w53IOqcfQZby/epmouQo+iV
	RrLYwogVmRF86MNId77YR39iFroB31sg3nY05VJKGJzPduSZ/ULMaZ6E+4JAHjvrMsIOsWdb0wm
	N5DjRuGoJM6gDUi0AG0UW/oHpKtjc+/0lAdEMbOL9cJ+8QYqvfZ9lWYTRi3JzmRKnzYWcECFdyD
	9urYl/NKDWdkKzCMlHQ+dLnOWYUOONeYaN3FB1uq/kJrWfKMuMTi+LlYq+kXjyng4OjJzcMELqA
	HrmWb/Bi0NfNEaVXzNyIoA/Qbc0CQGmEFPY3hsABnrRO+54iP2u71pg1drj+CCnGAC8lzbBLCe+
	FxoM6vb3uDCnW+Ff8/GCPxlg8ZMp81dXzPVg==
X-Received: by 2002:a05:6a00:c83:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84a671da754mr7414224b3a.13.1784218802301;
        Thu, 16 Jul 2026 09:20:02 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:20:02 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 7/7] arm: dts: mediatek: mt6589: add reset support for wdt
Date: Fri, 17 Jul 2026 01:19:23 +0900
Message-ID: <20260716161923.266315-8-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now the MediaTek watchdog driver supports MT6589 TOPRGU resets.
Add #reset-cells = <1>; to enable it.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..2645054a4a61 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -147,6 +147,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.54.0

