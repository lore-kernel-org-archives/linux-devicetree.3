Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2902E296BD3
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882212; cv=none; b=tBmg1UNsdjMg/WeMcA/3CV4mHOmSm8KaJmyudG4J7VUab/PdFJPxYkIuZkYL/0MrurdrYzely/niA4/AhG9sLCisBoh9gc4vgbvAhKKDsG2+gs3qMxJWMd92pEuXgxJ9LCAARP62hmM9ULD7CYImJ6zq9XkqkezAAkru/qoOwVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882212; c=relaxed/simple;
	bh=i55soKzyISPt6SeH7DsGUlC8BZVaYjKOR1DJ+cOhbME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vk3IHSVNxK2B3FHCUfhcH2woodS/motgPDZZSPHj07nXdrjscm1Dl+3gmzjb5VeV0AwxRM5H9HW9Mz6g4+pAZydrgoz2dPt4+W7IBrdENvNCOQaBRv6wsp5VR+x80cs2ck0ePMoQQ0cL1Le5ApVhBrkSWvJHxTEM19f+gPA8Jic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E0XZ3erw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g2v8UYLc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E0XZ3erw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g2v8UYLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774882210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ViefYB5GshkeJmDcmhUA4DB9x0JbvREJG28E0kRCIFY=;
	b=E0XZ3erw/OzDo80T8W6Qhvlyd91Ee010KULiyV0E7IeKMwJR0BSs7tn5h+poxjz8heJH1/
	vYqOQThrZQST9g75bMKtYf0h6bHk0I5pkPzNrMPfdLyzeyfnwAMgnIAc1cXJFyHjs63BQw
	l8Q9HZTZKeTUXzKw6d1ayD3RSFG1vtk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-KN8eWCecPx-JNgVrTzkp-w-1; Mon, 30 Mar 2026 10:50:08 -0400
X-MC-Unique: KN8eWCecPx-JNgVrTzkp-w-1
X-Mimecast-MFC-AGG-ID: KN8eWCecPx-JNgVrTzkp-w_1774882208
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso62797341cf.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774882208; x=1775487008; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViefYB5GshkeJmDcmhUA4DB9x0JbvREJG28E0kRCIFY=;
        b=g2v8UYLc+5lUZCbeGy+3NZsYH3sOytXJMQ2BqC71X0KlpwQqOxvncJN2bH0EruVysw
         pyhHNYkzghXlYdI+hm8+GSFgMDGQaoiKLxPP0SjpKwqBZkMBSijkStHADsoiSzxcXuuD
         5VOSaFjOgdcqMBJFOcrywA0p8Oj+D9TSerTqHgkvjg+px1UZJLeynPaRE7HT+v/fA61E
         55WUkjRq8oZjxQ9ch+HAwvhuC1u932bN6sMwcyxVyXBUcVN0aL4AtddDhJZ+EEMUIBFJ
         4tzjfAk7fQuRLaHYDPwFt6wdKn1Jo7Ngz2hbtHq29Bg7l4oYGQBbkek0jG7J7WB/+Y85
         Im/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882208; x=1775487008;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ViefYB5GshkeJmDcmhUA4DB9x0JbvREJG28E0kRCIFY=;
        b=Oe0OQbILjLRPnI7ZFaH480E2btVle4Q40HT0b2gPCxxhsxZSmVaJTG1JFOfebb4gQ0
         So2c5tLvYZl0ucID0o9jxW8G3i2zcpBt66KtP8mTgGa/kp8z+iH1OSWA1dsOuPspPD5g
         uuCZKxoclrJmw7Xm9kYPioaP6/dA/XypX76k/RQZ8SJlLTW6LqT1hbDmwQh1Tk22Es/X
         pdHQ7dN1UbbvY6x6FJDG7R0xZYWXrlF7gLv6NBnP9c8Q8+Cw1fNk02onNgf8xD5HNnwh
         yD12iFf1aQWPwyEOp82B/iynIdI67pRkUl4DG1FrAHhcpoJNtNrhE9OGDoxwg9qd/IT5
         QKKw==
X-Forwarded-Encrypted: i=1; AJvYcCUbaWTSUW902ghY6fOVOn0J9GJUABWo0piAi6Vocm6NZAM6SKHXXpllW+HPbHwDLgu2z67FlbtCuIBj@vger.kernel.org
X-Gm-Message-State: AOJu0YxHUlsGrwrHvo1h4pDL38PAMkn+zGJhYXwA4zDHWAl2RG/E7wAf
	swI/+61gL8V1SWrSMWIAJtrKB07Ke6DUzDVO6SJxh4PSjZEfoVbLI1jmHFQru8oxHchjj8rMyBt
	mHNBkhC4VHFZrAyC0nrLF881KTzxezTQAq0zs2iw5zojSXNoUdVnQRZGTtOt+cck=
X-Gm-Gg: ATEYQzzD2lNd16EAhYKO4gmabx1Nwppid/0OPiYcetHquekL6Irv41Q8SBxfTWlJs1n
	YIL7BzxPKegRPbe7SDOmSt82dSkoIbX6iXamhMBRc0MwDt0KJrMeXskWGVHesVyvV7qjQY3yLqS
	TD4bfRKwVoCsSKMleAv0INTRbgtvoGz7leAv9w9EeWt2IQxMBUEoLBhbes+vFtdA2lgpAyHQiqG
	0sZgnwK4hTwIgMjy7vVgNwGVCfknTTDas+lSTnf3sjEkbDPaNyPkokoclSrs4LUQf5rMcZzp8Pw
	p1vRBzAQgkCoKJQj/7z/M88hEzAdVzP7nvvjSJ1fzWgBh8VU/OGxXpyWpvwiVReLc6zs0XK+TEC
	LqBGsCwZK+YuT0w48U/AhWdSRYxJPwUCIBiB9IW469iIrzBlmuIJGTZ2Q
X-Received: by 2002:ac8:5744:0:b0:509:45fc:c88c with SMTP id d75a77b69052e-50ba3836f51mr188099651cf.19.1774882207689;
        Mon, 30 Mar 2026 07:50:07 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:509:45fc:c88c with SMTP id d75a77b69052e-50ba3836f51mr188098161cf.19.1774882206754;
        Mon, 30 Mar 2026 07:50:06 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2e3ed5csm72731181cf.27.2026.03.30.07.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:50:06 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:50:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 08/16] clk: Improve a couple of comments
Message-ID: <acqNnIJl2PxEcxj3@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-8-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-8-5e6ff7853994@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Fri, Mar 27, 2026 at 09:09:30PM +0100, Miquel Raynal (Schneider Electric) wrote:
> Avoid mentioning the function names directly in the comments, it makes
> them easily out of sync with the rest of the code. Use a more generic
> wording.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

