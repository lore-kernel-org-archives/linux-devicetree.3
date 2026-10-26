Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001565;
	b=dtVke+Hrx4btFk6RjFBubUS8YxufW2jUToudMoQwA9qN1KMwQ9JbG+ToBUnpLBQgJhbt
	 v7Eps2SWM56VKtUpL1BEZ2KciqjC74EDQQafHsFdBJLuWxQhiJrHkFUcMiU79XC1OuNPV
	 8ZcVeppFTe0LKS7vUIMjsm5yFxoyZc/5zCiuh+Qg/83I5x56AeA2fWVtBOWV5yQtNudhO
	 +GEQSDTXxMVK57UaholQS0Nf7Zx0/MOPAPXgdRoZupR9dBtN4PH3rGaaMKpOitQPeYyPZ
	 DlMYE2/XJ9UCb97woTn5Kt0yseRSEtkOp501bIlqU/5uUQmL06lqz+a93zRipYji5pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5vbNRlDHh+WVWhm3sA999nt53xsF4EJNCqmMp50Sjyg=;
	b=KWhhWQAireLCdJWGwGQ7taLAvX1yfWfdRnhLYepS7u/j6M9ozbpOCYNa/GBKI92M3KIs
	 v6dQZ9zStVa/SQto6BC2nOXi6XPABs/gdUx0upCijHA8zN07sMa36rGj8mHiljB8a0Yzg
	 lxqXXUPNl05qVKv3lZP2qI/vdyB/InC2pGIZbo9iEZwzUchHtIk2Q9P33FSRYT+1wwNQv
	 uGuScMuIeP6G1VbMEPpWM9zWrN+Phwa5FJW3QG3ZkQKmQFyXvIlW2OQ6+Hnrao7ohOidH
	 r0//XW7NgXqmljIcIRMoTHfSrYyex9J7yoW2fNZ5DLgViGkiclwsiP1HIU+cDZD7ygw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fIWLwUjS;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DCD606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94DCD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fIWLwUjS
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac6008c914so256966a91.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793001564; x=1793606364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5vbNRlDHh+WVWhm3sA999nt53xsF4EJNCqmMp50Sjyg=;
        b=fIWLwUjSVrWJI3wikUnFLH1FL37y7awEIQpbjUF0+kCdV/0poPM99W6vvxtOxLiBmE
         CR3sER3AOL59DbSSPEtWZpUSZmDBa3E5pbekMX+O8AEKbmesec97aEemhuUQDabDKcGq
         UN51w/83eHfogO2fo1OoIXq8HfaAhv42Vm07kOMX0041mDHFVaRx+3j5LmwzF6NL6Xg0
         LSjWV8xTP+jc6wSpS4UrUanbN7gzwT1g9OzdkL0993m+F1jUCO9t5fC3A61mpksHYE1a
         c/f4RhZjsqZYl7DDEjwqJe8Flaf/ElkrW1BTdyyrXwPnO85RC6ri3FbyhOdA0cbhAsPU
         oT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001564; x=1793606364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5vbNRlDHh+WVWhm3sA999nt53xsF4EJNCqmMp50Sjyg=;
        b=RkrYJRhhepaxbwWpcPfEEFsvlQU5oPWBQUOd9eWqw1YjiTivwEt166t8IUC4fY9Ayu
         g3/SHQAIfVD/uQQmHh5by+f5gDmcSBdzodSLufB1T0lGdIC8S6JMGlZ2KBEopazW1yso
         /e4ZzPudZFiqnfy5sjFkqE0nHMq9vgc2sT4Bbl9edmTU8JySZKJRnS22jEV0XqkpdKtU
         T8BVHPVDHTlWaIC9/TywuWX+hNhgeRcxCZNeUMP8j3W26ElhGe0W4BsuI4a35J6+oUsa
         a1JKKB3+3xCMOzYebsZzqpTzwMpXFUpj8SevF0CX5GePvzMADFJvyk7lbPdIG/DIHes1
         Z/1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYcOiLG8VusYHuig+0stcXy3ujwl1ZT6WxWlsSfHukmhe8tWA58z1vYhgfWYLmJs0XZzoY6Gwv9zhd@vger.kernel.org
X-Gm-Message-State: AFq9FYIV+/dq69hhUOVCGxFG+12Qm8uy/mm3kOHJXsPHiBhU9MgWsOoh
	7Cso0zvfTPladUpt9Sw1bx8SYbX3fW5rbNHndPuRL3SIwj3ykQS0+ypp
X-Gm-Gg: AYBFou0KFT02WCYOGGnchYUenGl0F37I16d4bUQOdSOp21kp94SDUoB8AJsM108r9Yr
	HIfQOR6ffFrr3iPG0kRWk4MoLwwXAqXJF7gv5KkU1HrajvutLVpPpERdSqNjy6lQ6OfHODYuApP
	cwiRnN1xcTkQsRvfvq17ElK3DU+I31uhPFmUwIDSpX8e++MeEoGlBBKynzWvC9sZCEvL+EHINw4
	1uuYuw2pe/bSwultJpDXZ/5R94+RdOi/nZdR8bA0/V55lBqZ09zspW3FwS/wFUGNPD33JnVRECN
	waFf8jH/f/8eAphYjzyZQmY66lbJKxLZOcnTnRXhY1KfBBRpWsh8gQeIilenZoDON1ysaqOrMcR
	TZeHCumahls9hod0Lip3TvglcOu2ycyBQcf+n5kG4I1iytStlyN4Rb0rQHLC12T+5dop8upS4zY
	ghZKEEM4baOICqGeihbyE0XkMXMA2whClbOtxlGhgZhLmlvTlvtodGmV6DgEDtcHXSwECzBpRzR
	SJohNehtrLtBLb+F0OmixsCDDnSdhY3WdqMSXJuzy69bRUY6rFcaOfh0amV2vC95RiHN86MKVTc
	bQWw
X-Received: by 2002:a17:90b:2d84:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3adeaf9ce48mr9020240a91.4.1793001563928;
        Mon, 26 Oct 2026 00:59:23 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm7490258a91.12.2026.10.26.00.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:59:23 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Mon, 26 Oct 2026 15:59:14 +0800
Message-ID: <20261026075915.203854-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026-luminous-traditional-gazelle-0e3bb3@quoll>
References: <20261026-luminous-traditional-gazelle-0e3bb3@quoll>
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

Hi Krzysztof,

On 2026-10-26  7:08 UTC, Krzysztof Kozlowski wrote:
>> The ArmSoM Sige7s is an RK3588S-based single-board computer which
>> shares its hardware design with the CoolPi 4B.
>
>How different devices from different vendors can share design?
>
>
>What is exactly is shared and how did you verify that?

I confirmed this with ArmSoM. They purchased the original CoolPi 4B
hardware design from CoolPi and confirmed that no hardware design
modifications were made for the Sige7s.

So the Sige7s uses the same hardware design as the CoolPi 4B, rather
than being independently designed.

Best regards,
Jianfeng
