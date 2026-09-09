Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D2B56B840
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968456; cv=none; b=jBg63oRyDDwL3nHTK8EuOOreFmRyFpe6kvidWfb83iXxAMvHPJPsINJsyhxBOwCwh7UuYbpmms1T19rdc6QO9neEDRiORQsiYvH6haBo4szhX2SZCkAhhBk/vk2ST38Amx8AmJu47pj8L5eeMmzDS3862uFOKbG7DQkSa3FTbME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968456; c=relaxed/simple;
	bh=2tYt6Xz3Ww2Nu03hw+VbVfk++p/qUxznZgUfL+6yi/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAQNK6Btkf4ZzdMyGAclvUtFjWRe90n7hQrCWPqALG/+q1dbyaYv1AnQRbLIQVCQhTZ0GAH9OngubCU9pYWKfcPcwr30T4jj5MfVM0QNweV7xmcDYfec1FwMJwTSiX679L4toFu/Tl3Vb1DkECE6F2lM21lqWix1m5842/5QwfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a++l9u1u; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a++l9u1u"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4858303de5dso7230566f8f.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968453; x=1789573253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=a++l9u1u0UrA2UvsE2v3E0oTOsbk+dDKaHv1u8aM9qEiQ1yx3AYp4XjhM7XJcESAHP
         mW0k9VvF2VVWpxA5bGqZzEcNU4SllEi8KRAqQRZ+VBmIonPH95UZFm4hdYs0DC+DV5T1
         tK5/OBWOIAIGE5/MXh0Kpkc97Z3UdKtemiK8d9H0kt2ksf0R8yMkBnxa7tsO6zbb+ca0
         pECFVSmKkdkkT29FGVSa98pnwBzhXEHQ2T86VaAkRroL/sYAuZGBuq8yBxXlC8AKWzQE
         8ViMOIIWXBcyM9G/gyCynwzbqGRXIOxhRUa3gUTFq/SjhurPg9tHhdadMe7zzB1E6Vrl
         m29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968453; x=1789573253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=aMwu1tB2LhVX35u53XfGCc+3lyYDurKiMws7BdVBK2y/TIYLKc9lGN3j7nZ+MwK2c/
         z8c5i4XOJFIsS3uHhS8e1utSIlcxrgknMaiTo0HFCXBRMJihcxhJ4GWkdESPfviLWlNq
         8Y1xEW2SqFiyiGkCkX3JEzI9Ne93n0MHNcr7hF3Zxmv55B56lx1aWZDqpJCufP85ccTh
         /cIX6/Do9Y4jbHo3b2V2ttdVvcL8DkOj+XRX/q2LrON+IPQf5dM7VI5aC6PmYu0I4d5z
         nm6zFoq5CUc/Gr4W7WxSiDX+XKIC5hts0hD9XDexc2k4cRS+Z0JSlHDSCPXOAGxA0yCL
         HlYw==
X-Forwarded-Encrypted: i=1; AKwUvBwVvePH0WfoiTtgYpCH0X51sV4qRkAoUXXSUa3UYUAnCbGvxmoJIVmfitbhZ0wX4ufYCCTG+ADza4Pj@vger.kernel.org
X-Gm-Message-State: AFuF++lCLpdRVCrc1M7vPO+JCO2I0nqHfMnrfUfd9UndZyzV0YpTcBdt
	xPDADDEVz4sIV65gW078ExWWwpa9dGBKw2skOinYQ+e/jV9iCc2e1Xbb
X-Gm-Gg: AYBFou16fbMp6eERdrlrFxE/LegLc2GItEQyMq5cdEP0AA75TEwoywwlzUU8syAIuUt
	GxwTvCg3RPGoFYEN9KoAzIcKqlOfbJQq7+p+zFbbIhZ+XwH2GubkpuZMcLnI9ipLnBonEH9sc97
	t6q8HJ7YBMipkPbMii2f01lhkaecKC2WUf+azx0HjwaehG0RGsgt3U5csHmp04nByvPF1icfmCQ
	EWj5zOQzPJxwDAd8XaA60gzRKZ8XAbmuAIEdq8eCJexZ/zTsjxZCPmE9Rrn+rqIh/WmvmQwd4+O
	dut8c6r0Tr/puAqxWv7/iVjzI4qgn6tttChi01lbol0ZzlooYUenOZqHaHvvNdfDZ1z8/5TkZzQ
	zQe+iqcI8YYQceqt7OtCIPWF99kvMYPQzBHXKZ69aHA9xH4E0oxYaF5XcXuzY4W3QB5pgu4klC5
	LE974X2yf5Ln0yWIX4AizN5VYqVNrDCULsCkd0mqmAi9gDBmQWpWPQZsYipofjqysXNnntux68g
	aJxEyETnBwNJWwKrwvnh+xAWw==
X-Received: by 2002:a5d:588d:0:b0:485:8c16:a338 with SMTP id ffacd0b85a97d-4858c16a615mr33895800f8f.45.1788968453181;
        Wed, 09 Sep 2026 08:40:53 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm43810943f8f.32.2026.09.09.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:40:52 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	consmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Wed,  9 Sep 2026 08:39:42 -0700
Message-ID: <20260909153943.1048-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
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
index 338dd9eafb17..c91ae3ab7cd1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1536,6 +1536,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

