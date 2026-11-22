Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339906;
	b=jz+4cbbWUXz/Yr9xZ0FwxDR3i8vuKXXYd7xVQcHGBcGtOcMqdVGlCUQhveAiJTafTDDv
	 42hVHsJvyszCBG7zuqGIgv1mQVgifhrPtpUFM30bQ3wlcC2hyY9zMe5BQe6+jszjqQtFy
	 aHCRiv/D2hO3JzVMKedRqdHgrC1bv56ZJPszashtcReO0qerkP9RJ2boPcrb4KlxSCCnz
	 C2BdZ5Y5mLWMc/+VZS0zVsnmQ99p7JPSDj6vEDvsK++8kLqtqXHqrurMfweSr+3APjr/o
	 bRPDRHp++vxbnWEB68Xh9tGoMB52Yv59zTW/0jANjHYB62VAI5j2KU62smqz7qhXNKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=R5GY9TTuofYTaa/ZejIza37Mpjz95YygMJZxjVzg2k8=;
	b=WNzBnrZB99PghCLAyV0na/NLVvpP9wCLX1+kMta76BrG7+7CCERQUBzwiYSgnrRiRENY
	 Bz702VpaJFkq0O2b4ADt8GFCGz9ix+oyQKyDuFaV0Sg8eOX4SG9KbYzpiLKMIZ+hCJ2Hl
	 U4dkDChkU9guZYwqFhKwrU+MMFAiDM7w/RifTWeAMmLGykr85khmUpPUEsBkMYdEEFwNJ
	 sLCaKT3lfFONj61ma8p/SfpaXKyh42mCGiI4HNOP95mg7bBYTw+kxH9DVV5hHj7nKPBT5
	 bCV+0Glu9zNHxDgXOgcCDqefX+fYmuOOjowFvfXWMX6Fko5xFezEWEbYK0Zv162zTwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkqpt50t;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B490C606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B490C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkqpt50t
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b413f6dda6so267227a91.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339905; x=1795944705; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5GY9TTuofYTaa/ZejIza37Mpjz95YygMJZxjVzg2k8=;
        b=qkqpt50t0NjfJe5lLV1jyXQ6XtjZBa5eV9qYMkjLE6ts7F2JKg9eIElrgOosmXUhd/
         ngDz7NoWTZAOtPYbr45LkRO3oWyDLtP/qWTK6PgaoxXwJuqSY4GY/O+GM5YYsYGq+Nzb
         46zQJ/+DdVf9gJGabH/ZJ9npegdlShBSKRrU0ZwpUVfrSV6Aj0kWijXJ7ztvPgcYeeRK
         bhrofAXgGyQ6YiRBRHQoIf4og4GFvMuWR/Qp9obZL64esaPDhzQUKyj1Z27gYTI5bZ4M
         7dNiV+eB1cH5w5ayLnW7QjuYGZAc94qgA09dHFfuynNq3AoWY5uOaCZKrgfnZDKj/Iq8
         R51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339905; x=1795944705;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5GY9TTuofYTaa/ZejIza37Mpjz95YygMJZxjVzg2k8=;
        b=VWXloHDulCV5Rxb9/tl4sPn0DwTCwYyEi1wc2NctHmRPOSmrIRseZ1+1sPp+yCor7I
         QzBmv6iCk93/HIRevElhQ5CsbBnlgeos6SENIs6mEnIAnafnv7h05qu6R3Z81CH87TNO
         oJg4efQPNZ7AHPXm0dTcr/TxlyLFtn+bK3tkU2F/2GrkzfIGIfV1s8mTwLjR4FWSfQYP
         V4hJRAsNE61yvaHKeeF56aLRgoFQTlOFKh8iEohrdDufvo2T138uX8OGw6WZQbUJN5GO
         YClp3XOmXbUPczSviee7T07bqnRRGyd4KuoaXsyOGtVOtV467GdXPm9uHaREI6JfAZTx
         Lswg==
