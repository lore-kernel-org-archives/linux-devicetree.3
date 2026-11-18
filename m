Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028162;
	b=I6oHO2ybWxsWnDcawYoagZ3zaRRUm8ElnEw47pvCN1GqzM3Ss/jIsKDqMKeY6o1a24bW
	 UeaftaSiFUGwjF/89iQyaF1GtpSnfMduH7KgSmPVLOD3qpXp5k2Ge97Q+a6/kDXPF6JgQ
	 an33QZcS8NN0vzuYQLaD/s5ian/DySwTsnPhEz0anXsPGma43ZmkP39v8cOxy2BWRUdHA
	 UWgLgukevHhkM81QGX5Om1EUh5sqGj7ipOitSICzdFuqPlh/c5qJ6J+eRtJo4WlFA/DBN
	 9QQM/3zHyRvktpcmCsdLcF7q0ihiPd/eEVchRvJNzlAS/y6WQa5eq7pVQOUFQgRm9Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
	b=p+pZNbDpMI1MuDPeNZepeRFtQ2Jl8eUQaMe+VJroaZxRtM2hyrhNbPJl/uv6DLPQrA9O
	 ZWEBAJdz4zZAzbrNmiLFMDWhHLdtUOy0tecUU/+d4IoM5f9989dvrTuk8WTV3ka7FybYu
	 9eJUZkIcoeZSfXcQ1BmSdsUvpDkonN428DDBBQ6/xg4/xAp+om80sHa0jlXw8C2sAArjV
	 Wb3kRMSOWH2IoW1veiBvnrmy1YjQJlQweb4ZA8miX8i2sQvIhk2ZT0JcQRrq+B7HkYyq8
	 Zy0kesqeu91e9Aft7cfXlzFjEVBb3s/XGmzOI4N5YBXIsIo2u+A8S/QSt/JlNgXjRZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BJ16PKhA;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CCB606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16CCB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BJ16PKhA
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-497614c95f0so882295f8f.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795028160; x=1795632960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
        b=BJ16PKhARz4s2Bmx4dHGIkvXvP+ysfTMKh0Pb344yReW5izVeLzwpE11JY2MQmmdzb
         D9fOusFnIy34U/SBJBkrm8v/779ctX/QEdyEVxeDl5lbwwJOrIsdvLR1emWtqoA4d7ks
         yNe7dg66UC/RcnoaLgcildHFaZW3E8TViBGRxsUAxu6Rf56hBQrrep+xTKR1lSHbhgKN
         ADuob+YUfULgVnmm9JCfSXjuoo3yB2xjUQsol+gwVnYS+QhKmNhKlwDWaPUnSQUPc9hp
         tmWpqhDkDWGKT+Ju0dGI88hIPlrekzQQ5XOL0HLCzCnYOZf1CLWnMQG7F89+4VezUXCV
         nuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028160; x=1795632960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
        b=0Frkvqmj/zz4fXg+IY4YFjlHrG5aIVOPez5S+IiMaCxVCT13kIRkhL3Mzs3K1VgAWf
         qOfXxSi26EH8uPSLE1YCSrZDwymdcLGA78AFVEhGOZkCs6R3M9HIAEp4GUSovQVecGeV
         EpRiohpk0C/T9YaEH8WE84G0gHBACcBBCB1k2BwK8JE/eaAzYCXmc1+8SNdUQZV8i7kH
         /9eSx+VwO/CMZXxTnZO7u/tYCYyT3Rk4PcmsO8YUZxW+5rRt0osmctgPAqSbXHG92GTE
         Q0jMIKVIk9747cd/K194ZlSjP0GHerwCwVCJydv0nDYovztRI4GmQHGP6DZQiTQ3hqpY
         RdcQ==
