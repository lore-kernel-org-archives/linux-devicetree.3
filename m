Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C603B2FF7;
	Tue, 28 Jul 2026 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223737; cv=none; b=sdYUVjTa8x7xY1JN4ntffU6s5m4kzns1+eZhjelW/a6mhKsllI2o0cq3qAwFAVhxL1HzV7ku+YDz0GWj3VGN/yDyO6rQ5ZDA+vrVnO3rUFMXrpN7JfEg4K0p6JdI1pmuf5CTgJLiFucdymnFubk9WLuxwkydvlagv6C0NdMChfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223737; c=relaxed/simple;
	bh=U9KdWUTtmYmRhZrYgGD0YTOGMKsa/KnZQKxc7rG5BMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhRLJgk+VTy1h1X9TtInTlYsQ6klbAbiPg2bydIV9QAZh2IoYIOdXfTWnJPMfPcEBkP2ac0GCBqUV0W5Rrpy/CNEDQXK9SKawxTeRYfqHSQT65kpY78+SwXQzFUMukN2lm81t0/qgKtTj4PXn/aur5nqAS7gyuMkxeoqnsR9kjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hj9zK6cG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hj9zK6cG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51351F00A3A;
	Tue, 28 Jul 2026 07:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223735;
	bh=cu2VZplaro+n6d1vQu+s8aSGiFFmv3F1Me9G0e+sQ4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hj9zK6cGbW20pvXs3JglLkBH19ee21GQ6PRQu6+TjRMqYIRkYHVlHE0exed7Uvj8r
	 oiELQKoHN5mnzWmhNSgVhzAlNKfHpoyhD3PIwq94Qdw/CRMNXJknmzU78lcgcG1oV1
	 Jx0faE3WzlUl9ZqY4blirBADzVvXenN0T3sG+Ho4vIaok9n4aV6e8pU42nX0FFWY2y
	 miATA2b6nxcsSAZfn0u4DzChCc04Ta0N35qTtvSX3joROA4OyjmbywZUSnvS5f1LKz
	 mB+Go1dJqu7h7mK5qDAunQ3gay6rRkgSB1nOtbnpBCR/+rmUyScrIptzud/u1SVa9X
	 jg4+Ra/abK29Q==
Date: Tue, 28 Jul 2026 09:28:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Victor Krawiec <victor.krawiec@arturia.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] regulator: dt-bindings: Add fan53555 allowed modes
Message-ID: <20260728-portable-tactful-newt-eafcc3@quoll>
References: <20260723094001.120264-1-victor.krawiec@arturia.com>
 <20260723094001.120264-2-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723094001.120264-2-victor.krawiec@arturia.com>

On Thu, Jul 23, 2026 at 11:39:58AM +0200, Victor Krawiec wrote:
> Fairchild FAN53555 and its clone from Rockchip, Silergy and TCS support
> two modes of operation:
> - Auto-PFM: Allow automatic PFM during light load (default mode)
> - Forced PWM
> 
> Some boards require forced PWM mode to keep the supply ripple within
> acceptable limits under light load conditions.
> 
> Regulator mode indexes are starting from 1 to keep backward compatibility
> with existing device trees
> 
> Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
> ---
>  .../bindings/regulator/fcs,fan53555.yaml      |  8 ++++++++
>  .../regulator/fcs,fan53555-regulator.h        | 20 +++++++++++++++++++

Feedback of Sashiko looks unanswered, so dropping this from Patchwork.

Best regards,
Krzysztof

