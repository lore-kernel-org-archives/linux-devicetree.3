Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257966;
	b=sjEm28EYD/BidHEZD7+r5hmCWBfyKgm+j+zjNGVt4FgpzhmtvBRbLQCwzuFvCY7J6F/8
	 NihF6yFAr3WsjcPDqqq/bawmTTSBalCbMEkKlGJyLF87Lb5TKtLbR1e8FhqhznOjHN7A3
	 pUWCzbNTBFxefKB41wfYwIxsj758Y3H/a3FUJhz5aw9zQ3ziSxy5+X/FkoF/LFvfdHx2n
	 I/sdNeteGe9U55SHA3MLajYadvfILUVDLE1FAmg7ssFvfLZEdeBTMxsqwfkjwqy/bYGkq
	 sx1K3klftmEwMCWGUTnSUG4tp3a4SzCaC9c9ccoTXZCq5ew0/PnRBJQDtKsoZmJvIkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
	b=o6WFx6brv0Dyw1fEBS+ssd1YfQLLoasKvNLnFVb7ygECDO/4xZXSOrN1Ctr3aTqBnhhU
	 ZYQypp9ZrtFo+DFNvxEuxQtXk98PBzZWP2QtH+TuNjOcBJQ/8W9V1AfF3Dt44JV4PMuHE
	 2+CD+B96y9l2kse+Kj1TfPUmgvbv/Tzo7OaAFRtnB/KvNFphWfgRcicaUWa48xWgkHMb5
	 WRGTV6I6iQ5uDBMkUxywnWfjiEAEq4hFYIP/QkYtTv0OQr1AN3+ibaKGgB2lImoET6DR3
	 wcBiCdXV7T/dUXTzBo5nYFyD8f/xyAAYNLuiR5/2EzMiOw+h6jcr9JA7HMEG4TuSQwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="HrReEgn/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B526B606A33D
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 20:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B526B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HrReEgn/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso14383745e9.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794257964; x=1794862764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
        b=HrReEgn/ryRpnI97jiAPLAbpUyzbD8Nu1QgEKRMLKm3Qb9ghk0pVkvKJqnZjkoU/Mo
         pI7B2kT8G+t2yqczEFjSQH5wI4AQmm/2b2SNkvpGI7f+Cw/e/8BJpkvzYyqvHpwENrVL
         54vgxTEAAHwMYbYL6qJ4Jvl2336kdXAhch1ZkHpOto59XHgBphOWxjXbsQcNCfMkSNJq
         KD5v3wggFRgjUPe7ETFdhPD7+9/HwZ/UWBZDABdnZIJlrbvUB1eNJuaNGnpOHhEygA/z
         A/eN0sdKmk+xmiRSg7aikhyolCtQwuYCFPruQWa1BsXuFjh3k3DVwQ7lRewSIiFiAP4A
         Y2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257964; x=1794862764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
        b=jcuk4ibPh1OvpGk7sCGcVA6NnV5DdbhZLrs/8yqdd8FdwWAs3+Km8c8sTIAmMx1YT0
         Vwx3KrVGWfwS1K8FeQofL2QYBFGgNIAKvebGxZgv1p57pr3w98f+ksm2AsNI/PI6r8A4
         o7fqp8DPXeoZa7F7lhB8mZS4Fxz1TETsfuG/LB++t1Y9rVevIh4/Sj+miC9BU8U57o6c
         2FlV5MVBxbvUn6y/jOMcmQuMXPDnM/4viUYS8pUmE7yBrnfDuq5SloCvP+2QRl/QV0zB
         5vZWmBOR+xMpLSJf/S4ZtwFuC3ZOV+UXWvHgh+t+pnuazhTaPtuZmKecmRo7dRttHVpV
         W+ZA==
X-Forwarded-Encrypted: i=1; AL+hErFgQBkeqZkjlWGU2syuAPjmQdy4RjQqUTgdKFiUwdniX02NdLtUuzoDEdue1qZnsXiide4WXFBHgLPb@vger.kernel.org
X-Gm-Message-State: APuU4Z9o5aOGfrV4OpAPu8YSMUXlj3oh1q4J9X79A2OJTpQlsd00qGxZ
	+zXUKrd8pV/pDvKgSeA2vk9zVbyVjSo2sNjkL6aMztlHgMM1Z08ogzKxWlWlm2mlHkg=
X-Gm-Gg: AYBFou3P5qM85vjwstCxSL1+izXwG6yFKKCnbh3H3/cAeVi2yqzp4eupkFR+o5VW4R8
	vCiRoT/Kmj4jY6Zu+4Fvqb77XioL6AbuWXyMG5JPm4IWsy1dMlIoIdDTZBymxap//PHnaEGGycg
	sUCcPTSQiWFTPvbBmurnF7UrEqQ1w+KJSouAtkHgXoApHXjQ7k1BhXnwm6xpSfSvJR76yVxrmV5
	HiVDxd4pMATlqECHsxsHNsFg7wJqJwo5wLWN2SvDwLXv6d1gZ1rC+nWDyRraeis2gxo/ssTKZW6
	X7oBVxfJo2BO/9CUnpuEu9CkTy4ug0mDNWWnmNRx59NqnqPjQ42MUG5Gxu7CNZ+hexLesQkchny
	1RZmVsHXtKRqQTrFnhTeWAbuxM5jmQViGdwwPAtbR7iuF0MURi+IzHkESjVFa8qGMn2h5sTXnA3
	kN3mbnnAahjT0WpJJB9jMadHJxtqlto8NGCaLqCGS1DmFq/DYOB1NckYqhOosb8kLY5tT8oC7ZG
	Oazm6S/+lxlvzDd4dc+gKDTUwQZbxRmKljZdwBincMhq2/bGL1wwkob0cNGuSVaw1Z76YjtuTIa
	sZWYPu43O5o0YyvrbPZUlT3QSxCCd6t0vAYRLcoHanP9uBuBTiU25Vw32rbzn8nYIzd7WAOT6cq
	eQJJgB6s8Nn9ZDu05X154KUNZSeB+mTlFLEu3ucNyU+kraA==
X-Received: by 2002:a05:600c:3d96:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ba02347dc6mr6849605e9.17.1794257964075;
        Mon, 09 Nov 2026 12:59:24 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c99bsm1081150f8f.7.2026.11.09.12.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:59:23 -0800 (PST)
Date: Mon, 9 Nov 2026 21:59:22 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <avIv2GfXHuOPWJzC@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
 <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
 <20261109-stature-splicing-a146b4cfaad4@spud>
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
In-Reply-To: <20261109-stature-splicing-a146b4cfaad4@spud>

On Mon, Nov 09, 2026 at 20:00:56 +0100, Conor Dooley wrote:

> The "document" in this case is the source code of the firmware then.
> The info might not be printed in the TRM, but it is determined by
> something, Carlo had to get the numbers from somewhere?

Yes, I got the IDs by enumerating the clocks exposed by the running
S7 firmware, logging their IDs and names through the Linux SCMI clock
driver (using a vendor provided firmware and kernel of course).

And yes, the DT cell is the firmware's SCMI ID, passed through
without translation. Renumbering these definitions would break that
correspondence indeed.

Cheers,

--
Carlo Caione
