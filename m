Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789FA1632DD;
	Tue, 21 Apr 2026 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776771279; cv=none; b=XtnctzTRk3/zWP102yRLUjI4oJiF0U9OMXg+6203YiSCcPCy9Sj5uFN0HFcQyoQIMh4nxSIVdkNFrmEPKVcnpmHnBMUBOFxVtaSUjRWt258JEBqvsdBpHIivH9laXHAnuc+I+GxLCwzfLeW9WdjHkgTQni6lMoGEnEx8XOOtPxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776771279; c=relaxed/simple;
	bh=yXOXQvszQjUc/HSKlZnze6iRzqFPK8S+zZ/ndPOan3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paZRPgUR6XkdQdlCS07WIJIvqnjWfZh35SrtcBdvY23TzDkaz/J/ZHJAjqEzdEkuGwEkTAnQPM6CYo8S+7a66aAlSrEXvWc5FyWayu5hb1SWz2mvIPqZIMq6qPqCo3HhjESTXPQukpbqf9VUbtMg3gRGKLS1Oivf18uk80VawAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vhl+CJpu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vhl+CJpu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94045C2BCB0;
	Tue, 21 Apr 2026 11:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776771279;
	bh=yXOXQvszQjUc/HSKlZnze6iRzqFPK8S+zZ/ndPOan3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vhl+CJpuKT5JDrToSw9/FHRT5HySnQaHSjjDlVEwN3i1ZSvXOG5+Y9MzW3mpN0uHv
	 bKOWeOYkk8wc05t+sQUSAqkUAyQIHlxpjGNLH1jOFm0LugZXSvXjJapGsFfH9ZlzyS
	 mJ2cINBELsRS5OM0CpBCV+dUZm+8U2VpkSIX//sTN/ZSnop4SL3hL0Ak+CuEFeafqF
	 tMFUqjOFnsm+R29w8lZqQBD33WkuxnGDK+zC2WIdGcQmMWIQwUN/es6Me6IWJZwcTC
	 UBxlN9tlkXTDtN0ihJqbkdtIjcNyAI35FPkK4V85TJIwPtqxjZ1gWK/ctiHdbP+Cu+
	 /Ed0RKIut7qPg==
Date: Tue, 21 Apr 2026 13:34:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: add DTS example style checker
Message-ID: <20260421-blazing-leopard-from-atlantis-bfeb0c@quoll>
References: <cover.1776700167.git.daniel@makrotopia.org>
 <941c1ca0cd30c596556a88c36d28d60368867409.1776700167.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <941c1ca0cd30c596556a88c36d28d60368867409.1776700167.git.daniel@makrotopia.org>

On Mon, Apr 20, 2026 at 04:50:27PM +0100, Daniel Golle wrote:
> Add a Python script that enforces coding style rules from
> dts-coding-style.rst on examples embedded in YAML binding files.
> 
> Checks indentation, property and child node ordering, blank line
> placement, node naming, tabs, trailing whitespace and unused labels.
> Produces a canonical form and diffs it against the original.

Thanks for working on this, I like it a lot.

I would be happy to see at least a few test cases for it - bad and good
binding examples here - so development will be easier.

Best regards,
Krzysztof

