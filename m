Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0F39B952
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993726; cv=none; b=HC1SryakCKIxf9I7dxBJ/wTyNpqYurEw4ckhdHDaLdmSONylS1mycVK58NnBycQeSdiJsN8d1JpN55mTbMsJyV21TW2q+qb4um8YbzRo8XgRFof6KWqbbkZE0RqaKThA0HnETI6siEkEK9Z9iY/yyybtOk4VvVTuOhMCE2TccWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993726; c=relaxed/simple;
	bh=yzAyyL4gIia/DyQO8L1/7HNASSwaj488nvBvkShJB90=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ErGM4VCYH6rB0/OaKVrzHsQSiXfJsojvL6wtc8P+fzgPmVmjTVtcDGSMhjAMwOoFSZHEnBRWV8S+qfn8g7sfnxU6rmIE3gPeJqnG+/wlpVWkW/Q9sH1Ae3+3FOMj4Jrn423izeuYl9URv9KQva99mVcBekD1mbxm4BWP+HeSDDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nwWl9kDT; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nwWl9kDT"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba922426c5cso933689666b.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777993722; x=1778598522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9NW9EbCMKAr4jwAZyYJ8qS/T9Kp1AqUHQ0DCYv7dsg=;
        b=nwWl9kDTwX4TAJ9CDNf+dqm5Q93++hup8NreElnkcEZsy22ww6JshXr/9d8ft9bnxY
         y6XkIjQSg81f3nueUY0MFuHnzCN2KWeYEmFz/4/d6NKd0e2p7gPOMa72Gd+mQAnmuOpB
         9R0Dm6T1oSPQBMGaUPyj79oo3JxdjNnfN1dssTxRii2+6oaxA6XRrfDPhu7EQtz922tp
         qXOnlt/et6OB17kfZzAKF02ILuHhEbZ+t7xog5zgXjHjtBv0lpWyFRvTBRIJOoflWJEW
         psqyuhIEi5oOkhrR70gyW/eHjuRbYYdWCTuUMkQ6wG3xMkwRKlZz2j+RdZweMxhoTARX
         9exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993722; x=1778598522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9NW9EbCMKAr4jwAZyYJ8qS/T9Kp1AqUHQ0DCYv7dsg=;
        b=N2gHZfR3G/Zh/Gf+nCD2Va+m4Q/nceJRI/fJyKblCfMkIjmHBGSO/PeicakWKZGnF2
         YJN6PNQMFtWJGT7HR8kwgttiwHT4R/AjhfU9B0pXsWmDjIiRYTkRuauyp+iMgvovAWlm
         mC6gNRxK86TIIqsP89yaPNsrhItW+7/jYFyPp29ygYzI16aC+vb9im+BZo0uhMhK+K8x
         OiM4CUNnXRMDQiE3PocX2+D4G6/wYE/0Fi7EH5KWIaI7df0ICyTzfmexa1qZiAIKSiG5
         TrSPGAJftd9jhG/sXpi0zvgCV+NQ+giJJGm2BFDgJSL3T3dyya0TBEUqMeHvkp9VOeMu
         BZzQ==
X-Forwarded-Encrypted: i=1; AFNElJ94Zyya2fji7SCaz53Gb/Z1KGHstgY3TJCRhBYliM6AlskdbwBS5+qXvZ/ood5NAskMLHE6rdYZoioR@vger.kernel.org
X-Gm-Message-State: AOJu0YzocjRN2emqik76Beu0Bh1HUgRz7JVhQ0X8Xce32rhhBMm2bEti
	AyqEMY99v1iDUoID2buSk53KFpLWT6HSfe5N88Al0dkUufCxSfNMthA5W0d2C1Ss9euNMj6s/wZ
	oVq4jBnieXQ==
X-Gm-Gg: AeBDievVxiyQjznXDOtchJfNKYml1z/HloeVBqVSTNHnghntBilansFQ85L98S4uu4e
	Zv0MQg7GDbhGE3rVBl9Q5YiF8l8g5oOpF67Q2oIyS0KYlMB64hnDr09gWM2lLnugjzujMhArbFY
	zh1eGU908sS066p0/MlfxP4s5Bgne7ycw54M8K+6cRCnKl/GHnuxPiPmCCUeMmWkOoLnHANDO8+
	yt08Aj0O7jDl5VXNhxDpXEtKj8dLXKmvVhZoBAW8AUzUyjQE5xOYBatNLNv3w36pmRgaCDwW0rF
	PxHAcPXGFOAWNJOzAsgkTRUxo6RdX8TiRXtzQEPeHeEgvO7moS0efELLuilgAryh6wYSzA+PYxI
	AE1o6z3AM+AXHqXr+JfNyv4t6oLqYqiivWN7YBxz7M7HjyCzYQQwn5CTzjNTPIV5Qo/VKgxOJ9A
	YN99nIDg0Sp4GDRT6MX0LxfVc2Fyw8tuWZMIyF8ny6cLeukc9nLXwthJJTXfeWNIjVwQbVzHl7D
	DWMVvjL67JaWDaiZr9p/Km4HfjNaPZg22+ooGlOqSKgcRAx
X-Received: by 2002:a17:907:c16:b0:bc3:5fb1:8b64 with SMTP id a640c23a62f3a-bc40f921b13mr217567966b.15.1777993722568;
        Tue, 05 May 2026 08:08:42 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc28c4ea2casm196662266b.53.2026.05.05.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:08:42 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Some improvements for SM6350 & Fairphone 4
Date: Tue, 05 May 2026 17:08:32 +0200
Message-Id: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2prSCkSuYli046BjUtBOISaEu
 1vF5Uvef38FocQk0KkVEi0sPI0FqoMCvPvxRpqvhcEa25ja1Fpi42qjIwtqb9CF88m0g7NQFs9
 EA79/tUu/s8zhQZi/ib+R6DWXm7xrELyQxilGzp1a2mOlE1rot+0Dcw4DYpsAAAA=
X-Change-ID: 20260505-sm6350-misc-a0c3b9407f32
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777993721; l=758;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yzAyyL4gIia/DyQO8L1/7HNASSwaj488nvBvkShJB90=;
 b=AiqET+6Tco1mDdFDPH1Kq0owb3rI4lTZdE7tm0HBtFcjyRBK2JnshWJc+BosZNOczA5QpIHfs
 4lt1cEHG/HRDLrURpMKm1+Fsjh+tZZ5WcZEgq0TE2cYuFAJgfzauo50
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a few missing interconnect paths, the pil-reloc region in IMEM and
correct the node name of the simple-framebuffer node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      arm64: dts: qcom: sm6350: Add interconnects for GPU, MPSS & CDSP
      arm64: dts: qcom: sm6350: Add PIL info region
      arm64: dts: qcom: sm7225-fairphone-fp4: Fix address in fb node name

 arch/arm64/boot/dts/qcom/sm6350.dtsi              | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: 9e0898f1c0f134c6bad146ca8578f73c3e40ac0a
change-id: 20260505-sm6350-misc-a0c3b9407f32

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

