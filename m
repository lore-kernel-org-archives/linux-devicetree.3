Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607652;
	b=qtcO0/xDwQe0Db/tfJd3DgSD8LRnaiaHy9KiOxmh2PA1DNAm0eSRJvlqXXzv88/1aN4G
	 zlicidDgBfuMJvkDX3xsuRIBOJkeqUnCRoXHqvaOKyKvibT7b6qrn+GTidaWxZJkD64K5
	 sHPiBc+73K6J0MYoKp3/dcJQSEVTRcpZMr7yiemk8GgLOreb8HSeBdcR9+x53fDCMkFM5
	 y322K62tC9l8suXbXB9i2Yl0nbY66t3JZ8ag6sltsTbHBdSro+Qb0FPW/2gqf4ll9LMM0
	 jgj0Forr0ittCJvzB0f9lOYJSzLmzRJqdPTuJZa6PSCyzEZrQUMUUzDkG0Uz9GDaZtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=g7LcynNB6KsqQ3Sm1DOtIB+KNFt0Q7hnCKCPUOmoAYU=;
	b=lGYirDnt5e6yGMaOXHwj9yySti3UhBNxgj1FAGqtuwYhKKwSx9qFWOVFb214P9zyFSL9
	 GZoh9t/VeRbzQ0/QlODE18IwKF+PPGP+Drkbp2BxzZ37Cn9Roujnkdx1oky6myU7CLHg7
	 N+Tb09LApkCtaegwD1z0vFOaFJ5zmRM1/JTbzy6az2wmVueEpjzx5Y2qILXHMmuDWId1Z
	 vAdH3DytUxNoma7+fmRxyKsthKlZOrQplUC+pJw6RxgwTwDC8J9XGgCEugTkzm2Tfp3qz
	 h3MuQ3I6QZB+/mIpY0z+CMo7GnyVgBNve2XrWxX6zLn+PgWZQ+4KlgfQ8hzGiUQfjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r2BlTQ1O;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA34606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA34606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r2BlTQ1O
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so50055065e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795607650; x=1796212450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7LcynNB6KsqQ3Sm1DOtIB+KNFt0Q7hnCKCPUOmoAYU=;
        b=r2BlTQ1ODZHTW4wBKFyaMsbyU6HzThflaC4woqT5PDSQ2mAoTkoxGVwVsWk18P2Tyv
         imb3uo5btmY3RHB6a+VliEUUauc8CY3Ukc5bYXCoxJLKL4xVxwvbsiUSSKBjwCAsRWBp
         yvO1TgKrTsJ9//z4BEtGFYQHUm1ivjgigk+aDCxguSg3P3ebgev86OEBlNDVzUDOP3jJ
         HIvKgUA4dGE/6uCnLwA1+DpHDycVA8fGxSrGFlBDNNX4/8+tdGFTpJq2mGAxeeDGxMZx
         pGgN+AWxYC7wubouCBrOYlyBpwSFIJhssK899GwtXYOeyVgr5YdsBd9jdpLHq0sO5/5O
         ZOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607650; x=1796212450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7LcynNB6KsqQ3Sm1DOtIB+KNFt0Q7hnCKCPUOmoAYU=;
        b=QB3VBFWe8rYHMIZeGdC3YNvh2yJlNZx1+YuzgCYoZPDhK8UWq3j69YJm6dNYFQqly6
         H4sScMYMi6PmoObVX1b2s7YxaDaYMGDTBdaXUZhPM3c/fQxRAC5thgCY4/aOQiEjAMbr
         xzXNDa8YL7gLRF1MwLB13fu6onBmeRrueSIhh5BdQdP8DWNEi9SFqqVgiSyawUkIz276
         2cn7obVpHliMnY6MvOykFYd7CEdEt3GtA0wwX2Ckj84jrfZ0hw20h9qLLB2mISrEGKMs
         O7M+tEq/zOID73QwCFbRDjT2aru9luC0Nc6t7634pu5TW/zm1h/KwL0wj3kiKk0ymvkE
         AQQQ==
X-Forwarded-Encrypted: i=1; AL+hErF0nvV3rKb3IhgHzcUl0dBF6gzVxtWKyFwkc2n/bmQFr0Tl4llkeX+YGF2dUQZyaF+SYDZq7t8211kU@vger.kernel.org
X-Gm-Message-State: APuU4Z/R4MXwh7ZkRnFVWVnou4HAwWg/rHClxBxWnAciQmpmCr/5NzvL
	D+LJJv+VRpDFDZqokj4rCLqVGTQU0ukAFzqmmmLVOqR3wzg2/3DqCax+dPS4aohklvs=
