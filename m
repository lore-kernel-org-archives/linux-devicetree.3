Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934224;
	b=EGIsbAEiSHdnyalgaYR4jx0fxHypn99a0uFQUcoXjK5E8MXhUk1FLZQPQZSG3tZEQuYv
	 xBRNFhg5Bma3pkVV8uU1aUZAva7apL8DXNPh/18QJ6JBr8b6ZydZaHH9g6Jac8OwY1BU2
	 zVbIn2YPg/t+zri7Vxs++oAB/M5LnKlopWjIrClJlSOgUbmVZqNawCndJP+4UWraFkXpj
	 HHbeSP56Lpp3DC7fdFu65mVuxHC1OWERtnkQSdLaeQKF2dmQR6JfOE2ixy0isF4SkeBdd
	 yyzacmyXtFFNRzyoRETOH3qSzAkGsnPRUGQXXAiTkNZ+EuXWXvNHmlXV/CogIdC7UnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vefK5FQVlJXzb3STeUejz070GYyJd6eyM7yi88g9v0c=;
	b=VFWyrETbQhXhoD7jJPBMRaX2r9EdwXWTIK6D4XPStmn6Nx+UMEkNy/3hbJhVo0yJMMgO
	 /XkhRIcip202pzRKukAfVjWU93aBBPMlA+DG7FyAjOct96rqz1hKARj37Ec1FZn3Ug7/T
	 MXu3kEZ068wXj34mQHjCMg+YcEZqOJgbtYwGb+ZGQh0coZARwAGyyUDlPJsps+sLhR5Yn
	 QwWVx0w/QZElLXC/vmUMOEy4/srIlY59lI3OTiLGOUHCEOTuxMHUvstRbEdqsR9Nvd0ga
	 zVFnYdHmb/Kz5pjtcvfGAKa7u6USVw40bAUGDfia9sGQnH6Ax9CNLlSRgiOzPXzt5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O8bDpIHl;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232F606A33C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A232F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O8bDpIHl
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so69852b3a.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 19:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934223; x=1794539023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vefK5FQVlJXzb3STeUejz070GYyJd6eyM7yi88g9v0c=;
        b=O8bDpIHlHu/rUY/EkDpLpJO6ICFjEBrGp/2FqKaAX5TVdpUTuIqa7/mrAJmCBm11um
         H1eDmuvPSI6geaWapmT5IL9VEreuDEYbNkb6IlVeQI2JZMQ+U/+F9MrVzMd6HiGsw+7y
         YJKo0NtGi+kKn30f9KXFwKL126PuM65h69iq9M3nP2oGOrd/+k711SwvmMIz5CabIGO7
         PVRFGmws2/gDNKrd4oQBq5JMkU0tklCdxXA6aTOUTmxcSC3pc+ymfJwAsd2arB95d6ID
         QiG+2WWRdyhSWJaKQVUWPXp8Wqk/61Y7DxuoHuzDltq+CdetcBbkdF9VHi2sTVdPNRYK
         wqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934223; x=1794539023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vefK5FQVlJXzb3STeUejz070GYyJd6eyM7yi88g9v0c=;
        b=pJJ9Td7wDMv7jlO5kbA9qkgs5LcS7fsOSIQ74c4/bhtMxoONrRKlqB88hUsC2hNzlj
         AP1Bgit/G+p/7MBOKSnNCsEH/AYXQcwYVnyqYTgWdu0FGlzSCrLEu3V7FJRKRQm5GZVB
         /u17jWfuiU2N4+l07E73JmnMtRV/T8Ctx+xAsbSOKKs0IzWltARi9E8PC6echW+jEupn
         h3sOdUUY5S97Qngmc1wyif2ShB3jW9fH9AY/IEORdcvn4q+r0Ckg+ezPWuvuhraO08EN
         L6Utc59vhPZW5bS7WAN15G4V6Kp8RnpDbtkSD2TM142485Pn4BZTpBPcT65/TxApiJkj
         uhvQ==
