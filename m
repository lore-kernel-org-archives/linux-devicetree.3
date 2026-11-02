Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649332;
	b=eWZvi7KNV/u4ExkvLcjnl5BjK58TOGSHw+Vob8FM3I/uq6RuXKHp4t0qpeerMvUlhitr
	 Tb5j5DHVdXbpQi87GPKGaHS7AGG1wDJ8L2rqf7cODq6+pUhTns8wyVupmgbO4jU0h+3jY
	 ZDI7nU5Yr6k5++bvs14W1E2UqN4E1VSURlgzQ6lE0/7a1rFqeqIueMrCTaeQeWG14UJa0
	 qZ9C89oQ3SPh5NM4VdgUSHri77K3QYDj5QoSsXc9KBCfWn0c5oYnCJJGCK93TExDSeA5k
	 Z7QlE2/rVJx5CVBncfalzN0dYPsv+V/IZeXg6iCXAt/tHC76l1e+RCACjMo06+lEugg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
	b=4UcT0yHFE6J7szku7/uJCXTLQwj02HrVAr4IriVhk50priXfc6QMNUIOOMzgn2B+Vic8
	 aw2wUTTw9GmT4oM72SYAHNQD9EBk+Qa+lCx+EKghHAqM6rAdtIsn/r776fznwvGDbtOh0
	 JlmyIJ+mQeGH6uaxDRvMI1Dj9bunBktlBNo9KSZAORTwmAtntanI8E/WgcpShIdEPwVMn
	 ewJ+TtHtyl2AANUeqduEH/UxRVqi2OJs415iYM5IShQO/yH4NFtpHTH/xcuM0bFcjLhOi
	 vd0cqGAx3sqFxfXp49Zk9nV1vlN97puO5vuEfB2dCQHoWtBq9y/k26/At5gQ4UOI2Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0tI1YuB+;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F986082BF5
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F986082BF5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0tI1YuB+
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-46556b9e02cso2771720fac.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649331; x=1794254131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
        b=0tI1YuB+zs0KnuaGqYlU+SONfRwA1e6goPMu/fCLW9InZ7R8U01d6RPKRjSui9PEct
         b5JM1a7zKE7fCmN7epJ2Z054NrJO3TfJjvfHTupc2yRHmgMJyhBnISUYZRrOrnLaINWg
         hZrrofcF+AszR11YUdigxcATbtGBh6s54IMrG4amIUM0lfRtWG8CLTjuuSOntmPOcsf6
         bgFkFbCxikjF5KXRYdjkTQsQM+8NBZzeu/AMRpa0nAr5R9DIjZDUurxTGQNhT7/JyISC
         pgQjZX/AGDiBW77knu2gtoY62Rrlrm8pXQ5Ctd5nrMkFCW61KYG6Da2FoGtTWjC0Ptg9
         CmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649331; x=1794254131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
        b=j+++sSSUCtZfEnGUfZUZCzu7S00gVEa2/wnrXwPU4pyn7DXaFMJUMEJxyyas+ZSAyu
         uEBkRP/xRow3NWrwXkeONaKqeUZ1O49d/NhAqqGB4APLL1p3p21rNbTuozNQsRlDg2kE
         q5CPQURsqG1rWYwMWAErVHEACWUfL6hFU8tPT4HIeI1Bon/pQYEiFO4uSDik2kJ9WVjq
         5SAnGyetK538aatt9DXG29m/FZg4TQemHWYhS8LG0NcOff1xZtw00QrYpa6PYI+Sv9Ob
         kDGGWGEB8QZGrtFMtqiWw6vtkd7ifFfHldwD9zNjIFKPGB9s1fHNRNES99VgZE9teED/
         JHEg==
X-Forwarded-Encrypted: i=1; AKwUvByH7+HqteacZ91Gm2MVAmJNAOOc3260zopJImIPc47w+FkzqYzF+mR8iRhJyep84olThK6Vqu8T1tgM@vger.kernel.org
X-Gm-Message-State: AFq9FYIHQIdYrRlfJ7r9lRHxADDyEzXoHKbiI0fmqtRskDpStaxSD9JH
	VPsplnX6TwTH2QSs5yGDbH4mZtGPJuTi0wKSuhSooBPgWRzVnrt1Ygpv
X-Gm-Gg: AYBFou0FxGZietjzwXBszedHug47sxABQfA8Ca+58gMr9qrgKr6tGf1UTwdmz8Fh4yB
	s5xivIK5w3A+dAsCJwKwvQDm88bBSVnQe141oT/ryHgpMAyn9Ayn94/8ULVLS82naTgMs2dnEHv
	OaCfZYUXExDxvJmtrfejy9yjL+yPtsRjxppwe64pgeIpVkdpSbO7kWcTqC8fplQyBs4yct8lPTC
	HdnRxFnAoIBMExPG9fLJHft0fqQDakaWLXMZBoQDGbLffuOmpEyU2jzSCXzvmclVgnu6eNOEjoD
	1BOcU2IQWU15F5qbhdFC82L7qYb1x6bblZ+ANtYloWEJVCsNC2tYz++QnFRgT/DDraNYV2R/W94
	nxMRvD3WgeeS1yOWUYLKaZ+R7CD1XCz769xcP6JEJpIAJ+Ee8t52Q6ghm0NqvkhXiS4rfm6TdTr
	5kAr86ejzxu5Lrr7hGsy6LkMYnbehDJg/s2Sb5HtkDgXN1A7Y26AnaGOGqCNIOBU5QJ3eVBVumC
	lX9XyEeNEiBADUnNoQUIaoRf+XRIKajE44Q+/Z01LOzAQJyYVt7rzDGmt0OaojZqm9fMWVb/Ssj
	I/ou2DUqEz2vSwRPI/6hPzYi5/fFvk0rhQAy4O8xCI51KZbI6GOtNV6cWlT2o0DPns/V8J+l/rM
	ricvwD/ZWryvIC8D5iZ2RIUL7J6RuwabzlShWYZALNWxG0uym0brW3iBJwAQZkNkF3NYZnvqJoL
	EkIpw4v0W39e3ihDpqvDWAZm5dnW8J06ls3kGSL8AoEHA8yEfE8l8=
X-Received: by 2002:a05:6870:f150:b0:48f:e0f6:bd51 with SMTP id 586e51a60fabf-4a8e0ac1b8emr6815144fac.38.1793649331212;
        Mon, 02 Nov 2026 11:55:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:21 -0700
Subject: [PATCH v6 6/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-6-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
Its receive thresholds are fractions of that depth, and its optional
register layout differs from the generic DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

