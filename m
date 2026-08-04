Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE07A421242;
	Tue,  4 Aug 2026 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829330; cv=none; b=nb5Ea2M3FVnvcJgAGAKhOXQIdXIt+o7QTVZDj5TxqF9uRTXzLSSTZGH5Lxi9L1Lrn/XNX7qXAjvjcNxCK8UhmezpZQl2Tfo87Z7uQTsuaoT5vgfC6/IfATPynntydu9Mksw76QR2nk+l7CzctWPuGz1WCMOJKm9Y4fpz7Bb3bhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829330; c=relaxed/simple;
	bh=R6kK68iKq6B3hsFkprnUZ5V4wQJLFkN9RhYMQ1aFDRY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=acJ2i+6rYBmjipfDdy6GhyE/ykBAZ4pjnX86GBHu0UVbCzJD7iXyswoYk1lnbvcanEAArjhCaXl/1/L7CjDRX8acOd9F97R6wJ7bLUpgxdvaADNQP3xh/w/Fpm24WdXlRUTURSuHC4kCSorlqROy21e4UZhOyTxg/Qa/+HezoaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=E3cUNDBe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hGAN1CBV; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="E3cUNDBe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hGAN1CBV"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id D61C51D0017E;
	Tue,  4 Aug 2026 03:42:06 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 04 Aug 2026 03:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785829326;
	 x=1785915726; bh=EKpVVOy/vAF//iLEvNyTANx2jy7aUA2O60ZeWWvd0cI=; b=
	E3cUNDBeFEZJr5XV3ccwz3OQo4YOMV5Fu9Xl648bD/u9qENTzEeJRU2b7cf3GWjn
	vvWvX665VDZv6uqm8VO2p1NJOMTEccHjU4nyfz4gaZAPQeicr8GMzc9iyjWxd3mB
	uqzWCpoalPb/loA0/Uv/8RGrmtQcsK9erLNcrrQj3phn/ypEMOme9DGQqSlk4TOn
	Nj4ddwJlgMZmJGRLjw/Tv201uFvMXyjKIAmQ+5q2qyIp5YtiUsfkfE03Xs9Isofx
	XOL4pcsi+1O5Nzc/ynCUl0jNbZBuZTpgoc8FAXMJfScL1T+nuRjVNY2VOQ5HG175
	+hu55k/qDhSrBj8BD+vUtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785829326; x=
	1785915726; bh=EKpVVOy/vAF//iLEvNyTANx2jy7aUA2O60ZeWWvd0cI=; b=h
	GAN1CBVgDGmxdvV+vmGhB630VE0hdiJ7m/TmMkq+20yZ4jOd8qrK+B6OmwnhGtLY
	vCI2JZ2H6h10Uokd3WozGEBYuv/rlSccGG6ov/xKamlbaTLY1v9jZVRiKKIKk7fB
	JkOj6Q8pV3q5ucs6jNMR4JAakZyPZ07/QfWj/eUa1WJQGxKT3PZP8uzLbe9QRbqi
	BuZLWGnWqftU3n0ESZ6kZRHeXf1roypeDTxAPiKPRIP2ehEZUdieJVCp2jR1SzCl
	uhKk0vM23KUOakUz0gQWYCfKw5/piVue4zT0P57d9d/F61a02ACAUPaV2W4GH7Zz
	kboe7xS5jcCeeCMorL7ug==
X-ME-Sender: <xms:yJdxahP_t8ETQrjfILkhbK48-JtAbMq73jgPjFMSuTRVZ9VDY8TDjw>
    <xme:yJdxauyAlUVu3CCQdjEWbJ3oc-o0p6FsBE8IUXn-_BnXxoe5JrJ7QJFKA5_bWfOYz
    YGKzuj_7rDjAcR_QXLiVycrtOCTrypBADFJD6a-a6hLuHXBMIB23Wur>
