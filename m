Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3004949EE
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017574; cv=none; b=l7T7rdEiXLGyYBJU/gw3+vWO3xthBaRvX1CdVeDpo4ZuAJ4ZFSytfJ8JXn6MX0EJIfdscbAx1t/r6F3vLn3kXLX3Tt3VSzEpXl4CAYGLbhKUEnsbEf72LNPyuk1+jGvT2wad6B0u4HJ8m9tos5bYub+hdem8dbBjQT9P2LbaqtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017574; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZ9lj9zDUxsaPf5OVK3sGuvFtS0CngcjhRqMhaDIjOB/kI80X7FkBzL7k3+4Enm1GVt+loX/lJc3jKEqZWfA9WyrL2RFEWsAwPCaqQ6PUpL6uMIzYt99sl7zinASJLqhQRINk9yggeouCMUZ5rUCM6/Gac47U0/RamXNosaQL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7j7QgO1; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7j7QgO1"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7b41fdf9de2so44371257b3.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017573; x=1778622373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=F7j7QgO1/ZEHRQ8j4k3h/vV1CZpw7eBseb/MmldYW9NO71jM8C/2bvp7ZGvgtWquc2
         yILCpuBnYk+/WriHnGqFKxSKCZqueKWh9M9ZQ0EpMN+ixnRPbZgWuuLFx/jm6/x0xcfR
         GdAojbjrJ7TCqEZrdLr+86nnka9Xjl3NYL2xxxHLWi/vyuZi95DZG+yCin2o1MPwL2/2
         3x5TP8QiUXFDR/kY1sNKo8/yERmAcnK4fZZxudXxb9eRJXnFJL7Jy+6sMfwpKjtJ9JoR
         SicpfEqKqcnUIodTBpYkilqg+AAJw05xoy4ThX7DEKypOWw5PmO1nupZvbv88754fuu2
         h6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017573; x=1778622373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=Xl2Kek7cEgevj1qberPAGnea6ylN8SOWMswQs5ZUUVfdGAW34ejM80iep+YHdRy90A
         Rpf+gdfN/3Gx68zQI7do0pKp0ssfrrN+K1MkGgyUp7Z0MhdGkd9Te1492phjb1AypI76
         1K+UVcnFDoJb5UhdFeM109BBGKnWaoTqYOVGE+5qCDqa4SMINupF58vrSBLZQuZbQS1u
         y3H/Jk0zQ905PKVSOV4ZoVTx5PEzuZ+vfBFxsPBpXWHsLolVet58RtfTCwVY/xluYeX5
         B4N7VWutTtrAjGbXdoH4yQUTrBid3Qq4jZpITf70A4IJizh/bLKiL4WbP6VcthPL402T
         dKSQ==
X-Forwarded-Encrypted: i=1; AFNElJ89yDaGVy3PgN2VIt/I8dUjOkclQwZjtpiod0Qb88G81ucS9uK0E0fxPwA0MKfwraXRWe9fLuDcI+MV@vger.kernel.org
X-Gm-Message-State: AOJu0YzPQPnT9wBbGP00LXxY+iOicQ6BmJST3pTNxLduWLCU4vzqpHQX
	1UtI3U4TK5UAvp9hgkbiWj9dkbE7+F+r+gtRz3F7GVFlS2q6p9+yJeaY
X-Gm-Gg: AeBDietGLjs6fyoue8XTMgUUdGM3ZcSxZ1VGhM1Z1aHjT7Br2vSnH6zhw3SKNXr0S2R
	vJrT3uqtpI/ruk3ea3zRiBvyMEbfFUIakNWy4VUPtbMjJuqoTXEde0FPkoLcJCdb0525fZw+oOW
	/SJSjwXABMGYU+bTNDj5EgtD5GTvOkVvHC7uvnROz24LDimbRplvVrRRybNKsESHqarmvh1TyQf
	QeF1TSdqrGuaNTe2B+TpIe8Ug1KuPXgc4qf4FJagc+iP49Q273KIH1YUeJ0RHJRSB+aSPWEod9W
	+injp55b1NKTsHYolcLIFsNT5ReYQYabh9nqwuXT7zR6zXnsH93u1JwFCznNkDu75SJAGuO+gMz
	KY8+/MvYKnBSkA4rN1fs9R7mdrzqMcjwiepfTHW1TaSVrim5Q/8Il3k+lYErTVfoDwmzV+hAL5c
	nnpEnZg2+ywjZ6Iu+rpMBPE6u4yL77e24/Pu92ck/QvSdjsBo=
X-Received: by 2002:a05:690c:c4f9:b0:7ba:f1a2:a448 with SMTP id 00721157ae682-7bdf5d7f239mr11612357b3.10.1778017572841;
        Tue, 05 May 2026 14:46:12 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:12 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:42 +0300
Subject: [PATCH v4 5/9] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-5-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
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

