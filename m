Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8C3DA7E9
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889203; cv=none; b=eBjQxHTPOYUhGBjQKf7M8KNcsdENUo+qsxmo8tgtvYjocYiw96PlJ1MjOv8vke9IrqGDzmeGtQPhqv/ANEfbSMUbLZVXSfgVYW6F8/9559xl2ejmtfN5Jhf8uz4ms6i2RK1/xOxHAiuoFXW0RRunljVT7hXtbqiGtU00lQ4zkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889203; c=relaxed/simple;
	bh=Gi6HmcrGUdEENDhayZL8hj+zJbPt1IWORHxWpEbGYgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuPWkdaHbsDsTtphdntfraipNJacwPOmz2dthrl+biBEwJA4/zf57AZbidyNiGVQ3J1oC81SRqb5Tw2LNLpGt/Cm3OnlidoroFnmA5pUmTdNyxQQXyTwguelME/6EGX5C+fNh1xnWLMcqXfmGuTTFxnqsjuHKiYVwZRGXmSF/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIevwvxN; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIevwvxN"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89f030ada8eso25581456d6.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889202; x=1775494002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSdVMxdN9m3u1teXqd0BR51kR0qUNsC9d7n260thy48=;
        b=JIevwvxNz2Prk2ywButxPOYo19HMvw1qZk5EBqTCe97LEKPF+uUP2tVydhDduIJJRN
         BB+D6Q6VYXxKW1cYGA5diIDkDmcfI7mtRybohFbp3I2/bHkIQpK/nkXa9Ej8fSPGmkt2
         JK7bs53az0TcaFI51YiCxs5PZvunYycNp1X8HPmv1PxjbIzrspoIhpgj5jyLeW45Iok3
         qPBtTVeli6uF4/ypiZQtBTwkOC1+bw9xACScxhsk6WJLNIYNcbOc4rc60gq0jGLmYwvt
         nmbsy12wuU1CLW69QQKKGTSIeuQkA9rPcW7dPuyV+hwMRF3USjDWKZCLMV7g9liduPa7
         TbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889202; x=1775494002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QSdVMxdN9m3u1teXqd0BR51kR0qUNsC9d7n260thy48=;
        b=sraw5RUoBIOgPzQ2xf7vcqfyrc3Gj21REelXqIWEPpdiE1QOdOkekwty16vMnU7OQa
         rGjCXfd0UJ90G7hBzh+OvzWtbWm71tWlO/h0EYgd2UpeS5IDZaN/jgYtC73xzGSnPB3p
         DRMAPdLXFEfYT9itRT/KiQHsh0u1/Rlt/4xHh8WLTinZCnb9Ol0nehPwO9JllrX8hh3S
         zzYZW+Oft5tD8NtKtTkIPY0BJyex5XsXjRfaS5Qzn/YNC2EGH8MyIyvT7wr94L4W0zQ4
         VzqYaWK2NozUNF4L/5uFXcH23Uo3x5sFzyKYzhNLwzfgSH+mqAFV+MgSzgU138EB4QuZ
         0OAg==
X-Forwarded-Encrypted: i=1; AJvYcCWOSrx2+rKXxVsG3JXXIFBxcCfItTJAgobze7iEC/v/4G8cGRpheBCmbe+i/yrcTmkPhQ5KqsfdQnFW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg/Wr2M8plmAdm54GDcuf2mzIEX08MwIXfy8otzc9xQS8lMAHn
	q93aqD5W0SjtwC/fJQB+pGyYN0RAVIHe6qqNSH/WnwSfhnpW+2FWxHpg
X-Gm-Gg: ATEYQzx2CyAoXiHRze11KyeasuEet5jlcc7JIzUjycMRSMhb23LxYaCbXTvnXcqdw2+
	BymhsfEc0uwGgsxjnBPq2uUsaXSqkC9EFQPANjmQnplIny+Ga3/Vd2cBapzRSH2FZZ0VIWPYaHN
	kUo8FSyP2OnhBOBRxhR0fkBiX4Pt9HICUmc29lIplcNfxXo0hXNyu06HEQQyPJDs5h4hm+yrb5x
	rEDi32GNCi50EUDGdUpjcfN5tsWpEZCWcRjs0jlM/Q440BvCZ6PtSOP0LqqYIlvf4UVPUwUr23u
	TIS1qKcMNjGsS62yaG1b274bIlLw3DiH5ee4/xCrFm3c4cPCcRgdQ57depJA+FerF8ZhaFny+j/
	Khp30R81YzbtoVjXPeHn+BrciRcwOQZ4vt5+87nMAjkCA6o5JTJAo3Evej1YscdOkZXmIIW7tAN
	nQJbG7rWN6Myb1YteCZ2yy3OY=
X-Received: by 2002:ad4:5ece:0:b0:8a0:2b9b:af0e with SMTP id 6a1803df08f44-8a02b9bb731mr93909706d6.12.1774889201622;
        Mon, 30 Mar 2026 09:46:41 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecc0953aesm66087016d6.18.2026.03.30.09.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:41 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add lpi pinctrl
Date: Mon, 30 Mar 2026 12:47:06 -0400
Message-ID: <20260330164707.87441-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330164707.87441-1-mailingradian@gmail.com>
References: <20260330164707.87441-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Snapdragon 670 has a separate TLMM for audio pins. Add the device
node for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c5f7655421a3..85a34e2f0907 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -2346,6 +2346,79 @@ lmh_cluster0: lmh@17d78800 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 		};
+
+		lpi_tlmm: pinctrl@62b40000 {
+			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
+			reg = <0 0x62b40000 0 0x20000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+			cdc_pdm_default: cdc-pdm-default-state {
+				clk-pins {
+					pins = "gpio18";
+					function = "slimbus_clk";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				sync-pins {
+					pins = "gpio19";
+					function = "pdm_sync";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				tx-pins {
+					pins = "gpio20";
+					function = "pdm_tx";
+					drive-strength = <8>;
+				};
+
+				rx-pins {
+					pins = "gpio21", "gpio23", "gpio25";
+					function = "pdm_rx";
+					drive-strength = <4>;
+					output-low;
+				};
+			};
+
+			cdc_comp_default: cdc-comp-default-state {
+				pins = "gpio22", "gpio24";
+				function = "comp_rx";
+				drive-strength = <4>;
+			};
+
+			cdc_dmic_default: cdc-dmic-default-state {
+				clk1-pins {
+					pins = "gpio26";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				clk2-pins {
+					pins = "gpio28";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data1-pins {
+					pins = "gpio27";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+
+				data2-pins {
+					pins = "gpio29";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.53.0

