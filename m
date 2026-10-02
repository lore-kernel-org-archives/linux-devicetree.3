Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4171D49B44A
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952602; cv=none; b=tMaRPn523nkQRCG4EZ8ldtKKlXVC+wWI7vADEMyVq01KjjHaGnOILGl8MWu+QrwWxlX1CqTDqrLksUopNwU0PxSTpFO6LtkPclY4aeIV1C9VWSo0WnXPbxGAVWpHQm0tkDyhjUViMkCteLnV+H3DhRck3YMzI75ENu+Y4x0aFlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952602; c=relaxed/simple;
	bh=UFIj2wMvo5XUOBicWCPYVsxIWkd4wo9mTw61yb2XBXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pI5pueNNU2CDAcAUMeAZT7QqSGiKlS+Z39qN0PLazIrMmrbQvfIaHseCi1IsAbPnRcKHAK25OFRnKrAiwueegyjeAl16dDhHX//6c5QEBkg/J/J/Uf9/AR0CXWCB9sgovyhtxrKsr/u/3zHSoiBUqdQSz9TWfVC9YPEEc3rM5k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qbHtZRkU; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qbHtZRkU"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e27d11f43so131466b.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790952594; x=1791557394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9dINPrQCPR0iqwn2K3Vkhxxuj3wUNi7Zp3ZQDcumLQ=;
        b=qbHtZRkUia2Yp76jDnwnDeyn48Nd18nKAcq7gWhecHeGIfVwVcgYsoX/pDKx9t8Acx
         95Zc3YfAv2H6tJic/a4SFKeWgV2ZLHNEsrO/JojdSty0XA/oG8jo0pGuPdrKuh+E0whs
         YHM3qy/fQdDOWQ9htpvfCHb1vCkLlbpfH9CQV8vOH0v9AXlQYQ2L1jfvWBvOuV4KkPw/
         BBQj133BJ/qvPjRomVGQ+HS0F+3mL7DqVwh/Yb9n7hZ2KxASzRM3BlfvYQ4SV7QvgP7k
         WuChdFOTSdVJCAmqHVq3IunMNOSHDE2AjMiCtDC1C53YXTWsPvfScKNgX0TvGs5HY8mu
         vUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952594; x=1791557394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9dINPrQCPR0iqwn2K3Vkhxxuj3wUNi7Zp3ZQDcumLQ=;
        b=14ZY55poDabxfZRDYPIUJYP2gFPb01GGw4YPF3ZYILL6B6MZ1D/fuD5c8Ma+/iNoyf
         I8mS8aIDLkLhUrZpUMV80Auyl20mlf+f1N1QEvhuLRt2QVoOGttvrmJsesAghJY4iMIh
         I5p9TvmbaSvjhE4fIcaNj6E2jewqTfeTzSibWMoHPQuf0RZi9MA19ydvtt4HcAsORg2Y
         2L4vrNZcboe9inDnugJ37Z/d81YvU1HvaLhwKJ9LRAcwY2pSonjukc4LMV/AgGSq/5hm
         s6dry9XASDzyd7Hf30co0NwMFPIJU2D6iY7lWenYrS+7Th3Heo3my/mStFdEyN8BS4+u
         sZtg==
X-Forwarded-Encrypted: i=1; AKwUvBz04+bO04PPx7Hx/90/cS9ljfm0XJD1FNKQUxUD+GtpiRhHWUxXhG7tYM/owT1Sb2AJX8QSXssjMHXZ@vger.kernel.org
X-Gm-Message-State: AFq9FYILm8I/GWOUAq9/dOWCAFNXuw+ZulMXHPMJEpRPsJ2A9Lu7ObDr
	y01QTkF2rkIAoQ1HFGys+ob1DsNf0xoqibMgJtJuMXafiTKtTtdsln4cDwhgmfPWUu0=
X-Gm-Gg: AYBFou37GEbov/FyM0P0klfU6h0I/J82aRHDQipT3r6AtNP8CWTfNUWhrURdMHcDawP
	0jt4lC7i8YIxfVEuMAgJ3NtgFnzvpaBux/9vR6UJhxyR6juiUm48K7XC+c4FosnWFQRPqJ7JZZ/
	bGhnMFPpsQGfH75rHjEJLFbtjHbbTGHYzppjb4jOfAtyTtaF2RF7IheuwwTZI0HxLHdoD4pIin9
	dFV6kmS3CPGUZ4Tui9u4RVlHkwxCQTotGHjVOGD7ADbg0jaxWdRfRnk1K1Kvr25Cb2Qn9bY8Xvq
	lGRX/v11haNDSXayyAtaCRD2+/6wCe4ao/wpgCEE3HBeWKda997kskd3n6OIu99TF4m4okBK9B+
	Lt1KGQ/kiz+KCxMWGzdLpJm/EdafW9qYAorOgK6tNsJyu2AtNHf4bfYdzHBt5NZwHAlvVoJeRVi
	q/9lav1axmH3GPDEKr5O3IMIbpiYLMoNYcDmDc5kTwU9cP3rrffG1ZaMU1v6s/C4wrP0dqgmNrZ
	dZDtPXSN5iL4qpSBkn12GwVYwJmE5p+AHv3gL0DN7++AUTLnIF7
X-Received: by 2002:a17:906:ba87:b0:c2a:4847:231b with SMTP id a640c23a62f3a-c2e4ae235a3mr249670166b.24.1790952594706;
        Fri, 02 Oct 2026 07:49:54 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cfa656bsm94539066b.74.2026.10.02.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:49:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:49:51 +0200
Subject: [PATCH 2/2] dt-bindings: display: panel: himax,hx83112b: Tighten
 compatible matching
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-hx83112-compatible-contains-v1-2-d558635ab7fc@fairphone.com>
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
In-Reply-To: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790952592; l=816;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=UFIj2wMvo5XUOBicWCPYVsxIWkd4wo9mTw61yb2XBXA=;
 b=PdkVOKEXFAm0sgIKoBhGPzu1gFBftu0qHcNL1NRDXWSJcJrDJjbnmsITJ+q/d43jScGvZmi84
 7Ed2SsdoD+nCXXCG78S/8INaau1afyaoLL/nPkm+xz2NKKuEYhhR0vd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The compatible was defined too wide, we just want "djn,98-03057-6598b-i"
and nothing else.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
index e58bb3d45331..34e97003d293 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
@@ -18,8 +18,7 @@ allOf:
 
 properties:
   compatible:
-    contains:
-      const: djn,98-03057-6598b-i
+    const: djn,98-03057-6598b-i
 
   reg:
     maxItems: 1

-- 
2.56.0

