Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C12751AED0
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750374; cv=none; b=XqvJvKnmt++BhBxBixvEPbxdA/ydU0D/gtTN27hI60j3zRsI6BNTtdTjdK3N3090jGx96vr8d326QDVQtsPAwyGgj/0vPBAFfedXtCeeIkulAAPcYK7YJLf5Q0neFN4UYadb5mrd1IIyrBZXFZLfaCVOoBSAev2ss6lM+qEiujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750374; c=relaxed/simple;
	bh=irc5KYR38IOfRRboX+pEvk8I8NbKQWukGj6S5mf7trQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tESWieKMq/+KfD44sErgyd4wVaTRHnuEwK0rJuTHUBjwixP5T0kLaXIP76QhcFuEPrdBxwRcfNDR+qt+IpaFuu9RemQUYJZPeRglA9OHE/5a7VxuA1qk9E27rd9pyMaB4A5EAm9Ow4F1W7ojMElvpkfG+dN+swC3t2lOgLEIhB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=xIc40cFB; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="xIc40cFB"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109f067eso91821685a.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789750364; x=1790355164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6nMczNQ3DZBT2HE1Ncd8RUTZxVgA7izY3+gfm5mgsI=;
        b=xIc40cFB9r9Bciz3/O4jgdF/VXwoJqm+LTi8lZW1dc0eGceLGmIkT4hmPucK07HAjl
         ftZnHchBWgdG1SVWQbHWckNGvE5Qchsyr9AV9DTLN1wrWj4rmpvGZMjQklOiiq7I/SgA
         1wr8+91908TJbhbMkN7D+Y29hDMKgtQ9n3CprcyUxVQ2ZKx07ATX8zL1oG0s0TpnndSM
         XvrsurvY3gxS7iKyNTV9teaXtFqpasaCt+vS0e7uGLUfEA2Rm14zKxQU0rWoHvouPGiH
         YsmbqSgoe08avt5OAbRT3hT9RLgNtxewvy5jkWD+tZ8dqzii58nD54d9Ts/Wo1yzKrEw
         F5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750364; x=1790355164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6nMczNQ3DZBT2HE1Ncd8RUTZxVgA7izY3+gfm5mgsI=;
        b=S3y5VA1hJC+aRWl8tk1pI2qGFyHMG8roS5Th2hBWmdZ494Z8mhSlV4vPO38GmAs3Tf
         gUWjgllYMIwVSQ0ltGG9/Tf8LM9+eF1PcexOY79sg0NMa0An02YKv4wFWisCAyQe3/15
         5Ik2nLrkqp8Cg32sIhakCVWbkE41/pBVJdlAW4+uTwIsm/JXXwibQ8BGLH6JqDA3cfAV
         Y4kwxHw5n5B3gtl8CALJv+YAQW07b3gT6Pql2LcHd3o7XQQatxrSlbjk0eDv/lGYht60
         KnFQ+rsThWLQZcl/rRNzLPrDis2aFdHQKF9KXSSVwhFuCjbe8d96dFh3eNiR50qpvNKm
         vuvA==
X-Forwarded-Encrypted: i=1; AKwUvBwue2NZ7uIFnhVl8awyxNUFHPosE/KINhGiXtDIwmzUtDKFKjAqrk7BxLU5anpGx2ZLDXqSpLsNEfpP@vger.kernel.org
X-Gm-Message-State: AFuF++nAEqaCQr3DKEXmI0xrSjQOl83C9bftZ2smXYDG9+tySQjRWDbE
	y/xEpQakzKQVWOVt7PEtNx81PnmiWp1TSYU1rIgxHBmgXeI/WfWHJ3UZ624tQw41hIc=
X-Gm-Gg: AYBFou19Pmn1xU5kXT5GxwDn62VHDvaAUIOoL/XBOpHyehFdNkjmh50eQllY4KT3YKR
	tDhoYtHfB6KeYrp6N4Va/Zht77ABvR+GLG7G4w7y+Q+yB5vrPd31GjKdHhCHvHzIVyWa9iNWvLD
	yfrUQm4alFbx1O4LBy2/az1EUTbZ8tfl4ymU8pK894FDV3yC1pOodWl8/Kfy0qToLzUTqEGwau/
	uqEJj4XUk8wSODtUdKWSxcmZsJVr73nsxw46cPQFEoeax6eO/gy4z6/2Ct0WD/pVAoCRNJxI1qz
	9qN14fbVgrvNPKzCn1QrkSLx7AJfop3fjiUqaYG9K8LWAG9tkKbMRcaVgaWPObAkGG5b1so+umf
	JxOS9STJlQfFjosOOSVLx3nFOnGoOCnfH+lAMSBA7ik3HmluJkjaCDurSXXc0RWZUCun6SJf6uG
	UI/JPF07s9YRI3VtLOZldp9CBYRk05s9O4jtPTRtbvnk5FFTBUe0n7ER6KyV0AkXtid+hwjUC1E
	CI=
X-Received: by 2002:a05:620a:a40f:10b0:93b:eac0:ddd5 with SMTP id af79cd13be357-93beac0de5amr98270485a.51.1789750364309;
        Fri, 18 Sep 2026 09:52:44 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0762dsm183582785a.39.2026.09.18.09.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:52:44 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	p.zabel@pengutronix.de
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller
Date: Fri, 18 Sep 2026 11:52:33 -0500
Message-ID: <20260918165234.687224-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918165234.687224-1-elder@riscstar.com>
References: <20260918165234.687224-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock (and reset) controller within the TC9564 SoC is accessed
via a PCI endpoint bus through BAR 4 of the first embedded PCIe
function.  A syscon node is created to provide access to a range
of memory that is used by the clock/reset controller and shared
by other devices.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 22 +++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5b7f5292a8864..a99ee153e2473 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -9,6 +9,7 @@
 #define PM7250B_SID 8
 #define PM7250B_SID1 9
 
+#include <dt-bindings/clock/toshiba,tc9564.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
 #include <dt-bindings/leds/common.h>
@@ -983,7 +984,7 @@ dev@0,1 {
 					 <0x2 0x0 0x0  0x83050100 0x0 0x4000  0x0 0x80000>,
 					 <0x4 0x0 0x0  0x83050100 0x0 0x84000  0x0 0x200000>;
 
-				pci-ep-bus@4 {
+				pcie_s1b5d0f0_bar4_bus: pci-ep-bus@4 {
 					compatible = "simple-bus";
 					#address-cells = <1>;
 					#size-cells = <1>;
@@ -995,6 +996,25 @@ pci-ep-bus@4 {
 	};
 };
 
+&pcie_s1b5d0f0_bar4_bus {
+	syscon@0 {
+		compatible = "toshiba,tc9564-config",
+			     "syscon",
+			     "simple-mfd";
+		reg = <0x0 0x2000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		tc9564_clock0: clock@1004 {
+			compatible = "toshiba,tc9564-clock";
+			reg = <0x1004 0x10>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+	};
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
-- 
2.53.0

