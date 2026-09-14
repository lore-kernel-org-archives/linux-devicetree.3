Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18D48D89B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404805; cv=none; b=ZlxhRgl99l6DgdQ1+siCCPuZ0p7N8rYgLl2PqqXEkJ67YxA66XkBOqKO6eUNneV6WBEgDoc90a5VTQrgENNTeSScJOIAQs9z1V8H1k3aslSzS4bF1MiFnjeD68TtJMf8fTzOKU3Ja3iG2DsgAixaYqBi7Zg5OKC17s5AxGax6O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404805; c=relaxed/simple;
	bh=6TMcO2Y5Kw0EVrvk20oE12w5dXKJk7zNaPDpg06x4co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwHGqJeeknuQOuRwVGzFDkENIMlkigq7C46CpOs+RgdHlCI+6oFuK+E5RLPmTvFbzT6L8hU6uGvi290j7JaSi7kZgAZ7rs2l572JgKrvSp5Jbrj9guwkM1/udEMp6XGc6WFTRrUm24/8CL1o73hPrh0aUGCepBa3gkjYPZDwymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=tmAPQT97; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="tmAPQT97"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c29c49a977aso47170166b.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789404802; x=1790009602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lumnmvwB9uVaRviDsmnKgFO+t5iIy+oIBHk/e0BQmpM=;
        b=tmAPQT97RXipwx22SVY7eilw11ufAShLltIZBxzpdRu+Rb6Vx4ql15HQftqIgUzmR/
         AogICVciFlY4KDFhNP9bsNreAJvnLfIVyUD/0GnABbD+fznHAIHwnP6GXfBRrWqRWh6f
         seLuNzPcZxmSd6ecEhjUwnYLlpvnT2jIPkATA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789404802; x=1790009602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lumnmvwB9uVaRviDsmnKgFO+t5iIy+oIBHk/e0BQmpM=;
        b=DtRPiI3hIPScDdTIwa/C427sgRfEmGMJESFzToNoTKFxh+H7x7rg4Ss2wXJt3D2Mca
         bXheDMMw3AV1oGZcSVSHT6Fr0/Z9MX8/PjeHM3CDCIgIWzbZ0NrRP80PGnvpA3h3CttJ
         0IlR/chNKS4p9cYWQBKz4PCnFNsdkhFmOdhia06WNXoxQjYPh7WtcCzBuOMzhuYC0b9G
         LC9/PIEtt3f4q/K64dUCwFBbpXbfNg2Fauo3ycdaisfCAVydCUAIUa3B9v7BZvwwKIZX
         +C+YjdAjzXGYItdGPQeWeDWfOszEMFhSkg4Vkj0nSmjEuyuQt0jQAr+O00Pa3Dbx8ZKg
         NnHg==
X-Forwarded-Encrypted: i=1; AKwUvBzXpdjs4DAzDdksyDf5PMuydQ10LKJ4McEQEAoG5x6G1w4Uv9ai88lMjX0A94qoG8T+JizJqoF6QI10@vger.kernel.org
X-Gm-Message-State: AFuF++l1hj9sH2G2OiY0p2fjwkGeAR6DUnMwFr2G81HIW+VtLO44ZBND
	KgIhm7DkOTpry3lu/xFl/kkyo90a+l2MwAZzqmd2JBg8zo/VjApK5X3/AEosL3Culig=
X-Gm-Gg: AYBFou0LCTs6u8cwHVyXFKtmdNs18fAyWUNBdeNow2qvhppQExuP/UEZstiN/fmz9Xg
	0Ns4Yb6tu/r3NeiBMXAK2RoA4cuQrY+YWrjPlRDVo6P36AjWB1kKwOkBQbSW0kAxE+CGp84j+RS
	8UScMOa5zHLC7/XN/kccRei8TtXUqJE69xepydwPnTZ5sKTMIpL8hGWtB55u+ZIoXoAgrSLvxdx
	XvtnYE99Gx3uWZh7m+tHTGq4D/9z+9ORdZg1B/IMb10OYyDjFVlK9cwPxw3LJ39/SoO7kEj75TM
	n8XPzl/ZUu9wxYZKOvUlAcp2hhlvEKbJfEAFpm2fY6YwOnKqTlajTM2tbMyDGfc8cjRcfe/3e6L
	BPH9FNl6VqUgB7ENP+f/B94gN3j/Mw3OKf0oTtXeB0GMsCZXxCtFbbcVAf/ZE8t7rBTuV6VpfyZ
	YM8jLLT/5dlQ2TTkCZUkY4YJGP9I9dp635t2MVdRZUdKYpOU1nHPuvpUz1K7MLUgMo+tD1mti/W
	CTrsHoteoEsAXCaow==
X-Received: by 2002:a17:907:9616:b0:c29:349e:7c1d with SMTP id a640c23a62f3a-c29b879a34fmr217563666b.49.1789404801836;
        Mon, 14 Sep 2026 09:53:21 -0700 (PDT)
Received: from cabron.k.g ([95.111.117.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm467264566b.6.2026.09.14.09.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:53:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 19:53:18 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260914165318.GA10966@cabron.k.g>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
 <20260911150755.2803736-3-petko.manolov@konsulko.com>
 <20260913-perky-resolute-badger-6c5e96@quoll>
 <20260913133214.GF20345@cabron.k.g>
 <565e4f26-69c3-4129-b4f1-29d67c381591@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565e4f26-69c3-4129-b4f1-29d67c381591@kernel.org>

On 26-09-13 16:20:54, Krzysztof Kozlowski wrote:
> On 13/09/2026 15:32, Petko Manolov wrote:
> > On 26-09-13 11:18:16, Krzysztof Kozlowski wrote:
> >> On Fri, Sep 11, 2026 at 06:07:53PM +0300, Petko Manolov wrote:
> >>> Add DT compatible string for Draeger's M48 CPU Module, an i.MX6
> >>> based board.
> >>
> >> Sashiko comment is valid.
> > 
> > Sashiko doesn't know that this is indeed an i.MX6q board with the Altera FPGA as
> > a separate module, that is secondary to the NXP SoC.
> > 
> > What do you want me to put in the commit message so that everyone is happy?
> 
> Your commit msgs for bindings and DTS should explain the hardware and with the
> current explanation this is just so incomplete that basically wrong. i.mx6 is

Incomplete - yes, but who cares.  The only consumer is Draeger and they know
better than anyone else what the board looks like and what it is for.

Wrong - how?

> completely different vendor. Altera FPGA does not make it Altera SoCFPGA,
> these are two different things. If Linux runs on iMX6, then what are you
> describing here? DTS which never is going to be loaded because there is no
> SocFPGA?

I'm no Draeger employee, but i've been told that both the i.MX6 and the FPGA are
running Linux (both chips are on the same physical board) and are monitoring
each other's health.  Apart from doing whatever whatever their primary task is.
Whichever fails, the other guy takes over on the fly. This is a medical device
so full redundancy is a must.

So, again and in order to save everyone's time, please elaborate (preferably
with an existing example) whatever it is that you expect to see in the cover
letter and the commit messages.


		Petko
