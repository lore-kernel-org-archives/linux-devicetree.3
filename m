Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018396;
	b=Ie4ywJ4XnkkT5N2EYMmOfukpItVq6k41CT4xLsRoMdbZ4+9y17YQLzolBgHw42v2YafQ
	 Yef/GGhuoIm8Uftjy48JTssHZO/+p0u8Y0uv7Gfu9fWzjAZmOpO5vN4OVi2lE/s81+HtL
	 ShUNSOue8/kUPChjFgCaFDu4r+YyijLsVykE/8EWNWjDwPX2eX2qhep5qNRyGZGDZO2X+
	 61XAJDdYRNQzgm5EptdQR1t1bJsHNj+Fva4Aokj++j3ZXlgPTB3Ygk7RE8/o4fgNj+KJy
	 4DiRdAvKjxCAxLrxz03tTKVaxUJwEau8cjJWMAGh3+xPW41AkpULRnEX/hjICPeN3IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TjYEd6P204FtTEl3+2aQREdgn69jfcQSWWob/xOBDVs=;
	b=q9HaXQY+OVLShwrKJI2THRsY5zOfdrCExlR6OcnGAaFuYdd9ZR1uFyZj6hHKidTFcCYC
	 /Wm5YdbGUVrXtXQUcAvLQR6oMcKK8+JvOIb1RrV1l5vSA4E5BVxEI3Pmq9pG+Usw4R1qw
	 MY1Tn5tEBDiAKGsQ9BjeEtO7NN3/Irw6sely8DqeBd1n97zJBUljYrPqvQ7Ylg8qivQ0T
	 SvFksS/cbZz30Y4dhWxZmnn+xuOfxxAUqgyJU/rC0AkEvTorMUibNSlJ5fgsxoRx01lSj
	 MDHf1y27JbGFjYDyIdOSyMHsA+PR5LwcyR53AANhTg3s3t9vrhE4LAmRicLp01OiGEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgpsMcpN;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B848C606A331
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B848C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgpsMcpN
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc013095d4so425370137.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018395; x=1794623195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjYEd6P204FtTEl3+2aQREdgn69jfcQSWWob/xOBDVs=;
        b=GgpsMcpNnRTpfI0IGsiJYRIK5C1tEg2vO7Qw3brjlZ1E2TIOcrf0yvf+aB8hxRzUMh
         r9acsEbwSdK+w421Zmgn9K/cQM+R6dTKdr6tlevwWvBRCfkP3HfyYvmyk7bKnabXcm3W
         c8DOzP57ND0Mzvnrq0u40AS4K52gIeQwRbe8aMdTmdG12fm8Ip5zAesxRhuwcZxeNQOS
         maXenzfFBDrPSmtfE4Ozu57snZqeURs9z5Dh0DzqGD/C3JqELtPndOVQ6m+pUf4j3L7I
         Wt1vg15H8zQ2pRdZ5Kauspgl8r/BUGFggzxWzK8/XyJN/NrKX51GXvdXMSqETZfRtSNq
         ZGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018395; x=1794623195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjYEd6P204FtTEl3+2aQREdgn69jfcQSWWob/xOBDVs=;
        b=rS9yx+Kzp1d7fDcj1LDneUDgc/878M7KJh2mZqan3zBtT4K3DJEWCbjmbsyn8X8k3R
         tN7WrtVZS4PvW9frxfsd6yuu58NBi2275cUAeuXZ7LKflN0s8HfusQf+vU6lONPr56yo
         Y3Gw5+9ehezq97srZM1XaZixxELj+gXOYysjJOkG9WcT+wAmGrv/wZOZEJOM18EYEwW+
         6COvbNpJcSHNfkniBnpIi9jbjEchxa23vXj6aRboFbtpgw3/jXeRgcA3cS7hPGEDHZwc
         He4O0ng3+Cha/SmNIuVHsFHwzus0EaRMKVpuft1BGfIco3Vu7r2ZxR4Cv9+Agp/H0Rf4
         4fSw==
