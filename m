Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D9533689B
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478130; cv=none; b=GZBSX3vUHuRTxAwK/mrsl3/166eR8xorfUOqJhHguv6eay2O/Lo/mHm1b+9Q90HPwD1r6Mkn+5s9Be+aY0mZzrjFQipor+e1DKBgxjtqRzsm8+PJ48kqoz4zhtxkR1dZITxxFzQewT2B/Oe6Af2JEP6k4yjazE7yQXhD6AIQy84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478130; c=relaxed/simple;
	bh=dUmq1bCgnXSYPpzyyUZ91Q/dm9ZA7x6kgjW+jplNRGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6pFgLHBz9UHzicn6ISJcQ1fQIexruqFzdbDcQtXHajfHlsE6B1Yv2AwLXZsBI4O6Qqdd2fm3DfXxAJvNDDUx1V7NZN3wVbanUsRVfVU21hBJjleYycSZUZHvVe9R7Lt3adhSzySr7N+P0duCRaRsyJ3tAl5gn7nqtTAEXvSAxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaxK6Ah1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaxK6Ah1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488879b2e6aso33305315e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 05:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775478127; x=1776082927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T56ha3pRTv143HhiMkZiaVjrLruG2xGjWZpcJKG0gmo=;
        b=PaxK6Ah10jRM0ZzqenW/aoYIWDq2D6thFTa6WS+1d0HMnIxKMQjBOL6RhZiv0XcCBn
         n3UYnp4DJc9GT76/QzV6vuIx8dBFLv7MdkY8fnxVQvUuBjdtzd51ANlnAutTWPxCVKye
         XPRytojEpY4eetr0tmdcxlgr4e4b7tDPkgHsyrppOC6Ha7vgWcyN+FkZAv2qXRGUaEn8
         cPE9akWoFPi717hocERg7Iyg6hBPZR5SIB78EfC0nlWwoz0MRH/eFcgWhtT9yGOgCoIL
         frl8ijEH3LL0YyIUcE0FJlsOlV61MCHRGuG7Y3D+F7/KTxQaf4O/Ej0IVITfI3j0L0P3
         DprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478127; x=1776082927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T56ha3pRTv143HhiMkZiaVjrLruG2xGjWZpcJKG0gmo=;
        b=ndXHlOfh3OAtufCFfi5sP4pnMJ0IqMLxECbsePSqbY6v5TVE16IrEf/IPGM+Wty0Sv
         llzC49WzkdzE6M2gsM3YG5KdjgoiAb7FQh1kWGUCsAdeVYulDj13/ekL1dBKlrshHnXu
         VnR9dG8xwGFVbr9v+3euHDg1f2qRJ+rtX7LFyQURng2byZZZ3D9AnT8bMFp5K32oJFTr
         OfDefuBKH+PjYdqFTDSe8vayqACiPuwo6tUa9v1+K1mq8urAomukdtjVxWsDcWBQ2xsO
         7SwR3ru6BtiU1EbhOsbxXNTh4vxqUFa4VKnDl5oewMA/TErtaB42UUF4Wy0UfFY5A3+X
         C1JA==
X-Gm-Message-State: AOJu0YxJl9xmY9PKglCCWBfOAC+F87l111fP1SetkyxjNpGrR0W8K2XL
	PXDtjJsN8ndR6EabLCcJJRJRGgrBvXNZ6+vPDO3z3s7uE5NkEN8YUx5f
X-Gm-Gg: AeBDieunpoNiHlvaT0K9Vr5z44gUHoqkeaiKKqgcjOt1rph6XljYEgu53YIvjRuPIpC
	qYxlZH2Ka1C9TdDZMsztx11CxSpvQLr3LmAVZnD8MUZuxHA4ukxZUj8Kx6RA9J8vPIi4ZA6tqUR
	QFALi5wCpTChE/QSVG3Ls5gID+zVjwLQWhnJHzUtoCF1MB0sdsvY7VkpZdNWjLWHRx/0nMBLbCI
	f7MZjvAsKqPyLXEPfxwinL1pyzB+2eFFmUHpXwnrFJ8LtHz06Gg15fzJS+AxBYBUDjncWsmaZsr
	hs/ulYZWnlZy1skjFE6XbabzET0+81jjfQSsaMzOT2TS1c7s5Z4mFLnkA46f1kE1jLZV1IHIbem
	Ds3gNoKFoWN7J04Zfzbb4WuHmEptoAJEwsMd+fdz9q5tnVUezmy6w8uDLsql15wTI4A63CvZrmD
	sFcvaZkjsWah8/qPUWEYS6frFsb0+5JjgYieaHI2eFEZjKmyY7TQ==
X-Received: by 2002:a05:600c:3550:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-488996cd8edmr161253875e9.2.1775478126933;
        Mon, 06 Apr 2026 05:22:06 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1c148sm138541595e9.5.2026.04.06.05.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:22:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 2/3] dt-bindings: dsp: fsl,dsp: remove reserved memory definitions
Date: Mon,  6 Apr 2026 05:20:24 -0700
Message-ID: <20260406122025.4515-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406122025.4515-1-laurentiumihalcea111@gmail.com>
References: <20260406122025.4515-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

There's no need to define the DT nodes referenced by the node's phandle.
Remove them.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml        | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index 7970f90781c2..65ed26aa3308 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -153,23 +153,6 @@ examples:
   - |
     #include <dt-bindings/clock/imx8mp-clock.h>
     #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
-    dsp_reserved: dsp@92400000 {
-      reg = <0x92400000 0x1000000>;
-      no-map;
-    };
-    dsp_vdev0vring0: vdev0vring0@942f0000 {
-      reg = <0x942f0000 0x8000>;
-      no-map;
-    };
-    dsp_vdev0vring1: vdev0vring1@942f8000 {
-      reg = <0x942f8000 0x8000>;
-      no-map;
-    };
-    dsp_vdev0buffer: vdev0buffer@94300000 {
-      compatible = "shared-dma-pool";
-      reg = <0x94300000 0x100000>;
-      no-map;
-    };
 
     dsp: dsp@3b6e8000 {
       compatible = "fsl,imx8mp-hifi4";
-- 
2.43.0

