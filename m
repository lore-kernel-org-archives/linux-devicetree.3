Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FF137C93D
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406488; cv=none; b=TrmEv8dvJyO0mbSiF6FXYUT9KdnRdGd54XUMW7f1Lzy1LE7acNZBScqPNJRdaqaOEF89vZRJCV0J17gBH7yYIFx2ivzYwpEZGe9VyEVn1KQmBxjrICdNPFIVT8BoBng3lc1CQtkAe+rbqvVgc9FLoz9pVFdAHsYn065HohEIAMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406488; c=relaxed/simple;
	bh=LVWWWUYdv9PCfUhr1DTi4tk8Hze1kjyRj4+I8oegEow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0AXJtZGK/UfqzQLMWI2bJVnNTr5SkQp3PgVl7PBGEQFLdak4wicIxZb0VpauMssTnHxzy7eCT2wgELUtTy5kgoGyD+jKQCEepfEzraGy/BY9K5Zos4KHa0zP9nW8vWlATFuTbZaVss2/vgq4G1Eldt4BxtAl2z0mlPaX7BjTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKvODCBM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKvODCBM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891f625344so32553805e9.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406485; x=1779011285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgYHSDLzlb7ot3DGMDiEetIcL4BenND3LUUZjAQekh8=;
        b=RKvODCBMXGHFhmD+8r3Nqe0oYd2nUXpE3d7VKaUzaj9Bla3JjpSb90JCwiz9ASi50Q
         Smhy3PQ9U6t3WSsF3BtGjAMHkmkAl1ZmCAW5U9T/qhigXX0qym9bsOLR1X5mMCL5p00+
         6OVrDcHWOgw6L2Hr8eCa624MwnriX8hH2T3e7zeRsfkHANW3Y8maceDumTCd1kiYk6Ht
         ig90YfLXoT/qTRt7/1aw9AoQvD5V35xxnOWDfuLD/k6sv/skdG+ArFpNfQEh5t+lx2Wh
         +/WB6/MxKSvzCz4680wdVnZeT+jVJkLfYKWOLu92HULup4Z0tlmoha+umPFXK4xTCZln
         V/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406485; x=1779011285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgYHSDLzlb7ot3DGMDiEetIcL4BenND3LUUZjAQekh8=;
        b=lOYmdcD/u74+mfBOox7KzUuB+aBnFlzXsQy6V0kRebebpNB5OzcKrVjkXd0urPL4Qu
         OzsF9LRGnwKYVVD6tpt/oWi7ts2zJXqLrMsXMKwBySLK0gMLClnVWAi+/zkWFwGDK5Rz
         PSIZNpMv+MGoWTnaJmwfzD09pwErgsOiwxpon+yvLj0Qq5UWqSlTtQuOEab5os/gV4CW
         dF6G+/ePEjns+T9jIde6XILas0SR0SsglHfdJQHFisr+5QHELYj6zUszZscX78bO8pTJ
         G7g++9pmzlh1LisOpahx6uXssHsjzYb31MdY+tVI17ujyWstfGq2ht9i7w7FZF0Y1rHL
         JBeg==
X-Forwarded-Encrypted: i=1; AFNElJ/bKo7/RLWvh1ULxvK62hmm0oSzRMceS9qHFJywv+UEzQzqQZkegoeF64Az5kSFVOHuM6Eu5bNHZK9A@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0chruhJmD+K/+ib5bahUU89dXk1wTBNSMqxY0TiOj+ONR+EUm
	YAn1kbehgGM+V1EqV1+X5UDj0NlaD1P31LrK57IYWbhiF4E2SxxQLYVi
X-Gm-Gg: Acq92OEAHx2NzGfLwafyzA5h8lUcyIrZ5V4vTvZwEt6/5639PcUfT5MruZds9fKkZec
	zlSGjKO2K5A5u7wUuQ7xWvhH39NFUtzx7DkmC2vAqzE7TSvrT/umV6xTTdPF3GQHdqowQs+6Qwo
	WiGQAY0teyXxo7ISqiFBVa2OWkKu5FP4Q0XCI26Om6ZnEMtegLuLMRh80cvmT0DkPm6BKOa0FFy
	iwq57qwFZeFJD7IWzdU6Zay7GUaPd1kLrMBzr6O4v5VWjaQxeLvBPDVPaYLV1BgPZ4YymndOqJX
	uncYbT6VD90MGV3UVvy8e2ELBFXFJ7Iq+9pFT7hJtC7aBBHJgvrFYswZlRFwkMBSGxpCDq0MxBd
	sjerHLzYV+f8W2lEgBdmDop+pvA0kOV51vB9OQqfex7NZHmttTbt10PfJ2sarEPTVtK9f/hU8uZ
	B4KHG7ezPmpHevI00YahGPgv3hWxHl
X-Received: by 2002:a05:600c:3b8f:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48e642deefamr174341785e9.7.1778406485414;
        Sun, 10 May 2026 02:48:05 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:05 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:43 +0300
Subject: [PATCH v6 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to pass their control to hardware.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are set to be hardware controlled, they can be switched
off at any moment. Vote for the Venus core clock to enable it later when
GDSCs get turned on.

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

