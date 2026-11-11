Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421207;
	b=EX1T2gQwkrtERT4VcUa+K03hupbsZT+BwzVP064v6LL/ItovCFGj0o7lmJI7Wq9QX936
	 PcusbNx6JEV2Eu5sTNLX2Q4Zbq9XCqFDo+cjGRDSssRGW3ZthKZP/MJeba/HfUsgjp5TT
	 EU0tQUN+6vDfAca+X5K8nxNxYD7E82CNdi5/zKOWYswuBuWUkpmCpp3X6SZ3z+JSbvx4O
	 qPjJ8YsoEACzTFK2wXZ0tIGMjP/a4uV90jNI6oEHCt3rfp4G1B06CZ01+bI3v29v0jmL7
	 JHGuMk4Vw0mDVf5CzE4RqJQI9K2WPsFvoxheT9bcMYdqdd673t+lCh+GglCo9h2UcQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=;
	b=kdwNCfxgFiEJH9phjX/ao0VzuO4JZjlobGTdJyLN60APisszdV3fBXR/tE//axRESjEX
	 1IOWItX/RH02Oq7vFhkt1bGNCHL4zlKwH0Wb1c59g79+pb1cipqCHRc2RDMgVgJRT1hHi
	 n2znjHnPnj4hZ2imfn/at10Cyn4LZ7kOdjATZwUXpBmLlE7seTJ2A6rYgE0K3LB+S4TEM
	 Eir78WVUQ0UwxUfJSNo3kS1knW1cWstsxWkXt8A6+TuCK/rvv7xqmJNF14hq9aAhjlzGJ
	 afbSRIo3yxNZ9Z4jBMy8m9bMmhwCyNu9V5I0PAvHMJiq5lRh87ggpG1whbm8A634y7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pfeLOBSy;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E960A3834
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4E960A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pfeLOBSy
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-8217177c5daso809440a34.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421206; x=1795026006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=;
        b=pfeLOBSyC8Skrs40RTqXfqgkV77B9qOEZ9frWkWxMmeMdOuOsPQlC3pydtxtH8VLsM
         MHrAEogcgF1eQXZQbb2Md2IAHpw4RABIjE5VJL/NCQwmHuQOd9iaRPYcKIAkOwPMlyMT
         jv88Mv0W5SrWMwn4nfWxb/2VFrqIVa0Aq8SijLvMS+Ar43/8Pj0DhBd0kEVifvKIAMnX
         qA0mjAL7Td1Bx6pFDNJJIMZ5AVSgjUw+YtClhdpyLWCnaRMjS0YnOTQmkAhVoph9x1rG
         hErt89VXRk25HoTS5QOSl2rp4s5E6QTiQd6uXZfzflcy7q6Db95UqNYAW9Z6WyqbJgRP
         oECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421206; x=1795026006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=;
        b=veAM7tzPByFsL4YHmzyVxC/R7b8Qxw5e4Ih3FDHrKPrH2g4X+sjEP0viHHafm42InH
         P3CNZgHUDk7CTETgWEuf6/EP9A6VO2wpYkUSpM0jV1gVwIJVaxs4sJ6CY552hAw26Ni9
         DAjpwTRPB7wl9WJHpwaPqqXoHyOrpPsy2rwIDPhkJC9c68k7FcSCqlC0GlA7awOst/tS
         gvCy9MZaiyOouGaVNxc2nUqvUcM1c1SiMcEKPHMUZ1nH8xPWtlsyr1XfI2asqi3SAoBb
         nrKoniDjwljc1sDxWpjGt88+ROWqu6SvtdcCPYnm4p47531cUWnFQyqZw8Cfd/3wxkhS
         0+wQ==
X-Gm-Message-State: APuU4Z+cj1Rpiv4ayr7xghg6G63aR+NcrCxWKZBm+bgMtzBbgcZn0Jaf
	Q8xls3CFnXy5HUOnIZOPLTPZvZJxKWnAZ67F8VvmSm8FL/zXOLqQijTr
X-Gm-Gg: AYBFou0/cRCFoIprbY814yyLeJ9Nn5cB9W1DcAZ4DhxynFKsw8e8a7tQgfoa3LCaP+5
	IRlXrpPCSrxLQP8Fv7rfMA8RqP0/JTUf/wdG3Mlzy6gIVv1b7ve1XnXLxbAiuLOSKM67BooYVmZ
	w1+JXhGJO9xXmPPshvwMZSxeenVAFBHtWS3jh7DwFy34E88e56eG8/gaSiMjbqcguc5ThZcp/1/
	E++RteujHYggNtyMnkqICCZoDmLL9clsbj9muX0oLl6h0A7f6nn8AMvAojgO3NbbXK6UrvAb+/w
	IeAPjtL1f1/lkwAc9pJtDP+XWNmyx/E/XiGa4f//f0KESWSSuISVPSLPgapRl0KGEqtgwP7paXa
	YiNen8mE8kiFHVp4y/g5HgBfYVghLqTzXyJ2MGBI+YK1q2fIt8ExFutyHiBoLVkHBLNtdmMXcWp
	qtdIwtgdCDTc2AONko2YOs9db1N0Nveat/hHgDQ/ZhdSg/6GOsSFfFN/IQcISx1wRWUBv+cH92x
	f+f+3OaBu+AsIdpn9Quuy6Osf+B+wt7QEjzXUmA7ZhwGcTColXAGGRHtiR5j8igvekUlAvqEdvG
	GclUCJvclriNyLU4tpPgwXGHigjJhp31DAGY/ZdGskCJgtwesbXCpYlW3R8W3fkxl+roJ+VIEep
	GyoykXgX57BFqzu7MrbQ=
X-Received: by 2002:a05:6830:82f5:b0:81f:138e:77a0 with SMTP id 46e09a7af769-860f29becb1mr2821997a34.24.1794421201164;
        Wed, 11 Nov 2026 10:20:01 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:00 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:50 -0600
Subject: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
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
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-1-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=812;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=q/RYeDFXlfWlE6oZcVVafzIBFTm9F3BkNBjT9jB33RE=;
 b=x1Et7idrLHXZV+S4OxZLI4XDrcm2EokNWm4td8JQSrDbabjEZZh8QQe1wekR71n/tjIyRyHZ5
 J5k1ccNSbhvDk86usV1plzGF6cGevU4Gd2qKFkZP1KKaNdYAsVILbN4
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Add an entry for the MT8173 based Amazon Fire HD 10 (2017) tablet,
codename suez.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..26f096587631 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -157,6 +157,7 @@ properties:
           - const: mediatek,mt8173
       - items:
           - enum:
+              - amazon,suez
               - mediatek,mt8173-evb
           - const: mediatek,mt8173
       - description: Google Burnet (HP Chromebook x360 11MK G3 EE)

-- 
2.56.0

