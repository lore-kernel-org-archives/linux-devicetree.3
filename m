Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640077;
	b=Vm6fj+ax2VRmcd+zD/2KJ0h1yLVXvod0fE/cY4hTwDBpHxlzbTgOWk4NnsakUG/cKlMy
	 L7SFvR5HiGc01/mk6zys92hDz1FmDh/+CnWwMie+Pe88AI1J2TJMIXPF8zk2Xuy7OSygT
	 PzZrGA1PK4FVn+vdP+Ppm573PrBPUOV6s41nqiAPMyMATw9JYY2SovqMVWEZVpMHvmrDN
	 +wSRTpILQOWk7xS+YWH0ivK9hPoIa5mxnXFuygR8VX8m5l4LVXao5nzqETqSoNnBGjopf
	 0xYnOl7bM1Z9gApN5sAY4w96GWPwaiqpQg+Lrl6F3mntVWEZU0Vqm/trBPhntmf7zpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=At893HOits8PlbcqKQMAG+x6VHDDd+yyVnApfOrreEE=;
	b=FnVufgg4xpUFpBiTf7NtZQn75DwuUquFXkUYb5/c5UbG0zUYiODJsv9B91Hi8caxZeMM
	 K8v+WaURs8OilQuvgZTMVcE4svUkocrCID5R9vBeV0JxJYUaXC0PPucVTgDdMSKE253G4
	 lj9SNRAAKiYTx60bpP73nNRtIFxsWPTclsgfnv9Tg/8x+Fkb5dG4mspCp+T5AhjSazLyv
	 5LpF1s2Ljra/SWTz+qus9W7GNLIUylLr6W57Lw2SoNm2VWQkLaoC6aw3MoXHNlYrpkTCX
	 s+EC8mIbCRwrE5An/4GcEw6r9jKR3uFt/4GXkffgdefEBBZhHh7EtuYbAOmbyTbcQcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRIuHIDa;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47155606A33A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47155606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRIuHIDa
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so632638e87.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640075; x=1796244875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=At893HOits8PlbcqKQMAG+x6VHDDd+yyVnApfOrreEE=;
        b=tRIuHIDaAazSvAYxdsTYzbqP6+kJs7Q312mhnldXf2RHls+Ke/Q5o0jf4fLyNmjO6v
         cDBiBWaikLMWSflRvanN8DO7UXWMII/dHXhp2V6VM4awMBtUFJvidJ+6cF2gRbZdcH+Z
         Gh9/Vepo4RpRdqoN1Gyyp+FJSrTuSLiEm+tIOCJlKYiVTAxITO4Ve9g6+n91kgXMlIyr
         UOOhawheHZdMNW3IPQWFzBzpicQ/seSIyyihRuIVJ+qkiZZVmUhegLPaK+/vWrNhKGED
         hRq8KFXqlYjRZZsC+woHhx7sb6wMmAilIUs57uC6wFGdZjuczqUSaHz56ebQ41mhkF2u
         /rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640075; x=1796244875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=At893HOits8PlbcqKQMAG+x6VHDDd+yyVnApfOrreEE=;
        b=Ay45UZwPRXhukjCZCSDJdd0ycouGZ+RonwqH8FlK8e4BKpXCAGNO1aVMX97XLUj4Ff
         teIGenFTlqOCIqGskJvkYMnNzQLyGq9raOlQcT+ou0wykSExR57c6lNhRxzVJwB8+Xbg
         wIrgiv324pvA1l4dKu9KCAkSZCDPEeqMF1gAsMDlO/w2O8ZsXv4YDHl8qloUpMI3po0b
         iRqn+QZlUDptgt/fEw2LL7ZNuvdx3HExFAYs750yffMQY9w/fGgnkZI0iZmyLpcen70I
         DpIdk9EksfwRhcLBKFaEcC3zMLthV3O8RB6cQfS9VljwgGGOCimmyQBMUHZ++b+IMrc2
         FhCw==
X-Forwarded-Encrypted: i=1; AL+hErFMNA7ciaQaCa/vgwaLjAjT+2OyweqRQiAiQzzjPilKu4W03oFIFDc0Ya1vOrjTYl4voHZTiMdWyOS5@vger.kernel.org
X-Gm-Message-State: APuU4Z8+QEDTGsCdisyKGhVLDsK3Ox4OuKx61+l+OtyeTf5ew42Zbr3/
	rjn78oDUI8eWE3YfMA6GZqF3n8lIrEBm5nLRF4e9xDhAGEeaV9lQV3Hz5UA+/wZBPm4=
X-Gm-Gg: AZFdTZeFdRSZiDlFBcCUigpVaDrsefWePWz1iZDqv5RIr3jbjmTAK57nqucuAx4yd7N
	IVy09NsZrseVzyYCxUubbIFFFRKf+WX00Pxvhl2J6aKG/Np5uzV/2B4QoQ3g8gMQGJ96WjvFIQv
	73CVJJYh/uqj2z4ryoj5BPq1WqYHpxgEf6o4ttt9OfrT0xXLiZHyppmHO+/rrHUI9K43uK6SoBg
	PetKIgATgOomMpZa1IrfTIa7pY8ayN/ilwMNRjY4IKSr59NXvBoCDGyc6aEcaWuc9EHTX5vDZOE
	xfRRFdtDupeiamtDRZ4ge8apm4oa9G+2srB5sFjj0EDLZG8Aseo5oNrJJ0qT7Fvg+sK3tJ8hpgD
	ELbf/Yw0AYPXwsHsi+/AxhcD5H0qrQDgmBQ5Pt+PZCW+WiKSQ1L3/IJWw9ZZg3LE/r4kQJOcNRh
	6ZiFDwdi7XCM/62iEZlTgJJ5d4p6rz1JY3aLi/D2eRKn6XP9oaNbJSy1SIp70uXrIRyYy/be+jc
	ZzR2CkhohKJdpFLFCcV4A0LNWM+rSfG7fH5lPB0ntQcJpyNt27KZQXJGyPPisiqpNoiIObV0k6Q
	AgvgB23lO8ToxCmT7zVwzvyKUPOq+sBTB9peiiYa7iYlBDf5niNgLUVBfJNkil11ZjeSVg==
X-Received: by 2002:a05:651c:c011:10b0:3ac:dfad:319d with SMTP id 38308e7fff4ca-3ae7f9d6f4bmr42526411fa.1.1795640075524;
        Wed, 25 Nov 2026 12:54:35 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm50871441fa.40.2026.11.25.12.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:54:35 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: Add camera clock controller MXC vote
Date: Wed, 25 Nov 2026 22:54:17 +0200
Message-ID: <20261125205417.1437355-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
References: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
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

The camera clock controller PLLs are powered by MXC rail. CAM_CC_PLL0
runs at 1200MHz, the PLL supplies CAMNOC AXI, AHB and CPHY RX clocks,
and it is enabled on any camera use, also CAM_CC_PLL3 runs at up to
1570MHz to supply 785MHz IFE0 clock. On SM8650 the PLLs running above
1100MHz require SVS_L1 level of MXC rail, while the camera clock
controller has no 'required-opps' property, and the MXC rail is voted
at its lowest level only.

Fixes: 673fa9a42606 ("arm64: dts: qcom: sm8650: Additionally manage MXC power domain in camcc")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..af94fada15a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5641,6 +5641,8 @@ camcc: clock-controller@ade0000 {
 				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_svs_l1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.53.0

