Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294412;
	b=OINhwGd4FfxQgoHtSbMEs2MqbJwrD1NYnm53rr8TmL/fcjb/of3IDtC40HkIX5VPKiD9
	 X7yNjiMEKrOUVbGQnyrC/BRnacH4aUKmYp5olEwld947PaRyd9XV4d5XMtu0TOBIxOApb
	 AhiglLW6vnLUlpnovaHLd30RvsjeXhx/V9aNeiJlXUxvOP4nbjKuBTzhSKWiA2xjxyMdV
	 3gEJG0sa1AcqHZk1I9NNJcJFnCvksNOl6rc/UOsRL84xUQsTlG9T+Ec66NYYsm6/I0/YJ
	 kcSK+5GiH69ukS+u4t45FstYX6N/7wgmGcj3N/83sSM35zfFTDfv2qewJUG9ohTFQ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
	b=FYFyE0eGe8RC+q+54UWjv/5zKp1DGWJeTNasqoIycVAQNEAZ0OrsFLIVet+D+yZNjFgQ
	 na4qaidoaoYVDwExFCPPhByvFWrWZ990Qij2XHhT+TPXQoQMRlLbh2y0J6Qom8zaUedyj
	 6GjWlrVOT+NPNyheVPLi4/kcmuykjmN4YDp7HAoKKhKxCVRG2/IISHZgneORjR8VpsSUd
	 0D6+7Ktk/HWeLHs/+ZkjZ8VrTuIiNl0K7defQ+i1yarpQIDw3+18vnXg0JzDsEKmThfOJ
	 pGdqnyg2U/qbCbk09smrLoED9j7UCD75qhsxPz1SqQ/RlAr3QBljSHBI74p2bRYusPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKJ7rUAW;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD5E60A2608
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD5E60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKJ7rUAW
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1050594a91.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 23:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294411; x=1794899211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=BKJ7rUAWks0DI97ftAUkRPKWbNCmemr7ZVhL0nOul9OsmRcVKnn56LRoOaVKRcwpxB
         iOeR3mPcbcm6BejaQPVX3ju2yY2zeXr0dyHKECKckIXB/NdDfCwlAEyOGTEYKOeMR/eh
         U72mfcNDxazqysd+U40sIQEngN+csLpeNFH7LLXnci8Jz0CMxn3bmoD6voVIXYY66UdX
         K6ZT/PugF+gWdrhOx36wjD89zBwqCMMAgOKXDP9oqETsquxRncoQZUurbC8qUisYvZuR
         UyF332X6SUWCmVzaPsQBQZCHmIrrm8RYko+CLEoyTxpeoJJ74dg98kl+W/57na95270n
         ea/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294411; x=1794899211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=aFSxKcQkdh+inJRjh3DsJG9yojZHi7FG5KoHHwkpmqx40ICdoexRNb1bMnuHg+zGj0
         yJVxW4MlmuAvdBQee4YfuU9qYFoNfPYZ/DyshKqnRc2x9tzOA+GDj6ztTmf87ZjdCVHq
         IDU79y/dKeRrHcafABJQ3boAKt6Y8HoNVEreIcewzDQw9A41j0veAFx7nXcwQo1dWs7Q
         TFDGOyr6xA/xus7MpB/q7bmLt2F3In0fGtiwO7UxZ6XD/6IQZZwqwNzj5rULb448WN5o
         HBhkCZJOtCdAsaRISAOdqr1qMgrCxEvc7xz3EEBAPwaWLkM5dOtj8TM2/oz3S3JjkiCY
         FptA==
X-Gm-Message-State: APuU4Z8cMc4BouFzQUdpJB/HaI4mFjRmSHi2f7ODWIjrFMlMjTfU62Er
	darPV7ulvYbltx1/uFv3hv0f1rmz3lurw31Y3l7+8b7jJkW8343IP0a7
X-Gm-Gg: AYBFou2oBHuwJX2pCPHH5K1GtHqBTotv5rtl/nycWPpSsd8FQoKeTFGtj5xWTDRGZtn
	w1Q07+GZYUm8/8fnQA/8rIK77kUbGqXv0Vj3jnfr8lmPKSG++f9Fv1bR9D1X9TYZCB+atYY2Jc8
	UgQUn3da8v4Bmo8as5ro5nQc5ropERF8Jhix6/dFJEVVyivmnDF/1IstrjCV9bnoV1YcyQdzIjP
	sOGwgUukwibjU7q+aKxUGoNLugIXab1KbaX4hiseidWonsub+ZApmqVwIxNQ/GzCLLOoQ9v9g9C
	OuJRmrF7JVwmDaWaNrp6sNTRiCloNU1s6NhtiXXtFnCHKGBH6Jc91mcI4/BSE1YhAvBK+uBwF0O
	BEt+P+s2H8MjhGUXHasJgO9Ujr3Ib157ITtIH9iOdeEG98AF6rIT7Ux7TmesRxKtBnKHrc6wVh4
	vu+Iz6OR+UCAIMQkbE7AfI1LPT4fot11+6jEAL4mTQL5hvGaqWOG0ZtqBzftZlF2miLvYdPz//z
	axOZHMGkVpK+xCiRv1JJQPybxDStRul2MDf2/s5qOk99svIMhSFfx8RjmTX0RVn+/OD2HNWhowZ
	Zzy5+/woHT4ajPC7SAT9fz9q6yv8aoRQFlsCLEK6t/RJ40tP
X-Received: by 2002:a17:90b:3b44:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b166d12825mr1909705a91.40.1794294411341;
        Mon, 09 Nov 2026 23:06:51 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167918e94sm2647121a91.11.2026.11.09.23.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:51 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 1/4] usb: dwc2: gadget: honor pullup requests in core_connect
Date: Tue, 10 Nov 2026 15:06:22 +0800
Message-ID: <20261110070627.217946-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
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

The connector ID work initializes the peripheral controller and calls
dwc2_hsotg_core_connect() even when no gadget driver has requested a
connection. After a host-to-device role change, this clears SFTDISCON
and lets the host enumerate an unconfigured gadget.

Check enabled in the connection helper. So the device will keep
disconnect until the controller is ready

Fixes: 510ffaa48eac ("usb: dwc2: Initialize the USB core for peripheral mode")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05fff0..5c8e85493289 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3664,7 +3664,8 @@ void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg)
 void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg)
 {
 	/* remove the soft-disconnect and let's go */
-	if (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD))
+	if (hsotg->enabled &&
+	    (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD)))
 		dwc2_clear_bit(hsotg, DCTL, DCTL_SFTDISCON);
 }
 
-- 
2.56.0

