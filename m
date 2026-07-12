Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0F3148D8
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849461; cv=none; b=NyvA25NtV1qgQa+vAYivxWl0rJL/GH3Xo1/e42u+aKDcIUacoN/BOHxdeBnOwdQwZfrOKnX+e3t+12jXd8RxzLIMukQXOm7Y0BtfBKZc4BKYIFUzNZDweMLLKg/r2RS1wlh3LekZGbIUVl1BSbYLmm1o5YwXxCwl3rn/UYrAy0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849461; c=relaxed/simple;
	bh=QNw0DCiBD4kwG/HsRck40hRwum9n25JWMD4YFMUja84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RX0RXbm0dQ3q0rQnuxuZe4gS96rT6yHZkuI0PfV1M6usvYDzGdOd/SsQxyTp4Y0x44avj3eE+BnFn/HDuK8c6hwDzGqc2Qt1f6yY44wNNiXUBk4fesghW0kGQHyQT1F4qFMJJdk3XGpVs4JbWna5gcjJR4CO5l6svkga5dznrjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uo3IeuNZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uo3IeuNZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cca0c5799eso22351055ad.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849459; x=1784454259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=Uo3IeuNZzYs7U1amzITNw62DPlPdnQhJy/TjhFtyAZ3JsJQmDPJRf0dw5Hcdm0wq10
         5sFzJ8qFAPlr01xePg9bLHYnhy1pc4dwUidJnZ+kLZp6r96Vekwyn4o4+aOxRpK5ziyo
         ldjq7ENqK5qns9Yo5Fj+Hgtt4HZQYGq0XRMM4N2Gubj52vI8rjGdsuoMsFtF2/0t1+qh
         MpHeoiO2ptQuRu49OkSRVAI8Hbb3w5Ry46J8uP5wQkQdSR8DCRTZhDMIuqNYtEamkAvV
         sVSDzGq5XP48CVlW9P8yJZckNtRaI1k7KdnaRbQ7pZjjqdpewtoPVXvJ8c46SHbW+xhI
         l5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849459; x=1784454259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=GetiA9xEEYrfAV8wM3xdZPXZrPOodbXgjjzdcK2lAVqr6LFI/IUZfVDMSKtZTCv1IO
         jZjWz3bo1yPHkxTYpJrRjCIn5YULHLiABqVv2LRxg3fom1LidMSF8NUX2rgF8RCENqZ0
         fIF0S4FQabbZU6BkiryJZHVJul6bXlQWxo9vWphu2h0lCCgBfMtHALmjkQEqZQBdET5j
         CB1DY1duDdySwOBnRqWYJs0qqU9g7sC5dT/Ne6+f216U6OlA8Aomx+Vs9u7XmWChGh4W
         S+ExZHtZIydDSuTwFN+JDB/N15WbjxAxyaxhrIUGGk1RzPrJyBJ5guo8bLa4/RochsZw
         3WFw==
X-Forwarded-Encrypted: i=1; AHgh+RoS/22zrvF6aTvdr2bcfkaxs89w5o67WX8xw290pU0vz18B4MB1v7o8Tm6OfqSdSHdz5Fzfu5+rfatz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbeyo/zsdsIDJNCVGR33WOvIPKGttua6+mXf3nqrpckkVvq+li
	7SuEyPsHqK6P7kaZ2uqo/JVabJFzXEAoC051cIR/wBX2boWrckwEOw0B
X-Gm-Gg: AfdE7cknDDo3FEQcR4yVOB8kYs8o7uqn5jfALPqFJlN6B0JKaq9m/zo+lUpFD/700Ad
	UT08Pds6trU6MPS6qu4Gfo4SNS0pH06o1xxCzw1rrMWHlht7R3dzA/annexn8jMg+d4hLIOgDJm
	ZxtDRRU/GaFFkC61c7VfvlZ9ACtyjrLESJgjzFa3GYdj0YGQuuAL15HEuuT3QMZjnkSDmSDw+eT
	upD7MoKy9e9jq1tDurkPZJSAWOtfaLuG9aZ7x28Gc+7//5OVI7odhAESqeYbUSuyHSGYbQ3AH7E
	lNtEfZ3PnWXCy+xaAP+IkglLfQYehLkB+dFZG/yD/0Jd+NfmDjD5zft+IwInC7mNcd1iUkJanVS
	SPx0cFK5/6gQdNgdVFF3zfzZMzNt656EqZLea+sV6OlNAUE+Dq7XJEdazj4ehLpcYdo6rohahwV
	QoE5pA5hXfGaRorV2tU/nkWnr7OQMvTcUz/YpFUQkpO3ZJ318Fy+EAB0p+3MBfy7m2Mhegqmb8T
	ep9tpX4wqiJMXqo3Jt3LYdZGslPM+H7NQMpGY9FCIEtm/xf058vni3To5FmH37M7d1HXMuUfgU=
X-Received: by 2002:a05:6300:4046:b0:3c0:eeb7:28b with SMTP id adf61e73a8af0-3c1102d7fc8mr5637252637.8.1783849459284;
        Sun, 12 Jul 2026 02:44:19 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:21 +1000
Subject: [PATCH 02/12] arm64: dts: apple: t8103: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-2-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QNw0DCiBD4kwG/HsRck40hRwum9n25JWMD4YFMUja84=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU+kpm/iPhJ+TmVfwJXVy5fLFx3RnMWRwxWgKxxtc
 0tvkkN2x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKr/JjIytNxpWqy9rNHopoX1aanA3mATTo7UFVsvzjHr85LZaajxmZHhSGxx4SO
 1Y+5c/x41SRku75+8X223JFPvnbwmw72/TlrzAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index da774096b667..4d6a0411f086 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -918,6 +918,10 @@ smc_reboot: reboot {
 					"boot_error_count", "panic_count";
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			rtc {
 				compatible = "apple,smc-rtc";
 				nvmem-cells = <&rtc_offset>;

-- 
2.55.0

