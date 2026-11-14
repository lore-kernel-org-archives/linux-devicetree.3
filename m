Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645015;
	b=WoCckeyD1qvIdI8HkiEqzXywjkdcBQKfNH9iiL1o62V9rHA1G2y2022ksKplq3x/AHTS
	 JHcZWJDGze3rCiqLanf89Ci6PaXXjZIe3Dqk3euMwpH+MkHwQ7Fc5VqCo7STYTrD4gY8z
	 fj7Tq07qi5qmKnono7Di0lfLeRrzK2JiwnWXvSvs9LWAw+0jCCFLuwUGI9St0VwIMGZgl
	 mzVzn2USxfWzg9xWUAoktH6v38BsceVT0sBi6FiM3wYIpzrJB3SM2A1iJfEf8hXCNP09M
	 IZ0WZ0EIb9nIFVOORX6wNScAh3aVry1v0o34uCd17SzsNaLijUQC5fnpQDA0uC8MFhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
	b=j+jzxWWHNVEgqQQ5Rjd5fLPS544ZMVMtKrbmOdchp0xH4OWSbcCX3fdssLraImbJDEI6
	 e2fzl12EZn35HvtdUjf6dul/1XzKVrcRU0m6VSkVsSljdBRU98suF/a4XjezAOLUXyyAr
	 aG33oXlmgo+6XpD5PzHM59QN3o1lFlKLVkx2vDJ9RVnAKSdanArP1nNHRTkAZvNEo9Sty
	 hqgconTF1xOm/mFGVQ4XR+oPtopyWh98aFqYW8Q6VWkFnalOulC5UZ6Ow9t9spM4OGn4l
	 6MBX0zr3jejsvtfTVcRyH09mymcYS97m3oxMNdygKZr7twg3YSazVgzw+cwqw18WGkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1cNDI6m;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99314606A880
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99314606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1cNDI6m
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4922dbcee23so780735f8f.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 00:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645013; x=1795249813; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
        b=l1cNDI6maJQghXoN5Bi3lRgzuojcOPv/fbKoo6wB7B4ANNCwdsmC1uDJGvRWeh+8Or
         RczhXvtEz7U2aEfXDHYHHb100veeL5CTuQgmKX1Ahgpy7/Iy+myvw5N8OG46JM7KQZq/
         6yOBt95prApmoYTfLzMf0TpHbSdwEXR1SSUnEvVJBEUHvkhiezddLe0hYD48Q4w7a+a2
         QlLp35R69SBgrBQd/m7x+VYQdUd3iEwhsiSN/8nMNuxExrvVmAJLutWH8lzjW16BN1YT
         brJ3a0A2uD2PK5qVBbtyqFMYT0yheWw30f2Q9bto0taHAZoJ2qihB1W2jC+IeF9Kd15X
         MtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645013; x=1795249813;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
        b=Qup6yoenGiuhuhaFgaqoafAeLtrYW8MogulqVMZqpfIYrpfG7H08dsuPYk2A497GSk
         iHEAFZa6THg5NTnAdGGEDYFu3qyBPkLM44at6jtWpZ4praFq0I2isELfPdyfLT5kNJdu
         Z517M0k7R437Xj0ovxg7ZyjiPUYPHBgD+JR8vVTuB1hExuvG02LeqyW69sHw6sz6MOW9
         VOL9BzjJGKD5/yNf31B+tIdVMKPJc6phGsA6YQKWSO3gOZNJqQJjeUo9ATefZOfLz609
         lhSlzALq1+aC/BCRvV7uVT3wp0fp9TWrlonIuIftMN1j/E99rd8v5qBjbOYwsA5cBs70
         7/ZA==
X-Forwarded-Encrypted: i=1; AL+hErG1T62JeFJm0F4INxOgnU4G6oKoX9Ty7C501iJ10eyBbY4IJ/plsuBZvcWQecGo6/bKcVkI9JAwjnQw@vger.kernel.org
X-Gm-Message-State: APuU4Z9sNQ+t04b1XPYQPp04B5d3/4zFK1bZ6R9Bl7YVe4DlC0LtMc0G
	9CthRzreA2AdHds9wXr0gufnH7L4ozI5Gtac/iJ9T71FzNZX0v3uL/+X
X-Gm-Gg: AYBFou15P/TwVTSKD6rIJLlnsV0J2x7IA77R7d/1m/ysUGAG11VT4w7wYNQVkH2F5Im
	ipBqWa4Hg8rSQjHVVZ1a1FFoLQoAboj9A8cYZqiqJtNcbAdsxgEKISmy9LbyOgM5zElybUos+Ek
	P5Txk0cvdqfNv6ZyftR52YFS4djvZx7ROObnNmA4TCxwdq9gkQqFvldGnqh+pmHxPlo38vYQEU3
	R8j4hex5y4/cN5ldWl98NAN550Dr/686c+aXZW2ULWAWfpCck801IxYoUbplWiVjaCeFJxAx5O6
	WW1itsxX3NvH4WTtOdNYVbMyqSbTbDm0LpmnyFSJVFTNzyCmbJDu/GN/BtxPELV1N1EBMutTFuS
	oImsvsnUXFuZthgG+QYjUYPWbuWzLGjSXsA0e5Az88DKAtFF2HT3kl+EkjcWbRs/YNITa6NUJR1
	eoAYV01JUF7sgG59H22WKSLvz7kFYKk1AoHefEYVVM6HbWKI+IOcqIdHAJnGAyX9aQw4XjyJTX+
	oYO9wbPYpVik+9XaNEaJNz48f0rEF8R5Eo3LcO36eAw2txFluJg
