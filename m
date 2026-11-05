Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907924;
	b=tkq6eq7EzzV1FZlZcL8OUCtJ1/mkRREKPXpx6Qr7+X1YW+8Pt1IFOK8FBgkLfDcFf8Nq
	 90F/FkDevcLgFB3AVlHgBpDKxqhFRUIJRnaHeyGyvu9st49BBO8JOCugAJzLnrNebK3U6
	 xVW+/P2w088yGzJdVHHC8cgRewF0g1h2RjCIwCVT6U4w9uy1AFQsdBIj8XO8tZH1VtWWi
	 k7u1rLelRMf+9ULTcb1mXoEDSNKDm8wr+b+yyfKPX21DgDmHw4U6Y5GmWsMgExwrQSSr/
	 umDOBpskGmSnlI/Bpn8hTggqv9C/AQ/JVBBFVfQ6WPB192QeT8rgLfn0d4O0Kvu0HuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=TsYBocVkNSKdCBi7t0ztvqpQVdfaXe7iar1r3/bDOC0N7SvsgbRZz2XE3zqwjkhDeGnu
	 eQM7ts5eFPsonnYa6461JUH7ZBHrOMQE3ME3Bt1QPZdye1tkPTaTU+iiEPnk3GhzwqfL0
	 HRXmObrqews4GaiTFYKWJvOPdV8reneYjIAw3oN18qJmYSZK2vd2QoA1mhZQATplX7qU2
	 DEhTCum+PtV1swPpe+aOo14Tm4PPf+4DcRG/kzv7vWhJ64Zsyvx2Uy0Hr/qHCUSWcC+Sa
	 8FXSs5PpmBTsCCRoWz63Wxci7HZcl4EMojpxjOJhvNyu7HUHiinrq9WTKAciZRHgZlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrX5BTtZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E823607955F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 19:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E823607955F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrX5BTtZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so21444285e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907922; x=1794512722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=RrX5BTtZ25KAkyVDqIgIjSieI0yowwfSr8T6mwymv0DBFz5APBPsQ60BLti2G0x05q
         6boqmc8T+fJnxWSpzn8kJusKUm60NFwdJju/vVYZ3iqkbGQzDtfFvv/qi3tNuErvjFQe
         11nINNWnhw0ATZ5Z0jI9ua9qp/9M4BXOQh8gsE8HOJjK9+JEh2ZyMaKOxeec2cZVtpKK
         k8HMWcB67/FgMv553KebZ8rp0aOtZ37D8ZbsTaxepxk5+SsWn0SA5ZeuI9H04WfA/VaL
         WJq5E68OZ+r+EbYxT3Ff7TSgkCiF45epeHQoZdEWx7D/vK7+0qaxziCcKWwcGhlSdQT+
         Ybnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907922; x=1794512722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=gXX28eACYIFmrs6egme8cSYLR3WRKyyaT1iQOGSHbRpt6844odapaL3w8GI+bwj+wB
         RllP18duozgWB4Y33PxBwIs6F2e8gGAYmcApKaRujdmiUQQGxF97UPCfPpLQg/EtjP1S
         j6Qfyr9r1CsOcfCXuOhljKPKFmUCiuHc+QVihNlj9uIqRGugF+WOLjsjdi+xLPJMys9s
         WwIWemR3ZNDfTCmf1xUaWAvs3iYS8hgBLMU6ONhfisYQJrP6zutdNAAtZSahcxD1slIU
         nt4YgE2SJ+hf9J+t5CDRfh2ZFAwutltJCFF1/dpMQq+UnUgeEfQnwaJvYrLRVAG69Vo2
         qk1A==
X-Forwarded-Encrypted: i=1; AKwUvBz8Wbzjl/yeC7EVsToR1RZ3YaMME5kvcyEM325E9LMpwKruAf0+5cGrfu4eaIL4VajPtvdlNT3t80Rd@vger.kernel.org
X-Gm-Message-State: APuU4Z9LPGGk+i7peTyq88X3gqTNyiFt1ktlMUa7M8/wx+GQk6uEadyp
	omxXgmF/q/0LAXYCLzs0AsEcqv5Gi7YVPdcPmF/ipPIF4mnCcT6pLU/F
X-Gm-Gg: AYBFou1/VQKzr5MmaLHVVKA+s8gfLkBEdzZ/A4cA7EdkP0JAnIyzkLhFR0holUSkI6V
	Bc1ITS28P2E5WscXsqIZNm/BkBLAI2vO5NepysHSC7wFwAdNW+doV56KdcHR7RH1QTN3PNbXRZ3
	nMaDG6dtXfpaLpWts39knEvQTgnpxa8z6gfGHZuEYljRG2AMXCWjboIfsbZLxxNE8vIz4A4X2Tj
	GZDg4jX2CjJelli5A9MqBi+9+7OKh1VLKT4vSYBPn42Bs7Rok+85UWVobvnYR45X8fAImgka8nJ
	HrAV+X8lMGNtoOiszPg2bYcZaMMn5Qb4hp9LQMcmGCdoMmOgm4MuC0FH/X/cXDnE2WQsRxquslV
	C2SsJzCAZWTj2N6qvzZt+GTxCZUGxZvH7TvPrEG1tCv3dZhK8rc+68vymv1TgDa9HprmvCgmhTr
	Gob91L9B41+ccDWdG9T/FJ2HCvODSAQQ/iVlZRsKVLv3mGLOpbH16FBpNHOcNSsPEp1UOEvvlK7
	OUS5hPJUB9293VNcgcIx10p0nhUdZ42Y5Vp0kjaxAhVmENT8BOLCxY4EYnkY7TeGd1nYWlPtsHG
	8B4QAqRt+mRNzJ7Rtbf6o8q6
X-Received: by 2002:a05:600c:5285:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4b6db4a9a2emr3123275e9.2.1793907921887;
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 2/8] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu,  5 Nov 2026 20:41:33 +0100
Message-ID: <20261105194426.1113050-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

