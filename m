Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368956;
	b=ZfLEM+ubC+BoEJ5daluHuPO2vT8MBxVPPW0V7fUeSo0y0nbNgRWwXE9W2OL5D1dduDgv
	 QxsQZBIvUv3LCrLP9V0IAbUVQeH4pipKdq9NdCgLOJhD95TkOVwVMJRT/ve89pUU4wIJn
	 wrfTDXnanYP2+zCVLu+E/+azLYz5KNg4nPDDkSCgyE30qgURH1eKYqx/Q/R8thIZxF/op
	 bPXBR87kofbco0HkBt/Vb0rDDkqJyWA/e7tsRtIP4DmsAgTrmLBlb+Fhk7F+hlfhU4rQg
	 JJBIpHIcXBnc6V5qlaNlNx0Fo0ylLr0kOlTWu94RmVCd4CgoSrP8rid7+gsy+uPL9iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
	b=tGq7fXlE1RLEOToAbSXBMWMD4zJkVHpPUzA7Y9AKJWFTFSRq+gN8e4LgSSMOUoogrTne
	 wNW7o7/W1+jM7J+rBxNorMvE1A/l4VtpojBeRen6NXZUWA6i7getdlLyJwGjtCQAxGxG4
	 ehEu63XA+s/xweq1C+nS5rf7b/kil/zHevgBC+GAQqgSNzbc/2dLXkOqML/WTzUY0nPT1
	 HwY2mxtTjo76x1XEHAf3pU3C4z11JXK3Z1Nhh2NhIThNpQEGHzTbx2ELBfadDoA8EWOZb
	 odFooE2oAzvwW6PmHk5aSUi94JsXQjq1crOSEAYmN4SaxvVX5lrbJvje/qBcfLKhErA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCy30Koj;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35C6606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C35C6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCy30Koj
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4562889c88.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368955; x=1795973755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
        b=CCy30Koj3yGMktI7EOf5/TKNz7iYG67TRpkRh4+WyGd767qqOqi2odsV0Kj9RgzdpR
         0MSArWOqWa+qgM+DG05fmhi9iCLdhsBgQjyWvfKvR6CvHw0Kw1swCXgJC/I/7YZCBFAx
         RZsTHUXrF++DcIHmfu48ehUSD7lTQd/teBhoG7/svuDH6wVGUUZoRzezr2+ICHNgB+xA
         7B5kvhbXX+rswGCJVvdZwKkoJksBx01YiTcQfMMqQbNarj8hGRVzKxYKOSZ4BfgjxYel
         89B5N+j/zhAHZO5DrKcXigl4LPA6/fMZ8gt8HzA39nE2qNvNiOa8oD5wwUHgzPz4oTWv
         z3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368955; x=1795973755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
        b=t8GykA9IzIBsR/+ZIEPfLE08dNdoh/dHLS6s4mcJPSBI/5zHXPL52TuRcSmJiFFwa2
         qIDo5qZpORFFyMpSwaqiXKlxC+0EKopm2hgqND1CqUrDAN/rPWkbdq+YjwmueXoS8siO
         HQRMDQrehWycxsxfCOPE7B4Xu9xRjJK+xkwg60X3R/BjJzgZCGRt4d3fPDbyix8Alckc
         vb/iUOJ4lpHxYJ3EwVKsYIwMHrqDph1Ik24jwGr76JS3RNN2Tn1xE3G1RZO4usm6T0lW
         82rCta9c7RKd+QWwnyJODivm+045k8ftATFimjnWhMVfF7EpzgX1x5sDIQFiQn6hjczo
         BMcA==
X-Forwarded-Encrypted: i=1; AL+hErECGM0jPQJa+NTrPYt3IypCH3wR+griAEtX+N0M0m8y4dugMQ01To/yDv1BBbLu1c6rxl/b8VgFcLjO@vger.kernel.org
X-Gm-Message-State: APuU4Z+wwd/wOoc65NOMQuEG23AOADiGfXO8c6e7Ra7LYrJBkBDe4udd
	gjKz6KCq6vRsj4bNe8eCPcde8b7ofxM6J+8UUazRYeYdE3mos6QxVxwu
X-Gm-Gg: AZFdTZcsUPx+nWl1km8EWF7GGjqfptdlGp0XyU/pIicdIz30evW3B5vwQrBzSIIKLBq
	HjH/WZrjz43sQPEWitePsK2QqA9xvCQuy24Gmqh0+Is8sDP2QSz7uOHZZXIFC0ftILa6di4Xn86
	TEGy/L9pI42wBcJmDK4CzY/MdU1BzlUMP4LoYJv1fUQwzbW+wOANNh8Ql/SgreM+Yiv0A6S4YM3
	KNvpBlrcA1lYMGm2lReLxd4GyE1di/v4xxJXCNd7DTm8vSgRYnsi06SAgY7wsnDQ2VqwFd9zLmr
	/VVJKZW4G11nwQKLTSOPXoKZAaJgEDc3ITQhtJcyJRWAAc9ZGnLfhhIRFbMLlDiHotXVXuD5rqv
	ndOh8Fl1wo0P9GePVPSu06w+/rjEZUgAtAu83+CerWgJVEk7zu84B6ckcwiSDB1xFzDd59bg0ne
	hobPL02dVwlE8OPs6maehtnpHJ3DLsyuOR2ZOUTGBC9wLjbhm224TKFomeoSLYOdXIpZlW/ztEo
	Tzu8k37rp/Nw7U1Wglsc6mXUWFVYFUDgZBTPboPZlCzkpSP3D4RzFrmmTOU9Sa241eMIhBpiwa4
	3buUqzIaXJd0z3znOjHH7ohg0QTD2HcpvihwEq1roDsVnFtCAbf7yVbVPkpSb0aLSpLX3P3H+9O
	wy4sPjR8wz60AHAtU/AFIgO83bSIfDKPQBUFenH4Iju8/fc4tAgSo4bHnVSlzGRHpY0XAVPX538
	Zt8yI6U7oFhrvev6G+11Qx5Lrn0Q==
X-Received: by 2002:a05:701b:260e:b0:1a9:c52f:655c with SMTP id a92af1059eb24-1b556900476mr10503800c88.36.1795368954863;
        Sun, 22 Nov 2026 09:35:54 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:54 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 2/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun, 22 Nov 2026 23:04:50 +0530
Message-Id: <20261122173449.21009-3-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122173449.21009-1-surajsonawane0215@gmail.com>
References: <20261122173449.21009-1-surajsonawane0215@gmail.com>
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

LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
unnamed, so a device tree cannot select it. SC8280XP already names the
same slot ext_mclk1_c.

Name the slot on SC7280 and assign it to gpio5. The third slot stays
empty; on SC8280XP it is qua_mi2s_data.

This file also provides the SM8350 LPASS LPI driver, which uses the
same pin table, so the function becomes available on SM8350 as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index a61df10d4..278d5fac8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -34,6 +34,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_swr_tx_data,
 	LPI_MUX_wsa_swr_clk,
 	LPI_MUX_wsa_swr_data,
+	LPI_MUX_ext_mclk1_c,
 	LPI_MUX_gpio,
 	LPI_MUX__,
 };
@@ -77,6 +78,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
 static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
 
 static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
@@ -84,7 +86,7 @@ static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
 	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
 	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
-	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, _, _),
 	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
 	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
 	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
@@ -118,6 +120,7 @@ static const struct lpi_function sc7280_functions[] = {
 	LPI_FUNCTION(swr_tx_data),
 	LPI_FUNCTION(wsa_swr_clk),
 	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(ext_mclk1_c),
 };
 
 static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
-- 
2.34.1

