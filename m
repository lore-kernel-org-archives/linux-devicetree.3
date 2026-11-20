Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190101;
	b=o7/YR394QRt4Z16fOQg60nmj3ccQYhmfy3RPsIxvjKVQXBNWR0QHY4DINdO2HYJjHda/
	 FXaCT+owiL13aRVYMkPEkxB4OCaDIGx8K6t9+uhDdsdofgp9IBfQldLy/K6/UE5yJZCkK
	 KfWfJdrFDXYcMAMCxX37Juwr5SIYz8DC2MO2TA+RWMzui9/b3ZYx2hFun+NXxahmLRQML
	 g6Y8fPWLISy3BElR6ndvK2vlcZvlEoGksbSY5jA69aYvC+xqNp4y+na2mc4pOavF9+soq
	 TGYmHRDQSrWWEOwJP5U8OoZS7xqsOowxrc4ndfRe1r2HpjZzn5Mg2A9cYOrJCyviDDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
	b=DunhQcxGM8NLxnskqOAnXHDzgG0yiEPuqUdEaUVsdc5sACUCSPkmhIvRwZC2alETc7Ga
	 2xw6QJldIy8Aa90dZYeLHsYeSvMQ4GXTgTXzne4WvZZgvl/avLGS0y7fzE8dhul4pBhUp
	 fEEX7IlxaK0Jxod4u/n/kbi0nlnzn42mhiP4D5q8ntrxbxsJQX65DnmEBjx2lOcKAKDBf
	 f4o0ld3O+AsS4CWdyS5l1NHY+so+R/7ySVO2LOkWV5P9jrhXVR0PrLWmuUUePPv/u/waT
	 9pZsMIdSJ6PYHmXN8gLWD+ZwGdpciQRaXaTXy3aMq1f1Cosndjc1fj3JhfznOo4uT3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAyWppn+;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E676960A3834
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E676960A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAyWppn+
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a358881793so554095f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190099; x=1795794899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=LAyWppn+jN42g5ue/7dWHD/Z8Rwq1gOzYhPpyTTLG+WF02MlqFwSGIxO0B+wQgN5ld
         hIz6rg73oHcqjK7Vag/IpGzqWwwnzY/a/cCaADa5Z0V90oK6ejnhzwJEENTZciKdwXoP
         Gt0WphRiPIhG+iIlFesuiTZ7Yc/Qzbu7EKR0vX3yAE4INm9y5QN1WgMyh2PsHUZaE/xU
         e9OHMF9JkVbKGROqvTn5JYcKeLjhqOTFPEgmKnN1uzVYgJTol12wujkvy1XkgiaY6LYS
         Uu+rFittCfRVMAEKrwKhOvXb3AKOuXRR72c+on0w2EsBbPbTHL4/WTrKT+K+ZJKGswEL
         Osng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190099; x=1795794899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=Cgyo4anmI4FecKufh/ZwznqGAcd9WXCG+0ORvIZZBCS2QgrK8iclj6PtNedpI7fsIy
         vGUw7dS5ZjI0h5JlCUV6t/Gt5IA6lWAzgX0h4qTyB/NuaVTlwrpOK+wd8rdeVLzDN1Ya
         OGe4N7mMEdLdP9ZgmMqiqIYG7AjoZRqWCQjIG3j+Pwou5p6Mrdsoyzj4aHq9uLqXAoY7
         tHvkdhxZ6aMmbJfsCzRSZ8NtF2xrDkVLcb/1Z2HReCJZOYMCeX4TWP6rtc5/VVz1cOL+
         ufpzzV/gaCwwJHJrlvSLEZd7VCOkuWKyM6/AYPfExVXAW3GvEfYfySa3jk0NkMTnxPQS
         46rg==
X-Gm-Message-State: APuU4Z/g5gDV6ESdmEJqxdF4hmQJbsjD6ELlSf1+Zomzqasd+bHA296S
	+FztKDtZccH4I0XWPwYRSTmf9Ok70VVLIjrbHLi2boAl0S291nLavE3u
X-Gm-Gg: AYBFou1xPCa+RXRP/nZBjrYGiutIRBrm2hIMPIAoXbAjFqFsRSPtTyW8UB3jbn1ctXp
	pB91i2O/VfbWq+Akw7025do7QPI3q5kbmeSq2CiB2G29RZW4PGTMZjfsI8ptNp6A1Jvrl587mLa
	2foUtCaACYRL6Rw+5OV3qlVIGUXQrMzkYkZ9NQ2nTu9i3PqSnmDj2dQDOwQZ7RNaIb6gNR1Bs39
	fl+098tyVE+zvYTMc+Pw0CM21IvSbtw1F1MzYNZplFZDlWLwNUA2yNdZ3I6DLaABKBULIuw0pbA
	5IcwSwR59295rKlE7EnUdvgmk0OARvIjLNRxMnsNo7qsiQGo2aSwTaLxHxCG7Injj+HyvSx12Q/
	hnU8HhPtI/rQ7eQL6QcQ90U3vSEn8NEvlxhuSPifO16Pw0mnRmlEfZ40+Ym5RFrX/ZtVIyZq/22
	aluv32wPEBrEwGJDnq2cubYHIZT+xkf+ZYV94bKlGVPNzcztxxBW2PWpRM07SfMGnFufjG5NKgE
	+C9YGTp+K6NOkHCjVEacFApd7+bV1arwjkhrTcsyU/OmTMPox6fcJIzkuNeaJTIkRSb+7rQ0hDG
	uScTJW3P0sMIDBD+Npr0/uDNmQ0GB2cMsIlCHaQiVVEvK1+TNnvqHwKuwvkbv6a/1CHneV5Fw8o
	=
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr71997325e9.17.1795190099296;
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Fri, 20 Nov 2026 16:54:46 +0100
Message-Id: <20261120155450.7719-8-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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

Enable MDSS, DSI0, and its PHY. Attach the SW43103 panel with its power
rails, enable and reset GPIOs, and four-lane DSI link.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 20aaf70355158..709cf9674e2d4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -461,6 +461,42 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43103";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p8>;
+		vpnl-supply = <&vreg_l11c_3p0>;
+
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	status = "okay";
+};
+
 &pm8150_gpios {
 	assist_state: assist-state {
 		pins = "gpio1";
-- 
2.39.5

