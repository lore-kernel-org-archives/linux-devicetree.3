Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829535;
	b=FGCQC68nO67deXJsYwqbBqNp2zudWMTvpHL4co5Xu9ycxnUv4i+ZX38luzKCtveHaVBZ
	 Z+vhaDegd81eluf62f1K+I5HDjm2deneeFnzv94r90Jpf4xipCKZR4MWU24alWfLFSa7M
	 znay00wq97D5tpuwNUoKuehzplGxIaTLNDV4ArtU7Bq1ba69VlF6GBMg4P87L1zLN48Iq
	 XpGEBZDLzCfenk4VoQYHafy8cKSeZqaxZCSSZVzDRDP4FtHxtbEpSQeNx3A7En+vTSUb0
	 PJEx5QUJfdnz+IsP0xBBtSVXfEfSzXRewfOlFVaa/ka3LbohYDgbgny1JjGZ9lUB4CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=T0H3EUcqnLUlnXch2HKXz39dCofeKBnFEr/JPTlHIHo=;
	b=tC1bcneBcBOhA1IkcRZkf9AeTwFNIQiuN1PnRN4vpPc5IrQbnurId6TYEhcYtO3+M8D9
	 WFKaVmE8gBGHJmi1iqF2m99JVhPbyHpKpjx9BNMxtt6hNFCxFbCVldEEyWouoTyDF1Jzw
	 sO08TWo+Uw7W9t3u6v3AhZtMrpoEf8Ezwv+jwlz9v87AgJZwI/9btfDB2++59+b45Kqik
	 jJuES+SzLclILdYAVegWv2hJtSKBqqHVVGYqW83CiY3y/wdxW4D9Rj3HvOg+o4eB9R6rL
	 x/dVicWgcFCi+fDVU63lU1v5nKmw5OZcwOP8Dt6tqehRRRlnyoHFRZ3risahNjkSdBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x+8HY/Sk";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE306074FA5
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 21:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE306074FA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+8HY/Sk
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so6600295e9.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 13:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829533; x=1794434333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T0H3EUcqnLUlnXch2HKXz39dCofeKBnFEr/JPTlHIHo=;
        b=x+8HY/SkqAoQD8boG9LMqxUpVX0GRRevt/KLtoNb/MCWHJzvoxH2HK4MgHjKnfHLo6
         MT0RenUXW/T6DEREkpAg5YjybKZRfrSsKGryH+ZEjNZxPa5+53lMqiVrbmN7ojb+sKjB
         Cfvm5qKqVkh/7UREcphI1uPFXNBfgzTCjEhfRmRkADQlEvjFg9f3AwJUR1Pro2c9f131
         WKgGa3QF9KBpWIgGFg3d6ZSte18EP+wfl+jCl/Ycjns3WJFfyt98iqrK/QdCYWhk6nXA
         HYuYFnems01bbkrMtDZ4vbjKHxnkKzoGkaLDr3C6OU4d/zz6nKlW33mWbvwzJb9CuhVw
         3N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829533; x=1794434333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0H3EUcqnLUlnXch2HKXz39dCofeKBnFEr/JPTlHIHo=;
        b=GM0r/VwHzfo+BByfC91OyjdeB+t3wOcK7+oBbbFfHtqgedJkdatszOQBHby+eWBGzB
         4vM3Ax0pt7ws2IPi/abh8SQd/xJFlqKzYW63d46IRkM4IgpAmpiKsq1s/cicewair2V1
         Is6Vnbqe/mF25z4OAziloOL4tOtBqO4n5RxBt+8e5EnnYVSg5G3s5Ph7K0zm7fFaGcun
         b7Z8PdKim8azNMNIt2ZXD4PgdFqfAFVEzUmhhbd492sblbhK51ASPXLJjgBVWHOii+dn
         IVY+dKozhBCE9lkzxlSeZVvTVJ4SqPS/yqNOF/BjBjmQNSSZ76Mc6zVEzCUJNzwK9DrL
         vMLw==
