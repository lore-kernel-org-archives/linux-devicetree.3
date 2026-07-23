Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748E32BB13;
	Thu, 23 Jul 2026 00:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784768177; cv=none; b=ZJtx1Vahm+Azhtvl9hbsiW3UBJuCtdEvB1MsSkRH/iUxdneirvfSTloYvYvPkx3KiTF+mBaBqE9mU9cbgZl+2CUyXz/LhjKyvZ2YIs9ttXvkba5kQs+2EnVYHwDlWRFY/Wv5SaE0rkgUJxltStpfqO5psDwIfy+Swfe3RFXAhO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784768177; c=relaxed/simple;
	bh=mgACCFKq2MK0Ux+A6DgXlsBhoMpXNtQXtj6PSE1bTeo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fmHTKZf5ShlMvZFhY4fJfEfLRBWuIjLKU1yjfXcpzCnFUSv5AOkHbqxhTJE+2yUrYb/yNvXQzstna95v8Jb5JboVm5wroFL3yUNd2FHQcD8dM8B4SG7yqA6N+bhLZApPHPVwf9E1fIE3v1vDQePlNiJRQtbZ7uCPlGG8yYz/oJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=KB86zf9d; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="KB86zf9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784768171;
	bh=mgACCFKq2MK0Ux+A6DgXlsBhoMpXNtQXtj6PSE1bTeo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KB86zf9d2WLK0LIcEJVmon6M9h3+R9wt5qyRbJsDN3s3UOE3j0omLV8x7wUMCcSzE
	 /A9iNxgcqW8ddJf5sz6NrpO3ZXaNlEkh6rYy/wBegtezNxfcKRa5ldg/SqFC1sk2ws
	 hi15HF+D8qN1jKbKM1CudigiTnrLXkN+gCQ1++kuXeHJ4ZynOb36Ko4Bn9P0WaqQwY
	 yd9Rpw5gTYbafvXpQRpTj9a3ygpt6jVhGbp94DZEQqceT2GWFcYAtKGLkwviKpOWHx
	 yQq2fRqmmdlcG/agN4xWkF1+p4L1LRWsD6CtlRCtVhe/iHHl0QH5ysCVAJ26nPAQeE
	 fu3Jmi5RO73sQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8EA60662E1;
	Thu, 23 Jul 2026 08:56:10 +0800 (AWST)
Message-ID: <71d33890fe1940b7e4f8f275233d4fe9d8791da7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: g6: Use KCS AST2600 compatible
 string
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Haiyue Wang <haiyuewa@163.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT"	 <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Thu, 23 Jul 2026 10:26:09 +0930
In-Reply-To: <c85229c4-2c9c-4231-b294-e8012c3fead6@163.com>
References: <20260627052708.172918-1-haiyuewa@163.com>
	 <5333a3912656d4c85fd063dc5726106e38150ad6.camel@codeconstruct.com.au>
	 <c85229c4-2c9c-4231-b294-e8012c3fead6@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-22 at 21:07 +0800, Haiyue Wang wrote:
>=20
>=20
> On 7/22/2026 8:55 PM, Andrew Jeffery wrote:
> > On Sat, 2026-06-27 at 13:27 +0800, Haiyue Wang wrote:
> > > As the commit 2596f6b93a60 ("ipmi: kcs: aspeed: Add AST2600 compatibl=
e
> > > string") does, change the AST2600 DTS file to use kcs ast2600 compati=
ble
> > > string.
> >=20
> > Is there some other motivation? It's been a while, why now?
> >=20
>=20
> Just happened to see 'ast2500' when adding other nodes in DTS. Nothing=
=20
> special.
>=20

Okay. I prefer to leave it as is until we have a functional concern
that motivates changing it.

Andrew
