Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199588;
	b=cO8KfFJUXtQq9tNyptj3tFD2L++Sr6HaPxgF7II07mmc4OSd6c0RtYXB2r8ZIQ9t9BL2
	 +y83JczW+05GSmF6mZza+aRb0etc/RUSU3VfOp7q0ysNozLEZbAjML74jbVuNeRUiG9PS
	 A35ENSvP4TyKCgU9Mb/HDOChkSyalCRYbyhl/lGCsqmj4NGkL12Awbwrbo9lVdYpkl2gB
	 KW7D8qGsIc8hO0qEn7VLWyrS8nyvSCaVKfDIuRDSvFL4ooGRkGmFwAQLMJhr5S9nLVpKr
	 zL3ZgYHCAKJ3JeXArZ7c6u7Kv3OANFE2kXi24gR/v4i0o+DRg0y5uOGusJrdblCnKfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
	b=mVejPZlyH6PJUnuAmEVJ+oB9ffUIFxqbU9IgvkSL2yQSf1bTqO4Mozz7SCV+UsoLdmy1
	 rF3zs+r8J6CTYEZjypLwVn7UBB7ew1qcfYqobwALguJpRuAcjCwZ6cyCH8e+zrIuUhiDy
	 dOkilFhAOa8Zf29N5EUSjJMqCY9Hj+AihqF8DumRA4llpQllzs2WH2pVRqUXw5SSOvNfc
	 2qn74kL3TskcaJnRftDFWqlW+Fpk1hwdVYGoXW9KZKP/VNprmOb8rT2Im1qJ5/4Ka5dja
	 d/ELgVGI0Kt761vuao0NIY6G6ec9BosKu53TGighWUgMtv55EIzJn6AQ9C/7nKVrbUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=whtBZANh;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D829F606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D829F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=whtBZANh
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so1085718f8f.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199586; x=1795804386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
        b=whtBZANhTOFLHBx0DostdUUZaimIL3igpxHXN4/z4kty2QlmHMBDaJwuKel1F4CJXz
         crIkRtv97QHqYzUqUws9u7GUaNpxe/t3tuYwkVkdn+ktKV0pVkmydLPYbN+959+/yLl+
         ZYG3P7El/Vg6auKy8aOswlWLgqJ7zRVzvkMxqqsDKYkUQhMbA8r3drqXnc5kHIrU/rGO
         /Dg2+N2fOTbuMOvtHezz/iqFXZR5TsHhhugcv3N8y56EB/twdJlC14TYey/TxADa/5JC
         GzpvcQSaVKeS5cOMYXAKbvK/cCbni3Jp02BcXeqS2T3u2kzOivJE9u4McM6sbILsEjm6
         Ui8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199586; x=1795804386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
        b=m7nUoZhVpe17R86fbX6b/FkIYPEGVN0QfupnDDnleybWD7BYRifqYs/aSQ6KEpyGdP
         NaBG4KLaHL4MyYSH239JUA45hn3T7JNMt3AzuCqKJxOG9C0/KAKbGpmKGLmt2lEq8pHI
         hyQrjUrC3iI08moc4hTozw8J5imAWr2E3Sa58ygOGtYx8cLguzBJadKy7DcX+trjiyyj
         aNWuhVWkxcgGzTvcVoYRAoFG6l34DtE/6m78HnutJAwnylGCPDs0m6qqVfPOhBHy1UqJ
         5f5B1Y21xnD7XBgBy9i1GADFy4eAwxew1ghrdPHlxPa8rO6enIUIGm6BmxhVqlBTU0Rs
         V99w==
X-Forwarded-Encrypted: i=1; AL+hErF0JiZaKJKu4HUHHnyJo+bolOLe9XzxpEaOSayvuNoViFYi6afE+EprhYZI4yjVtlON04NJSLRNzFlr@vger.kernel.org
X-Gm-Message-State: APuU4Z/ucfLbH55FeeChDTqohwd8fuJsNd2TOkyCKlKZ/8Y/MHsPhjCA
	k/SXXlyni/w82eyg/k6RfFO1eWKbMoAOD1ruuRCkY7Bt0eUUMk3bKkHG
X-Gm-Gg: AZFdTZcmaJLV/Gw0kHpRMcvO9VXAj0o/6MeNWEZdp/bGuK2zYx6/siaaxERcSj+iGF4
	/J9ULvP+7zQDgM+iWQtrlJbLKYUER2VmERSrH7odF5aA79DH3YhVsTFAvs4NRsPBZB34D35VwyZ
	OA47HqK/+tVRq1uAyEt0CIudNur+Hn8H7z5LhK12IFbHv7ofL/kmhB7TzhkFsxBlbbpw7ZyAkBE
	EOD/RHvyEyvHydXBI91yFLWAY329nZ2wCfToi/p5wtNwiPBltyRf0DvOomgZVAdd0UnCubRyy0T
	TLJXKPg3xQ9JJTl+gbYiu0e9LjS6vGgURzdKuVkyiGviaxlBk11olyg4V3vwfUUe5RR65ZNMGKs
	ng9OHg93ak7GVLctabYcLeLJoX2zNyoye90rHXa+2Vr1w+Q0DOFtc1ef1Y/urP0KiVSgUka7CYD
	j5aehzE0ZKAIwWili56X13GRSdBXGc2baI92jEouBfEHZ6PzUt37YIWAt48HA2K58vczlNnfMRR
	HTLxbhG3qjw1fUQ6gXIPeH4+HXBXuTc0e6e2d+L4OogzmGO0J+9Y8uv31SntXneZJvtBxV4w0LI
	AVO5FNYJcXY3u58nKYUs3WlhdwyrcS3v+HSWfQF8q+Rer1rRAp4NKss+LCeT0cbm2815nkBN+KO
	5lcag6JuPxxieLrRPVuH689A6hre/hmyqc983/L23wDrObvpbmnb+aOo6lmerW5q0tQm6
X-Received: by 2002:a05:6000:4541:b0:48f:88ad:7b54 with SMTP id ffacd0b85a97d-4abb2169969mr6420016f8f.19.1795199586192;
        Fri, 20 Nov 2026 10:33:06 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:05 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 1/3] arm64: dts: freescale: imx93-var-som: Fix resource table address
Date: Fri, 20 Nov 2026 19:32:28 +0100
Message-ID: <48a008ec1a785f96f25c3b6eafa2869ddbdee0ff.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX93 RPMsg firmware copies its resource table to M33 address
0x2001e000, which maps to 0x2021e000 in the Cortex-A55 address space.
The reserved-memory node instead points one page later, at 0x2021f000,
so remoteproc can look for the loaded table at the wrong address.

Use 0x2021e000 with the existing 4 KiB size to match the firmware.
This also matches the resource table address used by DART-MX93.

Fixes: 4ce623d9f1bf ("arm64: dts: imx93-var-som: Add Variscite VAR-SOM-MX93")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- New patch: fix the Symphony resource table address before extracting
  the common configuration.

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..78b19d8918b7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -107,8 +107,8 @@ vdev1vring1: vdev1vring1@87ef8000 {
 			no-map;
 		};
 
-		rsc_table: rsc-table@2021f000 {
-			reg = <0 0x2021f000 0 0x1000>;
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
 			no-map;
 		};
 
-- 
2.47.3

