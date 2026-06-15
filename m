Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFD941166D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542821; cv=none; b=KAs4GDvf1sAmmaQlIlLie/JTrRHCQFDjGYm96OGywPY9QhH3v2fpi3j+prOiw3ZFkW8n6/68cSlklhNAkMbO7Cq+1W/eOLJs1RXrL8Uo18K0GKfr0JsZXQ+dsMCD9pobH4SZ61GjtY4uny1bUGNZX8dRbe0tQa+k5Ef7FnXST5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542821; c=relaxed/simple;
	bh=YxNDpw9xuK3rygMohXzgPJDlAzMxnfekYv4lW9z3syw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EqhWfo97Biplfc5J40gCUmEQMpsCZJIvXgPcGVy/ngeBEtPYqEfCwn2UI5HgCJUEaH9HEwDWA3CO05ioTWcQzWsWXodpT6oDpSwc6EZiglIHULziSFkcTbcpQEhWA5g+qX9+JrWbvYa10cqnpoH2uKmpKJBpeFeX0/jn0I8ejMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FKHE/9Al; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FKHE/9Al"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49222fb062bso26348775e9.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542818; x=1782147618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq/aabxoXCdxhHTjLQmnQMl4f/hEoUj9vBeaPo8NSGA=;
        b=FKHE/9AlhTUMp3ZygCFWCTMHqJwtYSa6sSahiHFFN6XXvyGtZqFsYOyNkqbdQ0ASAc
         JfCeT31QHNAFTX+EIgqHoSO8Vm4eC3oeuUWcWyZXE+pRU1UlxZZUqf14piO+GXJeD7aA
         SyhYtkJGzjcgi0efGOXheLQY4KzWi+nJmrTMbbTxw5vYGEbIzURFGf6aJdtf5ibJt311
         ZF+YZDbAyHJom8NQtxFgNfzq2KA+IC+Dd6onN62URsII5Z8ZdkJ/pSaYUpCJzuwELy+5
         8OQ4Rmt0abnAQ0+06E073rQD9O/Lbh5K7+KboiEbGpNsEOTLdY72Mj/51ubOMImQyO/n
         /Leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542818; x=1782147618;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jq/aabxoXCdxhHTjLQmnQMl4f/hEoUj9vBeaPo8NSGA=;
        b=C33G9a9uA4ii23U//VTWn12mBfUfc8xGeBbgypTLN+2eoVCC9LNDeidSD0o9hGvcQ0
         jpT8NQHw6V9Rl7rFri9R2zllRosI27yGoTeiUCca9s+0hjyA4A5giJR6gfX6xxpQnLKs
         8KpmOmw6+tJx8nqICip5Y5Ch09Xiq5nN4fEVVxDWpHqSL0KLwOMBs3rqJ90Gjsb4W5sS
         qgVF4Vf6rkTEQ4hdZsgCz/yc7fnFwYM6+PYG4MkfR0gItKz2+NMyhJR2p1zOIaILLiw0
         3siaVqab79+9/6PjD3gonYirVpk/iAoAOyEsC2S6ZFaU23Zg4RbpND4XLbNiCi6vSDTd
         i3LA==
X-Forwarded-Encrypted: i=1; AFNElJ8wkTpeiAay7WcsyBpcAGI9lGp1BbIJeUiiXJgH23cG+2WnqKwMeRIKfVkfMtNgy+ruGSLuM0GppPwv@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5uZXAWVDPR9HUq4htXqJVvk9YMJajfajKdnwYdfroWN+x5lM
	zin2+X7iBUq9OhTXDeYu5rerhiFNPuId27DiWBhb81JiFw/L7xKCsu3tEfheoc7peMp47pU7G/f
	Gvk4ZmrM=
X-Gm-Gg: Acq92OFf9WCHPDd+wBJhrMGyRCDemT31ogxB4IzQzrFTGAIhlP2A6QrgWMuPqhEZh7H
	xayDt5304fOCheSqCG+MWXgQPCqjC8Gl7QbBNZQ7f8Nkju25piF5bhyrG46eDjii/R6Db6lIGEi
	D9G7uz3pl7hcXZ8tfppC25Z+ZnVjNzPYgnga1WTZcfs59fYgTJ1FaKAcpRY51ipWl8wjNl0bSoR
	VuFlIeT62Ydp9TahX9MtmFXCkAT594ejg5kxqTrA6jiIcA0y5A1xi4dVxF9nJuyV+YNVqPmULnJ
	obpMSXcQaA3MVnSIzGafKCfnQelCJpO1xpECf6aOEccJ38A7HLiQUusW1+APvwMWi4zXs0sz7Lr
	FB6LE2/byc2y4wbBzFcAu452srYPxWXA/WHZeJ6IgTonMPYGD1YqLkq7lkjok6XsP+/PaSZWbn4
	hcz1Ci8vntKh2lbiU/ueXuceui5DRQpQGEjX1R9uVjd0DR
