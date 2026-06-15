Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC33E274D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528002; cv=none; b=qCIYEvXxxh8dODkclWjVJkorSbYLyXI/6zKpdGvDzxgmZGZdm1RC4hjDs26lq489hL37H84P2s3Pgb2+cuyGkvnr0kpusXk7DfuiyYUTXKOLFRazqWqg07LSTPR/2FBUffEewbsrQgyKdINQHqGJAY/nN/0N/BI6PoUqX/gqzjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528002; c=relaxed/simple;
	bh=TEDgwR7nvYT7vNJoc4HaCRYL3kPYN1P3GwbaFU4R+Ps=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=imok8ICqs3I6Sgu6C2ZRZRyg575g8m7Z4wSjHGgPaaUgI7B17O6PITwcTw9j3rsWcLatRkH8Xfwf+ajJh8cc9CUNc37L1XHlnm5EvTc2jkNZZjgk8z48ppaxh7BIHkxkTy5lppOoEgBTXQET17ZsQFVt0UX5SHQNIWStV+2s82M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wZ6oS-0000gS-0q; Mon, 15 Jun 2026 14:53:12 +0200
Message-ID: <624ac28d675035f26f3ea2dd8afb288d59af34f9.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Gira
From: Lucas Stach <l.stach@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 kernel@pengutronix.de
Date: Mon, 15 Jun 2026 14:53:11 +0200
In-Reply-To: <20260611-swiftly-imaging-d624308d16b3@spud>
References: <20260610213047.500701-1-l.stach@pengutronix.de>
	 <20260611-swiftly-imaging-d624308d16b3@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Hi Conor,

Am Donnerstag, dem 11.06.2026 um 18:40 +0100 schrieb Conor Dooley:
> On Wed, Jun 10, 2026 at 11:30:47PM +0200, Lucas Stach wrote:
> > Add vendor prefix for Gira Giersiepen GmbH & Co. KG
> > Link: https://www.gira.de/
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>=20
> Where is the user?
>=20
The user is a currently under development board support for the Barebox
bootloader. It is expected that the DT for this board will also land in
Linux at a later time.

Since the kernel source is basically the registry for vendor prefixes,
I didn't expect that a in-tree user would be required for this
submission.

Regards,
Lucas

> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 28784d66ae7b..2b7bf7d7b9c2 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -656,6 +656,8 @@ patternProperties:
> >      description: Giantec Semiconductor, Inc.
> >    "^giantplus,.*":
> >      description: Giantplus Technology Co., Ltd.
> > +  "^gira,.*":
> > +    description: Gira Giersiepen GmbH & Co. KG
> >    "^glinet,.*":
> >      description: GL Intelligence, Inc.
> >    "^globalscale,.*":
> > --=20
> > 2.47.3
> >=20
