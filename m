Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867EC38A71C
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224528; cv=none; b=S9AhIjZLZwsDtDARSal5vxba0geXP3amjXl3yvLIkpxmAbbm09bqcXXmBBwAYU9cQ5K1k0vOO7CMd+5dJcymxi8jp/ypbFZMI+9SpBlJ4bXGpFKktvxWEsYTXcjMNSNl7Ok0FJGmm3Rmdy4Mg9XhE188MmYoQG+aZPQulqbyQwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224528; c=relaxed/simple;
	bh=0tNxjU9iZ5aS9yMEJ2ytUcRE8/Wq0mJ0XVTDTTRdWIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTAQy32cEIAtnKFeTW/p65M0B2qDU0L3fkCnLwxfluc5x1K/xUM+trxAdLpWMgYg35wQZ6jpAjnBRVA1S3G+loRqntXfouictY2SoiKHbzhMi/Bs1uYwdw1BeIdnKcmxM9lIsdgrpYk9CSleem4ATvJl7NZ3mRNreoHt4pMoAws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KrQYnLGJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KrQYnLGJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b936331786dso201915466b.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224520; x=1775829320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUIw5PfzjSbRelAWl0scbWA1aw6NDc9ZPR21LqC1P6U=;
        b=KrQYnLGJl8pxYlKkbPv9GaBQcgH7Y7ofkMb1Pw3P+0GjxqB5fvtUWPGvcZwiAFnCs0
         DuLXU+rRbGOsMHYMSnNB6rrP5f3ztFFAl3iLLx6oSj8/1O9h8eGTIEdHl0B5C4W/Uhm3
         6I27KiVMYAjLJMGvJhYYXHdbw75LlDzYO/zeMbFylWp/9lCJm7owH97i7ZqzFfEPwIPH
         gBa4Z0c30OoUTPGg0ZP0kd5pvVulkGg+lEF26Tfu0ZrPyoCrr9iSCS9oh4DYN01eC77H
         hxDPbYoH0BI0fWsdLzyxKvvugvkw61/i90HJFzPa/Xj527crC33BOwt1A+slwaxsLiE/
         COVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224520; x=1775829320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JUIw5PfzjSbRelAWl0scbWA1aw6NDc9ZPR21LqC1P6U=;
        b=HpOapKm2qA8/SYls+H2ygVr8hUg9zYL6uMJraT4hZ0DFLb3QNnoz2C0mw5Xzvzied5
         vH/SKhjMaEMIUKCEsLYID0FtpH5j/BDjoy+mqyCaYHXkp7eoMZYVX48dr8dPjQn2/DMx
         /l+k5UorqGHNL+flXDjNNEolikQzqdheq2KVk8eFb0lKwK8pvNG6nOm7VbkkozZ1n9Ff
         quuLCg/kspKk5ysULnmcqk6h360fongcAysapwg/DDX4e7rtb+3Hn0K6eFru3ZK2KxTZ
         WxCQgrtMwNjZpJNHDbCHDqklv66Ly0IvPPRm9COqdnqat35qan6jCtLuy7aEyFhX7ED/
         JWqw==
X-Forwarded-Encrypted: i=1; AJvYcCU3WnP0DZh+zO1iaBZrHfkvc+0Wbj9iBCcJLvRy2bRLDsI89b0nXGO3EYYEBkMTzeBRLM8AT8jsAMmT@vger.kernel.org
X-Gm-Message-State: AOJu0YwVPV+ueQz01B2bD383pwoPd36bClne89q3URij0zPImWzjL+pO
	oKtD5ZJI5yZuODR0k+oTQfhqDizZVzxN7q4QcgK3UFZwZASIO3fkVvy2V2I8oxJA25KUvxCgjAk
	WkymsmD4=
X-Gm-Gg: AeBDievZo+XkHmYI1MWwxBZtjjK8p1rtt5euIpyQLLMw8im50Cum6R1sAgxmLCms9fb
	7CSe9jaErIj/5/Ns14PLNUIoC/IhikZK6nmlK9e1t/K4x3HSyeGULtxKhSdNuhG5eLlfTU6mQ77
	QH8gC870WjRen+UTfghkt+DGIEluoTxT68tdMT9oYKUZOl791qNexMPvoR3A37iRCvOlTXf9NWM
	FAVyEKx2BDYWPbDSYzPp4MakDO5PYe0BIkTqZCldnIa+q//OxDzsdf+xSsCB0eUm1rO7pN3dTzg
	UZwsvW6DogZVwxhBBsGrQqfxZZto60zKBGHpskCjh0iBcHA/M5kr2FHufcCi53YF5deIbtEFNfh
	7mrh12I69Tg8nlvXM9/X6bTnWXxH4oJ2TirHb325yoyVb1Ua92G1xuWmYAdyJLbT4WgOJS8NyNu
	tWdjI3HXHvRMHRL6z+Nl55x/nqylRsG8IQ8GnEu5nZJEGFCdX2c0WQNJTtm/P4Px4i7Tj72evLJ
	CR4nLKcF9JeF80e+mFbv6nbbD6iX0h5eQvvWQ==
X-Received: by 2002:a17:907:9711:b0:b96:e593:fd1e with SMTP id a640c23a62f3a-b9c66e5e2cemr156799566b.0.1775224520390;
        Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:50 +0200
Subject: [PATCH v2 4/7] arm64: dts: qcom: milos: Split up uart11 pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1487;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0tNxjU9iZ5aS9yMEJ2ytUcRE8/Wq0mJ0XVTDTTRdWIM=;
 b=/YToNUqYXJRAKqxJIRr0r/cZTobsLFymsg/TVbH46bVWMTHSJdm7XRvdUpgk256TWrcMjxZzR
 nOrivC7LfVFCc3S9aQe2Xi11CK1Ror8u934bOVKDYcB1HNT8BXOHYGt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
split up the pinctrl configuration into 4 nodes so that boards can set
some properties separately.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..71292dfd6e08 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2099,19 +2099,27 @@ qup_i2c7_data_clk: qup-i2c7-data-clk-state {
 			};
 
 			qup_uart11_cts_rts: qup-uart11-cts-rts-state {
-				/* CTS, RTS */
-				pins = "gpio48", "gpio49";
-				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-down;
+				qup_uart11_cts: cts-pins {
+					pins = "gpio48";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_rts: rts-pins {
+					pins = "gpio49";
+					function = "qup1_se4";
+				};
 			};
 
 			qup_uart11_default: qup-uart11-default-state {
-				/* TX, RX */
-				pins = "gpio50", "gpio51";
-				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-up;
+				qup_uart11_tx: tx-pins {
+					pins = "gpio50";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_rx: rx-pins {
+					pins = "gpio51";
+					function = "qup1_se4";
+				};
 			};
 
 			sdc2_default: sdc2-default-state {

-- 
2.53.0

