Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAE378D8B
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 21:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769553; cv=none; b=k32ZddI7+c0gt/EcVb+qF44Z1D6KMK9XKC0WrywJeV2+c71nF8c8NNZ93ngrrN6gwykhQJ0mQzAFOEtkScsWDBsNlvPO3W01rw81ZHYekTQP1SkCL4Ce+V5Z/wlAlkgvoBc6irmYc5ptDd2SOa/TUpwlhuUFD/cSCxevhqOLkcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769553; c=relaxed/simple;
	bh=TK7U0/XbzM8sVQEkZGsmbGPzqT8CPmOc8EOImm890/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/qb14zAXPF5l622jVkh+oCyznF1dBbY/G9pXc3dtt2ZrHZIZgaX+acA+R1l0sqU+Z4Gn2QhFrPc58FFQEshe4xwfaGcV7GzY82XKkFn1QpjFd/cqttACb8ZZJvcsiFAoAezMpZi7WxfChWKCsJLIzkPmaHRGrnYOBOJmkqUMnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrNSwWxz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrNSwWxz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48896199cbaso14135575e9.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769549; x=1776374349; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U30AFcv7lgMNUZ3ymlMVV/vyQq/k6Igfk7p7bVokTZ0=;
        b=mrNSwWxz0eh5CScdOed4G67cj75w7M9SNfIitwzZqmE+d5URVQHqtNEedldW0FStLF
         ySU8xqhJ4xQt+9RK4BB3V3SymBOT5uhlqngVph6PLSckw3H2BP3OPNwaQnJ6fFSgXWOJ
         TlWegM2WRrvzVzvIR841fNjZ5669ZvQo84aMYtOi5kpB0zQgmmjYNQqJsrsEp2fa9CP1
         KT1GF9aKERjzpK/xs29GJLl5D4ID4/U3HET1NGYYa+KqWQ5oJC62QJ29COs/5TNu+G0C
         KOwD5Fk9NA5np4KEgFctHbIz9/LHOJ/LPdFzkjNxVEymobKPNbu2DtA4HSyZmhj86OBB
         RP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769549; x=1776374349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U30AFcv7lgMNUZ3ymlMVV/vyQq/k6Igfk7p7bVokTZ0=;
        b=cmkR3oJJFejvsiKnaaAhMxw3PZ+DgnR5kGM6ifXSWhj7mhJEYWMlFWHezE0myMG0Wu
         y7ISbzMrXsHk9NuN8btbNzUqza22drcMb9U7HagAlCk+hmYNhkqrfi01aKODrCWTzL5Z
         2gbwnmWM4kTtQ4rIzf70hO71bg/F31R/ZM9qIo3p2NcdhJa/NOFSc9hDhkz2Iv0/fZ3P
         UdMl8QiD/A4cefkl8Em5fQ/l1sKBhusK3rsp7FCleFmfWVAjLqeczc0W0QRZ4BBiNy3W
         6JOqbl82jEm1QKDDwT0WUG/VZYPwfVTXoPZkoqVT5kD/9D+VlJdZcK9sfWoEaep9rzgT
         NXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy3cVpK4X2KvQL8Ou5MTxtG3T4jXFi0w6wiJrn6wf7qZu6lmeCkK5zcCKMbRk8j1+z82ZiOn0QYPYK@vger.kernel.org
X-Gm-Message-State: AOJu0YzRv7h1wa2HT4DqoyjHrTEKCz+tAxo4mQi3q9ZjFSHVaHDzkjqu
	BA87Sd61VAIQgXO0e7spuvuMWDSFCp+gSieMnujfF7Uwl5JSkXRh96cv
X-Gm-Gg: AeBDievTaqPt3VM7EOrj5+siPI5/L4a99IZxSck8jHaPC95SBzvWoQ9vgsZ6Bzsg2//
	uCr5cwc923kJvCfMth3PkAR8EH3XvQYaisqV0j+hpgritcvgtfhyNbsozzAq+PrmPShGa17Wspt
	JZY0R7RJh2RI0dHRrGAs8TnhgowAs+cvH1Dc4EunKLaP+tj1KZSb0uD0LMJlJ44/9O6PzIoRAqY
	gEhV7EV3uxVfCLtkDbAhg/uG9Cc5a1lPhQEMTWbCTfY+XH3cTiEFpY4IT3jtnZfH3AIa5f8LawQ
	hGKrFOMdewyh0KgJQvq1aUg+HGvzDsvYpmSnn1LCRy0jQnEppEEVR6c4HWatFVisvOVPwGdyn28
	3S8m7mwrseVAT/BKdTAMJjbmAZWwR6YTvCmkAIOpwUutZ/ILfj7y0dKsyFtHL9VBd9bASTRqQ8F
	uM7yfcOqGnaSCArPRyxnb9PrRiguyKv1qx46rZ/bhUlMFWjA8ldnRS0MdCBR0+J6IElCCo7umP8
	qAfVJfPD2Za27FX4avdfCM=
X-Received: by 2002:a05:6000:2886:b0:43b:7ff5:fdf7 with SMTP id ffacd0b85a97d-43d642c8664mr792554f8f.29.1775769549372;
        Thu, 09 Apr 2026 14:19:09 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:08 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH 0/4] samsung,coreprimevelte dt fixes
Date: Thu, 09 Apr 2026 23:17:23 +0200
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LTQqAIBBA4avErBtQ0cKuEi1Ex5pFP2hEIN49a
 fnxeAUyJaYMU1cg0cOZz6NB9h34zR0rIYdmUEIZqaRGfyXeCcONkV/K+AyoBHpprB69MzFYaO+
 V6M9tnZdaPyhEy0BnAAAA
X-Change-ID: 20251214-cprime-dt-fixes-v6-20-c15947ca5fd9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=TK7U0/XbzM8sVQEkZGsmbGPzqT8CPmOc8EOImm890/o=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ/WYdkUH5InLrk8SERafMJdsX2/bQz2brQPZLvD/
 Jjpolh8RykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgImsrGL4p8ZyQuH3tztFn3d6
 7Ii2z/ndELVkeay3x0b5A/LSDz5GOzAyrLiuOu1Vh4fkDX+mypO6zH9v7A6fpB/jelq7rJxpl9s
 RNgA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

A small assortment of DT fixes for samsung,coreprimevelte.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (4):
      arm64: dts: marvell: samsung-coreprimevelte: Increase touchscreen voltage
      arm64: dts: marvell: samsung,coreprimevelte: Use memory-region for framebuffer
      arm64: dts: marvell: pxa1908: Add PSCI function IDs
      arm64: dts: marvell: samsung-coreprimevelte: Add missing SDIO properties

 .../boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts   | 11 +++++++----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi                  |  5 ++++-
 2 files changed, 11 insertions(+), 5 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251214-cprime-dt-fixes-v6-20-c15947ca5fd9

Best regards,
--  
Duje Mihanović <duje@dujemihanovic.xyz>

