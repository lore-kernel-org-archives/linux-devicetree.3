Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A7A27B32C
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406472; cv=none; b=h+eEJdPjmorsVEsxa61bqznTHomIwqFZv6e0lndvo4DywB66umKnt814H4rOan/el28XIRmTvHGnsAZcYg9ruORhMCfQEtyr9M3iGdhf8EWtpdq3Y+cImuFVZdbROL9LlXKu5MjvQNLiaKiVux29ogu0P8nsJLQzFRA4vQpwxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406472; c=relaxed/simple;
	bh=D62mlNiWPfzKSRriXG2cWLUSvblI+VAYnydIZWkmXAQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KEln9tUs8MkNDDEKBuyI+lhSKyk+1k+VCFDTIGg0rr39ocPYgakfJrvpFckXC0dgAkT7GG3HU8tum2nAj5lttDxNAZ5I8ylkTQ+MZTLzTOKQ5Ts251UjqEoDXealpwlxekyBGZyOWpp1+omwtVXMTJrxyRToBb77XZANYW4p37o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3hfyrmH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3hfyrmH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so56166625e9.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406468; x=1779011268; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WsUU3X1LaJjztgUuBWgXdCZ84qVTBBh6rswqrtRvpIY=;
        b=Z3hfyrmH/4Gbaqydo3VQA0jmwo9kNhq7j5/URF1mNOJv44J+bxXr19VoQpJknh5iiL
         6fiACLGTxs8Mp/NO72DFu4TSgFqMb8S2iD7pUL3jJxeSmx4ok+gk4vAeZCHuHeyHo84T
         n/KyadK6wsndgCtY03eVw8cIfp0rkoh+nMzvpLxxBaou4AW49v3QKCgtDDx4BG4Qd6nD
         hWtqZeo3CPZI1knRR11qVlgjXrsQdeiGqEicRn2oRDUtUdygyp9Kksk3dYbY/YSLfrHi
         /FkufxX5OaPAAKURmIOnFpEdsSONbIvzANhBRMpfCbvUVu1S4YVoOF+xz3viilHPCjrN
         BgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406468; x=1779011268;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsUU3X1LaJjztgUuBWgXdCZ84qVTBBh6rswqrtRvpIY=;
        b=Eothon3PDNgcIdVXmOc3wW+PEOw8/HkUmlbldXh3JiiMOsCJtKAz1A/ppk4ugGU7mC
         2KaJyTC/SGbfBrHPl1ISwmusX2G/SzhT7aTg6WY3HMeBEyLPArE9wosPyaik5niWu75a
         LPfYwBoSipXGO09MwkLs4SU030/RyA5xARnFdgV4z88sCeq3gvkVO8tEU5IA83OU2RwH
         FyqJFfAGEtGI1dTiNetHWsl8fsnHPTnPdcNOp3VvZ6mjMwRWyG/6I78p7e/KFQNdUsWU
         fxdq2t2ZAdixYaNVPKYpHWlqYFLobq+KCpb1xONu76TQt8eIYtxz1FgG3RrinNnU1We2
         8L3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/RwmNY9lNeTjAHAHSrOjL0wbbSLFY/E1zS7LsTFFpyOXMe9gu7O9kCDKfKcKZFcXqF7MnCDFDTQXA4@vger.kernel.org
X-Gm-Message-State: AOJu0YycrGXyTeSoCrVvlbbw/8VOSZWVK9xeZABgZsE2jJ/rpapTtGeG
	5fYEH1MXkLFK2XHqCOVYjtsPWHGKyLDBXeHeQ9bl51aBtTFfx96wwZUF
X-Gm-Gg: Acq92OEFjM5WGggSsqNKdY7RnYbQkCgA+H3hy3iNWK83GqjESAoyKMPOo8foeaZS7gi
	DEycG3AHOvM+qndWIdEjv5rhZVQS2/EHq7odi270qeH7InLFknsPRzLW8wqIE7dHbf0x1oZcfAY
	N2Ogc5ldt4dVTmo7hcPOT5/A9/aCFgpSjSEHllftHzWM+bUPRupz8k1J5cybGSa+BKws2Si18nR
	lFUQS7X4H0jsTKszaAWnxwuZdLcsROp5hTzQH5ij91LJPs1aTEaaO6N6OmNMnhaZPZD1QKbk6YN
	NPT2S0pnaow/q9xgR3e1t7aGwpfKo9FV7Xo53n8skaiuFBoYY/reVdVdjn/qVL35qxl6V1hoIrb
	8w2IU2Qr1T2Wg0tk7DYntOK6cQvEj/WqDHcNy8NidmofcPvf1ro2KgAuL8MElE9Y/MCjAw211Rk
	mvu2M5R8OFwG/dpDKTgPyM2zNJDqed
