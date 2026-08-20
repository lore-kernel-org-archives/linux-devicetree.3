Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D423E3DB8
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217718; cv=none; b=mOcnWcIN4i2BZj7hWLZUlCASfHGV63NjOS5ueKrC0VG7TNb8rZBRSe9sLAuDq0SzDN0XLgFUYx0bhn35PJ75i3/d8TkTfUCx7dgylGeXTK4dooWRa9c7WaeRkDqmPM7zdD0vZwOnWck9blUVifFIFYw8650AyJQ+L1TpKYq+Y8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217718; c=relaxed/simple;
	bh=+Ww18HUBZXfkAJ+HvWebaabrRJwF2io99FI38N7cC48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3W/u4jD3Y09gMyFKRr6NvNQqVX6PkCOvs5YloS9V/guj212p6cbcLi1MwrFFU25QRyUevBmjSwb2NhzQS4RzGNi9zGwkrUC0zvkMpjaMRax82SWBjQ5aO1m0A9ZfuLWe+JEVaLZQfpkwG4u/BtTQdskSKgt1b+sT5IcOP13HKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=g684+r87; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="g684+r87"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49558ce01afso15753325e9.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217710; x=1787822510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGbEArrMuWDWY4KnUvGEebmz0jJ1pWwL3sEGMc5WZCk=;
        b=g684+r87S7jbpaGvo1WdMPG8XnKLX4dV0eEzznHy0Kkf7uwkQbdkkTeukhgJ3VTUjY
         OZFJqoYhXlAWIqKcvUZuMhUdSe5ocdxEjYYaQVjxnPidce3dhFp8oZrMPXsl73BZG4Wi
         OQ9W4DqR5Auly/cPffXbvnzRdHal0OpOilS4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217710; x=1787822510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGbEArrMuWDWY4KnUvGEebmz0jJ1pWwL3sEGMc5WZCk=;
        b=NI+h42tdTpY6IWlrqPfvdF1l6CMDf81AaNwLywohqa2C5Cox2nIY7E/josM4z7cVcD
         MaZ4SjqOaAogZ1RqzpK1kdrMLHHGte3fa85jKs5L4w49NKXxTs6TSoju7GmvIPNJewaB
         6TktZgofdWJPGJXf2ibVbyRfFdrY1mpkMCMjVQ60BHR80hcqWlKPi7LHYxp1K2R78At2
         fMVN9lFfePnwwlOTWvsizMomWr8xsQYQIwyXM3FSgor4AFvavc8/+NBerLcdtQn2pLfJ
         liIwkYFKu3BH2ewy64YRgpB+Zu2hxiiKjtlo8VZtDbQrkwCsBvYYtwrfJMfhsg5FilJh
         s1oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpcbty6NRAY+O72IXZy3weh6xwIgrwxlFE6HuYPbuWaBT81jH7251lATE+yVq9+YL3a/jhYZUE887CK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo/09dodWejN2WMzjOP/gZ7Bvb4J0r1M0c/6RK7vfdq9vNTwid
	aGg1JtlkPCWNV98bM4v5rlB3VKanApl9cYZBO6ZdNlo5l01Aq0OuP1YZzZoBuUcqP0M=
X-Gm-Gg: AR+sD13BzwDZKpHdHtbfSTblK2eSZdyghvUkd75AFWFgrihc7niiWgT225rWHw6XsRM
	BPaiuOoOO1gFLIA49DiEIyDNo8a2I6VyBRRN3pq7eWc/jwpwoZ1CtsmTvF6y2HWo2tRUj1eP1TS
	act4wKuOuGCL4ytMUyYh1NaFUm54BNpMHcNZox7mtDTiHBgCn99NxDkSo10yZzRc+Q6VIy2hqeu
	Yo9mizvyR5lsFfunFEGV2To8epcyTxJWK+Znst04x60qvRBrfunBbiQxemrsr9Za1E8dnUD+1Nb
	BRvtWGxq3wqZiUYuUxzumiiQwHta+Ql2plA1OTa+mENvVvRenl1JkurJJe39F2yKUwYkWXVzN/N
	gyLEpy7XI1EL/W58zWtPxjM210wCb9qWeEd6qd4H21GyrgEILIOtHufjdos7Zgy7U0k+A/b2UwZ
	MNlqnZYzwqztB8gF0Mfwgt5+wo2q2op0KdVIkSdpz5fqiv/s2G5rfO/HhZTgvMxuc5QQxg879t2
	7aQj5L1QAEKNKp+0bBX8KlEIRhk5BHFAd1E5dp6XpXiehwGL7rH13jorYfkV5XpEz11unRNsC/e
	aU/Z8yQ/AgSjzHOscen+a/RUxD2iM9uBHCFarlZW/uBI2NrGwt43apbm/9F09g==
X-Received: by 2002:a05:600c:3f12:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-499aa0dd282mr208031135e9.0.1787217709881;
        Thu, 20 Aug 2026 02:21:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd7a9sm165259515e9.2.2026.08.20.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:21:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH 2/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f746
Date: Thu, 20 Aug 2026 11:21:37 +0200
Message-ID: <20260820092143.44829-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
References: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f746-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..82912cf9c4e2 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -721,6 +721,10 @@ usbotg_fs: usb@50000000 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 0>;
 	status = "okay";
---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0

