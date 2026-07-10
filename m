Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD73DCD9D
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675377; cv=none; b=Vn3V6ufjQmhOELRNcX9aRUN3RmHreX4SLnZOM3GBzLWp3f4Gxgbx42L1FnWTc2EHqLeEm4K6KC8mx/LVgI3NL6FJ68phftxJjS9INCyRv6dlyCozdww1SbvFv5cRGcC/9lF1rAyNXeRpeyNKttHlZX2V/UeBosUAf4g5gE/FGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675377; c=relaxed/simple;
	bh=zw1mFAgdyKfwxUO/njqEe7kg2B2BmHFMBO5LtyuiIrY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VBYCoSyLBw9o00Drs3BZYtv9U2qjc7shwROfvGc+83D2I6N1th1sSfFxUcJT7jF9zcffQ/d4ApFGMfHP6rCGnh/IVu3Ri2aPWHQDivsCa+gIMNkr7LzNTqCveyQ0Kg9XcZcsIwN6eJSxNo7g4DL0J9uGjTxx1xKlLWdccqyBVMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dWRL7MCO; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dWRL7MCO"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1601d552a8so46233966b.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675374; x=1784280174; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=43ADvkMGQUmy+J3D9zAwHZqQPNIWMHkG2zAIy0Ld1CM=;
        b=dWRL7MCOYZB5Zmb16RQaPELkA38J21mz5H/DwqZEIvbEJtE9FAiBupYmcCLA1zz412
         MJCNRiMfy/5hy9m9UK8FMZ99TaEfbbXx7F79YOuiNWxnDTukAO9Nb6mqYMbEi6g0PQu9
         eA+ph31N5ArQVgVmZQdLzd25gy+SaBTzVcA5R1gh5sd/zQhTuv4LQ0cSyZ7826U6kki/
         wzSV/nZK9drk7C7Q/eYVP1T6gXLkcE4FjqIStDFRsCwKx9XwgcZA/Pu9wHLor3/Hd8Uf
         oncY/NkPbM/J63TUHC4IwuQIjrG4CJw2qBu/7A8SE605T8bkie80BsVPddkADgbWAC7+
         3HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675374; x=1784280174;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=43ADvkMGQUmy+J3D9zAwHZqQPNIWMHkG2zAIy0Ld1CM=;
        b=muRazGPiaBWu42dz+LBauaicwi3x2mHX+S+B3ir+cxr9LLyfGCdE/Fv8LJeKnW83SA
         DKqEJyhs70sLrZjPgGmKCyMTI+UlNBX8sbY06STfecLobWkLwUuF61VT2sDiM/EdayHl
         CMKYTdts0Lx/Ky+zJ5pbzvY4g5/O7DxbefENx1lFSDo8e264pFhTK1GnM7bAO4aZJMB5
         dKRwqZd/hK+XcP0BmMs82s33XqbW4VHEVhiYE/xCup9NkZmyppdZcgC3KNM70LaK727d
         K+h4QNqUUYb7fMQFiRrEZ0SqN7U/wVLxnKzGfXtAdycd8OdVzcXaKZCIVNtwObk+9xTx
         gqiA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7NpSrGmj0NuLk/YOUnnFwmEWuPdztYbNCyGsqrZg8o7QFWEymSmcAleszjqMube0Y6E5sERIdfSQi@vger.kernel.org
X-Gm-Message-State: AOJu0YwZUtHV8Yf70m/xxTZYOg8bwo5k2VRtFlaKuUR1mSaKOuaSBwvp
	0FOoT2jn2uSH3qBPGk38udawTiH2YS6dMfLLrTGwe0r7SINDkKiHvarS4ArnWVelb/Q=
X-Gm-Gg: AfdE7cnRFx8TeOJbi9IITgQHeecO0w9gBScnTmJcRgCWNyFx16UzI2Sq52/CrKGqYvw
	knjkKQFdvPya0VJ20soq0u61ZumnwrBgrWzoYPwg0lpylpui0y9Ze9KSYzLC6VWgXDeuZjXao/K
	jyPpUN7A+LglpZt8YCocbPuusrBZsHdb7TokW5b8eNl+5R0LM8D33k6NHUPiqvQumd+8e29wT2K
	S5C2yXftMkagsjBafSz6hHdBu7hVJhkGwnQZcN+cpw/ifb4rFfQEPfkrSYy3nTvDo8Y7kkXOzno
	xfhGeieRECcqXXb9VD6eApVriApLDXpQeG8npEWzwEGVqDMTFIpBUg5cgC+LJLA45bJ8a9hpFDl
	PYoLIglIFV7p4NOPFBmNEKeDUgDYRHqowYpi8kFRoTzbk0faqQfqEwE57ph1JXf/TxedzjfTPXQ
	KNIX4Dhe8okk1fQMpjdW6GYwnFf6VCdLKZ4SlPYiMyNrVVJYXXEgOaQWZ42Yw5Nu0uutg=
X-Received: by 2002:a17:906:6a1a:b0:c15:db3a:c105 with SMTP id a640c23a62f3a-c15db3ac262mr328581466b.1.1783675373799;
        Fri, 10 Jul 2026 02:22:53 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add Milos CPU OPP table for DDR & L3 bandwidth scaling
Date: Fri, 10 Jul 2026 11:22:38 +0200
Message-Id: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IKUyhVxEXJh3bKdWEjBFBv
 LtRl2/x/wbKSVjhVW2QeBGVMBU0dQX+208fRnkXgzWWzLMxOMo/KPqYMcSIlgZH/kGOyUBpYuJ
 B1uvXdrc1ux/7+ZzAvh9nUbzNcQAAAA==
X-Change-ID: 20260710-milos-cpu-opp-26fb6c36be60
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=1427;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=zw1mFAgdyKfwxUO/njqEe7kg2B2BmHFMBO5LtyuiIrY=;
 b=2ygJEg8asxfZxnC971eSgSt5Ie8THGBJkGRgEb0Dqld8rZ0/r6+OqBE/HUvUiWUiS4STcBzMq
 yUyWpfLcMpSBX9sMHCDh3TL+w0L2fWGSgd+5BIlwI5sQ1bc7ExtvxRI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the OSM L3 on the Milos SoC and define the CPU OPP tables
to scale DDR & L3 bandwidths when CPU cores change frequency.

Tested with 7zip benchmark ("7z b") and membw [0] showing very close
results compared to disabling .sync_state and thus keeping all
interconnect bandwidths on maximum vote.

[0] https://github.com/doug65536/membw

Unfortunately there's no support upstream yet to have different
opp-peak-kBps values depending on whether the device is running on DDR4
or DDR5 RAM, which is where Milos should use different DDR votes. For
now the DDR5 values are used which are (usually) higher, but should
hopefully not cause any issues on devices with DDR4. TODO comments are
placed where they differ.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: interconnect: OSM L3: Document Milos OSM L3 compatible
      arm64: dts: qcom: milos: add OSM L3 node
      arm64: dts: qcom: milos: add CPU interconnect properties
      arm64: dts: qcom: milos: add CPU OPP table with DDR & L3 bandwidths

 .../bindings/interconnect/qcom,osm-l3.yaml         |   1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                | 344 +++++++++++++++++++++
 2 files changed, 345 insertions(+)
---
base-commit: 1db6c7d7df786928c6fb52625f46f1f856158728
change-id: 20260710-milos-cpu-opp-26fb6c36be60

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

