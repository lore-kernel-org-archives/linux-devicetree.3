Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795383991;
	b=FzqirqaPPYRpTFqaJjbeRYASf7TCtlGxH16zU4iZzbEGmmQoSfbdP9rL+BfaycIKn/uN
	 v36TQsiM6L9Gx5laOm/OY/2Yz5C4316dOuSiyw+JG6JyB0eywbmMJ1jseMSggC1SU3Stk
	 CcYVubI09hD7WlZwgTq78Lc3suSEzu/NPKILhnmwW5eGBn/N7g1iHL/zhH1FYb3IOVFDg
	 3mip8bFangT1G7RLABVZ/RZR+g7UmYRA256Yhs1P0oR0Nw+PcuDfJ6/1EsKG2GxQkF27W
	 pMWpW14ofR7a7ZIo9hFXFwE/sG5E8NEb55K/7rag7ZtXXFqmZB+PUcWKWL9xAgv6KOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383991;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pUj7FPlN378u7yEnfxQKcCuJ/ceYwGNfhB8oA2Wplr8=;
	b=vzBMzPOYCCef+Lpg4IMT5CYRjZP3M7dksy/WSNSDqcIOwFDLAlYE2zp4jrwTjF3Fbpom
	 oMDxtrhlQMKkVBhRJSm6IFl1YyxwAChJE1Bbh1mOCR2i6ImkQxP7xumqdB+2FApqROQOp
	 xFeGOAFKEWTtcnlWF7oKMmAJBR7A9GO0Mg93HIyp9J2YB5y552PO4HhEtKeZmcMeiZNty
	 Gzf1ACzX4qJ5dRf54afR883/B1zulzIPbwevUbubGct9V1UNbx5W675RXLxX61d3x4lmI
	 2Q96Oh/JaONkBBxyzYyizd575scjRqkUQM7OSVVxNjzBXPGVRqSqUaTfLUGKli6PV6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwDdbksW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC80606A31E;
	Sun, 22 Nov 2026 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwDdbksW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795383991;
	b=QYssxddN6TAVK/JnB5RccRV7lVKeF/blmq+loOjmATY7UfL5/2ygME208fC8FuvnbK3K
	 xsqbDh+FtUg1STKXyn/JUMB6szEsStw2at1tBfArYcQT4ih5syd5zvzYEAFGpN2zCcgCj
	 /yS8GCXW6mAAMh+qjNVDej07VgWkdbdrTmLmWe4qNo+tNK7mUQ/ASD+y8JV7pf2qPw3XX
	 hnmIKxY/H7WjJlP4+CDBZIGFNO7ycSugySEbYZH+yrLCV1SV8sJX9N4d7C2L9yJ0WfHMj
	 AtGSxp/CoKDZ3ExtfMDxIMGmsUIUB/yMZoIbDCcH79Z1ugDXxcmaj5yMpJdc7/bK6pQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795383991;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pUj7FPlN378u7yEnfxQKcCuJ/ceYwGNfhB8oA2Wplr8=;
	b=m4bvDGDx2IM/aldWsSCNld/xLvLiSSrWlWkrTLes3deIxfuVNTw+sXuu4zivxk0xIhQ0
	 3I+E0yRTCSYxskffztT1lQb2+ev3bIrnAiewfZM3Ohl4RyUG26VdmXQryu0dedyZpzyGR
	 XEss/4vC4RYFjnRuhzb77tOAwn9A4vV4kO0uuv5sihkqTT0NRiLwDnQ7WnQGSRYmnoKhJ
	 ayZVt6rvi/SdrsAtSh7XppOZXPrSHpEm1D4YdAj5fo9eW1qUTB2AWmSVDRp1UqflFx0k2
	 aWfYChX4v9sjlfCDwMQDCO5TYl3GKZLnXsEe4zsmoKqfk2wTn84dLKoIHst+MFOWXLQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5FC01F000D1;
	Sun, 22 Nov 2026 21:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795383991;
	bh=pUj7FPlN378u7yEnfxQKcCuJ/ceYwGNfhB8oA2Wplr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AwDdbksW+vSimjzU5eym6RmVfOi/Q5XF4sidTqtinn6GCnzYjxdyoz0QOV0sdYT/Z
	 Ky1r4B0eZxQWpAnqvB8kxtt/NQb3/BjJe60rEEkRbUl++8ok+z1VswmeRdMWGn+OPO
	 6Wl11+VLtwyP1jAFmcDTK+7W6RII9c1gU6+UXxyqejWF+0pv2QsG9NkMLCmlqRofjA
	 7IuLHhtrwrr8x7UZy50uJUthEDBpcqjLxF/ZMDF1VCqfXDC/6X+Z0pgfdgsIIfhmFt
	 ZbDLv0ru3O8QDzDsR9HNzmKFso5JyW4yxIdnXiOAcARHABddpaAsUTsOppn6ZUcCtd
	 VNFug8k8Mr4AA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7079E4C213;
	Sun, 22 Nov 2026 21:46:20 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 15:46:17 -0600
Subject: [PATCH 2/4] arm64: dts: qcom: qcs8550-retroidpocket-nova: Enable
 panel
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-rp-qcs8550-display-v1-2-d513d9819a34@gmail.com>
References: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
In-Reply-To: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795383979; l=1370;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=EZkGLXBz93tAMjSBCGHN5T876EfnxJnLxEzSPtgJ7MI=;
 b=SXoRBMsBKJxKIt+Efw694s+vk/N73MsCDojqeXMOdcTF72gJT2W29quiQhWLbpY0BjqAOOjTx
 L0pIzRT0hJkCuocjnqXgxTTz0fptwlWAiy7Epml6icLx+BTPmevWgXb
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
Content-Transfer-Encoding: 7bit

From: Aaron Kling <webgeek1234@gmail.com>

This is supported by the Ilitek ili7836a driver.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
index ef1356f4c34ce..11689f1bc3d8f 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
@@ -80,6 +80,43 @@ touchscreen@38 {
 	};
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		reg = <0>;
+		compatible = "retroidpocket,nova-panel", "ilitek,ili7836a";
+
+		pinctrl-0 = <&dsi_p_rst_active>, <&dsi_p_te_active>;
+		pinctrl-1 = <&dsi_p_rst_suspend>, <&dsi_p_te_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vdd_disp_1v8>;
+		avdd-supply = <&vdd_disp_2v8>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1e_0p88>;
+
+	status = "okay";
+};
+
 &mdss_dsi1 {
 	status = "disabled";
 };

-- 
2.56.0


