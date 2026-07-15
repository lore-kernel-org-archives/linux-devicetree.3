Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0B431E83C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096539; cv=none; b=NXbiRN1VyXPFppBdvRkLZwSgwc5ab75gsrebipikUlqQj8f4o+TGDUcf6/RIrYzozJK6kaPwku2h4Gy6jA8trGjjtvy+5lllGYNcNLtwso8KKZKWxWYH4xJcVU5CwWsi2/MTqAM/EdC/FbYQpFIQ32oNSzj/11DMKybkZSmZ79c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096539; c=relaxed/simple;
	bh=r4oEtWAGk+0lG2cjCCS/On9c5o0ItK6TwayM08X4LmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qF6wTS7DD9hLKvsIkoE+Hg925hLwKgpAVWZF40jgKuGKmm5cziWQC7urWmSmHFnkBEec5j+WcDuSOTPl6ICvvy1BmAbE1YE7N8ovy0nRw3zK5HWg6We0dmBC8oq9EFKG1pI3RG/SCizMGTxkBvHKiE3JOZwpJxR2d7XN5ChTcDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fQ4T0ZMb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fQ4T0ZMb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so134543a12.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096536; x=1784701336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=fQ4T0ZMbscHo9jcNZ+EGT5/VN+tVa4+Y5DPCwgNG9A5e2eQFjon/8m2O+MCvqIXzKH
         5Ta3Uwj6jePejvfGf4LPpgOjo396x44xG06XQVdJVS7pVum3hPkZe+kJnteFGjvAPcYV
         Bk379G/JJlsGOqy4YHsOl/mkNByR9PLk5MRHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096536; x=1784701336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=qnk4bsiOZ/wUOvXSPpugOZ2fUBh3Qt0/3ApBokUrEDW/Mz38QJi3PwIb4aqSxzTkcd
         Df6Xffnp1A+dpT5sRroqUw+MW78TTU6OFwOJwYRBanMaTP9dUIa932caVXC2qdQxfdAF
         Jt5DL0jomUm/V6zpdjsIYfynrI4CQVqgpgLrGSQXh2arXnjbsKfLVPOa0IEjo7qM5+SP
         XWiUuwKoMZ7fLXvt8aUiNnWUeTEqUyZ5UxEaHTcrrOuNqtb1yF3wq9A3gz4rgPGhsi9M
         aSUnGfrtx4+OVREt2FTlcV2k13/kX5kJsqmOfzZOXSOSwQB+OKCfUNShChO3Z2DO7oqb
         znUA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9eGF6CJnA7DKReEJQGyerWG2Jfuaim6Ov4EWhDk9gX1arjNRN051DfPRYSF3zz6P8TKu7l9z9ExBC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn764MNnsHt8LOAXH4rcrTweGNTLDm9krDxAoJ9WswZhVEZ3s0
	orbdX3GFdNbwCd7lLaNqskm27SElGa99dfstnRimgNji2u/6aMqJFGTg4pMh6AFBKTc=
X-Gm-Gg: AfdE7ck0TvoLydSy1qvsQRfKtsomsy8E5lRX9GFSIwLdmMfpD+tymzTdd2ZEwhKPBRL
	z+NT+EJu5eURZw5J7oaTMe3EfxUsyIG5R3l05NHRsb1Lk5iWIyabTXLZfPynFLEXbPXwah0YFsp
	XtzwTv+HYMSsp+lMBmKqT4irXNMqYDTCQLFwgAxBaVISRKOab4GgefPRo+p/JUod645X/iHLtCT
	fFVE1jewh8Ua1O5iVHr27v7PxiiIAY2HArSDUbYrgRmwRxXyn53Y/DMt2006vJSYneEC/ISLC52
	uumX8kBeouCXED9fRUQhG6vXWNxMwdMNLhhiqstaM09zeVGlmiQhnBTHloeUOl1LOkVRozpY4ZB
	2mieoJKZXn+Y1i/NTC8uPNnL+RDa3upAhGR668PIChYec/DVCAHf60qycM1pM8xKo6ROTEX6NAi
	IRrRPZw8/d+mF/7UrVfPzo7fUylRqdvJXtGJZuv/r62SEy2yTkKva7FF+RHNzuE/JIR5VVQ3CUV
	6pJqFKnZrYB
X-Received: by 2002:a17:907:8b99:b0:c16:3187:997c with SMTP id a640c23a62f3a-c163187a0e0mr757455766b.1.1784096536252;
        Tue, 14 Jul 2026 23:22:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 02/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Wed, 15 Jul 2026 08:20:19 +0200
Message-ID: <20260715062201.3599458-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
-- 
2.43.0

