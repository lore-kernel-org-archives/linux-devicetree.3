Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2D8471252
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200459; cv=none; b=nyNfOUP5aT0lBqS4HOfJir+gIIYO7Fn7kL+3e7gFHP3M6dx3UYIHPnVGIehG0I8eDBPJ2AM2u9u2BcwTOscNXmfqiDsi+cESWiO7tRoEOWJUzMMH8aW6Opmsb9EyAyBZ2pt+s4VJrt8eYZizlHt03HiZBenHqsn159oPOSWKmTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200459; c=relaxed/simple;
	bh=rb3HKaLLxJzwcBkHRVKkVwDnPxrRHTfCEOty9h/3Dj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Onzzp7/oxTTJRjBheSz20WiyvtXaF5D5fADXTkfCzNJ/vJ0OIPYlCXWoGPsTMpsPww1XGqG/dde9z9B7Wm8Gpylm5Ty0W9sDTYNgBBBtpYu3klJ0vZbP5L2LXGas5NfH/LrGhtZd26aAtpNDsgwJZd60aOaXmz1XfendSsnekdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfFA0NNC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfFA0NNC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2254813f8f.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200456; x=1788805256; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQu21g+jvYzg+hR8nIxI4Zsc1brzVFs3c2vxWfEZwO8=;
        b=gfFA0NNClt535kbQ/Xd9ftznrAlSMXcdp2NW824ufMZp78w9HO3iafhEBE1AwH7ao4
         b1oPVNS08Ef85EcgF1xuvAxiLH9O6AK9ZVTfqW4SLX5q6AV1iMduJ9DuvzDWZmLHkBQY
         Npk8GYlRZo6ST1RjAIjUfaF3fKfa/M3Po5scpDi7YxF1hCRXl1x8zm3jxMQvvtsZd3wv
         y19QSX6t4aGmL6RXQNaNcjH1UCgB/0fxvsdH+iaDvnikc7eUM2EIKQVVGQjWdxjUDZho
         zLaggydGcqoSqBPXwgiooqjX2/CapgKPiPT4g+EIfFw2LPqE6XxY1888DtUnks9/blpG
         3fRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200456; x=1788805256;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OQu21g+jvYzg+hR8nIxI4Zsc1brzVFs3c2vxWfEZwO8=;
        b=JM5YUJJpNt671+RlTFy7LdkuHM0PsRPGP9kjsokHo7oC+qmbJ0vLcfyWbIonIjIpR8
         wZ8pWwczm4qy0C5cTeRNb8Zs2l5pnI210n0cprvf/8NuHwzej5ojr072LQTrEdVYarfM
         w5YKO20lV3WTPN7YrmYHROhmyGPwnqE0GYhz4ibvVu86QQrtoRnA9iIECCVrjXTuhQk8
         P+Oryw7QL/VmY8jQCZk/OFkww6fN+uIIoys92z3Fnzdf8ZoSQhNyahOz4SLJNjhNPExO
         3e4z+cXBO+fhoBw7HH6JCEcEk89sR4yKV7MCBS7613wgaFawPjQq7puDyisn8XwhIJcK
         6cgA==
X-Forwarded-Encrypted: i=1; AHgh+Rrag/F7V3L6bp4BBW1/Em6wPo/53XV5Ne4lUIAyGMCrlfX7QEbQ/cma5vsUEKswxUURVP5GACj7K2hN@vger.kernel.org
X-Gm-Message-State: AFuF++k/vXAEOCKZeSjqBhqXsRwyG2HmBHmmIhSG/7AqdaiVW2dWnPJE
	dJf9UbpqiPSOM5dqUtbtge4g2sEi1FX9Dk5opC+vxe5QWSAWD20v66wl
X-Gm-Gg: AR+sD110hjMSkhbtl6NHWni+2gZ73bHhSUo42jfAW5mdeCwEGhdIg7Rk+RasJLoi8GP
	9y1+c93Qp1GeI3WvZABfrjpB5ulL95CM/saWzxFHevsHeORAyQ42GMY1pTbPUp680HRCe3alIOF
	lP3X5l3HR6jrvW/wMoSzPJbr1Ka7RKljZcl3KPIQ/wag4ccvZRfZ2lsm1NivrUgo7pCLVNuCnrW
	ZvNMan/RfhWtKrq4oZvzLp92Dfh5tbcud6iBaTL9LBZY9a5gIb58OYLlau5tSb2VP1Zn1BreDlJ
	dGFXUP6qfrBwe9WERg7w38ndEhA8q2S75gxWg6w+lGNsyYeOEaNZrpCwGhPK+/6dkOn7NJpLMeD
	+u7bSMKvIHVD7Xy4v5sTScFtRFExM4b35CaH5FghQ9EpOMQyFsGFQR1wmSfwDseVaYU7XeJ61jV
	5cfhVjyx4UXhaqfCES4mgd2NEnBI5uYnFsEYtHnsz0QjYw1bPDvO3h1DzIj0xcigltRPwn3jJ8G
	QsJiQSUlBGNrXOe2w==
X-Received: by 2002:a05:600c:1906:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cdc555496mr39483805e9.15.1788200456098;
        Mon, 31 Aug 2026 11:20:56 -0700 (PDT)
Received: from [192.168.1.9] ([148.252.128.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm10721955e9.1.2026.08.31.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:20:55 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Mon, 31 Aug 2026 19:20:48 +0100
Subject: [PATCH] arm64: dts: qcom: x1-denali: Add audio playback over
 DisplayPort
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-surface-pro-11-dp-audio-v1-1-fb9c0d3216b7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ7CMAxA0atUnrGUNICAqyAGN3HADE1kE4RU9
 e4NML7h/wWMVdjgMiyg/BaTMnf43QDxQfOdUVI3jG48ulPwaE0zRcaqBb3HVJFakoLhvD+4kB1
 xJOh1Vc7y+Z2vt7+tTU+Or+8O1nUDVFJ6DXsAAAA=
X-Change-ID: 20260831-surface-pro-11-dp-audio-394503f0aeca
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788200454; l=1386;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=rb3HKaLLxJzwcBkHRVKkVwDnPxrRHTfCEOty9h/3Dj4=;
 b=0m34U2jSQLU+yNJSgYdPHWwTU3Re1UwGoq0Ng92diwb5aZgzY1W/jRL26WqpaCM9abGwq3uOF
 AyIlcCFxtPMAqxFNJre90wdlT2F0oj45p7nbB4XmDXN6oU1x7OZth64
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Add the DAI links needed to enable audio playback over the two
USB/DisplayPort outputs.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..bc8e00e59dc9 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -314,6 +314,38 @@ sound {
 				"VA DMIC0", "vdd-micb",
 				"VA DMIC1", "vdd-micb";
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		wsa-dai-link {
 			link-name = "WSA Playback";
 

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260831-surface-pro-11-dp-audio-394503f0aeca

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

