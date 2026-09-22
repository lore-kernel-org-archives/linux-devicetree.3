Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E121537F33D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042299; cv=none; b=dmMiXo77FcoHKaJDH5tbE1sONLZi9BQKYpMb0varFdF+Z6Ixqw/cWT74JEbqwwr4B80juNQtQTZcAitVpEjEPQ+qiI29aUKWBCPLEa1HgjLghlEI5sY5uizPRAL0ql8ohqKmlnpC3Eb7ULAIrtVtmApl+0aMiyfyvvWWlUk8YQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042299; c=relaxed/simple;
	bh=RG5DQCHS9F4G7rBZA/5y8YaWKSDc+FBjx107+RMUuW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqSBCl/P9Vx4SneV3Ft3kg81+caMztqmQ1nzprtY6M+PZIn9sn54Gq1Xf0vYsw0oZ4SkuARtyzGsq7eo7tPOZu5zEHc5SNW3fjjWQLxjudfn7gqQlp8T7ZUCWXMVXcwNjiPXrTWzIJiLRIPW0AB6HJs+VaGaot9+PGfnuA6B9yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFOkwrjx; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFOkwrjx"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd3208so34029726d6.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042296; x=1790647096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7OWe40rH1taU9GlVBHAdldtniDewW9TQkAorsEsmOGE=;
        b=mFOkwrjxD//wVuvKfCNaVFmns05hrVXSUXTFnJkL3vHJWy22e7FiLkN3AgoeGUo334
         5/8DNhhKxtiRlP2jSfsGIUxsqlQfJgGAKMD05pu4OGisJHJ1wqQuGz66wZllJrGa4yFh
         44hB1mEgCKNBFvbVij4gMzKlrALDzU/gBOs1SqBP8zE3ndzkjaPODFhpCMab2LcIhYpk
         zCCA7gxz2fPPmiFMvKgFku+YUPr6KinKdMDRBJkX/A92f4zY3UoxZ/MXr07fMEOdh0fX
         wJW4LnCzdjv5h5lH7MPMb8g+5uZVzZPZTjxHnh0PpYQhM4gJEAfFvzWMecgdx3vZKc0f
         Imbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042296; x=1790647096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7OWe40rH1taU9GlVBHAdldtniDewW9TQkAorsEsmOGE=;
        b=SzNL8/N7uMf66f3X95j6yJD9plGT+ydYO9iTlZyhavsJj6ikC8opR71f+Lg84rK7ZZ
         85LEKPxB4kyN5uiEPZ/FzWVrmW8guc0MNb0PK5V7/lzHSyaAoBvPqLF8LW6pEQE/8QcU
         Yg9y1FR/dR1uq8T8nnEA5ubRvz+b5+KLRVF+NLgqhVyJyXUeH3LH/eXQ7od79ATbbi7p
         7Gd5LlLPRtV+JKzsrmZURaVrsG6WbEzV5iI6N2lT/MrG/WZwy0sRa7kr3gYMhlK3b3fg
         KKuDfcFbemutTsiNT0jxzaLtsZ/a75b18/nN5bnJbtvsvzqiSDawdqomk2SVPhl5HaJ6
         6UFw==
X-Forwarded-Encrypted: i=1; AKwUvBxB4XLJz5lnkdTpdJegj5K6Yshb12B+3IZ8NBjME2bSsO8aEtr5qfrojWML7raaa5gbqCNkOMGfbUND@vger.kernel.org
X-Gm-Message-State: AFuF++kEJ1WJ0XSdw8ljyDuZTP6ZW0YpOUshk6vBnD8P3kYUUDQ3Uzvu
	kwgSikc0iNvOoBGOUhI7ts0uuRK4+AWQgmi+rcVIqTRHo3f0cbN2FlEC
