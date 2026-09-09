Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496113101D4
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952617; cv=none; b=tT1qZJVolLOcCaV8vwUubDqs6pQ0/FlwqSXnDkLcrn2Ah0L4kfhowhqXBUVg06Y8AZRXoYOm+/ia9mbjSuIiUXgzJrKW9zsgXyw+avlgIHJiQBa5JHNsJq3QgrJWrlWjvMqDFfiddNdiF9w3geoZAKoE/CvH8qKga4IbDIgHfjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952617; c=relaxed/simple;
	bh=H7Y5oWnq4NVb53d7SYqX7qhoQBIzX6DB3CcqvMEt9GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqbWvXYNDe6j6vDlnc348klGsXjXldKVpKMmt5aQztMYebgMeK6vFiQu15faTk+a+rh0PwN+AdLEduOFm1S09GX6Wt3oNmdyU5U7mHrJ+h1PJkqfa/vP3A3skF+TP0JPA87s0qwDNE/Hb2qeGBxl5vbPTEs5y6GhOKRo0HmEVMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=gRglnTWw; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="gRglnTWw"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c25420fe973so1014304866b.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788952613; x=1789557413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8U9A3xq0Qsb4mW1WIPrXZkTSYo7G+pCHz7yNI6aFj7U=;
        b=gRglnTWw5vv9ekNY5TDRy10Hg861FSUqA+mouhvkgoY9OciRLkMy7W7FGaOmuxobSF
         92xht3z9c9hCI6T8fCEZQWq2K+wemDY60Z8ZG0yBNMWm4VBnh7VAt5bgjXMih5zskyjb
         QqevOSZ6bB5XllSgmwwIPU/mqwugh1Sn6TJ1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952613; x=1789557413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8U9A3xq0Qsb4mW1WIPrXZkTSYo7G+pCHz7yNI6aFj7U=;
        b=XuDEwu5WrJGZp7ZC+Gcv4QNO5DcqOZ7UY+5zwj+g3m/mOoU487BWY1pRz+6impwJ7K
         gX4I9LBNZNbWpJXGRnMvV+OSialYKtSs6zZBcG7byQAK6ssYmbE1KHejJXh9m1Onu4dd
         AKusIli2imNAvMWsxJypauqvFgnyBGblV9J7hlm6jHg/gRLwzkkHfiXdxTiQK1dwy4aq
         ARSL1F6mQZpOPKp5CZg8LTz9VrM5bf5onTVteDMKfyt2kMfxiVlGX9SVqWKMc4CDUpH/
         QRiJTwnGqH3HHR3gHMg+uvAu6p/rmCnWpSocdFuaN7ff4KGqn3z4trTkxC6ZSf2XoRP2
         scbA==
X-Forwarded-Encrypted: i=1; AKwUvBzuWh3E0GLpNEqx1U/6QVo7CB69gj17FvMdIhaP6vVcjOQqY1HcW7UYmUTUTGO+JJszHh5c9PzKf2qi@vger.kernel.org
X-Gm-Message-State: AFuF++lnZXbfxf1o54hygrbrzT1cT5eB3Z0CpEXXWMf9AaGrKimH4jSf
	oapgMPdOlRrUBr+H+si4hcg6VZ5ZjIgN2T2AEE3gtpNOJ5qyPWT16rmlYO6cKq3JOJg=
X-Gm-Gg: AYBFou1m3vuWxCrPUpwBGtR9OUsOebIZZ8smZER8qt6cSJ9g09xsHTSo9Dg22iGZpx7
	IBppBeI6uIUfFoRSugFanjIqlO6taRLnIwVaiRw2SJErcBtF9r/JvW9GbtYz2hEFHzAU4YzbS2Q
	CVIYhYyNwIc9y2OMTV9cioJ4xaUXkk9mqs+6SKYwGvNfToIlOW/67umdOsIXd/mkL/mwi/jyAx2
	ahM86rbzsoZCT7l+WIS7TuDTh0J31meyx2nxr+QOMdgtOU38aTB3/Q5Dr28RpMXtMon0pCO85/q
	PzMnY+kHwSMSwxB2WyIx0TgPOz/YZ7mZAfvhheYv6TeQZS5CVSWymkW3M8xhh5W1mJ+D1Fq6hFe
	xQh27GrmMqzevk7Nqvv5QVL5K401v6vJtYYJG8DIiKJ5ymohINeltugbfZ9X76937Hzc1GKEolG
	F55c0aKuBfbSowFyoDeH2A/uqKxsnAu1/gSNEoApd8PBzYqnvLyJPKetX+XkXanLEle4LcRuhD8
	rs9aUjIDa6LQRwKclp+K9o7XoXP6CN58w==
X-Received: by 2002:a17:907:8b99:b0:c29:1801:4487 with SMTP id a640c23a62f3a-c2918017506mr401559966b.30.1788952613134;
        Wed, 09 Sep 2026 04:16:53 -0700 (PDT)
Received: from carbon.k.g (79-100-31-116.ip.btc-net.bg. [79.100.31.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293d20e257sm28545166b.57.2026.09.09.04.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:16:52 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:16:51 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v2 1/1] ARM: dts: draeger: Add socfpga devicetree for
 Draeger's M48 board.
Message-ID: <20260909111651.GA23020@carbon.k.g>
References: <20260908111011.960876-1-petko.manolov@konsulko.com>
 <20260908111011.960876-2-petko.manolov@konsulko.com>
 <3dbe92ee-805f-496d-9a7d-94c837e674b5@kernel.org>
 <20260909100709.GA20988@carbon.k.g>
 <fdb26816-5efd-4adc-8d90-fa29a3be1dc3@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdb26816-5efd-4adc-8d90-fa29a3be1dc3@kernel.org>

On 26-09-09 12:14:34, Krzysztof Kozlowski wrote:
> 
> And git log tells...? Anyway, pre-existing code is a poor argument why code
> should be added.

OK, dropping the earlyprintk argument...


		Petko
