Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6074D3F4100
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778728599; cv=none; b=CyHng86pkSGv5KFXla+7DgVrDSFPNrwYZWSEiK82jNfYBkmZD4RwBLnU9RPNVOo51XpitAAJy+IbjifcZr3YCZ+jluuv2YtuT6QR1bUsvVh7vR7fagaeIyYWUSls3DDG/VCUsQnPj296EGx0U6mvM+hOXk3gCWmvyQEC5oh0/ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778728599; c=relaxed/simple;
	bh=5ze2uazgAeVIlCca6kGtV7W6GRHZsCErjSONJCf+OPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrWsEZMDToaWZNMjSga3X0uu8sc+IF6F3wGYuBU6NsWwyRagWHocMGt/Iin0dxtHIKmebVQc1no2vns8T2UbcflGs0aXJHGo7hptifH6rMN8gDQ2wSDska82C13UtAlwJnUotCf9Um5yoik0iINd1jNofHXgpNKwSc1vu+E+fNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbXrQ/dJ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbXrQ/dJ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so3883360a91.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778728597; x=1779333397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=FbXrQ/dJJc7mq9lmYDoB6Q4uZK3RN9nkGfm3rzo2Nc1HFIXEuauUEC+mZzHIn//FCC
         tToIa+EJmb2i4qaz+US4SJ+fSPUJJKjTwHbNQPsIQwKNBS8epOQxpOA0kW0M+7kzLZC5
         KH1a/Q5JWbAomvpty3NHk9pDvrkRUraRl3quStiYUR7b3AD02hO7msCpP7vcGO94zjrn
         CEuRHtvRHG8yqIp+XSW0L+ASLh7HmlbQ3xw4VKviIJojBMYVspCk5HFB+IzRz1dHwCmr
         HeMkMURLUbALnVSonG7s9Bf89ZgifsqWWGfqDaTftDB2NNtZIIx80SwPABgmic8gIZp+
         y48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778728597; x=1779333397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=KERCqeGSA+p5R+UPlE4tMxAqsdTdReENrq1xjbe2veWloBDDIOtPtFVMtaUdXYlLVs
         VPO8hWVfK3QV0LcCBOiPNlimwDe/MS2E/nNt7GQoW8++Gi8UOd2Ssc+xesIpl3KUbQ1i
         nipY8AFpVnaseyi6erHd/w0KyU7JbfP3iwavEgQFQiE9UdKDmqzx5+J1/Qqd0yAPf8+0
         p/N21q0ddZCKhpswoAIkgjCalMpe1OeYPfpY6c5vUlTQT2QpjYaLO2IknntrhnRqEeQd
         iVupK29TFD+mA52C3OxAJppxITxN8L7oW/RWtj2yyFI4Z9YIw5kazEiDS+ndYWqB5IdR
         JY1A==
X-Forwarded-Encrypted: i=1; AFNElJ+VVZqHhLEJcahXBKmfDxBBD0hJClu8M5rWIdG68J3eyd7vNrW42bt9m1M8Y+PrUwVJSOa+JTQ7MX0g@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/z5pUtjvnkzyynCzOqEi+OALahBKXAooWIW6USZgHJBdbc1gH
	EC0YfQRfBTLN4ih0q99TkXLkfib9Rm/dxm7/QhWvycyMlN9CxDevtD1l
X-Gm-Gg: Acq92OFLWJQeMrU6LLk0Mmn6VpIeE5sDLuhcqEVv8lCQPv2IjabaWSMonvJ2zgkgsmO
	/zKGgOB1FHFhMZDGsVUXf/ZvD41lpsN4mFU9wrSCSExqxK9xYQa+V5tLLhYcCfY5MTNhFYyCQ/Q
	drRA6iDDW7QKYwJtr3FNgGDb2J6FR7y4OPVb5d7FcJnsbX4nZGS1pCH+mjXeVkemvp4Ev9yGPiT
	jR30TDDj8QLY+LYou8U9hHyr2M9MZHTwoJ3iz2gyAZ2Qtbxzk2oETe67H7+kvIFiB/xCf0qvstn
	vDbmes7c48u8ppBV06iTQ1K5CpOm/6FUERHQ9XQEN1EFZfuZfea6PY4WhR4oZFbLFrr+hGBajWk
	ocXL9K03Zl5hVZfpr/d89JzOuDuBMsAqlprbBbTw1NqnnTFc47vzdIoY6vFDE/ZCPVlTzzKQs/O
	BSsUL3BFUByEsSMLSJUR0bs/HcrRoj87vRNObIYPVo
X-Received: by 2002:a17:90b:46:b0:368:af5c:67f9 with SMTP id 98e67ed59e1d1-368f3aa3ae2mr6181333a91.8.1778728597547;
        Wed, 13 May 2026 20:16:37 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692a94205asm320047a91.7.2026.05.13.20.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:16:37 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Thu, 14 May 2026 08:46:21 +0530
Message-ID: <20260514031622.1416922-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab0..656397850 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -77,6 +77,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
-- 
2.47.3

