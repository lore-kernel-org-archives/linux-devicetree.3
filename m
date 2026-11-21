Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795261965;
	b=DTBOdnE0cKKyrdYBCY/NVONCLcvLyeJasyNW6uKuUHaBRv5IUFWKilyezu4E79EnwfS1
	 nClfExn6JBbA/bbbIFUmRCPBjmno8eEfhcVtWlIG7/APQ84dzxKXsoE3zsmLn/BER1GAB
	 yVUwsGbWfRPOtZpoIZXkhQ6okTDOX6A0VZoU9tEvv9gWBVoeYdXgnoCETilywSZzgvw0P
	 f17heXpKsZvSU7Sb4nzV/zuBBElX/HHOvcePz3ix3WpmErrKhwahOeTKLAFuRL4yCy5Rv
	 YTAykdWeokYqF00vK2drGI3rpYL2BC1ZPyYYtrP/70ESPx/eiCxA2FRJibsHUrfYUwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
	b=VJooIFR876ichJzQvLUsX1fnOMQuej/aMqnKuFCgz4ANAErHMj0MNqpGC9GOFl7Isgnn
	 347KnyrcZdrXbDBe1RwX8GdjeZ4n+9J4TLWOd9u6tUKR8iZOa+fQWomZt5+j1kkEEPw+P
	 1SX4F2GQ+M/QazI++sFINSAQh03yf9/VKgSeES/z7BFf5CFjy/xf9ho0RXoNprFPZEHsM
	 0R1a1cE6svRPE1Jb6BuMmo7e201/9fffigQ0yWUVD/YIdSm/6l5XpHsgiLVsZijPfzIV8
	 sDDsdCa/Te1tedJPfWOsZ8+aF9Pfw/F7MkojQwZ4HKa6GOogzWUoblTxfH31DAF/qyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qb5bJfVt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDA8606A32A
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 11:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDA8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qb5bJfVt
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67583c777abso1817114d50.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 03:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795261964; cv=none;
        d=google.com; s=arc-20260327;
        b=Nvwjlfqheb5TlEpLDV8Le2WuRZSZ5UaLupQ7tTdYixGW9NT3dI/dgGdv8t6Ovd5+6I
         ibAhTk5zCTapDzx5CqgwLJ7MM9FTj3gnvjL5vMKJM9ffDgMwdOM7dyS5fJqF/UPtp/IR
         4PwQF+DH/2qeiIYu/yvbxc0HgLG9tE3GRkRcgz1Q8P7nGyjIA5wubwXTuK4LQeGjCOU7
         a+nkCicfxj8bs22hqG8cl67Y8ryS80R1M46GOq0xjEMlQkRq19GrUg916P6+jIymi3YF
         3cmTM/NSeI8JTtDU2A+68Gz3PrFwyFRI5OeCY7kbamTn5/qFEKXKUFOQSGL4thoEjsxP
         UWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        fh=P0ce9rfs+dOMOV1vg4vl2oUG5TQZ3ttfdEHnk/rJc3A=;
        b=IA8pDa03xc3h/erHsqFD1ru4f5TdUw1yrls9EBHQA3nOqH81JTTgIei42yEapZkddw
         LtEK+0lN5vxPUF0036oWlAsosFjpa7hTNdpdA7GR/Qlk3TNpYVHcLDBBhM9jxU5hSmbj
         UTBxmdS+LnM1Bia4w2c3gwMP0AP9zFUAIDUqBB2BLkWqLaEa8tKnLbRGXYDbWRSQ1Ate
         o6XGK8SyVcRYu6nLxEB6iNs4pzRSmBYm65VKk7xgMfX3JE7ZIPABRPf5ZDNiJM9s/yTl
         NFLLRZpYR4A7Yw2SXm4qTk4qXrB8Zr8rEYm/gj5lK3O79NUNVigP57lZ8opWRUexfp0/
         3fBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795261964; x=1795866764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        b=qb5bJfVtA/D80+4zx2m05pDWxT9nPxP/bWOJ/woKNsUNyhX/SLgh4QGGFI/dC+6aR0
         yIuNj9xlMvR7m1/Pj1wh10ZAtTUPfPyWhAR1DL8jLDw8QwhbYyj/3UkubkcO1Pur6I0X
         Nwh6NYFE7b6vXh26kw7VbAEQfFeQYV6hy9aAXxJF7eC6kcjuIU9mpPH679E7+d6qzl4w
         dV6C1ALIEp7yxxu20gP2IGzFT5UFInrqavS90e2AhUALFUFISR7I9+qMhW5EFb5pRyQC
         jX5B6HvLy8BlN5/FSIQT5GY7OYUicvqb9HKnzeMhZ5J7zzTS/+rNz6BWV3gvSmx+vXhN
         Dl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261964; x=1795866764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        b=hMOZSRAU22l2p1dd2Yi09PWv6xqNcKmuJncBSO0whcEbZewZVf7RK/ax666zn6RP+l
         tllfh2bQv0Skbpn6UjppQRzgeb87k0hpnw4q+dTyfIYQJCoZG34TNcIliGdAuZWsYOqw
         3bw19NdMl5Z9WGZGA4gafG2cVolIsTNJgc+5Vd5zcS/5DneAhjyNndV3VNILEWE4AYpJ
         gKK6h2dMldqzJe3EHSEKmZyLhDosDa9EnULMi55AlVEfRwvTuW9GQQFXtEx1/ca7sn2M
         7eKS2F8ZAioqHfeH+TmI+D1t58ssGecY2+M6slTozFCoSgOwa3kLEj2TNmzbaswPms/p
         HFQQ==
