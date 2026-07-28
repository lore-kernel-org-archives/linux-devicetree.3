Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA512F12A1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206962; cv=none; b=C7dhISO15kKIjec4gkHDkYTEU0n1VX/MxoQw0MFpMQATp/uQUQmP8/LWvWE8QX/0USm/FU06a3ZHgaCvjXW+D/ghiqxvaf/NyCDhD9uLaqyKS8IQ3yyCZJAAusmd+TxlySdej6kevMDKIPLpgqNHn8YimXpcVJy+JQYqBxDG9I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206962; c=relaxed/simple;
	bh=4s/5NQ0BfIjDLx6nsMQcUo1NGNPJIEOAUaykakbWfHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2SaHTzCNxMS5vZ9ahSMVN7QcXb8ZZ/iwDq+bUxw5l92mwj72BRUEYDjANQdmquxw7oNFrOPFIrDzTvAC/xlxQ7VCYX0N2Xge5iHnkjMZsLnu//MoDaHZqVFQYqufnaZ9AJOA52qovcybYRDa4FBXI4c5DDWGYSq3f1maP8GIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBXb1vTm; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBXb1vTm"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ed2a06b9eso28977787b3.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206959; x=1785811759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=quHt3IGaKOPL78wv/QDtYvLCereMlp/accQxjxBXbGU=;
        b=LBXb1vTmMqvc1t4vMHKbjM3sA8WgdNCNU4qNmXbKVHOZDBrnzpXbKHnQ22XDhVBm0g
         5j2crV7Ii8qgudDXvT2LxfN+HbRaBW8d+M7D1YqWMD/AEmdyoTgkLKyS0cs/G0hHfP3x
         vQ5LImFh4yjErJ+AvMKzvY7JCbzJYzZECy/V2w++jM412p89mo50DaEKA8/k3mNHEQ6g
         4bRXaQv2xKwaus/ayRUe39n30Qq0WgUvM0E9AQMGRAmUoNPKc+dBqYdSjzu+OAABUNLn
         FBIrdJ1eN88kmF6ah92mBwSxLY8krkGPBeAoBNZiivzgB0Y+AZD5VWQO1A9QaL9Xh3Um
         2lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206959; x=1785811759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quHt3IGaKOPL78wv/QDtYvLCereMlp/accQxjxBXbGU=;
        b=jJo9iaYTgjMyzhC8IEWNH+cmIvHZNEHictG3iaL4mPKWO4DzN9L2wLachykkq4g/y7
         GCdCAvum4m5oOaNVTGmqjPhnkYPE5t1QAh2UyrYPXt/7nsXyRLj5pGylgYY5nTjkZp4K
         gx5srzmegZqkC2DDjt70YWlu5psSxbkU2YaQpJz9CKWj/hI/eF5t/z5fI6CQE5aokLwX
         z32Cz13WQQ1RcTMlNyL/s0E0sCdqnxLxYJZ/XA/5ej+82llKOdAlHJEsCgpM87oMK6nN
         aa0wm26ZKJw4FcWvhGwuJ8JTKquBAhPf+JLifhsGk4OW61EahxuIBaIbvwM4G/V/9ZEt
         twFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYfOmm160G+l/Zq0HAC9+2PNSe0qV/QPzodbuRuf18Fjar/Kjxe+jnaXQSv9+lHVn0763JcjnKQqZr@vger.kernel.org
X-Gm-Message-State: AOJu0YxNaq/tL1BLbCoGklLNRsmJm1WCTxqNn8VBtS0NqzfFliIl4RnX
	saLLADaWOrHVXknNVQw1xzc4TZBJTWGRgRNnwW7U/gK9IL/uV5EztOOH
X-Gm-Gg: AR+sD10Mz0Y1k6nXtlbpmMC9SNQf8jXZZwIMEbvimstbOWHG5tnqaa08y7DCn4ck9U9
	shmhj2/svZrAOyf/VSbN3FWaS3txVWt32ZodaiIMjLAQzbfU5ArHMS5QNkE9Pi63249EILmqG4Q
	dD5sTa6UP9n43kQlY2D8IL46ezS/r40I7SvL9mKW/BwfgqqLTBhQjZFAKS0gLgTXR71g9bcE/ak
	9wWm4c/sizznHoY29dYCqcuOp4mbfoF5QtaKNLjQOXs5X63blPNivA+ykucT/G/3tzfkrQNqjPP
	FpE7s1C7e9+vk26PpcoC+zN9XzzGcSPfiEZmjav9CIH37xmqX9iR8dCr79J8sm/tghN0qXHnLaz
	tfHIbBcdWC0HDHuT4oFIpNbmnDTsbPK+wWjBZfcMa0V7kEXvxSrZ6baMdTLrsh707VXGzHxhOVw
	tQRwHoybyom7q1LNatMIRhenkXr5ZL7/voVLML
X-Received: by 2002:a05:690c:7244:b0:81e:d009:1956 with SMTP id 00721157ae682-81f991fa998mr2277897b3.12.1785206958757;
        Mon, 27 Jul 2026 19:49:18 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:18 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v4 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Mon, 27 Jul 2026 22:49:12 -0400
Message-ID: <20260728024916.993224-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds support for the CIR receiver on the Allwinner
A523/T527/H728 family (sun55i).

Apologies for the hasty v3 respin.

Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
came in the box (using NEC keymap). Was able to press buttons and
get readings from lirc / ir-keytable again.

Changes since v3:
- 1/4: picked up Krzysztof's Acked-by, no other changes
- 2/4: add /omit-if-no-ref/ and rename the PL11 node to
  r-ir-rx-pl-pin (Chen-Yu)
- 2/4: take the PI8 pinmux node from Andre's Avaota patch, named
  ir-rx-pi-pin (Chen-Yu). Added Co-developed-by for Andre, and
  his Reviewed-by is dropped, as the patch gained a hunk and a
  node rename.
- 4/4: drop the moved hunk. Andre stays the author, with a
  bracketed note for the move and my Signed-off-by added
  (Chen-Yu, Andre)

Based on v7.2-rc1.

v3: https://lore.kernel.org/linux-sunxi/20260722233604.3001063-1-utilityemal77@gmail.com/
v2: https://lore.kernel.org/linux-sunxi/20260722201717.2205609-1-utilityemal77@gmail.com/
v1: https://lore.kernel.org/linux-sunxi/20260702214750.3428694-1-utilityemal77@gmail.com/

Andre Przywara (1):
  arm64: dts: allwinner: a523: enable IR on the Avaota A1

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 +++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 36 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  6 ++++
 4 files changed, 53 insertions(+), 3 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.54.0