X-ME-Proxy-Cause: dmFkZTGFCYPo2AGgkRnqUylk8j8MDUHYfufINqLmmmGhtrVudRIgPX3z8wRljbN9Mmir8Z
    64D3e+TnyDNB97KNPSHMAiHeS+vfJps4AY4A3UG7sZax+6gc++uSDuIJ0EgJidxXH4Nsgf
    z8/PpVCwLr0nsIt3a1eKaQ1eUEy/OmVVwjdckjWSb5GujX7PPoOsFBm8aFPGYLDJrniYq8
    vTIp1OUvHPGtCwt8oG4RkCOagbIl3RI0Xh3Apu3+X2wug8gtCM+2bXGDN3HfDu0ND4gGYB
    d/9W/6MVjtZduHbO4RDTTbqqfrEXpce03HIWbZQf+X/Qg9517uxzpcu92J4CCrqp5F30nN
    fomcq3IcinHtAvCFC5d3OzIbLdwtdLFjiu/ZBbf+fAb0ZhgJAz3Wli7DyLVCvKa3y9DBHc
    Gl6mH/vxR1a2AVj+LN16AZlU8VgEXWMWamLXH3n9gEi+IubVlCww631aVsbCNVUdNk7m3J
    Xgd2kYaD4jLquadTCLxWWDDfIsd4WOKVeUjLnG58XNGgWGnDb0d6W+zUGTZxWHc/JU8MW/
    PeffmGbL6KhOS1YCXJ43EOLoaDDVK/tI8AVFKVYuXvHqDNq5oLWc7VCwphe6gvlIxkef6r
    /9hjD5ivsRxIZn8KCqyuCWt+olO2zhfwtn8BHRMH4TrfD9rdGUXj5/HCLXKw
X-ME-Proxy: <xmx:ypdxahAJlverSBktLbs0rLAN_jwK9108VtXcF53G7IfTX79LjXcQ4Q>
    <xmx:ypdxasOHcH_gK2azF_-MugQDNtLjQSoor3cro4-fF3aSIqmrnhWZUA>
    <xmx:ypdxagfjlBhFzIjDOauEtHKbGiaDyBtU2lFk1VEK5aP0D-aYxd3npw>
    <xmx:ypdxal7nljWsEXbuQuQNTLsvhTO9_cCu-58hMTuv_DAgAxk2g6NuLg>
    <xmx:zpdxapy1AgxiUFR1PTPXcOfaJ42Vx-pMxOlso7F07eK8LTNtIU-d5AnN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2BE1732A0065; Tue,  4 Aug 2026 03:42:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AdFLe7-IZaaF
Date: Tue, 04 Aug 2026 09:41:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Jacky Huang" <ychuang570808@gmail.com>, "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: soc@lists.linux.dev, "Jacky Huang" <ychuang3@nuvoton.com>,
 schung@nuvoton.com, "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <fa1d3251-817d-4095-8fc0-dbee0f9cbafc@app.fastmail.com>
In-Reply-To: 
 <6da6d2fa5111e479aeefd62da70974601acccb96.camel@codeconstruct.com.au>
References: <20260708082457.460710-1-zychennvt@gmail.com>
 <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
 <825a3a1b-8891-4172-afd6-8de6077fa129@gmail.com>
 <6da6d2fa5111e479aeefd62da70974601acccb96.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Aug 4, 2026, at 07:13, Andrew Jeffery wrote:
> On Mon, 2026-07-13 at 10:57 +0800, Jacky Huang wrote:
>> Hi Arnd,
>> 
>> Thanks for the clarification.
>> 
>> Shan-Chun and I are still maintaining the MA35 platform.
>> 
>> I have reviewed this patch and it looks good to me.
>> 
>> Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>
>> 
>> We agree that the current maintenance path for MA35 could be clearer.
>> We will work on making the MA35 maintenance flow more transparent.
>
> I discussed this with Jacky off-list. Going forward I'll take MA35
> patches with R-b tags from Jacky and Zi-Yu through the BMC tree to keep
> things simple.
>
> I'll pick up v2 for the next merge window if there are no other issues
> with it.

Sounds good, thanks!

      Arnd
