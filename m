Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875328;
	b=VDsGRocZn5xpRjLc6xfI0Tio6bL2V93g5n2rlUIsvG6cGro/xhAixWZM7/39sJZBhbCa
	 0CHW8y/3UD2VtFraMea55sF/YDhZYVR9vhY50tugwzHxYANjlImxCICmxKlt0I8A/stlE
	 1LIXVUkWg8Ij3HMuLzU0BIXTPlp77v7dfLnJD312AQr8G+7EVNdLwcmywPRJeI+xv80HW
	 X2L/MgajoNRlsY0bVLdmEPXnfLDlHEP6tnDJl4QLjmPjYYdDXBhMRYPqtqCee6UkAEQlO
	 R/2eqer9adwGl5b7+EwlcKow8wkowPUTjM/uaKPh25Yhz3bLrQ10JZSQhBQXVwbLPQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vKok+0ThrlCjoRPesLMsSdjxyl9vGfxVogmiolLgcN0=;
	b=SXRflYZUsOWuhYF7fPUI8lXvRX+86+ggoLRp89A8BPJpKnU/Qj4ExSVIhvSnNDiQW2M8
	 v/VJj6Xh5jbKmGikfp1BYN3BbxxMhD1G8eO0h3WocJBYLC0OBoGrzzyLNRYBplk5VfdCE
	 HOuewQNXVna0lFQE58ye253owUipr8gd/8DlpT1SlWak9L5XlCxuQ17ztdbolb2up8kID
	 6oVMbMzEOaiw7vgtZ/AaAJZtyFDoSh+ihqHyS+ghtDljSS4pmTl0N0fXwd1mmk/RMs+Wg
	 oFJP3uL5lryizAftAakFaVcbBz9O+1zxAOY6I1YrpCs1zr0X+IN1ssn0Ddit6UPL+Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=giKfUiKB;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D39D606A31C
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 14:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D39D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=giKfUiKB
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so6874303eec.1
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 06:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875327; x=1796480127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKok+0ThrlCjoRPesLMsSdjxyl9vGfxVogmiolLgcN0=;
        b=giKfUiKBEopfwSmoLT7DAXtnLN+3hUkjenmjNDx+C7G94TApoSR7lxLzVQ/v3W5I3i
         w+b1nIqLcjhpXP2d6ylJbcPc1tCpS5+GU+fS8Qaf421tS90YKVvkrY+8q4w4IRE2QKCU
         r7t3yIGEDOQxbIbT1nvekJV3vatYc9WsAtqBrrgznfKT12gi8HLO82lhRMscweRbJ9ca
         zIcSKBffW/5ZkUi/xmTe8Mai488HemAs8p92sVTXrWwVUMOlWB3pA4TDWCEtG8S8jWNw
         xv+2Wvdu9ZAuA8DX9vSZGAYfD8gocd++6mbC1ZCBXGoFDxmSJa6BDGTlmK9bDT6IMbBr
         ZyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875327; x=1796480127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKok+0ThrlCjoRPesLMsSdjxyl9vGfxVogmiolLgcN0=;
        b=MEOKIevnc4wnu4Z/AyMC9XJZjks9IZkWxP0PhrBZFD3qUI7n/Ri9MVbjAHxV5C8i/a
         Ux5J+OBaoKo83gOMu3BLmlcl/OaFqrLBdC6JlATAHvavxXuaww+0LGeu3EA1ebdbsT9k
         9oYlBV73aTv8BST/TQyppiDX4xDvwWAxahkKd8gZ0IjxeZZfRcUwwC52X198zr/hvXCQ
         YWbQMv38mJcueAj7ewSX53u/yPDi/HA/Fb+IUCHHuUIL3NHgHOaOljgmfCUyX/uy9pY8
         iEwP/wP2zN6mXOmYn7OxJg6jrqUkrW7qd2Y73//RvFXMB5k7eBl3OSLEYmEvHcp6DPGN
         Cbvw==
X-Forwarded-Encrypted: i=1; AL+hErHqg5DZDcjJzU4DrqJvGq/RaO4t/u0atXXSJPcOA6x0Az5Mri7mK3MHOVvlRPeU6wWBnip80zq1x7Ui@vger.kernel.org
X-Gm-Message-State: APuU4Z+eaXvXEklw0qyqCRMKaRazg+EzwouSxs4twRTQRCq4GSIwWKsk
	2XdNYsaCgfiknDNyP2uwG7yCSDWFZXhtPRaMK3FfuveUTMcWNC1oFJ+K
X-Gm-Gg: AZFdTZclXU5b6bkLPaqmTBbuVtyGmsXIEGB+iIjDm31hOziiwO/RHyn5BdJrt8tZRjK
	WM3ZI4TLd8sZD/ufeloy+6fAVW/gegfXWmHPSmAUhgRptYAcQ1WXe93BK//N2mV3PTH9CUtTEqC
	uRid16dG0GqDy8S1pBMtsDGk5XVRMbMD4ZAWl6kS815AtOuOLyjwBwwFDnQY1SXFlKhI9J0K0qt
	HNHZ8KJjCuuTcyyGXJg3FU9Bql0AcvRHcofXEJmyEhrRV1Fw5n7dmHiVNjtDcEL2vxj263q89Fg
	DSMKnJobJm2TCl2n2EeIvlBFe7bZjMTLbjSit9p2HHeF5vkwwVP0EHShwkBzaSYw1OBL8Lkqxph
	ZdB0XGZYRqleXEdw7PJ2CzNbt/Heu/lzm/pN41BjC+NxpR9j3KSlyCKK8kBZZwAvr0vEpV/LJYf
	/JtduWLO7pecZdKHncAtmPsVqn8LULDjCgCxJ4aGSEK3tzfR76V0SW/6CpzHly6wcCdWi04l6DE
	VH0wJqlGtqKAseA0kr04az2oNhd/9TX878Xz0RCq8tOyygx/m2jldW9s+/olX+CT51l3fVD2xj6
	Ifoq7XVSxx+mHl0ZfVD7Bi7XCZKSF79o+N9adBjSrRqlqbayldYI2TSRgPpshd+Q+Sotgdotc3K
	fbW5tqscc/P0LRAJh3RTcIiJ5kJOK
X-Received: by 2002:a05:7301:6405:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-3856ff54addmr30382725eec.33.1795875327352;
        Sat, 28 Nov 2026 06:15:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:27 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 3/6] arm64: dts: mediatek: mt8189: Add watchdog label
Date: Sat, 28 Nov 2026 19:44:27 +0530
Message-ID: <20261128141443.13065-4-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
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

Chromebook board files need to set mediatek,disable-extrst on the
watchdog, like Geralt and Cherry do. Add a label so they can refer to
the node.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8189.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
index e0883da15..8c80a1b1e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8189.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
@@ -1014,7 +1014,7 @@ power-domain@MT8189_POWER_DOMAIN_PCIE_PHY {
 			};
 		};
 
-		watchdog@1c00a000 {
+		watchdog: watchdog@1c00a000 {
 			compatible = "mediatek,mt8189-wdt", "mediatek,mt6589-wdt";
 			reg = <0 0x1c00a000 0 0x100>;
 			#reset-cells = <1>;
-- 
2.46.0

