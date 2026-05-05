Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B1A22126C
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017548; cv=none; b=XB/prXSgNHkCVTyZNEP0NWjrULm4FIrT0SJD+sphreFO7uT50y/LvoNR6vI30AuoCLnfjFEP4JaNPUj9E0FNbp4bNZk8rAQdHX7dqaUFlf7ulJIArlSG7eJMHOPeRMZcVaTmGdR5i51aYATOwAx2WnKyhxJB/kjFuIIJdUTgfUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017548; c=relaxed/simple;
	bh=tz9TKjvpW5yv5IQqViiNUGslOdXSE7VzOMqTIfHhwZc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UHnles5zUrhfAdCahLv+CWDoKSFh+/QpX8N6vUMrQcaNQmhKKVtp+2rCH2Wp2m+7H0jlllvLhyx4rdjNXB8AGqmN/iK98R7ERlDE75TR301Ovdn5zDFSupx0IoCu/bucZh+MFfQ25xuUQMStNYtnyhhrvyjzy79FLcTzF2bc4Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjGy5GtZ; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjGy5GtZ"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7bd8c55c885so33189777b3.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017546; x=1778622346; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vB9JuHPq64gwku260f6WsJRIkrCIdonLJv2lthmb0uo=;
        b=mjGy5GtZD+eX/tCjYTDreRsExscXcFpp0S1AFncZRHoT9CTWA2qcrjp0Vwb1ItsYd3
         AkKnZSnmSvGh9enFUn61Fln1Ou6lxxLpo+aEJc7L4QMy9Ea4bLxH01l45MXv25/tvg1a
         6boXzwgK5loVNiytyxcCQv93balQwW70OlLUHw6h9AwTK/FFDsBv1lIoIWfqafmug63u
         8LPjCd8SFX7zThWLBCm6sWG7+jkQsPJRagBzRVW5RsPyIDPyQcAINQIttbo3/7S9DGNV
         yEqqcCqKczg7jZVe4b4aJM8jOqzf2fHusxWBqvaolVZbGLaqyPOvOfRUN2l91qktuxrf
         RmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017546; x=1778622346;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vB9JuHPq64gwku260f6WsJRIkrCIdonLJv2lthmb0uo=;
        b=X9AIiLOqBuGB/uW0xd9vWL3ScCfmCx/dk4JP1DataZWRsd8hwmLkEVqOHF1vaOfpWc
         A6PV0v4o9LKTlRfiseA38Ux+EN1gaKuHMwJemCjapYUnmobWsLvaSmECADlC+xZzREF+
         633Xx7aGhAkavZbLpf0MAyXnlJg5VWn3ZcB8Mx/eDNURowOeJVMUOS0UzaJIFJT1yjat
         9IwWlUKH3vyqQ9HLtThfGG/+8dy3T0/kCTM2bncdp0JJzFCvzKjTqJUMp819hvtEyTp+
         ztQMKyMM3ECIgsUx7M9WMBfbVxb0U/IJg8RqWElSdlKoWlEfmNlp2f2wX09qxIjAZ+tV
         ZO0w==
X-Forwarded-Encrypted: i=1; AFNElJ8NJiYUshC041ZK0G/xsDs1jY43z3VcHoqodJ8h91hzNIANBUueov/mv7Rd7Vpu8T2BLxbNZprDPYH+@vger.kernel.org
X-Gm-Message-State: AOJu0YxikFHv7IXSEONzgcMGWeIl7r4qbMlzutKpt2WQTPFAzrc5EvKx
	AMCF2QKoTrvy0pPoP4XhWKF7KuW2SYIEmLLhd6wZGXgTexjQP9AwsYOK
X-Gm-Gg: AeBDiesgQih1RhGTbBBVWH+dMuCWjfjmLdbWGIEulz2ExMN6GOU1KvpysNbj+xxscEV
	3kMTsV0q9o2zobgxtOMj7Sn76f6DfgWab9z24bNorIhXPWch4Z3hd/mD+HEmMDcCtR8IsqVCSni
	WDDSTGRe+SnulCQLNz3syyWdN6WXWlp8EAIwBE3PeMDu71RD6Es2DN4L1cV6kK8sxfeHqFks7Bh
	xDHIN8c0jQ1NPmin42RJ1PVPZcTK3hrIJMohM8ir5vLntr9arqQl9i9lkTv3D9InnN5wWpb8T46
	djrgSqLls7Ge8lurWrDdV9Wi83PuLVuAbbqWi8rjYHMB/CH8EXEOmY1FYyLuJ3+kJwcm274zsHS
	gaWoJNm1QNeUsRfL+2Vgy6IPHB8h4Y5alHi3ok3PNS1mn64Pw7ZYcICF/Y0DcjRKz0kyzE4Y7B/
	66Fi/SzXf41NhWUJSApYhKFRjA9+5/akomstlo
X-Received: by 2002:a05:690c:e3cd:b0:7bd:577f:56bf with SMTP id 00721157ae682-7bdf5eccfcemr11720867b3.33.1778017545971;
        Tue, 05 May 2026 14:45:45 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:45:45 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v4 0/9] media: qcom: venus: add MSM8939 support
Date: Wed, 06 May 2026 00:44:37 +0300
Message-Id: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ6CMBCG4auQrq1pp/zVlfcwLmCYSo2AabXRE
 O5uwQ0a4/JNvnlmZJ6cJc92ycgcBevt0MdINwnDtupPxG0Tm4GAXKQy553vSq00D9TfPXcGOQr
 IMMUiNRWxeHd1ZOxjMQ/Hd/t7fSa8zdC8aK2/De65PA1y3v3zg+SCV0IbNICgGrM/dZW9bHHo2
 OwHWAmQ/RIgCibXlEGtchDFt6DWQvFLUFGAspQ6q+tCyw9hmqYXDKNBoEgBAAA=
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
      media: qcom: venus: Add msm8939 resource struct
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node

Erikas Bitovtas (5):
      media: qcom: venus: add common clocks used by both vdec and venc
      arm64: dts: qcom: msm8939-asus-z00t: add Venus
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: Enable HEVC decoding for MSM8939

 .../bindings/media/qcom,msm8939-venus.yaml         | 75 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |  8 +++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |  8 +++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 19 +++++
 drivers/clk/qcom/gcc-msm8939.c                     |  4 ++
 drivers/media/platform/qcom/venus/core.c           | 42 ++++++++++++
 drivers/media/platform/qcom/venus/core.h           |  3 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |  3 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 80 +++++++++++++++++++++-
 9 files changed, 239 insertions(+), 3 deletions(-)
---
base-commit: 21060ea19dc56e72ca183c99e9b39e52c147bed4
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

