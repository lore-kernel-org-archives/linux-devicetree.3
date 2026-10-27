Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102462;
	b=b4U4ZoafNmgbxUfLZAdniHAY36t3MZKmaWN6QG2LkPtWHQBmzF5+WPuIiauRZMzrt5VQ
	 d/ViuEBgRPY32bAjcqD5eBQ++W+q1jjCekZm2QX7lqbM+VU0Dtd68Xm0RV2oo8RxLj2k+
	 YnrTns6c6JI2st/VMzwholfRBqPt9Nm47f0fRzE6+3QgdbN3MAhJIf+qyJwyOAzPCihWB
	 eldyzzMSl8UfuqyQ0om7IBMSg7zR40extGHcs35/yeghFcKMnNQrj36hdymmJGMlxay4E
	 mObvt9f6O56TiQCy5WcB1yvagJZenjCIg/9MvceNmhquZebMel8getCytw+YzzhTPtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
	b=1Nx7tqpYIFvAvgraf5xdaalk7rWj6zuC285lj4s64A8fdYD3YB9TQw/+fT94M2qtQQ8N
	 OLBgFdc+Z7295nYgcSAFDZnCkAJJg4c6U/3SwvTCCyvbgXeKfcG5jQhICRGGUNg+HqPrD
	 Hka+jKL00bs9WvIiFesRTWlrsWUFx2vubSQKhJyStxy0zTtdZGXEWxxei1xvM6uPJf/1b
	 r9Unhzb8by3HsrDay+KOCV3FNfAscynvGuy4qBTtshUXxPlY0CM0Akp3HM3wuGty2qo0L
	 1gWT+t5CiolnoIoO2tvgtlRkb/64aCT58tg4LQ9gB8GveOPMqqlfsh8+yrM2dBxjeIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xjt5mWv7;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F1360A2636
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F1360A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xjt5mWv7
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so4997561a12.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102460; x=1793707260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=Xjt5mWv7K++mwN/WN03NfQkwgE+faDF2HqvMmYn2EVFGiHAcKg7buiJBbJOQfUlSdG
         Wl33eAegRGaOwGLBg6BDwCZ2xspHbB0SYvdGx/FX+gSZNNP4YsRBCHKthMq7rcYzbcVE
         RL7ibq4ad6sGu6uIDpyJRpJjy3vhHZlsOeavUmhf27x7rWR2vaOQnLE1UrsoWw2mGkdK
         QOljAfT2YC3szoE2jOVVlza5EZkOKT1FW1fU1gMjo4EhaE+81YdN6uessiYM4+/vEd/a
         9c29+3ppVjNv1FGY8bYTUiTiMqO8FRY8zQ4T/gHWgc0mZCxxWzABh8dA07/5qPNjklzE
         pshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102460; x=1793707260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=bFi3C3FpQS3I4yV562W3Iq+jgdbhQwhsQIlLygbkGqy4WQ9Jpb/K0R1CTM29TLGjXk
         XKn/ijrhEgeTxhuBTeKHx2s7IfKV/hLn4gKHhU1shmTmSfUtomlx81U5xN73Zy3DLjMi
         vYZ8fW6e+heNEr7ZSt1CY08YCe4YlVj6Sr3iVbPIaCBMgubAdh36HViE7tnQqddxwNN5
         3wUp6LUI4W9abKmJuHbiF2/NYOqPtRfRRlpnn2gLBq76eLgV/qH2nQNUv63P4bf3utPE
         g5FfGeCd08c+5uzv+g3du4eqoR6uDfTPyHJJVNxKH7Yjwdap5B1OAcbUfssLs/q8bOx6
         kbGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjRrMNqTAGwQAmHqwFk/PqyJBLOzU5wW/0CPjeP3Pv/o0DbuE5NgeFhdgzrd2OiHUdzjeB8SFAmdPg@vger.kernel.org
X-Gm-Message-State: AFq9FYIHHOnF4g3f17cJrr/cWF6HH7ds6mrvt9pLC4AMvvXqIFSupjzX
	FxFXfzv/Rl1045lPD4h0OnReNTyZOVkrRbAJM73meb/NHbddTdS5icse
X-Gm-Gg: AYBFou0cm8XQxv/k40Me39JNivC/7QPHQoVmjlLGVqjSEPL645YiC6Cc0saGS30Rs8k
	m4zxf5AdbBZ/DvD/I3Gt7OrPnXkTae0gGdJGEfhHUX2K8RjpWZGv1ODm7G92qZSwxzWwHWs7VLk
	MWjIj0VKrpun9I3XE1uO/fX+eJhNS9y9NqVX/+/GHET6leu3xfbYMmoU9zb4+NMulbH2oYjP0Ms
	EEssbNvI2x3JnCJJHfrakLYB1qzxxFe1C3MAv8ZU7NBo5n3qQWae6D7vrtAJ8OQ8rAtCFYmXRBC
	4EXeTW9c51j+sMeGHVzOIq2HC7KrI5IBEQFPWCiB287DCiYZNHERsSOqVQBOdhRoPv6ksLre0Fo
	WCMgRWvNhxSlcj1uNthxvKkihAmzQJWOo7SBQRx9Rj9vmbxjPhceWAJk9mj1cwDEJvjqDY6XPB7
	doaGIyJnxKYP1/H/21rJjRNU5TiTu37M718MUjXJaqkUGCVpVn7yC2LeRJ0/IVLJEBj3Zx+6eRt
	Dhmyr7R0Xu4PImzLP02xASybbIghLPLfD70C+pBwpOg+p7z1ZFmh2CtGHT16toLyUaCZ8eBsAPH
	IwvYXfQeYE5yVoa3hyCCBA==
X-Received: by 2002:a05:6402:4143:b0:6ac:7d0c:2cb8 with SMTP id 4fb4d7f45d1cf-6b443240278mr10161733a12.30.1793102459088;
        Tue, 27 Oct 2026 05:00:59 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 4/7] ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:16 +0200
Message-ID: <20261027120019.93611-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8903 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8903.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
index 089b673847975..bb96e8f790b2d 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
@@ -29,6 +29,9 @@ description: |
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: wlf,wm8903
@@ -75,13 +78,16 @@ properties:
   DCVDD-supply:
     description: Digital core supply regulator for the DCVDD pin.
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - gpio-controller
   - '#gpio-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

