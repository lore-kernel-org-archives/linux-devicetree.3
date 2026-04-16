Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C6A1A9B58
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 00:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299029; cv=none; b=evuj+EpYllztxh4DQThALRxYnKoKHLN1870hCKuupGN4+dszVs+b/1zzlYZxmNdL4Tv1PlYpqC9kgWnog5qbLMm891UW1uip6A1SNwm7f/ZyPon3rlzV0z7wFn8ilZ7V6MN2n+/L2yhcX4j7QwL+kqtFZbnEzc92LzWydW0kui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299029; c=relaxed/simple;
	bh=L+WoxkoOlxIRT/pd59o1iSW+ntv+TbCUXUSPbLwoXT0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivTUiXCWQJQ8/Kw6NF0tZHc6cD5eWT8qwFT4WTID9LWsK69qvs2JocW87DyAksX9bGi29YnYhcPiWWCgspl9AvNC4ONmmPnCe+Xq13TdUOohhHuAOoir7KebJcqFloG/p1Ji0Ebv5uALGqVkRCnvR39Y7Wij8yU553Xcs1+d2Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=KLsepi0Q; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="KLsepi0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776299019; x=1776558219;
	bh=Ry+SyEti2UqT5WVYvlvsiyP6Yf3JAHi5YvU/FmfqzNo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KLsepi0Qx6Nw/gTgfHTOmMdwMUvGMWqXcLMSnVBym/lti9Qv8PdfnkJh+ks16B2hc
	 qsILUECbx0JD7I7Wmz8TCMR3YlLiNmbhD66K0bpXmYymBF0CVPyVf3FDKmUR0IO1Ak
	 1ovc2yTEuMvI+m/CkxjOkqYNNwp8TNKIZdaxMW5bCeo9oK6iB/lgO6KfDoqFZ3hp/Y
	 afQhZhVh4dZWWh4+LFXSIcTLHp3Fi3ByPzgmgy+kLjF2ItuT6XQLVavFeTAPy20yvu
	 gaQuIVDGC4IDszklWYW1K30XHCvwXNrFkv1dHXmCZ/VJNeFSiDQ/altTW45tdoVtw4
	 QqhkGb2Dq3SZQ==
Date: Thu, 16 Apr 2026 00:23:35 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] dt-bindings: sram: Document qcom,eliza-imem
Message-ID: <20260415-eliza-imem-v1-1-4a90e8683799@pm.me>
In-Reply-To: <20260415-eliza-imem-v1-0-4a90e8683799@pm.me>
References: <20260415-eliza-imem-v1-0-4a90e8683799@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6f8518ef6f93a130d4eb84c6feb5926cec2b59e8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add compatible for Eliza SoC IMEM.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentati=
on/devicetree/bindings/sram/sram.yaml
index 8985f89170be..27e5e274c3cb 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,eliza-imem
         - qcom,hawi-imem
         - qcom,kaanapali-imem
         - qcom,milos-imem

--=20
2.53.0


