Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9EE3C3C0D
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520833; cv=none; b=ENE9diq/cbL1P0pWoswTFVqQHcWJJYielMzTKXKl144ipqXSjFCoqSyt+eGyKUf9U5qzeIsP3Coh8YhDjyD64BpSdN1gTK4iuB48tvKL3VoxIFLtvY90ErA9VuKdJlTpx7Qlqt+1Y/brs4F3tac0lTnq0dGwcsLOgSqwWNsxVOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520833; c=relaxed/simple;
	bh=A99Nwn5vp1jD2ulzAJ3Ju0NWFcB4l+nn7qfkc8k78YE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GfcnVrqjdaHZ3vGstVLoE4hByd7pFZ4v7dQ34UBH7Acs9fa/DO9uL/dQoKRLacTrq2CgxjgGfTbKIMNjFkrIkGQl593DwzS5x9xmWo8Aaxe2j1lfSy/8Zyk38TcTVOBpAdBTIi6t5EoOcrYqQH1lz5n0OGVLJ/QIX1ZyEkqubPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wp7cKJyu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wp7cKJyu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-482f454be5bso17274865e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520830; x=1775125630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkthx0tgKm10M/znf73nz0UwJ7K4rLk6IEDnUE65WUk=;
        b=wp7cKJyus9A3EWiuGWMDMBEiPXoavtSD28E23Cno+iUelZFn0n2yTfIvRwsxigOHQp
         ILNwRVaWCPwuZFOnfqE27T78drY6ig/N59EbERC6YnhXYuK5MIbwcFbf7gys146QbjGv
         qM1oU0yohLGeGeUfbOp92e25+iR8Wa44hqe80c/8MH/8/dwYfnULVII3LlSsEb2QQ21K
         87D+SkPrxmE3z1kV3vCNWsn9XwjwqTPZZsz+Xeq8OEtsUJ4q9dGsyIR32a0iZoQeOxzG
         aTNWl/BmqZhqtIWVW8fvXLljax1alLMaB352RclbKgdzH0bEsR9uEBvZntOTjhMou5eO
         yvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520830; x=1775125630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pkthx0tgKm10M/znf73nz0UwJ7K4rLk6IEDnUE65WUk=;
        b=SHCsfPJmw4d2nfYktJs//sEjQEA9FDdqTIpWOc1AeIJfZAgKCAXTUlU/iZ8LeCQmyz
         z+U3pQJpUfuH4ApIRwRUwU9DIKEspO4XzRHODMzW/ZWpNeOK1UiDZtj0qqsOV9eKXAtd
         OKAwb2oJqY1kq/22Ea81zXYMf2nn/sfnLQly/ggIV/1jERs0wASvJxEB+PdAxtdAWgAI
         RqiS1DE4ZdOh/pVCHhKd8vF/pHP8eQhSJ6whQQlPGRK0wIA2F6ug0oWcOdVxaclm0MiW
         V0QK1Bs7rQ+6M652+JKjhkz/r9zcgZcRP6tX0SpUDw1dZckvZGmUAiYvlobK2XO2nwGx
         AeXg==
X-Forwarded-Encrypted: i=1; AJvYcCU4Xfi8G/Q8P93mOn1Xp5yOxMEoAnlzuY8imNwB9rtP0xVMM81TJkgHIc39lFAuhF4eWXXTil7UKlcA@vger.kernel.org
X-Gm-Message-State: AOJu0YzFfZk3gb08t/eCS7P77nQRGTebIqup71g4UgIkA+rzJvHUyO/l
	IOIt3v8W+YDwuH6mdNzT6EbbOrb+qzBbbYnbyrQpFVryrTYglCk4JMhZsXJrokFttgw=
X-Gm-Gg: ATEYQzzUdRpx7+sCumRAFCmSxky3495zraLfx5tSaX38sh5WeNzdG6hfY1F9rRHpyN9
	cA1j/Uhmd+/dxrz/t0HejMOETH0pZnEZ92AjTf1ufMUXlM0Yz9ZT7r8thgD8XfA6fhxBZZ/1VCm
	FtIHyfuIiiRaJINojenxemeWV9vTEKk0LCP254x0FATeHc6YIiHq99P3FryaigYkKLUt7gsUNvf
	XduOPZk6nh7GVEaLyE9ha8PvUhEwEcLRuIjDlH8+jnk28uhnTV+yd+gUQpuOJv0ZvsccS84aOje
	f1YaRsyCRbvoyLvc2xXb7oFy+RlmKlyfi6dGnkFQdXdtsHPcAdPWMHpVPv296XjBHIM02w3PG5Q
	fP3HCzwquExEScGnybSANVxXBuUJleQ5L4uVWb+cVW9jJnZD/xwkb0/ayH1Jej6npsTcOzu8Ka+
	nUgTS6dQ5Zxv0Fi7xwdm3B05QhzOB73Hma89Db8U/nqimy
