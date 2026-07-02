Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD5430E82D;
	Thu,  2 Jul 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783009312; cv=none; b=tQze58PAFZEsifhTCHnlwXoGV7xeSu+qJcYxScG4+0Lob+8rksZDOAUoM4FIdKhZe9el0v3mW3oFw16E7gKWp8bIHdBl8YbJFJP5z8q/f/Xw6vTuGutjQfFfKirYyiv3ddTxQqAGUIJwDr5BaG3MdqZCoTIiMq3ijFXP4Wenxxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783009312; c=relaxed/simple;
	bh=xoB4QKoKSGUO8hwA/LhK2647SYVdpl8JBmdlUfzDB3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTRGXWWNDF/xVElffoRp/2C1CU0nHYUXA5wOlGfC4pRbaZCEg0Iv/TYmmshwF31R39LBbcMYTgQpkLvbnAaOgjGXq9zsPMPS4kPytOoDncljl1DYzI56F0RFt9Ndnzthzl3qJ7jr2Co5SdN9Otm7NXh3GN5CBHQU5gX4NmwyIHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htVfk/tr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htVfk/tr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAEF1F00A3D;
	Thu,  2 Jul 2026 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783009311;
	bh=lRYYfuzSFOeRYJmv5cGsJm2KFhklobIhVjufiS+redM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=htVfk/trvNAhdz5EgvVqZggl3T8bU4hz3U6oSLizhXEk3qThqH20gxrU5CiwHTRsU
	 9EnrfDOZxbrZQI1ZBdWAxM9SQr/A5duQR1wxwTi8k300wQiY0mnyNDgjxteyX09xlc
	 5kBywlNeIjzldoQUpMHO335lTjyYrrvwuuAPwrXvSRc2YVMpekFs3EN5fwAdRx58Gh
	 aHFob/YFUb7yh2hvOR0bkTQS3Heimnq2veu2PW4zpmsznZ0g+729gQDUDUI6bjQDuJ
	 7kF8HLbvNoyabpInTuS72WHN7MVqpsVnpFP4mFCkLuyyz7nXOE4bUdy//+qHvG07Fr
	 Gws/FRVC2IlNg==
Date: Thu, 2 Jul 2026 17:21:45 +0100
From: Lee Jones <lee@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH 4/7] dt-bindings: mfd: syscon: add ESWIN EIC7700
 compatible
Message-ID: <20260702162145.GC2108533@google.com>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-5-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615122016.1110206-5-pinkesh.vaghela@einfochips.com>

On Mon, 15 Jun 2026, Pinkesh Vaghela wrote:

> Document ESWIN EIC7700 SoC compatible for syscon registers.
> 
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Doesn't apply.  Please rebase.

-- 
Lee Jones
