Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9061386C35
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320127; cv=none; b=K7shXIUfJVX+xCa/DoRog/L7uhLG3pNS4wrmRG1ODHyvS/f38enNwPDKPrgowy9Zzht6Tq5vjyESI7B95U1Mqui89A7ZlCb2RXh1caR6fFZOneiejv5P4byxL0KBPAGCW1l+Pi1okcIlOEtnTko4OpBLj6DvLYp9/Z2d/7PX4us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320127; c=relaxed/simple;
	bh=QxTmlqmkQcMN2KoUvbVTTUThuVygMwHL+TjqdYXzuzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pp19xGj3Ylg4QWPLxjjoUGkCe7f5n1FvwLjvxi7qFl2kIMCXtPMvZot7vbx1HJmUUBbutU3NMlW3tRbYrCdirnUSLkUw+CTVHU1O0c2IkmB6i3M0HogUPBrsnyLZm28t/XF+r0Uu9I8qn9JezbtQCA2+YZSVKb0I6toZmQ0gVaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=dnGiVklI; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="dnGiVklI"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774320121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oF49/BYOoWixay/qx7Eoo62r6lKrl/hK0NZyxoCVnpU=;
	b=dnGiVklIYkplql9fr2YmMvX1/li8SS9L0Zcz8aSkYyexnXi8R2gq96rY3eh82ZvWkiLL6b
	HZAmRKorZxIdE0I3dz4sDHxcj977Fx4Gn07XPbLcx3th9mz4U27Hb9/iSZ83yhRCeWIZTw
	sLYbasMO7Hs8NJilels8iBuVJ83IkNq8A88ES3I2iEIahgI2V2x0xO9JHaIxPEgM++f15Q
	xMnoTb0axDpPIZsdQLPVmWXugfdUP/mopPjCIyQuip1r0yxye3ijiCR5MQgvu2mGVYAxrw
	xLar27ZKQhI6JfdpZJIirGd4tuB2wRnkq558TXy+HRyeMe9yVwv6FMVXEQqmjA==
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
	Christopher Brown <crispybrown@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 13/15] arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self'
Date: Mon, 23 Mar 2026 19:41:41 -0700
Message-ID: <20260323-judyln-dts-v6-13-d89f07897283@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774320090; l=1010; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=QxTmlqmkQcMN2KoUvbVTTUThuVygMwHL+TjqdYXzuzA=; b=RYlzolRd+8Y/2hJuzQannijz01efdQlxBCzd8ElmSF8Ah3xD2cEsdrA5AZWzChFKhTKiXCEEN 1LaMzS/GMZyChyipRVDvwq/s3CScEz+xMwqmTdNFiHkUg5EgzsXDu3L
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The modem firmware for this device doesn't preload the IPA firmware
and requires the OS handles that instead. Set qcom,gsi-loader = "self"
to reflect that.

ipa 1e40000.ipa: channel 4 limited to 256 TREs
ipa 1e40000.ipa: IPA driver initialized
ipa 1e40000.ipa: received modem starting event
ipa 1e40000.ipa: received modem running event

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 7e803886ca8f..51fc1735ff49 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -465,7 +465,7 @@ &gpu {
 };
 
 &ipa {
-	qcom,gsi-loader = "modem";
+	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
 
 	status = "okay";

-- 
2.53.0

