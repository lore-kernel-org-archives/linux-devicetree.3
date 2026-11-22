Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333970;
	b=yp1x3fcjILYvGwMM8AToMcTKMLaDqpOgjdnqQYPwQRyIWWuuqFQEQtQSAb9yAB3iJ39i
	 Hv7Miv8Zoe8na3LVKhxH31VF8rIyhVLa5U/xH44Z2skeHoyzy6SZ/U9NC3l5QbNaE20F1
	 oXltpwDk1VcMwwD/GdJn7gGXu4x+YiT0h7kc7jO7HLKKkBeG9x3jqfGO3ydaJNW7V7ixM
	 EgZ4UXMftwqvymR7GKOM6itIJPbQVu1VxHOjRvUN4pDLDQ1/at63H3fKw5r4jiKyJrSl4
	 sonH1XDqyZgn+GUik6SzWal/V2cTopmOUnn/96CUvaBPrCS1GxcICTE8YNV7dBlfSHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ciNlBsmt/ihohJlZfy6Y/766ujih1RX020bU3zC+WcM=;
	b=Ipk+5ATFo2SyvOiR12Ykct7afGYzHRQzS/jsMnEe0CnCO1FQ/t0WRilwuR8WuUkC6z4r
	 pqncoB9Y4cqBKURzC6dHcFLt9FIVq3BNGbgZjlO7MLPe379lLI+QpPSFjkCqTxtkwH2ll
	 a6c2XiiI3vcWaRO1mHlFc9nxe1DKIRY2cM95n42+RvnfjwX0CTUUNYQpiE1llLKUBnwza
	 PAN0fx4nRgOioFzI5HWdXW5BtvBmNMCqFDde2W5q1D3BFxNRb2nBmx+Io93IPEWIw5uOk
	 5pDRW1CuKV9xrs3wHbf+bbqzhf/DId8pKyTkmRDwV+qpRna3cPBXfx7+YIuHThUmL3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3EwjdAI;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC5C606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 07:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC5C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3EwjdAI
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50933bdf4bso538955266b.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 23:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333968; x=1795938768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ciNlBsmt/ihohJlZfy6Y/766ujih1RX020bU3zC+WcM=;
        b=P3EwjdAIWBuYLgL/Ltp4V9bQavyPv6UwTu/fxuJlsGnEVXJXYZ68AHtVcSfrG7mZeQ
         N5ozErcN2MOUyzf8gAx6EGcm/5igi2bDzdvqdcOaWId5XZVMGamXC6JUrqy8utwYfKxX
         sShDpsOzKDXDwvPgkFUrMBeRwZEk3TmZRBlGcf5u/4pHaZC32z8zWvZXmKkf+erQABWI
         RVh5fvOk7Dbv0Tkk4vKSIu4HS1fiZuHrewfI1Qt5wi/5//dmFR8vtbmgug9JDpPtBHys
         y1VrXy00Bb3YqcyZwV4wkSTcs0BPMnO9XVhcpMlGp1rc2LQXHUGizwE9snOgea3rFan6
         5Meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333968; x=1795938768;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciNlBsmt/ihohJlZfy6Y/766ujih1RX020bU3zC+WcM=;
        b=InwI/F5vK1rPxzQobH6GKqjarQvtB16+Lr7f99LYxl1zqf/mC1JAp3bVFjK7P/0tRQ
         aLA47Ee702/yfFv6odYykrg4u95pi09OGSR2YkGkFn8sG/SteppF4sJakpLWze1ateG9
         4cggDam3oFTamaPQ38zlmiIU8OcKpMtVcgNqP0LWgLNgthd6jud4OWqVgymNHOi+IsVl
         d5UpW4lSEEQwHBLCgM8XPQ/6OLQmjhq9CSjOg8PBSVJzOi9gQzAKY4p2rQa0epYDtIw4
         jpQOCEKcHOjwnCcWpIgWnh8LqllnCriOwRvrAXLfVe/V6eVu8s/w+lVVyGBfPkpZP8u1
         Qk4Q==
X-Forwarded-Encrypted: i=1; AL+hErGY/EdD+jLTdsX1z/kGUNx/kZNsWJYWTcSBfqxQHimROS/D0IkhpWoxQf4bYORU0W3xQdKI0q0CiVr+@vger.kernel.org
X-Gm-Message-State: APuU4Z/GR3VMPhxl0D7E90gN6V7ym9Qs/y7/eCYB1f4volhoGJ6Er9tq
	pksyl5D+0GKJENPFc/pytnRKiG+vMO/JmVNfn337jTwqZDveqUGh8YR/
X-Gm-Gg: AZFdTZfIDv6biB+TObcq1PBcGRiQ5a6NRB4ARNakphgXOW8mp+yKKQuMhPDmn/jrWpn
	/XElBHkEwdgPXT4ab9lRLyYSeBBtE2YW2NECv4m7pip/vgyQm2gGV9uve51lzxzhTHVRtM/Bgkg
	G/EVHEIkw1zoE0FuzcF8Cyr1V7UFobOmWM7RqOSVa4loTnBORuYqVXIV7w/U0kcp3BYkzGcp5Z+
	hc1BZ8eqlBDufRot6dEhTlAHVOoZ+RSOGLDt+PqKk/Fk573HCGx9kqZGIqdvXkcNLEpviV1jvBN
	k8yqlcksx6Eb16C+xEYcVcecA/x3eRy0H/IzTW51sfQF0o+QzKzbHsQL+4Sqafcpyputmreluzf
	4A1h7lRxY9SnpHc+ImF5BoQqA7MAWvJQLR918fWjQJOdvgAlpw86bV2d6diUDreEXADsHKlEYJr
	RaQP2jTqsTa7SgVEmWkQ8/mqUAR2XOff5o78HuSGD0ZVEhoG9uqz/VDpSnkdT2hIyvkKYD1qeBD
	2lzgQfVpeUkXRdo49VQF6nJELj22fIcccLB7uam521kvqTXqMBmIEGObU38m/ROaEnhkUB4JswV
	Zmj/g39l8sYp/n9CoqZfBH1Q7U9uHRRIQzkdxWhXejgXNaU=
X-Received: by 2002:a17:907:7b8c:b0:c42:4557:4532 with SMTP id a640c23a62f3a-c51317e487bmr815867866b.5.1795333967909;
        Sat, 21 Nov 2026 23:52:47 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm291308966b.14.2026.11.21.23.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:52:47 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: proximity: add Imagis ISG5320A
Date: Sun, 22 Nov 2026 10:52:45 +0300
Message-ID: <20261122075245.2916935-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121-arrogant-viridian-swift-fb8001@quoll>
References: <20261116074013.355363-1-tadilhusrev@gmail.com> <20261117173333.1853986-1-tadilhusrev@gmail.com> <20261117173333.1853986-2-tadilhusrev@gmail.com> <20261121-arrogant-viridian-swift-fb8001@quoll>
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

On Sat, Nov 21, 2026 at 01:23:42PM +0100, Krzysztof Kozlowski wrote:
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

Understood, sorry. v4 will be sent with b4 as a new thread, not as a
reply to v1.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you. One thing up front: Jonathan's review of the driver makes
the vdd supply required, so in v4 vdd-supply moves into "required"
here. Since that changes the binding, I'll leave your tag off this
patch and say why below the ---, unless you're happy for me to keep it.

Thanks,
Adil
