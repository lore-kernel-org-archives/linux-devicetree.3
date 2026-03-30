Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CDB3C5DB1
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865696; cv=none; b=jVbHN8upc/8mxwiKMgo4JzODkPHlPYIWtBN2CNqr6scEXP2ZDyUTNo0YoGgpSrzNGsEQ6RmRzIGDpCd3MEErB9uvPeGsLfNAa/ITGIiZ5kdCGAbst3tGb7ak1gkc20v0PtdQKpEIuHSdDYejC4coBD2f/YiH2DO5Rq7JBzLVKys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865696; c=relaxed/simple;
	bh=rYkzRcW245ELcqnW206enFLVoi53VbyHIjf+wFoTPok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZHW1nrrH5I7jBfDlzjSDRPqFxNNukz2hMMht4HfXHeAawvjdiR8TVbvdrkUw/eV+oXAXEJPSd6+wlDey12YPiqMYB6AW7e5DXXO5Hvo8JQdsdEPCAOYCynI4Nmzjr8gb37GXubzm5PLkvaGZRoeHcUpGCAayslDb+TvBRWnEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpRp9e1X; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpRp9e1X"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82a655cfab5so4032529b3a.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865694; x=1775470494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZezNnVQNhmXmaIcjRNqOna668OUhlUp70Pxauy9gTQ=;
        b=jpRp9e1X5knqWzbGGzppcH+P3WLgZVHJ5F8ZtUxgybCayfP0kGTkiyJJeV51cCE8fC
         lLhQ0QlbxbDQ+5/EjY6h2mFTEHQZQeDr9IrTNoQhRRjn7MrGWLFkiaUh/G0DFQHkOncf
         TtOqSySk8jJmHHhoGiej7BtdDLBCB5Ql/eCjDCtzfMTkWNkc8tIKlERB4h8luwrswGis
         daZMsB4+atfRc4+wLjljo7OKViMeANtiUeqvavAHme4YmbEDGHvINDfI52E7s4Cx+5rt
         Tp1EqB4x2rkh9VMyDuukPhSJd/h3RNVp4od8d2FMjMWQLWnAQ0OvAvKB203DlBt6RMIe
         hlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865694; x=1775470494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZezNnVQNhmXmaIcjRNqOna668OUhlUp70Pxauy9gTQ=;
        b=qTxBfPwZ+rW9BkWpYovPeDfmsLwMTRQukQT/yjhyiW+2hOGhWiluI/jW0dAElLi20P
         8ZJBF8TT/ueTaorbangdDAGSZAPOgvTZfZ8qcQ0GO9RZiEE0a5obqk7BvLVq25GS9QS9
         LV0UD85hiCAb6/5y8+oj1iq+x410knsn7qkSsL2NsrlC5atx8lbPC75tDvi5tp0Nhw4B
         YDwglpgkASJ+3QrlfIj7hxHH2qzd3yI7PnVrQ1Q1VXPVcYbMEYBGI1m8J7CPqa5h2Dwn
         /nNecdDARDHVjyLQ2K/BqvqNyZMTsRVYhJak/uY2GBVnXY+e4zEbmxOHNINB6hHK2vR4
         wzOg==
X-Forwarded-Encrypted: i=1; AJvYcCUL8uvfbRbFan+wszY/JJ+O4gZ16YxljcQlK/KX+u/dr8+dxGzAFOr0773oSvZQVMKDGNhigOsCJlJc@vger.kernel.org
X-Gm-Message-State: AOJu0YzqY9ZDDKZor4EYayCkRCAJgeIWdFo6njgy4dCjbq0aBuAnGuHe
	9JLq6KmcH/ikWHzxFuJ2u6rypg7+iQPIyduSv+bDPg8Gx+xFm9XUhfuW
X-Gm-Gg: ATEYQzwDF7J16Rc1F1FiVFYYxhW6KJumOXRSd0zC2DzDnry1lPzykUgoeGHI0wXQk8G
	r54AR8UsMNYJjZ66mLeIunVdhQkS72Mh6CHvbpaAHAtgH01Ad6PUAOm/ugSeaWoE08owgUproDE
	ehhZacTHeeoS0xumW8eyxc3ZGe9OJWz2tL/ZPI3HWiyY/15dNuJmdgeZibAeF9s5IULtuVsxSM2
	LxJDgHrqIpp/xqcQiyL60Px51G+2sFqc195m8Ixb5G8afSmiU+aE4fb4liK66B5RkkJtK7G0WKv
	UMQyE49mSyHUmzxmFnuvlrYLIos/tj5NSHZ5VxvMIx/mXUY5iVZyrwjE59BeqHmGhN2jzes84Jc
	rhhhggp29vjSJY4r4MXMIofRI2yAh+4DFkLYvf4wuzKgpk7L+Y/ECfLIoQP0z9dzIwgRmE560zW
	rhH9oy0GjQ2QuP1S7Kjf3JYwiBWCI2
X-Received: by 2002:a05:6a00:2e18:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82c95d3974fmr11984562b3a.17.1774865694152;
        Mon, 30 Mar 2026 03:14:54 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:53 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:52 +0000
Subject: [PATCH v3 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-5-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1398;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=rYkzRcW245ELcqnW206enFLVoi53VbyHIjf+wFoTPok=;
 b=+0vgH3skU4ycp9nWrCr78txopZ6GUChHC1xjVO+8+tmuAJhd3X+0Sd35xvcmDK41qmuT2NngW
 EQ9DxSsP+YKDR+PEDZjOimrpKCrM57VJY1ef2DzH4Pm8lYSKyJvoTau
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The USB-C port is used for powering external devices and transfer
data from/to them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 88691f1fa3a1..f66ff5f7693b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -116,6 +116,33 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		port {
+			pmi632_hs_in: endpoint {
+				remote-endpoint = <&usb_dwc3_hs>;
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1000000>;
+	status = "okay";
+};
+
 &pmi632_vib {
 	status = "okay";
 };
@@ -316,3 +343,7 @@ &uart4 {
 &usb3 {
 	status = "okay";
 };
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};

-- 
2.53.0

