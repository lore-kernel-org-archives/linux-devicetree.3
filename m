Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B373AB28D
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285832; cv=pass; b=ZB3IszmMJXWObzv/aZNrmRuEWITAan1JKagArJTpwdOlkIL41efWfy6oE2g0lJrJ+TcTy1qjxZVOZLa0K/n3190CMjANUWiBYb7/TxYpOHi0/TWwn5SxvWCPypnwbKXQ1Es2pMdVz1H8zfPMx9VONUGdRfKDl35hlz9cI4BGKSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285832; c=relaxed/simple;
	bh=z6yQYjaMST7T9xNUSIrjeUD0tICeIpWttHt7BzVViNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2WNY39RcCryXTGyA+UkFA30WuH8mss/8YU8GghxZV0Txbgl2vEq/Jz0x6IrZDITfTGzEtFFUI6v7ivLqJ2P6BHIkeIRnOWIFTOF7O2Bu7toNY8t4bgw1rHJj6YKmHQ0/H9Sjh/Wb8rO1KeYVNTlsOvTBY0RegLPCR9QmGIkWvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsndF0K+; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsndF0K+"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91957ec41e1so11365406d6.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285830; cv=none;
        d=google.com; s=arc-20260327;
        b=Yqio5cCMSr4TYpjE83k5oDpnjyPEdoB0H1/BuM3+/ULkc+abHcUu+mV0HNYQn6Pyro
         UgA5D1HDoFMeNFN7BU0SVPNeHH1z2oe7nuBu8HfOk7ei1Tw402yKSQuA4CfUEYvsuzng
         DJRatEgnxOThWClIjc29iKV0A203ZKyKPoUIf1PRtLAosyfh6h66J3v3asXqgrtXe5Gh
         PoQjE2uqGJmdvjQ6Po3wvjpP678l1IkKN3IUVztKMXeYi9R6vNc4Z1trP9n4AAHAXOEF
         AXB2fMys3Fb2hyNclQvfxLaf0OGyRmZl/oqAJaYaZLBW9Ers7Thp+1qs0urJC4Zqj2kE
         AI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m0nrJ3awfIMvMCI5Pc5TdpanFYz+3b7qYjatFELYqnk=;
        fh=XCo5ZS9mnK7W34KvOkd1rlQaqajJrWv2++AD1A0lS80=;
        b=hUlQVooSkWZVXAEidrLPm1VOSjvcLT4BFYwojg3n2JRWp2+2xOqjuUbirx1UTdF+9J
         kwP4466RxZU7Y03UXLMq5S5KiSDhwsaCIuH1uKiwQh73c36eSSA1BfUVcjcAVfgQ+A3Y
         EQJGhMIWit/7cpm6RfVaTshVRvzLNpaK4xpCFwwGa+Qeimn0Dk5vmQNhk6v+S9F+4nkQ
         GOdgfTw1fh9u/nkOS4R8Dt/3tDzl2YW2RSqdHKvM1enCurYcF0IQMpvuBo1G2NTAxDFk
         aHxW10BkFiNHJH/tZaVq1xloEQcQRwyRdrVsl0iCXyq/6N7A00yDqAHu2qBREx+2gFYE
         q03w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285830; x=1791890630; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0nrJ3awfIMvMCI5Pc5TdpanFYz+3b7qYjatFELYqnk=;
        b=BsndF0K+g9/ZkmvRNDqmJvpJdG6HRqy2cVfLyK7lN9EvtPDIqkq8RXXchf/6jwyKMx
         IRd8itxYfwzjhcvWVctS5TdglM0lfriQfABg1NHQFI935h7k65LNTPGZO5h6+EcjC2UT
         qDqIksZySIgOvPN6ZYj5RSFmt6QiksbvjF/FXabLebRG516Vzv4FEvfRzQdYhgeUVURw
         ax6v7zRiKbS4daG92ikFw9gyfVy3M5csfSqVrrbJuY2rO27vmVKBGS6y81vIwPO2kTXH
         QhT7XSg42h8miObe45OrxVa8PwKbh3+fWr++/ACl4TGauDxAyXFddWr2n0WdY5QV4YoL
         cc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285830; x=1791890630;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m0nrJ3awfIMvMCI5Pc5TdpanFYz+3b7qYjatFELYqnk=;
        b=Mg9kdeuZfC9ccWf4/FpM/lMkq1YqHUwy/uNYo1NWA0Rrqm+bSuFphaMXEqCvMgQfp0
         WWvk4YQNB8hRqNHf/h4qg7xDXjwaNZl0dqTyQsV4PppWS/N+mSpkfN90j9Avb3qXfkrb
         s7vG+31cg26zXcqK/N2hw+u+IIcxzW0jec24KPMWBHljyERQTLkf9YoJQLsmaXmf3LNm
         HSRGk0J778D/Zwb126rfH9jePtLJ6WOwOUEvTPhn8HU2eKu8vd0aCue96bnPNhaz6I0J
         beWOWi1InPpDkxYF83Scs1uXcfwfw7xTYozFe/ugt0g63FkqUQXkAPmnTFRsMWp8yfEe
         4Hmg==
