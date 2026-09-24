Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE543F9F50
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275145; cv=none; b=TASWcQoC4KO5kA4yS1NDNKYyIpZLuXZbvgA3qNmHRwoVAxrU/G4EWAyF7/drsn/0Xu/l1/crW2LkIeMwAyowqiEV5kK+nc3VDWV9xtKNJSpG++mSXXACe7Zu3cCBLyjvO/K6pJZIA1z166xClnR14LbAiNMFlqBAKxxf2vmolYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275145; c=relaxed/simple;
	bh=ri0EKLCo9ykbHgtbxMCU2oFNY7ARzNutsXrI2nPbGwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIz9y+GTiiBnmVzS2+B50IgFBdqC0ejegip/dcnclZUp1ecL05JfGl2iCPgNcLIZsf98C0wUG8bTrncn9pLOOv2OGhtVvD4m9cWSyfg79d+1TJJThoIFPnxyDIF0JUCPQdrb1HyfiJDoSbZczsLRqIfpZtspSIy+VrtTf83AiQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=a5tb9TcU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="a5tb9TcU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso7102675e9.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 11:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790275141; x=1790879941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=a5tb9TcUHs4JKCWTrvGIIaMWghQEmrjLVL/F7EtGLNlw8eYOH4odhT2Z00PQ8mLyih
         Xhq5cX6dgfcunaKci4iAk6VvPPt+Ss9LHO/E1OI1G4OFYA6sxaj70/podmzYwEN7upla
         bdLXIfs3amngzGsLn86g0HDQvZMNG9LmGb0MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790275141; x=1790879941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=fTqz6qlNfiold1H0PmU75e87SPkp8oBMSZ7W4tgFgJHQoCi+BZ1Dd5+nzkzeZ8JCMy
         O0l+JPo46mC6xR91LP+OjWtc4YbV6ihp0+FAWxT8Os1jIBrs72aWdviaP9zo1ezzozcj
         EiKfy29LijiyB4oBwFfX4ReCl95FvB9QpSNY5n9VvwpiZtDuek52Y9WEAaa1HBMti54u
         IHsSbVvVkiSO2bA64p1CIbldFbBWurEfPyo1I2IUu0c8fDtfDSPdgoIkhy+YAIPrMc0G
         iH3uoXsg4WSETpT9BQfJEu8Wy1xnGkTKf73jNfld9wfx/Cc93EsGZ8ke1oNBnabUtmWn
         MOWA==
X-Gm-Message-State: AFuF++l1XEaRGdAZVFyUI57o4WRXJ1h0RafYARbOYanZbL0HeckguHG3
	pby6pH9zWe1VOgb0RN+stSLukjUeA+LSODwNNH42H9VZ8SsJd1S19rg5mIKr7oM7G8s=
X-Gm-Gg: AYBFou02bF2IbK1fdOJrfqVR8lmtw9icPAzxR6Nrd5kIzNoroc5GykxhKTyl+azwwXz
	tWJvtr/s3DgcRh3bl0jFIZzjtezCB0yeKgHgKHvjjLl5/4yHbZNgkg5AsERs32L+jxb15aPmYbR
	BcwVUSD5aNlmnEiDQmJeF0U+AQLaQCspIn9JtCUyI695EC1pw2L0TR/itMWK6fcv3cj8tcnxpwD
	YEGI4OmcD+WWVd8WNro/B6HassHcuSh0tgChw8iNtXIdYdTajxys4RWtONAam1cOBVb2mLd8JuQ
	d/9S/lmlsBXXBQU3J2nkRzl17O4CxMHjcUltGn0iQJife4RMo9Y/N3/mqpFmRIpCnNYjr8NL7VC
	swo0QKL3qzbroFx/rMbZplrD1sCbYAzkpy/nn/LGvVsFbw+TWxvkJoHL/DV6VCCjzegd+eof9Bs
	2AWRlqUw6lNWbHVWHnGnHBK8yzWOoc7mFAjDccjTplYmrrmYoCtOouV9foz2yD6rrSujQ9CfRNj
	JiAydfMPh9wSfbd/o8RtfBEVA==
X-Received: by 2002:a7b:cb59:0:b0:49f:d84d:25a2 with SMTP id 5b1f17b1804b1-49feaa026c8mr36096375e9.4.1790275141515;
        Thu, 24 Sep 2026 11:39:01 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84205esm852642f8f.37.2026.09.24.11.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:39:01 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Thu, 24 Sep 2026 21:38:53 +0300
Message-ID: <20260924183855.1393302-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924183855.1393302-1-petko.manolov@konsulko.com>
References: <20260924183855.1393302-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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

