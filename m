Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77051445AD2
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763378; cv=none; b=Xjw5M6bI3/f0b/ZtpG478gBCoU08hmXk3Cx0RJ8ZWn1l5yfJYkT7PWd+h0d6tUTAxk6ckydF1sZ6Rr9E0SWFc5p7B5+1FtDPzJJT9ygS1L8WZEd+KcxWqs8Lhvx5u4qQwC/u0Nl3DMwC4WrrRMSpk/fQj4q8SrRLRo8kIzm1xJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763378; c=relaxed/simple;
	bh=/WNSjUiB7ZBKYkg1c73HlDQeL6X829IxPmKArxDi2w8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jTM1osa25uMbl7MDjkLDJChz2ATE3mMLlLzGd7eeqbNtAdHjHt8OUJXyIu+2HKlsAvUrZVrMsipurYFmTh04mJ9RIAG3k1VGFkyWwJ0td0okuW+gbPrUisJJY1qAfaKrVvykg12rqBdEL+j7uz6oQbylGNZzv0pV2Q7gcWCLBRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVPI4BjA; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVPI4BjA"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-80cebd41372so606597b3.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763374; x=1785368174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgIx2gbKb5iWCG1ogTe9qMQNQTnak53463bbnfl8YvU=;
        b=qVPI4BjAZdNd296OAWtBrEa9mj/aymYwSGN7PO4xQtoFTjzc61P/4Nz3vVFZ2glfz+
         V2x+FwB9opeXcHmCvi/dO6x6MphFaegzjC45cVGgcg8i7I+fXbFJyaDILZW3xi7nD5nh
         5Hin3GAPPi1mm45f1vV7h465UaGNE9Dp8AoNcEIzNRoTEKAus954L2Wxpfb41YA+Wdc2
         fpBDPtBt2csGRAXwt0wwAuIw++JvagRVrGpb7PeL08JJC55pfFQHBtzfDjzX6UPJ7QL9
         dR1cRJ8el3oMTTWF+T677x3Ru4zBbJfCu4P9aMYCPgh+70Ez44X6AYgiJNIYI5yLROR7
         X1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763374; x=1785368174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgIx2gbKb5iWCG1ogTe9qMQNQTnak53463bbnfl8YvU=;
        b=XqIVC1ZMUEt5W4fvnML4ImvBC1Biouk5o8y5ipHBJyN87nnWSP5snFN/EKyKQ3HXxQ
         9uGKMO13VRMOJWTUo28JarvJUIk0lyp/oU+wTyIHXmtHbL5glDJX094+3e+rfi0GFBYC
         fUIH1rirN8zE9ezTCuFUMqcgUsBxiqvGybs1n6FSLBp0gH+ZDj46LAxuje0/QhLyJ+Sa
         HBzeWeDpnnOVN8qkjkix2IkQypaNDATFYY4FqM/fCViLElVhNkxjqrEVaWVpIeD8jgdM
         cUeUm4JjWe3mMYwKn1A+KCN4Tbltoxin3XzqU+3wrHly8ZE20mBOg1qfLiw0Td+2ixKL
         FJOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rri3GlEJ/0UrfyEFbKhJ4/YfU9Xpk8e6o3MfeSCeFCEIO46nIiebT1GD5b8208rPK+fyxcs9lU9CW9Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzaRJJeQiUkC8RFvxd9ML12gm+Dsc3JWSClIFSNY+adrNsGpjPC
	L6PFtje29aLhxYv2ZDjOBkvBlZFPgQ5nbnnZjPmaovmCWZu9ciAngfry
X-Gm-Gg: AR+sD11Utfhb23oghGfnrjE2tBC4v+2pQbZkyggnHRK4R5nW8rgsG5qpvz5Arfks7uE
	Km0D4UQShE0lxS82MkjBkSmnnaHLrQzzigGm1x1C0FYRRC1qpgz7u5nJsm92xbONlPErx4QyCCP
	cz1vfQ4kmBw3f7FDsW9XvCPZVqN8NVO9gghhp4/++vZPav6ZshYNjMr+taa+URNSlzgcfHqaJlS
	h+rnZi12jWLrJN0NFxhF7zOIpDxFFth1+l91of18yS/cOqCaNPsK2DUvqH1ZHDCHhvQA47yYOeO
	VnS0ulQJKt7MKG18riPqC2cdd19YHbPwcv4+0q4Jasu2VKJUowEm92SEXjl9E8w989UrPMxRdl1
	wOtDJlR7wnMlxwvDA2xoAK3ji0zFOSg8vEh1cxHG7ft146Yci+Y+5ScyncGhtxtjUXfhMChgxlf
	R4XUH88jN+clP44Rp/JoOcpo4tU4+vrs/fcwBR
X-Received: by 2002:a05:690c:6c12:b0:81f:4247:de29 with SMTP id 00721157ae682-81f4c3bf31amr2438677b3.68.1784763374425;
        Wed, 22 Jul 2026 16:36:14 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:13 -0700 (PDT)
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
Subject: [PATCH v3 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Wed, 22 Jul 2026 19:36:00 -0400
Message-ID: <20260722233604.3001063-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Quick series respin for easier application.

This series adds support for the CIR receiver on the
Allwinner A523/T527/H728 family (sun55i).

One-line function name change s_cir -> s_cir_rx at Andre's
suggestion, with his patch for the Avaota A1 applied on top
for convenience.

v2: https://lore.kernel.org/linux-sunxi/20260722201717.2205609-1-utilityemal77@gmail.com/
v1: https://lore.kernel.org/linux-sunxi/20260702214750.3428694-1-utilityemal77@gmail.com/

Andre Przywara (1):
  arm64: dts: allwinner: a523: enable IR on the Avaota A1

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 +++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 35 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  6 ++++
 4 files changed, 52 insertions(+), 3 deletions(-)


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.54.0

