Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80533BB114
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716460; cv=none; b=aC3W+1bnUqFchiG9RfY4y+9KoVRrZ+ccJSKKie+uRfi0uXRdYBAOiEJGdteqwP1ln45BQ3ZvivSRo9xcHsPpnhXqo61kZYiriHpr6SuAymWkoDmxamsycCNGP/Vuh7BSTxgU1B+Qj7JiYIUgDYFMdPH8hayxbfJcgrFk9kBhfGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716460; c=relaxed/simple;
	bh=MqRMZyVlH3leiRQ4IzNZyrl1O2s2mftQK+FQx0HoAmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5LctF5qGz7eVatzr4Nvr6u8dZhOfqCWlDFfqV6Hcci1gAJJpBYbnPCSH/jDIzmQ2INq/Gl2gSoYzbUzkc/tzRdguBgNGK8p1taGbkSs0kugPxpkK3Hu4opTbGrBbkBhtZKuV80zPgN3VfrI9iylt7JcUzGQJo3QK2ZHAk2i8tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VND5zesh; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VND5zesh"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c858961a8efso1084152a12.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782716459; x=1783321259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmmf+pnJxsnUoyC6tMjVno2cHFN4son79GGotpRL1es=;
        b=VND5zeshbrJiFTdN1VE7W/Je38h/dnz1Z/03VfH6+q/lW5HX0K347p6+8KpXAhhfKn
         jsqKio2UqkiiVeRd2zryiMKpvWH//Mnek+kJs9SMlzLrrkOxGCGh+7EuJI6qnZE/NHJW
         fJPYRVF8+E37TdXiHX8b2xohG9/CAu0z7ifdbNqs1DT3/6Ghc+3cLogLz6aHqZ7JobsP
         cqQnyA8k2va/U8exLxH2EILfAnqWWgdWy7j8BDXqnYLFZiLIZGrA9UGccLeneB32wS0N
         TgDnsfaOj8s6iC5yOFVjk8piFtI3QAckQvQyrbZyDQdE5h48OVDhGXorh7fd2gHpsZLg
         N47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716459; x=1783321259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmmf+pnJxsnUoyC6tMjVno2cHFN4son79GGotpRL1es=;
        b=c9r63nsN50azIIuJ/7Y/Rmq1ORnZGeLPMcgdTz/RmfqRN7gbsgU4fRzqvEskxUuz3j
         17f0FKN2XZLf05gmcfz2o8jJCHbm+DtG2jgW6AoyXnY0W8EqKg49QyH3lE1/1JzwyvIq
         XSihGTWVZD3yLkLShZWN85M1XGQEFrMZeoDGp/tXMtaHVb4dKYx+hi5uHSvOTmHvbfMj
         8Sh2FF7AQMHyj71JuXatmSemfR1o824rU/DroVxzcblVamcjXqVOXiT6zx6Rz9h9uUd2
         YG32AHvV0shoUBt6FDoRUncBBSt4Eh3vFu35+G16rmBYLp1i13NHh9gPmB10Uti1f6t+
         Ry0A==
X-Forwarded-Encrypted: i=1; AFNElJ+J5iGGK+/xgTTeIiSkleuImKvv/Br80F2k0M1NPkYZAabzKmolWg8KAvYwY6Qf4mIM7tA7pgIKbVpr@vger.kernel.org
X-Gm-Message-State: AOJu0YzDwqix3BHh3lMsYVokMv4P1Kt9P7P4ROVZcl23qoJIHtwyDu1u
	l9gp9wgc/loD9YrSHtKMC3QvmfGRQJliwif+dJFex06iDdfCrP6E7Ju1
X-Gm-Gg: AfdE7cmSt89DJWH4TVYh/neii1hrh8SZvNnS1Wbac+WSY7CG+j+XRpI1zr/awXaDGIc
	rud4uVAFfoIwCsaqJpnNCB6ltAj75y/R7JQN6wTIi8IPIo8wNoIeVLP5eDS03va2BtHGJPymlms
	XdEHERBBKX37gD0OSWiPQqsp8LYK+iCEYPi1gRPNmo2CC+t1O92OJQ+idAuSjOPIr5x+EQUCMqg
	kLLXLfFbyJukcxuhwKESlo666JpDlwHFjbY09WON1B8J/uSSyZIwHelqBVOTJEUR5C20whrk0OD
	sg9Zne8Zxd/YohdaiOTNMf1r54di/HdM0aBC2sg6NKe+1pUxgV4Y9lRz71TmyuXJlHf/H629cTj
	RoazbjRr8rc1eEER7FC16q6Gq/JAqiRdbtngqAa3mYycojIs835pYJEL9DkdYFIYvQ22nJvJYRW
	zAkL4jS7YLKgfG3glLjBqOfQ==
X-Received: by 2002:a05:6a20:a113:b0:3bf:7ab7:98a4 with SMTP id adf61e73a8af0-3bf7ab7993dmr6076634637.27.1782716458824;
        Mon, 29 Jun 2026 00:00:58 -0700 (PDT)
Received: from nuvole ([2408:844c:b00:2b2f:398a:8bef:b88c:653a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc90af5sm7061725a12.28.2026.06.29.00.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:00:58 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
Date: Mon, 29 Jun 2026 14:59:04 +0800
Message-ID: <20260629065905.15651-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629065905.15651-1-mitltlatltl@gmail.com>
References: <20260629065905.15651-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define pinctrl definitions to enable camera master clocks on sc8280xp.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index a2bd6b10e475..0dbcd3069a3b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 230>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio119";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio120";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio17";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio6";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio7";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio33";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				cci0_i2c0_default: cci0-i2c0-default-pins {
 					/* cci_i2c_sda0, cci_i2c_scl0 */
-- 
2.54.0

