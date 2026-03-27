Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2D1A0BD0;
	Fri, 27 Mar 2026 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774597046; cv=none; b=QuxYwtNrx1CMi00cKiOWkfoh1SpaiBcGxLzeXd2JnaV5uowQWc/R86FdqdAj8Ay+8TG+4uagnPruuhUmkx41eb02v5sO0rAPjCVUtJjEJCiZTH3K9sNV2WunZUtiIT49iwqjGgN44W1k4sTxlJSMu6p9ks6TRc3EIAqF0ODYGRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774597046; c=relaxed/simple;
	bh=RFYlVF5pjOf1wFYqyCAoBa2oIpmC6D0fxdbGOWGruZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K86BdkVcOEN8A0Lke0hVY7nS/OUyINXDijFNrnYjVCFFgwQldhyBxAk8f1ZS2dCGu9BsHMx/7KduvDLHjwGHWd02SoCQpOQhnV+46QLlVJ99lRyq82Pmw6XY8rdwzxNP+l3TU/fjngj8V86feb94tVPETe6zt5xNKkJT8gx7PM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXV+Lrq7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXV+Lrq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA0EC19423;
	Fri, 27 Mar 2026 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774597044;
	bh=RFYlVF5pjOf1wFYqyCAoBa2oIpmC6D0fxdbGOWGruZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXV+Lrq7KW5gf2HBSS94mcpq0noUR0m3JcNHjEJLtnAusHkMvMHHstb/0ZUuJknVE
	 XiGp86OPSxthq3AVcufuKehFFZg3S6CNd5CA34cmB7+/S59Fa3RlezSW/5RpDTtPBU
	 euV5x6jjHGyeNCO+t5QLomUaNt6PZWpYKCd4WSKjC7ncZH1pD0wEnvjEarVd5wRkJl
	 MwX0+gBdVtYt/vTeyU26NSQbI84hQE5jbC6G/t+OltFHd9SIz/zT6S3Ygg+E16eOzb
	 124a8tAbE9COYUMkyl2wVTqw8+RXhSZVOzHqJnNkNX33AGIT+gaUIp35s0GAlAPSjW
	 6LSyeQbHTqzvg==
Date: Fri, 27 Mar 2026 08:37:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: lee@kernel.org, andreas@kemnade.info, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: twl: Reference converted YAML schemas
 for subnodes
Message-ID: <20260327-orthodox-brainy-poodle-738eac@quoll>
References: <20260325095016.48752-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325095016.48752-1-jihed.chaibi.dev@gmail.com>

On Wed, Mar 25, 2026 at 10:50:16AM +0100, Jihed Chaibi wrote:
> Now that all TWL subnode bindings (audio, keypad, twl4030-usb, gpio,
> usb-comparator) have been converted to YAML and merged into mainline,

subject and here: drop YAML. There are no YAML schemas.

> update the parent ti,twl.yaml to properly reference them via $ref.

> Previously these subnodes used inline compatible definitions with
> additionalProperties: true, which meant properties defined in the
> subnode schemas were not being validated. Replace them with $ref to the

No, they were validated by their child device schemas. Everything was
correct and expected.

Best regards,
Krzysztof

