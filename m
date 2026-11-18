Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024357;
	b=n82vF28K+8qDoPZbbsJTc72XBKdk8NXRsRlt9nLxU9dOMoxe92jreTWue02kGIY14D2P
	 yD/nGd+03NbNnMuPg8v9Prkf5jrjaBSMumv/OVFfISJfMQTbnwvZlL/eMO0MdX+CdCeUK
	 rwDrc84EXtmKWcACvuoFqhPqEjs7lrK5acCFZeSUfvrgtxRKORSysXdaDOORi+6zsihzn
	 46VIa4iUf8V58zmMJq/zjX+znDdTC1wcaCUHbAG0X6L9VnORaJ6vf36q/hcycwqsC3/r9
	 0kmwUlZlouCg2Eg3bdwzch4XkPMb36Ao6cZ6ceR0eO/YYg24k4exd7VwsZ40qHY5u5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J1EgIiRCEtP6NYZ369e0XcxgqURhJXdoMTx5P1xUi3k=;
	b=XtaTP7NhknoNyflUeujBdLPaU9o5jI4E0ILbKEzjCxdAnKRv5LnaDB0uOJBt93voUtyU
	 mCsOrPKnVbjgoaDqZX+dAipZTkEuZO8eo2HrY94G0IWUElI1A+ELS8zJL1vOg/ykjiAKW
	 mMu0sRRkDTgJB88HhrIVPwDHGFfs+76HZUYHpiecLrZKol8CTZBNEMZPx/Zs/9m9Knrnx
	 pYGX4qyfxBKtn84RR/iGZczaRn0hOjqPdbE8ujS3tNAKAaPfaV17yJGxVK3IbOvMEjzEh
	 FwY09f7MXO9xz2PFq5z/gnQMCe8lqCN171+eV2lHOuC/OuuzM8kvMfsyjPNzF9SgqYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cc8LAkjM;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B8260A260C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18B8260A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cc8LAkjM
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c40e30c26a4so18375866b.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024355; x=1795629155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1EgIiRCEtP6NYZ369e0XcxgqURhJXdoMTx5P1xUi3k=;
        b=Cc8LAkjMroplpmfBGNtBTjGU8gxzxa+oFKM98WC1fpw512casTpWmHdMF6Po4wNxXr
         sVs8tryCxZU+VuMfUI0A5OXL3scf3Mr2JQPZL1cOrVQhHa160+Xy1VYLkc0srEIIxFhW
         gAPE5DKyFEUw46sWIL/Jw8fFeL+rf9Z9t+k2TVX5vIcnPRci9MbNUrLgT+B0ByJO4C5E
         ZruLuZg1/YqLSqEJWxF8UPxJWhC2dEb08pgzPHfSaMjMBDY8+HE4m4qUdimCba2PlWm8
         Vyy12n1aWQ00kUltM9GVmOF9ILY/q+LXR8A4nUnJAQ2cIzPPc58eEx+BNc29ztOS6LDM
         C94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024355; x=1795629155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1EgIiRCEtP6NYZ369e0XcxgqURhJXdoMTx5P1xUi3k=;
        b=h+L7+SKX814Mb2z16ok4FBU5OM6dRzkCFYtkkFM7hmT+d/S6QCd+Ue9vxJCDYzFINh
         ZLRX8hRJTvm6EO+vpXyS/k8t7EDjHbUW588A7FeYZC9AepHWl3YoZ+8Kw8FntigZgfho
         KhisehTKVn/e/K7H/9tn+tJBFRF+F5jJsX0uenzI3fsmqkkIXYokQjd20ZnGCoeeajNl
         Ib7BQK1Z/ff5xetMAOa3Cd/b+ehbEnh85+CLlM8jils6bxIPqXit2U9sPjHeVamaNGip
         2PN3Au71KGYaRWKhMNOgAw2a3hniof+tzyl9L1qIYBJgYo+7Ugl+B9P9VIucyHcH0UYV
         2Y3A==
X-Gm-Message-State: APuU4Z9u77qhihVPKvQDXGc0qi9h+7APWsy1kMrbhxhfunlw+uM2bfsg
	b4QAK4wO6fzL1PDEy1lflw9yVH5cxZPkdWYk53PfIFt/Nfz5NJ2Ak7NkpTzJ5pSz
X-Gm-Gg: AYBFou2ZpQn0jmuTGfrHH2AHlIcptpCliG7zkRe7A+twXP5FXrzCIQ+63wa5Tg1gHFX
	tDZ7JXMIaO6sJdZO1utvKOStr+GH3A7zGV4aTAL53hInoQnkEI687H1kLNedsL8KA3SbvHxkGR1
	3avvaylJcUOZCjp+Jnge7jWPxvwX+r02gHRl85L4Eej9iR1Yrd3jVxg+5kAUGDCEMjuGEvluYKK
	apeFHPmoTPpXbKPEDa5OndSMXgl+ITRHO3Ba4xjMXJcuiJmYiwRRq2Dp1FAyFMstceRtjyPYVHe
	r+uB3K3zvFv3+Zl/ArtSuvlJywRz0SUgcfLMHDB53Va9ClkUhUUpjfjpBWQmiSNomYl7YtIzK93
	YEb1XOQD9Mo/aYzQkt7v6voQmIvtVKGPQFk179nFeHagkJ9QxyegrReEoCMaMPvTzLyDC2MgUML
	XHv3n75IKBK9XX0P+BPEcJJ8yBhq03cvGEbAVUiDDyjnCqcDvWFE/JgqIZNIogii/BzOdGFtCLX
	eUuGDOoPmiKx2NKwFZ7f23/+rAuq1mufH++PvyjNG7HFfXYG/VWF7KzF+L/euF+Rl0oWo6koSp5
	B/JjMK1zEC2V3hUy5oljdFjGSvGbyQUanXMB0W/4G9Ccu9/xyvU3wvJOeUrO8+BVewx/Puwu0bS
	KV+gxloaVRGY=
X-Received: by 2002:a17:907:944c:b0:c46:9745:ac13 with SMTP id a640c23a62f3a-c5126667928mr17799166b.32.1795024355531;
        Wed, 18 Nov 2026 09:52:35 -0800 (PST)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b889c22d85sm1379135a12.15.2026.11.18.09.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:52:35 -0800 (PST)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Lars Alex Pedersen <lapeddk@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Roger Quadros <rogerq@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH v2 3/3] MAINTAINERS: add entry for Kamstrup boards
Date: Wed, 18 Nov 2026 18:52:09 +0100
Message-ID: <20261118175209.20829-3-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118175209.20829-1-bruno.thomsen@gmail.com>
References: <20261118175209.20829-1-bruno.thomsen@gmail.com>
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

Add an entry covering the Kamstrup i.MX7D and AM335x board families.

These boards are used in long-lived products that are upgraded to
new kernel versions regularly, so keep the device trees maintained.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
New patch in v2:
- Add a MAINTAINERS entry for the Kamstrup boards.
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..c6ec5b2d20f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14357,6 +14357,12 @@ S:	Maintained
 F:	Documentation/hwmon/k8temp.rst
 F:	drivers/hwmon/k8temp.c
 
+KAMSTRUP BOARD SUPPORT
+M:	Bruno Thomsen <bruno.thomsen@gmail.com>
+S:	Maintained
+F:	arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator*.dts*
+F:	arch/arm/boot/dts/ti/omap/am335x-emperor*.dts*
+
 KANDOU KB9002 PCIE RETIMER HWMON DRIVER
 M:	Andy Chung <andy.chung@amd.com>
 L:	linux-hwmon@vger.kernel.org
-- 
2.53.0

