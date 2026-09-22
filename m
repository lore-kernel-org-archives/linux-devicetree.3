Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB4C37A831
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042302; cv=none; b=JU8pU+Mc2faVj4pvD7Y4MpO4qTk8Ln0EXBlYyTvkY0I1bL7osG/i7S/85qTaXyTRA7XgVWGNHeQZfHbMlec0LhEDaLDjEngQtE7jjAaKm1RskAf0z9c+lionSQfU6/K1HThE4yaCLqY0U+bVwVHZenpyFpNq/M1o4nLwFAzxIZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042302; c=relaxed/simple;
	bh=gDFlDPHKvB5UrJOY/d9xbC+0rfJqIM68fcYxbTOT5zE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tI8rcVBPq0Bua3u0ThjEg5LBW3CNT1nyLHifeakrZv2VBytf23AHa+MlCUoxW1zbDzyA3g7FijJ+/zm4VROfDHBwtuVDI2IJM+eevMhfY/Leg+XJf2AKFZCwA6es3XvTqLUMZqRVLP2uVvwf/HBYVTguosEeKJhked8JN5GkCKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITe2D3r2; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITe2D3r2"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so202456285a.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042300; x=1790647100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MppgOLxRxtLFdr/NIxv7IEXQMdkqFQGwIdxdkg/37Xw=;
        b=ITe2D3r2EyXCD0Oim5MrjS7FO3Daea0DZO5/d5vpK4UE8ZOqGyJ3c2XiFe3yZLBTnC
         XwROO/g6XRsHkMn77FqkdGwpM9ZkRF02lmFXKI4euTdagTLysGLbzcAP+IBsUOqpWcvA
         91NVFSvm3cgAKOtSgY/pQQYOIyoXtW7ZYgdWyKps+vvPnaqpR/kajjxd4wABj3rFAqTA
         MdEzPTZcqNURDHfp9kMudct+a1kAkxDjqTcr1Cd48b0sKJ1xlKFukiyPnBHHKkAohzTb
         xUXqqB0pArL3AaIN+rfsR7M8ZhJn0kWDlkyxm+yMW8Qomq3yGH6TcYGV6BjkOb0uZ0pS
         Gf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042300; x=1790647100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MppgOLxRxtLFdr/NIxv7IEXQMdkqFQGwIdxdkg/37Xw=;
        b=MVwIM2RY8jYBJBm2S8+L9ldoqA+cDVrOJoV2MuUfU7c0f4BqMVvuyTrTawuVz1f7+O
         F6c1hF2FBikwCst1TCaI9mmTifsuM9XOLf9ToK4iDv3t3Lb+At4PEkCpQlqwdA/HnYjt
         RN7DpcDB60kx7KlduYx100T812jTBTeq78cgRNS7+B99a4ngRRER3fLszjXodLzfglDz
         3p/o0uwxqIIRhUTGVrTxcsXf4yWZrnfi1VYpS4MB+lBQtC32WKhtprQyjQEvQC7qlZib
         5BorIjC4qWJA2asQOwnZNGzoFaxGd0HSL2mEO9eIOVgeScdxk7SvDf1E7sneefNRMUOx
         KlKA==
X-Forwarded-Encrypted: i=1; AKwUvBxsjfCKE5FsOM5dwcSl4B2LVCZIJMVMDTYlUmpJcyv2x/rc5kaiV/5n2LuoTIFF+RTTV6C1c45zg3np@vger.kernel.org
X-Gm-Message-State: AFuF++kxGVuXN6lKq1k53PEZaCJaphZpFvKJTeKjVo48C8lHg8PhS/jx
	pJe4tXDLtsE3kpiC0kD4fko0ZOZEnwYbtXW89uujsA1GHhO1fmWBd6vn
X-Gm-Gg: AYBFou1cGmhshHh7XCTkQpiSrmxL2rQBSWs8zXvf3B38ggUmBUxxE4MRkCIM8gsD7XR
	0cyBI1DGf6KGQHC/t/Tiu0OLTBv2A091KMCuG00w6IYWRypAaVfaUDTBKxgdLVgOor9fAe5HXWM
	lKGwlT9nReWxtbHvPbJcmYEQg2b0NomrqOPxFVTF7KR7tKr3eZnGy6S537Ocva4pFTGwWAQ/gkC
	6vfg6uMF/9FwPUEs0czPE7QzKLM++SkLgCc5VbBeDZiMMbgsyCclcU1lSSOTpkfkZjSTLBCMh+2
	h0fZj9aVoIb06kQZ+dgfGoP0lDCVJe2BLwSGFQdxjRfeRvNAMIKNF2Rr8HbmjPSbV0qb0R/fvFh
	Q+6hxDi4BgEa4Yl/rST2qfu2aJMz7T+faqwb363mE9R5XexZvp0IXAGx5X2LXONXNYwWYGhZ+no
	ABgpM13kBnwPi69I900ltuPf+oZR4ThM6zClDZ3m9pNcS8lzyDy0j4LlSs6RrM7d4wIoyUHydaW
	w==
X-Received: by 2002:a05:620a:710c:b0:93b:d79a:c46e with SMTP id af79cd13be357-93c15edc3ebmr346369485a.70.1790042300346;
        Mon, 21 Sep 2026 18:58:20 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d21658csm15794085a.34.2026.09.21.18.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:19 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 08/11] arm64: dts: qcom: sdm670-google: add sound card
Date: Mon, 21 Sep 2026 21:57:58 -0400
Message-ID: <20260922015801.32373-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pixel 3a has a sound card for built-in audio (RT5514 and CS35L36
codecs) and for the headphone jack (WCD codec). Add the sound card and
q6asm frontends, which can route simultaneously between the RT5514
microphone, CS35L36 stereo speakers, headset audio playback, and headset
audio capture.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 70996b94cd33..3abde2cbf746 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm670.dtsi"
 #include "pm660.dtsi"
 #include "pm660l.dtsi"
@@ -127,6 +128,46 @@ debug_info_mem: debug-info@a1800000 {
 		};
 	};
 
+	sound {
+		compatible = "qcom,sdm660-sndcard";
+		model = "Google Pixel 3a";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cdc_pdm_default>;
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		mm4-dai-link {
+			link-name = "MultiMedia4";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+			};
+		};
+	};
+
 	/*
 	 * The touchscreen regulator seems to be controlled somehow by a gpio.
 	 * Model it as a fixed regulator and keep it on. Without schematics we
@@ -632,6 +673,24 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+
+	dai@1 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+	};
+
+	dai@2 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+	};
+
+	dai@3 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
+	};
+};
+
 &sdhc_1 {
 	supports-cqe;
 	mmc-hs200-1_8v;
-- 
2.55.0

