Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534172;
	b=dBvV5P5KJsdURYVAqhZA579iU6PF49kj3vXGKW0dE6JPmYIcdK69Cqw2gSK4jFew+DuD
	 TTwPNpIpoYuQ7FU41GOMTz2RGH4T/L3F7812MQFhzh326c7kyFjVxgoor4qR5HqoTF0qd
	 3mH+A3HIa+XCJ9p6cLNnnt3nFr8RdR8zxoThjMaY+ohhfBEZTbljgMMu0JH+oiyQKlK+n
	 PkUEWOHxK0x3nkufvHqSb91aT2v0jqsNwYz3sLLTDGByX+4fpJzTw8NKgFnol4IVO+Jkk
	 rqgR7y1f4xeovXLhaaZORJ6kWIU6HP64OHhizU40qpSeMeLSY0dxUdkpp4XKol7dnww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
	b=vV5a+S8/H3wj+B63dyfVeaDihmioDevRMPoURC0b+PnyCBMTnJAH5XrT7BWXD46J3hN7
	 E8Il+hxksGllx8mWgR4KnxBtLB3awdWr5nb7s/asAtgLscPj8+cEaN/BGvLiEaI3t264P
	 yDYLMllpssFbPIYZbkUfDrGqXKyHu1DamG8X2gweoyZWPOtJZN0vJsgdTya+GIdxRp2dr
	 /KpQOcpD6I680G0DWCVEy9HUJlHzBdRQW4QtuEuwh4PX0LRaMesxbaCJmzOxvRTcVimFq
	 t7rkgs11EPZi/NmWjcHq3VyDrIAl1qqpdyx35TDvHmg1esgEg7qY+ZODMMv6tLEcbZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESB8LODa;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE2C60A261F
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE2C60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESB8LODa
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso922304266b.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534170; x=1796138970; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
        b=ESB8LODa35Vf5EcyPsyzwx5pgl/mMKWV85vMM/1+lenyfAOt7Bz0Q0zY7FjolGmpzF
         YMNP/J9mTqdTFQTAhTBC7jljpZ9TjrZbBCd0tK/xddphcbcZPR3sT0Be1DVddcCvG/r1
         SY6tklwyNsafnfzBjy93ZHI+FYsPBss7I9FHT4qEZuO+p+cIy9a0IbRS7QhARwKsMTZ7
         4c9Jg1moj8o9x86oVfV+4t0cqOWdJWcl+5AW25mtQvkei41jvhOHl1A72nJk9ftdCcbd
         e/cCx1xCkoGCUN+/j8eH2tspcmYxodWCUPHko6eZYfoW7hoqrxR8GwvcQR+HU+RGm7Rq
         F7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534170; x=1796138970;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
        b=KpMNUo6ajF+ogeroL+iBHT9EMqlT5dJf0RP+ExAsWq7f4LBR3sqOdPsEpVqS7e04HA
         QZboXM677hnxvFBmWf/GBoyJrKeCprxicQv2YlaGGLWCAsF8DfiSC7L+VM3qlOMJ0V52
         hlkRbqUIdZGM4DXH+FIwBuZ/yXEgJcqKH56Jx4VsJmMcAVzaeVXJcE+OBfW7ziih6Dhs
         iHci17pFPZV4hBqb3vsVh2FpXtXcUoKUyfNV4wcweArkFNl3wIIwqk4sNUL8XyZhg/8B
         YK3DZ7+PyvlU9xXBi6IPtEVpIeZICB4Mj9ByewICiVAPrigvh1x29vxXIve9Et714YG9
         2YEQ==
X-Forwarded-Encrypted: i=1; AL+hErEntfcFSj06vlGO3o+Gl0G2DM66ADzWTtoOsiicUAM2fp5niRmO0UKk5owSMixBYc6IOledif2H8Gim@vger.kernel.org
X-Gm-Message-State: APuU4Z8n8VowOtJheHKbISp41BYZhcwkZIwzMMadT22KdosTG53RexBC
	XAW0kum4yveT1cqnPp2XJu/m3LncOib+fqhnw53kVah9OqPQouo1LmUq
X-Gm-Gg: AZFdTZeEqJyftnwM2LAlwViJpUPNcy346R3VDYxmEk1wOgcezonxPYRuwJAPd+16zqK
	eX9sIMjgaBpCSYbNhdycFmtOMen9f6N3EBh4MUrgEwdCJxOeXF0FvYW8tzoE4HCdFqS/zN10GG4
	zs38BARmOy6cmXGNb79lo0YVNlMOX3E8VNGaEcleK0kvxab7/Bwm0bhfqmjLTuTyzMhq4QfCE9P
	ZM9nuofw6tIbpra7K2oITYQX3NUHOwwA/Yz5CoEaoNMwoR5i63DLwNQRzVXOBCz0dkIQb8g1G0k
	gWYpJtAESPO+LvN+TSogIU1zjIV+LTcioPLszyI003kBr0HAaOOBKB6aQnuXgy1qTPcVEjBdZCS
	3bvX5pRiO05EXtoUDu1nsw2yTuz7JuqI6oklzAUbL7c4BlAwShGApTcadKEUIY+2A1z8Tbyqeh1
	/GkuUw+1lE1i7eiopianZrrEXg1SMNFbuZ1kgj3CMaUylu7nUlteuaLyESiDRt9rAK/LOkAmFoB
	E87adEOLlNBTat4viq3JQOG+bgSpYFZoc2tu4NpZpbw1QQ7ooHRPuga6KsUZTHSjjF6bcwWL7tS
	zznd24sMnSRrPOBsOJfQ4NyzIacimFREdj8D4w==
X-Received: by 2002:a17:907:2d23:b0:c40:2439:4d9a with SMTP id a640c23a62f3a-c51319c24fcmr1434115166b.28.1795534170279;
        Tue, 24 Nov 2026 07:29:30 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm540425166b.2.2026.11.24.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:29:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Tue, 24 Nov 2026 15:29:16 +0000
Message-Id: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAEytBWsC/13NTQ6DIBCG4asY1qVhRqDaVe/RdIGASuNPA9bUG
 O9etGliXH5hnpeZBOudDeSazMTb0QXXd3HwU0J0rbrKUmfiJshQArCM1qppnFETHZq2pSUKll5
 4fLGMRPPytnSfrXd//HZ4F0+rhzWyXtQuDL2ftg9HWO/+7fzQHoEyqiADIzgC1+ZWtco1Z923Z
 G2PuNMgjxqjLrgxgqFWwPGo051GftRp1LIQIK0oUeZ6r5dl+QIOYVJOOAEAAA==
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795534168; l=1775;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=gCYQs/30s75gOvGg0mt5Y5EZUj0bRBXdi1OgnGxyCjM=;
 b=DOTlVjHNhTZyfIOMSm753f9p4pgPiVLI9TU5wLjeUxJcXQiyhzmLx4wXDRguUIG/4/lsho8Vk
 eKeoshsCGzWAEoXQQjXjTC347ci9toIjPkHmwaRpgSZE1oVxF7dvecJ
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
Changes in v4:
- Use MSM_GPIO_PIN_FUNCTION() for egpio (Bartosz)
- Link to v3: https://patch.msgid.link/20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com

Changes in v3:
- Add the egpio function for GPIOs 185 to 223, which have EGPIO_PRESENT
  set (Bartosz). The binding gets it in its function list.
- Use the exact PDC map provided by Bartosz
- Add the Reviewed-by tag (Krzysztof)
- Link to v2: https://patch.msgid.link/20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com

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
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1840 ++++++++++++++++++++
 4 files changed, 1997 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

