Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B52D2FD696
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003361; cv=none; b=pFamlDUmdpoxiu0RzsaIpjHJ7Gv4hTy9DzToTEU7pCwcE2BQfQWjdH26Hl6ev02eAglF//B3SrQnxGw7EMQL4h7LwOj6SYQKLYrxCbyt52+6wYevl8rCyzQKzrnh+oKqevj8zWKyoXm6YpRiIUzGm5f+7XzpmRl+5aMJIsWgYJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003361; c=relaxed/simple;
	bh=7oCgxgnMTJm72ksYvBvCCDiMxSWPCHawhVNGVG3gnF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrDPTdxMo8XRq89gPoCmZgQCYKb6YT/9iUxWY33E7g55q1+5ZHJRDJ3MJoPr2RnggoFfARLIe98posRNWPJUJ2NoX33uaWmHCc60GYXeFOKT/jhBDuYRz5vhajgmqMF5N3sQtjhQF5Il1m/zkrV5IvzlXaKScoL+k3qwljcS02U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opDFsxfq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opDFsxfq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so1036312f8f.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003357; x=1790608157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/ZOmzg+WvtC9K7MxqhI9dmC9yNAOVlajFGrJ+kti0k=;
        b=opDFsxfqGmOGZ1bz+Rf7nOI4xNbONgr4gecsQrC0ubS7qc0DjhHmKDn02PZ+pZwzLW
         rhJb3INhdDje/g5a7M624lrBD2EnxWq580U/g0Pmfsj+HWybaDga/z4k31pXtIAYSQlT
         uLbjs0IpnlENBjPpT8sT4mxzd5Y2QLHUIPO+eC7nf5hgHTfo5wQUbc+MGLSKNj07ws6s
         MCYsOPqD7xctolejt8HytULREstRdUucen4/qD//fL/FGDoMABJl+72PAm3+SllQz/I0
         8vq8L09Yn6gBPhWRFFkfO+cLFZXtJUjTg6vn28SIf5C+ihWSQXUKsUXI4bML7BQhke7q
         1DWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003357; x=1790608157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/ZOmzg+WvtC9K7MxqhI9dmC9yNAOVlajFGrJ+kti0k=;
        b=R9GC9xUbIAiwZ+3E9epw46IMOm30vi79PiCttqgT8wqr4emE+niU8FCgk9D2fIShw3
         8pf1SelWMfWKD/GBaS+S7TG7rtfuntZoVArvGOs2T0Qwa2CkBi+d6utooeKJ9KRvXlXb
         4KbqKIETrLVo5b0WYFWz1krs1gaBKkiBmaYhyJBamn0SfsvhmJDp35mLBtc0dYvCrPVH
         u/tIhY6xN5wf0bxJDfpQC30Pdq6Cp0QkbT35yMKNSweurTcbAtJQaWbxqer1JSFX2xnE
         4RlTeUFc80XKE2UMcZTSUSCZnoO+nBh2bvK8qMAy6lY3XuDmibVHRKepCcM7KLQKNybb
         R+Ag==
X-Gm-Message-State: AFuF++kXIKFxVX9Fzl8EztiKHshrp6VbnTOtd2eauXFd4xx7rtIvIvMJ
	uZdQ7Pei2v3q7RLExeaF7pKX9f1bQ31IfqBIS9Y9lQ2xGk83Yn+Lh55+
X-Gm-Gg: AYBFou2pygDIadVd9T7dz2xqpoHPj3EMukKh//uHgwGHt+rSO2EN0SLKSqQLgzib3hl
	iMkEYWSuj+ErzDXvE5puS3D3og9GQAXhJKWTKmzYVvrQsAffZxhGvgfhkE4s0w7vRh4ByFk2RZ9
	jQZvPHtMYjawknH84kvQHDyv+V4d6LfD9dkl88C89sxLf1MQFkuSXqXGahPmpqygOkK7ElmanLP
	lu7923AfnY4j+L1U9Uhou/3XM4ySR9wYekN850l0URmKqgm8dgOj5YDPBd6xiHbqgNFejI5R0Do
	pkICPCNpyiEzT7kO9niOjR81/h09HItjFc+E0WycW+Zwydf4mSU6GrULhW0yDYYmXpT+w+eLsiQ
	JL8sAPqWZQOgm9qyI4+175HMXV/5NSvvoEOsCp3ly4VWkfCacfDtpmFD4cZL7rf00js983NHfAb
	Ts0UzEUxe4v+zATixhtLJkAfIjY6sQB81veEBlR6StSd9r1Ry2ij7Jes2KXjb/ghevPZE9FLZKt
	r9LWv/9/X2mXHRvgKPFazsUi3jBvi80odUMPTxs3deF6ptHOLmgdttlr2gxeApo1ViAavx57Nbm
	Nq93NK3+Q2RFKyjf
X-Received: by 2002:a05:600c:3b0a:b0:49f:ce79:7a8d with SMTP id 5b1f17b1804b1-49fce797ab1mr105033485e9.17.1790003357536;
        Mon, 21 Sep 2026 08:09:17 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm255659435e9.1.2026.09.21.08.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:09:17 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Date: Mon, 21 Sep 2026 17:08:59 +0200
Subject: [PATCH 1/2] riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved
 memory node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-sophgo-remove-coprocessor-node-v1-1-ace29446b327@gmail.com>
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003355; l=917;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=7oCgxgnMTJm72ksYvBvCCDiMxSWPCHawhVNGVG3gnF0=;
 b=/HfpHWWsl0W+IWEQi4abC2w6SqzvmKlMQckSkNlWUn5dc9Mj2OzdmT7rYT+JYx8lh26QfJ78Q
 6nk39nHIi6TCAUn4XyySgyaRyJzuiXrG/1Lw3F+tpSB5erRjmrskv3Y
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=

The current FSBL can load firmware to any address and can also
disable the coprocessor. Therefore, FSBL should modify the device
tree at runtime. Remove the node accordingly.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 0e6d79e6e3a4..02848bae2e16 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -22,17 +22,6 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		coprocessor_rtos: region@83f40000 {
-			reg = <0x83f40000 0xc0000>;
-			no-map;
-		};
-	};
 };
 
 &osc {

-- 
2.55.0

