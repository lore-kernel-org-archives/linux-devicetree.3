Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0876377579
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141897; cv=none; b=Lcosl9oRXsEDzgocyPWoc2B/cizIzVhUAMX/zGhXkWHCcc6xV1j6tXSIzFozYrqMrGeBEt3vYnzYv5InJpZp4heTnMFjssje/WrIbI8g5O7d06yJOQYZs+cntbpgI8CW/oyEDSXFI8WyR4vPtEBLBllH1a2bptU75X9g9TizwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141897; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJInO/b03WQaYAQ96gsJUcw9NQzZA1C8VWxpaPx0RsBQ85TNAseaNobVy02RMFW1KHxsQWpsUv7hX7ZjS3qoxRazGlqSH+p2W+X19atNEmnQZvgqbPD7/gly8vDeIwtNMATUHH1MNPj2ycx9hTCIk/cQ7RCAi8mtmsWrvTWfnDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrF3ZFKe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrF3ZFKe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so111095735e9.2
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141891; x=1777746691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=KrF3ZFKe9Um4Y3L4wnLDRe9n+wB8r67xgvFCC4NiAHHcFkHppT/aic0emKbhfjOr52
         iH09DmjVUvThCR3+G73rNsinQoTR8qrW3SormLF892Hi+xu4ryjXo6V5GavbTX5l8eXu
         BVSO/B+w0fOjFEUUlRHvSfB7FDw7rF6O42q+tXfVygchbQsG4y/Kc3SSsdQgN34OOftE
         mGq7AXjjIoBSfdivAtVSkAHVEqDY8wVr5laeU0iu2JZ4Wxg/EG3Lhz1DeIzPlHpW12OQ
         uMHldYFtefdqF5C4p3baji89Ri2qjAn3jL6oHekijl8ijqPNPG7jGy8gYJ8ImbxQ9qlC
         gHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141891; x=1777746691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=dJjPMQENAZfIqVghqI2vs28b/Hwxum7AITzOxaD7XGUbCwtSY0aAsK2ZW20lM2d1Tz
         nTXV+w2AVS/IuHW6tbwgFEoecotn/ovj2sbLvDuheX/Q31ubPw5dKuL8SS1+eiEdO08Q
         ZDyHcuax+zCh3wLfcSkk4fS63+TSLWcXf8X5Njv0asJInvHCaQY0jy6rf+V35rvkcazp
         zIINKn1BxjGC9eccbyDUTwsK1B+CJqFS3/A6/vuFuS78t3UA3akwHV1TJcmQ5IW9f7Z/
         iR1oKoDI80Hb3OEpz40BHTuId1lQK6qVsd22czsjssE8R0HK4hCxZULGrYir+lmVmNsD
         GY3A==
X-Forwarded-Encrypted: i=1; AFNElJ/I+2IKT1C7aFQmieqeV7RtNqaEU5+gSSxyVpwpkpod4CDlYj6vPnUR2zmzdWAO2q8apKP402XgYDW6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzeq6e+ozgFpPESOiXOY+/aMY6RIap7b4q+kkio5NU7GjUCZv50
	jYs4NtjV9bT8MnRkEneEnEvlSKdcBSGttXvzxa/pK2mIPWUglaEp7qJm
X-Gm-Gg: AeBDiesHunWYmczaUTBf7lUiShaRoXHQqOOETOueCrcJdKUAzDoKB9bbkTIQWSHKtrp
	xZ/xMQRmDwvPzL/AA2a+TishGlQss6DFgbE84OT7fRsGd2Qi/IxFuAGI4Q8rHIhq8oQWzl4RlSL
	0Wk8tttp1aWeRI7SFea5QVwR5D0hOdbr/rOx1cltyE/elfE4WFoKafryOzqYHtrz5+JpMq+z1hU
	SnGwV0sRzl4r9mBA3UjFkYfBzXwLca1r5nMWxFmZWC2e7rYb+fxtA+ASehlJIYFWyNkpI3oBpZc
	d1MUjXig+FRh3AWf0HbF5nVX2/t3ZqRjtn+ljOkhVr9n87SIDeAJzjlwJkJlbH7iBhIoWeusBAm
	Vffin3H8ttrp7wto0wemRaNCLGqXpMsPvrD55lIAK6PqHji8a9ZF7qcKJFgu5f8EHzOrnOiPhqP
	YzsalxdpnaKbyhI0f3/MwgDJXvk+Xf10Y54Zqsy0LAOmhGtQ==
X-Received: by 2002:a05:600c:1da1:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-488fb785204mr579670405e9.22.1777141891411;
        Sat, 25 Apr 2026 11:31:31 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:31 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:08 +0300
Subject: [PATCH RFC v2 07/11] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-7-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to indicate that they are hardware controlled.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are hardware controlled, they can be switched off at
any moment. Vote for the Venus core clock to enable it later when GDSCs
get turned on.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..420997b00ae0 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

