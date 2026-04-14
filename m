Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B793D646E;
	Tue, 14 Apr 2026 10:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162842; cv=none; b=OXly2182tMzysB+uhxHMoZyWfPgn9ZHU4GdlZwlwreM07p4cmBipwroj5z63rxBXcDdi51dSFQCQztKQmrvALAGMBFeq9qyLTMDsyZV2B3jNsZ9YnU8kX5atKhxhIIJnuSFMPN2bBvXfdyqsNFzPwJorv58w7ir6LOfzRt7K1NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162842; c=relaxed/simple;
	bh=UQc4ou+UQDzZxINqGXpBn97ET/EsjCNUWs9PO5MU9T4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLDG81FSQFI76D/RJtQBFnTxCvf/i1gEz7gpv3/ARu4KHtXPMXq2VeB4rriyDv/9tEKBLfj+eLmeJbR1VWG0aAKPCH+bKScHICGgieLLNie9i65PcJ2ZhDZngiQqVvXIPPcI3WVzqp13xdtDZ42CGyQPCO0ALzofK4pslRMRln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NrjZ/SKd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NrjZ/SKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776162828;
	bh=UQc4ou+UQDzZxINqGXpBn97ET/EsjCNUWs9PO5MU9T4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NrjZ/SKdNrPnCpprsS45aCtMUiUZYV4cjYW8SHy7ICBnSMTkjK4MHKVf46I9oUHkR
	 9a6vCggXXoMOcKYs7MVRkR/MZIgevGsi5HCdtQp2iqfMAqSMfv1SecWPn3LmdQHlnT
	 fj7gsOQCJ09WSu6Qa64t3BRapjHWD40uQpd77xmnSyrQLv9XwGYZN7fqw7Llqa89WO
	 HG7NfrXozwk7g8INTYY6KCSGdW0zMuGjNOvHZZrMADjNWENyi9+lisHxFsdQd+6N5b
	 x6xqz29oO56Z50+3Pd2KGvNKbk8dkiJ3E6Q9iLj66H6dEO02eazcyNnbEFTdt8OEhA
	 Il7L7iXi4vDVA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA32517E1380;
	Tue, 14 Apr 2026 12:33:47 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Apr 2026 12:33:33 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8390-genio-700-evk: add
 specific CPU power supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-mtk-g510-700-cpu-supplies-v1-3-3b8313e5ca8d@collabora.com>
References: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
In-Reply-To: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776162824; l=896;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=UQc4ou+UQDzZxINqGXpBn97ET/EsjCNUWs9PO5MU9T4=;
 b=XZTakqBs+bu5IEN53sjLNd6l+Agru9M7boQC5q8Cr0xUfHypxBfQTKTISwtJqOisY7q3Q6+rz
 jjPZzyECpClBAp9Cl/ahryTLGmuU4wlk5dmeAOWOJdsu40ictxM/BD3
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add power supply definitions for the additional little CPU core nodes,
that cannot be factorized in the board common dtsi due to little core
number difference between MT8390 SoC (used by this board) and MT8370
SoC (used by Genio 510-EVK).

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 612336713a64..0d5a75efb2ee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -21,3 +21,10 @@ memory@40000000 {
 	};
 };
 
+&cpu4 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};

-- 
2.53.0

