Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B5445C710
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150474; cv=none; b=V73d8CV16ceEq2UjgEOf9n4VLslMxsbOdqnhwV87w75uCanTizzpuDNKSVPtMEYN3j5VmzOvzye/6m3cFQzTVbBqjGAemr94j5fzuuhRxjhUns+tcHozDDfLCaSXmmiqLNs9xYeAjNcs3MxnDu7A3pz4yE9CZ8i1P6DNktcl0Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150474; c=relaxed/simple;
	bh=eTRjkNjbTBU25TMiMCm7OeagUXe/qlq8QV1fQTMIa2M=;
	h=Content-Type:Subject:From:Mime-Version:References:In-Reply-To:
	 Date:Message-Id:To:Cc; b=fNAOjQ+rMAxk3MOh5Y1aI/e74qS2bJo3lox5Xcre4L+iH9PWSJrxZYZ1Bdp4cZceG4WoCmdTJYoK0jzxrnigZCqFB+NFZcexaA5jfn3C8vdab00DLDTl+ATFa2YF4R048omkb4dP1d8wPeIgi/mkcxr3rcyGAGv4n0JKQ6Hx9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=X7qxDDFh; arc=none smtp.client-ip=209.127.231.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="X7qxDDFh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790150467;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=eTRjkNjbTBU25TMiMCm7OeagUXe/qlq8QV1fQTMIa2M=;
 b=X7qxDDFhu7iDWbBH3LXU7or5nuFp0q760MgnI97z3Xx8L0GdjtP6gQJiPlAJE8un34/Xzs
 fL1eLBODuikc3wZXEenC4NG97y/sNKpBnQfdsBTeDArrGflN0PI9NCLzDfbIET736M1jJ7
 ZyXaElKI9+pUMSUKi/Jx2tl+A6zSeod7amaPSHbaww93wrxYcIgsJcthJYot8b3+nNNufi
 90hP2XEM0ty+RrsOqZXseL6LCPZYKaexFmB6H+3/eHw6Pxns7fxIExi6fwX4Ahp90D+4oS
 QDBJDY4K4IlxETexdz2Szr644J1/qTh1EKunGyVWHBY6hujRYZbURdzwV+XTmg==
X-Lms-Return-Path: <lba+16ab38740+66235d+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io> <20260922110450.3426070-1-sandie.cao@deepcomputing.io> <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn>
	<DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com>
In-Reply-To: <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 16:01:01 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>

Hi, Troy:

> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> Date:=C2=A0 Wed, Sep 23, 2026, 15:02
> On Wed, Sep 23, 2026 at 02:35:20PM +0800, Sandie Cao wrote:
> > FML13V05 SD card slot is inside the board, it doesn't need cd-gpio,
> > FML13V05 Keeps GPIO88 to low, Then SD card is always on for SD Card
> > driver.
>=C2=A0
> An internal slot does not necessarily mean the card is non-removable.
> I don't think its location alone justifies keeping card detect asserted:
> GPIO88 would report a card present even when the slot is empty.

Yes. The FML13V05 hardware is designed for this. We can't change it.=C2=A0

>=C2=A0
> > We check the vmmc-supply is p3v3. We have the same SDK DTS config with
> > k3_com260[1] , so, this patch follows the SD card patch of k3_com260
> > dts[2].
> >
> > If this is not correct, we will change it.
>=C2=A0
> Could you confirm from the schematics that the SD power wiring matches
> CoM260 and that the card's VDD is actually connected to ALDO4? If so,
> this supply reference is fine. The same SDK configuration alone does
> not establish the wiring.
>=C2=A0
> If the card instead uses a fixed, always-on supply with no software power
> control, vmmc-supply is optional for the MMC core; it should not point to
> an unrelated ALDO4 rail.

We check the schematics both of COM260 and FML13V05, both use p3v3 (a fixed=
, always-on supply with no software power control), not ALDO4. ALD04 is onl=
y for USB.
We will correct it in next patch.

Best regards
Sandie

>=C2=A0
> --=C2=A0
> Troy Mitchell
>=C2=A0
