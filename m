Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184157;
	b=rS2lcOKNR0QMZkVtxoJ7yhnG3N29dTsPNWtO8+Wc+Wm6ej5zSsi8A3QPjMTgypndinXw
	 sNixOIqHSKMACb9XS5OHzqucKLBS366BheB6FsDpvY/bKq90r9XdUHzu7r2jMwmZR2rAT
	 RqDalAppIJ4SjJ7LJzt6hNapKbjxsCjNTVW5s/4KeNJoKXScZuhhKrQJHviRKyspKJSn/
	 dLNf2npF/ohoaDEG3k9xK5nlxWkISw/qabE53seKLovDaB3sJ8T4OFGqXE3bZPm+7w1qL
	 Ab52MI+eP9k5UIkE6FNiCL+M7LHhwtAI2Ea7KdUi6TZnuGI2SZn0NZew35BMWEPHViw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
	b=sWtPChcYzHqQz4b8qmNxHvWIuCxHspS73kIDNfAxzuTSBOOiW3k+/1t8dNvs+ErGIWh5
	 jAkkJRtQepk/rZ9wWqqeSwlUD6J+HP6PXtCKao1X/iCxg1MrbWL6U/KKgxqXimGcNq8tg
	 9dKNB/gAWlK83Eymx+KYgpK24Q6t39xuVgAcA5sjEWvyfxI2JDsvA+QiBf6aC25UtV9IR
	 QYQDMKVktg09UXOYyrCXZMx1DkyFKPwvUpItinsn8vefLbXGuZ+8cdYH1tAxQ2v7HnpTv
	 DP4jI/JZB77eanpnmCyJi8marx7CFKhViK0i7Ba4hcdzqaZjcFXpL4wCC4IJe87HFxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeHVO1eH;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91719606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91719606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeHVO1eH
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so2504375e9.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184156; x=1794788956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
        b=XeHVO1eHmzTpneED2NyUHi6QH0SGLEunvqndFg4qax/rhqQtMVeT/ES4fdDAiF3YTB
         ILc5TnUa0c5R1wx7DDLpX6VKiRNuQOoU/VVJ1MGfRbvSl9QKw4fAOF5Lw51dwGeYQ3QB
         wi4c+IMQqigaQl916Xw0Ad58fDMEHwobfwsei6eBkDruR84dzSrIE+VV23cjKD1Wq0Ys
         au0dWvo/sZ9LO//UrJHDYp1H+Do0tB7b0Rlx1GtRJTO/oDOzpOam2Sr+0trDj0XvFS1t
         m/JKtkd7PtVoCWJWOnRM9Vk+R+x/VddsEjWilgWqy+Pi4vDB2igl0gZOFOVCSruYILYq
         AMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184156; x=1794788956;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
        b=DC28Y5vX7B/KrA08LCCEdPfPJvWobMsgLfLB+Hsa44P+n+cMz9lmLy6oY52MN/LJim
         3Ut2HG+xebhptzqN0bx48dIuCE5GKtSZaK/qOPNkQtoQtgXPxbnhJfi4myDyoISjE7y2
         xHb2NWFJiDYQxA0RrswClcrHCeaz3NfRgqpsaRpcDvSz2aS7k8z19qrS/q5chMU7rmcZ
         T+xO4lnEsvXbVpq/CQrD0yXuIbcvugw2LiPJXGwZbjhBkJE+l64oPKoK3ZAhC3gAA871
         ZnO4LMrLypiJroSMYlxSF2qcMPsW9tNQg3YE47WwazOF6pyoIKnQYE2/PkKHkY1tur7Q
         dVrg==
X-Forwarded-Encrypted: i=1; AL+hErGuDzivEQ4yBMy5+aPbOaFmxN5VKYuGBL7ekT82nhQe/lXaoxqSRWUdTOSZgkOOL0l3fFuf+GguzX0C@vger.kernel.org
X-Gm-Message-State: APuU4Z/0S1pCWrrousowbrn32CLmHi07oDDM39JSmNnxacCDqyT8EQNs
	Sa2kqTzsEy4ZfbuHdx9k7NKeFEe5aajShHHCj1eH/sKsMeQqFnGDI0xHKn6y0txrjRI=
