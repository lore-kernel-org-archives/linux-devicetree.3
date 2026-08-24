Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0772B3EC831
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584126; cv=none; b=PypOz7DwkhqpvHSaXmVD+B0J327HN1f5F08riHF/mXTSfR7pm519czRT+M5Tky7wDNTqRbL0RGFHKuL0RL3jY7iDGKMqlciJtdCJYbrF2VkPwybcjbPeMjeQ61UynZY0AkRtI3lwfqo7xD62isr/yusKBvFugFIJc3OLdO+a2RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584126; c=relaxed/simple;
	bh=LDXgvPITOy7Wzp2qLM6nW2q3Obp/cM8X8a43ouCUsZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpNAIMKarBsTGTfDPkY9y/oHINankowe5T/dX+jZU2y1exxgllDGl8iNqPpRDIhVcTc1ZMjFj6A2eR3aOQNZjylPuYPyWc1JSX4GTz+KpLhxVrZ22T68BhnE6Vhljmco9gFvQmpDu0SH2j2cyuJEu44vqzwTK4PrytQVETkDzrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSS5Oa5x; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSS5Oa5x"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso6364584a12.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787584123; x=1788188923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ik5aO5/nHcby7+rYjiLPtw+6IFCuHvPcelwFb5FW4U=;
        b=eSS5Oa5xEwYNRAqFU2AkKIzmysDGgffEnj1dSyUt7wxVCt7Zfrs6cyObs6d6W3vE2O
         mbjl60UeO6PUB/mqSE36vluo1RC5BnUwtZ9SHz7M8Qd66elVJX7LDmyczg39DOLvHKe3
         yzBGXB4YjpducuFA0V7Y4Fm+4FLwzNmiQQ5LrfkxfviihuMZ1eVVVhL+QqGok0X7C7Qp
         AN4Atrl9ZZUZ3F4U+FpqoHvmEUugzGZO7TlsgJaFffQOFTlJ+qfp4vQ1mjUcfnQAR9lx
         CfcNFqSWJ7wqBIJF4i4yi/rcPXAkfXFOyIPXfWwdeQdP92NADvNSSCwSevaKeRZTc94k
         jceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584123; x=1788188923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ik5aO5/nHcby7+rYjiLPtw+6IFCuHvPcelwFb5FW4U=;
        b=phUTITEuCMTA5qwMZP4gO2XbsA6VA/29dRL449U4jhUMMZmB/2iK+Jf2JZnkI8mp1f
         Q6ldd0MdCqNJhksSykPgSWfCbUcQA9FrkBLsndQaJy/csU7Mclkzk+XScAY2QZUHiUWL
         ED1ZivoAq0iW/TBu8Q+R0ebfSEoYiB/DZm7jOEQDKQgjqCmzaVBqUIxxrPGBePvLeq9k
         9eghVBPSxXsEbY9dJPivHg5C6NBpAxNpqDdgpwFSKAiLvMnqoobDXobHqs5QTY/X8kLD
         3+8pmA/HRLy6py+JvFkcezTYYK2+rN8Lc7quxPZcbGuynJLIxFZdt3Rd8Xd1QkA4BN1k
         +RNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrema5qDhC15Rb5y0GoWMemwEsvZzubJQc1WuOw+/FRk1apo4lR3DE+3hP4ptLdnAWnrEmjxUGAlvV4@vger.kernel.org
X-Gm-Message-State: AFuF++l61AdUBTMSuBJoTvOvlFMsR9aU/GEOES1m+vo6Vwx5nGlvWdVP
	hj7uRex1/+Foe6OCMu/F7fiBIdj+qU90VGQYIKMvbC37jasSYmVacae2
X-Gm-Gg: AR+sD13Qke7iSczomZdLdVNE5LIpeVTOjtRe8MCFq5yTzsOL3GU7ELKjtvOK7uIz+Ji
	9VHALg9yuCxD0mlE4sSzc3yowDx2oL7VB5KYMmqa2l72C6Yu3nqvSQH5gUBR07QizMaesvCh07O
	idzLCTV3bXHJaBUQQg5bKk3zrANEhJmwMlAcVmNwB6WXd2dlQiQEz8J9lCF98tJoaNpRxAGQzq6
	iMlRjjwhHl9LCKqke44/lOpx2NYgycqa1aPR4Gei0DG1L6cbnqOG0bnv1eInNvS5w2Ct+/PvpbB
	HlwQOORt0TPjd0KL1IKsy7YVCqvb6OM3D6xZFaC/LKSaCw2ZnaniJ5ZaKnfaXMkHYXNkRFw3Uf7
	B8ofV/X5n3enBpzC9Fte2vGd/mRns3Scm1O88f0BzRy8dXqaBLaSGHbE5F9EE/MgOwPHJJXOMZX
	K+RHm6OE9bYA0az66jiXUtpQGJCi4VAbcJ1xuG0qp5Jy6LxpPAvcDNjupMDP6Q5gyg2LOo/wZ/5
	0hpYFaXRwKLGt7u89Han1DTmQ==
X-Received: by 2002:a17:906:f59b:b0:c20:7cb1:9046 with SMTP id a640c23a62f3a-c24924b7508mr2126766866b.8.1787584123091;
        Mon, 24 Aug 2026 08:08:43 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297189sm1273530066b.22.2026.08.24.08.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:08:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Mon, 24 Aug 2026 17:08:28 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787583584.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787583584.git.stefano.r@variscite.com>
References: <cover.1787583584.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

Both the first and second hardware revisions are supported, including
eMMC and NAND configurations, with WM8731 variants available for the
first hardware revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed spacing

 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..b732ff810265 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-emmc-mx7customboard
+                  - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                  - variscite,var-som-imx7d-nand-mx7customboard
+                  - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+              - const: variscite,var-som-imx7d
+              - const: fsl,imx7d
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                  - variscite,var-som-imx7d-v2-nand-mx7customboard
+              - const: variscite,var-som-imx7d-v2
+              - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3

