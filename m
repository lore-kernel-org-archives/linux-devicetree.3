Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA252ED33
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689272; cv=none; b=YPbFJks720hg3vxCVMt5MK9JYt+iwtPgoC2CVcEWzFlUW6+VZ1AMgUkckWDkQhpDfhIMEIG+JySEd7rN00WFK0WHsrp0+iuXjKOc4vCVvDDoo/TImwJ5Ze422WHwf/BxTA4Y3UvfxcxE+fVaPeGyDkDyVM0c1RLU5/YRXCAcKcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689272; c=relaxed/simple;
	bh=q0g9bS9hVZmTZ/AtVPb+rUnAp00nLQxLkid0mc9V+ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQEf8/QWJJ5UhSxpVnrKEz7TTsY7bB/jjnRN7wEr9G1KZSX2tSrM0Az5h58iNEtOFQUHOjAITYSYokF4SLWJem6fCypWMJNFeb8WpGuZvwdnDqj1o0uWIljuclsrxuJ5TYz6RRBTLzJCknoTP4xEjsB40qn92gnxNtI20wVDcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=iCf/1ZGy; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="iCf/1ZGy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso5800685e9.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790689269; x=1791294069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rD1F8iXqfiZiLgVxm4GqU69qGKFrkkbhDOhsxOqYYB8=;
        b=iCf/1ZGydr9e38NG9NeMQEtCkqJuq3kZXLYRm7d7IA/3kMEUpIZS0Y7RsJp5/xVfEu
         lTyLIUxOtSMXT7YvtQ5cvjZ7L7HFxyqH8/zP1UEuG5QXVVntS9liz39jGEyRt1Caqfuq
         +HtA+uRQ7d1uA7+3OwD4UgLVAntMUXs0Ol4T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689269; x=1791294069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rD1F8iXqfiZiLgVxm4GqU69qGKFrkkbhDOhsxOqYYB8=;
        b=klkfcrWklirtAlq1P8D2ldYr4Ik7S456pWwdtpK6T7KrjTW9yzg0x96decMqOxKEYo
         a4oz67zbr58DQjcS0Al77OdMCHdlw90WACDxOXnyB9fyrVVPtY3EXO7JifhwTSw7ml0G
         dYO5/f3FddRj23LYSQUZ6KLQZQuxmMWb4pWY2mUKFF7PdytcDp+b6qpvVvKuESYQONb6
         17uhw6gljZNtSNWV3nIaMeGuMJxLhT280rF3/uyJV8KvzBvRlgXyrTOTEwnj9qcCoErR
         HR2nE8O5knt5c088RFyt2CODtJPYBWPXYyF0iaUu63wviSNeWtOT/jy4IzUHuu5115OS
         neSg==
X-Gm-Message-State: AFuF++nInHW9i6GHbauX1p8CadkHpIrY8tFdOzsFNYUDeNqajPaNISdT
	WtPqtlHnT7ZYpn5QGYYuEFWwoa4FMIfWbherwSXT1o6z4HcIbcb809J3MzZOplN9IMJJXpWToqG
	yE8rV
X-Gm-Gg: AYBFou2zCU6rLFepd4skDsE6DG7UgC2mFAUsF4CQXOlmOIoN9LU1bNDAvtorIoxCs2r
	IE0exP9BjF4/09gnOi5EdVCMMQRvlxMI7i3oYazGC4ig79LdY5aN/Ak1u7Fq96s1H1lW9t415wL
	5v3QpHkIj7GvSDL8U1+pa7OYjNsKLRDVrUR1CAIgi64of9QxCealXV+5gJzGTVx8ka8ts8NDVcs
	cQepl+0TfHlPTaVSBFHrakX3f8lDd6Sjp4EaYjPuU3/K8rWmBcHpPKPJVyUBxgAia2XNhRhwUOl
	X4NBLa4At/RRMIkpYcFq+RbcI/w9wT9T4MMR9Cm3KIRD42MaGXaYGDEe5yG1pQ/fwV3vp+wwvtw
	U5v5ZYrlS+mKRGZr/PeyGJPgOWXsA1VqKY9Njn/KYKp1+NRkHwzu6oOOf4omkqKg6mAFmlj39EX
	DO41G9xL/1lDTB5KeqFXKb7r4v89Yy69uiqIWkLyQTX0rqJwNc1LMTcueud6qMECpo20yxVi2oM
	gh+vXVQdQTKqlda
X-Received: by 2002:a05:600c:1912:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-49fe667a597mr288366765e9.0.1790689268322;
        Tue, 29 Sep 2026 06:41:08 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d1011d9sm91835165e9.15.2026.09.29.06.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:41:06 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v8 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Tue, 29 Sep 2026 16:40:56 +0300
Message-ID: <20260929134058.819371-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929134058.819371-1-petko.manolov@konsulko.com>
References: <20260929134058.819371-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..b67dc10b0a11 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,socfpga-m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

