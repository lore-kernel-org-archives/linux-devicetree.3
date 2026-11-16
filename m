Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864246;
	b=JcQgpVR5gesub8jCJfQ3g5QKgLExtxdsWyC3Xr3TLcEzaZ/OR6J1H0eeolG3qDf94dlQ
	 6atGCOqEXT0W6cLIHWt0cxTmLXCvDiYvXgT9TcQiT8j9igGLYrD80fX4dBEhQnWeKnTTt
	 E9p8++dJE+mKQLFk2Zy6yOHR7sofKPQxbt3aCIAgIYHIZtyQ1LKBZR3cgK5nZduhkXIo9
	 lM2E0xIBURBipIp3HHPVLgo/Rr01CeX2FlvF3F8GP8z0XcUENL//XdwrEb14/azzah1/T
	 RDrxq0jFEgtLzS6v5XU2ODPOXBwdNgK0rf/wVFsmjz07doPuRU0oCvCsNLsn/0yLy9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
	b=AHriZCL2TKq4N59bOqacInGS4XLl+ZPb/cr0xV+oBIeC682pEcYbEK+7vBd4gbj+QYAI
	 2EuNj19l2ND4Fb+iodOlLHQZRIL3NCaEzZsHZX94lp4KMrMzQ1j7N5Q2hiRYL5rl/A9/J
	 Cdrt3ghSFtCp+k6MT7cSFvRLKe1H3qpiNSTwLpkQ8dR2svftLh/E+3ba4PWreOrqjJPxO
	 CpqHIeW0B6FgUE99HERnw1fYhbz3jNMfMKX+w2pMd+Rm8hQVxQGE3rktbRd/OWo6oVn7U
	 gsvvpNsLK6DNeHiQQlin6nuyfgjDENRiXK165f6ytEW013Ez/c16G1N0fXUmvYxEcnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FrVzVN/7";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E54606A334
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E54606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FrVzVN/7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so24681135e9.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864244; x=1795469044; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
        b=FrVzVN/7M8VJOf7RTuhHp8/yRHlOH+DRPTKtOhVt6u/fag+es6Esis6pYgs8iyLlvX
         Bj919y9GSQ3QC/2irvSwLiP9evSGkV8f/Q2ZT5ZaCPq6cvFC94YMDMTzE+1y+oc9xM+3
         ACmHgTLgInBx71qLZTLRe34YZUmhkGF9m0uktlQx3fIBG+Pr6AlPQ0vliGMG8svdkafT
         7gSjrkg0OI3JDU7Ob70hj9KnVK74R49PXhnNYiIv2mqivf8Bjn9iH3i/f5TOyL+9tMT5
         DN7TXmHLJa4bgPfpWmLU8UFWkD0Qj4ZrNo/pZdAsaqQXxgWltVY3AEcWs88TlOddR+Tg
         atZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864244; x=1795469044;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
        b=2jgoo0IpjZmYAQLO6aswThYFfHP2VLrL7Gbj6bQTbxb+bPIE546l43XhxaCHM0aGWx
         sbLQQnVdXJkpmS7BG5Cq9QIft7oP6q0yf4Y1QJHFoz+/9PVn/YNJ9DR8gqwrj8XcTzVT
         i2PKDt9I7v8dsmzhpilzWRrnZaoa5Lm2931OtYKQwb5kiejf0KA1iqf88VL0PXoxD/W0
         R1czU10GUsEzcxB7+E0tgLThlXit/FC7HfKh0Cng482LmaY48A5hqC7Q98VLkecFvdb5
         2j6VDTF/c+5lQoD0asKAskp/n9H3R0N5yHiIdN2Rtptcz0Dyr4YzNPey12j5HvIQVEw6
         UfyQ==
X-Forwarded-Encrypted: i=1; AL+hErFXWKue/Ae8UFl8l+60mqwmYQolT9iYMOKB31Yf4qtkHiH4r1aUZbslLCD6AEbAa33mqHR/4oxGfoJ7@vger.kernel.org
X-Gm-Message-State: APuU4Z/8R+2mfs0gQP9w9aJqPcRa1CoVIZ6xGQHFXy2KtvugTgyH2Eu8
	819f60nx6+dYvJ4wcw0dwDNeBghWyHkQeYZheFzZH7/FWmqSmrJixeX0
X-Gm-Gg: AYBFou3hGTfWKv83q0e3wVkqkzspT/A168igDkxdlPgmb9fqQATYHGPn7nkEaIQ3LqO
	x7/Q4OPmvRlg5q4iGBSwJloxxKz0gCdDV54g9GZyWJtt1VvJOFGFQ1QME4OOBrOVi+s5BD+wX/O
	U7BagipSUwapxSDzxLLWZ+fSnyceSrL20iExWuvhcptRZV+hoislaOtJO/ODU64LRrtK3eAFxzA
	LUf0RjaAc+cVqyE3ntgM0RlnxX4M3BuC5fbFDcZD/6xS2PP5vL2aFttRDsj7AemQ3U58Q1azxY2
	nUR21CJFqQ5GEMq9V/kPCKY1EPDLeKbvTscG8H3P1r1Raw0/pBrroF4E/NEt1ABlop4FBNswWyi
	KmSzBeLfXRJhW3mWFYQvVxTYJ1c5oD8DQbcebwaij0gEhPgzeTa+sRli+96BIeIFJVZbYxH8/yk
	IF/Sxa/hB9+FTr2urP6pUvToHy19bqpn+FZBGduYoCB2XOypklMtmckt/TV+nOaZlbnz/eGaXXv
	ib+LZpOxfidondAI5GqcsMznpYXV6aMKYNzOJiVbAl+0mNpdLrhPJaKJfaz18lToAAYIBkABWC3
	R2QxxqF22eLthgbq74NZ/G1UFjE5qQQ8l28mUAdc
X-Received: by 2002:a05:600c:3551:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb55abdc18mr258614455e9.33.1794864243814;
        Mon, 16 Nov 2026 13:24:03 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7839c5c3sm16520325e9.12.2026.11.16.13.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:03 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Mon, 16 Nov 2026 21:23:57 +0000
Message-Id: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAG10+2oC/12NwQ6CMBBEf4Xs2ZpuBUVP/ofhUNsF1rRgWiQSw
 r9bMF48vszMmxkiBaYIl2yGQCNH7rsEapeBaXXXkGCbGJRUR0RZilY7x1ZPYnDei1oV8nDKU0I
 S0uYZqOb35rtVX46v+4PMsErWRstx6MO0HY649n7u8597RCGFxhJtkSvMjb02XrPbm95DtSzLB
 6nbTti8AAAA
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864241; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=xrLm+TfVvJoEp6IAVQCzFe0JVQwue5fgBOr1usvJ8nI=;
 b=7vzILpl8qrChpgALa3GHPPZN0zVDnay00lup4/uriiZw4XmAw75/hxuRsKAUVN+Q6+CVi4jHQ
 3dxYYOry4UtB0I+DDwkGBFfhcdaDos1AwtoUo4281yfyuVXiNDXDLWU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series adds the devicetree bindings and pinctrl/GPIO driver for the
Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
Snapdragon XR2+ Gen 2) SoC.

This is part of the initial bring-up effort for Qualcomm Halliday
and Samsung Galaxy XR.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- dt-bindings: Add the tlmm label that gpio-ranges refers to in the
  example (Bartosz)
- Link to v1: https://patch.msgid.link/20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com

---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      pinctrl: qcom: Add Halliday pinctrl driver

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  146 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1825 ++++++++++++++++++++
 4 files changed, 1982 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

