Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E865644E66D
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541299; cv=none; b=eV1f49joOfovblgUHcUgNAkcWxrhMUjOO/kZ9+BXgo0zOkjkz/M45GwdXBJIbDNs9v8r9OQvhOhdo1GZKass8UjEQv20ISbn1Xg7bppi5NUv/Cxbv5vLl9b+3xuQyrPdJgd7/34TUxaXtlmDRRtlfDxXOUpeUt2Q+1VU7adGbp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541299; c=relaxed/simple;
	bh=/K//QNBSWbzxPsT5IS9FlHvVWcnHN7kFOdvLuOJD4/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXjEzOoyZqQfur3ecc16UPFiW8w+rggX2Nj5hTV+NpFpzlqL4r7vfxhNgO+C8jLt/JRI3bZ86D7+x5RU4nbjOksA8rPq3Adgt48ULVJdfV2092cS5R0/ocXrthtcZQkSPzagHYGBtagf6gLUsOjAnu9SadG41U0GXKmlMHMFWy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULoV1S9d; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULoV1S9d"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495590dde14so11907255e9.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786541294; x=1787146094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSDcvewipoZNYTT+WMH6V9nJ9au04QroQYI+jUHvzRg=;
        b=ULoV1S9dxOYAsDicW0JOdunHFdJorsflR9mPAgOlkcw+XsD8R/aRi/nk8zk2v7DSgo
         WOq+wWF1ncJxipyU7crgodwdeSsSZqGAUb0SC9qAwPy53qZisNuApz93VU4aIdwgXWkX
         ncGjJZiV4fEG6+TzVp+1irmyhmPP48eISrtU3fre6r+XxEqqtVuILzJOrhM4cFPeweJC
         l8jV3olyC3Rg1SiAu4eqin4YfRdnch1Dcvhctm4FjJhCIV50eZS6H1y9DmCEoya2L0Bj
         4N4bF7vbObC9E73VVQdk6ksbw2LfHetoMADde6aJm6o2zcG0PyZAlGcdCbEKPCcPZFkk
         oIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541294; x=1787146094;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSDcvewipoZNYTT+WMH6V9nJ9au04QroQYI+jUHvzRg=;
        b=b1hyyfhrKN9hydIQ692h+VPCJLTcVDTEoZwBMXXRo9OwdO+rBzlsjsVNA3vjxEnwfB
         hTJr6IIkCKVqHBwC3Hzb3MHj4x8bOefPGedSDKC1IFFfNcPc8l6kTL0rVfJAPas+Y2Nt
         BpRo1UdUZVkMX/Pc7NTT7Id5cyjANdkWoJ93xbuV0+ngEl5W9NlSUVthp0O6oyBb261v
         NHgdpH+bAA2NzDdq38u6s5JCfAdJonc8+dYjGfOkfr9gaMU3MXHO3Sp4XglzkpOxTPeJ
         MTif4KJcrgT4gKUBEPojvTpTYTQYoPtDw/SBvCom1c3nAwzYwu17eBEOc/5USr879rng
         ICLw==
X-Forwarded-Encrypted: i=1; AHgh+RpuZ8daj0I5QNTn98vwkkVPV+Z/JXP6AZesNskHUchPspve+w3LdfxULcdjZfk2GCfUYUcjvHbHaNj/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvd8vW+V3eBV/sSH5wjWC+HQOSaF7d3+jSO7YAuYEdsDyenC7X
	JDinzjarjsOm1qiExLtjJQHGkys406TQ9IuI9XJ/yP6PGXEnCg9OGI/aectq1I53
X-Gm-Gg: AR+sD115LCpXOACbCzrcS5KvirrnXfj0bFdZ4n2ALk/Y1GkbRhA1s+RSuk5CtpixQ3M
	RQxO3L08NYz/FB8fEKSV7RQYbyeCAWHPKZdE2F0vOgUvTxMEiRxoE/Uk6JnIklFm6BNYOAbPLJU
	M6kpialvD88GiyhBy3wdR7Rp0ED6/eZn6h112/dUsmM3i8cA/IE7ZQhsuw2092xy2su/cKunh5u
	7hpkPUnu+hDFDYnXcUkr8KRDUxbCPRxRbpzCkFnIrw4KMQS0lo0Sp9UzThS6L8ETHJkCFcQDvVZ
	czQnvJsZeL5os+JQhkBm0z3ONL8S4iouKdiB1QiJ+sAucp706aSV8/DgsgjfdWbafxZ49g0jKhr
	xVYTcSj+r6JHCsPD8l5rihmsfoyHyQ1uNhs6xtDeBOC2T+lKNmznJgDh2+GAbCskO9eDjxt8L++
	Yag/0KbEV0p1FBpqEy7ye8lp0eoxSZMKbl5RHO2ZbxtGIzIeY77JvPXu2Yq11CgZsc7NXFbHFtq
	PoVOZhcUxnyLwDXkzcHudr4/ly3tW5cLOv8e94m
X-Received: by 2002:a05:600c:a207:b0:499:7024:9d4a with SMTP id 5b1f17b1804b1-4997c10e847mr41921955e9.8.1786541293829;
        Wed, 12 Aug 2026 06:28:13 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf917csm87818995e9.13.2026.08.12.06.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:28:13 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 2/4 net-next?] net: dsa: b53: prefer CPU port 8 for Northstar devices
Date: Wed, 12 Aug 2026 15:27:53 +0200
Message-ID: <20260812132755.32585-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
References: <20260812132755.32585-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

It allows using all switch features in opposite to ports 5 and 7.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
I think this can be net-next but I was asked to send a complete patchset
Can you pick those 2 patches to different trees?

 drivers/net/dsa/b53/b53_common.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 5fd8362d0430..052812d2faa9 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -766,6 +766,32 @@ void b53_disable_port(struct dsa_switch *ds, int port)
 }
 EXPORT_SYMBOL(b53_disable_port);
 
+static struct dsa_port *b53_preferred_default_local_cpu_port(struct dsa_switch *ds)
+{
+	struct b53_device *dev = ds->priv;
+	struct dsa_port *cpu_dp;
+
+	/*
+	 * Northstar SoCs devices have 3 Ethernet controllers and 3 CPU ports:
+	 * 5 (IMP1), 7, 8 (IMP0). This design was meant for dual IMP setups when
+	 * WAN traffic goes to port 5 and LAN traffic goes to port 8.
+	 *
+	 * While all 3 ports support Broadcom header, ports 5 and 7 have their
+	 * limitations. Features that relay on trapping to CPU (e.g. EAP, STP)
+	 * won't work when using those as CPU ones.
+	 *
+	 * Prefer CPU port 8 if available.
+	 */
+	if (is5301x(dev)) {
+		cpu_dp = dsa_to_port(ds, B53_CPU_PORT);
+
+		if (dsa_port_is_cpu(cpu_dp))
+			return cpu_dp;
+	}
+
+	return NULL;
+}
+
 void b53_brcm_hdr_setup(struct dsa_switch *ds, int port)
 {
 	struct b53_device *dev = ds->priv;
@@ -2724,6 +2750,7 @@ static const struct dsa_switch_ops b53_switch_ops = {
 	.port_setup		= b53_setup_port,
 	.port_enable		= b53_enable_port,
 	.port_disable		= b53_disable_port,
+	.preferred_default_local_cpu_port = b53_preferred_default_local_cpu_port,
 	.support_eee		= b53_support_eee,
 	.set_mac_eee		= b53_set_mac_eee,
 	.set_ageing_time	= b53_set_ageing_time,
-- 
2.51.0

