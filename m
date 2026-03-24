Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE48D366557
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320243; cv=none; b=Yq5L2KYcVF3ZE93xEgE1GJTHJDtVCvlp9Ib1vvLgib3gFRQTe3wgZo+UJeenyBExlwCAuGUaf33UuM3bjjpy1vdL9jexjkic0B/ej0le96poWAOtCl97+ccg4+9txWb4whZ7hwUqcKxOZU7RCQ97Mq+z8F4xjUX3d7umCQO7lOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320243; c=relaxed/simple;
	bh=k2k6bLFK57xw84V7rKDsZluGxJlbuVEsaJEKjoLC3ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MtbhuRYK9ykypI0pflaK8VUq7+v5CMwm/7Vaw9kAVckOdTuZAYI5NcxHDIifCclldp5hmzLKeHT3/LCqVpn5QNQK6l2lUlvTCV1eSgxX5hnEPeY7GDrMjyhcJTqFfjFQ9IdFuPkEsIDIbLLZ/V3hZH6MVCicqlIVYVB1XMOWJAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=cUQ2ygr7; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="cUQ2ygr7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774320240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhQPVKyXKG7BgjErqKFj+iSE/YIW1Zs4GrB83UhLoFA=;
	b=cUQ2ygr7LhndtFYS2mf+vdsupGVDDwWrlOoPq8EYGoyxXM3NgoHbspzKz0figEPfCuklpu
	nFaDPOBY+x28sXxc7QA2N10eTcs9GUMQgPq25nifTU5C8/NvGwCR6LfN9YTfo70WuVmeyx
	sxUN+W/duXRHgrL8THbccx+D36y+9RmfdVcqb+h8b/71YK4wFR5sIUelwKGrBKbeNIZdVI
	Avg8YSZLaW72Z6UjmaAeitPaODiZ1CbFBvt+Hg+5/SWZPpWweKmsFKZYCn3yGr1wxZBjkF
	QZ6WZOKeD3sUdoodhdMSo01hQ42R0NxztLqCa8NdT1ztMxBsDKzAXRbqXCra1w==
From: Paul Sajna <sajattack@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Paul Sajna <sajattack@postmarketos.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Amir Dahan <system64fumo@tuta.io>,
	Christopher Brown <crispybrown@gmail.com>
Subject: [PATCH v6 15/15] arm64: dts: qcom: sdm845-lg-commmon: enable dma controllers
Date: Mon, 23 Mar 2026 19:42:49 -0700
Message-ID: <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774320090; l=766; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=k2k6bLFK57xw84V7rKDsZluGxJlbuVEsaJEKjoLC3ZU=; b=MYuI4UnTJv2SuEzt7/Z0FupJO5XF5tB9+0gqGczm7Nkl10TmEv/A0nt87JLzlSqK4r3a81L0u LtV/ClYbXoIBd3mTbqJVQPBNW+Btc7XQn2hQ775whx1Valtf9mt/kOg
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The dma controllers are referenced by the geniqups in sdm845.dtsi
but disabled by default.

This was causing issues with the spi touchscreen.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index f42800dd25be..86cf4eb44084 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -459,6 +459,14 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.53.0

