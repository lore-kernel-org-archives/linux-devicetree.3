Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370690;
	b=Tt21vIqsL0agCF7prbhcyGf6X1svpV6zCVnQGa4A3dR/7takPL3x4IazAwSl5tCItVX+
	 e/P5/3P7u+epD+AqjHjxPOK2htyUvVFrx6VMvDr0R1ShHk0LZ23tvO77SB6/Nv3A32gY8
	 ye7JSNJKSfGwAWwDw83vWINO2FmWIT4z5q5vcikfGVCt2pN2N1ZNxSeTGdMu7YTqPnaW2
	 8g9QdLFCWtSKqbiXTNSM5YvwyN+trkjl4LJXM5CiI9ruhw9XIHZDa5Ccji9nKKLlrmJA+
	 Gk+v+dwyh4c37RJH2bipxINUPgcpl8t2kxu4jXKfkE6XRR8vnrOHb+YpkoWemll2SsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=ihpfqV09MUmYak+OSGP8+YzvL6ralFIX4WEZ4Ld4FXA=;
	b=JSJRkSDpHFVXvmTlbyDvRooQVrIhwSgpjPsU5uPuEmetoFS2ovUWJ4tTCv0dOf6yIC75
	 XJXe5NdH5xE/pDZPfrP5cFfEmTrjokboHtYtng6GGwJuq6lw30Q3lbEpkUHfW4RR1Nn/A
	 P9/DnOktJDS0froS20dy4M+kSaj1vRXV+7WiC7mlENl03cMVmBPvsPZCn0F9oseYXDAPr
	 NkvkRUuF6bcIhhXFH1Puwdh5QcBxmi6GFMuXJUwV79hY47TytZx1tGVCc1n6iEtVoxGa2
	 Nf1K2G+DhsTJeMXLdJ8+3DJyIqwwDp/Vny2Dryhk/pbt0P55apwmYx6oTCOlocleQWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PReePLVE;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4E606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D4E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PReePLVE
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so3213988a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370688; x=1795975488; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ihpfqV09MUmYak+OSGP8+YzvL6ralFIX4WEZ4Ld4FXA=;
        b=PReePLVEWnbnWB7EZiZahXGuNykDQMdLn5f5Ged97JYaFamdmkM9/73LSql4BJtXWU
         vUHgFkzdX9cavArolTyvMOxU7wbnh3HpcDEVG43mewnGjl0zUJrj70TT47+SVhiw8+mr
         h4o7hKTXsmR0PmUBDOOvu/O/nh3LmAt6/x8w8C+1mz5/Z32t6I90u771AZOPCY59HW4x
         4vZThqAwyfs/lnd06ePKqQ55rVkKkk91+lfubE2hihyDHy3VC70LgiPgZxqnvVpS/QsI
         vsPimUHfhqhc2Re5Wnr0DE1FdaC8cBaIO23DozTuBxNL8lnhUGCuTkyL/poRfangXI3/
         nvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370688; x=1795975488;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihpfqV09MUmYak+OSGP8+YzvL6ralFIX4WEZ4Ld4FXA=;
        b=Edg/vyggAQu+5ANTaE8YUaOCQQ1apo3BpCeD4uH0VGSZEuo5SQzxZYnVh0+5LMfC/8
         UJMhlPvDn10YkKkdB9dylkMr4y00FR20UgadojrABYlMV4iwBY5NSO+rKo0DH724Lp9h
         f0JcS9QWzDnAEC9vk0Iwkp1Si21yptfQI6/98BnyqLRXf6z4t1gilLMo47Wc8R/rom8g
         i+BQXFC/L+ctqHEoH+4Z5p4EeEU236nVsVvP33CsmBHXNtyhAc6vtMovP1Vy9MgLkM3P
         LN/SpR7LC1g8HKeGDp5WD+7yfnMLsOY7q2bnvyWOP5VA7DY+Bjy6RZRUroPVLRjKLd8u
         2LwQ==
X-Forwarded-Encrypted: i=1; AL+hErEln4VmcZvOodLnOLCblv8J0649FL1RH7nEAZ10kYhZgRG9HyXCHhbJ895lT1qO4tEzk3fxIrQGa7k+@vger.kernel.org
X-Gm-Message-State: APuU4Z/pU7w8abk+5gpEig6CdalRPPs96qC81nnem406xDpx3pSo96rb
	slbrGULEm3fQjzwZ3aM/6dB1yLD0CbVS3bvcab+BMleD4+Q4y6Ml8WVY
X-Gm-Gg: AZFdTZc6xxiwv4LiRwDeZKNEe113iebc70wovYYcNjhwqita9oOlZ7GCziJL8GrnJV/
	Ah3WS5yPkxViG8Rd1uR88yPnunYElw+5zQ1x/9/mHRFJM74sFCHGD+Y5fz0E6W9HZt9ndEMs5iP
	Kdxd95o+TXSeGCoAtS6OQu8pwhfMZbcspn4y/S+Ae/no5xcWLUH3roX/UGDNlmYJd+V9tNF9Jlh
	PPJ6hMQPnbCVA5QxLlAk4O5XixLaOk6Iiq0Hx8bhD1C+95PPguZfwJjVSTNkN48JbbNq56Rqqyb
	UU+HZSyu1MliJO//JktHud4d42bEGXpkAG91NkAny0RDdC7j/Mc29Xs3S4QcE/nYX0VXRzcqu+f
	eOUYieyoGdixTsoYFnHsMhymKeIyDYQ24QJNag3fD5KT5aBaV1tys8kS6PaCYl2wEfKNPzy2F2V
	m+nwxfs5HEnPGpLDk5wRzuzze2Dd3VtRnUnnWCKMlrgaJTMfGhp/rHctpENGWCl9ofjIDB8q/j9
	6bfUCY4my+gcezzftwzLdYXlEu+FrZQYKqFA/XhIHLFpEfRJlJRKLbZAy+Ge2Q5c2n1c25oKhNF
	qyyoYgKEeYdQNXPiPutZOd0+hPbr
X-Received: by 2002:a05:6402:350f:b0:6b7:e608:d26e with SMTP id 4fb4d7f45d1cf-6ba37ac7f23mr6591721a12.0.1795370688303;
        Sun, 22 Nov 2026 10:04:48 -0800 (PST)
Received: from localhost ([2001:1b81:1b55:aa00:48b3:8eff:fe5b:7d15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4046910a12.13.2026.11.22.10.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 10:04:47 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 19:04:45 +0100
Message-Id: <DN1XSIP8JQKI.3RAMYIOW5EB6F@gmail.com>
Cc: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: input: touchscreen: hynitron,cst816x:
 Add supply
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
To: "Gerard Marull-Paretas" <gerard@teslabs.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.17.0
References: <20261122093405.70406-1-gerard@teslabs.com>
 <20261122093405.70406-3-gerard@teslabs.com>
In-Reply-To: <20261122093405.70406-3-gerard@teslabs.com>

Thank you!

Acked-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
