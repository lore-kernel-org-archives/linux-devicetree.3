Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F2345ED7
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 01:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990844; cv=none; b=iGK/1Tfmv5i1cLRO1bQJI+qAQR8fs3Qxr14avd5IK+qg4Me4P+HWaEnu82SUwCzXF5jO3KnSnpFWyzn1TjtbYVuQgcB2bncVcxp03PQ/DRBYalhuU5FzVO7Qh1oD4SZWQ72UeDv89aC1mTrhowFUDMAmmYF5ZEoxxDnVCOhUxU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990844; c=relaxed/simple;
	bh=fqgab4hqliuJ5sJXJfAfVMHg91lDalrjupRyxoQcC/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reZp9hsLbliWGCpv+A5upcT4UfTRuamGUJ31nUN3XCv4FJTy7nrt58r8hZkOXZBElIvd69iA2kGt7rJh6fw/NCz0Bv01YT8rozDUlkLaSRP4AMQTZB77HUqiWVFIIyGISdIKn3DBmhPJt7BTVuDI3fTpF58NpXJcyWUg1666vgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3510f00d974so224513eec.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 18:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990840; x=1791595640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WQLlaZBcT5TiKH6jHmoF4Nd+NZMHVC1YNos0SXXELk=;
        b=zna669SDuX8xOIm/RuP2CjF+XMKg0tCaF2FPNJU9FUC3cZWUpSYyZ/dpmnSni2KX3M
         VGFXUPyqQTaNoPgryKpT3VxbZb4ir7g0KlTxptXzT1lfc8GjgKXDCQS6SMkHLAiwMsmR
         SOQ+YGHCfnwcT0YhQdflcNO70EguUxyte2bQZxFwscJPxBTV4WzT/sy+wjzFrFdLLCUe
         Lpm9G0vSvoJz5EugclP9nc52roF1eRRQRXfghfGhotnF5kkiHz7f9BYKrM5s4Rlmfkcy
         SrwXE80cundVMYv3HVH2RQM8c1ci55wdMJ9TrnfRbHGNBJY2jmEziEf8u7+p05dAoPFh
         pvxg==
X-Forwarded-Encrypted: i=1; AKwUvBxxCwehzUP7afM7XNRFhcocF5KEk7/k2SoYIQwB7JCH1ggNuuW7ZpQq7Az1bwcjGR7yl9jTump0dRmy@vger.kernel.org
X-Gm-Message-State: AFuF++nmdS0sLfCsqrG39Ej8pSNCcEbFSn5Tmh40UFbbUqTXTN3SwM4p
	CvVz4SAelFmozSaCvu1nbxncdViU2s5mirXEnlpdugUiVugnDUAd9mgc
X-Gm-Gg: AYBFou0af8ND2/1DaHmn7BLkE7725P/EBA/t6jO1k0Ea4FZIHmoNxWXLo6y6/M0o29j
	ZmScDrloCJ9Z7HEo0d8aLgvB++80rSCPsYZOuCX3ZjI2HrusV/SlLDYu+ElFtpwHWTTRnvtVbUX
	Np5uZCrfqSKp4vmdXzYeCV330OMoYn3Jb0fs+E2V0IkHd72VhqPRRjJebnIm60vMpcyyYFO/pqB
	l36C7cXEbGzfjgECYN3GSSBzHL2C07/gVgra58uyeo/rR1PiPaCIAE5ICaAdSJvcH1OIWicsplP
	8M6mOmlVqg2J0oK77Fv6fa4RcS+wE/7x5liwX0rYjGdaLOYQfx27OH9A0JWzXDEkNbmXpl6V3oS
	JHhPc6pZtJ3WC0zsE3fzRvAMIm2GhY4upofyd90NXKwVP+50a+47g+VlbeUyIxRuxRra6mrkIIz
	G+1oiw1mCDz/3+/pCgTrTNkRkpWFUQNL1ArAA0DQvrPb02+xgEnIk8fJUjSPkgsJaPX4WDmaLzA
	gkvJ1dv/31LNFy34Hyod/b7s2TGut7rHHpYp7K3it8SzbgSEFQiZWf3CEdJ9DxI2winIflBbPn8
	wZredxQhu52KiPp+EmNjtek+LsF41N3RGuB9WSnYbebR
X-Received: by 2002:a05:701b:4510:20b0:144:eaa7:2763 with SMTP id a92af1059eb24-151c2d0b226mr1341545c88.16.1790990839589;
        Fri, 02 Oct 2026 18:27:19 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa74fa1csm1218093c88.1.2026.10.02.18.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:18 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] dt-bindings: nvmem: SID: Add binding for R40 SID controller
Date: Fri,  2 Oct 2026 22:25:35 -0300
Message-ID: <20261003012534.418820-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003012534.418820-3-otavio@ossystems.com.br>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner R40 SID exposes its 2Kbit eFuse at offset 0x200 of the
controller, readable directly from MMIO like on the A64. Add the R40
compatible with the A64 one as fallback, as done for the A100, H616 and
A523.

On an A40i, all 64 eFuse words read through the MMIO window match the
words read through the SID_PRCTL/SID_RDKEY registers, so the R40 does
not need the register-based readout of the H3.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index f67470b8a2ed2..a4960b0ef8cbe 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-sid
       - items:
           - enum:
+              - allwinner,sun8i-r40-sid
               - allwinner,sun50i-a100-sid
               - allwinner,sun50i-h616-sid
               - allwinner,sun55i-a523-sid
-- 
2.55.0

