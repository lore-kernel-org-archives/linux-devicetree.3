Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677780;
	b=k/iOiyT+yD4kx9uAvcBQxPwsq7flH9FHu46ATYr2fnIOVZ+uNrbXK0XWo6HPXo2mG0z7
	 aavjBHT10J7wN/cZEBDDLXnnlLXp0pxpfVcWKojzZQPCA1CQeVoNAZIQtZjckAPyHtBRb
	 YtUe9jBSt5e74q/rUcqo/bHYXAJqYCsp6Mcew/DUFfXE5q8kGgwGxz/c1JW45pREnzfet
	 LYtY7zwZao9SaNey00jOIZOcKe5SY2l/gQwnUBWtDo1KiZ2fimPQaRvBh0AnlXJDqHuye
	 Tkw/ZzGKaff+Wt5ONb9ha+zHvCFz2E5tr0nVbl90H/pBYQQtbeX8QDnnFoS9mrjO3hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
	b=e148rfC8ndI8o92g6CYVgcI9mcaRKUG9ErlMu52R3MJAnMdzYPJz/GasPZd+fthMYu9J
	 AQibmezORHkYtdId3mLALDqW0NtShjUMX4mEAaO4hFp/ZYMxst1CPzXeHXzvYA6GkWu34
	 AWJc3bzKctxgqKAy9mSmjZn8u+aIm1eMijzLLkJtH2HVb6gK1Lk5ImhzJKW/tjlPP/bf4
	 KwtG+wrKKh1Jqiu7Rcitkk6Bo8Ns8MbLK9PAtsFtp7MmDhbMoTG8TGV97VzfUc2JAsMSy
	 wuckweokve/v2JexDrHBgmp84+PcvoTBBQC6mGuJxwg3u6s+lYKBkjFQGjuhUCg3giw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=EP8e9QAa;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5828606A327
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5828606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=EP8e9QAa
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so22554545e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792677778; x=1793282578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=EP8e9QAaUjY6cM9M5nPxnvTYHrWXxXsqbhq5tDF/QGu1ZhClXfcgqI5wS86Rm0gaPW
         rRgOC21yhxH5hxWfDVBw13SYJuwve6YRW1gP1yjDfw7YBP8WbPAlu0dqHSzaGNa/lq61
         ebpg6PvCLvdS+MHzudYMNyoDYASUCFV7maL6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677778; x=1793282578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=qehz6DHMSw3ETIALlD7PCyfs8L1QyjofFuZ2h7+BIxVQyEmQ2nWM41XnJKdKW/WaRn
         H0r/VI4v0kNbKdL22rMQm8edfE/Z2ndiAc3EgLSP7P2LXfbRR8AdwAZGXRizHwpbGhLl
         xNtLc9l4PF/ejifIkyzNbEzsAuGZUdjoYfUueQK0SbC0EbY64wDtI9gSbe2Cn8nw96zl
         X0x1tnSP0iIDYEc1ye9pdltxuY6Z3EyyAZXZUOucUguFPqF0JxIULHF7HuIh0UiOlWZV
         2tq3Sbse+wN2mcdfBoHVXd51Pbmr9eZC5vEBT4cF7/Q1HmRGYh7GzNXAXQX6KlKposb+
         h3Eg==
X-Gm-Message-State: AFq9FYKrsXQXxi6Kr3o3l5xAG6ZoRUrn0ju5+9SI8tUA2foB6RRY79eI
	TpwMByC6XI9yaNsoylSql0AD/IgjBoXH7NwRImXu1M/S5yflOitLpoyQPBzcsG7VdyQ=
X-Gm-Gg: AYBFou33vKIgrPXOYcfCKV2pRw0fQJbo3C4ZOIX3k91dB7BfqTxm4Zy5BD7hUknjFNY
	uECWzcSvqcC4RphEf8jylq25B1F8leYIPP7vApishLB7/bRwLy4INWdvX6FwOKftvueVpGRVuwh
	6Ty+xKWjnIoTb7Sx32DT9ALiWCJTjv2V1s6sZ8I0xfkb/xmzJ5ly76bW2NNlLW2s3af3ePZJoHp
	B5xSIUEa/k8SKTgViOBF3xdWkjwZkiQ7uH9rMplNJ6hezrAMRxtvsWGzgbwS1lU9RNVMDTTyxyA
	lbysPDwg/j3gBmYSfLZiOE29pC42Sz3kxYrXVncTCquyio0+l2snfTeF8ONyc+nKXbXNQYsT+Q9
	yKI3QilqR45CmA2p4+NjCL0b7uC5PANTEpv6OnSqE+sFfz1orYNaCXFt5f+BxYTmXLdhV3h1uBa
	3MYlEfF62nxxCZXpSXGidzNnw+scRKKLAK9aAjHJegQZEVgIPpzM9xVHNdWHgTWZ/hEtfdZtKAr
	zW3oetK3CF1vbAJvUs5jKCTqucm36p4HO6Ub6dDSFCGzG3ovx4YFoBN72n0jB6S1IBmLtEt
X-Received: by 2002:a05:600c:8b43:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a200a9ef31mr92100115e9.8.1792677778171;
        Thu, 22 Oct 2026 07:02:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm12538258f8f.32.2026.10.22.07.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:02:57 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Thu, 22 Oct 2026 17:02:42 +0300
Message-ID: <20261022140244.3476844-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022140244.3476844-1-petko.manolov@konsulko.com>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
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