X-Forwarded-Encrypted: i=1; AL+hErFDjjsHFQD2mXvTYlUPxjo7qsPTfcV6Jdqsurb/nHwX7T6Jt9EFkcWmpfYdJTBvmO61dL7i/CFZNtQp@vger.kernel.org
X-Gm-Message-State: APuU4Z+X6lGWND54lzHRv2ueih5kxdJRTSKUZTYmyFgWGGH4u7Tqig+V
	Fw9XCYYOCx9p3wIboUXeiGGCdRiM1f/gdPM9dDtK2g2K9qs+H3zLEXWcQ32/Lw==
X-Gm-Gg: AYBFou3HZivrWjpzYPHhbK/E6PHfEFBLlSVyl5cs9DTD2ACkbJ/yNdjExNVUY4TYuQb
	0JaF060aEO9ppDEc6NG7accHJ23vJaAa3V3rDyybqg52Au+e7z7btkNtMgqtU8IWlemYKVuC6wC
	rEWV629OmvW82CFJxIfZgjNR/0mrrS7wlRRbo74pxYVa2WmyEfmcG0Orin1h7kN/VBLi4LHZlRm
	jhPlBF6N0xebZGi+bJiC3b7cBd0dYaR4ywsnaGjAP04QVktkEMv0Rybepc5X7B2RdSZyxoaCMcH
	uRJ27busPbg2z9fy8qhoSWvMxwctWlGqOzrFfNa/PaYzxK9r6OLTpP1Hj5tskmFIRH5wKq9ljI+
	Pim9kjQmDRs7N+QK4CfprYoru/z/fWLyisZkjwa/3z/ssMMb+OjCNAl597JiN1P2CCNWKtGn7rb
	npZQ+KCHiPgNJYlUrqKrF5WAyrms00dOfRErWpyEYU0/mUxyptkHOKBE8b417nR3rmqNENH3xgo
	oxsKZd5B+4rLtMXR9QdcRD0SG1iIUhDLhEtGlww/r15m6M9vWXFNh2T8ZAFjLVrQG3yuDCTb4//
	XMsfuA0/tl/G6wCy3RCpfzZ5VBKpsQ==
X-Received: by 2002:a05:6102:32d2:b0:7d0:6cf3:d8f2 with SMTP id ada2fe7eead31-7d2a157bc3amr2075226137.20.1794018394730;
        Fri, 06 Nov 2026 18:26:34 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99baea8aeb0sm3142227241.9.2026.11.06.18.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:33 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
Date: Fri,  6 Nov 2026 21:24:51 -0500
Message-ID: <20261107022453.159341-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

The PM660L analog audio codec (PMIC revision 4) controls the headphone
jack, and optionally the earpiece and speaker, at the vendor's decision.
Add the analog audio codec.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 3f8b9eafe164..608c1c2120c9 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -87,6 +87,43 @@ pm660l_wled: leds@d800 {
 			status = "disabled";
 		};
 
+		pm660l_codec: audio-codec@f000 {
+			compatible = "qcom,pm660l-wcd-analog-codec",
+				     "qcom,pm8953-wcd-analog-codec";
+			reg = <0xf000>;
+			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x5 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x6 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x7 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x5 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "cdc_spk_cnp_int",
+					  "cdc_spk_clip_int",
+					  "cdc_spk_ocp_int",
+					  "mbhc_ins_rem_det1",
+					  "mbhc_but_rel_det",
+					  "mbhc_but_press_det",
+					  "mbhc_ins_rem_det",
+					  "mbhc_switch_int",
+					  "cdc_ear_ocp_int",
+					  "cdc_hphr_ocp_int",
+					  "cdc_hphl_ocp_det",
+					  "cdc_ear_cnp_int",
+					  "cdc_hphr_cnp_int",
+					  "cdc_hphl_cnp_int";
+			sound-name-prefix = "Analog";
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		pm660l_spmi_regulators: regulators {
 			compatible = "qcom,pm660l-regulators";
 		};
-- 
2.56.0

