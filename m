Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F89D3EFD07
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 06:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922589; cv=none; b=kysuf4vkrp2PBzpctGtNiyasElzP25yxqv48OdZ6jKSCy4yO544Paj354u2wqOfEXRhx8t1CZY3QmkPBR5VvoxkQy+xFKU383Io6z0AB+HYAe3GTHgxjiVHf+jcfSkdNqTsq9SJvcbMBmCIO3J2wk/tC+7oeu4hqa9J2RqnnZQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922589; c=relaxed/simple;
	bh=GNNcznWSFBk9BfsFx6sbFhNnUmqowOVWfdNrSDVGjJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i21SRmPchi4CFxyvBX+d4fK9ozpX3nnKcLmK4d3IGX4s6eniyLFcx3Lx7sUH/vx4hndtm7geJVVb4atVzW9IXDnKk9X8X0ok/7wQOlOSJKe+ejGwAKlFbkDLS2c1HPTxVL9IVfOz2nDdcj36x6+qfC8SqZDcN+16SB+/zP9ObJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/v7fW8o; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/v7fW8o"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso5732866c88.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 23:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922587; x=1791527387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=I/v7fW8osF5JTwEW+Xdq+lMaesAM/LNU2PlfjXUmMC2DdsiseSp4/3wXMHLuWXr4bp
         bdarA+twEnAMTOZ5wfns/OdY44R8TxDtgfs6ZzB5B7XZERNVWgt63rC7K/l2gM+YF70l
         tihX5Yf9jnlENm+/9Ts4cYM0EgvmVHk3Ke6Ri/aV86em4GLpbDyJ0sCKnMKs71582H9f
         qNUCI5bhYmzq/D51ziY8s/bSecp5Sch7iq4P2pftI5vxMpxFJSbpn/LTphATegWTSeBp
         M3mv9VEBKSBek/oBa2ekGtM+t0xMhLHIHUs3Ee2ngOWS5HBo619LYuN5796ZwN4B+T10
         BQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922587; x=1791527387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=WYffmWYGF1fiUaWJ7yseUCNAfx6kaQPN9ow9GTCP+M62/jjNHYyVqwu3B/FI94TfkW
         a4osBpYCUvrZ1AwrpncHq0HDlRPmgDdk5eVt6HFuepUthDfONDMr0mJvvSjS2NO733aW
         77CpyQJDXT97D+7BrcPaQaBOElV9PIJDjSPeGEnd4LuyVFEaqn8yc1dsN789yN2uiJuo
         8eVeTiTYx5ueEQI/KgAN/+gRjpMgnxPJYQmUfQQY3l94RWeqgG7phopFZMShC4CLyBuj
         i9I+JqET4zUySI8ZQ4oXu1KkMqzZ55KCT1hpuUksH77NgadH4H+ek5inydYFX2905XDE
         W5Ow==
X-Gm-Message-State: AFuF++n5u/v2KYkecm8y6EBZ/CSzhuztcKEwT5nPjVUjrtyTnmcm38Ko
	VHdN+CT2Zqw0dBH2miw9lkG1zhjBu+Q3JZcO4hVqhE/BPpRcoBFX9P00LIpGLA==
X-Gm-Gg: AYBFou0OS5smXz/pqvuQOnE4I+j9m7oWtwOdEcxeOMnod3zH8OVTm/nUeRfeC1ZZ4XZ
	m8b5ybK9oBEssiAW+utZyEQ435PCdpdqwovFR93ea64DQ20fONRkqLNM2rceInEaLLzcc2xohOQ
	ipa8bXvJGrdMm/uj/ZWrfKCUb6l5jGcN5qRkdrvGwu9g+9/9HBAkujpUFtdyHPKf4bAtfSORjBG
	tw1BlSku8DLc9pmd/+39RHl4KPhPeijzJMga6rn6Q+Mf6N1wTmnRK97e9ltTllBR8Irka6Dsbxn
	DV/8yR+3n2GzTAOCxGk3Gehnuk/3a+CjQBvSYpNHfxSXA8ExA/EJRVytYlLaQimGvITxZi/Xqgn
	7VxaeqjKpu0DaUFWa6djF7a33WLsVwcGTdQe8kCjq6xoYTeyotYbsWoZ1q4183zkObg0lq1qLfl
	ThexToHCA8inhbd4iPgL6uz0NJwIGMfCBHcWj9ixFgrUFyp3sIsnL+I8x2rCyFxRVw9gDa8Q4CT
	cRugjdmVcHzOO0hDNAUHWaX0HY=
X-Received: by 2002:a05:7022:f509:b0:14c:be8e:69fc with SMTP id a92af1059eb24-14f5b9faf32mr1694735c88.15.1790922587359;
        Thu, 01 Oct 2026 23:29:47 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6236636c88.4.2026.10.01.23.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:29:47 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Fri,  2 Oct 2026 11:59:32 +0530
Message-ID: <20261002062933.26497-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
References: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..4c9e96801c1a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3