X-Gm-Gg: AYBFou1lWwv0/FCu3Lz/RxaSlWWpglgs8muOmxDflwLazpIGVq10JAM1M80A18j/DRC
	nHJ5+x7UH6a/lJugKAOoTibbEKakCHP6T6R3ueuoSLN61ifquta60CIzO8nkKMSytVd7kTQU3Hx
	YZkDQo7kZDq5oSYWav8sgKwmMU0jcu08VQwF/nthq5lhJUa+bUPNNZyktoSH3wcAx2ntKYBpc23
	cbuITiFpknuFQ/FmWaNhTBitCGfeN3IGImAGbcHBhzBCDCBAQ/E3Tgfo9KZfzbwImYP3b9eorg6
	whl1NoHhhWzHc79V1pY22xCpCLCsA1qBzoCAShO0cAb8Llysez/DCk6m01SCPRbwBrbNKhk537E
	3mMLaOBe66EDpEU8/aJadas42uzxH20vhMHDnedC6toZDuTI9ivgi7lwvShvOA3Lmnsikdm8ab9
	doBkXdeuwq0ZMGj92wR0W0gT528ANEkwVMLOTWLAlrK2G/9J8bEflTyUWfyt+8QSdiwGD7bTRXk
	ieKRAr8poiz
X-Received: by 2002:ad4:5c44:0:b0:910:44f2:5ce3 with SMTP id 6a1803df08f44-913fc89c785mr36516296d6.8.1790042295786;
        Mon, 21 Sep 2026 18:58:15 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914023b40c3sm4277166d6.2.2026.09.21.18.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:15 -0700 (PDT)
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
Subject: [PATCH 06/11] arm64: dts: qcom: sdm670: add adsp
Date: Mon, 21 Sep 2026 21:57:56 -0400
Message-ID: <20260922015801.32373-7-mailingradian@gmail.com>
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

The Audio DSP (Digital Signal Processor) is responsible for audio and
sensors on SDM670. Add this, along with the SMP2P nodes used to
communicate with it.

The sleep state is included to prevent the following crash:

    qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal

Otherwise, it is unused.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 175 +++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..3856431fa587 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -500,6 +501,40 @@ cluster_pd: power-domain-cluster {
 		};
 	};
 
+	smp2p-lpass {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+
+		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apss_shared 26>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		adsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		adsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		/*
+		 * The ADSP crashes if this is not present. Simply probing this
+		 * magically prevents the crash. It does not need any driver to
+		 * interact with it. It is labelled in case proper support is
+		 * added for it.
+		 */
+		adsp_smp2p_sleepstate: sleepstate {
+			qcom,entry-name = "sleepstate";
+			#qcom,smem-state-cells = <1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -2111,6 +2146,19 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,sdm670-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x100000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apss_shared 0>;
+
+			#clock-cells = <0>;
+
+			cx_cdev: cx {
+				#cooling-cells = <2>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm670-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
@@ -2191,6 +2239,12 @@ gladiator_noc: interconnect@17900000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		apss_shared: mailbox@17990000 {
+			compatible = "qcom,sdm670-apss-shared", "qcom,sdm845-apss-shared";
+			reg = <0 0x17990000 0 0x1000>;
+			#mbox-cells = <1>;
+		};
+
 		apps_rsc: rsc@179c0000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0 0x179c0000 0 0x10000>,
@@ -2301,6 +2355,127 @@ cpufreq_hw: cpufreq@17d43000 {
 			#freq-domain-cells = <1>;
 		};
 
+		adsp_pas: remoteproc@62400000 {
+			compatible = "qcom,sdm670-adsp-pas";
+			reg = <0 0x62400000 0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			memory-region = <&adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				label = "lpass";
+				qcom,remote-pid = <2>;
+				mboxes = <&apss_shared 24>;
+
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					qcom,intents = <512 20>;
+
+					q6core: service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1801 0x0>;
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1803 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1804 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1805 0x0>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1806 0x0>;
+						qcom,nsessions = <2>;
+					};
+				};
+			};
+		};
+
 		lpi_tlmm: pinctrl@62b40000 {
 			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
 			reg = <0 0x62b40000 0 0x20000>;
-- 
2.55.0

