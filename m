Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497E13DB305
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010529; cv=none; b=tcpphRyIYmUZaZ0kFFqODdriSD80QGa3abU9xVX9Cojra7iwBBhvSgiHaPXC9UdWNNTY2oq0PnM+/70EKkIRJ7qr2rw4+3vnRKL9/odkmjTrdRRz1JP1lEXm4a2VdvOLCSj4iasasATZSnRhFsiCqMvuyliXiKsvLFu1/ftnopQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010529; c=relaxed/simple;
	bh=7u1MxAF7Cm+8Fvpmgb0ZciAKGCBJ6Tnc1FxGjq6e2jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHSeIrjis8sNF1rlveHRGRRx3IJNR85y1KusFzPps9d1hTN3hRLmNiUuzh1tOfW4Tcqnu5DRORS4mSHF5h2/RB0FB7YhcFE7umyzuNN++ZJO3dAg5eBczjubZNxRvDN12ZWbVoMDGiuo8QL49xrhBHvTP5tcm3th7scxAOH0TY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyEbYAGQ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyEbYAGQ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceae1ed204so7007135ad.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010528; x=1784615328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=hyEbYAGQiAn2DkT09lSyxSnXF7rpzUeJyjrEjXzGlM1CaANkt9n6cnDRuw5iHpVu8/
         lYrmLPyt62BAJHenbveIGBlZ9mp702J1wd9VLdP0zkIfuZZttJCuB57F507giC+ksty8
         i+EL5Ac4NjIWeCIYyV3E4Hvj3nHqXe+XkG93nwjlH9S02fyWxf4w7lCZTV/ZK9w2P03P
         S4NCez9s4ucb5f51Q0k1j5yd+P42OHrNi9UNcNP7BlFmB3JiVJZTe4NJKuSSlSgEIuC9
         dgwX3T6eEUhsjjKZgQBj8lVBAwj8/W6umvnDbGJZI6NuAtobyBfpxUcLjVnIlApI5AcV
         rnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010528; x=1784615328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=QrUnB9kn0SV3g45OV3k28sgjq5In0/fg5LhnMTeZj8Uw5UJz9l+2aruWa+jG42C423
         lR//izUFfCt0oqpUeCHOO05/HG3jgr4fp/vrjlQhJQUzFqMGagZrbhcFeMj6jUqwu+UC
         kdog8p6xkGngalgcmKn6rmsK8nZ5JwEttZ+ry39M4+JnLKDWbtw8GY4fB3ehiEVO7ByA
         POf919iOt1zMSF34QmA7ksc15UHXvogx2wzii8Nrwaf8OWXtLwbaX/fHynPTtQ3d8QHT
         JSoCDuNUHZvfvCnQ/82PG4+uakHCxdZtheUujuVbf5WxcIl0jKPR/uKR3ILPn/O0guI9
         rLDA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0tPVBz15orUtwMsVZ8tLTK5sVyb4bOrjCLXUL3fgawY67cPQb/VzwaJc3dyx/O41YfPipvRKKS/TW@vger.kernel.org
X-Gm-Message-State: AOJu0YxKQPIo8q92zElAL/dwf/9iFD2pmwe43jiUTNrVzMtdLHp0c999
	4DwPvCN9vBaF5bPRjQRtbyf3w7h3l1uG4PY5cdPgfPlw8yxls5kbyCbxIW3Dxw==
X-Gm-Gg: AfdE7clLSVEgYBecJ3EnEhIOrlYykTatQLt9RHqQnhQjyTie3ZfcmtNqB97bwzD/Igm
	NbEbxOiIKxhtIOX4pfYjvb04XoGPNFBspj/U6TFIJlXEw3FsLwCKetxJiH1jKsN9NqXkLM0yn3a
	6oxlo0mpIVT1VbXJbFSXhn9QfDgG4+pPuNhAzw9uPVR8PP7CLmGLsZQWqw8quNiTr+y8eIbrcpU
	+POjajiF4nLKTI98g8lqHwwiCrgtKV2phlys7BurSs6YFGLITWNRjesbH2eXM3FwEiVqNeQI0Lt
	7Bud/pPMJZJ3qYXRON81XqK57NXwKmW1X0QARAvwJS3CaOn2dfXNhNt73k4AQjLhd+AChJlKomw
	Gfa7GzOJnPAri8mQ44+K3MNQLogOjpaoGHUN74JRd43MW6RFuscJ74AWrwGBiQoMYfDhbavYvi8
	DJMKOpuB81U5Nsda810a5kE8KnP/QoaY0a8rj8uJu23mDuugLv+k+b9wtflsBb0FkcbORPM2uZx
	zr+a+yoXhWfPWV7HI4i4vB3MmGQom8qw/9mVMLdPDHl8jvymGsSlOqSqxwkyQZj
X-Received: by 2002:a17:903:15c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2ce9e99be82mr119230495ad.13.1784010527653;
        Mon, 13 Jul 2026 23:28:47 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:13 +1000
Subject: [PATCH v2 06/12] arm64: dts: apple: t8103: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-6-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7u1MxAF7Cm+8Fvpmgb0ZciAKGCBJ6Tnc1FxGjq6e2jU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xmMouJqPSJF1noyrbuU/0zUwupFotSdCUmn22tNL
 MSs92h0TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MApvr0IUaGNct4zP8pn03a9lHU5/6Uf7uPburYLLTokoCc8bOoqbskGBn+Z1p5ude
 H77je+v3po+cBclImC7/Ovie66c6Jt66B6s+T+QA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 4d6a0411f086..5b68bf0df4e6 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -1250,3 +1250,4 @@ port02: pci@2,0 {
 };
 
 #include "t8103-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0

