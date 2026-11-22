Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370249;
	b=N4kcuolF2ft3b/eJFq1mnS0g9WaRqkgJQYH4aLbJOnx7GgrRKtFt6JCq3p83+EVd5b9q
	 ZJTiWK6DtRIqmhgRaZhL2Md9HlerlzEgjNULrxup1F0XAjaOS8OIvVNpizr29zwz/k9U+
	 NTXEzGED+3y3SsVS9Mb3ZSTMLY5Ha2efF5keQT2mUKtJ+bMLUrncDn8WuVasu5EHO2mk7
	 p7nOvPDdyQxEvBqG7jFC9VY0mqgKS5b/bDERfEj7SCa8vFXUnmY8xEjIQmUqNkWH1Avnr
	 rrkI8od9oOUg3dygL2P5dGGEqVTDWiZJCJv5Sy/pmHLYgEGNIllRbr1UCgeZDJhQBJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Subject:From:X-Mailer:References:In-Reply-To;
	bh=viicW6dYYgqYz/0PCrk8AqSDsgJ/CNYIh9VKy9gaRjU=;
	b=L4w/zZHfwFq7u6nrRAGEBWFZHSsMokViqzNLYwx+K6XD/sV/lWTENR9fXyzbcFl9PGM0
	 +yCd0ah9BO9dy/Sgrbqcgv5wV5M2hVyw1W7DJY6agohyCURAuYgbGiDkTtn48E6Sd/vA0
	 r5i3uuR6uCO72mV9Do1g/VpP7yVnxtcg3y++yiGZ7hpzcDMvYlMUt9CFcGyXbf6HNyRdC
	 z1ttUNZMplwclqDGsE7cU1xUfS8wENnJMkq+Ti8ERYR5Rsa/1+EJXgUDSAirf9WRA4lSK
	 RvHVRfZoyCcdZsaBU5h2eB/HOFVwtw6mSm8zjgH4nbiURZA/dRImZyIjNIC34yjTnGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dr/Qrd94";
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD070606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD070606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr/Qrd94
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4322d310e7so454350566b.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370247; x=1795975047; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viicW6dYYgqYz/0PCrk8AqSDsgJ/CNYIh9VKy9gaRjU=;
        b=dr/Qrd94gpydZk0dZQZ2CXJb6YoGCswSFWhMwiIIj47twDTJ3HdOaFBEegD4UDi5Ci
         C5Rm/ulgGPq5iQyanl5JTJ8n9cmsydNeQs1FMh3EWDV5LRRzR/+ybKLlUDAEPuGeHMgJ
         p4x+z/Qr+gT9ztzpL76qiEgH6lOxq+faWCKM+UC7u4FkUFdP3ufnNdKWmQ3gXQkcVO7V
         sQK0t50daRMF8Mv8DPGjGOwrK5JbCEfHW7dYRe0CliEuOjtiwMOfwNb9pXr/ClcbvPQy
         xh4RZscekd4aR3P+gAP3MVJCZpfkTPmDTseCiU4bTBB/DwwGDRQZo+ofQwQimKH+mbXo
         nW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370247; x=1795975047;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=viicW6dYYgqYz/0PCrk8AqSDsgJ/CNYIh9VKy9gaRjU=;
        b=V+ErofChvlwMy69OJkbLpfn2ZnKwqby6s+ex4vIhpHCPWcC2QSVr5nBgPvZ19O7njJ
         iV2Itqpb1T44VkGm5UfePcLBPbpHEINMx0vh69Mg9EnbfY7om54dR6+yPn/n+K48CS6p
         hj23QvEa06/4xpxKmTKiXhWkPztmzWto9NaMfsIsFsLKh+5l0rGHWMm1mq2pVK+5IWOc
         RnJFlOu5AtSPrf6R4DV/WOkB92FxZyQ7g3ouBS01QVmw8kkMgVeATvXTfzX04zmbv+gh
         7pu+MLL8ha8oZCOLCzSO+jAlaDNXLXhLAOfGJQc85EMe4Wbt8G/ODjCCXncTOGS3VMva
         PK1w==
X-Forwarded-Encrypted: i=1; AL+hErHnL2sUFeG0KbObNFegNoOXCTW6pz6YgImnF78VfaZVtbWDVdcCsDKBuYgjHkE5f6Z9QhLD0AA8Gjol@vger.kernel.org
X-Gm-Message-State: APuU4Z+5nY8gi+rumYgR3LrxkrvxyYrsYmGgWNc828dsTle8zPif7x6x
	4abGVGYoxaphrzslzXYn9BoIpdWc+2MfuTFbOmXfL69c2GG3Io8VON8Q
X-Gm-Gg: AZFdTZe9IqMbllPHSm2si3R7k+WS0hObnsUv/piTXuQpqGc6ImXoCKG27TTfylyqdZ7
	6Fx3HHq+LSYNjdgmafLigAyu+yfse3XtKjXqUmwLpBCtDtXvd1lvGfCz8AxE/ztwnJd7zIJgKSQ
	QPSJrr4Q8Q5969luZw1WXEAnbxGNT2O93DApv4OBywp53wUB2mN6a9eubc+fONl+Z+/Hb1ej0ru
	SYbcGn3dmrxa1RB2Oi2HulKRb+LtN6Voef2PQNbHn92ucIA60KCVdzgeIw/qwXax53mcUO9lBRu
	PfouSE3DoWwgZScShxCyTDZEJJ95jTW/aB3S6JMboDo9UDfzGaMHAYaFdElxoWgGF8RwuVVxGj+
	7WpQXgA15/YPyYCVVSB21XDp2nM4nnFEmdpQSsb7INRttcRBjaNaDLdBtM8+JVY3sodbqZQ9OiR
	slbVBcadvNUzRguBiL2vpNtoi65GCHGGnRuzWQmDDkczyZ4JvAsa3ZZIo0IgdickGhS3XHgqIhS
	1corzTkXbrLGeLZHFgOq0F7jjZZj8I7tWjRTYKK614VjnAkjeE/wBwKWnMBuRCYen35tkJbjQ+Z
	flCg2Hf4+5N5h8+yarWXWSyKxb7h
X-Received: by 2002:a17:906:a099:b0:c2e:350b:7220 with SMTP id a640c23a62f3a-c513a99a637mr622258566b.9.1795370246930;
        Sun, 22 Nov 2026 09:57:26 -0800 (PST)
Received: from localhost ([2001:1b81:1b55:aa00:48b3:8eff:fe5b:7d15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm331129566b.61.2026.11.22.09.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:57:26 -0800 (PST)
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
Date: Sun, 22 Nov 2026 18:57:24 +0100
Message-Id: <DN1XMWA7362O.3IV0CG8EKY4KI@gmail.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] Input: hynitron-cst816x: set INPUT_PROP_DIRECT
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1791233147.git.daniel@makrotopia.org>
 <ff91fc6f203d4442d555597cdb455b476af9da50.1791233147.git.daniel@makrotopia.org>
In-Reply-To: <ff91fc6f203d4442d555597cdb455b476af9da50.1791233147.git.daniel@makrotopia.org>

Looks good to me. Thank you!

Acked-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