X-Forwarded-Encrypted: i=1; AL+hErHj2t7du1WLYgSnXrVKnqqSUjPk/1WjDnNrysGlkfsBg6s7YbccWMvJPgPsSzzcZkwJKEKEeO3PGe9q@vger.kernel.org
X-Gm-Message-State: APuU4Z+WgLpYjKRtMEGLlun3+XSZBGHUbD9ZaKmahfocRfIRChiPlBNO
	Ds73lPnBnfLqaDewZhSnpWWtnzDxmbupl+kcCoXbIDg+0p6I+qv1HCmt
X-Gm-Gg: AZFdTZdZuMh0TmFnqG5669U7GSm8afEj35JkMZ5NZytDS/7Gzqs183vPNLYl8zj+hu8
	YCbhxVPHkayQovb4LrGR19nvTMxzrv9GSB5hEepE3UBHDP8kTT5x3F5qLgREz0z2QQbpAussBFG
	gm8pKB/D07dONo3t7IqI0Kmkoc222cqc8JDHuztQUZdBO+4r4nojTjM5Yh6qC7jAQHUIhgiHEz6
	NKG2fpH1p2LKrd5gX4mdtJb/NMcqE7hpnkG3McLi2md2aHeJsMUuJ1JDa4W6h7ZaydbzIRywc0h
	dSCXBVlSiXM53myg/MVed6T/YIC6ZOLs0dn2MkL2LzpfvPgwEWxB87V9xKwWcysdMWq/4Ir+dTc
	dGD0sb930BRWbNZQDmRb225OTGS1cSnD+sv5Y/r97/iYoIn8WRJou0OXK3E208XnuGqHSE3ko4q
	6VK71FAUW2cIurIrnkg9dIWWXZetnSavgOlLwLK8MO0m84TRio90NAf/w6NjMsP3qkSU0gfAP3s
	TI/3c4kcNr5Vg3cLKwfjmRKSxIOQa/s5PRXI2lzRDi3Os3Pz1VXD8R7n4TIGJxL7yUhHX44hxFm
	o5QqLVdfkufb5CWB4oYKZgPQMiez3027+Bt+c1fGDBo0+HWAls3YxLpOSe7dXQtkQ8DDF3JkDPo
	robqi9pGDNW2EhqYeuen6VWmL8ms=
X-Received: by 2002:a17:90a:e705:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3b41c7e4cf5mr11892464a91.2.1795339905049;
        Sun, 22 Nov 2026 01:31:45 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14795295a91.17.2026.11.22.01.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:31:44 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Andy Yan <andyshrk@163.com>,
 Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Alexey Charkov <alchark@flipper.net>,
 Igor Paunovic <royalnet026@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
In-Reply-To:
 <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
References:
 <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Sun, 22 Nov 2026 09:31:43 -0000
Message-ID: <179533990370.107225.5765165679182115805@gmail.com>

On Sat, Nov 14, 2026 at 06:00:39AM +0100, Sebastian Reichel wrote:
> @@ -1491,6 +1493,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
>  	status = wait_for_completion_timeout(&dp->complete, timeout);
>  	if (!status) {
>  		dev_err(dp->dev, "timeout waiting for AUX reply\n");

This still drops a reply the sink did send when the IRQ thread runs
more than 10 ms late. On RK3588 (7.3, KASAN on, v11 of this series:
same 06/23), with a SCHED_FIFO hog at the IRQ thread's priority on its
CPU (busy 40 ms of every 200 ms), 1410 DPCD reads gave 183 timeouts.
Checking for the reply once more before giving up gave 0 timeouts,
with 127 late replies taken:

--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1493,2 +1493,6 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	status = wait_for_completion_timeout(&dp->complete, timeout);
+	if (!status) {
+		synchronize_irq(dp->irq);
+		status = try_wait_for_completion(&dp->complete);
+	}
 	if (!status) {

Feel free to fold it in.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Claude (Anthropic) wrote this change; I reviewed and tested it.
