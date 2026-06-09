Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8133B71C3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022184; cv=none; b=vCSm97l9qc9FSKjbChmWtd3+2+5HS1Pmk2WfwUYSL5O6cxecOkSLnT5z9yYul2D9a1n0aM4svfYrTkzwjMlzXcou3s1K/rHMfmVWrNQvtoWSiLMQi43zp9dXcmfux9PBfnqUUOon/Yd27EVcxR2fimAKVMaxeDjwC5ioW59cavY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022184; c=relaxed/simple;
	bh=yfzYmQxfGvQ/mzyfJdHs/Ur+od2hVjzLHZHfwLDtpIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCBqrX4LUEbgEVFYvqLkYJ+2oQP6zxyK5d49O0dCw6g2qxVVixXBp0WVOmslfhNXxUaaFDA6qyea4MDnSX3uRT57Uj3KWVhCwaeRBgk5DCqZnUsW/XWxM1UYD8sAw9ZKMxcPVKqpdKUQCkG2dU+RECgWO67q3PxpugPyfJI0DNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAfGp4yP; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAfGp4yP"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5176d4c14f5so46740261cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022182; x=1781626982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt6Txj/k93MadrmWiBiYhqcVr/6D1VDJs82CyM1GX/U=;
        b=sAfGp4yPKxZy/AqwS1z2frQia7/HoLtyzvZdu7Vm0MnqusuOgHYJD05IQxIxaboExw
         SQz3kscMOUKUwnnRzFWn09hsiBWtykHxjMkMYw4GSYMSmhY4Xjq5eLFZ4yM07L7Lt3T1
         b0QI3JJuJ5sPkx+QGJC58qvcBAmtHGsN81TaE2avFu5Apo9xiIcwteapWU08GJLEKl0Q
         xHiaFTueCjwkuf0iOwfBJ/QUltXdgbAq0xbo5nj2k3DbJP4dHECccVnENQJdxT7b2aIj
         /KEd9+t8XuBM4/I6tcgiE3Coo//A31J7esmvl2M2zjfGcZT5VCT2+NGwnyY+F9b1SI3n
         V1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022182; x=1781626982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mt6Txj/k93MadrmWiBiYhqcVr/6D1VDJs82CyM1GX/U=;
        b=KqxIwdZU0LzIhSr6TpBsBrNTTg3VmJPbKlh06xMnhibdchRmHCNAw74A4XIwVTE8M1
         hLRqJGbDmk6Lneio46qcC7E8YRl7oyP1dy8AuBeINjRaNfvMHeBKC80RduHub/ozjjwG
         iKDqkN/7uKTuB5ak21+9NP7tGhD6jPeFfwH1+QEcKG4XvPmffuGU2firvQao/cCRfj7O
         +F2tRe6aEBWUrsl9UFj4qHY5xxZIBquE3K1C9jBLdLgKFmxuTEXNWvlK1DOTAg9p65qk
         6k2RX1YhWLiOXraKBE3m2woCkeRA6omQwkWX4c1kNPBOKicPUECv6TZxVPDxSMJNC4JW
         2GXw==
X-Forwarded-Encrypted: i=1; AFNElJ+9rI4U7OzbXeL0I4ZKjBR5DgDgol/XXe8eFINnSBgMPEy/IAaiTKOmuMK6ytxGdBYBnwq+fyFo6ws3@vger.kernel.org
X-Gm-Message-State: AOJu0YzU39VOyNJKSFrE4iVN90wra0YhnmSPOYRj67TRA7NwYAIwj/3t
	J4dh8jxZ0FTcfji5WIq3mrkcGUxVcBn/tSmmSrJB126st7ImzINYc8Ha
X-Gm-Gg: Acq92OGR/yG6rmUWzy2lVfXVEj2VXgVjS4bMdnu/HpAJ8KbCjQAW1Ffm04XXjXKxGHt
	e6lf4gv98UF7uMKkpMiUa5BwTYl7+O2N9rGcXjAuL5pmsVgy4one1ouL+dsc+4Kj2UAhG4Eikvv
	2a/umtEi5L0gksPr6lJi7NdNBtq3HxPfVgjSGKbtljROI5Dyq4IDuuyKY6WmH9rZ4xTOu6fFdCm
	kK/LYBJRkndeg1vuZxTXzJy5Yep59o9vVJ4ZlfAsQ284Ke/MI+0s0n0Gpd6ye3JHoT/FBJJAgcx
	cavmSqWcO/hru9VH833Fwu3P9hHvS1OMuKsgNUIVe3No7uaLprHKPA0fs0I0sMqZN3duYLWaLxV
	tP9WL2BiBJm/pimV8UClyEQLpOWYUgY6PUiDIrKijolWcOr4UCvFAwx3V7JlW33j5f0v5b8vn7u
	HC8gdMZ48TyikrgCXyFXVHhl0siaHsB72shqW+VU31T+STYsdd
X-Received: by 2002:a05:622a:4818:b0:516:e01f:523a with SMTP id d75a77b69052e-51795bf3cf3mr311258251cf.43.1781022182509;
        Tue, 09 Jun 2026 09:23:02 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c4648asm210177711cf.10.2026.06.09.09.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:02 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
Date: Tue,  9 Jun 2026 12:22:43 -0400
Message-ID: <20260609162255.31074-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Skladowski <a39.skl@gmail.com>

Document pm8950 and pm8953 analog audio codecs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
[richard: add back empty line]
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..15389645a3e8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,7 +14,10 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
+    enum:
+      - qcom,pm8916-wcd-analog-codec
+      - qcom,pm8950-wcd-analog-codec
+      - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.54.0

