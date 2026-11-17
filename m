Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794945345;
	b=uJ4+ZVEUJ510pkGbTQU+UNUOIZsOLWzsBAs+vM01on+WjPZHfgqJkw6Oc1YdLmD/E3mG
	 t7NF38kguKjIN0RPz0ZZSVTTAHHSowHTXKRuByWCyWAFiCS+3rmPnF9rYpTx4RGuqp6Vi
	 aGmTH+u+zvJvTWIH0fv3cbfRJq9sdAVMBWjvgrw+GGCy5duCot5/S9Abrkj2X13OTfHZB
	 woq3wdUaexx4fqC7zoybXn9i02Z0HakVDMfNcyafMzXlDbYIJIeHqY1OgrvJ5sMCWzwdQ
	 QS0P1QUlleMH7l5hIJTzsJh3rgKAgzyAm1oVt4vDskX3UekOIVpGsy/KfPvcPKL8rlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945345;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=TtfwGs4HzqHYgcl2qewXKIhlDoSGnJyBfpBsY7q/jLo=;
	b=4zCWG1liGovCskeYORBox4pQ/fYjkVahW4IRWjRuXa8d4Qf2FsfnlwnNojN5QoFntNzI
	 I9OuOEKTCt5Vlx6p4O8bItN6KuJA9szSN5s6+p3n6EGKVxAd3RNlzoFmr433y3ElAYdC3
	 413HlyAr8yWPKgqMSKxV6kdG/jXjxyVrJ5MPB7Yxv/NDT6FnS0Fr/x5AqYvceAASdFEru
	 XrZmvrrJF1xZby/bDpCQyL8yz32skXr0nana5KRcEBX5jCvHEU54i2VH1/ziMtmtiNMdQ
	 rk2cVzbIcyhIJZLSejzZgud/Uep2+ycOUJajZIsana/72G2nMdwai02LhZkRgVsW3ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AGIka+d8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE74606A32A;
	Tue, 17 Nov 2026 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AGIka+d8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945345;
	b=3NdndxZxKlHiiDiP04zM6wAZj7uhVy9nevCcnWHyMnkxbbIFBotKb2NouuVEtSiLbM2z
	 cyHhh4iPiWGCsKqAqqG1LUd3KXKuSGJ5aWQl/tOuBD5kCkf5ZF0Kzu49pFLHJ5KJeCDpE
	 tBuA2ol8U6gPRKt+xqpIoEV0ynxYvVk8/e1UTDWXC/EsQdsQS1mAkn++JM60fKg2283nQ
	 wiALCr4poeIENDQr4a+hW8m49t9PI4GImH6mPpGKDQPAbGwtswhyziKEj1KTZnV629ylX
	 xozME9Q1MNEK4WUvDx2AnxZahsiNO6OLBuPRl38TYR3Rr3u7P4ILgHWMKJvBsTcTC/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945345;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=TtfwGs4HzqHYgcl2qewXKIhlDoSGnJyBfpBsY7q/jLo=;
	b=qgBKXcTawfIu6V1bNtkzai+UciHmxltAribP2p1WBSp+V4v/OEbN6brurTKPcf2bcTz5
	 pQBXj1GO01Eu/VBRI+FX9EyECg6ig3t6afO4tho7G51mxk8+XoQbifDGlas1VLrqna4Cu
	 1lnINyl452/9x2/HSXKsndHkS6rB/i/Zq7m3g4X3ehjdQLhL8lM0zprH2EFAldUGNJ4no
	 T3bpwtgLmhktbokK+m98/2jvedB7Rfp+UAK5ahpkONIVAftgOXNcyId89K0X8uSLtsVwF
	 FMVjpxZQe0DxBltzf8yu0ljMOX3ZVg+dAmMQcyvMs3+vyWo500aGBArOJkqf5FEXivQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ECDF1F000C5;
	Tue, 17 Nov 2026 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945345;
	bh=TtfwGs4HzqHYgcl2qewXKIhlDoSGnJyBfpBsY7q/jLo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=AGIka+d8JiCelL64357MGsaeQGpFDNY3unuM+gZsZJVtdRPcC6gcH+T4+SeKLCiAk
	 gZF5vaC+sxruLt3QPAOJrXZrIv5iZLuz/7k+qXufMPiAQqxsTpeLBFaXT401dSlzgb
	 J32PRW9qLY658p9yGjAdC3/3VjHlb5jHrB4yg1go4Unv13CqdGfLn0sXTwrMhTLQvz
	 aaZVNYsTAMrLfLGw/vqUh0xfQ8LGSTwiI2sh6BbReGmaDCQrJOWOrelLKayKtvhFHv
	 cdjDksqQAWL1dcpQJKxl9CanpgH5X8aVm/8p+IMrPs2l4uDd2CRkkkGK/ZCXcJXM0X
	 8yZC/YUhL14SQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DE2DD4AA6A;
	Tue, 17 Nov 2026 19:55:43 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH 0/2] riscv: eswin: Add Milk-V Megrez board support
Date: Wed, 18 Nov 2026 03:55:30 +0800
Message-Id: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
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
X-B4-Tracking: v=1; b=H4sIADKx/GoC/x3MQQqAIBBA0avIrBMcQY2uEi1CR5tFFgoRhXdPW
 r7F/y9UKkwVJvFCoYsrH7kDBwF+W3MiyaEbtNIWEUdJ7J1TSu6UCj0SrTLOR29NiNCjs1Dk+x/
 OS2sfrrnwOWAAAAA=
X-Change-ID: 20261118-eic7700-megrez-16057cfc65df
To: Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945342; l=739;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=s70wK3Auzgo6TLA/RXGdm+I3YntJAM80eQtRuGWOSC0=;
 b=oZFjfqk5hUK3/iCI+Qr7pcvtX1sRDc8ZbKiPQR1MMGhKZHiCb4UJArfcFl28fe1Lx4Tv4Wz+S
 Q+YOnpJDuv8Au4nHUIInINehCJNei+kZoZ/tbppfDh9EvJv86Vcw+JY
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

The Milk-V Megrez is a Mini-ITX board based on the ESWIN EIC7700X SoC.

This series documents the board compatible and adds a minimal device
tree that enables UART0 on the USB-C debug port as the serial console.

---
Han Gao (2):
      dt-bindings: riscv: eswin: Add Milk-V Megrez
      riscv: dts: eswin: Add Milk-V Megrez board

 Documentation/devicetree/bindings/riscv/eswin.yaml |  1 +
 arch/riscv/boot/dts/eswin/Makefile                 |  1 +
 arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts | 25 ++++++++++++++++++++++
 3 files changed, 27 insertions(+)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-eic7700-megrez-16057cfc65df

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


