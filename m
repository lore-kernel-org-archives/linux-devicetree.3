Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE98B3859CC
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 03:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013396; cv=none; b=dlO56mAUGrctiZCGEKR29xa0edEPfXcAbeiUKn5DaSuqIcIcwIxWarK/GTpppgF+Iu9Sx5lqQp0fVtu2Xl6nUjelxKQEnE1vmQuV6BFuJqNSlxv0jr06huMCXsGQrPtsVuCKhQX4vliWqRpZ/ceZLPdwQQ55ewUb+Us9/N0/JeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013396; c=relaxed/simple;
	bh=oJc+1cBUxP4xA2PdQfzSyU3jCiJ8U7GICccKavJd3cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aT1dqGFyckGkDPc2oumHtHWX9//THO+TfvHqZxYFjLu7Ta006VurYpFrywHT7F+6ImjBaXKhhSM4/6CcReUo4VBmETJ7ec95GCvaVV+yRmGS2wt9sqV2C6rEfByRk9tc5YHpYKKuZrNQnsoUivvJspVoOde0NS7OkVkJ6fAvjB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=BiaFO5xf; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="BiaFO5xf"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUCus0PQMAXlm5B90msn8tZF75isfZdVdYeAoVZuGmk=;
	b=BiaFO5xf9o2885yBO9Hq+hs6LUVWSnOzSmc14m5HZQGC+6h+UBIbRRm3EHM27cyfRF8bue
	PgTRA8YTuGiE0FtgVNm6dlkiXA4N5c6IMWMaOvpWutOdyaKlLjq8XrcwKdmgQce2nvoYc8
	JWDMGKQ5bUM76DJSbyjZeMHeBFbDU1hfhbbaD2LSkSiI9MSDqh+tIOVksD/Lxb0l40Klxo
	jgde6UyoOQcLdusU1GSVyaY+9pNMZINjpnboIS/ZO34fct49MaPqHs1ATrt9fY1YTSCyOD
	iW9+pqYPEXVKNndkyLfAwjf/kv1w2mTYINepRojhBNyP7RsVEAINSKNO6kopFg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:17 -0700
Subject: [PATCH v7 12/15] arm64: dts: qcom: sdm845-lg-common: Add
 chassis-type
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-12-87217b15fefb@postmarketos.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=770;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=oJc+1cBUxP4xA2PdQfzSyU3jCiJ8U7GICccKavJd3cQ=;
 b=FCQ5Or5jMdE6XOIkWhi5M4g2O0fefQHBCaJOGhOdMrNekKFBsuVbGl9A1ISyy8MI2UD8A8ZDN
 7HJ3pUJnrSzDgvz5GX2tZCCk8PMYQj+PoNDxTP9V9vOo6tOUrgWKDq9
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

The sdm845-lg devices are all phones, therefore handset chassis

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 8481f0cce974..71d070619ad7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -28,6 +28,8 @@
 /delete-node/ &wlan_msa_mem;
 
 / {
+	chassis-type = "handset";
+
 	aliases {
 		serial0 = &uart9;
 		serial1 = &uart6;

-- 
2.53.0

