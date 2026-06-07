Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743EC2E7F20
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780848369; cv=none; b=Wj1ohms+iKqOXNFKJVLowkpOViRI/cJGvzSe8uHXn0upzPZsHaXxQHi3r0GbBK4uTyd3EXnuQmL8chIGWmNwd42TeZmlS4cN9igRllF3IfbZAXuUhS+hEf7UQlEqtkOREFrOYK+EhPqae7nC30xB3sHPflMJFpA8QjgSdyFG2KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780848369; c=relaxed/simple;
	bh=bzd8f03sMUrmwvIvxHcfIzMT13ih+srzayOhdI8kYqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tN+QGFPi3cIjkMjqN2/mM3nayLyJzdwb3fCHFsPyw/G3Oxdtknw4VbeF0DLONhGJeDSRkl3Db151H+tmq7xlsZ0pKtoAGUJqIMDx8oWsGj3cuAfqJ/UmDB3gHFpUtCX7aNpqGVuocmSig7XTg2v9f0sSL9BPQf1yWrZnOE5+9sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAfrdMg+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAfrdMg+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso2046894a91.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780848368; x=1781453168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYxrYsMuwkeIgQXR6u87qfS7qgAmP67AlIc3XbzwrBM=;
        b=sAfrdMg+/d+bfaPlKO1IPgeWdHyl+9gcAcelHFOLB/otILVP+FWsXau8b2+lN6YX1m
         5ABeq6cN966Ga1Cp+vsgIXt53+MY00b1jjopa5blr9dFFbAmfN+icCW6/jTT6F4bBpB3
         YrDg2dlV0eJvUGRDc4rW0eIgbs83R1Js7JNfteF+BPr9MSRqEvEQd94z1PH5WF4QPF9h
         ZDDwk2+1WC3bLfv23g1K8wTfUCUg5ukl0DJx4xf2/5BBw58kDrwAEujawdpu+cO1QZiI
         m8c17iAxpAQ8hCFpuwAUFF0SI5W5bAyM/Faz+6ex9h8CMXZOsgJG2HwdbIO2MoqEtM/2
         sxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780848368; x=1781453168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYxrYsMuwkeIgQXR6u87qfS7qgAmP67AlIc3XbzwrBM=;
        b=ix/zuNbL3NvxRk6klljama3QFrqsQaqBRzeYkOqG54ZZ/yCN5VHs825hLq9mcUShZh
         sY9LUsz3ZlmFb8HnrQH5TmY9Zc8ttTZojC9qTNepg3VaQywX4XLTyU0bIVEr4TD+qtha
         Acm4DB6DwmVY2MOqeljPyJdYIr4sxfd9mwPQphjK5ClRlCHkKgFkyrivuM6XxipEyUd9
         Ce/NkPB1oOUDKns/zPp7/GuxMcHXblfcv4+AWrL0Y7+Lyi1H1QNcR22h/5DQNUxewEAB
         3J2SyArXA1lmW9OxwzI9i19aeCevk7l7iX8ejjU9uJffJYTzh5oS5avoVx8JgFxManqi
         FZ0A==
X-Forwarded-Encrypted: i=1; AFNElJ8cxgFsh1tJqevG8kN9h7IcZx12ZsIJClg34of9KayLU/N1K/scQq2iJ27wUbdMOX/bFTFExkePyTRI@vger.kernel.org
X-Gm-Message-State: AOJu0YyBY3E9cxJt+90KdEpyHSeXcmr/E0DEQcaOY0s7bfgM9m11nrtH
	DnxYMmp6KnpoXjf6Cb7Q/hATTdxpelOp3LxmnapCstvJKbJ8SV6Mikmm
X-Gm-Gg: Acq92OELSa4SuKk/y/MMLdy90aVsg3isdx9b26gfZH+XO/b5Monb0tM84N83qx6nhoM
	xvtvSNDfxBBBaPwrkVn7qNDm502n0rPXOhwWLTtDCPq2v99Mm7jV2dGY6tKcEBTkou5L4GYvaGe
	qtpuehG66alaocdCvzWkE4U3JTqtEeEyX/3EUPukDzgqBZZBlj3u7H5n1W2GTyxMHZuhF7DzQzd
	hds1Me6WC00WwdLDFWtlKQvz+ly7OwrktLPmutwIIlKIvWTxTZnm7ddpErKylUoYj8LN4veNYHV
	xvT6Wq/FhorCpQi4Ii5mRZcvvFJr6mAoLUW292Yjjy2cqBSYjyM1C8reInOm5d6de3CI1hhrwFk
	uZfmG064FoeDqwS73DqjiFJCQKPvZ9ENFg4nvy9YIqOnQDC48rGrMDKuSznQ1h8Me1BhnUNfGdk
	8TpbCNKn0ofQoEECz//aQRotNkKp9SG5Y=
X-Received: by 2002:a17:90b:390e:b0:368:1064:62f7 with SMTP id 98e67ed59e1d1-370ee33cfabmr12988882a91.6.1780848367737;
        Sun, 07 Jun 2026 09:06:07 -0700 (PDT)
Received: from nuvole ([2408:8448:9020:52d:18d5:d85a:8989:26c7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm14857134a12.1.2026.06.07.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:06:07 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
Date: Mon,  8 Jun 2026 00:04:33 +0800
Message-ID: <20260607160435.36546-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define pinctrl definitions to enable camera master clocks on sc8280xp.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
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

