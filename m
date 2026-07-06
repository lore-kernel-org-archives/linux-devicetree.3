Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAC7375F9E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350175; cv=none; b=m6HxLN9jIHH/21MTponcU0M77JXCstTMnN7ortgtAc/t9s8B3Dwrf2zNABKOc4mq8c5iWqBDDL2suJCJQ87bhBVoDIP4WK90yxJNVPqVMcnwKG5Qf9/htY+a0MSf5HSnpqwd6XWFAIj2HH88SNA50IgtoBrdQUJMrYGVtVZ49GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350175; c=relaxed/simple;
	bh=vxfXIFdpH2DkubO4qsVjWm99Icp1mKYD9x6L3Ptu088=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XQZtu8VROXJ6h0OxBPy1h8ae1Sab28aPQEV924LDCoSM0bNUf8XpwSX902iNfOHVCbGo0njoJvfPWsRhnnkJijVLO7dNwpLDV2ne2/Dqqa+jdDSC88TDdZAFgnGnuIcA0m7tb4whJShXatsby3nGCA0KrPLon743qfEZAp911z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i8Lo+YN5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i8Lo+YN5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso32409075e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350171; x=1783954971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyKuwOGJCk0NkmK6l4ueiJx1Wz28pfoEZsB8FSk6Sy0=;
        b=i8Lo+YN5YhuA5MnLuubj0M+BpmM431jQSIQdmFXjjEWKZEBt8/R9S900Rchc/1KDmW
         D6jJ5mRk+7E9JpZWk/c/I7OuT0pd8phIEVAy5IdSrhNtujGEMsFQsl5Hsi7XoL7zVEec
         4m6mE9n6eYitU0QJGOn+j+/SdXD6VUhrpkAtpFZ2cIu9vq6BsTx5LTghNLTzCLIoPKeB
         egoEFk6P2lbPvMGozpLzO9oaFqSO0JzA0rVyJUmHt0TVARAhsjEiqnKhxKA2rMK5sGSM
         FwtAbGDRftpx8Uaor2yg8GMIqFmrGWM51xhXD01NhZB1mF2G7AO5nYDUBHYpPENtUuQv
         5oOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350171; x=1783954971;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyKuwOGJCk0NkmK6l4ueiJx1Wz28pfoEZsB8FSk6Sy0=;
        b=OdGAfw/0I2yuJL3NZ2o2/Bjqz+abTeFLZQ9gjrNg7+D+wVw3DtcbvwzYDSSYvAbmIV
         BxBm1Me4K12oNvx1nX2FTirtq3cYU4C39YDrfDz31xj8Jm3RBQA7jWGg7w3Z2rDE2VSb
         ZQA07txr5x9Ku5cJDoJ/CLt3yvph4AIXJsJrG4nY2NCVkvnRqhXur7IPh+cfgRyGgRUN
         +OhWTrOzJLCDBMa+Jm5qCPPn6tfrgJ2telLVQO1WyGFsbNzSaC0RGex4BgaOjHr21y1A
         nCRSVuv9DnJD/XobChbtraZTr3YjFwD0VIwoI0jncwCgZfn6ZaQHQKtTSI4vz1BLl6+B
         sFow==
X-Forwarded-Encrypted: i=1; AHgh+RqtaOOKZpdPSF21vGf6Pdz01PG1LZ4TW39MrzyBx/AjqPFycpG2wD1eSlKsI7UJsI+QULnoWfFZ+2Q8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv+fRmX8JDW408XTFH5vtnAOw5QrOynwKVopCcL7yi3WG59hhp
	vJgpo+H6NX54AHEzJGjjyQS7Afat3A/asUHp8WyLwa4yHOjklIZ1H3R1Ae6x2O/AVzc=
X-Gm-Gg: AfdE7ckY0gPr9H9G1XkcfbqcuHB2FbwbpbnQaa+VBxQG5o4Ei8AqaAEXCxWyvlAzEwX
	fBM/wGwuR/gX982gn1K2N+zWnA+NkIrpRoj9UOQJu9dKmIAWg63ixY/8GeIsltXxiJJhk5dLcS4
	ktx6bOUUbIr/2o1ttb5MrTMuagGsehF5x2lZ8ME0selCTPCG0rfGj5FyqxnpTQq+3LolUueSc08
	gRPUx/Fx4MYAcS7YrgXIkY5y1iUgQNwqIGCAyi1p+W7F0JxJFLcN1h6hmcYLs7MVJ2QjmzHtkbr
	TIiorggvTJaqO0qbugxn5GVL/831UqkugvWXz+dGolX6gHGUk8/YLogW7a3g0cNbFY/tilAGjF1
	B+Ly5deDSXGtWYzGlhmW+pWfH7+2nHtCDkcTB11SGhbsh5kdGGT/l46eyKDWIBHSr9h/QpCwJCB
	aUKeMu+ichBmCQCwBppbHPooMv8w==
