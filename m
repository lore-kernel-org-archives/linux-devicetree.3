Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF73ED10A
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083111; cv=none; b=LsmaiRuRaOzM9A1wSYiF064btAK+dUwwamrvZeXvj+tQSyH0A1HLBdYz+5jD8wGZCWcn//Y4i6TBeHUvTs4G7gOBDxDFNhlCYf0NTux5X8m7pUjoWRVQ8ecIbGLGag2/kpYfA2d39nloyLN/EICL/oTvTstxTJs6H7925kWiQxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083111; c=relaxed/simple;
	bh=wyMxM6YQD+S8i1bLWoADdlaRZYIbQTZSquyAK63yc3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8VIFowXkV3zoImRIxWjtRD3FrlPW/styjoogSTlaul8iyiqi+Jm2S9e+8En05c5/tXIZ22kcpKAnehq16xv28JXm0Hk1wVSpmcOAITX5/hjQxeaRCOJCxPAnobDeNb/8pPd2BZ6/3X6KRkNEfpAGcRwGYAAnuqp0zFpB9M7lnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB3k4Y1S; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB3k4Y1S"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so3891138f8f.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778083104; x=1778687904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLxt3NAzP2ZNWQv4kMfhbYlGVoizEwbznGwwg4XaRZ4=;
        b=OB3k4Y1SXtVJPqjW7sco4WOXMAPVO5G0OrNZ7g5lfYRmPAeTQuNPQtqMwH/2qqluLR
         tAac7KtQ0zMhbXlpC/bv6RJICAGPsVQrucIPBgvKvvnxELq0T4skI+pgReaIKIwhd0dC
         sttYPKEfy8hU0TnzU237KqfY0ttXFeMx8NZLsJfMjp2NUImUr+W38tV7vpGLRwLssVT0
         V9FShe0XexK/J51mTtca+OF3ZU663Z2ENZJKNn26C8VrDUtPUEY4rfNRl/ZHKM3ToEen
         10vRQHOTT5n/6YBcsIUDQ9k7gzU08Vi+gBHhTfnEjFVQJjLAZfux7yL1KlI6Isd2YiaN
         Ab5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083104; x=1778687904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SLxt3NAzP2ZNWQv4kMfhbYlGVoizEwbznGwwg4XaRZ4=;
        b=HtxeIiGe9Ols/3ozpEa1DX2NR1vZMKfDnR8J+Pvi7qiu/c8kHDjEsTIZhG7c4LS6Gu
         4hX6LTeVK0x/Mf/p91gPY76Jps60Ns3ZHla9+wsfVFoTpGTpQs2fHV9OOhlg2BOjpqbO
         VZOjvI2hEbcCkva+lULxdC8y36dDea+A3gqrErUlvZVuTIpm9mlAYwjbyjd6SOGqSYrb
         nobsznEv5405V0oNaREcSPeCugeLnCNSK6t6lsT2RlphESBI992zLxO1adA3T4fVyS8k
         /8g0GP6D2b7RakF6grI9mcgfAw88yRW03u/jhPA5KjYTeYBlnbEAE6xX2It8BObmK8Il
         1CiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bbAHKW4bKuK6HTR12Tx/2qJvOOi+93FAEZch052lzf7NGqUOF/8sStjtB6LXsOrfGkpSuBUCxkUBR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24GB+Z9dYNAyfuUO+FSWYSqdxZ6McG8ZZzuST/L2QOq4BpGcE
	qwJ2WiRx4k7kdpl58j7L58y6oiGjLHNzkbo0e9n2APxanizz223pakIA
X-Gm-Gg: AeBDievsqp6IRCsGsFoly+IQQ8lc4YJtVRZ8UpfjOBnYdH3jkiH7ufTKbepjTA20uWM
	qaJBFnOQx1Z/8NdqT9RuRb+XIVS5bNhVlOpKUer3gkdSAD5sWbXTEzGlrIl+85Lk+QgamE3o+rk
	JyTy13P5aCuAy4b1unEc5lAHxEA5qCeB8m4+69CbvfbwONYIL2JPZ1xe9l4HcxmrEzO+sdaHu+6
	23zRDAs7M14Kuvj87HcrkQ4n2KdvDG6/67sIo1VXZ/n3U34qSPq1vs/fVRZh4P+Hgdd68qQaGTR
	YwrCiux1lZX2/YgFTpqZ2vrjJGWLdqlP8d3c6sOcrhHu/IGs1e+QX9C+gCLUo2qw+fCPwkVQn/M
	jhy6uInatveU+Sval3hmMWF1Biz+bsRt38Y3ZZJFz4+O5kWQ0AinfOhQCDruvS8TphfiFYS/C8M
	YkKvseYmDwcmn6ttH1koUM9kvgQxPJJdBPbQeU2+j8MsSu94P7RHM/xKkAfXeJu7X+hIlKKbK9o
	K/IJmrPe47gbzO8Pob+1p5KlE5k+G/jXjHmPX8LpUKja7bCpD4JfgIlFQ==
X-Received: by 2002:a05:600c:6dcc:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48e51f2f786mr40594565e9.16.1778083104255;
        Wed, 06 May 2026 08:58:24 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b2039sm21345205e9.5.2026.05.06.08.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:58:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add alias for on-SoC RTC
Date: Wed,  6 May 2026 16:58:04 +0100
Message-ID: <20260506155804.3984418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2N SoC provides an internal RTC, which is enabled in the DT.
The RZ/V2N EVK board also includes an external RTC in the RAA215300
PMIC.

Add an "rtc0" alias pointing to the on-SoC RTC node to ensure a stable
device numbering.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 00e5455ea5ab..65c93e5e3f98 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -26,6 +26,7 @@ aliases {
 		i2c7 = &i2c7;
 		i2c8 = &i2c8;
 		mmc1 = &sdhi1;
+		rtc0 = &rtc;
 		serial0 = &scif;
 	};
 
-- 
2.54.0