X-Forwarded-Encrypted: i=1; AL+hErEuxFLzVkxSjkcQSHqj9ZqW1qbDjKVhShkyx0/qjMLSDGizAEj+8UQ+UHojHpO5Ox2kNdHHYbwoh6LA@vger.kernel.org
X-Gm-Message-State: APuU4Z9DCsY+wZ+Xi/n6S8Mn6VwyOatR2AkCszAsLEj9huExmM0toXAG
	NxmsZkx4LUMDdLuNEOKYZfmJjE5Wno2ImNs3KE3yevJ3hwW8LUheDmHGjgl+7rHserQKciFW26g
	XZfERzsjqAQI7ie5cNZSvBIYqX8i+9+I=
X-Gm-Gg: AZFdTZf/pP1YRpImCgKiqrRCMWpOsQGBKuoWf5Ow03q1VSmagR8edc/kTm6bhCC5R4l
	JL1YgTdGzWtcyVgZD1IkKQ3r+2wOOkG1SQgcr1OV7HDZlFr0o1Xor02yfk+awJil5t/4h8n8y1r
	OrYOMvqYlOxT/oZQDoFc/SIUzjlqaC2jtUYpjWqtyKkfcjPLpij+Qc1jAuUxTlRype2cvZEel6T
	1fCjIBACKdaLWnClYEbV8+9XfHcJ0Pkj7tAR2kjUbvlqz02l/LfvFt+LEf9yz1FsaOQ01HvwyyR
	Nyb/7+G6hu5J1Q4qsPKi8M+XPv4Q2UHKb6YuJmh5t7uGnfROU1dbw9UicPfQXyXelm7H/dcTwdy
	I16D+uWJa1ObMynnckRBXaiHyNFYz1FlB9VINTXYNAdjGU2j1gaoNCETF2ro7rY9l5lW7jk8veO
	wUu72NzB9T+8QE4V+Z/tPvDIttbrQ=
X-Received: by 2002:a05:690e:4850:b0:67d:ab84:3bc9 with SMTP id
 956f58d0204a3-67df42c4011mr1425040d50.5.1795261964144; Sat, 21 Nov 2026
 03:52:44 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com> <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com>
In-Reply-To: <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sat, 21 Nov 2026 22:52:33 +1100
X-Gm-Features: Aa3M54rZGK9MVhmV7coDk48If11yJyzjN2A4aBmkg_LQalyda1z1hSvlbjbiJKY
Message-ID: <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: apple: t6031: Add CPU frequency scaling
 and OPPs
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
On Sat, Nov 21, 2026 at 10:44=E2=80=AFPM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>                 cpu_p14: cpu@10204 {
> @@ -272,6 +314,8 @@ cpu_p14: cpu@10204 {
>                         d-cache-size =3D <0x20000>;
>                         i-cache-size =3D <0x30000>;
>                         next-level-cache =3D <&l2_cache_2>;
> +                       operating-points-v2 =3D <&everest_opp>;
> +                       performance-domains =3D <&cpufreq_p1>;
>                 };
>
>                 cpu_p15: cpu@10205 {
> @@ -284,6 +328,8 @@ cpu_p15: cpu@10205 {
>                         d-cache-size =3D <0x20000>;
>                         i-cache-size =3D <0x30000>;
>                         next-level-cache =3D <&l2_cache_2>;
> +                       operating-points-v2 =3D <&everest_opp>;
> +                       performance-domains =3D <&cpufreq_p1>;
>                 };

Oops, I accidentally forgot the capacity-dmips-mhz for these ones.
It's just 1024 like all the others. Can you apply that when picking
this up, or would you prefer I send v2?

Thanks,
Michael
