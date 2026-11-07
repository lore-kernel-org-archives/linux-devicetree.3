Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794031554;
	b=MpXBcPhSmgxZH/lgtrAvKYU47MHafTPv1rpok/VfAkZbuNX7ljUV5BuNVdZEahuLqnBF
	 bX42rwxk0QOiLETMKIY9ICtgKxNUYGGItM9SAblgo9YfHcbWTrJOZ4paI0ovznHd7KclO
	 AN3Zz3pJ14wCo9GgzHmFL4efZUyxzZ8pgzu3EFdw8TFAgjR7P7yfTBo30fbW1Qe7sMI5n
	 AVy7yatMdft2ymzJH6k8ck31jeRG6GDdFDaFQNedoP+K7UDrru0jRlICHR+KTGJ9BBoRg
	 AtwqJrkPCBPuxxdnOUr9XgO6dlRnpb7aMnxCAF85CEmTXK7s9zlnEWty44kfWH9FMFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794031554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KkFDcS6ihm3QPilltMV71tLbM4fsnU6mSyPVCXhKIRs=;
	b=C2/vOyftyxw6yhLFltBei/Oppy/lSpO3FQJHeibcrpNR3pLeLA5UZxNQDNmSf7/IP1ML
	 0yaO10jmFzGFvafa/1IAJgq6/5ztIUMHTqbB2HDpVZt7bAV6ariQaW/d5RFWaBcZ6Qy3g
	 DI8niRJO850pw82Qf5BkendpS8ahaiqzFDHg2HllsWxFJyWP47g8XgTFeaNC46pGJd1hy
	 T4Wj7I/lB6aFRoCMl1a9nGj2H0ldUyAFo/FrsQzhDNr7ewxa24wlTUD3MqALqmVhopLfi
	 /7SaIG/yTiSRwp7Oxykwnjv2cc6+g1nRdk5rWmSrWPpeaa3WKVxQ646C7DJgrVsJEYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+jcvQ5D;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC58C606A326
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 06:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC58C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+jcvQ5D
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b2382bf051so628824b3a.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 22:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794031553; x=1794636353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkFDcS6ihm3QPilltMV71tLbM4fsnU6mSyPVCXhKIRs=;
        b=q+jcvQ5DkMT8aE78L34gxuy8aXCHC7uUuvUXxH04Cfy55sJ/qK9Apb+lwuW+cu2cSQ
         Vrjtv1DOhTHg2dvx1bM6MqvE/VZ+L85bxdc9f03AtqyQlB8oTJpASFABx/fMasluVL+L
         1A4R5pYoE488cGTinYVmsA3KfM4S+ZLAxHi+/uysykpzyatKjh4TmwaABCGd5hKMBv5b
         n7J4+tIEOvOVg9yxGfafzq9wLoYr4wxf4IevZhnKot858WOXRt3+fYB8QpCygEbagqNv
         GL9cmrIOHzttso8mIpT9wXY3U9fw+xGn5FIrf0UA4rn1Zr924S00b13HB+IJszww6OHf
         rTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794031553; x=1794636353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkFDcS6ihm3QPilltMV71tLbM4fsnU6mSyPVCXhKIRs=;
        b=PHOlwz21tRQqlDMP0EWacC6/EErKANCU84/rxi3ipJG+0F3ZzpJlB9CwP+kfX9YSzO
         LOqbup8oOZbtRhKSTO7R2mMwH+D9mdf55siD5rXjdkxZzesZOMWn0iSvtqMee9/x6hKw
         +sWBOkpcsb/XtY1q20An/ItnyisETtUBK3ewNdx4T6alTfYleEH9aUaWIZNQqLEhOtCb
         mUdHGIwn4Tvcy1iC/bcx6lpb4EkfA+SCnyNBp20xRsLruWCaaccOTdV8wXVY/GpfTbjd
         3eUYAInOlbizxcfMgxPG4Y1tbVXTys/iK4BGLGSPObcx/dlopHyzHcafmijHctz32pgY
         f76g==
