Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911944;
	b=BrgAhXq9SgjftcHNfJMX+3M80Coyq/WolMOyqbP5USVA73Nbx890Yu2amD7GBEMxClqE
	 t9E5+DHeavtBoui4QxznB8KgD52Kmr/FCNp64Me1i20mO6f+Vd8ziYY4w4yYAcZKaVZoA
	 H3vkedoGPGxKPl+N7+lzFb2R8X35j9DIOfJjJpP437+ZqgtihSowV6GnCNgkgAaY2Wt8s
	 sJUAANEzhoK28bCDWSpugxFHd4RF5Ydfi0mTM2CplnATgR4/PJcf9zBtpOsjZHYdTTduz
	 J6sE05yhTylM60iTHAyeYcFcnqAajkxD+yIolKdkzM02HfpnNpFO6kJsMuwta05Lcsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
	b=H6g5rwO2qOvU3aGeYrC21biHpozHvH54Pj91qR1u4d2bHFwXXIO2vvC9aBWKc2Rz+A8P
	 VWq8MuDb6aMQL/CEZuBVt6RIeX5NOUtfoD0QODXasssG8yfQdB3d3xr6+IdHJxeCs1e9q
	 RSi0Xws5rXdTNaOS6vhV4ndL2pbUwkTjuowgY5QD0C10yOJcH3jcoGJ//39fzSpmkmcpj
	 0L+bqNf91PxeeIZaLvErjQuK8NqARH3EP/Pb8m6pgOKwqt0wbjMimE6r7mq9okJtqYF+b
	 MNAw0ZGXsVIpnmdAN0Yt5VGrKhryrWpe1wF1y35y+mQggsFkiV5+ZuG8QhqAdYpz1dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x1/1PkbX";
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F36606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F36606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1/1PkbX
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-716d052dc23so4893eaf.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911942; x=1794516742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=x1/1PkbXEl/xKNPfpHRZjkItcLdgBOL+Mw1jDWTDrVr7UMokvg6+rz9Cy+eHHuHq1l
         4Jc7U8Gpxwd7lpPLTvVtM6tEbTYgAFClce8IrSCJBlmajP8uEcPPbmdiEaWFO0rctCSV
         F94/vc0VbpMw3fUoU5AoEZGtt18WMNIjKSMltoaTx/5Gis1Rr3wllgJqQYWGId81Syrh
         1MRY0jqeq2Qz8EUZOB9TYWyPyZNtDbLpHKedSzNUABMkAxhJMHUNi3I6Fa87OXbIXRbm
         A2mwv8EY4Mlx5rwpTzf8A2M2gTMdYdzkAtq5/32Mh/cnIwsiOPUwtyWyWHL39R9T4nzZ
         1ROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911942; x=1794516742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=H+4cdCbDyo+E0uVx0tYZusjUecaKCn9Mg6CHTjtV85R1WpncKiywd3+oqSDSWfi0th
         dmhb9EILxIC1QnJTgn/uzZk5ciT8R7rjwzbZayW6edIMOLZasb9SNlhwJYmT6a0t1f4/
         ubGgT9yu2zlGOg0fI6sw6QJVHRLR/C0ulY8964LyOacWOwsef96vcKHAnq79OBFpZpxp
         f/Zj4RUkEH4XI5MelxEH8yo5pDygwJu6inhcO/cVXSRcbe6hbf8k4APDukiysaCWDgv0
         xF9+4K+gmhWYA5ApoOp1WF/22cV+Sxq4wjxX8u4+LDhzEDNX7N7s031N+rNCNjU6hmB6
         eGJg==
X-Forwarded-Encrypted: i=1; AKwUvBwvFbiHpGN2ArMWH3G8v6wsomwwlTn1vrMTSKzTqCUk9eDjFTHPmeP9g86c3Ew4eywym7VUr1nUZeHd@vger.kernel.org
X-Gm-Message-State: APuU4Z88QTjecD1yBfHNXPEiUhCQxeJgWrR9uFrlDqpd9L/IPNq0mwsi
	5M5RWDTr46sI3A3ZHJAX3XQZIbYXSlZsZDr6/dxvyMsDebkaxYIM2lkq
X-Gm-Gg: AYBFou15f1ArgGSpNSRNToUXVuXx70wWPANjVRqt8JuyNiRDCrrUzb1mv+teOpkMZCC
	B6YL2J72OtEEwYxfCxKWmM5GN/n5l3aXB5AB63TAVcaEtVi+1CqYtJ2pNnYWRKWD/X/VOPxV9m+
	+1kJx3myruDeuGcm9BJ+8yQ4JyNFxs0FYv2FQkZRjbqTn/bgBk/8NWJb+Hbjtig9edW5siXlFX2
	bEQ6uOQB+BE+t686FxZENLkf+5DxocC13outvtLRikXADAY4YUbN5ZAdzS335zIuzvVrh8YPQzF
	D9sopkQVL5+gTNHVOTPbFtQmG0sOY8/LJylzN+qW8EOiUg3mZe2Is5cC0NCKX9HWYk8UR3Noc3D
	GQLo08Dxg4sv5Q8ZBF46mXpZsRWgzdwtuQiPnKXUcUinychEpsQQZ11BSYm8dQOkdNTR2Ir6PaS
	D902xn2a4QEJH7lA1mtGttdtVn0i7dQnTc/WTFg6GOHLQjWhspM3scsBhvIsuOHQoiXk2Wzd/Wl
	iqNPCiv/ZuoAo2/tHgIvEWybIuXNcW9S2Ok+MonjFNH20/Lw0scFnH79ptx0ku+yxizRI15vqa2
	xZoJoWl8hGkSNmd6/lO5Bknw1tHnQn+K4FgFKJZGIgjEI3sjWXKDUZnxIbUQ0oP96ZSimaX0Pst
	bG+EFlKo4qX1Vpx81bMyMdyi2F07S4M0AxIuWM3t0kLvAjlc9FbvZBM68FfY8M5M2Rh8TSiX4Yi
	4C/2Aj8XYopV8fXOA8IHS9Sv/E2wS92tnGhlMp9IiSRhLiDTV58+k=
X-Received: by 2002:a05:6820:1354:b0:6f9:59ee:cf9a with SMTP id 006d021491bc7-716e73d88b9mr513073eaf.7.1793911942466;
        Thu, 05 Nov 2026 12:52:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:06 -0700
Subject: [PATCH v8 05/11] serial: 8250: expose RX trigger controls for
 custom callbacks
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-5-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The rx_trig_bytes attribute dispatches to a port's get_rxtrig and
set_rxtrig callbacks when present, but the attribute group is registered
only when the port type has a static receive-trigger table.

Allow a port that supplies both callbacks to expose the attribute without
a static table. This lets integrations such as Octeon provide their
FIFO-relative thresholds through callbacks while retaining their existing
port type. Require both callbacks because the attribute is read/write;
ports with a static table continue to use the existing fallback handlers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_port.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 73bc9e7ab703..d87e2b852c3c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3152,7 +3152,8 @@ static void register_dev_spec_attr_grp(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 
-	if (conf_type->rxtrig_bytes[0])
+	if (conf_type->rxtrig_bytes[0] ||
+	    (up->port.get_rxtrig && up->port.set_rxtrig))
 		up->port.attr_group = &serial8250_dev_attr_group;
 }
 

-- 
2.53.0

