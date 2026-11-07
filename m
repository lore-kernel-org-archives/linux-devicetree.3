Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018409;
	b=GLmIp0lnj2yXLPc+cWO5XbD0CG87YIo/CLgKkFQ1ElKUszmn72oIkp1eZmOSRIrvSCKj
	 tYH1VihEMcQtjLl6ywQ0f88wauCb1omgkGRO+6W2SpzEDbx6ZWEvpS5MIRzHOtISPSq5t
	 QuZxYIwfWg4zbg5mISfRAz9qGDoIMuKZN3NB5dx63QJTlZvkKvwkZWdKfs+2UOBRMRVrj
	 Gu1mpxBbn8FdZg+n1OUpd2QNof6Qpebofq1MntWapCCYT7+0e5X2sLzFPtxX0xwCrOM2N
	 irqelySyAvt/kYkcR+jd6cvreBiIXNeU0pX5ZdP+XhyrW2ekbuMNx6ziUIIu/up/ERA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B7+2bs1h7+qzvrMEtIoOvT0o5eL+5r9TpcyjfyV6bAM=;
	b=bVt1LoyUe3HmSRdNiQw9AaThtqrQDx4zza/cFsRIZlnQr+qbJT/UbIfXfQI43UjNHAHw
	 XEONxlAsCyKqlg2t8YhZsaBNgIqS/1fzHUWWv+idbIQsQugllzYkguA1HGZyBLjqbN1Sg
	 sAwDdgJvwfPp/waKdOlRnv4U1kruyOXJmc3eBjiQRBEtu8TkKaLFNg6hVfDKTeegkcfJl
	 x4jpFHsh8ACjXAUPxlD+Hg0iInooNGyo93TWdJSHpA/iHY+UtbTnbBszmzLcVG5K5Si+j
	 oUzw5zxirbaMj/0HaoDxGUIktfXXW8XLJRUbwvOTb3R963xW6FcSRci0wiT+OKYB+Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXoM+PVE;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894DC606A32E
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 894DC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXoM+PVE
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-99071945aa7so650830241.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018407; x=1794623207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7+2bs1h7+qzvrMEtIoOvT0o5eL+5r9TpcyjfyV6bAM=;
        b=tXoM+PVEIEMNDbySzTyNRv74+GqQx/TyqC/EVz/BxnMoX18SthD72GQq4Bahq+E4PC
         CEUsthwvDrWJ33nOX2l3rUBOmJlZniNuTAiq0CKnyl6JXObCYwB3eOCUA8DUATNtZ+q4
         G/l467g60IVwelFb8tOOQti8G3eAEoKFTML2xwujA2gzxw8y9JWQp7HPcqcud6XXzwEW
         hs3CxZEMttVPBc1rjn+HUmxEh7n/OmXh7mgXJe2l/UzjerXW1BpDBiOkdvnYu7xD//RQ
         /jWRorV/WABXPpx8siUDxaoeexxpx0NZ1I6JR4edi/prLt88t/MyUg086Sh0qUiY3Wdh
         xTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018407; x=1794623207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7+2bs1h7+qzvrMEtIoOvT0o5eL+5r9TpcyjfyV6bAM=;
        b=PVDhC4gvr/ctRPKWc6UweHSoVhVX3Tz/1yULAXba4HCS9YVixcAj9WHdce+V5wQH8A
         hsACOGM8mkf14cSWY9EOZ0K2JkFPSNNaFLHx2F+UKUuUE003vPbVsau6DoWoBx3Hvn9i
         up4x6WDQHOMN7iMo+nl1prvXv+VXHH36YFaAqxry0n/vIQY3K+QtTRcvhdd4iJ84fWnV
         ra8ZRuN+2QH9XSaxm5BYKbKZbWJNI2QNx4xkolNfT2IKb+srYkSowV/6WVEX4bWhL/M5
         xjuVl+6wvGQEFmqJpJ3ICNCAF3aenEuGI1HqVyW0Grqgu5fmrWxKW8yddcM3yqLF4s6r
         HdFg==
X-Forwarded-Encrypted: i=1; AL+hErECW0jEdSJKiTmX26un7r9crBdymGj6LjeGTVyKvy1HsexARQqQcjg7JZdkxEmpPDoKjNhUyeVX+vYr@vger.kernel.org
X-Gm-Message-State: APuU4Z/GQHid5+LHQ4hWJhSFaN8ET0JgYtFNg7BiPjDLUQ53JUs2AvtH
	JyRSimeH8sAMym147RuY53nXzlXsI6aTG2OI4oPWcm17wmK0OHtDlJmT
X-Gm-Gg: AYBFou38wOWAg9TiGVDEDMhNhOiymzX1uCOrYqwkyrIoa5ZXms0cc/nE1qZUMX1/2V9
	w54foAeChhOGGCP0+LDKiJAt+JmUEGwh60w72yp9+OhdbMYvsw9W4nYByqD3SseOa05K2XsKvtN
	FJpqp2SD8WGA4nsO0baFL0SvuQgq1x0WK63eldQWCR+qveZ+qJDSN7uY3kUNUGjXXiqnaMGOCSB
	5qEdaSqnFEJMD+sF0FBpF+cbhce6hKFkFcBInHx29xTIv5rUScqXU/RH13Gd0qNHMXUP+Lmgi8I
	jyA75d7FJh+LGpz3m2IqOTp8XCrhuoBEgJV9wPIyW7DEGl6bu9+gjsgSeb2mududwBOmFkRGjBU
	87eI9GcjtC6K12yyKxpqzh7Ama11Lh3oVbCYoDKl9YmQ2tP6XQlowD8yzLjAxk9DWdcyLYGZp8s
	BWaWpPx6WTCEN800CzzVzITgrN1UYR5pRSw6Kib8zrjsHQbg4qRaly+y1oxsJPGI9PmXiqXznHA
	wRLuiN3YZZpuF1dofu2CxPnxngHMBEXgYWnkQYjRlB57u/bNnEFVx/00+sXHq6hqj1AQPAIoaMi
	IK9B+gEvn8BoFsSCFd8Ood8oVSUS
X-Received: by 2002:a05:6102:5121:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7d2a15f9d96mr2571256137.23.1794018407454;
        Fri, 06 Nov 2026 18:26:47 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99baea8aeb0sm3142542241.9.2026.11.06.18.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:46 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 8/9] arm64: dts: qcom: sdm670: add digital audio codec
Date: Fri,  6 Nov 2026 21:24:52 -0500
Message-ID: <20261107022453.159341-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

Add the digital WCD audio codec to the SDM670 device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index e99183c22208..3e5ca16e3056 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -33,6 +34,12 @@ / {
 	chosen { };
 
 	clocks {
+		lpass_cdc_bclk: lpass-cdc-bclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1536000>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -2822,5 +2829,20 @@ data2-pins {
 				};
 			};
 		};
+
+		lpass_codec: audio-codec@62ec0000 {
+			compatible = "qcom,sdm670-wcd-digital-codec",
+				     "qcom,msm8916-wcd-digital-codec";
+			reg = <0 0x62ec0000 0 0x400>;
+
+			clocks = <&lpass_cdc_bclk>,
+				 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "ahbix-clk", "mclk";
+
+			sound-name-prefix = "Digital";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.56.0