X-Forwarded-Encrypted: i=1; AKwUvBz/PQWdG2ju4/0m5Dr0zme6kW9fRBZrJE/jbrEZMBxTP1b6tdWnFvRhb898d946RA7zyAdeKv6px66Q@vger.kernel.org
X-Gm-Message-State: APuU4Z9qdv5P+XIF2FMg0GT9mvWHsHwseOcX8y11KFHT5It5ck0luLtN
	Au4uiIA85/hEOflByoZ0i0bM0qEnb9IrbH8VZ0m8LFNEFs8lGXoOBQjh
X-Gm-Gg: AYBFou1U4NOITGaAK/1Fu81qnPw/UkZ5/mW4m5QVB5qnuurV+pXtB23yi3E+FeHFaoJ
	w3xCF5tgj6K3mp3achl5igRRJrNvCyWouM6L/DOYyxFx0XbiM8x4tHnCD/B20wwmsn0tkfWLh/t
	z4ze/wiJyueRs2DwU6a3QU4oYQa3Cq/cm0JglkNqfgMLH+ZMX2udU8LaI9x1zMDOYxTS8D79MjC
	KOLuZNqCFGU+F+E3iTWwo930Fcory0LmS2npTxx5i7bCs4n0I/mCDbiYNRT6xEWov0vWpSzGZEZ
	yu33QqerLMwWbT06SCgXhSan4iIH+A1k4jU+cvAUO5RsJIk+4n3+DnIxI0PButjG1WKivhDa5bW
	/QEQvlbRj1wy+zJNyRJyAgJAtXz1n71DZ650dHYnoD7cQiVG0Qs3gtAtOxUREJ+6kxe5hlNWYuD
	Km5Kh82xIsOJtJiHMEHbyWMDhwyVXOmKoyPBk0aELzpwqPcxXBlDF1k5Jt2LD38CKicXX93NqYn
	P+SqHBvkB61V6J4U57jUu6BA1sfyEzJun1B8dsxGsjsAXg10snHs0y6oxzWsqhXH5xnvLY0oHOp
	SfatHh4JmqE3jdEHcn11WY5s8sDI4423zX5g2qLjEsGEO8Iw5E+qlz0aY2F0RcH1
X-Received: by 2002:a05:6a00:4605:b0:8a0:6414:a54c with SMTP id d2e1a72fcca58-8b37b4781dfmr4725632b3a.32.1794031553173;
        Fri, 06 Nov 2026 22:05:53 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0539sm1176326b3a.31.2026.11.06.22.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:05:52 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2] ARM: dts: kirkwood: Remove duplicate DS212 compatible
Date: Sat,  7 Nov 2026 00:05:49 -0600
Message-ID: <20261107060549.598466-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Synology DS212 Device Tree lists "synology,ds212pv10" twice
in its compatible property. The corresponding Kirkwood binding
also repeats this entry.

Remove the duplicate from both the Device Tree and its binding
so that the documented compatible sequence contains only unique
identifiers.

The compatible ordering is otherwise unchanged.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
index 120784066..bca7f98df 100644
--- a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
@@ -55,7 +55,6 @@ properties:
       - items:
           - const: synology,ds212
           - const: synology,ds212pv10
-          - const: synology,ds212pv10
           - const: synology,ds212pv20
           - const: synology,ds213airv10
           - const: synology,ds213v10
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
index 416bab50d..8b5af5122 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
@@ -14,7 +14,7 @@
 / {
 	model = "Synology DS212, DS212p v10, v20, DS213air v10, DS213 v10";
 	compatible = "synology,ds212", "synology,ds212pv10",
-		     "synology,ds212pv10", "synology,ds212pv20",
+		     "synology,ds212pv20",
 		     "synology,ds213airv10", "synology,ds213v10",
 		     "marvell,kirkwood";
 
-- 
2.56.0