X-Gm-Gg: AZFdTZfhw48P8mXp/OA4Pp4THmgkbZM3lRFUNXIaIggeVPfwEa10yjjiEvSP/by9v9e
	wyN/w1X8IPwc/hDasy8OHsPrJWOnyNT9rR4V/jUGnt9ulyuvX4wFhuCa5ki+vuikFPWt3QZz017
	Jyhp/cwFPmQGR1oMMr1gurQziMVO6GvneIprG11fl1/muZzxOXSzp3m+VoPs35vstPPQYM8jOJN
	duOd+37xKw5IZgl/+ZVc27AQAjUS2p1DFp5xUHFV02eiqwcSzyt0TBZ9Uoe9KQ7VQ4rcgy7ra+H
	phLHhLI9Q9dyIrumDqTKuxqPVdqz2T5ANTY/2gtBBtOn8Rqv1gQ85ytL37aBekNlu7PXKWUprWJ
	RScbABhuaEbAqODnLI7+NXC0Aj3npsbZs/UIvLT96V5aQ6i2uut0NgNLy83SIqMALNOTScqhduv
	zae9nyQ0xbwYayou7bWvoK/POiuZ1xUJEYuCHa4h7fQu3j+RPaE0MpHAcjMLSifJjbmQmn45r0T
	B34P4ja7buJSL75S6pfZWnqVbaKxMWBUFl6KM+Bgt0KaRRJMuRMhwxjgVaEIfSNtbje+I8ftgQ3
	hiE8P7zpJhiR7JfVon1SI8PkHGRUXMmRsGxSR3ZU+zqhrrOXvg==
X-Received: by 2002:a05:600c:4584:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4bb887e266amr340859115e9.1.1795607650183;
        Wed, 25 Nov 2026 03:54:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm234073615e9.1.2026.11.25.03.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:54:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:54:06 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: pm8550b: add USB VBUS regulator and
 Type-C nodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-topic-sm8650-deckard-tcpm-v1-1-4af33e89ea9e@linaro.org>
References: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
In-Reply-To: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2488;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=h9OPg5RS+nfOLWxynP/fUsMok8GdZyNzCl08eoWjKnY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsxfGIuHF4Sx/7sjaBBBlGxsf+TxsL+5CqwjzAJu
 OjNv2WWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbMXwAKCRB33NvayMhJ0Wb8EA
 CkxJYGzSVWwut77rmwPHe22a/KxTlPpY+ldKxWHGXpdt0iDjwx7jX6UgZ0gbI5e9dh47eCPGIPGSW+
 B+P5710m8dDn5McpDt0mYSPUrCJl5JOupqAIi/MiK0NsExOOWAnHeKXXZe91N00m0HcCg95Q6+Fk0L
 MG8MiCdh51WldW1tsbzxfBTDQas+mmG/pZu9GtZ+VUtspnO9VP4p0MPb6n+5NyBjq34uQO7FKGnMnC
 PqY5bpE969VZWKUNQgQ73rUxStWgB0A/ixQOLtUmQS8esxIl+JocTA8ohYUfAcND2uA8/f3uUlBAwU
 IP2FngtB5UeR6aoKwsEy7FbP8KlBbcBDjdfEv8eGlRDPfTnCy9zJB8UqWtfX7zlu1JrxdmVk944YgE
 pTh1pqFNVAVYe4vDbR9aRcgPxS6TfUVNNgeHYP2QsRdgOMb+npvwLsMHqOMAm+1Z58j7Fsuvm399Uy
 8i5h6mJWM+w1EJ9VMxCZ7BsJt+Owr6lpB1PgXIkJzZawHdX/Ts1/YgPgC8ThcR5h0GQ1DXDPPARgH4
 gLhIPnu/0dvI6l0PxpHUBcAenYehvgoJ+lsExi/woNrH7D9JFI/CpujjhzIcSxRbM9a/YhvkT2WExz
 +ByjL3+87Gu7xr5X2mLGfWP/VRrnOM+JFR0dBISnkYkXpAdrI/O7s2ZylLgQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Describe the PM8550B OTG VBUS boost and the Type-C port controller with
its PD PHY, both disabled by default.

They are only usable when the PMIC Type-C block is not already driven by
the ADSP firmware through pmic-glink, typically when Linux runs at EL2.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550b.dtsi | 47 +++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550b.dtsi b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
index 74d23b8970f4..feb2395e920a 100644
--- a/arch/arm64/boot/dts/qcom/pm8550b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
@@ -45,6 +45,53 @@ pm8550b_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		pm8550b_vbus: usb-vbus-regulator@2700 {
+			compatible = "qcom,pm8550b-vbus-reg";
+			reg = <0x2700>;
+			regulator-min-microamp = <1000000>;
+			regulator-max-microamp = <3000000>;
+			status = "disabled";
+		};
+
+		pm8550b_typec: typec@2b00 {
+			compatible = "qcom,pm8550b-typec", "qcom,pm8150b-typec";
+			reg = <0x2b00>,
+			      <0x2d00>;
+			interrupts = <0x7 0x2b 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2b 0x01 IRQ_TYPE_EDGE_BOTH>,
+				     <0x7 0x2b 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2b 0x03 IRQ_TYPE_EDGE_BOTH>,
+				     <0x7 0x2b 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2b 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2b 0x06 IRQ_TYPE_EDGE_BOTH>,
+				     <0x7 0x2b 0x07 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2d 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2d 0x01 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2d 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2d 0x03 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2d 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2d 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2d 0x06 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x2d 0x07 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect",
+					  "sig-tx",
+					  "sig-rx",
+					  "msg-tx",
+					  "msg-rx",
+					  "msg-tx-failed",
+					  "msg-tx-discarded",
+					  "msg-rx-discarded",
+					  "fr-swap";
+			status = "disabled";
+		};
+
 		pm8550b_gpios: gpio@8800 {
 			compatible = "qcom,pm8550b-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.34.1

