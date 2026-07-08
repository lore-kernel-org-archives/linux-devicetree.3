Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069FB36920F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471478; cv=none; b=McigcIdLWUsIX4KogJLuFDNcfv4I2x9Z37otmvNymptS3ZlSpLLQViWWHkoHdqCm6wgUvTJ/SZmlCsMQL8h+HIs7DpFfOVZpvWwHqzTa8cSt5VY+lFY+h7rX8pCatV0zxo8VR1XS6IbWLukQAJboW//5p5C9bKv+4sEVE4WqeeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471478; c=relaxed/simple;
	bh=vdMO2bij25OZMP/+jJFEuuBAKY0nW61xjdZk+CClQNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gldrb/NBq8Wb4jhesUlWX8zmrj9KoR4MvK7IKFXHENKbHQ4RiASGuvIUISDdyYWCP+qJuOiiQQhfoo+l9YT1HWyxOTzhiso50A3SY8R3n6vDzgwoI5Fcn8EIyKNCrKw6Cgn9zUUi30aQ0e2hI2ojvuUIYE1ekZik8jPvTR8GxvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ilPILnum; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ilPILnum"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so846835e9.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471473; x=1784076273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khuu7l21cTksIznMcGTKRQutyVohHcaVXCNI1OjgwRY=;
        b=ilPILnumUezIjUuZn25mYacXQLnpPt1qtnM2HAn/urK8mzN0TN4cOFRzZW2XpZOQYf
         /M1FJ7psJCWK8nssA966Nx0/PaLzEtex9Hf4NTpya99n3CBZeJR88TegHY9fF8gSOZ9q
         Xl+4IYOSAWxgJfs0Me7hIlAMrQpKROZyRHxEaXGaJF0yHwGmXTXJsMLcLLVFg9CxMNRV
         lHt6No6UA5EUuxiK8gLPvMGr03Mmb3opbqwWYBU+iwhoGJyfrR8DBbA/m54LrHl5mnv2
         PR9gWQu5IhD1X01RoA3Xf5uCD7XqXaTG/LwhBNJILOpCGIBvYgv2d0IoxGuwxMyJBf8W
         cZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471473; x=1784076273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khuu7l21cTksIznMcGTKRQutyVohHcaVXCNI1OjgwRY=;
        b=SZqAim5L57jmZokcGuyoc1bGXKjxqHIyloTYplL5dyermpEOJfCycksRZBQpf+WZQJ
         XbqhjTUYGIv4fKVNSZ1Fpvu5k+jBTfNZAxdJctqMz+GK+9h1SvM21hdrgtd7sUCZqZRY
         4xIU0kATXdXpsZQZTP7K+2aZ9Krsy/Int4yykh3QGVWvjK/hd78+bwTISjSLDgNRyXgA
         Zr99+BPvpMYSaqDj6duOkwe9EJ/OjiTl91yIavKA9LSj1XjlkiHTNTXTL/Ybog868hjb
         uwq43DukPqyX7V59kenxPHGWZ6evqTR9LIbrQ0Q0rjXXKIODI+5GBz6/5cW/k+LLtQgO
         2Bsw==
X-Forwarded-Encrypted: i=1; AHgh+RoviOXSg8FEygRdddzV20pw08NN+KggXPBcpSCN/1eLNYFRtUpKXk73MiIne4pIXc87NX8FEBzrkvDh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw50vAEj4VMNPvqR5MB6jokgjOUl6AjTyN5xDMZ7or8u3EUpLS
	kxbkcfuMHtFyNdgpjV+Nfkhume6S4tIeP+LHz0qEXORTAayrpzYudXXmKcsFsTQ7vWg=
X-Gm-Gg: AfdE7cnRz0PNhL6Zqjecv/NPKFDW2Qmp5jSQLclCgIrJV0Y6nfAosMiqfTcglm8u0k0
	ItnqUlLlDFXwH2gQ4gkDFgEOAjNh8DrRCm51FTzE5L2jT/XbdHZSJdGe3JOhDbxcdkpWxFMcfRI
	eg+4NCb+YR9bJ1rn+UslkjM1KVeHlKPwSLRTTi5C3KfyM29gdYkqCWEpAAjUEtd8Ydk8M7BITRt
	6sU+H7QEXldnmwuDTI+kB6SB4i0YpLNLL8fC5TRVgRFe6Pz7Y0xzO27wC2XVJwjMmBtAwuggU3s
	Nz5qyvMvQ7YtJJACVOU7Q0CsxPDCtnU4Sah+xbJxwJkYCWxbrWM7ePVjcuQen+ZJBOG9pqrtokz
	vfhSS/dGqTyYr45wqcCiVvXq3Mql/SLoWNrcIA7BcWN73fv1Qc7liLa7OocI0GC0OD7X2FohcWp
	XNwBy4gSz18l61wLRvdbiqOuA=
X-Received: by 2002:a05:600c:4e0d:b0:493:c59c:94f1 with SMTP id 5b1f17b1804b1-493e68b7f6fmr1685765e9.2.1783471473466;
        Tue, 07 Jul 2026 17:44:33 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:32 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:16 +0100
Subject: [PATCH v4 09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-9-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=vdMO2bij25OZMP/+jJFEuuBAKY0nW61xjdZk+CClQNQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1e794jOj8RlJ8ylSjyTkdXdKuED8p5M+IL3
 a6OpYDyXuOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXgAKCRAicTuzoY3I
 On59D/9pWTE8N6jsXu64S2h4QdUuNDmCfUvkqSb8Ls5SZQnDjh2LBShxPb0wMCVvjwSf/kDV0x2
 kmpK8xv6lz2rGwFw/dm+LK9G/gvox+qCSz3NobalrO0H4t4NzGU7zDf7s+0nAUin62Kppn8SPLV
 57wNTMiNdCsnRyhIcD5BEq11nMF2+tYjeQ8pMX1rDR8J6J785rek85Nx+ieX2N2Ag9ukazUlRTX
 wtONemYezlVEfNAqu2FMvvVHlRnofp6grxMXOdSs8whpPsLs1FDvrrOsOyV8ba++L5pybEqqLH3
 GY+dACR0J9K0gamR3TXcoK8NwwAuiLKpwdZZWuNjXJZlv+NNkVNZCW3xhkAEYj+4uylqhhgAd+9
 di6XYegZzK2mdrjPRyuZEjkvjHYjE9UCvCo/pqjNvNba1cAlDgqDr6A17REfSXMsD0krARtiPps
 xKbetGOhnlZENxr9LbVNc7piy0ZAaqs2Pu3OaUQu/F0iPiUbSBDPRrzc0FpgYY4nvTeDWEX6b83
 qIgsArtU/NzhyhX6wwSBVRj+QcsKFsCo2QbCSfjSxA7WU3CDblN0tpc/rVRvoQl4FP8gPN4WGMN
 Nnj6yrsulzYfy4iE46EK0F66msiLm/+DlYV9NkCje+hLXiiF3a8wds4ga7poeVpmdlMoa5cnue3
 3swezsOmhV8OKoQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
tables for this part shows we need l7b_2p8 for the avdd supply.

Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 0a8275d501f85..bcf3e2f610e66 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -552,6 +552,13 @@ vreg_l2b_3p0: ldo2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;

-- 
2.54.0

