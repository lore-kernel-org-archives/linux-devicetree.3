Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E43EC2FA
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312747; cv=none; b=ajkYov+rCLSUvYOU8acS0Kvd7ccBwzpsgld3JUV49nkegvDpZ9qUmfYfH4uD9DQVSaDd34db7kcnOiUJRtyBDJOkrnTTZF1b1XuRjoaiCSV+KRzyrci1M5Vzlbbdd1pZVGuLro4lxHdAauND6SNUViVHlPi45yZ4vyB1o3CYUfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312747; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2QEz91NkgFR70RLd8NzgpijL4Mc2BmzRVTZBfsiGTtO60x5vVIUy7CvFk/W0bfhABfG5SuKSIWdLOJ1PRgbCRTwm3iVycFvg89LZPDhWq693KAJg3ZdxvLeKL8RqmkTpwkAt+8kxqZgb/5stN8QpL3hKpE5HoJLKahlcR2uAeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Y3Upzr; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Y3Upzr"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7986e0553bdso98563367b3.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312744; x=1777917544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=S5Y3UpzrB0uu+Vxo0VIJkGdyxrv0+IBWysjGpqplCcAeeJUEBXRQG+pMY9+C4d6Vke
         MrZF7mGMt0BRdpg11j+MZumZK8vwen3dHp6UwSh9Fqayjf4/Jk5fyinCIYp1RnWIH7LX
         uFkzlDR8EvbADRstKh3nHwh53oD+7vYTCT6BkbW2EusvOGWGDuYMo/ZEwr38NfP1lyUD
         fExvXSEZxk8e+jpDbiAFXaX3RaS6ogLgQLwHqwK4J9qf95BCMeErZvWyocGZUQm2BG7p
         jWZPv54DV8sqO3d9xRVNQUMJpg4MzHCQgPnabB6V0RwMal8hILf8gY0gzoCXsP2X/lbV
         BCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312744; x=1777917544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=nahJ9f1jN/XnX8NliB4uppRIj8tnp0gK2vziAhbA55GQGwVlVDoeIexbasjsi0nYbr
         m5cBFoFliuQGAVURLS511TBS9gSDNf0DGpIEfAlJv1h5PpOuTqOm4H6G4o1Mypsg0yMv
         2F/JtlDhn0qhP+SP8NX8guLWY7XIujNeGtIVEADKJ68niRjEgXHP969G/nVEqymLsBo6
         qMpZwtSu3MnT/mKgErrWVSWyuqoZbziW6KGEDrKOtwiL3T210AKgmnxm6Z6Sz/hFJXgj
         ticPQ6jOjkFmBnCtIWeh7V0HiZFhoQrCfu3gZ4E/H0aayvU89xHjUU4zlO+gX5ZQ9+6K
         NV7w==
X-Forwarded-Encrypted: i=1; AFNElJ9oX6Zv7P4aa4ACKnFg4GgRC+MKW8SWEi9Hx0HNJ5CyyM8sjNsSog7xjhkrkRTTJRE3erdirhuca7rp@vger.kernel.org
X-Gm-Message-State: AOJu0YwHv4y3X2sCVhJyLu9RmQylNPHJxOrQkMzOLz3icB1oYlM2qdRP
	t5cWhncf3lKCCSf2Y59KSHWb4OnTfZUw2zlpPgd928ALY07xPKG4lMYp
X-Gm-Gg: AeBDieuLBuYT8mahkTJW4e/s3aJ4q6FtHPS/ODeMIP45sFjWJMig6EGYA+wLqthFDot
	xKMsyunlj5W4Xh/Ax+4GxvYmmgM6pNMf6LSai2sV5oYHIjPQ48qFbj5mLaBFPNalr9O5eW/vo9a
	pqIvkfGPZ/Fpb+6SMlTDhNXpR9K7FQ6TGnUajPhGjwJsTklwJXRl9XH1TYg5j9XgrhEwI367ASA
	gFIhXjhpOYil3NHVJAz8isOEexCOuA98X7axVelpakU04oebLc2QNFxc+9Fqufsp7MAzHnheXdm
	5+oashjJ9lIxjmR0chq7jLn0am2znjupgyBestkkCsXYX9NIQ6vTYU0s5XNTqIKVqTIYJ7uoN+a
	ykQ+ReaYTtN37T94/hKs0uOuO9h2QbWw3Q/nN+9xcI8VGcnu6Zj9S+OY2s5Ja1p4VyYbP4v+Xkw
	qf9FcySjW1+l5+ivwr/nTfcrf/iLPQvtpdLkyPh03nnN86DbE=
X-Received: by 2002:a05:690c:6811:b0:79a:60f6:c5ed with SMTP id 00721157ae682-7bced8dc69amr3564447b3.6.1777312744138;
        Mon, 27 Apr 2026 10:59:04 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:27 +0300
Subject: [PATCH RFC v3 05/11] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-5-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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

