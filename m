Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266035;
	b=fHAIaGgwmFySpI3tibjSXZw494B4eKG36YdolLP/HZqzzytzjBpWDxqQtD98I4geElU0
	 xuOlixXv7mq9nQy69+J4GXQqA4y/C8OMZWt/+PEOBjGdoPrvVb0oKH6KowLKOKGcbFrod
	 C/J5o+xuEwq9clOSfhOMRnAf85DnpnWKQESavtnUj+i631BdOfD9eXuKkh63W5uX/JzqB
	 GPJTwoHa2cZf351MP44j7zPEFz6LbkaWH2HCDZUeqQceZgOt7Fe71BhPs5UZvDOR/4CTo
	 1WrzNi8I+I3nkx7MEyJkMNkaE51OGw2HdNvOzHtM70CBgDPI2QrgDHBQO34H3sTVsew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
	b=Nhfxar0Eu7vix91ExGglXf/3fk4y5IBuQC6E1Fv8tyMhQpJ2VW7XAE/+OzX9hfTGBIeK
	 Fqy/+aLpB1YtZgCl+riBLlla94ju/oAz/F+1j7pwJNYOx8oeFABFx3dOXnKlLWfhl/ihh
	 odpuSGZYAgrQScvfQpg4yExlZbPe1gKn1DDh6PmgZhHZIkDMGWr6aoMVxpvvaZ2mS9yPw
	 GwxFVcrxXD/OkMRaJxkPsQ0IMp/71fh1ecO4mFlqV5W5M3un6AAfP034bPwL2gv2A/OCZ
	 rKtOIt+zYJ6I3RqhY4x7TeuMtINBdCKzSuImFTyA9N202SC+3ghre5z22Xl0cdS/T1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNtRAbmQ;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3253E606A32A
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3253E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNtRAbmQ
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9496473b511so224067985a.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 05:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795266034; x=1795870834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
        b=RNtRAbmQYXLSiaEjtX2aUWytq3ybkP6vzvMM/GYzBbb22sqY7OMQwI+6PVQp9DHcAr
         lhyzXBhfLKqVcuJ8sVYNtP2aRDK4nll7J9DPE5KKQ2CAiVa+LkTWYungYQISMsCYyeh8
         hpGt4X4Nli6qalkIo2q0QmQpZOhYwDWO5tabVR1HVgZiiW3bleQnCJNRgfq3ll0kyepq
         3gsRAOgqgRVcju81U/9by/AXAbdfkcF2NzQSoJbhod4BZL71XZp0atz6aRPfoC9lunEa
         hlKhShuYNK3XPf/2DcuSXs5DhYd1yfNh3h4hIJmP4ba3ACaEg6LShMxd5328jY0CMk/1
         hndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266034; x=1795870834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
        b=IsgwqajZDOijipP5LUoEpab15ILfkIoaEOl8xP9De1c6E2L0RnmXUcA14zx9lp3Yiz
         g+9ScOvkmGCbvtlgP7wI3KF+pI5byfaf3sP7uxjrT2AtqXKVFQ9OlefeHms3PmJDODB6
         Qz8/S//ZPNoOWcG1Abg2/nQL62kB3bO8MHM7te06hgq5tIfbJIdsHYQIeUrPMVfSVZgP
         9Cw3TDpPwvh08etiln7amC/hGE7UEH8DFxTaVxuvZ2+7+v+XdlP7wCOcsEqy2ngHXB0N
         0wKv/ukcDjGSNNqGQDsOJ92ngxrca86x5kwXBNC9K8+27IrVh8rqEQMLnHy9ZKRRIrcG
         ytKw==
X-Forwarded-Encrypted: i=1; AL+hErGqcW1QDxRzUVw3cioDtFCL5DWjwt+e0CVPlU9noLS/25JBqWdoChIE4S2vOwexC5KAh0ZHA0dxMoaZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8jmQ0YD2SY6bPiv6spNup2XgWtg7ZHGxzikAB1FwimX9bIMkpy
	3wl3HXSvWDyOoCS816B9Guvzw/NpbBHsKzjD0Qq1OZcOVseKDvS8x3FKjk5JGXVJsHA=
X-Gm-Gg: AZFdTZfRPr+A2Irr795Cp68Ua4Zj2lNVqWrMyPIf8+6Fcy+XB/5p6ULtWI+Gar0a8jV
	qrbS63oewzUApGqPORfxABStmmi1k0bUVVSXM4TQJdzw2WjG8W1xdBFIaxbhpXmwyf/LkpV72v0
	allfy1Ah6/OTrch7OFqvLDovTAij7wmh5k1jOPTW5hSqNR1u9O4YxEPMvUeo+JRSUKoNOyfzTrr
	a3k9AwO2DR0olmma4PXQ64d47unXhIHVpVgz9Rhv5GVM8ocTXvrX0GSet/VCqlk8WaMb8T0CX+g
	4cw6SVhvC41LuCmowamXDwoYQp8XyILtwjxYEgkdMaPtUSDjhZmuIW5hNt8WeBTuvXkBiZzo244
	NfVT1+//CaD/af0hRwUyNo6Q1AihUtqhek0J2mtBcgsyJtLe1CxhJwuFHorVW7QCTzdCPmprUIW
	bNq59H8uQNT6+C+7kjBPueb2bgVumeTeatMI0bpN6LhatrALs3hLOc5pzXwhwoC6l4xCoAHJnTQ
	3lsoHHBHOWdXpFVACcNL3hsTm2MHChmiINFGi48GHNU8asyEXNwsAfAdL1zl5VNTbezNnenj6r7
	oWMlI3KB7XNgCshPmbiTOvI55HuZ9d+QauuXJRhmnij+yMJjZpoqRUPo+9OuJXTBP6CMfd2gRR4
	Rx8X11WCht+AcrMWE3iWoRkrKPMWVrwERdmPaM+X6aN+i+mg=
X-Received: by 2002:a05:620a:2786:b0:93e:5677:317b with SMTP id af79cd13be357-949b35e9b3fmr1046746285a.25.1795266033942;
        Sat, 21 Nov 2026 05:00:33 -0800 (PST)
Received: from localhost ([204.244.107.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm408593585a.42.2026.11.21.05.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:00:33 -0800 (PST)
Date: Sat, 21 Nov 2026 08:00:32 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awGV8BU_AfaXQyBv@maple.netwinder.org>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro>
 <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <awAq7vxcY8CGjhNl@ninjato>

On Fri, Nov 20, 2026 at 12:11:42PM +0100, Wolfram Sang wrote:
>
>> > > +#define R9A06G032_RST_TS		1
>> > > +#define R9A06G032_RST_MIIC		2
>> >
>> > I didn't find any listing of the resets in the RZN1 docs, so coming up
>> > with arbitrary numbers as we need them seems okay to me.
>>
>> Why aren't we starting at 0?
>
>I wondered as well but clocks are also starting from 1, so we could
>argue with consistency.

The clocks use value 0 to indicate "no parent clock", but only for the 
".source" element of struct r9a06g032. The encoding macros add and 
subtract 1 to the clock IDs, so it should in fact be possible to use 
0-based values even for the clocks. Too late to change now since the 
values are encoded into DTBs.

Thinking about it some more, perhaps instead of using 0 as the special 
case for "no parent", we could set .source to match .index. In other 
words a clock pointing to itself means "no parent". Worth changing? 

Ralph 
