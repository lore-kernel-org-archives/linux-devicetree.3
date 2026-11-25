Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617690;
	b=dr1Dq3BEtCAPvxNml750rTStXOSSc8z96n5I8bPabcwAS9j5DLaKIpTXtz9vZkgdPH+M
	 ozwkAX9xq+8Vf1IUSAWj+L5SJTkCTzmbHQpa1brlMzkpVONDSreKl7PUKMuTzF/iBCXPQ
	 aLWcCB+IkVdSoKmjs0lmOUO29u9QjGys6ZvJrxbeWxsOQwJksDAs5Tyk9apt5gi3pfC67
	 AfdMiNkqtgo+d+aquI+JnvMauaZSG4kjC1OcHRdKN2MQcFjKa7BvjIlAEdJMVCou2LapA
	 hUvw2GDfUyq9lDNdDI1Z/mvd7ydYY3260CdKoaKeETlWIoJtYUDGaZD63BpusPuNTEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=C8wAVDCriQKpBgX/jVo0IgbeLC43EIblU+w+9MjzIuA=;
	b=wmFgNBPcw0wOiz0GJAYQXPKHf9lwsdnGCOqHvB94DlSmw6DYpiCSzbFL2f5gIb5mLaTH
	 XhcT2UJEvMY2LR4MNQks7L6TeIdbIE4ybTPUAtJ6IuTXYy+wBvc0q/9Hw6RIeAO2s2q7H
	 dQz6hPPcwpAy2GZsLN6oNGm90pE6vqzSUchwWvd2FUFZALoHS31J8DV6u9weW3R9ahUjT
	 6qvujs5Cz2z3ypzfETwbAzfH5anhfiln8EvIhtzu3qs4dWzgdMIsCj483AkfeFc/ME1LX
	 0tqqtX96KBw66cuaZh5NQQd2beN4gO/H+qZHV/ZjyN5XxlTi4WlCQaVbFjo290XDJNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxGrUthw;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C7F606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C7F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxGrUthw
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so5968050a12.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617688; x=1796222488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C8wAVDCriQKpBgX/jVo0IgbeLC43EIblU+w+9MjzIuA=;
        b=sxGrUthw3PgdlHgVxJKxLveTYF94vC4Q25lC6ULnWml2NQRE8JwZDTITECUm+mEMS0
         pyGtkOrQoTMhTaLfpdFxD4qTs9dtr0xHLcMqSbTn0F2y1RGPLYZDLFE7/+Lu67S/6yY8
         6N/XlK75C1Lf6nhuNHGebRezg/uPcUkaDpIIeMVM/xq5yvf6u2x9Jr7MG9akG4MS5hSL
         j/sj3letj6qLOzJfnBJntFE7bQr8GMj1PBRRZLSf+Z66B7mQiQOQFeZjkdP2Qk9DrBnV
         MCUTxoiW++fUYyhq+vo9u/g9J75Y3ZL8CaymGZiIR8TvnkPbt6rPVJcRVU17tA+XkNxp
         t7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617688; x=1796222488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8wAVDCriQKpBgX/jVo0IgbeLC43EIblU+w+9MjzIuA=;
        b=OLCAeU0lufKV65dQ1D+BIE6oH2IlRG+HvzTZDdG8ykoXVLROQaZARDdSOAL5IQ2yDO
         MyLkpTmlNqyXgcPLHBAXxWmBJKMer+KA9fYXDGJ2Qs5BZqayOW/5ej1qfnIhY7s4QdoA
         imUKaALnLS7Iq2bYh5AIW3y82m/A9Mozp8kk6n/qf6HSbFhL6QAKHVcvLns6pVjzgaEz
         5hYO+oLLZY3adtg3vttaMvqJYSHyVLxi82mD1Rm1NZSFm1eJ/Bh75RSgUcE9Yj7cnAN0
         r1EpD164tBCuUBHMeUL9yqnFTFvMqGII1hG+ZjjN6DQtbCwrmwKR7udjHOzFiVFN044v
         DfUg==
X-Forwarded-Encrypted: i=1; AL+hErHekMit8RwwCK1zTnUKYxwjvjrmPcO13EhHyN+dMfr8fA/1E/KfJKlINf0u44uGGUZVoYAN0hGRMgzb@vger.kernel.org
X-Gm-Message-State: APuU4Z+RXonu4kRK+c8eglGv01la2HDuQ/H0gtl/w4Vu5m+E5xZI3KUX
	74eZPpfoJCWg8sjBUX+nqbrcSR10pjblXLVt6234/psvRlzDtO42rvpd6h+7cN13kJg=
X-Gm-Gg: AZFdTZcPwq9dn2Ws8CTCyg3WKHfq/ZL1u9z2/LrZ7FiYh8BifmcF41dhp24E8rjXV34
	Gi9zGnPRYGFtbpepYCcDEI0rWKzqip+MWpSU6Abqe0DQ3fR0FOhMVmkhQQevopmpWZA07xKpmsK
	BzzXfqdFep9ozOSGpWOS5aRWVXj1kNSnT10rf/m0CIzIamk7RdNngcqAAVy11XLGxPTieX7lDsi
	2A8bLwti86c4o0NVW8nm3Lw8fZ6eTJKMmrruuOo+nUCpL4eveKUx5Oz8IQEPOk/AogDyeJh2O9u
	uyuSsOfhsF4IeBWb4LQpmAN6qYs8tA9aOfuWms/9KiDcEv31uCgNF819h5vWh8k+78OcZyj5YHw
	SuXXOX5TQd8qkdTx87Gx8pmPQRugQ/isN5t059Gj1KiIFDO1ysGNDFh9bc9oui1vL4OkWq9Tx5H
	tnidB3uvFfaqyB1FP4Fo7Q1w4EAd8PIuqn2UUoDpk3UYhKr51e8iBKhyZ2n+3gQoD5c/xOaIbp5
	JGhyowmwkg+yMoVogyoBVhCXGJL37+Igd2aYmr1Ax8MBYE3nPm3rsrQKVndLb08D0gzKfyVHz7l
	1PdmmSBm7qD5npC8576OC0pojdIUXSEa2CGtbUD6NXXHxcU=
X-Received: by 2002:aa7:c0d8:0:b0:6b5:6b89:e3b0 with SMTP id 4fb4d7f45d1cf-6ba1fc3dcfamr11494812a12.19.1795617688216;
        Wed, 25 Nov 2026 06:41:28 -0800 (PST)
Received: from localhost.localdomain ([195.155.168.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1ca4ff7bsm1437512a12.8.2026.11.25.06.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:41:27 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: add samsung,s2mu106-fuelgauge
Date: Wed, 25 Nov 2026 17:41:25 +0300
Message-ID: <20261125144125.3951425-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123-hot-stallion-of-fascination-eaa83c@quoll>
References: <20261117104328.1176951-1-tadilhusrev@gmail.com> <20261117104328.1176951-2-tadilhusrev@gmail.com> <20261123-hot-stallion-of-fascination-eaa83c@quoll>
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

On Mon, Nov 23, 2026 at 01:29:03PM +0100, Krzysztof Kozlowski wrote:
> Exactly the same as s2mu005. I do not understand why do you need a new
> binding file and no one suggested that.

There is no good reason for it. I'll drop this binding and add
samsung,s2mu106-fuel-gauge to the enum in samsung,s2mu005-fuel-gauge.yaml
instead, without a fallback.

I'll also cut the commit message down to what differs between the two
chips.

Adil
