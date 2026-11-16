Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864268;
	b=V3G2N7KQzk3LcWBO2+76oxrA0YaQcggpG+gYPaopYz1yWTSHi7GysoZZ22X3RCTPMBqU
	 nXQXlctHdHEn2LrR7+xNldG1lcHt9+7fOGd2HOMYjkcVRBM8kZ2eTDnpJ4zFXiR+Q4aqX
	 ne86boSaIkIZloqjb+FSwdcXehH8z2ALmoZ15hH2ZFn1HZDGUQYWC4VwvU4toR/0OJ2Qv
	 7Tuwp/WaqKWjphJlVee/6HI1cDFcsN8YA/lv0c8+OlS7Krr4PpV8MwD6CbwWCVsJOONWJ
	 ziw5++PytzBgzZ4/+y0mRFTPMDNEgRdV5Z7Da8k+YO0sUrXHqmm4yUc0cJ7UuioFHSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
	b=aGRErZM6K82Snmqe7gXuWSpbSdvR0xJGEE1bgyGGix9GgmUa8FAaw5R5gZOjjqGEWyL7
	 dpOSYwl9VI36FZrfMyVEfIBKi53xMURopQ2v9DaCx18rv2FglShQmLIIuNuqFKrV9oJk/
	 v3SeQO24EjNhqs6giKMI0zi5dzwDi87sCAvCsPM6z2AZsSjUQaonQ5VYYo018UGsg8Xbx
	 o0QtczBxJRheJfXSmpi2H/WC69MWXEeRImWxs1+uO8hMcT+NVr2Y13XCxvzLAefC5Lb6A
	 AESCNj86PXvGEYfotYY5vEE5jAO/aQLnAtVnGgAMVJB7njSvaCjoYTRzOLeiBHbQJtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juy0Ini1;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83894606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83894606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juy0Ini1
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso21019f8f.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864266; x=1795469066; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
        b=juy0Ini1YCCl1DbqXHd9Am/uDxlGe4PFtG8GyDtQM8Yy9fqEcKuyZCICFaQv0iQXET
         MyHh/WhuPMcqOVXnKk6qJ5TVHBCO6xMMlTCnVGdITFJg/lS6vQxgH4lg4cUp4p1GlYVp
         ihdw0RrKSjzIDIyOO9eGusBtzL5aQg7+n5GXl8R2HMOHo2eK3o6Rv3NtsX0+QTf4q3Zf
         TAG6JVMp2Lv9ACtz5tf4kIQq88jSD5E/bAGRX+s4McU+XiYW8lBnBr11zLMsfD4SKCG+
         P8+tiYvPyyQZKtBEZMVxF+5ox7ZrVBsXl6rDYZMikOONvIAriDSdYHGbAeZmUTjk9vOf
         VeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864266; x=1795469066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
        b=MizMY6/kVrEHXIj9218XTLk8/6Eh6f3nk2YYK6NIXUpHoMTe9Ns/t3jTMLHNCZ8g/S
         AMAcPivGvWrnv69w0HSU/J6TGI91V1naC2teg2w9YC0OL44AqQzkC0V5ejXhUUKq3/Fm
         kvTv/nJORF4rbHpZGCORHe0v/779u2h430wLz6DTUpzRi6p6PNlc4U0JOpmt0XeQYO30
         CdaDiyj0qB832zaIwmZVZW51USzzRDyerk0cAdNrULW5+ybC/kM8uHfGhhK0NNCfwBQJ
         RhDb7i6o9U//8dN3QUtdjK0dRCjzXSCjsq/Lpfymv3if7pJtKhJmQcMTh7chDT2cfMm0
         ybGg==
X-Forwarded-Encrypted: i=1; AL+hErFqYePYtbK80uG95d2UWjLWKI+C4CxEYHSP7UjOwIznhJeD1yHpH3Vo6pn4KvosQGPXI92+SMxZ/tye@vger.kernel.org
X-Gm-Message-State: APuU4Z+U8ekfvs5t7ZuQPpB9/UVxYLnmKJaLw5UoS7L16KxFOS1HLjRM
	/Iazqm9qF41nJ76bogETn5qaeceX/PlQYLOA3/S6tF7BIt01C9Ngl8Ud
