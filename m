Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485419;
	b=N9k7WTFm/k9snDbev1y817hR6ELQTBERYUXTczhxOnyXdSYkYjLO/GH+zT1MByNHtIVM
	 a2Pof7LhCxsguMqIaTapMpvduK9M/o0oIGxtIQXReGEkm1Wfq+rgeOGIuxfhBWOjjuYxC
	 VV5YgvDGBYca3yAJvThaOcz3eqBF2abfoex6Rc8r/T3R3w3A9lwfWSTOUO1VtMttl7ZB+
	 aTajJ+00OXbLLXvU2bhOCvNY33LvMAE3V0kDUy6X+vd6THKjU05kocUNEWu7vzFbTI1k0
	 xSXLKs/T/ayV6WGCpnf2OedrXiniJatPrf7xyk6yfNHF3Hx+WrdvwuWBeCyKc/FUxMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ys7Nc7n51L/KeLLawMSwxhQi3I/mI/NHV1h3ZwDRG5A=;
	b=Pkdq0+LHC/p9B4uvgc+Av7Q6BVn4n1Y0bwYnlZgM8bXw1aMBpi1XTL7SJ12OJZoN0DYy
	 /zQqRYK/Ah7GSUdzw6Qucw+5uhmAH84ZuxjvP8wieWMHb7iVuLPkyyteYoKx5qFFBmrmx
	 cLJSFmIf40aHV8z/0GxbLzADZE75qEUqxlmSgm9fbrxVta3yZ9kBTN2tDvtu3duZnPhLi
	 fauo8U/X6cJ+S/2THSnP9tZ3gr3pC1N9jbi9t/cLXjhvwkn3mHDYI55tFPLvnPzp/ixCO
	 MhHUCTHmGUPDe8WBbWLKLYrCP9eG0UTOjskfCHO4TTs7tiQYPs8vTJEmkNw186IrchQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1m14udG;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8C0606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF8C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1m14udG
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-92125687442so40167176d6.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485418; x=1796090218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ys7Nc7n51L/KeLLawMSwxhQi3I/mI/NHV1h3ZwDRG5A=;
        b=N1m14udG0h8jba3K9ai5qMlm6qdGjG3bqClGk7/veFDHpq6CPyM49tjIn2rn8wTDTq
         BqffRqsGdLGdcgI8caRv3mW29ArdUKBFoz/nIJ/7tGkK75trdW6JgUc1/l2YlW4u3ZCN
         FZ7IX3CykWZHK5UVF3g+BjNiKwBHxUPQGRKXE7wGXe+B98lg/71Sa+vtmmWH8pMIiVoM
         KdRyAgPxzCm6s8CSiUjgLezFtfSpqcQrQfRf30AuF+7cYGfUxT19KzcWf9+vwlH+gH7D
         o2RbanUsOhjEl9HEY+PmSa94mU4VLDkv1HuwDoQwSuJHd3Cebng459miaQra0keaI+/v
         +tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485418; x=1796090218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ys7Nc7n51L/KeLLawMSwxhQi3I/mI/NHV1h3ZwDRG5A=;
        b=t75AEbIbWczN1CMUf/3WTYGiBfD5qhSSr35AUz52GDOV8j6hBRCpswEjYqH7UGy/xe
         4fF8zEEhmMJBFwzUmlzwj853aYnHNTuQHPEdQLTcbiu4NTHpSIAVK1h2kJpGqVP+hMJo
         f6l0kMH7BjfTtMN94i3Zt1KmJr4QURo76f+LTqQac+55hvgs73r9DjYLoIEssR7xiKyD
         m2Ia5a7p8idmL7o881U53/oHWeIwyzTMfKekdSD9B+mdCGor0+XPX1yY31Hz7Rb0IZkF
         DK+FgpYc3Pj3To0QNXPTdJzOMuxgQ7HPOaEsrd12AddjiRNJabOTswpiOkZw72OhLOoy
         g9JA==
X-Forwarded-Encrypted: i=1; AL+hErFRx2kUaWgELsS/FzX/pmUujP7aaxScKHEozYu623JW5hTecd/buY82VezxsOiNwVZhQY3dhAWkUz2a@vger.kernel.org
X-Gm-Message-State: APuU4Z//dnhP7uqxt78MhBv/IlAXaB9eMRFniz9pl63O9HvtqoZVng99
	fk2DkqfdZxDPFmXTY/0fYsAMwYs2VMDSqgDXXyLqvlJyfYoo78RZ6/7D
X-Gm-Gg: AZFdTZciK0UIXbUq9rXCXivmU7cFMyGQ8A+Kc5DXSRZDHqhdUsNHFA+M0Dc5lk1C98t
	IYt0dR/Eq2DqRQGwWO/7mMzQC7HB/BuQdnk52+gMAGoWbUelq79BHvckJqH/79AdzXdTLJpz1lA
	G0BZ73Ilvl7lje3jpXQ4V5bPqIw0eV6o9bpRy+kjbM54GuGPs07ajILF/4oN0YeMoWjZ5r1+uYT
	1PxyDkK6r3x9rgYK1bHl4aemZLGZytfpThifMMd8gQVuuw4z4OmPtuHUuH2aSCVbAFTsglaNgYx
	x6rBkbjlbQr50i9u1M487wHGKRqf6rWKfoctJgsLhe+fqoXZ/u0odGzORD+dIA7F9BnKTXXLWvf
	V8MAXCVX2ENMo1T5eytvLKNRvgn8fVh594Qz0DPV9hcYTs6Pf6PXQJD8PCNHxhmxfDtQMZo1GN5
	3BwkNoWRQ0UOxDx4xvDXdQYTAIVA34rTsvmW9/sClppysPfDxYKQ/AHaRZP8kOtK86Q8JhZ9Tyy
	OxF0LHYvLgFPDtzeVj625PjNyUZ0gP8JcPVAfGOgbb2Q58qbGAck0y3OhowcOH+M+8otqaraDI7
	9HIbXrglUZD1hy2lHvdCMVhUYs8R
X-Received: by 2002:a05:6214:27eb:b0:921:57fb:4bc1 with SMTP id 6a1803df08f44-92157fb4dfcmr85526476d6.29.1795485417823;
        Mon, 23 Nov 2026 17:56:57 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349eae11sm121629546d6.25.2026.11.23.17.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:56:57 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 3/5] arm64: dts: qcom: pm660l: add analog audio codec
Date: Mon, 23 Nov 2026 20:56:09 -0500
Message-ID: <20261124015611.187024-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 3f8b9eafe164..59afe3ba6fe6 100644
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
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		pm660l_spmi_regulators: regulators {
 			compatible = "qcom,pm660l-regulators";
 		};
-- 
2.56.1

