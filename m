Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0A637C106
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406486; cv=none; b=YpypxKVdzDeu+vBOgGsLm7OnCyymXt2+Lf4vDGZcnAPiTmb43wHsIWZjgJ0zaf15wpP3mxL/StWHza5hwzMCMn/v+nwjHpkgaJ1b+lwOuia6JJQcHhiA2/+/WZ2lfeKZlMHXoZss70CWjfjHuqIaz6MNOnBmFuvNE00Av6SZnzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406486; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=of/1zHTIuTB71EhrNtdYA4eDyskZ3Qqi0s+AXUZPAX+APLNzB0BOIIGVV0ofxWmANIgx09WuTB4G4cgSnWHKF/PA+dPkpSlXIkowfFzHmE9Qk2b/QokmnEpFTQDWk1w/EvkbXZuufNZ+prP8doA+2qODGGoxtWHRdytljp+EEII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF3LGAsf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF3LGAsf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44e5624c053so1866522f8f.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406483; x=1779011283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=lF3LGAsfl80ehNtg8BrBQyE0KVsNSI9Z/gl1Fc55p7oeMbSvG7MvTEZfywMwlP98wc
         FKGQD87SwGe9PnDexx9bq1fwdB4ZOgQzlmxSuuNrCrNxXrzzhioTMcG5sI9utieidbNO
         ss0oC4fN+NeIgFbf9v7SWFE4djnnpQd6JMUIlF7G1h3qKS5pwBJgX4pi0MNHY1o1C3Au
         nfSywopPsUmVdmJ6TUslR2FwMfEQtMmyAh936QAm63muvTU8rIVvc2FgXxjcgUFaL45P
         94eJEIApjJncidadAPJWHGU8AKwL1FfNPbn8yq6mwweQ1fEwH4pP8L/Bp06e686fp+UJ
         BbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406483; x=1779011283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=qGnC7bbfRm3tMi/pfPIj2H4p8eoVqF9m7Fzd6xEQYABYHIhPrN2rUGMXrV7IFGSsdK
         QBPITK+TDsYK8aM4Y3BN2ersy3MfYGYqTtyAa6friJBN0xvKOCmz6gZWf/GSWlIMWl4j
         mwORRdxatnhpRfp42fCG7PljJUzFTUJ0+SKIdEOUv3JR1nuKZzIQcbo7jI+6ouVh5MiE
         63y0cwnqltyW3hTpCgrhlBdBPQ8ZNJ6vlfvtHrmQFZobfG6Ba8ttbPHOaAOK6tHIL946
         uT3OawJjzKx4XoNdmCxMOtQPK702M9nTCUc++K5YIYtOlqw6T5doGW1fpaRpFZtdDv7j
         tuEA==
X-Forwarded-Encrypted: i=1; AFNElJ8/4j+UZi1boQfobYFFmB7GDuztNnFhZFpRZKCqXP6vHzTjtmxnfwvpRHB+HIDZEwjqTDAU9AeMOJHu@vger.kernel.org
X-Gm-Message-State: AOJu0YwzPJI2KnTy66guIxX8JLfE7rW+LbcVD2se3sEizeNsDlZiMPbI
	5hEXQpo2pLd5RN5HedLW+nK41zS+aV28QxprGWq6hDyGMGll3ZaLyycE
X-Gm-Gg: Acq92OGYlL9WC0u3p6tTYOm8qTbBQ2BuVvIsHQQHeF1NrcrTF2KUxeoCNCY1ah0c8JS
	zN8QKwvK6Fxosr56+UwJH0a5TV5UX98KZtT3OPj+61fa0l4X0+nq9EzPyHzITEdIq07CLrK8/W+
	39y/1nzSI++YAh/+BzDZGh1kXHnuj9RQtuB2C3n22vRwW1xaoFxHZgmm26yoWQTwEwxpsXP+Hlq
	XuK1AEMmIDL/k3AdYmH6wRlwESlxS+CiKejEqQomDN5b7a4fXuCZjv19GwqlrcHvHv/dFmMgkAQ
	ldEZTlu+3fHaTXTPWw1QH72BhhCvbKQKr/kAZlCLvZCheprHRbfJ0DsZQHskvAtoAkId5dYrvHR
	r6lPIxFkkJ5+CMilAL9AYfvdudIGqGCk5/wsvbqxKn4z7AY9EPRZZMIx37j/6nuwqIH2f7rfB5s
	s0q/hxUqSPI5RId4q+KusT46VX2gvX0PbHj2zQa4E=
X-Received: by 2002:a05:600c:8485:b0:48d:5c1:bc47 with SMTP id 5b1f17b1804b1-48e51f32a6fmr330837045e9.15.1778406483419;
        Sun, 10 May 2026 02:48:03 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:42 +0300
Subject: [PATCH v6 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-4-e69465375900@gmail.com>
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

