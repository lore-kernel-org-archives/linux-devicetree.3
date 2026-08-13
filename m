Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD5D424D59
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786649470; cv=none; b=LOucTtfdYlw+K5O7tsVe5f05Nqxj9FjCulUVAcDq+VNaYBHwRaWVVCBvb7pFEmTjG1k8RXvn60CuMq5KS9HF/BirndCHZmxHiLCMzaXO/Ib2iiWnYsVcyVzR8i58jF8yJGczFBhIlR5UO3AxoI6yMsPLzLGgrPRrga2XP5/mdXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786649470; c=relaxed/simple;
	bh=4jd523lHV6z9sGisUjcZziHb4lsgWQZfL2Ciel9WIL4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWPeG4HOSsAl0DKA5FJHYeitwXJDFzxbyhwgl7oJijIgZV491HHaHpWrCfcf/zrQFto4Ju75UmBYcHbgs2BdjmYiSv3qiGJjr1caLrcQXad8BU1Iwdyfl72F1Jm5FRR6+SKYwmMhQzjzYxn2S59C0M5yHwExTUF1c97uUXXuojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5Ucjk7h; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5Ucjk7h"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so1555705e9.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786649461; x=1787254261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ULbcTDnO0AMWuu67LZdQx8/Vu46a5smfVMMhgY9gY0k=;
        b=b5Ucjk7hr81w2lx5V4aClFdUTcSCQc9Bm/M+mZ9EmOJAIB/SSWAXoh9AX1ktVXAZzJ
         SOPSTvH1q1zaDPdvrAVeBuriievcD3F1UCOcUd6v1RFxAzWwOm1UYAgDccSlzR0XBdPn
         T05SZJJW9mz5I9lHberlj5vniqSQwJKZ0jeGvekLfS4OPy2t241RV41jbHbk3l4VSCVz
         LWnAi9iWLZXGWFIv5XoVzv6h5DLDoXoKN5J2zP7YoWIYlfgnnYUnLPg/NoHsE+adnqNl
         Svq+88DY+AhZHhnhzy0yvpSBMfMFljNfxkoLLomD2yaWOXDAbdao7Lr7zrjHN027+2z2
         c1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786649461; x=1787254261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULbcTDnO0AMWuu67LZdQx8/Vu46a5smfVMMhgY9gY0k=;
        b=E0J7sP3xja3XzIVZ+bzFrTcmu1Ug9A8f5p/FcNDrqBaNFnzQ2h9aMmpvmMOoxiu6Pj
         4fkM6VACub5Tjl9hs++A/HzrVhw1Qj6tnVPU1aRastA86DOfB/OFxhhab/sAGWtcAQyf
         NEfFAJd9UieC96Bm2WETszIgRHKEZp1HSsgbxBdrtrDb1wO4zGr7q4WL45PaCGRnopEj
         zdvAlC5nsL7nQw3TralkWHLnVRWyuHCd7bztFSVdIQ2pBQzqSBK/aGx4Q8oHIvisok9J
         iOJU7GTbqQcJTuXrGl7xRQwh6xzp/6lUrXJzCmQ6N2NWSgGdULeLshxhtnJdpQYIdxW6
         9pGQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+JcsJzZwcoJ2GqWYX8lF6ouBs656KXCK1fchZ+sLi9BFsRuPtRZXFDbw+uC6uASxLUqob7E7W81Bs@vger.kernel.org
X-Gm-Message-State: AOJu0YyoLyN2oFeIFl1E7NoN9j6nwXdMHeJt3NuEut0zfq8VC//IHrxm
	DcqcMWqUFWEUiXVQW2R+QikbNdUOLJ0NSjmOFjaOo/h1R6E9q2D0PuCaOzihUZ1W
X-Gm-Gg: AR+sD12LV6wtQg/J+KpJMAqopDCSXDTHz6ek0DZFS2rMC/zDzZSaYKMZfV7Qo/6W9pW
	fx8VRLUeMjIigpjWrdXmIYoaWKWHmnq0uZf1+P+KrK7OZ4nEIXNXQ6GabE9iqicbkcGPfp/kk9Y
	r8nw+FHFi97AZvsdhc/3E0tbXH7w+JDM3XSLbu/3NBFDKimmGBGiNtz/MgezCm+/rQbAstqZ2EH
	30FuLefuPZXCsKUMvRFh5aUrGA8E/CFVfQ05A0jLl9Feduzd4n0G3Lt0oiwHNMTKJrxYbLdLUMQ
	q1PwUwI2ZfOlwHfILiQswiOOh/1ezs79VAaHzG3+ePwmgxq8yN6TLb6MSFmZtxyhNyZlvXP1jx5
	pmV+bb5K23cwjF5vyrWKQ8ikcUw1iBNiw8js0pUcn1b2Q9IzEVpCROCMUX0LlLEBnXpUaouYsxN
	oBFY9RypEst3YQco1Y665z4doV4y38d7SPN/A6twhK5QDJ6iCWVtkA7Prn885uuGIqz4iAXBQCL
	vvwuCGjn4+OUS14PVaTuN7gqNICi5CGJJ9G+tNa/A==
X-Received: by 2002:a05:600c:3496:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4998796e478mr11165245e9.13.1786649459483;
        Thu, 13 Aug 2026 12:30:59 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b1bd61sm81000835e9.8.2026.08.13.12.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:30:59 -0700 (PDT)
Message-ID: <6a7e1b73.e11288f4.1351ae.5625@mx.google.com>
X-Google-Original-Message-ID: <an4bbqdaa2jS3A7L@Ansuel-XPS.>
Date: Thu, 13 Aug 2026 21:30:54 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/2] PCI: mediatek-gen3: Add 2-lanes mode support for
 Airoha AN7581
References: <20260806165334.7328-3-ansuelsmth@gmail.com>
 <20260813170820.GA1143871@bhelgaas>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813170820.GA1143871@bhelgaas>

On Thu, Aug 13, 2026 at 12:08:20PM -0500, Bjorn Helgaas wrote:
> On Thu, Aug 06, 2026 at 06:53:32PM +0200, Christian Marangi wrote:
> > The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
> > mode (x2 link) by bonding it with the second PCIe lane (PCIe1). This is
> > done by configuring the PCIe MUX in the SCU register.
> > 
> > To correctly configure PCIe0 in x2 link, define in DT the following
> > additional properties:
> > 
> >   - additional reg, 'sec-pcie-mac' for the secondary PCIe.
> >   - PERSTOUT reset for both main and secondary PCIE0, called 'perstout' and
> >     'sec-perstout'
> >   - 'airoha,scu' property to correctly configure the SCU register for the
> >     PCIe MUX
> >   - 'num-lanes' set to '2' to enable PCIe0 in x2 link
> > 
> > In such configuration the EQ preset are configured to the same values.
> > 
> > To permit correct configuration of the PCIe link, additional logic is added
> > to assert and deassert the PERSTOUT resets. Support of these additional
> > reset was introduced in Airoha clk driver with commit
> > 6712f48eb3a1 ("clk: en7523: add support for dedicated PCIe PERSTOUT reset")
> > and on backporting of this commit also the clk driver change will be
> > needed.
> 
> I don't see 6712f48eb3a1 in upstream or linux-next.  Is this SHA1
> going to valid if we merge this for v7.3?

I picked that sha1 from the git pull for the staging clk tree.

-- 
	Ansuel