X-Received: by 2002:a05:600c:5395:b0:493:bd2f:c5fc with SMTP id 5b1f17b1804b1-493df074984mr10650625e9.15.1783350171023;
        Mon, 06 Jul 2026 08:02:51 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:50 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 00/12] clk: qcom: Assorted fixes for gcc-mdm9607 (and
 gcc-msm8916/39)
Date: Mon, 06 Jul 2026 17:02:07 +0200
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/DS2oC/4WNQQ6CMBBFr0Jm7Zi2USiuvIdhUdoBRoVqi0RDu
 LsFD+Dy5f/3/wyRAlOEUzZDoIkj+yGB2mVgOzO0hOwSgxIqF7ko8Wl9j/Z+w971ZS4KbPhNEbU
 02knpaqcFJPkRaAuSe6l+HF/1ley4rq2NjuPow2d7nuTa+3sySRR4pLKQRWMafVDnOw8m+L0PL
 VTLsnwBEr9AfM8AAAA=
X-Change-ID: 20260609-qcom-clk-mdm9607-fixes-81a8d11dbd80
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The gcc-mdm9607 driver was originally based on gcc-msm8916, with register
addresses/frequency tables - where available - replaced with the values
from the downstream clock-gcc-mdm9607 driver. Nowadays, gcc-msm8909 is a
much closer match, so comparing the two drivers revealed quite a few
mistakes inside the gcc-mdm9607 driver.

This series fixes them, together with a few other related bug fixes in
gcc-msm8916, gcc-msm8939 and the dt-bindings for qcom,gcc-mdm9607.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Pick up review tags (Konrad, Taniya, Krzysztof)
- clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
  - Replace with new commit that drops the BIMC PLL entirely, together with
    all related consumer clocks. Similar to newer SoCs, we now define the
    NoC-related clocks without parent. (Konrad, Taniya)
- clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
  - Drop now unused static gcc_xo_gpll0_gpll1_gpll2_map variables (Sashiko)
  - Clarify commit message, looks like the apss_tcu_clk_src exists in the
    hardware, but at a different address. We don't have any use for this
    clock though, so leave the actual change as-is. (Konrad)
- clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
  - Clarify commit message, the system_noc_bfdcd_clk_src is really missing
    in the hardware. (Konrad)
- dt-bindings: clock: qcom: gcc-mdm9607: Drop incorrect clocks
  - Keep APSS_TCU_CLK_SRC since Konrad mentioned this clock exists in the
    hardware. We don't use it in the driver, but the dt-bindings document
    the hardware, not the driver.
- Link to v1: https://patch.msgid.link/20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org

---
Stephan Gerhold (12):
      clk: qcom: gcc-msm8916: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-msm8939: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-mdm9607: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-mdm9607: Fix halt_reg for gcc_apss_axi_clk
      clk: qcom: gcc-mdm9607: Increase delay for USB PHY reset
      clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
      clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
      clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL and related clocks
      dt-bindings: clock: qcom: gcc-mdm9607: Drop SYSTEM_NOC_BFDCD_CLK_SRC
      dt-bindings: clock: qcom: gcc-mdm9607: Add missing "clocks" property
      dt-bindings: clock: qcom: gcc-mdm9607: Use proper address in example
      clk: qcom: gcc-mdm9607: Drop redundant register update during probe

 .../bindings/clock/qcom,gcc-mdm9607.yaml           |  18 +-
 drivers/clk/qcom/gcc-mdm9607.c                     | 193 +--------------------
 drivers/clk/qcom/gcc-msm8916.c                     |   5 +-
 drivers/clk/qcom/gcc-msm8939.c                     |   5 +-
 include/dt-bindings/clock/qcom,gcc-mdm9607.h       |   1 -
 5 files changed, 29 insertions(+), 193 deletions(-)
---
base-commit: 696bef37f7f22f894ffc2059bdf9ec76b309cf8f
change-id: 20260609-qcom-clk-mdm9607-fixes-81a8d11dbd80

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>

