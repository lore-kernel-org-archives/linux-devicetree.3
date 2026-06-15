Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C98399368;
	Mon, 15 Jun 2026 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781549269; cv=none; b=dGCWJQ2+AR7A5snlSSBaV3i863E57BqKbvWAiTkZlmIhXPpZBlL//hbrULdAp0CRfg2t519YVmXRMI9aGvfrItlA849dc5JTTvxdAqzM4vy4cSgLIdGgBxjOnnms4DMEzisJ9uSpQ/gNHSkKH9OonwfBCawPvNB3m58iwcjMOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781549269; c=relaxed/simple;
	bh=0aQGBD6S6kEHYgQldUuMZDzgq/n37SvfF9L4T31VIbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae6epR9S16BTGS32prOhGKgw4MZbXaeLUHByTaLgh7uTmka4inL5yQUY/WD8xk6Z7LAhDOrmuSU0Uq/n+R4ZttUutzRUbQKeYi1cb2IP98msV98RJUeRCzk2dvaAhh2hy9UG3/KJ3DkiLsl1gjPP5h4s6EC8V0zTQzGed1pBqYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEdnoyF3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEdnoyF3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842921F000E9;
	Mon, 15 Jun 2026 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781549267;
	bh=zGDBs7I3YreXD/IUGMqkjjLhU/prn7VbGZ1OD8JFuXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GEdnoyF39qMjs2HxENX6x4iu4ipTAJw56Vf+XpRYxf9FGDqNSO0e6p0IrrquC5OrO
	 2JDq4tmhAt317Y+g8qRd6HMKmInpbS8Q4NNDzh02wFZMVK6taSe12041lp+9FluwCY
	 cVES/LPaACoXEgxC16imMnls7xeBqDuke61UGQ2/ykdBXRuzDiVVph14gPAU3oEb/x
	 iE5n2+0TbK+1Cb1qayhAtcKbetL76BptJd/ZBP1U/C/g9pkOiea98xQ/UMW9SG9plg
	 POP+H+RPC1FYULSYY4wxYpQ8uuncQoUpTQepe0JkTBX7rbsVZodAJ+j5Zd1v2Uxi8x
	 U+DGrr5gkW1rQ==
Date: Mon, 15 Jun 2026 13:47:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Add Qualcomm PMK7750
Message-ID: <178154926418.1631495.12449205672256857033.robh@kernel.org>
References: <20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com>


On Wed, 10 Jun 2026 14:41:20 +0200, Krzysztof Kozlowski wrote:
> Document Qualcomm PMK7750 used with Eliza SoC.  PMIC is almost the same
> as (and compatible with) PMK8550.
> 
> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

