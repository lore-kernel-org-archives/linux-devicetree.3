Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB13B9929;
	Wed,  1 Jul 2026 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895122; cv=none; b=CFxKYQ0qAOB0O6DA/tgWApqGE8f32mk15ExvENpyn8ikVLAjvIDpeowDgYN2n5TOmSS5RQw4oQs1fRDy98JAy/sjX4II8sBHUj9QwOddiGl51wLSxucLjiVQZxJEyxHagb1ZSjea8JWQtb/s5MINP4C9Oe0IyVPK10VoqitAgJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895122; c=relaxed/simple;
	bh=naKCm2AE7MiKT2DcwqT2cgOCma8bbUjR3ekPlXMemSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XhfbvdqnLO0qCWDrzCEyGFKPaXhew70F1EVUOwErNv0i6L/RvQtttqVFI/RLR79TOqb9xCBmNgDGRuZxZz7xb9IkrP8OWQSr4wIqNokxd4VOoGS5pxwQNyOLkFCcbHXNqtqU+kb+bViKyU4jrWGHeB881JBFRaasVF8AIeuIC4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gINkERXC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gINkERXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782895112;
	bh=naKCm2AE7MiKT2DcwqT2cgOCma8bbUjR3ekPlXMemSE=;
	h=From:Date:Subject:To:Cc:From;
	b=gINkERXCikBLW89Y87lnOP+6v1dCnilw7ungWlAedJYPlIduDawPGWPG+WloE9je7
	 G8togEiidEbm4clFu7exbu67ha3GTSjsW0HSEN2S3QHFPLXb1gQ1iR8fkZciniJara
	 e+Ptgqd+DVJ0znJDlHJjutJ8j0H2JNz8piLPB65wfEEaQFTLnoLcQ/tyUaYp6Ts0Rj
	 kJSABXvmqxn2AmKi1J1lOwpxtXkbvRm2kl2BoCtOnWtBsYq+b9cxfomtrE7EnpoAuQ
	 HK1KuuwR1xwpmNbcGNStQIKNoL+cWLvFQVft/w+Hzh3OkDy4uC+HvbfSrCsEwIdep3
	 glpP8XSW+ilBQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 400DD17E0E1C;
	Wed,  1 Jul 2026 10:38:32 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 10:38:21 +0200
Subject: [PATCH v2] arm64: dts: mediatek: mt6359: use proper compatible for
 rtc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mediatek-genio-mt6365-cleanup-v2-1-78e3d63b8c05@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOwQ7CIBBEf6XZs2sQKqGe/A/jgdKtbmxBARuN6
 b+L1bvHN8nMmxckikwJdtULIk2cOPgCclWBO1t/IuSuMEghtailwZE6tpkueCLPAcesld6iG8j
 6+xW16zpTO9WLxkDZuEbq+bHsH45fjnS7F03+htDaROjCOHLeVZ4eGReVVgI+hTOnHOJz+Tdtl
 sbvSvPnyrRBgbqvlVGmpUb2exeGwbYh2nXxwXGe5zfiNShN/wAAAA==
X-Change-ID: 20260428-mediatek-genio-mt6365-cleanup-6cdd84c3f098
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782895112; l=2356;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=naKCm2AE7MiKT2DcwqT2cgOCma8bbUjR3ekPlXMemSE=;
 b=wpW/x97FpY0cRMwaxoQ3gorpZVrPs11uJxeofBcqfxIJBnhyulrIUSTlhWKUgCwBW7lQDdjmO
 k8pRm1br4zkCwiGkPquoVz1B9CUymnjhdXu5AZIlhj77S4zXwgCFiZH
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

The MT6359 PMIC include file uses directly "mediatek,mt6358-rtc"
compatible string for the rtc subnode, but not its own compatible
string.
Now that the "mediatek,mt6359-rtc" compatible is properly declared in
the dt-bindings, use it with "mediatek,mt6358-rtc" as fallback.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Several Mediatek and Radxa boards, based on MT8370, MT8390 or MT8395
SoC, integrate the MT6365 PMIC, that is a MT6359P variant:
 - Mediatek Genio 1200-EVK
 - Mediatek Genio 700-EVK
 - Mediatek Genio 510-EVK
 - Radxa NIO-12L
It is compatible with the MT6359 PMIC.

But both MT6365 PMIC support and compatibility were never expressed in
the dt-bindings and there is no MT6365 include file as well.
So, since these board support was introduced, their devicetrees use the
mt6359 include file to enable this PMIC support. 

The goal of this series is to clean this support by adding the missing
compatible strings for this MFD main and subdevices in the dt-bindings,
and add a include for MT6365 definitions to replace the MT6359 include
in these board devicetrees and for future ones (like Genio 520/720
EVKs).

The series is based on linux-next tree (tag: next-20260630) and has
been tested on Mediatek Genio 510, 700 and 1200-EVK boards.
---
Changes in v2:
- Rebased over next-20260630 tag
- Removed already merged patches from series
- Removed useless regulator label addition from patch
- Link to v1: https://lore.kernel.org/r/20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index a953fb527b69..52fb0f832260 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -287,7 +287,7 @@ mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
 		};
 
 		mt6359rtc: rtc {
-			compatible = "mediatek,mt6358-rtc";
+			compatible = "mediatek,mt6359-rtc", "mediatek,mt6358-rtc";
 		};
 	};
 };

---
base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
change-id: 20260428-mediatek-genio-mt6365-cleanup-6cdd84c3f098

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

