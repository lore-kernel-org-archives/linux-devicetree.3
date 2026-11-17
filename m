Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949870;
	b=S+NqFOanKZE/wfspx40pIBz9NTz1jQL+yfscBsXW0ILXwXcB641se+3gsNhenTFg4xpX
	 0yLF8vKhPDaTOU6SxtG2ZiaETXfJMoe+sg8OEFnGedoK/1XY7aHwdMoAXU0q217jffpq2
	 SviuB1vXimXuUsFmo0oQZn4eNjDtcR5/Yy1FPANIFBscFr3qirTVzCnntCqmQbJWtW38r
	 59DUERUnUzv6tnVW1137VA5O7ZoYkB5uOS2k+z12socEhujDFNgdk1QHOXeKYKQKt8wUT
	 Oyl/axEh5xZfUMVGygcEBowlYo9S/qZaGzvQfBewxANwSFxyna4L3UAtBLMAkICGORQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949870;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=TVmLuN6TdmZRBmVuzJ3dizL5Wjg0xswtTu8Vva+GDgk=;
	b=gsUFC3SOoq/5AuGSx7KjRdve9qEZhCFT1M+ZhZNHkAt9JiFuidjCTF9fkqZkfxN4Ownt
	 iUw6yk5h78y5jNGiSmpftUqFaC0V2fYt4dWhd70jK4sBmUpiI2ERQQM4wI0JKkz6XTVPE
	 8S9KvjvDUBR1V/jBaKHDTP7LBnX0d3srl/Bpe5r8IWY6NCU9GxVCwoadQyU3MFlGGsWSi
	 TcRFpFlNKukEK22nlnNIf+IFOtVfciKG7tZ1y/aRPQn+kShGjq1kGkgowQMFDDsqN39QK
	 6ubQz94QXM/1gzZ7zuVBZupaky7lG6OSR3r7T6sDOjKh+LQ/RxCTF67S6EqgD2gyTXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=D6QleEwL;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEBF606A31C;
	Tue, 17 Nov 2026 21:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DEBF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=D6QleEwL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TVmLuN6TdmZRBmVuzJ3dizL5Wjg0xswtTu8Vva+GDgk=; b=D6QleEwLtE+BfhmYDylHgTmtFk
	A4WxMb47kUB/TREB44aHL1jqaP8wvPk2xsBfUMFnN1Vi/RwSJGLAd+oIQoUf3snmR5gKp25gn9BlV
	yYNm1POZmhDfTi6rqjfD4V4POk6Pex2YDirvyDvC/LZZmlwXPFwYL3Czg/yM0HGSygtc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTQSD-00HGsb-LC; Tue, 17 Nov 2026 22:11:01 +0100
Date: Tue, 17 Nov 2026 22:11:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: A B <pwnzorius@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: armada-370: Add WD My Cloud EX2 (Gen1)
Message-ID: <2ee34025-2b4f-4a01-b840-d7b4929d1198@lunn.ch>
References: <CADS6G6JDXAP7PzKWqmq69ViC6Gim9o+9pQ=ctuaiEboJ-WsS6g@mail.gmail.com>
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
In-Reply-To: <CADS6G6JDXAP7PzKWqmq69ViC6Gim9o+9pQ=ctuaiEboJ-WsS6g@mail.gmail.com>

On Tue, Nov 17, 2026 at 09:10:31PM +0100, A B wrote:
> Hello,
> 
> This adds a board file for the Western Digital My Cloud EX2 (Gen1) NAS
> (board RD-88F6710 "KingsCanyon", Marvell Armada 370 / 88F6710), which has
> no mainline board file today.

Please take a read of

https://docs.kernel.org/process/submitting-patches.html

> Confidentiality
> 
> This electronic transmission is strictly confidential and intended solely for
> the addressee. It may contain information which is covered by legal,
> professional or other privilege. If you are not the intended addressee, you
> must not disclose, copy or take any action in reliance of this transmission. If
> you have received this transmission in error, please notify us and delete the
> received data as soon as possible. This footnote also confirms that this email
> message has been swept for the presence of computer viruses.

FYI: Your email will be publicly archived, so i really do hope there
is nothing confidential in it, because it is not any more. Please
remove such footers for public mailing lists.