X-Forwarded-Encrypted: i=1; AL+hErFEr60rYm0fmYgortSWanpf/UBrYI/NM/SLY0ZfpUUhNvLmlLXwlAQQ2qqPo/Y1/4vkKUVGO4lV6Hj7@vger.kernel.org
X-Gm-Message-State: APuU4Z8+dRJb8q/iEBn5ahpFy44ivmkBfevqHVyXoZ0jYUu70+RMP7kj
	ufw42pyYye35U+5BWfdngz6Hmh8n9GPHYP8HQUif/m1aWKlvtD3URML6hV/hNyr1mxM=
X-Gm-Gg: AZFdTZc+sKRFqkzzd64IWzjS6qS35TXRfrRYq4qKH34kXJbmDEegsxt+D4YjqQwu/l2
	N0WHRYhAd+ROCl40ir9wyMDl9aJ0F6Ot5sIEV9CN6zqWZ6RSBsaC7jT/6qcqty0qrnNyLJqNldy
	x5UrPqDSPqDIFE2zfz0w9/TVXVgUIkHy1IT4Omm+9+yPiqd40PndT//SATWqbG4E1boY9TNQDvR
	X+rA+FohjKKYnoChu4tJ3Q/rTNGf/O0PNq2+pe3xjikE5PpBQ8aYKlU7EjE49ocUFbtKPMDAEvh
	WkSCB+pA0n+7LqP4qXMyYlSFMlTHUymTJswPy6l5QCuTyO0DpmNPErdiXPLCQQoot4hYiOHmN5N
	no5/fKW2np93mjHrxQ7tm/SWTMQnlVJNdFWX2m1MkCf88W99oQM9PYicMiAfhOggkHAakUqr7ru
	qWDzVVtSCDIeQtMm8UNaPkxBBY9PCcmx7wNfAHKkvmJw086UVWLwkC9uNkAABSASjIGluB3i1jw
	6Yoo1xc87IEibJyCXgnzxo91PuQlgLhXLJF6gf6mdFKeydH8wHZsfCjziTzzC/RXqcAcgaWvVbm
	lz7ea2xztM0G/sjvckRVr2UEO0znGkFazjTqurJ2ppgHD49g17Rqvx7xpKxN/4miuuECQFehFfZ
	Ph796vZ5uYH1Y1eK1QfjARkAYACFElqd1dnKpJSsdWURXxQ==
X-Received: by 2002:a05:6000:4914:b0:491:8462:20cc with SMTP id ffacd0b85a97d-4a63ac6b48emr8023295f8f.37.1795028160455;
        Wed, 18 Nov 2026 10:56:00 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm6144436f8f.37.2026.11.18.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:56:00 -0800 (PST)
Date: Wed, 18 Nov 2026 19:55:58 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] clk: amlogic: Add S7 peripherals clock controller
 driver
Message-ID: <av3zyakd8-7QfIk3@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-7-7d501d62621f@baylibre.com>
 <179499607256.413320.17594110166305844754.b4-review@b4>
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
In-Reply-To: <179499607256.413320.17594110166305844754.b4-review@b4>

On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > The S7 peripheral clock tree is derived from S4, but its clock sources
> > and routing differ.
> > 
> > Add support for the S7 controller so peripheral drivers can obtain
> > and manage their clocks through the common clock framework.

[...]
> > +static const struct clk_parent_data s7_sys_pclk_parents = { .hw = &s7_sys_clk.hw };
> > +
> > +#define S7_SYS_PCLK(_name, _reg, _bit, _flags) \
> > +	MESON_PCLK(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, _flags)
> > +
> > +#define S7_SYS_PCLK_RO(_name, _reg, _bit) \
> > +	MESON_PCLK_RO(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, 0)
> > +
> > +/* Named ddr in S4 and in older datasheets: the Amlogic bus to AXI bridge clock */
> 
> ... is a driver claiming it ? If not are you OK with it getting disabled ?

Not yet. Amlogic told me it gates the AXI data path of Ethernet, audio
and the AUCPU, so those drivers will have to claim it when they get
enabled on S7 (none of them is in the S7 DT yet).

> Did you test with or without clk_ignore_unused ?

And yes, I tested both ways: without clk_ignore_unused it's disabled at
late boot and the board keeps working.

Cheers,

--
Carlo Caione
