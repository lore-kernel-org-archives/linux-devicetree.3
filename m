Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251104;
	b=e+aoGm5VNvO8sZTnymCNbys4rrVLvgZFZv2onLayEuzgxhOx3GLP6PLGWxHXsmU8nVSG
	 nNz9oyOl/v9BZj3GlWlJ5rTxIC5/EGO7Ji2Qiq7DyqjXCyk8v7BvkEbwhb+Q/4mFrQ/1Q
	 eylOBZU0A/ICY0m51sCe0V3EoO3XFm9GUO+PyyS0RUF/V91Ki+ixyoadakq+YqGAyExqu
	 Y1nn+rkBqQOxANtjErTA37ebxlkj65RO17II+5Wed9fz04Mopx0mZuKOwnymt4QGOAIPG
	 RzVBbadCoOsneDDLifkqmCPWyiXb4ygOUV5lmNvIm8spIOYltvd9uqYCNee8apDbu5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Ccwykaou03iEXdgsVl2ojrfIyiLm62r6nS34ODXJLk=;
	b=Zc6g/QG+MGealevCL9da+lqJbsCHGYRJ9nRt+Cc162KDV/LL9glr1sHP9LOz+EhSzDLW
	 P/Dz9fk2GdIwLLQf9uR+cQXpWyApKk7sVyM6Y17j6SGS+iY9Cpps6n94c0gO4lwKdEjlu
	 rG7kDdViC2+vP7JyV//NVh+cLqzKiAPgi7Mcr7ArtIdFqiJlJ+THA6bl+sFxc1GfekKE/
	 iPdjnQ4deb1mJK+k6/tgt1zcghmdqCYYDecHxmpFlmGsbaeU/vVmqyM3L5HJD9Qf5EsQN
	 IcDK3dFEwm6ZUQ7ukausLMkraqx0TyoCy8mhogt8mO9FCS6RlkJs9oAo1uS2owCmUhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=jv7CoQJf;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C760A381B
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 19:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 130C760A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=jv7CoQJf
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so13519295e9.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 11:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794251102; x=1794855902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Ccwykaou03iEXdgsVl2ojrfIyiLm62r6nS34ODXJLk=;
        b=jv7CoQJftGCU4PBxF1KDzpDlQUH9a8qKtj4O92bLRSO3djfFWCNS1FPah4as/ZdEgO
         p1HOwXwuJgdCE6rZXINhR7fxok3QUuovGgTfG+CGDPmFFhwd1p5bYlMIGp2TV+d87Omx
         VEqk2lwx+EYiC2G/yYeLVjsyJO6PHsmHkL1H8yYGfpOi3rApQI3lCnQMficcBNzs6jTg
         syLYLv1+W77kS1CnuO0iXi1LSilW3fO8LSsGTLA74K0rBtkCWq2aTpTCeFPk6QAv/Jky
         WCCMP1dmI3MmMIE2klExHJ+omw3u7NxIvq9kmB/BREtssb5sjTqHdJiTXxdok0QifDx/
         l9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251102; x=1794855902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Ccwykaou03iEXdgsVl2ojrfIyiLm62r6nS34ODXJLk=;
        b=0Vfgb17mI06fHL7LHjSo3JpEIAun2YbIqhMSRWlKfZft+KfvAxMbtgU9bllKy0PaU4
         BGDFzzpzC1E8PobcCeJnHCMYpvkZLryHBZyFlcNVsAVvy4n2AfMuByHLwuq6S4gIc3+4
         OH4BfWsw+qIQULyjeDlvx4JdLGKU2MClGtL5eekVkg7nJTc/PPPszpyMxzS3Atknn5wD
         LB1Wr/2mvUSphRE7Tz3LNNvOrYNoDEJuymHskHLhMEJVLy+51Vxt1qhqDdgd51/ghVUn
         y3VSqmFgeRHkp7yC9HCojhGnAcL12cbk/2aIc4DZAbv6EKs1YM07/nfkcVlFVoRfSr2N
         Ou/w==
X-Forwarded-Encrypted: i=1; AL+hErEZ3mLsP/yTcx8mneZ09FVuykkToGhedq331qdddaHuR4JjJQpWPJ/HyviQQbTFa+qyTqoA8BYWDo6W@vger.kernel.org
X-Gm-Message-State: APuU4Z9eUHK0Do8Mpktnyxmfz8jZI6l6RY4HNDG+aKRxixkMmdRX1Yuz
	AXIEkOnaHBwGq3BqmciGJmAGbxDxdK4+JcRSjMVL9bWyJtf8RPwFZ2GY3evCAFgIUPP4j0S1Xu7
	MRRVgxu0=
X-Gm-Gg: AYBFou2m/28DknJBuzhoh+Y9XkgBFMvPvrZDCMM7+NBzmEMe561nDoL2pbWc83pluE+
	kp9Yhh9B9uE32eSBzmznWjfDfTwWVE/K1jqD0HZGERfnP1al+Dh+ERu5fvNPnlQwGs4PgWpB5dN
	RDpX5uGcYK8FV6l8VPhdQLYqABGYliQZYnPwgfihzP/QaMuEVwHGAOP27+kw/PJ+DyJFmTWaKly
	hM1Bhz7QnRfpugNtknbS81xfnctA+qIVDND1iJMepYl88LhkxNrKxvZe6JUFc4v8wOeBhn07LDn
	O1XJEYAgnFPWgbtv23+2WHpM3WGUsIOR2Hl27C2sRGNXfQsadn+t1l7pnPGjqIeVpT4NGxDfxIW
	03Hb299hntrojRGf6QfXX913mUuQQ1yoI2IrjkxfoaI40wqgKlO21ff9NAP5N8JXPIpRBUHf1d/
	2J703E8VLfaMVRIdrALIjf6rZgEq/8+BNBn4nOz/SsMgIcg3NcSjbPoAL2SPCPHBjD4t5rUFyYR
	48WWdTtmgqU3j7ghbeOr/0eq1WfILX3ZSqstWlFOh9S/NDKqglNL+zlER8Kl9XE1Emlex8lpu+j
	6x9y13x+EcnqLfSZqpMQqP943b3ug4PcjqAKIv44E+caF4HBR1lwo1yPgN9hJJo=
X-Received: by 2002:a05:600c:6291:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ba0234ead8mr3131845e9.22.1794251102350;
        Mon, 09 Nov 2026 11:05:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm543440f8f.10.2026.11.09.11.05.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:05:01 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Mon,  9 Nov 2026 20:03:45 +0100
Message-ID: <20261109190345.61480-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <at8jCGfp9dKjieoo@zenone.zhora.eu>
References: <20261024212520.91401-1-olivier@mgcrea.io> <20261024212520.91401-3-olivier@mgcrea.io> <33b5ee36-e293-4356-9906-54e99ba3557e@kernel.org> <at8jCGfp9dKjieoo@zenone.zhora.eu>
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

Hi Nikolaus,

On Mon, Oct 26, 2026 at 10:54:49AM +0100, Andi Shyti wrote:
> I'll wait for Nikolaus ack/r-b for applying the patches.

Could you have a look at v2 when you have a moment? It is the version
after your review of v1: the spike filter programmed on the X1000 and
later, and the X1600 falling back to ingenic,x1000-i2c. It still applies
on i2c-host and on v7.4-rc1.

Thanks,
Olivier
