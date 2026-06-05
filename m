Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF3D302CD5
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 01:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621246; cv=none; b=d9vTbKoxyqS8mPt29KQtDr4kzFnA7S0hPULWrJIYosF2f8WvhKtT9JmQzpPvU9bD6gUy0URyJ5zTzJEjMGnyG6v6c1dpW5HWR72y618UkyAiovjKbw9uY+XgsqP+6/bH/bdt1cSu9OIriTa6buqYLi+ioTgB6VyLWGf5RLHojRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621246; c=relaxed/simple;
	bh=Tnu576MfKVY9CS43sYUQz8GphW2+pJ42xoN6I+3tod0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QomNZyqmKMoQT/2DnPjXQX7a9/nQ49EnFwcC6LyLtUkTDMDJ9ncZT+YOYXH5HnWAJNPt/Ku9oUBQ2JSrMZUXPUYi5jkRzruW9TV7FYIT9FTgMUEmdac0zsqsL/OXthoH+tyqFxMzXvxMKaLC83/sk/rRfmBC/Vav1p8SlI1BkuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=CsRKk3jW; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="CsRKk3jW"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4864abba33fso1009833b6e.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 18:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621231; x=1781226031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szIQNyD+NnmIvV9OHmmg2MxKrIQLLZ2S3wbfJkga4t0=;
        b=CsRKk3jWi2MjyYTHcXcu+g9BIRhhDRY+CBM5IentGbpNXAGZFhXf2kglnF8AGQUZF2
         EsYHRzrk0IGpSSxAmvMI6BmHKJP6unNhEYwDbOfWeKXghAxVEABDeJmeYcmw1uyYYHit
         bONgr7r6hm5a3TM/4fkbJvlnUYdug7pPXkS627wXhZO0QQRGrf3z9wUbwMxx/eP4Ts/d
         Rvt808ugmjTpbyL1zPHtsocxDknJzb+RR+r3JNU0Gfxw5HMia/o041L3M/nAZxcLj8tG
         IliidHW6jE81G13WfFSJIVKS5VT3AnuWnfuPt7zBMVivG3qc88elH21BbNEw6n3l5TfT
         G7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621231; x=1781226031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=szIQNyD+NnmIvV9OHmmg2MxKrIQLLZ2S3wbfJkga4t0=;
        b=XJadVHfYqL6C+oWSgtRgGmKarFS4l8yu7GFH32VVxtNndVOcFFVUY43Xu5ViwehMuI
         Tr8IHGI7uwwpwDSbD7pudWmSbP5UKnNy1dk9UOwpxJWT4sHWb5gSV4hEZktxPqFDTyWz
         4+fkOdJdQ5EAvy4BCe7CsaMr+OldfMXMfF8Z9ulSfLURtxqr+NCqIjvODsOMmZ74IEuK
         n3h7/JGC1ekZRfhFyoC9JKobj67oI1Jg5FKIv+jhttC98E24BUiEuUPRt5raf8lYyY20
         u21LgvqyR3abviJ9nfoRvyPSMp6dn8n6yYcuhqXgw7E3m44zJCDunB3tLXB2xRzbefl3
         0yRA==
X-Forwarded-Encrypted: i=1; AFNElJ92uWwLY8YNJ5P/OPd99lMd9+EpDWR0OuUlxnYtTgyBRxnbN3MtE0PS0SrH9KALOSCnR5NluKGpP6Vt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx//ei3MtjT1w8CQ3zPWIgu3VOYNRbwPAujaamHOVaRNm40Rj2h
	TC3DBMup0Hl3YrFveXJGHGmuI8362ptY/M6GfmRuM1uWENhZLtdX/+As1LEsTsAbJZM=
X-Gm-Gg: Acq92OGQttadx6yblgvknyydZULyhdwBxVCokoho4lO7V5HPcvQALsl94OZMXioCJy8
	det+Qe5Ml2kA4Yd+8sR3D0KteOw5waohOi/lsvX459V/cEwKBZSLVdbVD7r4Q9QlC6erh9suR0L
	27+Q4MQGklWciUeodReUImiFd+hU1TVx2IFZJ1b+K2YH3ohQfut4YnUWqbXxi/GFYd6xAzfDdf7
	/eEQwNKFu6JoE5USn7ml2RphVu23n3QGqjCJCFycs4nBXc3hHaAe6z91UjRgST9ZgoTTL5SdeAg
	xz6oBiPaHKb4eVt5+Xs/AOlysbADvqusjAlhFYzWqO5yiQDg+yVpFjtJQA+Mfw23kJoWmatmG0E
	JDFIo0Sxt5RWBWoVFQ6iUFUfwbouCb8okNgrYr7+sX8XpW9GXF/PX3pJYHWSsBRDRzwIftLV+lD
	fJ1FONT1tCtJYD61cYstz+k1oINlBqc2AxzlNgSQ==
X-Received: by 2002:a05:6808:30a6:b0:47b:d07b:ec9a with SMTP id 5614622812f47-48692d347d3mr155790b6e.15.1780621231634;
        Thu, 04 Jun 2026 18:00:31 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 01/14] dt-bindings: net: qca,qca808x: Add regulator properties
Date: Thu,  4 Jun 2026 20:00:08 -0500
Message-ID: <20260605010022.968612-2-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

QCA808x has four different power rails (although in many board designs
the different rails share a regulator). Add each of these supplies
to the corresponding DT binding.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/net/qca,qca808x.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qca,qca808x.yaml b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
index e2552655902a3..3c1b7eca33caf 100644
--- a/Documentation/devicetree/bindings/net/qca,qca808x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
@@ -25,6 +25,18 @@ properties:
     enum:
       - ethernet-phy-id004d.d101
 
+  avdd18-supply:
+    description: 1.8v analog power supply.
+
+  vdd-supply:
+    description: 1.05v power supply.
+
+  vdd18-supply:
+    description: 1.8v power supply.
+
+  vdd125-supply:
+    description: (1.25v to 1.98v) LDO regulator power supply.
+
 unevaluatedProperties: false
 
 examples:
@@ -39,6 +51,8 @@ examples:
             compatible = "ethernet-phy-id004d.d101";
             reg = <0>;
 
+            vdd-supply = <&phy_vreg_1v8>;
+
             leds {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.51.0