X-Forwarded-Encrypted: i=1; AKwUvBzv2S8RstDuhD0CgnctBJ09uNzF5yTCsHw44Ab4Pw//hRhy4OxgrDiiy0kLNnrYrlJchwzrwUd2e7P0@vger.kernel.org
X-Gm-Message-State: AFuF++nG2yArplofqGeDZMulvGQjnIIG2SOb2tOK0ZeqTLvcASlLV8z9
	yv+Ni2NzoHhywYSNs83NRJLPpnvl2fMI4gSelYAA+ez9mVmBgSBdH+OoLN6HaFOOlX9sACkaAa4
	Gh3TMIJAf3mgkc1VCRzrZhRVNl6GbMpE=
X-Gm-Gg: AYBFou3PgcfzHkPK1REumNGNGmVXPh1k4rDKRsT6dypue+lGik92I10Z8+JAEi3AA0p
	KNaZqU0zrkn9GgRDVo249JEcKLIWKeGXPC81sLhVdyB6B5HNu9IZsT8z3TkqADJVvFewY4ZptOS
	xpRTuUP+ppCkcVfqqHTNfgYDNKfRc0LXITw/XOl6gnsCDyhAlcLYZaJVAW85wYcyt1dU3qWSBgK
	uwdkvggpFrvpRj++dricRTiAoxkbfrhCwlCww+tKp7MFRHu8jDIvTmosLQ6wQUTZqMbXTRtoHkB
	RSEG5KtIuN66pqwPVrLPyUF4cwanaACOWpWz8TLXJHaZIwOhvnmBoGW8WwrCIeZ1J7Vj+/TQcL/
	iTY9WZigb
X-Received: by 2002:a05:620a:46a3:b0:93e:74e5:2b1a with SMTP id
 af79cd13be357-93e8f20be79mr176670285a.10.1791285830405; Tue, 06 Oct 2026
 04:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915125226.20579-1-ansuelsmth@gmail.com> <179000484817.707534.5059164498545591038.b4-ty@b4>
In-Reply-To: <179000484817.707534.5059164498545591038.b4-ty@b4>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 13:23:36 +0200
X-Gm-Features: AclHuK-A-f3KKOzsuweY0rlORNqVHnne0GeUJDA8hVjnwVqlWsoVNYQ_BtfV4wM
Message-ID: <CA+_ehUzrL9qHe92tE0CeaOMAD1LXGuK79t5mZGv+bp2sCas_sA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU serdes
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 21 set 2026 alle ore 17:34 Brian Masney
<bmasney@redhat.com> ha scritto:
>
>
> On Tue, 15 Sep 2026 14:52:22 +0200, Christian Marangi wrote:
> > clk: en7523: Add support for selecting SCU serdes
> >
> > This small series is a split from the Airoha AN7581 USB PHY series [1].
> >
> > [1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/
> >
> > Changes v2:
> > - Rebase on top of linux-next
> > - Add review tag for Documentation patch
> >
> > [...]
>
> Applied, thanks!
>
> [1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
>       commit: 11952173d8a180ac05641775f80bd6946327478f
> [2/2] clk: en7523: Add support for selecting the Serdes port in SCU
>       commit: 4e39820b601221997cb2220edc830f92367cdfc2
>

Hi Brian,

is it possible to have a stable branch/signed tag for phy subsystem?
Commit 11952173d8a180ac05641775f80bd6946327478f is needed
to permit correct compilation of a airoha usb phy driver.
