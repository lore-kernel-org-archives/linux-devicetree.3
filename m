Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D0C401A01
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659873; cv=none; b=fPZ2oZ6Rigrnhp/vWFAKFrmMCv84vGSmIyZpCgC7/CDDlnh7N3YZuLdmZslDkRtAoJwWMsaQCDGbVHPOw4KPb5nQ+49cELFwDUQOm6BqXecxLcosuwu6PNEJzU7PoZSvuWmiw1PEYtag/0/QVg0YTNoXNzaHjDzt6Y4TzqSKIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659873; c=relaxed/simple;
	bh=zhIzpwZbbblTIMJbAXDH3ozg8URiRg6pzcggfvWIG4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ty1QlsoCbe1BG4cnsLla1f7fsDg2qCHIkeeG0oBpgkPTL10x6o4u3rDuhrLajQOMBjnrugSGP3S45lZQHx7v85TDr4Lmt928g5uiiE2Lf34mcq6DuJmgjzxdVRvVrsIgPkF519NPnyUlOVmuP1+ZtZRHKDcoHZrpicbqqsvUh10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEInZ544; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEInZ544"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so6535161a12.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659870; x=1788264670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYGTfM8APe75/Y5PRGWDLVx1kvx8Ac5mDcbwdwxZe50=;
        b=nEInZ5444d1vOstqbojPUIi4p/S9o28L/GFJOtEZljR5/t1hnofAlT2gJP0yNvAJ7z
         PzjLGRT8lDPp7+xmfrTsKQ2AFogl2oMCcD7eEdu3P/0xhfjZ6IezNCDsmoBeCIDtdkGF
         7ZvYIHNSrzybeMLWNQ+dfeWzTAavT5T8IouyBUEZgg2haVCJxrUVOy1pTakrGc2ixIK8
         qLWs+WfroL8p4Y1mq7baAdACHHIwc1vAg3RCtY9LKTrP/dkwb/V8T0qJY80ysWtFCNgE
         KYSzPSvyaNO5CoCGg8Yk/VboB7+un2acdCvg4mpELyrFIB6rUiNn/3UnxBZ+fm9+C3Qw
         Cn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659870; x=1788264670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYGTfM8APe75/Y5PRGWDLVx1kvx8Ac5mDcbwdwxZe50=;
        b=mrZAGpNh4pepDpDgBD6lzQxAyHIIMR62YWuT98um/1Qr5gW7W0DqfuEtLyjySGl1YY
         kdOSp02BnuQzi2aT4TMql0NGiJEeuPx2fW2wGbRdgdGVcKfc02LEF2JA8nNM42WRo8Jw
         6Ordspn9cSSY8iITwpL97WTdPDzQ6rBlc8/HNWqD/RuHMIZYzyuyLWYTQOWD/tmJNbRD
         K9WSSB2D/htz7QFbcVlH7gQb/OLguM/LM/6HETqO9o8zFdx2uAMz5uiywre4vXKFvRbt
         x7J4I/bRGyTVYneQCuMmAZoEgfGDsTKYSjOXA5D/TFN6ohKJEwx+jOuJicIvQLtaF1IC
         FmHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjFGCJ4h+hFTYjujZ9ACpN76Rw9CUcT4UMd0ErqKm222Mqt6zM/Wc5sVkzljfy0WH8B7K8dZ4TUhz9@vger.kernel.org
X-Gm-Message-State: AFuF++kAHJHFy9wgAqt6uRLfgYTB09C9Er1uDWMa1oURA4FMlbhSjUVJ
	2uw3yZrkchCqaWaGsd1FiNtirFAk7ITAAiKPAWJG6sWNGuyxkUl5sDXt
X-Gm-Gg: AR+sD13EPQkGSvsvGSn8w4/Mizk94fwc7QnLSDXxmt2fZzgqybOQW7DKSMJflx2dffF
	c+vq19omMJBIs+IEIRJ/FtrQKwjXXJ4a5jCWlDkiKa0Pj4NGqJFrz1oBNqf9vJkYvYxrarNqxtk
	qKZDzVEWRy0ezhSaXPv6vNscgIR0Pr+4pOPzOlu7/ghoKHeBdmfZncc/PuWu7HHejoYnp/zv8Yk
	sp/AO+vR5DelYtTwskndHi++msKTiZTtUY//U0Heo7nMo9z6cIVqfe3RI92w0jfYnfhyMZB28tn
	/9aRn+8tDi0g5M3fYeZii4iMTMAE1wYmiojqwskhf/+hMdqiNM1/Rl1hiEy5OHmk+8H8CAOSq4p
	yEGZV2a7+u/LzTTsjiDSUxC6tOP3Aqv7tmI9t2wYZQ5VZQZHiVzKxzQaea+9fPDe7XssE9ka33Y
	TAl9M11jlALCwD0KZUQ8x8Xco5N8aVL2gCy8WZQ/o1Y3RdmRV2Kw73ClQwC71KJd2hADnJdeohe
	b6qtNmB0Cbw++Y=
X-Received: by 2002:a05:6402:5d2:b0:69a:b38d:403c with SMTP id 4fb4d7f45d1cf-6a42f18f10amr41660140a12.7.1787659869893;
        Tue, 25 Aug 2026 05:11:09 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199767sm13841351a12.15.2026.08.25.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:11:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Tue, 25 Aug 2026 05:08:11 -0700
Message-ID: <20260825120812.2152-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

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

