Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8926362152
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430064; cv=none; b=swdcijoyw2KuxviMixGLN14/SrmM0A0KL9iI33Yhc5QOnbp2dD/F3pfdr5xJMnYf3sHsnvRlfmoxGMvJt9AOz6qE1ZrX8wqTGwrNjGW5hn6wWvbrCshECBeOKnbd2nVGxIf1yxnfPuJKv3XfgXBJ0othfeKU+ai+qO0B7o+FslA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430064; c=relaxed/simple;
	bh=tCgf4Nxi5GVQmf8H0tRvdS3R9HxkfuZfIUdm9ZjkiPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EEmEqAKDfOfVsGjKVYCvGXAQwu2H848K/9jN5KBvVLmOxNUkkuIdHZJoAZUURnuH7wldIDJuuQpi+U4TsrtwVtXcESj4R4B32EOazslRvGxQxJuLmKDKKK13AW0lz5xhcnVLuO06bHs10kzfIF3vCqJ9xidjl5xWQJ4YHfABDs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/jJTGtL; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/jJTGtL"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3697c35eab7so4051493a91.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 23:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430062; x=1780034862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtlQB08OaLofyAigz7tBTikvmBp8Je7frCtpNBxUmSE=;
        b=p/jJTGtL3ye+b9h/sg5DRBBTWW1e5ceeLveeN/YUaOs5S13XotJ4g+QUBax7ZPqeOl
         AxVXQD4ThW0lrhic0EuVq27VI6TLwACIrm7ZESGgF3ewTzXxQV9BYqEAEp6v5r3NhSR6
         JUVyTtRu2CySeZmUNjKr+jsOUnR0ZyfOe+65sQmxfvX90gP1B724dMG9MyWM8VF4wxwd
         NPu+HaLUTcl8jrbet/R6FfpuQRzqWNS8ukzFC53a1BLjwpjyr9SAZ9mXrWu7eDt5gObM
         p8X5IO+3r7mkAWL3VuqqqdUF9nlWvIi95IIAg6eqJp9vjQtF2xQC57JMzNgkCJojnuKa
         cC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430062; x=1780034862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FtlQB08OaLofyAigz7tBTikvmBp8Je7frCtpNBxUmSE=;
        b=WqecD5ovHZMSRtK4o8Q8MnOU1CaeDnHi7la1RCYMWe1W0QfGgdUdAK17oNNMmdmzdB
         1jimULM6hCP0DMEFA7qAu3hs4hdauQrxbJEnTIgDiij/NxllfEhH9Iu2uRMkL4fERdX3
         GtlNvHGekd27uEVC1GFvuSqO7Znn35SPMjG5EIb+aBJchZlRld+FZkkINf1X76PZ4+Fu
         9ENETbuqUkC4dP6D/m/ffQL/FkO6XufIwOQCmRJ1Tfli0XGmP/P3SbRAa6pW/m3ClytB
         qN4y27ubN0giD7YxFfcmlcXsvqEi5fd6hb0Rge+8zyKZ4OeLF7fvh3647HLdxeA9t2GG
         4oxw==
X-Forwarded-Encrypted: i=1; AFNElJ+SY0uePs6Fvxt04V1UWtyVvKttXNiWrWou7+i4mA+M35nk73R9xoNv2oVl7U/76xMhFkx+t4dU/lyA@vger.kernel.org
X-Gm-Message-State: AOJu0YwFLbu/c3mTfGqyNNu5FE2bC7wJKeZ99fBIXik4E+Y0w3AR/87F
	0K4JGjTmQdPps62hyej1sXC6ZG7WIq0TEenVoyGOJTlTEQ+FxOgwh7rs
X-Gm-Gg: Acq92OE52Aly1NwXwjDIA0nS78ySxx9pcDE4tt6+fucR+KND7QIgZBDBes2a3uOqZ2Q
	lp4wng6wyJcq+nJmDXhdRrFWDDMPUltua9eD2P6Sn49g+COHyovztt40oVejKhBHZRpDcOaOp/4
	iCbmHkXPMCZ2dfizxzi6Ak6s33Y75lFu6a44KLISHvYTB5h1+UllRoJTi0Y6dY2UvCiFybjywhA
	KtQa2Aldeb42SmmkaJ40CP6mKg5f63KxCi4JraXgpI4TrAX3YvamYXoiaqNwD/Z/mmc5cJBnZUr
	6GEYI2fbZXAoKA7ENxYYePROiSv+vRCm2o2Lliw9Poj0bcVWliM4E+mAin6nadePq4aBMdUTM4l
	BXrjGmg1DEGATrEnnbHcDrljgH7/OnSQjt+3/VrryJsU867zef1mYLLbJuzG4OBKfuGRSwoL0jS
	claYdNomKj9tOrEyE7CKz4OytffQBwf4wTLGs9cGNhKTRiypD5UG/98JY=
X-Received: by 2002:a17:90b:3dcd:b0:35f:bfdd:f5a1 with SMTP id 98e67ed59e1d1-36a677fd1ebmr1992255a91.13.1779430061997;
        Thu, 21 May 2026 23:07:41 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:41 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 5/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable GPU and display pipeline
Date: Fri, 22 May 2026 18:06:44 +1200
Message-ID: <20260522060645.4399-6-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the GPU clock controller (gpucc), GMU, display clock controller
(dispcc), and MDSS display subsystem.

Add DisplayPort HPD pinctrl state for GPIO47 and wire up the DP output
pipeline through the RA620 DP-to-HDMI bridge. The RA620 is a passive
hardware bridge requiring no driver - it converts DP to HDMI
autonomously. Add the dp-connector and hdmi-connector nodes to complete
the display graph.

Disable DSI, DSI PHY, eDP, and eDP PHY as these interfaces are not
present on the Radxa Dragon Q6A hardware.

Tested on Radxa Dragon Q6A (QCS6490) with RA620 DP-to-HDMI bridge
connected to an HDMI monitor.

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 4003837ad..e8ad6e666 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -1113,3 +1113,88 @@ &pcie1 {
 &eud {
 	status = "disabled";
 };
+
+&gpucc {
+	status = "okay";
+};
+
+&gmu {
+	status = "okay";
+};
+
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio47";
+		function = "dp_hot";
+		bias-disable;
+	};
+};
+
+/ {
+	hdmi-bridge {
+		compatible = "dp-connector";
+		label = "hdmi";
+		type = "full-size";
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp_hot_plug_det>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out_dp>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dsi {
+	status = "disabled";
+};
+
+&mdss_dsi_phy {
+	status = "disabled";
+};
+
+&mdss_edp {
+	status = "disabled";
+};
+
+&mdss_edp_phy {
+	status = "disabled";
+};
-- 
2.53.0