X-Gm-Gg: AZFdTZcE5Xh6lbbDA2AaWdot/ZtjuZOdxEy2zhfomtVfG3EA4nBg2briwjakMtpqVTE
	/lwe43QXNgJb1QqViLfKpR/a3Izm2ikvdwbGWSzCfwk3r9q80RBoKBYNwlycX6MoCJC/haTMqGU
	lU1VN7FUKtSNY+516ybJ1lM+klnXhyWJ0VkKYkzOWYouF8iZuBcdSEs94HpukTmid7iLA8KULqk
	Yi5Wlqko+IktN32qzBCw3UGeNcGliVx54+JZJybixE4UQpayrEokK8mqxK68G53sOUIG+S2tWRf
	Sd6huc2Ze77J4PaePzFKDE31IBiE6Li0HCXCQbZdOd19d3aJi/v2ujHCu09aCp0Px1GaVNR1x+9
	XUEcQnywDdJaYOyuda/+PqK8pwv9iAGWD/xTtl1oIRpH32Y2OCU0vzAOzMLJxdoPd84v6e+iUX5
	P+MWR1ER9Kk3aaPGfo6z+ZnaPJzVxVv9Hv5tAxyEFZAPIDM/u8bHciCTxSroqfLQBBWomkNSg2P
	SvQ70pk2REt9brjdAGFE6XeMjrmHqTPINSDThAI+ZFBa634B4V9BthWMlH8YIDYw8P7VNVbecmE
	4u1gLtBeofbtbgi1+g/nlxlL/YM6OYmDJ7rJLFQT
X-Received: by 2002:a05:6000:41d7:b0:492:b5d9:f627 with SMTP id ffacd0b85a97d-49c7353c794mr23553821f8f.46.1794864266042;
        Mon, 16 Nov 2026 13:24:26 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/5] Add RPMh and global clock controller support for
 Qualcomm Halliday (SXR2250P)
Date: Mon, 16 Nov 2026 21:24:18 +0000
Message-Id: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAIJ0+2oC/1WNyw6CMBBFf4XM2pq2KAFX/odh0ccAowVMi0RC+
 u8WjAuXJzn33BUCesIAl2wFjzMFGocE8pCB6dTQIiObGCSXhRC8ZJ1yjqxamHEPlhdSVLw5NWd
 rIU2eHht677lb/eXw0nc009bYjI7CNPpl/5vF5v3S1X96FowzyU2uVamRa3tte0XuaMYe6hjjB
 xff0P66AAAA
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
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=2616;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=1wKNlxbUO05hN5xuomY/VWb202BKFBlZseityHzBS6g=;
 b=QLeMRLS3lJhKq/slwW2g7GS+lXLf7jP40aImaALzbPkpD1trwZ+XOVRhn6iAC4ieIOkTp5e6j
 v7kaITBUy8mAfz7eyrfabPUk1zp5iwyVBaDR5tE9u/x4K+DSeNrTXCG
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

The series is based on v7.4-rc1, like clk-for-7.5. Patch 4 conflicts
with commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
the devm_kmalloc_obj() family") in v7.4-rc2, which touches
qcom_clk_ref_register(): the resolution is to take that function from
this series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- common: Return a NULL clock, not -EINVAL, for a protected clk_ref
  with an ID above the last regmap clock (Sashiko)
- common, clk-ref: Use devm_kzalloc_obj() and devm_kzalloc_objs() for
  the clk_ref allocations
- gcc-halliday: Reuse the wrap0 S0 frequency table for wrap1 S0/S1
  (Sashiko)
- Link to v1: https://patch.msgid.link/20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com

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
 drivers/clk/qcom/clk-ref.c                         |   90 +-
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/common.c                          |   68 +-
 drivers/clk/qcom/common.h                          |    9 +
 drivers/clk/qcom/gcc-halliday.c                    | 3533 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,halliday-gcc.h      |  249 ++
 10 files changed, 4016 insertions(+), 52 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-clk-362190f4f5dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

