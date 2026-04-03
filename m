Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33673750A7
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214962; cv=none; b=HuCVWwDzLu/6Cp0Tf71z8JKI7JxtnLgjSB1Z9s+qjPgvz+dFC7JLuesndHNI5nVDUEMUwca9VJ6F4ektOwm72DTHZ96HAxE4UGUBJ1QglEqMgHf47W1//SJ+IURX5pYoQMJ07hK1t570ja50qmlU+MQHRySe/QdYwCnF1MQiAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214962; c=relaxed/simple;
	bh=/iKoxf3LOftVvnFst+ry8upkECO2m/4sz8OzKStj6vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BR1tpn+qoyE9ySXMlMONHIqaAis6K7gDnlqJjUusBTFAsjrJTBZs/uBodymXP8v8netd1CFFRJ08WMLk3KF1kbEbJNXPQqfNO/JYPpcEb4p48jmsN2rfJ4MPhmCNYqDLEQTm1I5EnMRAPUAGo648vAiQCRIEw+fmbMHswjQpgeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHDz1weA; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHDz1weA"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a05c388b27so35003576d6.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214960; x=1775819760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=FHDz1weAJn/pm0mBqM0VYGL2uEU8tPc9/S4Q+VP0+iaqzS1cnTEHZa5iii1/TbG2P4
         Y8bnmEdwcbEPVsoxslbf7H49sKnVx6RpbrKjiHrjPnsxhO9r6r4+wSGxaO5hWXUy77Qi
         iCU4O6BS8kwgQf46s0jQ9RczXQq6uPlHhcWMeSPoocCsDtsLdV+NO4iUApG4RmfvV9QP
         V1J0PuQX9HmgZG3QJ2o5G+JxE8ELod/QrX1+oPNXtWB/FWMsCVwms85nlSK4Q/LOPBAb
         2S4/+Q1/yrbyLH+P4+rIMVtlAyRbB4H1HJmGXGySwjz7nTFVl5SyvfaID3BY0G8BsWai
         0wNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214960; x=1775819760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=MsWwVqeL9GN6N7cyeLMpcAdioShHwEvqJtXf+5znaDrNptdyVI5/4BYRz3jLTfFWr4
         tUgQ+q0GeZGbqQgYb17q5FdTBJCgJvGPsy6OgUkOaXyQgQYLdUM2Ymxgj4MaTmXO2rm7
         MVUx5VBM0WfEmQIifHm0qb+rnN+DPy7x1aomWEp8agA+Kk7dLQd81PTRR9Uo68TAIMoZ
         dBCC9hFhlEg6J0A2gjiLhVPsZ7Tdi/TzY8W+BPeM81kzg5EwTNbEX9RCO6Kyj/5OEckY
         iUd7462j7lSFdZ4ks+oQUvRmiFHec372GhxAxSsSWPiyoTVi677Fx8ZzoprVnHxxyaNT
         CMow==
X-Forwarded-Encrypted: i=1; AJvYcCWMeTNYeOPIWJpmiw221t+Iopii8xudif66pl5Pi3n/UUPHGDh42PQgcG3YGn6UVLxXqr0xR/n72XnW@vger.kernel.org
X-Gm-Message-State: AOJu0YxOaJFbsx3Kt/z86s9dCxhuZb4r0XBhgvCXN2DgHv/taj3DrVVh
	gC5fRDdPDoshBffEqyAqoYLhtXklpuqqALq+Xb+ksMJqaAvdB51Vvxqt
X-Gm-Gg: AeBDievG5rBlDPApQ0FXh6lGvvUB3mWSzd6p11I4sovJeoCAQ3vnSWppzq2WxlTebqg
	Fc7mhoz2tmfrUQFV/EgJ8WW66ne2qqG0aia2VoOrG8jQRzycOsj7v2Z50HMGkUD/FYlZqdM5JBx
	seAgGeXOSEAs12zeIRsqUbZkZd9IP4WGCPNj2gTzg0Jrf54x54bi+Uws1v9Y7Wu5+6TDfvw+2LH
	uuR5wXp8hCapjYcjSrzNaWCnOrU1Zzw6URne+51UMR/eW37C59OI4YkjAVT5Iut8rpwcGKOzPJ8
	g4pRw6RGrLcKyg2d9W5nV+9F0TVzou3y3NPzMXaRDX1DJoh6Gonv2DRN7PxFuffsNGcux0lbnZ5
	pMvRGja2q6wC/fV6KoDZLEr4npe1cRQqQYVA4+TQpDkg0lpfZ/oIR41AO5s2aoDfAV3hCdrlItR
	VlvKuBCF0eMj7AJT6I+i8sXeENplHl
X-Received: by 2002:a05:6214:5b03:b0:89c:cacd:244a with SMTP id 6a1803df08f44-8a7020c0f64mr41263286d6.5.1775214959993;
        Fri, 03 Apr 2026 04:15:59 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:15:59 -0700 (PDT)
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
Subject: [PATCH v5 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Fri,  3 Apr 2026 07:15:12 -0400
Message-ID: <20260403111516.379795-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
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

