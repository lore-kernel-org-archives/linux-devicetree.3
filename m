Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA6344D9D;
	Sat, 18 Apr 2026 10:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776508805; cv=none; b=ncSDKxZhfrg38igD98rcWL1NE5IUUm2BZtL6V2O5roEOLlJ8y9DUYjAvFQNLggpFRxZt7DAqIZKWWp7trWlSGm+nc4yJWrFWUj4aQrkSmeL+Pm56MvQW5FapLxgdTlIZxhPbz1TDXHNJlerHDLQb0bxcp8tC6n/WaJqLuGUQNHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776508805; c=relaxed/simple;
	bh=8lbbMg5em/92sOvPnAUbCtzoqgV1R4nNnFgrSyPUWNo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9k1QNPbyI3skUMiEGpf4UvDR5KzcYKZ9IxUWVui4+phFP/r/vga9PAR0UyEgUcTaEBgeo1gTVKcLmpy35djkWGBN8CBS5bN/0PAVB4uAeU1osydUsfxd/yD26S4nvzkCG/hkSrRu4i8s9NjE9pM22y3cmNOlSGVzIMIA92beMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TUWZHnX9; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TUWZHnX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776508797; x=1776767997;
	bh=CaxoxlYSWajBIKdC/lIkkW6rfvdMjvKQKsxhURDX6Cc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TUWZHnX9vTEJpREKV8IUZ5XU7pfqnLASWYAFY+WX0udP/S6jTuS1QMZdIpgjRVaWz
	 ogEEGv5CF00ySUIHUxBtZxUEpC1ymVAVLLZgd7m7ZTuvyVKYuGnwMObuXOT0fo0Rp2
	 iCV/C1YG72YP2svOSmU9BBCngzy5v64gaxu1OitSCU0NB+LPOI5UoEY/r247buPEbh
	 SMyBFys1OzF4n5SeaDP+48QN+KzR+8KMcNfHFk+4G7+tzosjEf3VMdSxN5gGFR7xBy
	 OK9g4T3OedHp+t4e0FqLZdiILbpb2vov0pcVmSqePPmYJqQ6TpBW0UDatPbPkh+F8O
	 iLb1sL9jhOZGQ==
Date: Sat, 18 Apr 2026 10:39:52 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: sram: Document qcom,eliza-imem
Message-ID: <20260418-eliza-imem-v3-2-bfbd499b6e77@pm.me>
In-Reply-To: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
References: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: de472ddbc8fc95d2928ed88889eed58c6ec75f54
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add compatible for Eliza SoC IMEM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


