Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680185038F9
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 23:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637596; cv=none; b=pqXDMwidKRerASZ9dmKuxYwnabrrl//zooh/QXCUZUYg+Bob+8WjGYBt9FOepOj/C42nB0ED1M96oVj9I7jzocnEUScWtyjLkPjwvZgQeT7p00SeadrMTkMckzy8ikh1g4CKGBjm/teRvn4fjmn1jYu+llC9j71nIfAgxaD24VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637596; c=relaxed/simple;
	bh=EHfy6hM5pM0etoyr1TjkORgk67ORR+GOL0Tj6FPVj0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JK3L45SVP5W/Z6Bu6LCzSFx+hjeGSwK5vjlR1shq2oZyZaeNqaWzG8VzY+pJesHK+S3ooljfiIBIUyncfdtpaZ1YCV6/Unu0CQEO2RDNmt7Gev9WL0xjxhcGDZLQlm4gprWo3R7b4tvTABvn9L3F7bCGDDQgBJi4u/qpjC2W2Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EZlrqn3b; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GIScJTrJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EZlrqn3b";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GIScJTrJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtdRzVR0GqocmezHAih5/qMYcLlASDScftoV7S0BSYc=;
	b=EZlrqn3bxa8klHPH8Qy/eff98bNxV/XM1UALbBQQjcTTUqaxQcGROyqDy94wzYdWKGUbx5
	3Ey5KQVY8j1L9Bk2IIeLUf3xwOA+quoH6/4phDBUaAegZGNMKkXqSHN7377llh9gr+QgYL
	sEf+qtdiB1yDrNbwoFz/uBFzNE6lmOw=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-N7_O9YMkOHS7Z5E8zTp2IA-1; Mon, 28 Sep 2026 19:19:41 -0400
X-MC-Unique: N7_O9YMkOHS7Z5E8zTp2IA-1
X-Mimecast-MFC-AGG-ID: N7_O9YMkOHS7Z5E8zTp2IA_1790637580
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67453dc23afso3726743d50.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790637580; x=1791242380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtdRzVR0GqocmezHAih5/qMYcLlASDScftoV7S0BSYc=;
        b=GIScJTrJ8jz+Jj581NlR8fmoLb3/PTqMvVW+cwre4XOMmz0OqdgwcfyLC8UOu+znOU
         cVjXUZXPd5zAc94blgMzSQX2Bd5RP95WM8BXZ+r6FMoq+os416Qj2YKi8o/QRbpGLtlj
         C5XImynsKSs/2PzEGtae+PGxLE1oWpEQzgl7rfRf3FQqVTnEWoqPt0T/YmLyqe2Xj58d
         dMWfumh9Sm2f7GQJXGKkpdzzeUEOj5tPevM0sof+M2kvaEKt+6UTaR5nXrpcMfnyOIxG
         /4Yff4F03d7VDlLwPnrx8RCev1iawX8v5m+xAdgejOjLlEIbkSpVWKkk+Yh+Q9AgWcAL
         gwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637580; x=1791242380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtdRzVR0GqocmezHAih5/qMYcLlASDScftoV7S0BSYc=;
        b=H7cZKMhoPCKlhvHcQq7VUx/tfhFedYRp7e4Din79kIw1XmBWrCBHsl9fuLHGvQ5DAw
         BmivIN6jr+LflrXY3dpDZnwS7Ht91cpZYl46N3Ysx7cBHqUm6HP6W4wrzyw0XSrP8KwZ
         gUlQf3s9622m3GYSMzjapPFwvXn43NENuUAWWzXjTRn92NbdIqV8P+7NyapwStAW8An0
         SuJ0/lPJIeUtFJ/CbRy0315KuqHwilM/0dVkQYp5Z7PlbUCbOwB7uKG+zvS56y0v+jUH
         +2GThFN0e3bkqzRw9TcTkdpp+NRgymIgEX/wCx3oIq8vGEWu7fvW53MSTUvWgUPt7+Ru
         aTlA==
X-Gm-Message-State: AFq9FYI2B5znAoM1JLtgQsfnTebaq9NwelbbHdKKB4zfSWVWrWbvruG7
	Do7Z/zvlu6F5u5ns4vluEUvfNkmv8CTeZt0aZ7Z45YY0cPhVwI7v9YrTIeAWmUlagKaicXF8c1Z
	fw2LSWVtGpWYHsG50xHmLE/RpTSJLKHDCJlxAbOVK10rJVvZ7fHi1ppcVXm5g/ik=
X-Gm-Gg: AYBFou282rk1UbTpsDyv4dg4xDWbTrIDgdujAwSRbLn6KJLfBHu0cdcT1H8uavRlFy8
	tpwwD0Mrmpm/JD98xSbn+fpkJFcrajeFDtl82EfGUK7AMylg+QUCVtuvlX4H0JzVVS18+/Z+ttJ
	Bikn4E38O+EAfV31wFGhwDHXU7VOOSseWaG/1yd7I96Ws7aMd93zbQe5Rg/XE19BuROUJOWQLIb
	kP0bd9ixJTDFT/bOnAuIiQP0DTXjvJScZ8HJ+r1gK5I5fvpGcmuFYlhyYdj4wpxXeIeA+Xxxfbh
	wT+zQFmAtSK28yw+knAE1MFqiW0HTT0EJvaKk4mYzrQTsiYo4g79gQ==
X-Received: by 2002:a05:690e:14c3:b0:675:548e:22b5 with SMTP id 956f58d0204a3-675548e27ebmr1292552d50.129.1790637580548;
        Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
X-Received: by 2002:a05:690e:14c3:b0:675:548e:22b5 with SMTP id 956f58d0204a3-675548e27ebmr1292538d50.129.1790637580114;
        Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:39 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
Date: Mon, 28 Sep 2026 19:18:07 -0400
Message-ID: <20260928231807.1757995-5-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

K3 CoM260 IFX has an M.2 E-key slot for wireless. Add rfkill nodes for
the GPIOs that control the slot's W_DISABLE1# and W_DISABLE2# pins for
WLAN and Bluetooth.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 01e286cb05797..cd878340e5add 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -47,6 +47,20 @@ reg_aux_vcc3v3: regulator-aux-vcc3v3 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio K3_GPIO(73) GPIO_ACTIVE_LOW>;
+	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio K3_GPIO(57) GPIO_ACTIVE_LOW>;
+	};
 };
 
 &combophy {
-- 
2.55.0