X-Forwarded-Encrypted: i=1; AKwUvByPupnPdxoY2NnW8I+6i11HRmi1Nl3S2a7Qsl0suSMlC2mfbnM010yzO/rf4+IV1cbfblxthGzrmHCK@vger.kernel.org
X-Gm-Message-State: APuU4Z+OXq87AKIRRsKvdkGwmbqy/rexNIN8C7nD70I9J6nGugG6FEYz
	FOYuhNWtBt84ae9o6KTwMIxY8MtfSApy2oO1t9lYypWAzPvhnOzOlPC5
X-Gm-Gg: AYBFou2A2nBLjAG3h+KS7t7hdsR7OI0KOtyECZM+QJ0CE6P5FFSFLNOOJ1t3C5wgV1z
	en0PiZ5Ou6JsjMOf7gFmhO6dGM3NZHhTxBLbeACsio8ClRm58cY0DwibOgFHBT3M7ixaidjJdOY
	aeBMzTsKKxEv0RvP5Aaj+EUEBKRvhNlQHnDZrRT9IoC6mN9uuwQ+V6bKjFrlk2UyVNsH5Dc4MbT
	aXAunIaCqsEpSlFmcDA8cZ7/hll9vzph564R8OMwkDbPopUqkpIruZ83yNWEJcsPpsvP7IArg8d
	6NKpuhuh/se8AKAv7prTRpeAfW7rzYvNtWxF9Q6dyZlIWpXrTyT4MU4g3dKtFC8lHP5kWtxtFzd
	fnlQNm7FiHCtjfqEPHj0jxekuMHRbbOqO41AOlbhIa+gNEij1MnKwncoaaxOfGczugJm82ii9GL
	Z1lydE+tG4a4EnNbivSu3g95G94mnPgTnPFadsxQf/BwtoTUnbJkKnNuAZAZeYcZp0xAbEEYT5p
	p4fmxBSAtG47c3sd/rZEkxictQLgVvey8jfCySQv38L/m2WOgkDoQGnb6MqBYDMp1B9AJluRc41
	/dvG3tGI+emMZ6aolzbQCzjePj97gtFZDZgw8Okkc8oclCHZ6J879ug4bVfNuOJrc4n41jgXmpx
	bxxxBgXTteI5AZCzcOEAxUdlys1rR2snsbuO1nuDwLoimZw==
X-Received: by 2002:a05:600c:c107:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4b1202673f8mr162862935e9.30.1793829533381;
        Wed, 04 Nov 2026 13:58:53 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm15526735e9.11.2026.11.04.13.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:58:52 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: PCI: rockchip,rk3399-pcie: Add PERST# inactive delay properties
Date: Wed,  4 Nov 2026 21:58:46 +0000
Message-ID: <20261104215848.2087944-2-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215848.2087944-1-ehbello@gmail.com>
References: <20261104215848.2087944-1-ehbello@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver holds PERST# asserted for T_PVPERL (100 ms) before releasing it.
Endpoints disagree about what they want there: some need longer than the
default to settle, while others stop answering configuration reads when the
reset pulse is stretched that far, because PERST# stays asserted for the
whole wait.

Describe two properties so a board can state what its endpoint needs, named
after the ones the Rockchip vendor driver already uses for the dwc-based
controllers:

  rockchip,perst-inactive-ms      - the delay used at probe
  rockchip,s2r-perst-inactive-ms  - the delay used when resuming

Both are optional and the defaults preserve the current behaviour.

Signed-off-by: Enrique Hernández Bello <ehbello@gmail.com>
---
 .../bindings/pci/rockchip,rk3399-pcie.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
index 720a5f9..7ac915c 100644
--- a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
@@ -40,6 +40,21 @@ properties:
     maxItems: 1
     description: pre-reset GPIO
 
+  rockchip,perst-inactive-ms:
+    default: 100
+    description:
+      Time PERST# is held asserted before it is released, which is also the
+      width of the reset pulse. The default meets T_PVPERL for a slot that
+      is powered at the moment PERST# is asserted. Some endpoints need more
+      settling time than that, while others stop responding when the pulse
+      is that long. A value of 0 selects the 100 us minimum the PCI Express
+      CEM specification sets for the pulse.
+
+  rockchip,s2r-perst-inactive-ms:
+    description:
+      The same time, applied when resuming from system suspend. Defaults to
+      the value of rockchip,perst-inactive-ms.
+
   vpcie12v-supply:
     description: The 12v regulator to use for PCIe.
 
-- 
2.56.0

