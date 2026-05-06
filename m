Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E11369980
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 22:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778107297; cv=none; b=WJJHSyuaRX9IXEDOaGqqLO1rHmlja2Q1wPwc3pcIQggCg74ySU9pktAe9707WwLKjKw0oiviVPX0brCTxw/IJjx6hbOButT5EyF8tNkgIgyMa6u1cHgNi8DARxanIl6uydPRElSq0RtjHdgi89PhMf78r2YGQ32cPJgiFw07eds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778107297; c=relaxed/simple;
	bh=PmsRz6+C0zWDdNa25QXMM0mm1NJ8sRDQgJ3iimwKjzI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=evoel5W4sfBIY/uHPhrKc9Bpp6rBOaKwSpoMbIT6mk2/toNiN1qVKW353Bx1kDgLEkcit1SucT2xA0aPgJu1Kn3yE2xNzQCcDdDgZWTtnFALSRN7fWJYq5lNX/9Mt81Ap0EoyVfrR18aQYjJ19j55LyuUEKOeLpXH8MeyVEWVPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=El8OFq17; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="El8OFq17"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so2352795e9.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 15:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778107295; x=1778712095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KouoTL4PzOBYmkbjYLcs67bF3yuXBF5vYz+z+OF4FFE=;
        b=El8OFq17WSmDwCMLneSvILadCH7CFEPMy1GqTCjN8lgzHUaCZhWiZYpEAXQLJZWLLY
         H7gqBk8eBweJ98qDCi0EmxqZN1rXosNd6MV3juE4RGjNu5U0k5Fsk3SqxWQ6KFhdDUKB
         l8XMBlcto6BgGUVfCxkvTB/R/wNyXjzJrIe+rh6d8Ne08r4l0NlaNMdhkjVt5m072FPe
         IylpkFGMKOP8Olz13mkZsFQ86MWYhV8N3gNMj5jS6CxBajvMHoI3opIbmv8GHK7UYxBR
         YVswBN91lKMdIFfQaIpovh2vvQ/FgFsNCoGWVfFY4fyj8d9sQ6cjI6+WHq09kBT+6FMC
         zAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778107295; x=1778712095;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KouoTL4PzOBYmkbjYLcs67bF3yuXBF5vYz+z+OF4FFE=;
        b=M1XHMhf7bde6gmABD3wl/looav9XninKyJRKcudE2RLZxxdJ20tzzzBvWyKuCgAIaW
         q0XRFkD91Lh4x3+LO5TSkgh1OTynehqCRMhm9uuKViMwAGgpi4eqdLXeSiU+DAe+Kdcx
         ic1vVA9gz+Y2YLjJNN3lqz40J+C2XI4UiJ3rl5QdHhPBrZM9C+N4NySVPH4m5T1+C1pr
         Hcpt20bfyf76mHW0csw0PlEiAJB2T/Cy/PVNbofi7xZCp4ydJeMiYPvpyBL6ijHdanO4
         LWd9PEWRlLFMlnwnk5kRM6rWfI+CucA/GNbMiRsRjDgyC8NFZ2+x19Xip6oUZs2xO07A
         S7/A==
X-Forwarded-Encrypted: i=1; AFNElJ/lBE6zhfV4ekN47Cr+5/9iXjtgJ8ySw2bfGp/FHcH86G6eUGlHaBa98DyeXkpYKRCbwYcr0Fi8m5uu@vger.kernel.org
X-Gm-Message-State: AOJu0YxyDxTUyVPSEQYtTGGKwmbU29r1k1g4zAFudkJZaBkqCAUxKQ0O
	4bXvXp+x6VuUC7k1y2vEIidiPDnbAKBWlNFIO+ErNHjvSYKT4ckuIQZI
X-Gm-Gg: AeBDiev7DeVhxKnk9poOu++hgn/auyv8KddddzKU6pG19o3QRZPrGeLUmUZ99ruvtez
	doa9Q+UOdemWiD2HOBoL3vBlmBCgIqsMBN/G2xX6Ai3vHnogppMRt9rQ10GfBLI0CoBXandst4/
	tIZj7xTy2lTIQFtLd3/V2SbYBCZAFzP1BQ2nwEH4qwfWEwqM5Dv2ekyf8ZwoMPM2nEqQTXgPdbI
	wJWhavUVOv0UQpzRLDWUDwzeGAyHPTEypLqUZw9Dj2mI6pwkBsjYhJYCZm1/c9yFLMnPwIaQ7Gv
	anNMQFetwwqs1CCQA6WaAvP92gzKuIC9k/Pzxv97+vSuQMSh6mKDEFqrIPy8lHL6QxYho1oOimU
	0MYVyIoRV9FW9iPLZy8T40OkVh1kd4xJ5gNr4Gh51iGWjCOuD7iRkBFVU1n4W4R5l2CCLA+WgiQ
	GjfZgE+7zpwmhQieTFUQUIsbdXzu4mJ3jnvtu+Sew++7flg7ICLiT4hbw9a1aaGCLyvqWqG8yz+
	sN7/Jc5UgbzQv9pcvcmB5ViS8r5Yc2E7z4a
X-Received: by 2002:a05:600c:811a:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-48e51f369c3mr91695785e9.15.1778107294675;
        Wed, 06 May 2026 15:41:34 -0700 (PDT)
Received: from [127.0.1.1] (93-143-241-172.adsl.net.t-com.hr. [93.143.241.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538bc9bdsm92181315e9.11.2026.05.06.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 15:41:32 -0700 (PDT)
From: "=?utf-8?q?Duje_Mihanovi=C4=87?=" <dujemihanovic32@gmail.com>
X-Google-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
Subject: Re: [PATCH 0/4] samsung,coreprimevelte dt fixes
Message-Id: <177810729157.349411.9116754282787318766.b4-ty@b4>
Date: Thu, 07 May 2026 00:41:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Thu, 09 Apr 2026 23:17:23 +0200, Duje Mihanović wrote:
> A small assortment of DT fixes for samsung,coreprimevelte.

Applied, thanks!

[1/4] arm64: dts: marvell: samsung-coreprimevelte: Increase touchscreen voltage
      commit: 4da515eca1b8de56c9e8a17866626f99d9bccbc7
[2/4] arm64: dts: marvell: samsung,coreprimevelte: Use memory-region for framebuffer
      commit: cfb4346423eb5dab498546d617a8c444b878bff3
[3/4] arm64: dts: marvell: pxa1908: Add PSCI function IDs
      commit: e93abeef9267a9c3e063e594571d46b3d9461efc
[4/4] arm64: dts: marvell: samsung-coreprimevelte: Add missing SDIO properties
      commit: 52c47f734f934fdd83659e1a7b096597cca14522

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>

