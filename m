Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725382;
	b=5Z83mRZ73G5E2WjZmzaN7VVBQdfTfgdY08cVzqfECg2zBxAnyhVRVNmdol3Bo7vFRZCP
	 Xetn+XaliWJgoHLa6EzFHQBuN3+iKWYmTB2OivDgDv5aow1uilIsHWsmtY6lq1fdGqUhf
	 A097XdmJtiT4GenUoXRR3HwjVg9lVBAU/MT9u3bUflCjT/4jJlIHWl9RZa02hn/ynGwOY
	 1hnssIxN+h9XJ9bKZgLHw+8fdLngmqdBVxI/FLdRcMTGnH7KojioQ1X1HUqXVmIALZMKJ
	 s4fjzZ2V16bvZVvwqnCTj8DJv4+2no/jPf2Fhia+5lBCuFG9v04KOX83mh25tPygJYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
	b=vjdbtjvb4MGmO0RZxF8wZIK/hNaGGpMNIpGeUdpgS7zAgYopqW43UyJGmgdiYFjfUHKv
	 NWexcRmAa9lU4a+VXVZq/7HphIfAabvhaV9LdWNJ7NxiCap1ZH+o/FnLiglQVqamu4lXH
	 5XsaSa+2iXIKR346YS9J7a2gViZQtoxnxwAIS0DGLCNEF4b93QYLuArwDjNdIqUZsp+Y4
	 UIjGay7uYtkSsZzUwUFZ7bzjB+UT7Gy/XiKtbijqXGZYXWDVN8Br8IYjne5MsG7zkRfy9
	 PCrgP5IJoY8DOZvIROWKw4bZbpttasPwWEtw7Z0Sk+4UG2mh3yBlGDycbeeO+Lk7SeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KcSGiU1Q;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1098B606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1098B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KcSGiU1Q
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6aa9606ddadso4786686eaf.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725381; x=1796330181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
        b=KcSGiU1QB7OVpyAdNxiW4Op6FUj6A4Cw9xbFu7Wlza2CqO5OS6VBAyfwZ3yH71Jyu2
         jWpaaI0tz/gsx8gOjk6eUgwV/K+u901ltzg2305KJQz0EWcK35W3AWJnWSZcOmy/2lLG
         0fKqWBK9lIlVqLSWMgeL540aQY18nOlnwjjtJJSTjMAFF9pcmJJ2fzu+xFbsrP33vl1R
         6JBTmH09EcDD/286Bs6druFD2EeF89JGcQm6ZdjkJ3QJxB915y8XPhl+6zg044ATYFrE
         1FFlBn6+vPGVJ1wRt4v7IPuzEozk3Hm1gtYxET7MB91fj8hSSJTfAc3I2FVVaQeg5GXi
         t+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725381; x=1796330181;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
        b=1+YmQAZfWiFWXNACe2hjGE4qYgONFFyKlhwvWDRQUBjwkbKODOUO/J2BgEZE1og2l+
         yATcqW8gUtEVuMTdSkreLPogJkZbcr4dcnCyu6nTXNzLGOczlfBeJgiZD5oaM4+ZANp5
         8p2+8tqUrrquN4eLtQ52lZqoFkvKVREWfnyr5kVNFVV8jfIRNVW0xlhBc2HJibGXJrtA
         sx46IeRUblpRC3Xfgs7WQGBzFWVuC+DaXE+ynPpm01LGVio1OG93/zA/0PIDo6UTISUP
         J2gohol0BvFNYpejiDRHsW3424UWZAytEX0T8wu4CDZS5pDwqoX1uideS/7g0aB3/v4m
         3v9Q==
X-Forwarded-Encrypted: i=1; AL+hErHN49dVD2MKJ6zFKiLo6MMVAuPMaHBbJqj0M9RAXqadAJiL8EVk8dnWFz58oHn7sfwRWlpXsD8MFV//@vger.kernel.org
X-Gm-Message-State: APuU4Z8+MDA1Ug2EvWNGLcwvVK0iA83CGWI8BRWyX0MLKcuJgIRUM1Je
	TcHNwvQpqlRBQeGe7/NZYv4N3aVBvWGw/S2bpCXTAb4IWkcUa7DEHfMB
X-Gm-Gg: AZFdTZc3a4XfRsRmQ/a/Q02+wbcHeZkCUAQ/g9oJg5S6oWJJaQSliCX2tIYNcJjSz9v
	17d8WAgnLHk6kFlWD686ffeX/ltYXplzXbpua0PL4cukgqMCJEtj1t79ZR1ahU05APJZ4AJBpnm
	xrGXZbO/ywz5+8ja9nZQlYUxeyqGiCWqjqnR+rEuOkjuPtBV6UrFCTioEKsuFvPgnUOTx1ffHeJ
	V3yqTpoCHNwpWRwRLRWxl+PsaUIL/ymaWQ0b5aW8hFER6O1Mjgpm15kwtlYMb6TJ5L1VP/ZHWpF
	mSe4foWZuTpvB+eoYEUunvQ+/EcHabTKb+9iT+0bgL5miQbvvT+3nbgHYe6TsVx67pKJBSmVW5P
	sZ1Cr1PDP28IhJWwiVA+ZUb9+m7u2Ag+QqWORba9VYSh0wol7ZYxK92CMERG81IVC+GzMJMhmBC
	He03BWi9RULL+d1rU063XHU6EBx2wl6oCWcY9H6F7JhmmmTWIubyk3KbKu9r//vIPpy3PX/Y9LA
	Cce+TXasVKkHdO3CGAyttUZamoIbNSszU5Q9blLLdI3MH9YCXGEN01UsgbJmJSWNt98+roYWcWP
	ZnXXHBX6JojOWdiJYO5owPX1L3I5J+extv7GK1ctDi1gCdxT6kz+KEurV4tYMcABhiZGuhnMuRX
	tCVtc
X-Received: by 2002:a05:6820:1342:b0:71b:3fec:3915 with SMTP id 006d021491bc7-71b3fec4aa6mr17056260eaf.64.1795725380970;
        Thu, 26 Nov 2026 12:36:20 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631670c44dsm15454620a34.0.2026.11.26.12.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:36:20 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Thu, 26 Nov 2026 15:36:18 -0500
Message-ID: <20261125-a733-dt-v4-1-reply2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com> <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
Content-Type: text/plain; charset="us-ascii"
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

> If you respin, can you please add this one as well?

V6 1/5 adds "radxa,cubie-a7z", "allwinner,sun60i-a733" alongside
the A7A and A7S entries.

> could you wait with a potential v6 post until I got that one tested and
> posted? Then you could ideally also include Vinicius' A7Z patch, so that
> we have all in one series, and just need to deal with the dependencies once.

V6 [2] squashes your A7A 1/2 into the common DTSI with your
Co-developed-by and carries your A7A 2/2 DTS unchanged. It also carries
Vinicius's A7Z v2 [1]. Both board patches keep their authors.

[1] https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/20261126-a733-cubie-a7s-dt-v6-0@gmail.com

Thanks,
Enzo
