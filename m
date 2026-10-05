Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F73544D020
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 23:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241783; cv=none; b=Xq+/t6TJQW/1KCu53OF+U0+QBOvK7nN05l7rAKWOIlKYrdAyyYv8muCU+7VmuCExKL7+SCsrp83EH2DNrnblR1VIS5PRionbZSBLKP20dn2BzQasWu8O9k67TIE5hfeT7VL/LlT2tr0mLsUSYbFL2OWU5TVTJ8ja1c/sdxRqB1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241783; c=relaxed/simple;
	bh=/AAvWo1J6z2sYibfwsFEqu3Dw+2dMelgLGyjwq4E2Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESZGEuMrWZb6QjMaEK157zLS5bHgtD7e9V3WsY/3afJbPklezhlsYeCUmLJ8XYNIA0GwlgfGCs6klxa+EfW7TRpsV7bEmQJ4cm95eZdqViyPT/TEYds/Dg1q1TPmZBUN5IanouO8mkFm1qFNaBPge8LkAMa7FGKzw/kTWzuFXJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Qey1jCR/; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Qey1jCR/"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9179b0d01c9so10305206d6.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 16:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791241776; x=1791846576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRsPZfj4o0AaxHcigFcqZvl1FbcpyXSM4myZ2Xc+8a0=;
        b=Qey1jCR/dsdT0SGX72RbAoma+kH7DnC8nj94O22u5JmGn8PIbNbRKfcwNAaYC/zUSO
         ac5iqGHk8SZum7aJ3QNi2XsemnwLPuDgPRI5qHHt/rVVXM9sOpSE2OTA3/4X32S8NQQR
         zlo7CTaFEPwrA4E1QRNhuCCWP2dz2d38TQA4E5TmA4yIRTeC80qHW0ZjNfTj3W872aOf
         OFP9CsalLYaTaywE4jvnnrlEHg2D5twalTjB9FDIeEoVB5JObaMJScUw9knwSQuwq3xg
         +Hxs/u9R1hBwwyljxe2qnTGK0rgwbzHC50QI00fvHmTf5G2EHudR9zAAxpTQjP6toe4x
         +CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241776; x=1791846576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRsPZfj4o0AaxHcigFcqZvl1FbcpyXSM4myZ2Xc+8a0=;
        b=mHC0DDfYmnbJaXGNZSIq4/o5VsiQg3Yd3z0glsLlnxQp3hMu8soV0sMxviZU7y/+0F
         qcWtqciL87U/bFKb+AtQ2jFOsl+nRWvVzleZ5RLKQ//yfSvJThU1REz3ZsZ65+/bJnjy
         6fj2jm6LDPWl65EQFigjnR4Q5TOjaIizwQEq1s8y8D94CByoDsX0ZBPjKAzuFlWJMvCl
         q1OE0DTwBLNCKyEi5Peslt8z2Ld8lVtr2YmOLUZxT0t+odsZttWlZbNXLpY5tAasdisi
         DbM+B2CE+PJ66VxjA+3xQOCP8yX5FRMoNlAB5yekfnZb6gj7m3+PDSPrz0Whj9AmU5xS
         bD9w==
X-Forwarded-Encrypted: i=1; AKwUvBz72hB3W29LVDdLpLr4RaQTOghjsMD4lW4uqLo4DlfeXu3Lzb6n6WHNzfCcK44YOg5K5V0zbLqNMJz+@vger.kernel.org
X-Gm-Message-State: AFuF++nvqbNRqxTrLm+B36S7fFBwOHTtDDxVA2p8NjQ5Kyx1mkqfK6LP
	OyFeKIopH8UgQ+yG7rr/biyOpt1uvcPioTvpYvWQxxhy4J78Gcmvdf1GQ2ajTlQR8Zc=
X-Gm-Gg: AYBFou0zBfICNKgud+lApCXd6Luvn2CuYu7Z96mLXmwVa/lpENvgOVsHfb6E8+nDwYO
	l+aHtiYJs/9iFmTxJwlhGnl8ixbptxsA59ZCFBtSd2p97FPkXSKm4Rw+AOOhQ1imAnivUGzg1l1
	M+UyeGDOxnjqb8lYxTd0XKNd3OYPG0X2J+DsW+/0ClGS2PrOiwyXyP4qd2Ts1zyozBgIi+nyCh6
	4+Ed8as/CM4Yil2x4m3x2lvP+RR1P7MZ9ZwqZaoh72VJWTFB4snKuxohcscHk3WNEeefiWpRz7J
	1UKipWyHWh77BmtVsmY7VImpVpqL/BpYYTzwFT7/VhvrfoqhjWkb8sIyfpvQ3gr36mIOqXT0B1e
	Psqw0x7Pfl7k7uUWD4QffeBGDi+NdtqJTmFZyXo4/0SUfkAAnugUTs94dpNYjyss4EfNqyDpjtA
	cvOyF8SsnIxelfrcbmvCmcMYv4klT+9ALAaApDYtwSsRzuQBM05q3dZFP1pPK2K4QAfH2mJMNMv
	M4=
X-Received: by 2002:a05:6214:da4:b0:914:3120:b7c3 with SMTP id 6a1803df08f44-919856798cdmr21995916d6.7.1791241776096;
        Mon, 05 Oct 2026 16:09:36 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-919442ce1c4sm89892116d6.3.2026.10.05.16.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 16:09:35 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller
Date: Mon,  5 Oct 2026 18:09:26 -0500
Message-ID: <20261005230927.2000398-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005230927.2000398-1-elder@riscstar.com>
References: <20261005230927.2000398-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock controller within the TC9564 SoC is accessed via a PCI
endpoint bus through BAR 4 of the first embedded PCIe function.
A syscon node is created to provide access to a range of memory
that is used by the clock controller and shared with other devices.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Moved the clock devicetree node to be a peer (rather than a child) of
      the syscon node

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0e3bbdaf4661f..06246d185b50f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -9,6 +9,7 @@
 #define PM7250B_SID 8
 #define PM7250B_SID1 9
 
+#include <dt-bindings/clock/toshiba,tc9564.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
 #include <dt-bindings/leds/common.h>
@@ -961,7 +962,7 @@ dev@0,0 {
 				#size-cells = <2>;
 				ranges;	/* This will be updated dynamically */
 
-				pci-ep-bus@4 {
+				pcie_s1b5d0f0_bar4_bus: pci-ep-bus@4 {
 					compatible = "simple-bus";
 					#address-cells = <1>;
 					#size-cells = <1>;
@@ -989,6 +990,19 @@ pci-ep-bus@4 {
 	};
 };
 
+&pcie_s1b5d0f0_bar4_bus {
+	tc9564_config_syscon0: syscon@0 {
+		compatible = "syscon";
+		reg = <0x0 0x2000>;
+	};
+
+	tc9564_clock0: clock {
+		compatible = "toshiba,tc9564-clock";
+		toshiba,config-syscon = <&tc9564_config_syscon0>;
+		#clock-cells = <1>;
+	};
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
-- 
2.53.0

