Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1880F339B41
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582348; cv=none; b=C8B/Mr4/lcSaCZaelN8fY0ml6dbe51zgOOc50+4hkyBrdjjD+korZtCroE50CzDjNjNEbaNk2eqSCkMFzaF/ivepnUTkFLDb9XgNsyVAJWX/ih5r06DLNNAixJtEqhS2jaP/A4P+ZcKKs7vM1NPxsoTweZt52U7YHXKvZR2UIOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582348; c=relaxed/simple;
	bh=ASEmCLfRwgQbxLWnkf5or2hRdg6uzSekK3ayF6wdI2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gW4JCBJby+Ka9U/u9ag0ZTIboNTfKZHuZ45/rm/F4zYueCIEBhBBxNH9l8HNKQS1ThfIsr0TC0xHEnXWGbssJBN0jKl73gFW866NwkA87R3p3ZCQSe3QC69XbyWOpqsrotiLsY4h2/JCqCTUBnvi81q2w4bBRf8fOm2y8SZtRA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSk+mZjl; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSk+mZjl"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd76b1361dso910645ad.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 14:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791582346; x=1792187146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJGj1uJaimgWxWRNZxMFXky2zyOGTWtfYM2CHs6J2DQ=;
        b=TSk+mZjl3xaPFvAWLtW8KYyK22M0FFTRc67nNbFKjtfuHPaFawfcNgmcPat7X1TXdV
         YkRnXZ2p7ofIZDUIvkVT5u7r4UW0w6Hnlc8x9GKPn1Ksf5qYmJNiYsPANxyrogHuU9+/
         6BDMVBhNYvtmVE+DUWFDAX8UqGl1bT2YQIN7889ujsybOpbH6U9SlmPLgDX7w55UbSU4
         dqn5dvCZtXJz6oTWqIgLyyhA7QVT66KzfAI7IG8J9kFYdbHOIo5aeg369xz+N7SezaCU
         OwzZt/RLGMFuZyuttkWo7WGBf5AV6JPeHzFPT2Jrmi73njH2oO/FmDUCAS32U5jLCobP
         jnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582346; x=1792187146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJGj1uJaimgWxWRNZxMFXky2zyOGTWtfYM2CHs6J2DQ=;
        b=Xtv8lpJUao10zHU1Y5Egn7o4k1kjZt96j3XPGbb7r/Z2HdnhGlJx4IaQlj63vGWG7O
         n0Y8jtpdlCLW9pv5qH1mi2Oqt2qLU7+nAJ7c4IxdluV140EqPZz2fPYkMzI1triMKGbS
         RoC+FHW0Re8VNGgxTLhBl03KXRnAFJ0avXevBImhVYVre054e7MoPYZSnsz4+UZkMper
         hhO836siXErr+BAFL1yqL+mOFKy04V2zdSvJEPuRz76YNII+RSEGXErVsVPNMTVUbXMY
         lkHT2N40J0RMTPCzYuLtzVlvuwYQTsml38EIQI98g474r3EjVT9Kmx/b5E9uXlmCsWNW
         QgbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUynUqmeKZG8SPZqWwD9zqkI5JU2Q3tGF83fL+qWy/yLwiJ+VuXr4KyWzgZBBbMrO4ZpkxUyd42bGt@vger.kernel.org
X-Gm-Message-State: AFq9FYJiAh3opL5l8z1GE2OmAGMniuMXGzBSTHwpSaNoA+yDD+vt0BWJ
	V1Sj6evg3z3sciIQ1T3aUMcLiy/DKZdfJR16yRvLIuEvYbKQQMHVfqO8
X-Gm-Gg: AYBFou3lhByrh7eSnNLsyclvm4XqpDQXE5Gj/L89NjI/eXgfJfCjRXvW9JM5bUjllzG
	ERyHDWE5BR4fDt2bkAVd3rbDmz/fPTG4S+1ApxfkoRF1IKvpAoflRyAHlcu0tBUkrodeY74GPYT
	KhhZXS3LCjJE3By8ba5il6Ud6IHa7Dg8uezZ+drJcP+OOCPlwX7Gqcusg36mT5/vGBJZRA204ju
	MyRAN0hJlVhh8QscbxIsf5L58jKkLD+KUbqP1GWJt62DfC+smFknNhuXxvGD31dv3X15erQIVHK
	rFNQPUa+L50GhgO2hKJy+IVOJMPjecBfj9Mp8c/rcXmvLxcVG4GGS0sWaqTbAtBQFqN66nXZco1
	CaMaaCA0VKoBCnxV883CQQUkjAQsj6YsHX4WAZtzYJH9GdM5XBCDZ08y5tcK++YyaxdozEW9gB7
	5AP7QvknHVVw1oKK5Xyk2VDnIRSvRcKOTDs/dbmZYbkl0921xBJNt0ddk04QCE1WplXxnrKe6xu
	ODJGUcOlSh/s/bBd8LLMBALrGSEtXv/UCClnXKoxJjBvZIl
X-Received: by 2002:a17:902:db12:b0:2da:e967:7953 with SMTP id d9443c01a7336-2e842ab81abmr25712755ad.12.1791582346293;
        Fri, 09 Oct 2026 14:45:46 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([104.28.215.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e54asm16615975ad.13.2026.10.09.14.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:45:45 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] regulator: support the HiSilicon STB PMOC voltage rails
Date: Sat, 10 Oct 2026 05:43:38 +0800
Message-ID: <20261009214404.722628-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HiSilicon STB SoCs regulate their CPU and core supplies with PWM outputs of
the PMOC block feeding an external converter on the board. This adds the
binding for those registers and a driver for them.

v2:
 - naming and doc changes
v1: https://lore.kernel.org/r/20261008155727.3801095-1-mmyangfl@gmail.com

David Yang (2):
  regulator: dt-bindings: add hi3798cv200 regulator
  regulator: histb: add voltage regulator driver

 .../hisilicon,hi3798cv200-regulator.yaml      |  48 ++++++
 MAINTAINERS                                   |   7 +
 drivers/regulator/Kconfig                     |   7 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/histb-regulator.c           | 162 ++++++++++++++++++
 5 files changed, 225 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml
 create mode 100644 drivers/regulator/histb-regulator.c

-- 
2.53.0

