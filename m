Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EEB3BD635
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140389; cv=none; b=JknYCnwrUSL876GisgkaWLm63IqBD2diD3T58OmY1FTmEWfwyYSYPLjY8WIiikTLNpr/sLMwsNa4qffDC2vw6StB/CNodXg2thDz1Q+Ps3+4BmBk0ShDNFUeCC0kYNAEman28cF2W2p5lY0jXtpTqIic6mhB1T3cBiX5wOK7AGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140389; c=relaxed/simple;
	bh=FazoqI/ILuJD9YIY7tvUgoQ9mGvSj/LgYKIkJKM/QVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9d/9jzXNT4ZqIaZ8qjW3rttLfEnlVZEx9ELrTKrc21qSUq3RRiBFe7+0coD4TYH271fTRtw7BWs4DC3+sNZNLPlEFkCTfCrIIj6n6E5PVf7BaueGfw8If+G0pIhoToP61k5z1El2/zOLHvzB6KePr6SJ24x4bafYStPMl4/rPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCzbnYwW; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCzbnYwW"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1628532b3a.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140386; x=1792745186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFJNx9u+viXRs5tNEKp/mtIp21KgfUj1WmCFdRLL6fQ=;
        b=oCzbnYwWDlgtN4/XjPQ2rqwS6bN+VLMrvoP/hSxnEGky+gPs02l6p9FppQuwpEWs6/
         qYSEhOUmfhT+1eTFeGqRGvEIMHlFs70g+KqBKlAXq+YaGJDGxsMv19gzyeE3PUQVvShl
         C0VEO+++Y1m38Tawb2PuPk397a+ZtMxBkLFdVeM97Es/9HJ9xgEIfMh4IaDI25nq8LMi
         RLXoyGMW6GHBvmrfACZDKuMnt7m4REcaQ/80iup8naIwaZQ43kPMJIe7rHeoniy3/pQ1
         HmvO4LcaR4QNnF1WXimlOpr45BtLiEC6OSjXv5ApxTkes9gah9SrMo3CZvEYJMB1uxvW
         +07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140386; x=1792745186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFJNx9u+viXRs5tNEKp/mtIp21KgfUj1WmCFdRLL6fQ=;
        b=ZcNl9MqxS/E6KgCwfnuX0aY7tE79hKxkQT2UcYtToUvpNRdC8+wSjCT2+/4CVPPxC9
         TUpxeiGQYmfdRdR3S5CUG9eKDZ2ZjCLwo9Bk0EcxaduMgZHStRNQj01KEym6Y7ZrXSAp
         XHeIY9YdHnJ8r0il4czpXw7ljE9gj2tff2c9uiup8Et8qkjXycCcyKFonaN8uLzTJw6q
         7779GSf4p3gIXyP+tgHMH2fG6p24RYFyzi4M+D9xsXVaPW0pNMx9KSEsXqxTZwKN5MAt
         F0FgcPqGfl20ptbQ5N0mCFdyKjz8bBvLxSlSje7h/aQmkTznP9sx00O8TXjs4bmq+Ypo
         Nn4A==
X-Gm-Message-State: AFq9FYJh5sH3749lU1HWTY86vrq4shuk7jPOI77Aa3cLdzptuMWJsc+Y
	q5jlPF9R4dE2faNucxKtDagiyy1cikhoeU0Go9Kz5oPwy1fennFUQfPq
X-Gm-Gg: AYBFou0WCBmFGXIxFy+rQWo5UEq9oQ2M+DM0IiZK+kTyS81aJrSLH86GxgGzzmfAywL
	m2n5t5J+ATvgZ8aN2+9SP+YOAAlg3Elzqx8zcP6u3DZxmjS+VztTfVG50aFNxDncHk3LX4MmeU6
	O0kbcolD9QbRsNiGz/rUdpobSa4w1a8C5amZw7dpHzCMdKNxV/ug9V8HkgEv8FbnT0CbiPyeOI4
	FbdNhqA99BPRtJQLpBTuPYt0uRoD5bn7i9vyq6x3PwKBARNZoUsWAzvPLo41EV8sePJK/rDiFlb
	53HACwhGOSymRv7YEiy5S0hxrCw6PMlJOsG6mtImfgr1eT0I6xHvYpLWJs6XIZ7nhmDUQcgr0c/
	wo60bbfgEaGXXzsFym03qA/Z+z4nEu6Vj9qm9MEjahJ4sYWPiANsmX22nWwl2Gw7guLX+V6S53N
	O9E3atmsjklI+Iw5O3RBzM9lFo0Ei/og7Cq5vlXz7cWyZ8DcL7+ibrnQyMTV3Qw5k2eqcrfYohv
	KyS8EHORNM2iqYZUIG8HPxD80tkTnuu7GC35hYj0mn0W/jH
X-Received: by 2002:a05:6a00:a01:b0:886:bb44:631f with SMTP id d2e1a72fcca58-897c6e1c80emr21774772b3a.10.1792140386374;
        Fri, 16 Oct 2026 01:46:26 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57947b0esm756620b3a.39.2026.10.16.01.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:46:25 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 16 Oct 2026 16:50:29 +0800
Subject: [PATCH v10 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ventura2_initial_dts-v10-1-a546659a084b@gmail.com>
References: <20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com>
In-Reply-To: <20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=FazoqI/ILuJD9YIY7tvUgoQ9mGvSj/LgYKIkJKM/QVM=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq0eVZOWBB+HJr13ff3KUg0fZrnwLad53T0UIon
 3VXJMNq1UuJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCatHlWQAKCRClg0K3CVbE
 gdBZCACjTlbWiWNV+3gKl99YFT3Gs9ahFspJGNkV/LAbx6kcKSGnzFdCsOiz+cbI0XLLlf2e/++
 hekAZIERIT+v+o+yNdb5flZFSrv9bDH1ykaIfXwKGt6z8HTkO7GquwCt+19wBUhxWtw1dYYx3jR
 2R8IMSGEtRuVkTQopF3hUSqV8AjE+CT1SzVN9Q27GKcaBp1rtBrkkJWgc07vbtwjjwfWBdLhpMX
 mAUpr6SupMVssUc6xR4vpcDVHo6S0dl6an2bSyweKYShZ5ixH8xQVLgZijsaJH0G+88ELxqlXT/
 wFmczlplAbMieIwx9+C66Fjktaio07vPPHX7U03TM4li/hIZ
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Document the new compatibles used on Facebook ventura2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..b7e70868ebd8 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -98,6 +98,7 @@ properties:
               - facebook,rainiera6-bmc
               - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1

