Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616487;
	b=Qg/7D4qYabtmR78VFoTDg774kn4UAZYbxYBLMMpuJ5OGE/IOsex4IRBgflYPY7X+eOqk
	 sFOgJOnRmFFv87/3lPn8pCDPqUlwYkp23vJgwt0hp2aj04VfLnZyJTeJD+f8Bzn936TDc
	 IvWFo/cUDvArtNrmUxJXk/qslwoRT5DHZ9cO/k8Fl1r6dDDWs/HyaG7Ij1VM0JH+vW2yk
	 hsFIMTj788az5PGppQIc+t6VxR0E8RSc/GnvJc1WoTC1HEg5M/BjILPHXcJqDkdIo8Bn2
	 vgKjfuOQcChKSD2pNpA4dbpVFWVXqqokrWGH2VLi+lspXRlecibrj5tD2g/E3rD/MRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616487;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Z8rkgdmWzQ5tc6mLgq08LFXko5v7opLhcj8Wj763hEQ=;
	b=Qgjiy5p3ugNnBAsXawgySiE2+Y0UV9jW8sZR5kZRa1eMjDvYBaWgPTyWfnZPDFUPKguF
	 CsOIcDeboHnBWVSuoRQLip3noK2jw8G89WRmzblNtRbq3Xfr99MJIGXb54LxPkeOfKCer
	 fU6QLxhXZUv43aOQfNiVFJaGWvFqqVFCFX37fVoOcmICELjEMfW3fIANaSV/76mFeqto+
	 ezKkuJ2SmLpolV1nN6ATdA0IxO4jj74ofyEPI0fRcpylrqooGFqQli+YNf2q3wcgEUf9A
	 SPQ/VwUAmiRNZFDijOOEf//o+z+mB+8OpfmsJZvqhIGVCkUBBqe3yMwDBX9Vyo7KG/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=iqVcN25q;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F9606A33C;
	Wed, 25 Nov 2026 14:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8F9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=iqVcN25q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Z8rkgdmWzQ5tc6mLgq08LFXko5v7opLhcj8Wj763hEQ=; b=iqVcN25qb1t7uOLUUJoVtFnFeF
	f/dsKXucFRBKUrWMKJBnTeCZ93gJS/I3sBjxDlEXA0x8wX3Ft59H/UONxxu5uLKSjNcoWkwLtpb0j
	7X1sQiTann5p6yuAp2duoNKCK024ENeLS8FBX9Omjv5UA0IAzOj7utOhPFRj6KHxBcnw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWDro-001KiR-HS; Wed, 25 Nov 2026 15:21:00 +0100
Date: Wed, 25 Nov 2026 15:21:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ryan Leung <untilscour@protonmail.com>
Cc: Alexey Charkov <alchark@flipper.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from
 the CPU ID
Message-ID: <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
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
In-Reply-To: <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>

> > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int index,
> > +				 unsigned int offset, void *buf, size_t bytes)
> > +{
> > +	char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > +	u8 digest[SHA256_DIGEST_SIZE];
> > +	u8 *mac = buf;
> > +
> > +	if (!id || strcmp(id, "mac-address"))
> > +		return 0;

I don't know OTP drivers. But to me, a function called
rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
architecturally wrong.

I would probably not mangle the CPU ID in the OTP driver, but in the
MAC driver. The MAC driver should ask for the CPU ID and then hash it.

    Andrew
