Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480C33F12E2
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843312; cv=none; b=MCccNeRc+cE9d3CT0yvTES8MddFEGpO09gMFfSliWzqPEOjc7gYhxb24zNhfUonxbzMMNLdTddg905dD1PIm+Dn31vzxNbmHsMzi2z3EwPT9r9YX8OffHnhjmj8oAKUR9MhHUeWQ1hQZUAH2Wq25TnT3OrYMWsPMX9mp7s4Wdb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843312; c=relaxed/simple;
	bh=otjLY8M+I6ZgbZOeUnR9kBIt/DE5V0fH5Sljc8GFFI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUV+NlkQtqFregQ+esY59HOYddbbUe7rveyekY9dJBJeIl7NrNE2YkBrEWlhhTiDWGrsuCimmtK9FQHI7a9mRiTkkFYxYmt/QKISOelGNAg7jjXOkqo3CbNlTJRk+qsrfw8jojjst5u77rPs6u409sTfFiZ2nQenIwPLsKo2M+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2C7/81y; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2C7/81y"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482dbc9a00bso775371f8f.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843309; x=1788448109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=s2C7/81ya9j4gwhukBuVlTIpQcn3U4BeulvLbirxaua2wcdc3py17DjPpAhuMzamPt
         XDVNG5/LZED0hXHChdOJt75rmbfJzClxsavjyMh1kYB53TZEIB33QKeH3AWRS0UyIyha
         +KCTpc3U5mCfwn7OSBo7ExIAoRyVIQcNGbCyNOUoi2mgmG9t+KC118v1yMyuLsyBGT8T
         xsNapxff5t5YdCyJurGBSULckztFbn8ZIpgNGwO9j/MUw2v8tZ9LHnSd/kwwDIqDpTPA
         hbsF/Ml9KlSUhF3h4XMGp46Y7ZSE6VimI6BN6/Su/T9GqoOQepO1qDmqCbCabNef0ulb
         +wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843309; x=1788448109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=m4x7rUKbDGjj7Ss6oZWJP9A3RPyLC5ToySY7uJmDWVJtU1zsHw0JICJtDj/x9YeuEQ
         q95BfiZEzx8NPw0z92ms5tlfYPLsAfu4MdfbRS6TnKsgueDp3p1vUc4jUfPNGB3SW+GA
         Fa+5Qn3LaD0WFaQvENHkBHGJ5/0z8s5RsquzhWXQnZ29a1TCRVBjgy8uSKuii1Yh53aN
         xesdboECvMcS5uLZscXF3EB/pxsvauiVoSMVZPiaqtC8ONzb/EZ1DK+Wiaxb8911zRjp
         ZQWkWa0Uk5on3BUjLLSh0mUO9/GsVQqVUqCKeoYVXKGzhEJjSxItx8UKvbWWkl1AmLgE
         v3mQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIDtVKTiE+pwx/dDG8vp6+Mie9R5+OHalQlb91i3qpz2tvtrZSAUnAgeCOZHFwVcCuUelybKLwz3p1@vger.kernel.org
X-Gm-Message-State: AFuF++nCfyorzxJeJkN6hCj91005EwlbGu0n9V3xCtp1OPA2bwUCN4WA
	cnQf7r5WK4ZWwMn7SW5o7fnMHvBpshBohcnpKyaGK9UOa39hhf+GV9zR
X-Gm-Gg: AR+sD11aQrnPgmHwwgDx50tWDhBIHea9l0oXKmxVMDvKZN1rBzqP75zEj2Tjz34x4MY
	H9jr16w2QaLc5uDt/Xm3ZXjcoydoxIlNUSgXmFWmwHkvRu1gDbrdEX2N93Qs4YsKNkHP6gJVgJG
	ztlaNNgS3m0GW2XFjHUzQ6/g55aj0NS4+vyicjO3siYiIo/g1NPlue0btOnp7kFZclaVYZvj147
	/Veq8vm5xaeQ9FAMj87hacrs9FL6h1sDY8CHUhtmAkt12BC8GuxMxnN6lZACKhWMYVLAWrWqnIm
	hbHOFxgw10oFMXsvyz0Mdyu9FmGxH9E2jk9451hhoIPOLEi7PD6QVO7a0faFWw+/msRdgERFH4Q
	Z8iVk/W23bGsWFXaPNDsCcCqJkUrOxU3gVig6DPdpu4Qvg4zNnEIVncbtAetlZAebu3M1AOytEf
	qaqmv9e3+YMoeO6AFLoahLPWdhDYyZQ4hgdCpRZ5w4nKRVZgJmES96DebhKpa04Hbau/pJvc3v5
	YZ6wpPshghD2/E=
X-Received: by 2002:a05:6000:644:b0:482:e658:7a39 with SMTP id ffacd0b85a97d-482eaba7f73mr9712719f8f.11.1787843309482;
        Thu, 27 Aug 2026 08:08:29 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([165.85.187.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm10247151f8f.8.2026.08.27.08.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:08:28 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Thu, 27 Aug 2026 08:06:56 -0700
Message-ID: <20260827150657.1657-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
References: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..5d9da745b715 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1535,6 +1535,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

