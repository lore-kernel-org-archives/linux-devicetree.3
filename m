Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336DA3AEF43
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707571; cv=none; b=BltIn2U8tohRLVsdyDorXgKSNCAuCF2QWQEkk62c3FxKPl7YRlRzvUiXUbgNpkGobSWPpPAfhjkN9Gp/gdu6yyeUeyXZvh8IY8SE+SLRrqMDIuyxMTuLvFzKDUr1g/IJJS4bptSQTPnQOVAuoKKCEJHUMzYhJCg4qthi6u0sd5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707571; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XDjo4SIR/EVSvoGGx6NTBK05aBrN2o7DkICRBo7B1OL616edKsXiwTJsRlVyn6Zl8rOp7c22wFCzTCU5ZjTpXc/mxUJyYHIU5EFRzjWDyBsl2cecAG0PH8oqoAwvzH7IPT/SRxRreRV0ZcpiPDMyXzF3XwDSbibWyVPCPE0N84Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bk2hkMP5; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bk2hkMP5"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65c477a3278so7781084d50.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707569; x=1779312369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=Bk2hkMP51hTvcdmjJNnoSdKsNDIVFyB+0xysXJ3qqzUJrl4vwrMgLGnNHDZEQQIA7Y
         R/Gq3dZVw0UtW9Yfzr0m5OwnHpaO8sNmNcdH2HqggeyJqwI6cRcbhDCCG43qDbSA1KuS
         OSCVx6NFXwzO3joUT6v6xxkubxiJCTmsEWUNSScdq5v4OQAmkC2CX73ryLjiSW+QVTRH
         5CGKHb0gFoSXrUXmIKpwRHlS2W/dM+4QMLUfYj9Lp8cUiXo14gGimHe+LC7r9GtOfFwp
         2UqKiY1by/4uqMIh7/hT4+2yv7InkcDDNqXDQpfj0tg7T47Gq3wVS5LTjcH5fkUoOplq
         CtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707569; x=1779312369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=MmsX1ILcSL6JyXPVkZIA01BHB834MSxW/HRTEOWfJp4UMY67bIiAbkAIS6amLUdYyz
         u6L9MZBvq4Cm0osut0nx6S4fM2QIPPlY050s/pkCOptCD5vq5cxlkJqyZfvsyc1RJpfp
         th5tawVRWImL5W1AQV+5l/PUHbABmJWOB2sWMHBRUlrPMDIRiO4fyX/8RxJtibD9V+sM
         9pxSlsWGcYqChcFPj/tRHe9cJMWoOvEK4MLnl/ofNLx94DTNAslyF9p2gElknSZ0QAkI
         CWCUiL53qsZvwP0YB4nD7MiiOyVydMjMTlP6z0iSMlhywAdrPs0jgj35u8fSd6/M2uab
         RNaw==
X-Forwarded-Encrypted: i=1; AFNElJ//30nXjjY0P43DOJGMkk74ZjE48TGsaUeyS6EZYWfF3SEUbuu+ShF7FwbEGzAhajE0VpnGNxlY+/Sf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc+fyijwwbrLqE0dOFGEgSU99S4L0p9shH9lkWALFvmU1/kFtB
	/2zEKmZH3dZyXpfUeh8eMymGrvDAvaShT6WDOrkcVxfJw0UAz0Relprs
X-Gm-Gg: Acq92OE+3T7ARxm+cfObLt5+PAvLLjtfZkqjBD1GeheZqqoeiITCNWz9eV2waAt6KwS
	/GeUzMgg5Jin/PduMPXFX4nIktuomExgsBK9yfUwTQ6eCjlOtV0mO5jNCQxiaD/eu7IL4bxQyxV
	ZFa6ZmyjWliH0GioZtUymUodhJMmgSjv00jFsVxtzdIPj4JkVfcTh2yG1w1WmXuItVudoILFz9O
	CCt5UVm+B5rQOVX+I2nvjHNm6vU1CQ43CCcgkdCimu4UWNfGpQIp7r9qH+jsUE8qDyJ/0kb+4UA
	mU/7vfP5lHAkobJnPJnHb14FvA/ywc/qp88c+XswJJM/ZmWtXlgoS7TCE6Ae7CwyShpvXdIAw73
	Rm5tbmSJUS8xY5Qd6DNFz2MMf7aaP7CZeII3wpbTMF59k29N4yO5r78bZ0CgIe0xdgp6qFQ7fTE
	twbbTO6H9FSnmIYKLnhPawDajtYA==
X-Received: by 2002:a05:690c:4d44:b0:7bd:4792:66ef with SMTP id 00721157ae682-7c6dc7b21b1mr47195157b3.42.1778707564477;
        Wed, 13 May 2026 14:26:04 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:33 +0300
Subject: [PATCH v7 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-4-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

