Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6673C3456
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776713220; cv=none; b=K40CwaidDlpnqyKfqffMoPM2keYSXQM4Z90sAIFDkN7LtcnbqbfuHlxJCiAT0f6KviNSqrghgj5jhsKrz3wqe8ENp3rxHhG4bpaGkTy0pP/R9fO+4TbOJs/ArlKZwb0hWhXMyLSbxYnmn1Lm7dKyk/HG3jZNAaIk9LTr+H8SMXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776713220; c=relaxed/simple;
	bh=+qtKvBDAkMqbgXqc7T7YdD3JOpfzOdaRXujJjb3n4zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDp1xJRgkmqWGFjVnFn1n9fvCBO4cr4vNI2xEBS1ePEsW8plG0V+sqyPrWFGzH6RtEP93gOJMlmOCoACBvQ3ByVirLpCnS8CvsWFX4iylmK7ZPPfWP8MgKxh95ekS+gOqocS4hM+HFHxqI6+nrd+ptGBLI1h8/wjq59BSZK6ewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tTtahd84; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tTtahd84"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso12353255e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776713217; x=1777318017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFrB5VArQYae2VnkFo7wFR9PaBq4FSF4lzLh6V32m3A=;
        b=tTtahd84D6noqUbDQObRLm7RRPjTU9F8bRfm1pdjnptHg0XywziHLra1wohXm4bxBw
         d1N9nakG2gklO+0xBqLLr/WGGMv4ZmAcFNh0pxH9PmFhpuyi2pEQTdywZmwvxDvvFkrP
         fnrwjP55rHHvb/fEUoeIm6HqmzNwl3SyhctuZf5RLIDBM/8quU889YyuTgBS4hYONH3W
         qMEsUH6zfqYc8cYz5lJJO9kyzPJhhEFAWeYE/1B8uPMAFZ12AdJW/kK00hpbbc71RNH0
         M1P1jgU9RViqdBE5KQbAEbsQblzagNXY7JjVsqykKyZdmjwMVFLX30MidZzn2qiUMbuo
         FGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776713217; x=1777318017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eFrB5VArQYae2VnkFo7wFR9PaBq4FSF4lzLh6V32m3A=;
        b=Kspcx3Pi2sEroYzerpo1jC43ImI/TBAJTqguOIVsemLBf0zH4UY243bpy2T3eyiCD2
         kMZDHhyAr9rz3yq4TpZwrmJs6qwsWUUNBzAebC0yN/q1syjquM3VPi5SA0ksad+53M87
         QQbxrJ8m8tDQAwY1SoiQ5+hHOaqwphKAqj99D88025JOyOJHnd2dhUsZBg2SeUlj+f74
         fYc1A7ASvHGS1LBSznMbN5zkf6fuf1U50bsYvkXD7dMjXd2hnr9fLUjzCdeOTo2Le8i/
         3+7Po8MdjZ8q3v06eNf7N4raitUJIhnk3DyrYgE5HATlJ6C6FrNxjo92OplQIHBdIcFo
         wmYw==
X-Forwarded-Encrypted: i=1; AFNElJ/EgVKjy5GoP0Oe7VOMr5ovjAkPA6DnlW8+eGZfKqqUlnLzxOsrgdvIH3A0O4DnS5BYolJPm+ucCogq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7qvLrCQEFLpPsdo9Y5NSJREtdXunCsEVBfgdcYHMJRo+Ty8GG
	t1X8wTdF1eCrnZuQiKBNiUxt3/ImHDT11Xz3WfBQLPDtnA5h7wEV2cg07Zw4BpH3pq4=
X-Gm-Gg: AeBDieuVo8+c0sC3b7RPCo1kq8/oq8zy/uvbbs8CWq+fnI01oOIf42vS6xIfnt+qeYl
	DgwhSEWTt/lxd48ujU9Fhh8jxcVttYf5OMu3nh7NG1zbnZLIZFPoc0kAYpDuzuX2jQBkoeTumiV
	61KRTwsUCfPJTt2HGaA8slL6gCjLxuZoxAYJ2gsrU9KBMfoBVIqNwohSFeSNUY5BlW4O891BLKr
	Aq5wPFpokktKCiBoM6Un13nGqQa7B6OeLuCigcfV/ZKwywnxSpyMAuSbNNsYAWni+UuxdIF6FQl
	VQT30qG5ikwhpfy3HJ5TIlYT5eGGkOINbEcF40NIXF18Lz9Xv+n06CgtxzHjGq+YofHnaqdmeok
	VZeuvwGZ4FHFsgrmwvo2Lv6m2OJagu4kjzWvfV4LQ0J5xpJIrugqO2VF4lwc4UQvI8YlLQ52L8W
	EkVZ99eQa4K9aqRRJIXzAPUSwdbwZokC9329GTa2nwyWZwIXm6eDPk57A=