X-Received: by 2002:a5d:64c3:0:b0:490:1358:2265 with SMTP id ffacd0b85a97d-49c72ab09fdmr11144513f8f.34.1794645012869;
        Sat, 14 Nov 2026 00:30:12 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:12 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v4 0/3] arm64: dts: qcom: add device tree for Asus Vivobook 16
 X1607QA
Message-ID: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2NCBvZiB0aGUgc2VyaWVzLCBub3cgc2VudCBhcyBhIGZy
ZXNoIHRocmVhZCAodjMgd2FzIHNlbnQgYXMgcmVwbGllcwppbnNpZGUgdGhlIHYyIHRocmVhZCwg
d2hpY2ggbWFkZSBpdCBlYXN5IHRvIG1pc3MgLSBhcG9sb2dpZXMgZm9yIHRoYXQsCmFuZCBmb3Ig
djIgcmVhY2hpbmcgeW91IHdpdGggdGhlIGNvbW1pdCBkZXNjcmlwdGlvbnMgc3RyaXBwZWQgYnkg
bXkKbWFpbCBzZXR1cDsgdGhlIGNvbW1pdHMgdGhlbXNlbHZlcyB3ZXJlIGFsd2F5cyBjb21wbGV0
ZSkuCgpDaGFuZ2VzIHNpbmNlIHYzOgoKLSBEcm9wcGVkIHRoZSBMUEFTUyBtYWNybyAvIFNvdW5k
V2lyZSBjbG9jay1yZXRyeSBwYXRjaCBmb2xsb3dpbmcKICBNYXJrIEJyb3duJ3MgcmV2aWV3LiBU
aGUgZHJpdmVyIGNvcmUgYWxyZWFkeSByZXRyaWdnZXJzIGRlZmVycmVkCiAgcHJvYmUgd2hlbiBz
dXBwbGllcnMgcmVnaXN0ZXIsIGFuZCBhIGJvdW5kZWQgcmV0cnkgbG9vcCBvcGVuLWNvZGVkCiAg
aW4gZml2ZSBkcml2ZXJzIGlzIG5vdCB0aGUgcmlnaHQgZml4LgotIHNvdW5kd2lyZTogdGhlIGNs
a19wcmVwYXJlX2VuYWJsZSgpIGNoZWNrIG5vdyByZXR1cm5zIElSUV9OT05FIGZyb20KICB0aGUg
aW50ZXJydXB0IGhhbmRsZXIgKHRoZSBzdGF0dXMgaXMgbmVpdGhlciByZWFkIG5vciBjbGVhcmVk
IG9uCiAgdGhhdCBwYXRoKSwgY2FycmllcyBGaXhlczogdGFncywgYW5kIHRoZSBydW50aW1lIHJl
c3VtZSBlcnJvciBwYXRoCiAgcmV0dXJucyB0aGUgZXJyb3Igd2l0aG91dCB1bm1hc2tpbmcgdGhl
IGxldmVsLWhpZ2ggd2FrZSBJUlEuCi0gYXJtNjQvZHRzOiBzdHlsZSBjbGVhbnVwcyAtIHN0YXR1
cyBwcm9wZXJ0aWVzIHBsYWNlZCBsYXN0LAogIGFscGhhYmV0aWNhbCBvcmRlcmluZyBvZiBEQUkt
bGluayBzdWJub2RlcywgY29udGludWF0aW9uIGxpbmVzCiAgYWxpZ25lZCB0byA4LWNvbHVtbiB0
YWJzLCBjaGFzc2lzLXR5cGUgbm8gbG9uZ2VyIGR1cGxpY2F0ZWQgZnJvbQogIHRoZSBzaGFyZWQg
ZHRzaS4KLSBUaGUgYmluZGluZ3MgcGF0Y2ggbm93IHVzZXMgdGhlICJkdC1iaW5kaW5nczogYXJt
OiBxY29tOiIgc3ViamVjdAogIHByZWZpeC4KClNlcmllczoKWzEvM10gZHQtYmluZGluZ3M6IGFy
bTogcWNvbTogZG9jdW1lbnQgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsyLzNdIGFybTY0OiBk
dHM6IHFjb206IGFkZCBkZXZpY2UgdHJlZSBmb3IgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsz
LzNdIHNvdW5kd2lyZTogcWNvbTogY2hlY2sgY2xrX3ByZXBhcmVfZW5hYmxlKCkgcmV0dXJuIHZh
bHVlcwoKQmVzdCByZWdhcmRzLApEYW5pZWwgQ2FydGVyCg==
