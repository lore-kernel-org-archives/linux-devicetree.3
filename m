Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A47389DEC
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786899452; cv=none; b=ghN+yyuO//F6JCY0uS+6p2zVOphfpaqZcqdv2ODo0/v7lY5Hi/rKH9jNSotlE1+HHpwwiy1HorP6JQUydQN1BN9MHyumBXFimrU1ILyN/Kmj9zZIP39+7jf5XIlp0vbj2wNHXoQ4y8fFANyDcz4tuPwS+crjfDV3VAwa2k833r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786899452; c=relaxed/simple;
	bh=5vHK21ZfMoXP6dWuV4jOPFkA3UZYyqzqjngLtc/WPvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p25IYBG7u8IHvogF3uK8EkmwyBk1m3brEgPFC/7+kB3wqb25Lg1oKUbGqZoGoBNQDodytkUVL959R8GqI4Yk+OG5GzIE3qUadC39HPWQ0idYoXue1IiFGTmQujJHVTKtP2trG09ZRCEOYyxQRD4XusfILyTqGMuxF/Qwya/FZ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JaWGU2D/; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JaWGU2D/"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e5c92c389so129489685a.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 09:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786899450; x=1787504250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5vHK21ZfMoXP6dWuV4jOPFkA3UZYyqzqjngLtc/WPvI=;
        b=JaWGU2D/B8QOcKaxWEZOmga6alimvX+8+bh6y7B2i3VI6iiy+rjKis3MacUbKHMYOE
         dPbl8aQXFjRzvEhLA8cEaF8DqhcBJF6CtsQ78OIMSeuPFyRKpVLruGrAMX0kQqOl7mzh
         QeIsxW+460rKKhxjMpCaOdzLJSxpN8ePRF5F2mrn/5ftqJdajBy3xEOj0MNBacb5cKCa
         EFTCbxHsKM3MPJhkFm6mOM0P6G7y/iOLt8jvO3FObsvb9gxaCQnnWzmW0iH7VtXXI0T2
         bWsHpK80k2W/25CxtkZ+yRC0DIEkXIknRo+T7Ylq5+hvdHe9MySrB6T9Sk90Uyl9SbCL
         dQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786899450; x=1787504250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vHK21ZfMoXP6dWuV4jOPFkA3UZYyqzqjngLtc/WPvI=;
        b=Z+c9u2jbOHextwbEYhfqnrI97n18jq/ngaizmssJfJBrCDKASTYmG0Kj2t0+4KU/rT
         51+0sfBsaJyAeNepqJ066RFHDXlK7eGu7DA90ZeSVzJa3NUtXRrWIVJNh4d12gyor+xo
         sarPLCe23BjJAFFGlVw1GFqUKzncDw2SkqQ+ZOhXhESSa916Ub6d32wJAY7ut5rCbphk
         h6lQaier3TMWT0F2P0dPmUrmYm5Khvmn+e4UMNsb/W+XPDDOLW5xjNZ93PhUCYQIOxYi
         vEP5koBHVrm83grjWz3qR9jqyqihF/BRXJJwHVW+9Rzb/IZyPXV3hY0ljWPzvFfA8jHJ
         6I1g==
X-Forwarded-Encrypted: i=1; AHgh+RoIdkmxPKBJ71wHMNU9NrYCFYQqlqx0DPoEAmr9KYar013bVx0Il/mz0rK/LgIJpKfnUamzZr1Vy3fc@vger.kernel.org
X-Gm-Message-State: AOJu0YxLWKqY9YsiqZ4dhhPgqBS1qyjEfRgVmDwy/ZDHLPQGpxUzWOAS
	My2X3jCsvoxJH7rtasfjqsHJ8ommxEabajODPWmL1/ghtbfD9nY9QsDW4/OU9YMNnUA=
X-Gm-Gg: AR+sD13CQtnlUDPp7jWyi/3aMQBPbVExUdzcDnOwt+RJk9PscEGqsmOKf1deKP3LOPm
	VgshM9uxQEjghzC+0Ryvu5WlEmHOnA4+xfsnEk/2Jo0hrvEt52cZtXqxx5dOfD2L1JTNgRqs6ru
	yU72Ay5nBP0KhtF4Log/tbljYIqIvPpwuhjqfQhrbwt5x3sHpapQtKxHAPQz1adq6c5Ms6ktNWQ
	z5MEVDT0zT3A194Peg3QCcCFoU7LcGdNFP+BQgNLQ36MPLMYEYPayASg6yBZspZDpA4L9srnZ0a
	HE9sscFQXNgOPrQ1Ae3c8V48E8fsv5ONBon/MHT7zgzh03xEZKpCqbofT92RyQZSnUE0bipQsOk
	ZnBJE49Dkv06DBxGLpPmVXuWO3p613P6iZxiubynEOq1FrpB2y8Fi79A/5JknoKD2x62q984dSq
	RuH1Xge+uoDqcYU8OB/PrZE2A7rIX7IqwVWJQ1IPcS5Sewu7lW
X-Received: by 2002:a05:620a:4089:b0:936:e08b:733d with SMTP id af79cd13be357-936e08b78d9mr1435615185a.35.1786899450058;
        Sun, 16 Aug 2026 09:57:30 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936ce0898efsm784134485a.12.2026.08.16.09.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:57:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wveAq-00000005W02-2MZ2;
	Sun, 16 Aug 2026 13:57:28 -0300
Date: Sun, 16 Aug 2026 13:57:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Drake <dan@reactivated.net>
Cc: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
Message-ID: <20260816165728.GB933791@ziepe.ca>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
 <3e7ba95b-51e7-48e4-aea5-f86db1739ac2@arm.com>
 <amlE8rEgryPqrUZd@ziepe.ca>
 <d6bb859e-c1e7-428e-b765-7b471e1ce005@reactivated.net>
 <abc25cfd-0c7d-4719-b6af-9034c87e9f88@reactivated.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abc25cfd-0c7d-4719-b6af-9034c87e9f88@reactivated.net>

On Sun, Aug 16, 2026 at 01:50:32PM +0100, Daniel Drake wrote:

> Let me know if anything sounds off!

It sounds reasonable to me, and at least from this starting point you
could imaging trying to build a scheme where individual devices in the
group can use the group wide paging or identity translation.

I'm not sure how that could look, but at least from a DT and driver
perspective it is not such a big leap.

There are several unrelated topics going on where it does seem we are
not giving enough control to the end driver about how translations
work when the core happens to bundle streams all together into one
group or even one device. So maybe there is some merit in coming up
with a way to have multiple translations active within a group to
greater expose what the HW can actually do.

Jason