X-Received: by 2002:a7b:c8c4:0:b0:492:2fa4:2563 with SMTP id 5b1f17b1804b1-4922ff9b0d6mr252455e9.25.1781542818301;
        Mon, 15 Jun 2026 10:00:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47d1csm5716425e9.4.2026.06.15.10.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:00:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC v3 0/6] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Mon, 15 Jun 2026 19:00:06 +0200
Message-Id: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYvMGoC/4XNTQ6CMBAF4KuQrq0ZSsuPKxMTD+DWuCjtADVKS
 YsNhnB3ARfGhXH5Jm++NxKPzqAnu2gkDoPxxrZzSDYRUY1sa6RGz5kwYClwltHedkZRf88HAVR
 qJWiNbUJRVwWvSp0koiTzc+ewMsMKn8npeCCX99E/yiuqfiGXWmN8b91znQ/xWv63FGIKNJcZV
 FlZgMzE/mZa6ezWunpdCezjCOA/HTY7QingOkWlJXw50zS9AOLirm0cAQAA
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2623;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YxNDpw9xuK3rygMohXzgPJDlAzMxnfekYv4lW9z3syw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC+d4YFOyD1U60xXqCO9gD8i45wOrsN2VrFVY1/W
 Jjw8OnmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAvnQAKCRB33NvayMhJ0ZPcD/
 wP8jXCxdB7NCspgrTbrfdenAyduKllEea9g6FrIFPD/P+ZfrM9SWU9m6nHt0AAZCqbSlB+wmnsnPv4
 U+afLy8Ys8P3uUBAaesBFg1rX8faEJ52k+eVP4r2iLgndlAhX44wRrhrybIulZvsb7Pe/7zxadg07h
 5C7uRAWccbruHifeBhgaYygHI+PC+qjTfx8dEfUOIzaN2/sDSxvP7kny15cdJuqhlYSXl34DziQhZW
 zlgVufjs4bmGPd3wil4/4+4ZgiBpSSNz/HjJInadezcwGoqJZAiCqgeDMGbVkg0KxpmebBR24kQ+aD
 5tleKizUBvP0yKChPc2dd8C8VC7p4syITgQCKzi8LmFUgtVyk7RVAxfcD4XJlypHCdGfx2kCblYPyo
 voK0FE39lTXHOz6ofGMdihNx9VLmLiaUWi41taQdesN8LjPnEWNPbBCK20H/HvBrKyra95e9fbgPLr
 ccEKDTSa7Ol94p8PU5t3exigPqY/nU8/mtEjKpSzBBuwhdR7xqvVnylo9vDJxWCmLpd6RMe6ZF6P3p
 G7laskIZbDoAYVjYvCbctGh1PfqBCHWU8V2nIIEd3v/0J+C61nE2f8YXlXYp6Fehf1iL7jx0HNUDam
 HhSf6m+gnAy/1I5X2qOX8UvZR9lPtaBdXUtdys5E+5Q5OtTftUlNC12mWJnQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
found on the PMK8550 which allow reading ADC data on the PMK8550
and other PMICs on the system.

First, add the PMIC5 Gen3 macros to calculate the channel numbers which
is a combination of SPMI bus number and a constant for the sensor
type and configuration.

The macros definitions were taken out of [1] where it was initially
in the dt-bindings include directory but since those are not hardware
bindings but logical numbers, they can be moved to local includes
instead to make the DT source more readable.

[1] https://lore.kernel.org/all/20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com/

Finally add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Added note about nodes ordering in commit message
- Rebased on next
- Link to v2: https://patch.msgid.link/20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org

Changes in v2:
- Removed stray line from patch 2, added review tag
- Added missing header file
- Link to v1: https://patch.msgid.link/20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org

---
Neil Armstrong (6):
      arm64: dts: qcom: add PMIC5 Gen3 macros for channel numbers
      arm64: dts: qcom: pmk8550: add VADC node
      arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes

 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |  30 +++
 arch/arm64/boot/dts/qcom/qcom,adc5-gen3-channels.h |  88 +++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   |  46 ++++
 arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  |  85 +++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h |  22 ++
 arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  |  52 ++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            | 279 +++++++++++++++++++++
 10 files changed, 1439 insertions(+)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

