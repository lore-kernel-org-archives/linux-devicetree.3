Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B1D3DCD8A
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520844; cv=none; b=uzbALyTH28uj33VdtiXrlosP8cxzNTd/lqP3Xk7xMJJu8ZuEg6I//2a8QxBmCtmP0JRAs9GuaML3BD99sGzwwZs5iejYDwQHkpUATuJU7BwuVAxgGfHYgj2SJ27cxFUZwdk7yADn6fqoXyQ0l1eqVPrQqLga6ZZZIR16ZlYXhcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520844; c=relaxed/simple;
	bh=OBKmCOYcz8QE5U8irX1KuYqE9atpmhfMPSWfgjZ3RMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwILK4C4ZvG1N9WSJxEWeUu7XagRnVqM/g0TIsWSIJpvyqUQDSrfH0VqTA5zC5SQ0OxwV2Rq6DmWXv20IO6bkO57jWkeVrDvvzfr2bpgOlE8ii2DFnsvH3lkZOElkuK6YWkWLsxd1AMJCPgNgcVk2A3snAn8zpYJC/ZT/eOCAEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ck2MbR+o; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ck2MbR+o"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so467481f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520840; x=1775125640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2U9ZfzOl8dAf+aGpiM3Kfe8faOSXgQyyYf9gqfmYXo=;
        b=ck2MbR+oREKht+cT2xk7/mqJfHMBew+uXdgBivX5JoIx0reApeZFLf7SdyGBmVZY98
         wyJzeenyzf1RiWYCLvJN4t2RrwZy0MTWL1UX9bAXlc6Fe9TggoPyxErd5gTURnw+gcRD
         n/AxkJ0mJGtRv37bJoIGcKusk/YhU2QyPqbfNcYo0hlwLywzCsSQNoVOOsscvNvkop+V
         5KW+BVoZ4EkOj6R71QS4Upviu+hZapZohP7+UVinPX31UPuFdUwkdLcWo5GpN4Js8ACh
         72bdG4Ih8JPMD9QMnqcyAq3E5dy1B8zGmxkGIP3Rei3ANf6s5WRWSrgIM0WHmHb1SkWW
         OBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520840; x=1775125640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z2U9ZfzOl8dAf+aGpiM3Kfe8faOSXgQyyYf9gqfmYXo=;
        b=lklVbwbjZ4EUG/bDwzOAV8O+NlB/Ng7VzF25Qo78KF9Xn1zp0dTqn+pCx5LsrHe8Im
         tPk/L43lW+XCnhXKSccHkGzDbmJuuxfU6hmu18dw53MzOMn8dKSzkt8yF0Cm5RfvaHAO
         9LE2YeoA64eXBeYYCnKhbbJRhCtqcY+ruK/W1fzOaDYR2djAGbqDaX+gD/31WeJvy1b/
         9zmEywftISFwF/eGaRC0UU9o2rN0XnfoQ3oyfaoPJBIzLSFsjHoHBxUcHXvwcCSQrr0J
         Y/hiUafGO2wUvbKUZ7XZWk7z3BoVVdh0cHUa7e6ZcfgsftdPukQX5OKptFq8aJyGLXdU
         /7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW3gqriDW7nCnCULV2Skad2RpDPrQPO3TtLn3LkCAZN8mnEttG6kwuAcnQgQOREhR6Y+r15T3OuAIG@vger.kernel.org
X-Gm-Message-State: AOJu0YzSyQzjHWCbDgRHqEmjoV685Sdi+uBBqtaAtBq8/LqViTdQbcVf
	8w11Hg32B0J5F+0hDAo4VQw2aY3c1tAwos5DH0DqP1/q1xyw5+oA8t/f5hMgZeAusNo=
X-Gm-Gg: ATEYQzwafkJdrMurgl0c/0Z/zOhWG3vyK6HCjZfIZhMmLa7s+ynd6spiruRgLzmZKa9
	Td5CJXjVZMOjD/dqobNPgt6WnUGED1xkq1kIGafjSP0YgcrCIyXMFSU9LIftEaj5/ZICMShA5Hn
	tCxHQ0W0vcxeJ1Q5xvi/9yVTT5HflWTqBhBbVvZf2q8mIyGKk0k9kupcx/bS2aA5BlTHBPkrsmC
	FmEEksZo9RbUfT6x7YTn9io4EyGX+hp+jP+nGSpzbijslGU/EQIJnptLfB+AuZpYEQu/S9Ox9E5
	RolFARg6KD8u7c7LmlxNdglCMMV/dk43GsdYpzhnxx7NzQoGEfIR+qPx7u8HiPbwYk8CSU8GBGz
	E5fcP/t4X+sHxzkgBRSUlsJgXC27kecJn6PKNyDwUUlslbnlgSpGNgiWuPegKkFNNo0Dj7NV2t7
	WwEBwLhraWFzRgq6vLZRpW76VJ6wcJ+12Uig==
X-Received: by 2002:a05:6000:2c08:b0:439:fd13:5c48 with SMTP id ffacd0b85a97d-43b889f5701mr10757525f8f.31.1774520839874;
        Thu, 26 Mar 2026 03:27:19 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:19 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:45 +0000
Subject: [PATCH v3 08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-8-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=OBKmCOYcz8QE5U8irX1KuYqE9atpmhfMPSWfgjZ3RMc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQoc9Ov3/Wx1VhsZLMFlhP55eRCY2MI97EWJA
 hNpwpGRY3GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 OgBRD/9Zgqn5dJDotzB1xBcyxR8G6kzFRw0gc4AhShxrlSmMDsSf6+YpDHgguR5rya6uYyAAeMR
 NIio7xAa0CjJCBGKr30Qgjc1sS9ndbfforRZH6NzTDNy0gMDr7PEU8OSHR1Ep41Er0IiVkOif/7
 Zksah3iqGTPlAG1qkufOZzK9yke+JCuJ+Ze1Zvleqdg8sweNSYwjZWit8qQLjXRu90+A6D5VNmZ
 Bl3avuftn3Y8Rdv8Wf1V+ci17J+YwuQSiGDGSW4wF+ErTX8q+AhIDjDTWydwGQ+kIojHkhEVSOE
 RH93Q9X5ZVIWRSLqxtzTUYvWDFkTX7hLAVtCl2asOGUcqstDDp2Pj743kOkCnTVW3PpDuFRKnq4
 ueeVtuNjdNqVHlE2jFaSLlYdSC2a/65x6zFxRIz2JBA8/06MamqpuxoIHNGMWUeKrBD+lAVSM6O
 ePA0mA0x5TQ23GKEsHXhaJos0NHqBwwM5LE43PRnmgZoXqCo4EqbTfVhOjKz3/5ttWPZ5XyjrgN
 y6+MdlE0NHB8bGYR9hyyw6l5NTOy89h2z6aTJchPlmL+Hg5xRKhOFqke3cMSufgKUdnBC6Vzj4H
 cHo+ceqCfHrhXf9GjN4iviMEk1mkncVxj4BjgRtUzqsiFfuDfhI6urKH7I3wNnzTzV8t+or39jL
 tZcclvGxyCmPaUg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l1m_1p2
- vreg_l3m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index d6472e5a3f9fa..f10dff1da7f8e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.52.0