X-Received: by 2002:a05:600c:6286:b0:485:3f1c:d8a1 with SMTP id 5b1f17b1804b1-488fb74a677mr217645405e9.9.1776713216980;
        Mon, 20 Apr 2026 12:26:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78d1bcsm133524515e9.5.2026.04.20.12.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 12:26:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 20 Apr 2026 21:26:53 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8650: fix soundwire ports
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-sm8650-upstream-cpu-props-v2-3-689e07d8ab8c@linaro.org>
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4260;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+qtKvBDAkMqbgXqc7T7YdD3JOpfzOdaRXujJjb3n4zc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp5n39IEyi7kb6DOf2khjlgzAwqI8iJ6RsnDZUQcNW
 4xPbDE+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeZ9/QAKCRB33NvayMhJ0YgoD/
 4vkWgc4YeQBaz7JVYgaTzn1rKixBaW9Yvzp4rhcFJu/3Tpv90uJgobaCi8QNiWAQhQ4gb4Q/Z3xkQf
 v9iY3JMcMecrQJRWiDUThZpK9Nloma58+ieVUIqNtvTqyU0OuKmpEkaqXfHewEkIUVnVxsXWdkbo84
 ZX1t2fQFRf4CxaTZRrj7mjN/MT04E7vjGvG4PfnKLrMqh6N+0FicPonhoXfBdwvWH97ZTE50zgKGzI
 20f4ci1PfYY8rTuGlx9puneGl+mlAwZA9e7FF5juv1caCh/ydEOUujRR51R9xoEuAD06WExFcE9dKV
 OBn4E8yj0Rwg1q83G0lUKvInOLSW9E0zcD8oZ0pZICsBTMT5b/Xo8ckERoGG752LgDnYJQXC34u49K
 Btr0N0FNN/mBRV0XqXoEz6GeExLwSq+psFvd8uord2bn95qdsZMyw1czit/h+cDE2VtYecI2LfzveK
 +fP7bC34BwyFJ4WhCl/UbE1AEZSyjQN9vGs+mEUlWi5ZOI+UoyRuqM9FxBDoBDudMRo///qlgqsV+U
 /ZxD3hMZof502h5u0UZKT5k00eAwxS3KbqRG4hnkJXnPUyYAvCB717WLh5M/dbDIHf9Qov+JrJy9PX
 RLIeTAqdnZhPy/SpqMhn7RayYWm4I6zUNhhTIzb76guC/4/PERWnAwFbuVCw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Since commit 9e53a66a2f2f ("soundwire: qcom: deprecate qcom,din/out-ports"),
the ports are checked against the actul hardware configuration, leading to:
qcom-soundwire 6ad0000.soundwire: din-ports (0) mismatch with controller (1)
qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controller (1)

Fix the ports count and properties of the corresponding soundwire
controllers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 42 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c5358894fbb3..2cccfbc6d008 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4730,18 +4730,18 @@ swr1: soundwire@6ad0000 {
 			pinctrl-0 = <&rx_swr_active>;
 			pinctrl-names = "default";
 
-			qcom,din-ports = <0>;
+			qcom,din-ports = <1>;
 			qcom,dout-ports = <11>;
 
-			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff>;
-			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff>;
-			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff>;
-			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff>;
-			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff 0xff>;
 
 			#address-cells = <2>;
 			#size-cells = <0>;
@@ -4827,17 +4827,17 @@ swr2: soundwire@6d30000 {
 			pinctrl-names = "default";
 
 			qcom,din-ports = <4>;
-			qcom,dout-ports = <0>;
-
-			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
-			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
-			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
-			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
+			qcom,dout-ports = <1>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x00 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x02 0x00 0x00>;
 
 			#address-cells = <2>;
 			#size-cells = <0>;

-- 
2.34.1

