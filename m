Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3485314D1F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430071; cv=none; b=eRFtmwLQM60uvGPNVXKzFET5++qHSLMVVcjZNUV0MfOUp/WEcA9NK+fVrdh94vAFtSp79nizpqfwusNhbQbz6bB+iR5vrtsCFgFbdw7dAHTuAIu5arBuWuE6r5lnPglS4SRqd9BvA2YNLnzkwo6Fu80fvEDpg1GFpRMXUJeLHcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430071; c=relaxed/simple;
	bh=mrDDTyHidK7gIb+A0+rJo9vmv0kzw3uLhyTLM/pl1LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8pToFhFY/0tFkDJ8vyzkSwLCcJv2L17WhuN02m1otqThNjToiFk52S8wx2epmumjAySu9TpuuSQ6GzQlMy0pQ4EVkuwyTwqrqSH/L5qUThflK64jId4a19rH6dZZ9FVuVoWMtWtM4il9UZ5MrA5vN8XAbpiFFiArbD8kzLa3eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE3Djwvu; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE3Djwvu"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36a3dd2e66eso1184710a91.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 23:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430069; x=1780034869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFcHoXp5EtCVviQjlRg/5s6sU9USys2y1GAqhGol8hg=;
        b=bE3Djwvuzd64qFyD5AdfgY5XUMPfCSFxpgObAEQG+NXSGimDhVYwic8zFzy0eI77dy
         /HPdgEgw27Gl0+eqeNWveeG1AkWQp7ThgexUxPLXQtRElPIe6JK0xqyqiUxNlARRBEwG
         S2saozu2FLPzPgPl+li+l2oKeOX5hep8gVyHJKSDh4W0CA6z3QhFBcv57rkSEckQ16Cz
         l9t7PmuBJriObcYkKu34eTijusJBkkuACzTcrWq2AsZjXbejyXdzxFi+pG+HxYZQAy54
         PhvOp1mKk2w5PBT9xomZm7MbrRRYZAuyh9H9jd6wt+mYzqc2nHrGftttUKFOETRP5Oqg
         6ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430069; x=1780034869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFcHoXp5EtCVviQjlRg/5s6sU9USys2y1GAqhGol8hg=;
        b=Dkk7Am5/cn8uMDPbVWHv0wvukH0Lq0JZDHf1gS3Q+KhhLgOymB0tPOHOEkQqLn4zKM
         nzjYSIKIfYS1+9QweeR2Z8Udxp700HWPisVcqq0PXSGU+KHk2tn9oasnh69JyjQxz+wZ
         Fc9l+7nhglofDGscfY5zqpAadidVkN75lM3nTeZRaVo5U/gVSUuzE4cdcJcoXB6XhWKE
         HmJLMVyWpWWBeKMBQrilc9FafR6Ijfb52VemB4Oeu7DqDtroRyzhBTx8zQO6BMg1hEay
         RYWPZe4lvS7yqyyOKgAl4ioJGKmUPxmQhVrLtc0dBitATtphqCQGrGgYLuy75PRoL2Bu
         nrRg==
X-Forwarded-Encrypted: i=1; AFNElJ8TqIHCygEbxYKhhOIeaicTKz6rcli+HizQyEnmP0EFA+s0b9y/NzJiFxh0RnjXMiVAclLBqUDYfADu@vger.kernel.org
X-Gm-Message-State: AOJu0YyYItVqKnr4pK775RIfwft5kAFsKQ5C47XUnAk2ha+YPO3PG3B8
	OMW+eA8TmQcFh9LzgpbfU6szVEkLHL7woSrg9rJoqoc1Ybn7t3FppJ2s
X-Gm-Gg: Acq92OGGkPulg3jAqgetQB/HhcHIxl0xDR/QRp8XENvpSzVcyBkfcck3phnYCYZRRKb
	hW0XbNBUhAg58YXaI5r8sSMdRvLBsedQVW7XU69mTgc+kYz/xxytUdpV/qyb1ZulpLZ9z16Br17
	7XzBY7iegeTYFUo/oA77Gx24NQZvNTuTQCb5gg0AJ57uq5zEqaO78y7nZEw1Jb2r/+F4kCbNeuj
	96LSJ43FB+cevR+lVZKDpkbgQf/HJlzORyXbu30kaRSxYNq6BDqpkedci8rnZ/bKYZQRPPGbQcj
	+DEtXrYZSxAho2C4cJ+mSEsqH/fkMruTt0JmAzVPwfwtwxDufB7PSEoPhnsP6Qdxo7dC88KmDdm
	CpNYctZ0eYp5vbV7wFyzi4YPCDzk8sMTN/7ERcbTJwJpUWffW1jG0OuCbcRDTlsKUtSSVoEUv1s
	cFdmmMHuJ2AI/YD532+3Rm11zwFXxTl0ayiF5tX/uS+pe3SVlZCI87qIs=
X-Received: by 2002:a17:90b:2246:b0:364:edd2:812 with SMTP id 98e67ed59e1d1-36a6789ac27mr2255781a91.25.1779430068873;
        Thu, 21 May 2026 23:07:48 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:48 -0700 (PDT)
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
Subject: [PATCH 6/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable USB3 SuperSpeed
Date: Fri, 22 May 2026 18:06:45 +1200
Message-ID: <20260522060645.4399-7-graham.oconnor@gmail.com>
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

Enable the USB3-A port by configuring the USB HSPHY with required
regulator supplies and the QMP combo PHY with correct lane assignments
for this fixed USB-A connector.

The QMP combo PHY shares lanes between DisplayPort and USB3 SuperSpeed.
Configure port@0 with two endpoints: endpoint@0 for DP output (lanes
0-1) connected to the HDMI bridge, and endpoint@1 for USB3 SS output
(lanes 2-3). Remove the orientation-switch property as this is a fixed
USB-A connector with no orientation switching.

Add a usb-a-connector node wiring the HS and SS paths to the DWC3
controller and QMP PHY respectively. Set dr_mode to host as this is
a fixed host-only USB-A port.

Tested on Radxa Dragon Q6A (QCS6490) with USB3 SuperSpeed confirmed
via lsusb showing 5000M link speed.

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index e8ad6e666..c16c3664e 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -1198,3 +1198,74 @@ &mdss_edp {
 &mdss_edp_phy {
 	status = "disabled";
 };
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l6b_1p2>;
+	vdda-pll-supply = <&vreg_l1b_0p912>;
+	/delete-property/ orientation-switch;
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			/* DP output - connected to hdmi-bridge */
+			usb_dp_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&hdmi_bridge_in>;
+			};
+
+			/* USB3 SS output */
+			usb_dp_qmpphy_out_usb: endpoint@1 {
+				reg = <1>;
+				data-lanes = <2 3>;
+				remote-endpoint = <&usb3_con_ss_in>;
+			};
+		};
+	};
+};
+
+/ {
+	usb3_con: connector {
+		compatible = "usb-a-connector";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				usb3_con_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				usb3_con_ss_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out_usb>;
+				};
+			};
+		};
+	};
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&usb3_con_hs_in>;
+};
+
+&usb_1 {
+	dr_mode = "host";
+	status = "okay";
+};
-- 
2.53.0

