Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919199;
	b=mHvY/tljHX4djuccPekz+YKCjEsvqIB6uLD6rmYVDsqgx+nHM+fqGD5jOxsdNqlQmVFa
	 dJG49jMzor2/dyYPw66I3SrlUQnPf85PoDpVi/vem4ovQq3NWXeRhkKpR0g+dsNnGtcz4
	 kC+coKmgbEUNoUWk5qS6DIw878vcCN01U44dA7CG7mHxaQxO65eWsPPN3pXLSjLq/+RWd
	 TAYWNHWJAahtt/ntBVw1rgRvvwlnn+ZIJx5mlntRWN1om5PQsZrz46tl4Vtl3nuln9vMY
	 k2a8cEzVQloM8wdyvSTPydR+Ok/Je8QgjVYhpEad/rtt5rZrxwrbhG0nwd3LlUgmSvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/HMGwwhGC6wtM16fz47LMMhy0kaE1LvMkOQV7+Ogndc=;
	b=AjQvyTjAFKk8atVXOOrz/2zZApuU3qh2uisuFa6fU+uDgpp5gSGrq/FHYfhx4mtnEQMo
	 0Q9XFqDSR8wcJlu9WcfsxGFIf6Qyj+SjUXjEsLsGczvCodT8RhFZzuERsnCvqUR4e8tNp
	 nvh4mZHuky19hfJY/GW8BUNUp94oICxKkrNrnl3aWVl90v+s4Qbi6f7pUcDpGj3rDEpgf
	 GBv12sUXXhYXmZXdKeXjh+CmTcElbiEEi6WO6Gu/47NtW2Lg2lw6EC/q03wVJCC7wffgY
	 G0QSRRUM9oypza68YQ9UN42YUZP3gMYQBtun7DSuZQhFnG6KHywin+mF3PHtfR7xgVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYvJk5UD;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEB560A5BC1
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBEB560A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYvJk5UD
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso47378075e9.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919197; x=1795523997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HMGwwhGC6wtM16fz47LMMhy0kaE1LvMkOQV7+Ogndc=;
        b=mYvJk5UDb5fY1RAaiAbz1ZaR7v4hnh+Nf3dD2aEUknU7gJH+VMHD4pmvofPyt/7iZj
         c3YlOgiC2zKp/KFrRsgtPLolPLB3NBgB92GVn8ZJrwalll7AjrLdDslnMVXqyIpwSgME
         P7K3LvBrX+gC2C0UwdgkfyrrHkzSz0toEZq+kFu+4k0MEru+y1OFbhxFnQHZYbfCHR4j
         iEhtzr5ClE4SzLx1u4gAyG0Xmy0pWQtbzIy4BO/W+fRxMeviEY1MWGwx7TI30t9oQLv9
         oSI6sK/rUwLLvO2OEYNN0fWpaqEFqoS6bWRg0toUmL6VXaahvbx7xOa1VFK9gWumkcQZ
         baHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919197; x=1795523997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HMGwwhGC6wtM16fz47LMMhy0kaE1LvMkOQV7+Ogndc=;
        b=o0d7vPTqEj36sE0szmL0BSYhWJirGtBo0Rut4rrAv07eHL8YYPe5az3AtqkgEyh5CG
         6U0YGxQiN9smYjKD24cB62NVytWYaBvroFp3G7tapMkyJJyH7P1GlTX1qVOg9viMXn46
         m58rSRPLXbTqACjvo+633K8HXHSSWryOIlU6w6zy4GS5PHVS0FRJ5skV/5La8fesI6eA
         4kVDHCQsX70zwTLelKJPLpT0f6zNSbhM0R4FNjOrFEGPR+ZjJ4Hz0T9YA3EnQpSuWWPs
         I/yNdJ8vRpPIiH2jTIyyFndNDIMNMb5SZsh4T7tCF3MgTEJfs7oniUFRq5Fqs7ALnFNF
         JD9w==
X-Gm-Message-State: APuU4Z8DizsueMdMNgN4gPy720hdwA1Bhs5nG2Z+MIOntsw9On5ztSmE
	UENL0q42xn7d2GHW7fsO4VBwzIcKb/CKnbHtgB4Ia+0SLYutS1mcIg7C
X-Gm-Gg: AYBFou2ryf+2oD4L3/ICUhAKwv95TfPCUZrqrtO2KJiagH8XRyF4R09OlD0rs+uv3zJ
	qaR1QDHTMOZxzxXc3O8MylgK4dQ45P3OHsI/NfkcffN/qz5Ut1qg+Uhnr+yRC8zoZExe3Wma2qg
	mnMt9pROXs/CO4kcMNdYX/gcqg7qUoOECU0jatf4gK0xqvSqb6jeMHJBAaZtSUKOg4VVWC0DWau
	s801d5X4WODWjaz71Rpxk7rjzvTuGmnFbJcXt+KkpK0HmWJsP6mQ+OEyQJyXHpw3gOHi1I+KNr3
	W72JrNiCUb9wP4ZiA/eDHtXlbOlWawviqZWr6IfcRPYAZ//cNuQtZ9mCzwfVFW4ssze8B0i4M0e
	71K2uVCI8bJqSBtzlfJHnlYEY7OQTvrcN4daj1giWuaPtQMfnjmqF5Sr5+G2kE5crn3+C2c+9mw
	B1avpgtxbNSJEEXLqRcyYO7c0rIdWwVw3DoClGa25U0oCVF6JFcnvpN7alfAtjp+Tq47bJ7EPo0
	illRks7bdqPHEyY0bKXGJQvNCGJzY/rdLvawKg4p44OTPRM0YADclWfM5PxF4QpH7fYfbwhBJU1
	DOqMRX96CSMUDpHraNFrpCeqEHkBm3SGHXzEdiaQ08J7IJQEUVd69WjYgKbtzyMIRPQATg==
X-Received: by 2002:a05:600c:670b:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb7987fdc3mr32412055e9.1.1794919197198;
        Tue, 17 Nov 2026 04:39:57 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:56 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 08/11] arm64: dts: qcom: sm8250-lge-timelm: enable SW43103 panel
Date: Tue, 17 Nov 2026 13:39:43 +0100
Message-Id: <20261117123946.668557-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DISPCC, MDSS, DSI0, and its PHY. Attach the SW43103 panel with
its power rails, reset GPIO, and four-lane DSI link.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index ecbff27976fc2..fca48472f5dfe 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -557,3 +557,42 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l9a_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p9>;
 };
+
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43103";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p8>;
+		vpnl-supply = <&vreg_l11c_3p0>;
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in_0: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in_0>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	phy-type = <PHY_TYPE_DPHY>;
+	status = "okay";
+};
-- 
2.39.5