X-Gm-Message-State: APuU4Z9QsuT3wI6V+7u7Z+4RK0P2MMCbvr0aYfPZqkg3HObbUvOuI3EV
	lWktQTMo9GHqc2cn04PNddj+uEtSbVOw69o3vJM3bvhMUWwoH4XN9lds
X-Gm-Gg: AYBFou1FUT6INe6ny2a+nOiO3I8Oun4F/SCyDb5AfVIuWHK1vlCkq1r16foYTIX9DHT
	MG+jh3xcjUyf2HnSGR938enudyDfDFtNAK/SJqjgO3Gtorc9/t/9y1oVezJXhpVcohBsf97WwjP
	hLk0/yNz6PO7xdrBE6gxgpEWDp8eTFvkkxzP5tdCKlQFI5KLgQ+Ebxr4352HwYpXDDCXjBVw0N3
	8KwzzyLO0JOHB7JXZod72ifPhgZH7lJB3VOzNqOnn3wubEGhf5y+dwGUAWNo0h70nP/ji4StTqj
	zcwZjkAWBXldvi75QMQIY6P9883+hTI768O4MT7599W/9DgP0XM+SOTFakNA1rl4NMuctdf4mEY
	i3YeerkK/nwO7aBdd/BcSJQIaqCWGyUatJsOrFI/UCiJJgPWmZ4znmQdos0KneCiq7THtoIohw0
	xidgqsI2xgnhWN8gWpJIB1hraDHPZ/p+CjbDbSl0q6tQNc5k91dHdOSSaMgugIwLPp98HufPwRK
	3uz7qpzuR8qIYioiYMsg5glgzWPhpmEZebAh07phytxmkeyLvDMqU9g6YABepJv2DnwzUBFPe/V
	H342VRT6B91DZ2aJ/Z+AyPJYLnecFruxoKD1xUOgMeFsY0irLqmAWsNsRgffvMtYfdxGSc8zmXh
	+97ZAOSjl9jMGJA==
X-Received: by 2002:a05:6a21:6b05:b0:3e2:799:f2dc with SMTP id adf61e73a8af0-3ebb2a32f99mr1584310637.40.1793934223023;
        Thu, 05 Nov 2026 19:03:43 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm118179a12.15.2026.11.05.19.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:03:42 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 06 Nov 2026 11:08:03 +0800
Subject: [PATCH 2/3] ARM: dts: aspeed: ventura2: Name the COMe presence
 GPIO
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
Message-Id: <20261106-ventura2-dts-update-v1-2-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
In-Reply-To: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=4Jjy6nPmm/6tj8SAdf81ahe94whURxI1stwQZrqpyWA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq7USVNgrr8sXF9pbSJR2rRAI+WNwaex/opd0PN
 eMqQVHYIh+JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCau1ElQAKCRClg0K3CVbE
 gVLVCADDgwQyaqhCkNk4V4yZiqInsNBqp1YSJdRkVsxHS3sXrdepMRzW399viEf0lzpq4iLclfb
 icaA9RyeB+vGZJ1EWW9ZSeLncM8W1RQp23YEIgE1qW95PKHE88GqxSleX8lRXKSd9IDffeu+lAt
 8tznjeEnV0RdpZw+T5s3e3hpJs6wenS+z+l7AqanMVTx5ABSYWgl7v93qDJ01nxd+qfHXauz5TR
 H6QK8SZTncBv+ULDWVrKSqyshWfqGnmrC6+umFUjSecbRL2mpBu3swo2YOg0ECurV9y7ldff4Bb
 zEQN7xfd4xJMUJBFPZk0L0ZWLUfeK4OZkluS3QH9/fmXKHKT
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Line 9 of the PCA9555 at address 0x23 on I2C bus 3 is the presence
detect of the optional COM Express module. Name it PRSNT_COME_N so
userspace can determine whether the module is present.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index 50e652cc37a1..a9c5990ef969 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -625,6 +625,17 @@ gpio@23 {
 		reg = <0x23>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		gpio-line-names =
+			"", "",
+			"", "",
+			"", "",
+			"", "",
+			"", "PRSNT_COME_N",
+			"", "",
+			"", "",
+			"", "";
+
 		interrupt-parent = <&io_expander7>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};

-- 
2.34.1

