Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B06241D212
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633535; cv=none; b=qhKz37dYvCJSCVz73bzHWcmKqxAIgJTvbziTU4MrkzWRBSxk0XRpRoz16KwUnGEpekLC1sFZ/v0dRr9fR53DGrXq10YSBp1YiCm75FHkhC+68GA7+v7BuAxE1PTOBd99fb7dY9oUixTHq61SA1Unb6rrDtlDhdZnve6c/Av6O9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633535; c=relaxed/simple;
	bh=FfHLIqVbUiDFb7PV/tcKm2OY5dbtW8PPcCi5ELgVdOA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LXhxcS+EZSvQfzw5hzUVgjH4rpjOjmECnwLhNiV033CfdU2WYi9IH7ADvW9YfaFOv5uiZCGCdGLpnAgZsUKniiwAp2LIgBpTp48wJFf4PxHAdEX7LIwVybA78uSiVxg8elVR9rlp6nn7UlFYVoeP5DPrSAKHDO5ucS3LdUdLHeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xVTLs+XZ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xVTLs+XZ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so87382166b.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789633526; x=1790238326; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pPKRfs0d0OIg8AedUsUxNykcUXne60lf5vpq99a5hjU=;
        b=xVTLs+XZdtDXLeSU/pAzejkZd68K1nUcGAKg+uBvlrRIUe0zu/EIzyNbGaFz9A+x/K
         lgiCRY9YoQbTgPwNYPgr2wYf9jk7E2ikCRtEZTIZsp74d80LI8NyeV+G91O89w6YlWhA
         abYlsgdKxUiFMwZMm4EddBz2rFutAf/89AnMUVEINT8hYvQ60oSQKUVBrW0+VT9yXJkY
         vM5KVQRU+mvANDCpSzk3wtwjYug2mWe0IzAZuLHWWEgoKobco/W0Zarf76aMxXUUAqlA
         pmzaZTqC5SvKseIwJht/2aVR4QvLBM0Pp8lCgrc6gdd6DCUf/mLrzCsJCU+kPGO0njoQ
         QgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633526; x=1790238326;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pPKRfs0d0OIg8AedUsUxNykcUXne60lf5vpq99a5hjU=;
        b=sPszcbZgVZ/jwFjK8s3dd45FojYoxnWr9uwQo+9ONl8saNM4/PguGzQPHWaROlsFke
         VpYZ5ZFsLrXrr+xIGSRfiidKHRq9BjXWwxZD01WqFxsInMdEa/lmwj5YIfaxZ/6oYvuo
         rgqgqsyr8MFG6sS7kwXyaZRT5Pp/aVzoIDJ40er1cxus7JCkjqPNJvwDCQSaNeIV5O9M
         192/Vbahxu1Wp7WpV4OvG2RQxte8LVupcYUgOtTGCpbjPe9WpgXUuWwO8deDnUGoN5rQ
         TaedhEOA425utE/fkhr5LgWBzZWRqrOq0Tz18FNq25sg4zGkqs37VLWdNKC3G2cZD4Hs
         Fi3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAquEjaxiMV7L07VqUPp2peOORZifeavDaM4MTkfC0QUpi4p4NoZCbcaHDKiN9n6yn0sd6qObveaXv@vger.kernel.org
X-Gm-Message-State: AFuF++lJ/qNlVdHiNT+FfRwMDD/eDZaZ9J3D+X+//Pbh6kkxk75Bxidc
	I2Z7yZmBz3AyHx2QLuS8eZMbDsCpU3pdAff2Mv3Gfg6prNr7CHOmQgOvoyFXQHAQEdA=
X-Gm-Gg: AYBFou36VV8zg2PphXoKVNCIJUqIS4F2mpmnB/Ci4V5AoXTrH5FwgW/vydBAHDVTJN8
	ckWSWLPBIDQhkVIbY+OiI/z8u9dnLhNRwzTq37Rpv40JP5a2Wve86Ngm9kBGePoXDCiA0BbpPSt
	f3RmOg7YporJ1aEgoY6I8WPwtMGWvif2TO1Jqu7LjWD350FetjfuX7jViFZ3+q2aW2MOzjuYDlC
	wW6j7lcixCfz+C20m2mQfr3tgy5U55X1x7lXCSXe8+dYh2+dYKxpPWdRv9e2onUYq9M2J8gB/+f
	fRflClrrzpqU1fYevnbs3FcZ9+RVNBe8Fqe+V/SYBM5Zdslo21x4eoHsFAZ9D7saXzthj00t5Ug
	+6fddUj2FhxhH5cghbdreuNMPt0e7SACsfq5xlcyUMOoT29h1jYYztIwOM3AJ7KyqxLj/CuuO96
	YV2/ehlwl9hc9j5IwN/O4zFQk+yO6XamHZR5hADUqvCo/AJKYD/+UBkrdz/9Xi2F5d3Tal4l57s
	gaXcBEU24YM9sm+HYvzy9UkgzRTY6mK2b6QvOWAgSjVSWfZK61+
X-Received: by 2002:a17:906:6296:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c29e51e1395mr396582466b.6.1789633525767;
        Thu, 17 Sep 2026 01:25:25 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0851ebsm242943966b.4.2026.09.17.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:25:25 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] ESWIN EPH8621 touchscreen support for Fairphone
 (Gen. 6)
Date: Thu, 17 Sep 2026 10:25:22 +0200
Message-Id: <20260917-eswin-eph8621-v2-0-f534080a6338@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOyw6CMBREf4XctSVteSkr/8OwgHJrrwkUW0AN4
 d8t4NblSWbOzAIeHaGHMlrA4UyebB9AniJQpu7vyKgNDJLLnF+EYOhf1DMczDmXgmVt0hZ5jrL
 hCkJncKjpvftu1cF+ah6oxk3ySzh8TmFoPGLQ1B6Zsl1HYxnNRZwwpxLY2ob8aN1nPzeLPfznx
 ywYZ22TpoXWF0zT7KprcoOxPcZBDdW6rl89vPBt7AAAAA==
X-Change-ID: 20260911-eswin-eph8621-5d3d766e2b0c
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789633524; l=1248;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FfHLIqVbUiDFb7PV/tcKm2OY5dbtW8PPcCi5ELgVdOA=;
 b=w3Ev19vHK3OUPv1BqDmTac+9v85Z/m5S2Kr3BnLpY8/UYjszHo9WM3dST0c6SoNjgHp5jFixq
 NJk/4fvM+sLDmuX5CnQngsYOjugx/QNGsg6P6LW3yqyZR8IVzp0hZmO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add dt-bindings, driver and dts additions to support the touchscreen on
Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- dt-bindings: Move additionalProperties down just before the examples
- driver: Fix some memcpy undefined behavior, and various potential
  issues with malformed or malicious touchscreen response data
- Pick up tags
- Link to v1: https://patch.msgid.link/20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com

---
Luca Weiss (3):
      dt-bindings: input: touchscreen: document ESWIN EPH8621
      Input: Add driver for ESWIN EPH8621 touchscreen IC
      arm64: dts: qcom: milos-fairphone-fp6: Add touchscreen

 .../bindings/input/touchscreen/eswin,eph8621.yaml  |  79 +++++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  29 +-
 drivers/input/touchscreen/Kconfig                  |  12 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/eswin_eph8621.c          | 333 +++++++++++++++++++++
 5 files changed, 453 insertions(+), 1 deletion(-)
---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260911-eswin-eph8621-5d3d766e2b0c

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

