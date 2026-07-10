Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB53563FA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665241; cv=none; b=E+2gXZxq+qwsbTcEuR2AGCLJ9sOKvC4VgcSFpdnxZCcgJHXZ53QE+c+Jv9bX9GBbd6DTef62bzDKoN0Jd7DXJomCmDwQn+6dkQCRlbk+StKxQ7kbFZ9qfi1FXeSqXlip0MMmQvKaBiruwePtJ/DujsFLUk2yV7VvYey429x+MSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665241; c=relaxed/simple;
	bh=dbwF3XOwIkmwKWyPcfA1lqI8eP024y8lcreua3BESFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DL2k4YqLYTBvABSG8QLZdlkzqtjE2q1scHeteoOYmWCHg6GeGAGn9OhboJU0LkdCCOz42QlGQp3GYEq2kfuzXRA+5NesbqVhLaK0gkAAWTzQYsfhf/UzZvNud3UPxWx/JzQAJ24pBD7cZ0FFPlWu5+GpZlqYyMV8+7dwCsJaWvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHX6o88t; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHX6o88t"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so590825b3a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 23:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783665240; x=1784270040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVhq88axF1qV0hsa5snykJF0ozONqTGS7mDXfQTF8KU=;
        b=eHX6o88tFcbtVnYYLMK0Ny6x7cwUYpRp8+Bdfc+AaUzXJpWPfle9WNSX/wlzradqWx
         1aIzN3xS4HrguV2BZd2Dn6fGTtz7PO7mCI93d62KL67h5te6HkJGE+0UJ4GYYNQUJMgE
         gNvbf1/oPaX8PVWceMP5oZti50p+YjqxyaUxV9E7AQIinPOq/KEIJ6INQjiGBzL3RDdz
         8P0wP8JdFbHV77mncSyV/mDeGTlv8m59B1U7XiVTLmPBLaNzTIATV3KGLD5GKMr47UOC
         L0Jp6swTxoZKb/gzSKClC55K1mz9DZNuTzkevs3O8/TzWZ6QwCsURd6ZyXMb1NTGrauu
         0Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665240; x=1784270040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVhq88axF1qV0hsa5snykJF0ozONqTGS7mDXfQTF8KU=;
        b=FHDyfy9STSCcAeyYbJbi9WOM7T35qcrcvtVoGERZzTIQb+e1PdNRSuD7/VsmDQs59P
         5WNCylCo7yqw3RZKs92i3GkrYmv82BkxZepYkfsV1iBfhWHPFo9qRoATSFZj8eyjqrj2
         w8XNe+1PNtD8DylK4k8b1LFUDwfSyjdLZbRa1b7dHvaw47kPLOaFV95r4CDwHKuge/nz
         40zHiS9tQPrcngvxd66AQux9bJshv2pGK5uYY8AwoabD1EBTjGzETZuxqzNdcpTj8Zqz
         NKRk6R66K0aW7IbYTF7iulvG5O0LHdRieL4s7gOn65m4ltk2I0OYtRbAOG/YS7WN4+bV
         S09Q==
X-Gm-Message-State: AOJu0YzdNJxfCBgy6/bSS1DEZAp/hwzeLQn0JjJXhf7Xu7qQKzesQqsF
	vZCkq/Y/x9SOY39hzpMNMVbrCGAWO3LBrlKOWqPOYjXsVuaWRK8776IX
X-Gm-Gg: AfdE7cnBLUV9ospmG2QAf+N9rwYO/qQR8W5MF554TS7fomlvGShYcy8eBtJozMEEdxr
	RNxGGDx8L6RL/1rXOl952E+DfstFjLdu+PjSbAnf9hGqqnv1pqc4S5IaUu5ikXB5MK+QaTWFOdf
	B0ZM7IdPevRIa5V/6L8cSdIvCWtR/DNzbzbz4D/dBuiBWum+NFwGQ5H7GQnm4Z6S6/dP/STTXxG
	mbiURnQDJWBBCietjHJcFwKkyLh4woGSpg4Vw+yPcuka4BRi81y3OOAxBRddiLhU5ayBQ0l+XQF
	R5prtrcv7sWuNpayrEG6KOIOmINXNwEmJNvjSUTV442YXPKj0AE61v14Dc0f7243Du7fuCNCQVv
	wND8HNYPul1lOI9hUwf7c47+NlRSFUKTti091q0+DZCV4ukTIffUZMKUeyxxcW1ptDoDI6+gMR7
	p0iU1e1s3NZNA=
X-Received: by 2002:a05:6a00:850:b0:848:2ef5:50dc with SMTP id d2e1a72fcca58-84870ba9000mr2044134b3a.36.1783665239872;
        Thu, 09 Jul 2026 23:33:59 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm8174681b3a.8.2026.07.09.23.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:33:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: Add enough deassert time for the PHY on com260 board
Date: Fri, 10 Jul 2026 14:33:13 +0800
Message-ID: <20260710063314.1030249-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260710063314.1030249-1-inochiama@gmail.com>
References: <20260710063314.1030249-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTL8211F require at least 50ms deassert to guarantee the register
access, 10ms is only enough for the PHY reset.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index a38d7b738258..b704b537385c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -178,7 +178,7 @@ phy1: phy@1 {
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <10000>;
+			reset-deassert-us = <50000>;
 		};
 	};
 };
-- 
2.55.0