X-Received: by 2002:a05:600c:37c6:b0:48e:7f22:d90 with SMTP id 5b1f17b1804b1-48e7f7de432mr20458845e9.4.1778406467953;
        Sun, 10 May 2026 02:47:47 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:47:47 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v6 0/8] media: qcom: venus: add MSM8939 support
Date: Sun, 10 May 2026 12:47:38 +0300
Message-Id: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PTU7DMBAF4KtUXmNkj38Ss+IeiIU9GbdGJEF2a
 4Gq3B2nLIhKxPJJb76ZubJCOVFhT4cry1RTSfPUgn04MDz56Ug8DS0zEGCFlpaPZeydcrzSdCk
 8R+QowKDGTkdPrM19ZIrp82a+vP7kcglvhOcVWhunVM5z/rotrXLt/edXyQX3wkWMgKCG+Hwcf
 Xp/xHlkq19hI4DZE6AJ0ToyEJQF0d0Lait0e4JqAvS9dCaEzsk/gv4VjNj9QjfBOR0NBQCP4V4
 wW2H3BtOEoQuGPCAZJ7fCsizfX5vQS8wBAAA=
X-Change-ID: 20260416-msm8939-venus-rfc-c025c4c74fae
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

This patch series adds support for Venus on MSM8939. It is mostly
similar to MSM8916 Venus, except it needs two additional cores to be
powered on before it can start decoding.

As per Dmitry's request, I am attaching Fluster results and
v4l2-compliance output. Fluster results were very inconsistent and
caused power collapse fails.
H.264: https://pastebin.com/C15qeq5W
H.265 (HEVC): https://pastebin.com/WDsnxvuk
VP8: https://pastebin.com/egAgEm15
v4l2-compliance: https://pastebin.com/VpBhEFc1
Power collapse fail log: https://pastebin.com/rTivMcpK

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v6:
- Added a more generic mechanism on blacklisting codecs.
- Reworded a commit for setting Venus core GDSCs to hardware controlled.
- Reworded a commit for adding HEVC decoding to MSM8939.
- Link to v5: https://patch.msgid.link/20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com

Changes in v5:
- Undid the merge of vcodec_clks, they are split back to
  vcodec{0,1}_clks now.
- Extracted a dev_pm_domain_attach_list() call into a function of its
  own to reduce nesting.
- Added missing "power-domain-names" required property to device tree
  binding.
- Renamed vcodec clocks and power domains to match other Venus bindings.
- Reordered commits and grouped them by subsystems. Now first come DTB
  patches, then clock, then media.
- Removed "status = "disabled"" in the device tree example.
- Link to v4: https://patch.msgid.link/20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com

Changes in v4:
- Removed vcodec{0,1}_pmdomains and merged vcodec{0,1}_clks into
  vcodec_clks instead for MSM8939.
- Inlined video decoder and encoder device tree nodes in the driver and
  removed them from the binding.
- Kept vdec and venc methods for HFI v3 separate from HFI v1.
- {vdec,venc}_get() are now called as early as before, since it is no
  longer needed for us to attach power domains to dev_dec and dev_enc.
- Link to v3: https://patch.msgid.link/20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com

Changes in v3:
- Added missing vcodec1_clks to resource struct.
- Removed enc_nodename from resource struct since we include
  video-decoder now.
- Link to v2: https://patch.msgid.link/20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com

Changes in v2:
- Enabled GDSCs during encoding as well.
- Merged vcodec{0,1}_pmdomains_num into vcodec_pmdomains_num.
- Reworded commit for marking GDSCs as hardware controlled. Same
  situation as in cdc59600bccf ("clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock")
- Clarified the reason for missing firmware-name property in device
  tree.
- Clarified the reason for moving vdec_get and venc_get for later.
- Link to v1: https://patch.msgid.link/20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com

To: Bryan O'Donoghue <bod@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: André Apitzsch <git@apitzsch.eu>
To: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

---
André Apitzsch (4):
      media: dt-bindings: venus: Add qcom,msm8939 schema
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node
      media: qcom: venus: Add msm8939 resource struct

Erikas Bitovtas (4):
      arm64: dts: qcom: msm8939-asus-z00t: add Venus
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: add codec blacklist mechanism

 .../bindings/media/qcom,msm8939-venus.yaml         |  79 +++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  23 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  47 +++++++
 drivers/media/platform/qcom/venus/core.h           |   2 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |  10 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 149 ++++++++++++++++++++-
 9 files changed, 321 insertions(+), 9 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