X-Gm-Gg: AYBFou143Pz3MI98fwVhN50PljNZtz+9sHFAcUmPjXOAVXflKEbZIzGy3yp22IweXEQ
	gAYjIhCjXHgiTJzFg1xg0ou+XcGf3/u57JCGs8XaScA2p9+hwwLTOMk36uq3JTTYfj2IhCWHWR4
	sQAEV11MAKFQ1n4WiLM3C3mGSP81fXA6Enhso6GnpbSl3SEUSwndsgmqbUaTAfBP4BZ+/zqJkZV
	y+Tmc0ip0IEVF9ZXIlWnWjjqPJ+Njb5ys2du86KAwSu2Ov18x+7G1BtHK0DnqiCfkgav0N/920l
	B45rgtXRqQa1dlkvclal2RUCW/ICS+m3SWU9/fpbqj0FKBaSrZyAj8wqPCdZTF+VvsCUueD11rN
	/T/ijbvYgzn/Y9zrJRXhXB+84hwOlRiWWbGL5tf8nEPm+vLpgfKy3/rh4li4/OW9cEOc9aTj+Hc
	1yDxeshimTq1yR7npqFHqB99+79o0HXVfYJ2H5rDCuJ5Gk2lWvhI7llytquNeaqBKyLQ+HX9Dvj
	rk/60dB+X8C45HZB3J1ror+obGbTbEttnJxfWgPmQxSpt3JpXzBDdYAe6pyHhnXy6BQjZhDjnsU
	o6Z1XIuD0wDstE1Fxslz8G+QTgbEIRuyYQE5arDj
X-Received: by 2002:a05:600c:314a:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4b963c74205mr50122005e9.21.1794184156029;
        Sun, 08 Nov 2026 16:29:16 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:15 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/5] Add RPMh and global clock controller support for
 Qualcomm Halliday (SXR2250P)
Date: Mon, 09 Nov 2026 00:29:09 +0000
Message-Id: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIANUT8WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwML3YzEnJzMlMRK3eScbF1jMyNDS4M0kzTTlBQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA6Hz2LXAAAAA=
X-Change-ID: 20261108-halliday-clk-362190f4f5dd
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=1914;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=uKIpXSczL5GAI4liZmQ8OnhhHWMDKyKJ4I+wY+f+SRo=;
 b=jsWNwHFjnQup72vwLh+no3Ao6fRtevTWkJLU1Z/hEE5gAg5Re1X1JEkAl9lJnkkO0Q9uKeyFF
 5gBpTLle99/C9THaABeA1BqvXjQ/BbTsh8DHsSw9A3tE17VgISMKKtj
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks and the Global Clock Controller of the Qualcomm
Halliday SoC.

The GCC has the clkref_en gates on the outputs of the QREF block, whose
supplies are shared with the UFS PHY. Patch 4 lets drivers built on
qcom_cc_desc register clk_ref clocks next to their other clocks, so
that the GCC can vote for those supplies.

Halliday (SXR2250P / Snapdragon XR2+ Gen 2) is the SoC in the Samsung
Galaxy XR headset. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (5):
      dt-bindings: clock: qcom: document the Halliday RPMh Clock Controller
      clk: qcom: rpmh: Add support for RPMh clocks on Halliday
      dt-bindings: clock: qcom: document the Halliday Global Clock Controller
      clk: qcom: common: Register clk_ref clocks from qcom_cc_desc
      clk: qcom: Add support for Global clock controller on Halliday

 .../bindings/clock/qcom,halliday-gcc.yaml          |   84 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-ref.c                         |   91 +-
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/common.c                          |   60 +
 drivers/clk/qcom/common.h                          |    9 +
 drivers/clk/qcom/gcc-halliday.c                    | 3552 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,halliday-gcc.h      |  249 ++
 10 files changed, 4030 insertions(+), 50 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-clk-362190f4f5dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

