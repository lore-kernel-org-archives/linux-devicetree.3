Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370934B40F
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162530; cv=none; b=lO/Lc2q1fmcv5GrA3w8A7VogjMtY1H3lP7Hm22bikwOoNpUPfzMIi0OFxbe5bHn8EIJ70xBMUdeHY6eVefVwAWcndtlPcOhIrBY2xwrUJAUdt+sDYxGvzgouoDL0H4R7LWJ+VTvdQavE4TtqGhpnLSOB3Q3IwX48a007EQVXcUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162530; c=relaxed/simple;
	bh=/iKoxf3LOftVvnFst+ry8upkECO2m/4sz8OzKStj6vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2Km5iQAOUX4awP63T5zJ3BsmELkMQhUqcet76CU5soSUh0waDWA6/Tqw2L/ykTVIf7bKpG2rM7YwIgDMxgQazVnlNWiMamYxgw8oOc6gJm9Jg/JVk3DpO0H/brWuE/+Al+37TteDZVzhZfc26YY9nRN6YxjLnppN4JsIkgnCQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWtuqE+y; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWtuqE+y"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-914c12b9458so457989485a.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162528; x=1780767328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=GWtuqE+y99ot5M1m/YoCSwLLTrmMDvUo+EJTClBvA9INmVY3LSRwM3YeHGnIFpBi2v
         o8np8Rnz+YDnlyATqhD6+uLg8XE2ymk8D/lqaq7z9fne1wbaizLgs6M6vaK3vT8pilBZ
         o+eA2Qblr1eD1aFE98NiRkq8At5cBvK/oZmYRcaZzph+QnHQuakDZfzu2SEeEr2WcpDO
         EcAb+6z0aO64rh+4rCGtooL1qMWmcLCpCfpfO7c3IzVyCUbOK4ETRtHF9zEoPFMwKmk6
         OLpdKKvmnz/2p+Bsj3ur6RziNcXXwn3y3fG8g4cN31rcP62G0ThWGgE+YNzue1Ur3OU0
         CYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162528; x=1780767328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=lV/tvtX6HVHaDiMkH793Y5B+3B2Kg7E1UTEEPbwY44pvuI8JX4ShKm3RvZWTDmXquC
         uvKjZgofZm3OE0QBwNvSAn3zgseFc3jQDBt+han9INhVfhwDRB0l9I/rQkwvFsu3ANSz
         tRVRmgDww38iLligJLVlKscTbOq/KoKNxCQZX4UYnKutO1Dkjh5bQGowwKssUfpwHe5/
         9N4gSkMzila0iyW3wIwaSwHnMPmNgdRdX7H3/ecqtDSxM9CCM3HKlvLVcOD/NWdD8862
         3vvgr1l8e47MuTfT1e9RW+DIAjm5oYDMT5HScQifBVxKuKLtO8aar5QM83+U9c8vv/Rl
         fZVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aTBUs8wUikL2NrNk4CnHP7YSYPu7e3NQruO2ZC8B8Byh3Z4Q+7JUH3Dpps+ZBpkFhjMIS1PXMfKlI@vger.kernel.org
X-Gm-Message-State: AOJu0Yya73z2QIvTbrcTOk0i31dGyLy2LezOmUpfWGjMht3b5hVN3Nwb
	LIrZkhYkiE++qEBXMEZpVC0i0lkd91pYgYcWLUmrmjZEgS+1aeWC5PJx
X-Gm-Gg: Acq92OFy+mRnqCdAcY2WlO2IEj5jbFRaL7DyDIx6XMBnUqqUT99XM+6uqHqN4dsK61a
	jwwiyEv2n2xWrAHsmsnS4M3/S7dxbtzuc//RsrlfbTtzYInPVjhV4ylEAffRUkJq3apUw1sPyGd
	ebeQeVeF3AnZqFnQlH6+dNWvKtZIrARwaXPVW/lqeok/zSQ0Qm7OwIeiwMk8qJ6SOwCjE5fmEHZ
	sHMWUGV5tsUYT436Hcdd9/pC9Fb2ZV4IO5ZcLJX0upH6TR8rVNlHtvDoS8/oThddZA8XeGMHUHg
	VYr1xrBRp9Lt06PcvXSyEKMNAObH4MhHiTxI9Q2AworlyLyg3rfhQV7jsPIhgAGzRxu/Nv1pk09
	mgd9b+XDjETGtlvDdxfts1b6UH6ATUvhQRDao7nWQ/RHduSaW6tYTO2lN0TwbrP06MU8oXQsuvu
	DgNJ7HYrnIbqnC3ni/DJ4UZBiD8/Je0WCicHFESZMnZW8Y3wFZ9/XFcWauPSNoy7DTo0U=
X-Received: by 2002:a05:620a:241a:10b0:912:c0b3:7d9b with SMTP id af79cd13be357-9153d96aed6mr474347185a.24.1780162528422;
        Sat, 30 May 2026 10:35:28 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:27 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Sat, 30 May 2026 13:33:43 -0400
Message-ID: <20260530173347.33533-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the Milk-V Duo S board [1]
which uses the SOPHGO SG2000 SoC.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51f..0b6fbab48b743 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo-s
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.53.0

