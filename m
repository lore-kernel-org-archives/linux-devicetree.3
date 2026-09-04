Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16934A014D
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519424; cv=none; b=BbiHwljLrn5shhL0S4IJ5y8goQNeVQppABrDTX4vkme3PJs5vngUp2y40UrMX98RGVbrgLfhB5wFh7J88R+vdsRMNs9OfFhwAJpmCC7cKskEUvQfETpOGcumblPhmDAosSgPPXnYqz8DeqezthU4mXAo5mA2SwDwXstvtJdSxL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519424; c=relaxed/simple;
	bh=K9g1SPytudaQ80/4FyVWQl43Z2IGxbYxunNGayfA1VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sl+2qdBNCA9/aH2VkkeIFCmt9jL4+nLAPdKct4A8o6eAIYG+ij+FQRa7U61tYVYhgfiJBBbafAVzIEXgbPbsqp+IockcsLQC+twxsQY056vGlNxYoR3EupYik7pizF+U8mmS4nBAmo4f+7TKWW7Z/Ta3o1ZHovfhcZyhM7Woit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SffWNdXl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SffWNdXl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso7508895e9.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519419; x=1789124219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwbqmAMM/ypUlaqINsrCHwxKGoX/kGgUWXbINf9VL+g=;
        b=SffWNdXlvHKg2g2NLLdW3E1uDHrhocGL+phLuw3X19l6IFxqCPPzVw0+/N2G3pTNXJ
         xxYYLCGFosCVCqbkM0Doj1w61eQ9AXmwfewYYlzeV5u8iXMM5P5c624P//IOnSmmGztR
         fT0jfQNmSYl5OA/kKkcEmaiYrvKdSKmDrOXFXivwmly0r9JHZ5Ih7+QDY8ETFDhvVQy8
         AGPoXPfdXzZ6G9zhirXsJA/jL2PAwnwxObn6CZqhlUfIp6BQVmckEi9devJSS3V/xaoa
         R2gwuN8xUd+RzacJQWH+4eRG2ZyyAX3n7H99Aig63IlgqyiKwM2ToEroKikAwO7ae7+c
         9XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519419; x=1789124219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwbqmAMM/ypUlaqINsrCHwxKGoX/kGgUWXbINf9VL+g=;
        b=sWGRNrZYAxGk3bC6Qnf4W8W5fEYs4qhNBgT/R4wrT5hHtax6U60Pmc7cafDb8NuBVB
         ra+ZNOQramTbMDLSdQpDc4mULnT1dIHPSjKoiFfsmvcMFa357jBYxf9fpot+MZftYTPe
         +xR08O3TZjxziJ+Zn089LfNeeNW6wzbdStwVcZZV3JvgJTOGu7e8UPy2LfUwS1tiUbs6
         D8msGKdLmYzYTYGXt6gWA2fegGyYP8yVz8RiAZttQ9dgKTIYl14a7MMUMNCobB91N9mx
         hpY3T6BsqabGTgGIgrKiMAPW6tHVDKgkOMsHasYAE/8KWNyWOkeVh7reJhH8aKa2CdpG
         E9cg==
X-Forwarded-Encrypted: i=1; AKwUvBxl0e8QesLuf5GtHcS1FGTKLVmxGPDkeSEFoXWLbv/pNWJSuOqYS9GhZEVhnGlWSWS4+aKnBOYbbwr/@vger.kernel.org
X-Gm-Message-State: AFuF++mFMQcKvzNmM+0AV0sqNsqQ9V0UZgDi7VVpO2rhj7h8nKx/PIDa
	bj7UvNa8eadwPsyf+mWRGZWet18dEEKKFZjYe67wnjyJ6gkl+BPQoG9t6Pbc48l8VFZOpH3UCZ+
	tti4NIWU=
X-Gm-Gg: AYBFou2taPtCaLaR3CNfZC8+1xwiWtbrqXqHHdxjcL2gK/a/8lsklVebqnOJW1rh1Xb
	r8R8GfyStHZT9JgV7gIGhBrqIoxCb6oFiGtSIK4HkxUWIKZvjs2YzuZbZmKxHOn1F9yA/tssQFZ
	1rB6BtIhb6+lK1Ne/4zOG3Qu/65D9H/U5L58TrobmOJM8eCj8/nfPakm8WxLdbw/0q6xawN+28U
	G+nJ8C7va7z5ec+CUKZujRTLuC8L2vHDmBAwSKCg9lWr+JJuEcdahcf+lAU+HRW83oRjFlWLqET
	79AeQfHZnpdzTvIzhZmvspiXMp7eWIHNp0riofKImcTuS0bx0EqcEnCMx4MvHFNhxsLP66Sweds
	ZoBggNUTDowxxWbO/zsPxeHQnSn+uwbBTN7HopVn/n1jWf1rbh4L7FKDkawWXAUcglUtXSvJ5HG
	U/P2hzjwBcW4CGQqd2ppO86Ka0PAOOaaHMS99Y6dPB8kb+G5YFkkMSVOaCF7Fvl1LhZeBarVtBO
	6gohqD9D48=
X-Received: by 2002:a05:600c:8b05:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cf82787camr51267055e9.15.1788519418566;
        Fri, 04 Sep 2026 03:56:58 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:58 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:43 +0100
Subject: [PATCH v5 11/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-11-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=K9g1SPytudaQ80/4FyVWQl43Z2IGxbYxunNGayfA1VI=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGqao+ihk6hv/yTdGMBJ10FKmgm9lhb2NlJrAev9o5YDnzW+7
 YkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJqmqPoAAoJECJxO7Ohjcg6IX0P/3CW
 F3TzFJng0ML4QMxe5rFn4ct4OpS8O3K/48tK0rOqPY7Pij8kXlZJd/eqNKHfTI5fmp9Wib0C0JE
 k0mfeHmAoAjZnLJ/SPtPVxdgkcL6rC2+UHEUcpxVdhPl8TSdg6u5uNgXpoWuN0HklN73erfZt/9
 0rauaYn/O0tt5EZ+8bnk17pxWsoVFo7KFNYbPGMHpbNjG4Trwnxqq+7RKdo0WGqCb2+ERaXZa+I
 /bsfTvOPL5sK8m7KEl7okzAS4h9ZwNe3JThVz9EuUzQgSovBgpRykBb2hVUsrOfKmOobjKd/bvC
 vn6KhMCJQSyVEHi86hNmCeDV1tvn3qLEUyET/Q2QW2vFrt6XBE+IwPcz9kMCpF1sng7RiFpcVhp
 7CjvHG0kA+sHdOcWf7M5INVriupz665gPsIFGUvYOFFmf8i0gsdoY/fuCtinJd24XBzzUnunMOI
 BI+m5bMAbFeHw8dbNfyvvoWR49USf7SugXV7qMhR6y1i4H7Bp4tBI3snXju3kvgf7WAL5TH9LKT
 vigN3kNqzCTWU8nzmpnR3ysJ38ifpVfg1gvhHZoSBLefKXHucVyDGFT9YFJtHwMw8gU0f+ATHEE
 4apm/Cx/OKp1v5MoXZ1QRfHb8yqFGUysxgCOSuKenNLp29Y9f70Yd3hQ4suOtOnoJ0DG1H5tCHI
 k4aBo
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
2.55.0