X-Received: by 2002:a05:600c:a114:b0:486:fc4c:db72 with SMTP id 5b1f17b1804b1-48722ba8efcmr13552825e9.8.1774520830384;
        Thu, 26 Mar 2026 03:27:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
Date: Thu, 26 Mar 2026 10:27:37 +0000
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABkKxWkC/4XNTQ6CMBCG4auQrh3TFgrFlfcwLmp/YBKlpCUNh
 HB3CxvjRpfvl8wzK4k2oI3kUqwk2IQR/ZCjPBVE92roLKDJTTjlNeW8hplZ0OoVI+iIHMZ+ATN
 FBMG1FJqayihJ8vUYrMP5kG/33D3GyYfleJTYvv43EwMKrnSNMe7hZNVenzio4M8+dGRHE/9AJ
 fsB8QxJ0WZLCdG09Avatu0Nszw2hAgBAAA=
X-Change-ID: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2963;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=A99Nwn5vp1jD2ulzAJ3Ju0NWFcB4l+nn7qfkc8k78YE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQobLM7raaIGxmKuI3JN3MsqN+NJTiOvjfVj2
 kPZTgahgVCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKGwAKCRAicTuzoY3I
 OmnVD/9VCe7EbJuTrIyFyTxC0si17XgLSCBhQo2ogiNvGR6JIzYg2iQYbAa9EkZau9h4zxxgaCr
 P8SJSi0DR0MWqLXub3m1S1kGn3sPSa8+bn9cQPwH0+q2oNhSN3o0hFXIdC2fpBlC8F5YP2Vovlh
 60GnOVjPath4S+GNv6TlWMdAeT5PiV0+iOmyGO1gYwQ+2VPGuNzLWXw2BE2i+uH1TkDnN8zpSAs
 CasjbR6FkxF5vlDAGyRe2El8saHVJI+0ZTJ/4opyMVvSugME8ZynEPwWnsB+JCPdv3nKr6t660y
 1I60tzyG7M0L+jjPdfm0y2FMBlve+Y+kxZ+zHIVuKIKcXmyO64URJbsG/JECHWQHKUxwO/H3dzz
 d1AZFVzZOLTL/Wq74pGfrz17emBXuIjTUDS3IFg30O869WmbB+OgOvY4hpqFKDIJZ03syTQ/4Pv
 2ZA4KOBfQcQ5MPwAgy3zkH024/kxZvALLdVKZqUrQ116vv8Wzz2gFg6WkRGMWEUeu0ExZUZpqUv
 5ggi4LApAaBrHxMwhVJUiGuhJCkDa9essNroaV5rF9iyF7sH+PFbUyupIKtKduDUqHwgfxvqb+X
 n02abHAPp/BYd1212qEZ1EpT56QAP/u++hahyvnoMvZ3AtlDEwNml+vb4KrXccqb8j6mNl0eKWs
 RpNC8w0X1ZaQwgg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

v3:
- Too many depends to have this merged in this cycle plus some review
  feedback on the depends patches but, for the sake of completeness with
  the other posted series - posting this now too.
- GDSC dropped - Konrad
- Clocks dropped and renamed as agreed - Konrad
- Using mode PHY_QCOM_CSI2_MODE_DPHY
- Changes ldo7 on Slim7x to value indicated by Alexanders
- Depends-on: https://lore.kernel.org/r/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org
- Depends-on: https://lore.kernel.org/r/20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org
- Depends-on: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
- Link to v2: https://lore.kernel.org/r/20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org

v2:
- Defines CSIPHY as sub-nodes of CAMSS
- Includes updated OPP tables for those PHYs
- Fixes supply names for RGB sensor on slim7x

- Depends-on: https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org
- Depends-on: https://lore.kernel.org/r/20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org
- Link to v1: https://lore.kernel.org/r/20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org

v1:
Add the dtsi for 
- CAMSS
- CAMCC
- CSIPHY
- CCI

Add dts for RGB sensors on
- x1 crd
- Lenovo t14s
- Lenovo Slim7x
- Dell Inspiron 14p

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (11):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition
      arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m regulators
      arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add l7b_2p8 voltage regulator for RGB camera
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor

 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 515 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 106 +++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  61 +++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 136 ++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 135 ++++++
 5 files changed, 953 insertions(+)
---
base-commit: a35d7301e99cac05f09cf70edf731f544461b2d2
change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

