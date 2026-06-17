Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7021EEA31;
	Wed, 17 Jun 2026 07:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679895; cv=none; b=izY8x/Uf/vr8JZnXQervUapnZJhdKJbL63c4n4Qjn5IlEy6qa0QW3YFZT4OMIbe28l+bULGpYp7ubqKyvUefQZFYhipLcAwDJ9zSLD3NQRgp9MIOEh9scCtzVJNRd4H8CgmBHB5rkkNB8xyhWT0BFcu9QRE0AHP/INPyZmTN4sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679895; c=relaxed/simple;
	bh=hA0R/wpfCEHqf+AVImtSwcMC2fWGKJy9YHqbYAHf3Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTAY6PLNOmT1QDvkRyS2IV6iPYO+Wpp2Pah7eGyFNW2z3q9Sbx7BD2IMzGwZ8kSk3UVZzjntXuASJp8ZGoMrsfWBBl+ytvw1qqAWPQzPjM/ezSp/qG5AAt8DG9petS5AURSJnfjqVZblYfoFMjl3SUbT/E3O4JDMlC+wMY1nxqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODBkAT9K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODBkAT9K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7661F00A3A;
	Wed, 17 Jun 2026 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781679894;
	bh=pAJcsjJJugsSFUhlADNevGNfq96E2J4e16D/zpgtDjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ODBkAT9Kwa3h2vc3vIICWVHFBVvJdDXSNExTL8IJKOSwuDTnkljsRZ3yAolPm8tc4
	 yyvkIPKedK8rTuhvIm0vRa27tmMbSSTkaGdgXcwH90o9PnxeQkX/1l3rDh0M6OYomA
	 r5WM0nxt4enFbcynvowEdBmUrpcnipcKWPJphh60MkvTyExxv1nt/rL5ytZ2J1EgIq
	 EGTsVrZeGeObsbb6mtVzs3Braae1+lFTwyo+5tgdZT2Uc9kKTmCsNZmEAaYDOdclcc
	 IU1eN8zASSmOmXtX/ETMMKNCoIVqknh2RH0PCCJNV2e8Qmqfbo93uSTT5wGSCMUMC8
	 fjsjYs5GPAPzA==
Date: Wed, 17 Jun 2026 09:04:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Message-ID: <20260617-easygoing-cuckoo-of-tact-bd838e@quoll>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
 <20260615-ipq9650_refgen-v3-2-5f611623629c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615-ipq9650_refgen-v3-2-5f611623629c@oss.qualcomm.com>

On Mon, Jun 15, 2026 at 02:05:48PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
> USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
> REFGEN clocks to be enabled explicitly.
> 
> Document the IPQ9650 compatible and the required clocks for it.
> 
> While at it, move the allOf block after the 'required' property section.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

