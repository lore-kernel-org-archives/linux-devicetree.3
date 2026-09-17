Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8843350276D
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662728; cv=none; b=bBQYGgB0JaYS3Es/ZHPtsvhg7oEEMT92BqoAF/6KmBnfcN7sSgpadb9fhTW9DUnOp9hlZo1b+OoqJWx6eAad89tWUG2gsmUNGgADFm+/7VM92WSXrHT+L/pKVp98P1st85fszaiJ2Ox/Woef1zVGwF8tDEXNVJouMuLLBRWVrqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662728; c=relaxed/simple;
	bh=sUCV3PJZHQDL3sJ0m0pd8ASDLg923Kkb0J3Ym09STSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YB3NY/UiM82aqiSLdfQ6CjzLaH1kXkHIa98D+ZyFR0hOo/mgLddz6PQ/y0r4vLxSA3OVngxsoJNvYPH70JiyB5lR/lfsQ1HEvpBYyUGv1C5NKQ4W49eweQhk+Toau/vIzVOlJRfUIjanxBVW3y56krBI3o2J1PCPd794nbfN2yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=CL64pN0z; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="CL64pN0z"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so720247f8f.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789662725; x=1790267525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qeYLsnxGAnR3sREUzabrC9c2x10xNSrFuy5WEeiGuV0=;
        b=CL64pN0zkOjeEIYGUy9n8XSu4TkM2EykbOLlgO1GrYjagGcBs+JUAUbKhXtPArJSJK
         lLxjz3JMw+YUYld+Lgkm+ILsn/XyveQtOEelqL2DdK26zfq4cWpouDGvFBsEjzFwzs13
         A+6q2fdHrijidEWNyxQe2A1O4VSzAt/rAKOxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662725; x=1790267525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qeYLsnxGAnR3sREUzabrC9c2x10xNSrFuy5WEeiGuV0=;
        b=a/pQ2sH+JGT3JBOnYsSz6gNjsz8/wf/pGrFYPFbI/HoeUzBbE50nX1YLSxTl6UzFlo
         noHHjwda6VDF1TXY/o8GSIVUo5DdvJKDispJK+M+WwIaDZLlO88jK0m9QGDtwAysG3KX
         0MCr4ldJ8OylXPR/zoFKi9Q7Xs9BgZRQA07PHoyfRB6fgdTkI3gPLh5BFSu5Ge0AZFgw
         PPyr1n77UhYHcRo2k0a8A6ay3ofDQlN+HtuDXhbs3M325X3g31fWtFGpfcWpJv2rOKJO
         2vPSUBfQjcelXVoGNJB8rClDIBhOi4ufPDP49IGiMjWxKvQ5CobJ6fty3OjuHuupssA8
         2IEg==
X-Gm-Message-State: AFuF++mp0aLKeIwRPwuaeQHhAhaurwsHNPa9jNN/RsQMQ++OJKAG/+Qi
	w+/mQl12L/wUHVelD2YDOAKE4UgM+kds0Hbq1h1qqB1IbxZaowW7slAS110k85V8fzk=
X-Gm-Gg: AYBFou0j6TEct5nwc8XGeYnH8A3fcsY5HS0NgEekX+VQp0tEKJGl36noWMD5EwOFvMK
	rf0+RD4aIL6RADC1UdGFwbTtcv6Fc7RaR8KAtyhuyd5Dj0bEx6Ah/t75JyrwioBNNLx7qpNxU+0
	GYLoZFbri8l2Crws1PqLjt8YR9g0t0Vlv/71MrSDTB2NkuNToxFhl2PXKelhyqYnd9M0HXjm5Q+
	n/qezid3WxSnax0LzK7P+OrKSLXInz0vTNxf6H7xNISBaNgY5P5AxosdGuHOYQbYHNK84242b0I
	/5no1pGbe99cT4r2hyquYBXZyxg2rh2nx3iQGEOzQE5qtbo5nT3AGK819J+K4h9TXHsCsWXJz3R
	X4fsSDlVtPsLXQl/Uhke1gQf8OIzcil9wtSBgeUc2MOAOgGlvZqnImk6St8t8vSLnW6GpEC91ED
	6umHO0vN2bLzwGe+iyq682HtIBlGT6G+8MxaG3D4xrNiEM9tbFZNLhRkubbiwNxvDcH9imb3N1V
	tD4NLRCubTT+TEjcZlp+B/c7yc=
X-Received: by 2002:a05:6000:220b:b0:487:863:253d with SMTP id ffacd0b85a97d-4870d0667d8mr9722274f8f.31.1789662724767;
        Thu, 17 Sep 2026 09:32:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm16842652f8f.35.2026.09.17.09.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:32:04 -0700 (PDT)
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
Subject: [PATCH v6 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Date: Thu, 17 Sep 2026 19:31:55 +0300
Message-ID: <20260917163157.1380860-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917163157.1380860-1-petko.manolov@konsulko.com>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT compatible string for Draeger's M48 CPU Module that is also
based on Altera SoCFPGA.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..e1e4bba248ad 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

