Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59DE15CD7E
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719291; cv=none; b=N2PvRxU8owyfsU6HgJ6owyWWT4aSg4o4PEDVh1/VKTaZk49kWOqAmsZ2K/Wcx7HcJVKIOnl64pWceVXWF3Wq/4izOHWd+C1Ljaxmyhab6MrIVdSOHo9RkyDGnikWkNZVoqPze4qr9HmaSIs6b55rmBvZ5OetByenOzDo6yN0i+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719291; c=relaxed/simple;
	bh=/aQvxwyfiMEttMc4XjUXTFf8VOx3i5lmxTbBl+aVsrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YYZbpYH6U01kZ8/oaj6jJIn1HbQeulL0OaChg+Gc5df2g0KEEqk3uqZg/zYAQv1yOSzI+2m0pb0j/+48XOAfxVQieC/+QCYZzm7Rrtq6RfCJp6i7/uRjtgyGvFAVBSQs1msOLIzVBLshPQ95vRQAYXyuHV3UX6MTNGd9cIej7Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIBpX06c; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIBpX06c"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82748257f5fso338380b3a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 00:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775719290; x=1776324090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RCwBZBvsaSuctATrpMWLtlus3Iz6VFiDekP6BgSoq0=;
        b=tIBpX06c+Ix6e8O9UKY59FslCdB3tnBS7B3fnJS/ljvlxuRTsxmoel1+TeNAcS+L8f
         3rkLLh6yd8Bt6hgV6i9b5d9TlsFg4SMxw9bqp3OeBZ1FkqyRI6BrQy5ha3HTEzaLh9ca
         UQ98ZliFVtLF/SY7M9en6U6l4YytZYjIS8VNbVSZuv1h7xmlpjUUxb8pVGCboetOBNLx
         TVP5gh3AcIOjJOANjUJJxL/43q5ZPHqluGxY7DTnea/o25QglEfRh+1V9VyB2ezGf/YJ
         ufu3XFJ1WXMwOg/j0s6lQmfeuQcCze+j+0VjHn6BEVakGH9kkXXMJrDE6JYLuP032ork
         kqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719290; x=1776324090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7RCwBZBvsaSuctATrpMWLtlus3Iz6VFiDekP6BgSoq0=;
        b=BDC4wMlogeu0nF1URrugcKiTvK0MPKoYSywsPwl8yqGf85g70eqIMh/8HsuTW3eQCl
         kJcR1lt2sUEAXjqiqiZ7+MksJeH6Cp6+V/4nSlS0/Qpw6EwmSEKbTqQqin4Zz3XHJjvw
         js9h/jIeCqKO2Km5rQ9jlmvqPKEkLziqFNBwEQScI47IXAGyS9CxfoHKSS4HCxtgaM8D
         NvPkCBdQZ5DxKYpnZ/yrDmd0TsNJTUyh/ewQsz2De3i/YmKj3f4fB/xBcpVYnDbAkNuz
         429to6MJzrDk1Yyt/WNx5WMW6s78Q3Ae+AkTIQeOkpkHHsYuqPUbdfjl9oQhzMSdQvHp
         TWlA==
X-Forwarded-Encrypted: i=1; AJvYcCVIFi66AmttRiFIqSRe8+BE0n6OPefvMQMpolZifga5IV+uhAzZeuKXrhjF7PApTXH2ZvmbaEMFXbYg@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/rEqFeNPGtcK3id59iSLM+D1z5TcNPWkc4yt9gn87De1IiD1
	GOShfB6H/SKWkmM2Q9D1JMph5kcA8tZQen2I9KT72FREXaRdtuZx5KVD
X-Gm-Gg: AeBDiesO/fcPEoDb5iyJJHfYfFi8eatHw8ACKEQggXyre23/QqPhQAvs21PYFCQLZQ3
	j+yRx550B4DghQNkyY3YsPZZxn4/caIj5/PuvvdquPet85xEvTZPvM7PQuKsNE/AXnLCvQVJRx2
	S9myleZVjJsuMplrnpsKRQvnhFKxRXG5ogR3VW2jJUPqmM35gEEXHqYG9nyHw/RZnC4f4HucSE9
	BGJ97lrk5vGFHqdgntoFXjoss06EYY/NBPasZNgLInE8igGd+HZnyLa5zx1dPZPFAcR8oUgxBkY
	J75B+zTTwJErA6L9c/vRW3c80SXZFStS/wXVSZmsnjCZ7U6ztjhd2WusDVdcShDkeJwY6rRYVRE
	4VdHJlv3kjifqCZODn+9X+V/F9PpVSia8mBpcZerqsXO3TeR3J2o6NG1fUsyPCDML2RvRowQgKb
	nasZA3qMkjfNUMA1sqG6f+F8EjMgwLpXDyp/TBmVvbuRqdZyyZfsj48Z5adoPC7Rzrrws347xUS
	PZoaTWC
X-Received: by 2002:a05:6a00:b60e:b0:827:2d7b:5038 with SMTP id d2e1a72fcca58-82dd8a1d9f4mr2094952b3a.5.1775719289983;
        Thu, 09 Apr 2026 00:21:29 -0700 (PDT)
Received: from davidwang.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11f76c09sm18807603b3a.55.2026.04.09.00.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:21:29 -0700 (PDT)
From: David Wang <tomato1220@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@aj.id.au,
	avi.fishman@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	ctcchien@nuvoton.com,
	mimi05633@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davidwang@quantatw.com,
	David Wang <tomato1220@gmail.com>
Subject: [PATCH 1/2] dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val property
Date: Thu,  9 Apr 2026 15:21:04 +0800
Message-Id: <ba0845c590eda42a28b3799a6f40294ba74a726e.1775717959.git.tomato1220@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1775717959.git.tomato1220@gmail.com>
References: <cover.1775717959.git.tomato1220@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "nuvoton,ctrl-reg-val" vendor property to allow optional
initialization of the RTC control register (0x0A).

This allows platform-specific configurations like 24h mode and
write ownership to be defined via Device Tree.

Signed-off-by: David Wang <tomato1220@gmail.com>
---
 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
index 4f9b5604acd9..0984dfb77170 100644
--- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
+++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
@@ -24,6 +24,10 @@ properties:
 
   reset-source: true
 
+  nuvoton,ctrl-reg-val:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Initial value for the control register (0x0A).
+
 required:
   - compatible
   - reg
@@ -39,6 +43,7 @@ examples:
         rtc@6f {
             compatible = "nuvoton,nct3018y";
             reg = <0x6f>;
+            nuvoton,ctrl-reg-val = <0x21>;
         };
     };
 
-- 
2.34.1

