Received: from mail-qk2-f9.google.com (mail-qk2-f9.google.com [74.125.230.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F1502575
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570718; cv=none; b=bWfHvthEGIOrrV5B9iw7svFyYUgz/8Onx/WatRp9YO4Ms6e6ZBeFliWJWJZueHHufzrI/1lI/CyMD2M16E3gXKGFRSbVXEwwsk08gSkQGRIwB3EG/6BhqJDJtBYY0idBy3fmMQckPvjmYAGElmNd1UFJtotR04C5H6eEro+9RkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570718; c=relaxed/simple;
	bh=U4dHBbZoLn3vaeQbmgOV5MgVtEDo4RA4KvvRpivcR9s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qCneOOxKNK/XVN4mDgNXR8jsTOhYJdMlc6w/mIBGHXySKtk/eCvONCsHIYtkGS95KdktF1eo+f1Vf82VYNi8OgVryyZFyoTu55J/GCFsjbPlBTejbBI/qKE+f8Bhak7evcY8vv4s//x/4LXw+D9p+4oDe2wAFsrM/imth1jl9YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OA4SZJ64; arc=none smtp.client-ip=74.125.230.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OA4SZJ64"
Received: by mail-qk2-f9.google.com with SMTP id af79cd13be357-930f7b1eb68so489488985a.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570712; x=1792175512; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aaMaFxdym4cWsHL9+RBt8IvSWstCqEIA0PpJYwb/eW4=;
        b=OA4SZJ644u8SFRCFg5ZC0jk4uGR7Dd5uCMPpnp59uE3Yco+mnRmq4CZYNW/1UyViBR
         QbBbEC/pVpd6XNEmVAgyFKKnKRh5pXZL9IMx7FEQmDWK3y0ga1c/gaHuSOM7KeQzkWW/
         1FbJMch2yzyKJjF9Oe72Stg7XMxdfimRbjE+nmh+bYZFlKIN5TVk4yEcx0TSsFDdvwST
         xTvO+hIsbhdIu8GtoirfBbVScXH4QLrg7bUVPEB6LNxBZPGXhXc+jDR6CObJDg/C7/L5
         KNxrkLfkeCi3M7vs73fYu6AlN3dCQ6Ge3jRHaKAnyzWnYzBNR6exkauid4XRqTdbEZLI
         fBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570712; x=1792175512;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aaMaFxdym4cWsHL9+RBt8IvSWstCqEIA0PpJYwb/eW4=;
        b=RgeuxCDyhd0lDVxOSNYYj9TKt79b8WQ1+tEm0XSolDAbfWnGIhhRDmNXbew6MkKH7v
         xqY/EjGwGUJhoScBvzv6e2RzzZylThoYdtcL5BWYf2BnyaX0Pon/9ZnE2oI2W2uHMPi6
         sc5WrTy8kDjkc74JfzW3hYf6FETbLdGEUEqaWUmtDYj34Hcl1ld+fr6LHzRS6iR9MwSd
         AGIsShnwAb5r4YM5zGXzVpo0LvUods7S5WeLhMXxGH49/tk5lYMoJ+gD9eogLivr0mWe
         5JIILcZLMd2oee+I2wxRh/viznrOMF06B5U6qLqGs6vM8X9oK/CrKpDsUPBFFRAsCGJ5
         DHUA==
X-Forwarded-Encrypted: i=1; AKwUvByuccX/vSSaHsPgacyOY+QvQHcfLpYJisCzWbp5qYgx+ZU2DT934dxOku+8tgytGJE0Ej4xGAGZt3L8@vger.kernel.org
X-Gm-Message-State: AFuF++lC9YMMjBut0v5jOjE6GcFJSjE+q+Vo5fAJvutL0+hxmxTSf9MF
	/WfJudfpklm07KjLMXfCDXzpUqiVOLBo014B90r9neKiVqwoH/ZRMTyb
X-Gm-Gg: AYBFou2yEO+hI6b/6mDVnUbwg3R1erN8wZaRUHKPmwAavacxAy07sxrG7sY/e1ujHBd
	WVHS+/FEtDiZsRqu8FXyZNjJSvKBKnS1IbmdkGcek7AAzfhFUzbwu/6AwTClHKcLuG6oUBi/W5F
	xTNH9weqivD+R7+K5kecDTEeAO9SF4JnrNlonYwGj0eflOXE5PKg+4IFNhSg1aQlGUvocH4nFF3
	d6AOq+3Cim4XmcNO32Mh2TKCax0Vu9QMinY4GNKUeGlQyA8sqsgu3n/ZIdscFvyF2hOjLS3rtlI
	wY3p5Twm5HS0f/q/2blI64vzUtpEOyH5iDKb79Itj3VpWBZPkKXJqHJz5ixKVMa8AQhdnQuyiWJ
	IA82nbe/jGOnQ8yCKSpTCYzF5ZvEdNs02mqCOQStoPAALTHQqwhkBp/yjY1Zh1Z7Zr1vhGo5xY0
	j1qyu+p7bODxk8OlpE3KTrP24N7uHFTqgeeJnN2Pk2Ir4eG83urcCVP+1tY0vS4M33pNZ3JWina
	MzEl/Esow9TQmr+I+eWOqeke2N86+pUGvDrFLH52NaPLSMLEGVXoDXRCiuKtL6x
X-Received: by 2002:a05:620a:c53:b0:93c:779f:3e02 with SMTP id af79cd13be357-93ebd0c0021mr428898785a.11.1791570712447;
        Fri, 09 Oct 2026 11:31:52 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9898b5fsm245594685a.32.2026.10.09.11.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:31:51 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] cpufreq: mediatek: Suspend at the opp-suspend OPP, and
 mark one on MT8173
Date: Fri, 09 Oct 2026 13:31:45 -0500
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBAAvyJ77kKSQ6z9SulBzWqXYtzumlIq/
 r3B4zAws4ORMhncmh2UPmy85gr+0sD47PNMyKkyBBei60KHOmghtEI/LGKbUr9wnnHZXjhKmZT
 eVZpQTriK4NUnH1J0sfUD1KgoTfw9h/fHcfwBNjPGEIAAAAA=
X-Change-ID: 20260929-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-81d12d60671b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791570710; l=1963;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=U4dHBbZoLn3vaeQbmgOV5MgVtEDo4RA4KvvRpivcR9s=;
 b=sG8+NEHSW7BcEfXRhD7UEaX0Q4sFLMKTDlhA+uK12NJiwNn5hVhLgUdAt/DYzkxlyTEend9Sq
 BnZpSmH3IaoDHNBa2QeeCXCgHYHgznhWr24NPefLgNz5Dd1iPxON7b4
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

mediatek-cpufreq has no .suspend callback, so each cluster enters system
sleep at whatever OPP the governor last chose. On the Amazon Fire HD 10
(2017), an MT8173 tablet that is not upstream yet, entering
suspend-to-RAM with both clusters at their highest OPP (2106 and
1703 MHz) measured 63.5 and 63.6 mA, against 52.0 and 52.0 mA with this
series. Those are 15-minute windows of the PMIC's coulomb counter,
alternating with and without the change; one count is about 2.9 mA.
Earlier, on the board's previous firmware path, s2idle drew 210-232 mA
against 158 mA.

Patch 1 takes the suspend frequency from the OPP table's opp-suspend
entry, as cpufreq-dt does, rather than always using the lowest OPP. That
keeps it opt-in per SoC: this driver also runs mt2701, mt7622, mt8183,
mt8186 and others I cannot test, and no MediaTek table has opp-suspend
today, so they are unchanged. Patch 2 marks the lowest OPP of both MT8173
clusters.

Patch 2 also reaches elm, hana and the EVB, which I cannot test either.
What they get is a switch to 507 MHz in cpufreq_suspend(), which runs
before any device is suspended, so the regulators it needs should still
be up. cpufreq_suspend() also runs from device_shutdown(), so reboot and
power-off switch first as well; on the tablet, reboot -f still resets in
1.4 s.

Patch 2 does nothing without patch 1 and is harmless on its own, so the
two can go through the cpufreq and MediaTek trees independently.

---
Ryan Brue (2):
      cpufreq: mediatek: Enter system sleep at the suspend OPP
      arm64: dts: mediatek: mt8173: Mark the lowest CPU OPPs for suspend

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 ++
 drivers/cpufreq/mediatek-cpufreq.c       | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20260929-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-81d12d60671b

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

