Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574512;
	b=d8cui5EkKHp3WcGPOWISTPUzySds6H6TVJC1bdze6wp5ofoMc68B66JOqUpRUvl+7Wpi
	 Fk5hVcCaQ2he8zxPMCaYjS3I2OjHtVqCxLQxKQre+XJhxch67r3+YojtZocCwJKFLLYaQ
	 BXayc/rd8G/k5YgBkuQHak3AgHBxCg52muugMWmeR4rfNBq9ez5M64PuB5F+9lBet10EB
	 7Dr1C0GaHbn+zvNUMy38gknQeWncfxrio3LgS2lKrvnG0r40m4CAv+pM6U0xlvgrUJ1Cd
	 5JcjXH1/BrxvnvhETFydcVz2rbmTdFQyYFQoSfxGrtQBqX13BnksC0D53LEkqlQIi6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
	b=4jXr2jic1IoNXakHMs7vyERkWCTMDtkxWi1dp36cxgcfWrzrsWFNqCkYhN1/YmSx2dgL
	 luPE7M+yT541fyQcm0VEqci7c+WwA1BVfYYXD96qXC7sv47z3IVX46EKcQPknrSoNlN3e
	 QsrdNCkcFUIZdiW6O2Bnj0wvQ6Ux9v/EgYiCBjZsm/EsGDMMFHfaXlMI77jtImD2PiDan
	 1BGhHvSntAzawOlfjQCRTW0Emm+zHFBw+G9odC0yIs5cChc52eAjy62jpufZA+juX9lgi
	 jHkSciiaseB8ir/FsPgssNIwdP0xQpde9myIoTFgvon2LkoA3Ju2pkpHr4JoBAiEbYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=cF8NpgNO;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC97B606A331
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC97B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=cF8NpgNO
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so3134625e9.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792574510; x=1793179310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=cF8NpgNOidXypFF8nAeez+ilEW+mTTKvGgDjDA8NK7eTvc5HanumcYt8s5/RYUCJCT
         1F309TmqcALHdI9ZP0u3G9uOWqrWL/xudfE5Rpi+N2iiSqs3wewR5bZlrqxzvk7khWbN
         cpvhdLL6xVLxnh2sshUTMd840ZGKuN1N8YClE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574510; x=1793179310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=JOm02uCrqirWD5gZnVr9bdYVqtq0M2FGA0SzUXxNn6SPsKolrI5tk2HpfOjNrlIV9a
         CPhdsYkeO6AGgDzYrNe6Hj8/89wmCThJl4o7WnSiQNfWWAP1ackWZMJZtp/bZnsydOQQ
         2NX+PUR3lnu+ubJbSEkzyTFrdu8Af3QQ1RHOFureE/LpX+BxPyrtVsfNPLiL+i1AOB5U
         49v3qir9tdxful1WJaoNjbgm9gsR5c7/SWcZjaVlETGz7cG9vsSmqfVu2mAyAzxUvcId
         Nnjwy7ROTnuEZLOTOxXQry+aVK84i91HY6jtLV3WdHcxSreixxRrrd3WKgX+9PWt/vFj
         oD7w==
X-Gm-Message-State: AFq9FYKJRmQX/gfl5CrHknQsxyTB34gzJYCZaQhpbtyBAl8/h38b+Jov
	FGPX9ghi6q99EFwbWz4bDtlyNf68GS4lQZ7x/pnz1XRartytMqNghi0GDpv5wRZKAgs=
X-Gm-Gg: AYBFou3MGrJtpbxnLKk8L4RNW1sy0OIuoLB50c3ZKUsRRsYQNRnBHGpdm2o+1ZIturi
	ZIuvMrg9qXyF8znDr5eMUzgNdn8k88AqsjD5nLorKfMcPTY3d+58SMFdyyOIcphMlx6RvyEUepO
	IPx3GepauqA/kBMQCy6bpZZ56L57FnmaQlbtInnktOuip7bMlKASQK6+iI332bX67xwvUlm3vh6
	hO4B1Lpq+Dk1ra84Sl8pmTk9RjLaeqS7NYaJeSkgx2s109jp29D8BAb4cQH7X+B3Z75hsVoF67o
	9qv7TLGoPrYVL47INzkdDISJihm9Ri1978r0jbavK1+FD5YD/dA0v3BuVUxtEb/6Id9hIunBSPu
	DIysCjk74qKgjKrihWxMu5MYroQ+J40JdzdaId059krPa40+yKzrFr0l126IQbGifyPWU7tEg93
	MtPZwbNnzHs6gZcQ6OnpbpZi9duxNt6lsIADaOq+9vfO+NtekdTfyCi4+3AyYY8Ap18M45s+X8S
	HBrBxrH/Ztug2Q6QT06RjEvnhoYNdSuf9crIIa38DdTnIkTC65RadogNR/VzEITPT/hEc32mjkA
	pNIkM04nRPSOB/Mg9g==
X-Received: by 2002:a05:600c:540f:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a1fd8cb92cmr29337195e9.2.1792574509972;
        Wed, 21 Oct 2026 02:21:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm16130845e9.11.2026.10.21.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:49 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Wed, 21 Oct 2026 12:21:37 +0300
Message-ID: <20261021092140.4142493-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021092140.4142493-1-petko.manolov@konsulko.com>
References: <20261021092140.4142493-1-petko.manolov@konsulko.com>
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

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

