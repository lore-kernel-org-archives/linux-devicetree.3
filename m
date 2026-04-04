Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570B13A4537;
	Sat,  4 Apr 2026 08:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289916; cv=none; b=NwvVFZ9Kc1p5zpfGpijWlQqdGVd61zYy4o6K16UHYi0yjoPVwry46Ws+CxvYMGR2SrPeW10I0NCy5Pch0zuUpmkApmoS5Fy2ND/IgqYya9NYLnHUlIdc8/D9q5ohxogHemGldr+6vkk7Ue0pvj12nvHScutTs8bizENDjl6TsLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289916; c=relaxed/simple;
	bh=+ZsFuW9tk4hpboN25ffYwk5fs+8ZFTtpTy5hNNCs0rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+ogYboZCaGR2ylrJ1kRcV375+Adk1WQULlEzwKQuU+tj1N23jXhmboM9sVFiSl03tJpVLwc/O5SrAit4FRsgV3WEnsBBKLXxtlASfOOjnWZ6Gf/2zNdD/FPQbWelRQ5tv39SIXdlLX5S07QJvaE0QD45I0FeHLUpif8xmHoZgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Msh7SXqa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Msh7SXqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49E9C19423;
	Sat,  4 Apr 2026 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775289916;
	bh=+ZsFuW9tk4hpboN25ffYwk5fs+8ZFTtpTy5hNNCs0rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Msh7SXqaYc4dEhC0eWoa9RuY3A/5Y3lbGZPolVZMuBeFMLMTY++zEal6AaERDxIyp
	 EbLrx+23Td8iphI2FqP+xkP2Wbj1DHHB8EA6suyDLv7rhbzueRrPER9cvRDhW3Vrp0
	 GwIb/iOCbqns2to1L8MU5ERT1XUJKGitfRdNGZ0sQ2BU2YreXzafQ/Mu5Bvc/rKYDF
	 1bQaLHrPSETEN8+Yu3pWtueuiwlL+ladx+2fKkZgfhLueyRrdr86ROtvZ4K2OGJ/ML
	 f1LtmVDt1t2NSV5C51QF1XLAAbJsuJNxtLQ/S2O60GBbz8VE1gHvGZFwZvxNTONS7R
	 X42sBlLXLMelA==
Date: Sat, 4 Apr 2026 10:05:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, daniel.lezcano@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, hanguidong02@gmail.com, michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <20260404-polite-parrot-of-progress-401d4e@quoll>
References: <20260403111516.379795-1-josh.milas@gmail.com>
 <20260403111516.379795-2-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403111516.379795-2-josh.milas@gmail.com>

On Fri, Apr 03, 2026 at 07:15:12AM -0400, Joshua Milas wrote:
> Document the compatible strings for the Milk-V Duo S board [1]
> which uses the SOPHGO SG2000 SoC.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

