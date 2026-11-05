Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901388;
	b=R92jTyosxleCWoWaUDsw3DiI5BpWBWkGjaNxjmUX0RCtYtExiZMesdAoZUVkjsi0fGz/
	 FnxnpRI4rEh4/PVpqD22qQFmg+A+3qLjsT23YbdGivqxdywMAHTEyzgaAmljW8FVwFgnm
	 +qqc3VxgJCM7AcI8SaPnDOHurz8P3dguMVjRnFwtJAh0RnC1UwPqJ7rZG8hhpU2ptnUDC
	 +WzoV5UbFDW9+njTMw4gjUHkyfez40b5A9tQZfPpXLhqKYqpxf7rSmf8KSFxMfDCOmTrU
	 bFAcHMm1xn2HoGrJYN6UwP7UTFvCV8fGgTV+Wh6t1/S2gsfZDuYehgwezD79AGZcLng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
	b=Yk0EF/SJW6PjEFzmsF2lIKCa0Y3/ybJQ9Pw4ywWqdYeu3RC1/r40YibeYzul8XSUqzda
	 CLYvWYh/qj2vd51F1kZXXXdPF61wRkDwiVAYXiz00n6A7oolHDMQi9L9Xg8B3P+Pi/bMS
	 nmbkBcRKjkWyj2M4MhwPX+NxMK2KxBDLaDMFjtiZrgnR7X52oY6qTUOBiEdNYAgVurcRf
	 eVXTOSWWpGPu+tceyzfdN/iPIKerhQvHWoOJ1OdZYJXXOuf2IZLu/inND3HQ8amAbobgx
	 BsCD8NxTRlrfzp6b9MVchjYT73ho7xcYVvzNMROLaC7Vr8Ic9O++CsDLB4J0Bpbb+QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJmY0Cwu;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD9606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 17:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CADD9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJmY0Cwu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so14439845e9.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 09:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901386; x=1794506186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
        b=cJmY0Cwu6TtDV5WiAgmzfVBCQQqvnYouHSNh33AexNqrfhXucHbCLb2aHz0C2naaKk
         LbEQYg5ofq5mnI0ljzuQdwNpRV+N4pzjJZJCAJGJ2fm091j/m0HFPhMOnnGowywWBVqD
         3TJNNjZGtudxjg6KP3q0qXNlbrJbiu3dN6QV1bwAnWNhoPYOrkqky8xQgCFPaW8Jl/51
         v9Q26N6upYf1KVIAi/2sNeNDQQA37q51GaHUWwfa8qpddNDzvosiKZZYtRKvFTQiYLeV
         hKXG2cWxXy7eNwIssKCuojY6ezcgcbqe5GKzn2Nnh7vJE5PHduxqZny0AjsJfRmpuWPS
         SYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901386; x=1794506186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
        b=S5QVcXsGF35lNyGzHQMRbFzVCDDeUrfsw1YFx3Zg9ZdLNislITBCO48YxQOzkRV7sG
         JaZOUjA7prlJjNo6zZImgvdtM+qj0BQNsTeQdte/b/LuYMXdezFa6881Kksdp57CdIx9
         xzgYOcUNRTIuJ4sf0hluPUzWbNDfY+bsr4kFTNcrmg2JKRj5XL4lEoEWiEK4a5toinU0
         umBhER1ZFSFINRM08sO24CZ1z3N0Hc5MeCjNXEBsmjTIOJTA8ePPxMtnYruTpq+2nWqm
         iNNtSgSdlw1ozOhPDCuwvpnCAfkvYYzuHU6cG4LCOuQcqX+0mBqstyGe2sIKm4oKKqGz
         +u2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwUP94E8TsmVcMPTfiu2I66E/fBcHV3H8wBJ0XkUFzn16V2Ah0QdbGbjaXmLPdSD3jvmye2S4Zz8q1t@vger.kernel.org
X-Gm-Message-State: APuU4Z94JxLpF8dFRVj/jTiqxzRxs0Cpm/MexTWozawTjWK2RWVRTHwD
	Ujtv+ujOpA+yjQsvx/7O70LmXRwqqjpBzx3/PBzfHY7xl3MCNsatlwGJ
X-Gm-Gg: AYBFou2ZNV51Oz8cUdIuqxU3D6fjo5v5ui741G+n+5watFxkXsxJjgkuARX96Lg5JrU
	M+YWafEU8GMhLRsH+MzVd7KQSpYA9K0M0DOL96bw+vch1zYG6CPupFIbLW3Z3xO++kteSGWb6fh
	JvppPtk9pd/WFyqsB4sg16yg0qYn+ntYScGQ+fjw14+WMZ9nsu/daHEZRxS65W+bao1up9++dNc
	AcOfRtC5i/DpyxpUyybTdomUUNX6Jf8TzPeG2LQ0CiEvJhNRLnhSc0yoC1UH3wuY4AJVqBJHBFk
	BVR4kLu9PWsIqU9ZfmunZPrISLJna8+cB4sG1q4rlvn2znL/TeS53ALqvWdKEX9do8YWABz42g8
	JTnucbixZ73Qx6hTEHNtnEfRRcua6RM4lZ2y+XfeR0jzerAFrK1yXg3c+3rIezQIc+hDuHKOPCD
	lhIer0dT6Om5+PFpJTo5jiAv0vtkioFH/9Tj+ewlhQ6/KB1IrD4TfrSSU0NLITRdPKrNAUf0qmm
	HR5SIabB4b1+fZVV2Nl6bbQ7FKkkkbeRvonaxI7JuP7rjhL9wWvjW7a6hb2dPQFj8YeOW15c+Hl
	P215vZEg+4cJONwUbZJrcfCfLQacdJBP85SZNFx0s32/0Tj/fnGdlwredxc4AysEBQBZ+ZJ298Q
	4KRiFmxuRWHc1YaTeU5cqxkMlIKw4NE5eBoTc7n6QOz1ksxgyrnXEUK4PjdZZ3PWGH3ULvKyxl7
	dekizP
X-Received: by 2002:a05:600c:540f:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4ac17d1a1f1mr456154495e9.20.1793901386029;
        Thu, 05 Nov 2026 09:56:26 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm77678635e9.1.2026.11.05.09.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:56:25 -0800 (PST)
Date: Thu, 5 Nov 2026 18:56:23 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Nate.D@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <auzDR5B5k5GR9SRc@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
 <auzAh7404GAsY-U0@Lord-Beerus.station>
 <auzCs1MXC8gWXtu8@SMW015318>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auzCs1MXC8gWXtu8@SMW015318>

On Thu, Nov 05, 2026 at 11:53:55AM -0600, Frank Li wrote:
> 
> If not impact for current user, needn't fix tags to back port it.
> 
> Frank
> 

Understood. Would you prefer a v2 without the Fixes tags, or can you drop
them when applying the patch?

Best Regards,
Stefano
