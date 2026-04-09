Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67232324B2D
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 21:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769556; cv=none; b=AwiLHgke/ZAVlJ2EseWBaNZ9z4eWFyVbo5nW4kFm5ghnkyxcNaPDEMWSPseTCTBUxiztgTB/3k0vNckThD1qZczS+/IJdBB0sXqc2oh7B7cCDAxNyujufx3+xDtRkQPvaOEJiMneVzHWNh4Fq5Cxp4SlBRHCoXvfvlfyKC7Or0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769556; c=relaxed/simple;
	bh=UKLJKkQ2UhSeb7yseVCro40ZaxivkC5zuvxOc5ohWrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKf71mu6H/9cQORor9sJDkY8po5XcYtRmtyx65y+ZUZpRGkNzSwARlJloZwQVpyC2r4gTxyPns5vrSSBtZtBDbrt51oUxVGlNh/2hIs8A1+A8EylKboReLluAg4qEaP3AeNo2a4RArpF8A2ZjdCpT7hy3beGd/Ta4LAQUdhgNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2/m/sn6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2/m/sn6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cfce3a195so848047f8f.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769554; x=1776374354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oe/MTWFayud1NY0YJxHA7yEna0urTSnBL7K+MSPYxmI=;
        b=r2/m/sn6O2kZgVTrApyH8TxQ0TEToNCW9EfYuUbCJBlBuMwo4zQyWd8oGUYCCfnA1Y
         L3I8WRciXrJpp5C/m85dlOEjLAABtTfh0lYaTleCBs1YBz2XBpZfnIafHAB26NOAsq0h
         hGwKKy59UNaoYYxFexz8eDZGf/a8WFRCWHA14+KtZDnOG4ToaZnJujnIK6VsFvKe8JJB
         C/CjVnFgU4lkB+7MOCC1oGHxK7DfyjDR1BnoXMCf3P4E3qOODOzT+U7ZBOekYsR4ZMla
         90AXKcIcIRK7OXLNkQKw7fLWaqKEUl+JgN7G1/cjaB7QUD8HYXDzt3mCfM7mEMJ9zyxu
         Wetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769554; x=1776374354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oe/MTWFayud1NY0YJxHA7yEna0urTSnBL7K+MSPYxmI=;
        b=B7UQrJb09kQpz+l+Ny1O1dV5IckHKYuMVHGozt6cuEvCiIYyGyi57moyfL1QgRerTr
         d7m02LtqenAInIz52AbxJUxODXNxcsnzgW7zXh1s/J8jCqpsoAvqalLYcd0Vo7VNCGER
         yKYt7ocG2DmsvPx8X0M/tQtFvDxXtbNsMAxB+R/GUQjp29oF9J3zf4kw6DW+6qIgTYL9
         Boz2IGvhDa5MCJcIt5tEyYKEcRAoYNbJvsd+hW1yZDFWSLegbmV6EeiSz6Nv05uU0uxG
         J1eLE68lnIE25DZzZJp3Ngy3KGjkK8DiUicrKYEUcLa53VQPZ0GiHUFgh+0+1DKJhp7K
         a5rw==
X-Forwarded-Encrypted: i=1; AJvYcCUJlyHPEKB/mY+DjmHvaQacKabKf03+jy1UdUecRmZjB1H9U59cz0pv+n05ZleApB6pYc341U3u7e6J@vger.kernel.org
X-Gm-Message-State: AOJu0YxSl+zk/qqSzdQ7idyh7qso2tjTy+BDkqqv+uC1vkhK0Gw1G+zX
	urko2q+sxJjhASxkn4hI7M8HeA0hS875HPoLwYEHYfvG37rPNKg03eLg
X-Gm-Gg: AeBDievdKxYeYJ9Ry4FdUkLLA5z2huxRk0NbFrbr01wi7I15+qB5ZuqEOKT5fvrk5TL
	kbD3ER07Af3aYuwCgo+9OSzqV6IvR5by9sP7W55IAxL6E1MMIkkd+E/DN4Tnvy3m9nx5/gSnKEQ
	eOZIzVRq9WjXe7PnB5b+XvcM6Ksg5X+Ovfs128uEC212KCs18zU04f295BMNTpwzjQS4XSc+XiJ
	Nwkulbjr+ehUFjt8rlTxTz6mFuATyuvZFDDkJFKHEYV2T0soiHaDAWHuxucNnPfyhsC2pjfwdLG
	LZ5gNsJ8V9ikbSVkwQp2tDgLjru5RyRVLpgOKraE7XCXvUKQDVnO25vax/nrfaQbcYhCEsmnFl6
	Smn46fboOhuALBbov/YkR8jiIbN2Br3AAq9hFPvr+kAH6T5hjjJ2lqXdiC6OHr0+UHqklvEjJ9u
	Mr049a4alttDSSuIh7eWMZq/nXFmY0wEbUYxhGS8Z2UMLgG/SQQvCspqJZ5h1kG+1jUqd3vOBJJ
	uxYMvjGmMYZ97fqbAnM5PQ=
X-Received: by 2002:a05:6000:24c2:b0:43b:8f30:39bb with SMTP id ffacd0b85a97d-43d642ab9a7mr780950f8f.24.1775769553762;
        Thu, 09 Apr 2026 14:19:13 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:13 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Thu, 09 Apr 2026 23:17:26 +0200
Subject: [PATCH 3/4] arm64: dts: marvell: pxa1908: Add PSCI function IDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-3-8df6f88942c8@dujemihanovic.xyz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=855; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=MMbB9YOuhqaE8RLCQwY45AbWteQXOQalzkmQpnFItKA=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ/ecbjQ9/faCaqFghxca78cPM0b9DRBf8q00s0CA
 nvSG73tOkpZGMS4GGTFFFmYl8pd4ksNn+hQZJsEM4eVCWQIAxenAExE+g4jw+OfC2tVnzFktjBf
 MI2tb/QtNL51YcJZI5+trcutJsskyzIyrJJ6IDcpqujYk3sOs46dTNlgs2TxPH11aQnfvNa+Yx1
 HuQA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add function IDs for CPU_ON and CPU_OFF from vendor kernel source. This
is done for completeness and to allow PSCI to work on the occasion that
the DT is used with an ancient kernel.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index 5778bfdb8567..91022b62a39b 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -55,8 +55,11 @@ pmu {
 	};
 
 	psci {
-		compatible = "arm,psci-0.2";
+		compatible = "arm,psci-0.2", "arm,psci";
 		method = "smc";
+
+		cpu_off = <0x85000001>;
+		cpu_on = <0x85000002>;
 	};
 
 	reserved-memory {

-- 
2.53.0

