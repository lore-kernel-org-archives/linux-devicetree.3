Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138468;
	b=g050UEAW7dck5VjmqaUi/LZ+ocNTKYdtYhedYfNd1eAjydqOL5f9GAe4io/EB2ZIaXQ0
	 FnuWOW2edBXp0Qy9qbatUtFV8rXIgGysM1I9NQclxM+2JMduKHR2tiNI/URr9K/M0uaAu
	 nCINOhR+DO2EFnoFaq06PLg6v/Wpya4RdH+p+awph1hBnKy2JVlIj5FLDw+pKOG5lgOfE
	 h2Af0RTsharUz12dYvU0aqIbhkZpl758hg6eXmqn9GMhhQ+aYk/V5g6A02fPqSDGWWjFv
	 HTz/V43A7UweCGp5xnAHHdhksWsoYwEWIQXexDeuQIOUeXYjgA5NIcKT9QVRePwXGrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
	b=JvZ0gb5FrzRvgvpayfCg/Ylv9kqvSlWtv8s3CKIU0fO7+uDJRnSaKG60s+tV5iy3UXHF
	 /qhpkb92UEXIZgCUkCO/aU4rE63lOa7PIbTVR5W1dcobkX07qQ0534lM7Y9Pf3kdhCbIy
	 vdH6efnOl7WacOsBLkPL8mB1B4DLvx63l+RhFKvEEojQ2MWRYGh4m3Y8c+Xg1GFKPanO9
	 hW0bx1ZdTArc8yPw+IXax1z6cnewi4rY9dOD3zl3xripxcV1XrdR0K4Gs1q1WRDzEI4T2
	 R1XfKGTwy9yD5aPZaIqD8v0Xx3IYPKakQH4FRo5zElITsxZkXPIEm+m/Zy1RmGtO2MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=efT2ubql;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41823606A332
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 11:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41823606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=efT2ubql
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c49c32650adso6759266b.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 03:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138464; x=1794743264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
        b=efT2ubqlja0XxO/Em3E+kXD0/D0HEcJucdlAdSpR7OX8FUXvVR5wE7ncHvg+5rUZ+S
         JhtWb6OAHvzz2GDO8f0f2Idz6qFPo5BV98785hXrFsPZGzzV+R+VrDlmtClDJHIsGW4e
         4nORQjeKFQPUMCrN7Hz5pCnhwp1G4BbY5KqhPnnZx8YoUXfmp6o2Vxbzan134QaaFWkA
         R+yXwEqWlv/sdPBOQud39jaVJ447Nw4F3ZN9vGffDt8lZqSZKcSrU5jgoFECHpY1t7Vx
         RlRIb/VrwN2zybiNGohTXcsxMbKFIfk+4W9nVGtUy5e4haTMbU6jwAOw6NQjKBGb2vfi
         TiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138464; x=1794743264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
        b=O/Xs/QZDHWDvkSwBr8+8+EWStLG8JmfLPOW9kE7ZqpGDjpjdCIBhz/QoqdsY+l5RT+
         MvTA368mD+RpZguaf3q0Tv0kKTYxznrZ3qOt/zbuz1vOQ6LQ3x808ICCvq8j96LAAG/+
         7DO7uzJifVh0jQWHIRp1F4VSD6R5zaw10oqKZK5+zYxMNXn7gYChRTEPwo6uqVOZ9JSy
         UvDu7iQpkuzi9ur+FbZP2oGAgwar5ysVWRKVnD7BYkF3UgwA8hRZeBW+wABNPfk4Cc0b
         yqz1aIBL3NH9AD6huUKTQlhdyAJcBY8Rj4Wsa/ugTjeqAAz6RquL/lrcFC5+5vwovqXn
         vp0w==
X-Forwarded-Encrypted: i=1; AL+hErFxagQMBV2KwjNMtWtEEuPi6qHld7AO8ubSVQAq/RqmbnphuexImkLBa/tpCK2PFcGydrWppCQnAJRR@vger.kernel.org
X-Gm-Message-State: APuU4Z8SYzx7OImZEm5VG1aL0h9nBcZQdPXXDVbR1CypZtrKIFdtR2Q0
	kU8Qty8pHwiv0/nppaeUGb0pPV8iYv++3ERX/sTTtxNKc7SXa/81xxRAUKd54Rnnpw==
X-Gm-Gg: AYBFou0gAjaGOpeVbLVl66vYwS2CwfrbJJQLKBR+MCG02uWlDKQ8bSWdZHgefPPyrS8
	VPYa6B++hNx/OErFR6QBByHiAqvecszt/PHgec3lWb12uUpOceow1IjiZfW7V7Rt5nmP/jVSjyx
	R0tp0tmvoJqMqZgg76IjCelBhCidJuwnidUCWGJ69ACYb7o7TNyROZP8cx4iyyMVXs+JnQVCBm5
	S6Ew55WcQge/B25hLzI5279SbpTB4DH/NwfApO23Ds0rGU32X3itCWZK2YIQliLRWD9aqhFew82
	Z7xprU+KEf4lguK4Lxh675rmxMvVgOR7mGUc3h1CIPcC/0bS9p8nmu2WxSPttrSqn9V/+FbKWPk
	IWW7ySTHZn9KVU1kPjSlSPza9SDjE/tJ4ckCYW/61qkUYJipsVoKcM1fRkSDLf6NcMx6hq5IBML
	3/FNx2ARBiroxzCye8KRyaRbJZs0z5CS0xDmzrQMPWECbmf8l+RKpFlqJuEMm60WlZZefckRQuH
	FWiCc1urdC9KFi4mwEik8XNFowRf7pxTb9py+hHIwXmwm2gc1CGrZrvOALZALPJCeoTm8DToDP7
	e/77w4k4BwE2E0oIfDGb1renzuYqO6kVCOvIAqKfuV9ndsedqv8f0uRDoRE9GeZ3I3/+AC5WiWi
	V5Yre/Z2xxkrp6nmJ5kfbEISg+BuXN+pvcrKlBYUmnZJGOY3GYE6JjrgDzLz0L3nGRwo+M5MAUL
	ev9hDI3lb3cg4t9mVEa2YqKSTSY5fpRkF8Ypqu3iAm5yGUAH/ypUxGlYdAf1UxthIERVAt6UZ8J
	E7sxMnGAYQI4E8Ikmh6j0HQsFJ2BXbsTxqmbsw2IUCQH5/5IAjKosGACOpQZ8ZKbE2mx2aQbLE3
	w/VWUhZT2yOUssfpDw==
X-Received: by 2002:a17:907:ea8a:b0:c45:d8aa:6ae5 with SMTP id a640c23a62f3a-c4d6d7ecd22mr95115566b.42.1794138463689;
        Sun, 08 Nov 2026 03:47:43 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4751desm55022466b.43.2026.11.08.03.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:43 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robimarko@gmail.com
Cc: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	konrad.dybcio@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Sun,  8 Nov 2026 12:47:44 +0100
Message-ID: <20261108114744.125675-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com> <20261026120920.1667982-4-robimarko@gmail.com>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Mon, Oct 26, 2026 at 13:08:15 +0100, Robert Marko wrote:
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.
