Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88A309EFA;
	Fri,  5 Jun 2026 19:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686298; cv=none; b=JdyzYtRhVEgBx0lsOuWyPo6Swf01AJSl3Ai1Eb7Vjpt1RBPLbXHLzABywj264H6upVp70d9z/LXdHz8a41NCT8S2rx7ocPij2Vs+aClgjzsCYhEWLEXuWXb74H8k3Bx32XPGKgFCnQwjhKRFUznCQmefVW5mNbsQxmo8i1+YxcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686298; c=relaxed/simple;
	bh=r1wlywnJiQ74kt5wDlJ1Ja1cshRmDMMYYHoc6SRbhSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqZsYazuM3ueOH8akbTD33OS40Wg61JcWWXnQ5PtXaH50+Y4wjTPxmCjztXEPksaq2NQ3iWhtmb8EJcTrosIIv2Pn2CRaW2CLUhmSgeSSTV1iXlPjjeDKIP9jR7d0iizax9vlQtjaalJOI+XsPWcx3Jn90ygHv4aowtESZbBT7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hm5LKmx+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hm5LKmx+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FD81F00893;
	Fri,  5 Jun 2026 19:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780686295;
	bh=Yse0SqJjEnbdUJl6eHAZpQ7EdaKzGdPFnXWp4ZHcKng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hm5LKmx+R9my0USGZtnjUidWmmc3a0Ick8ey1lhhvjn+YlomoCYpBVpfnGV8ZwVzD
	 e+Aix/+uzmGiy3JEOhaBtkmz4SbNx9v3UnDoTcv+qNXygUDDy3nZL5/iz0JoZ0tLLs
	 1yYluIXXdRt1kTAJ98Q7wRkcP/g6LJ5J/govIWZ/qyb+IxB0R6jES9Yqiqmg39h5IS
	 6lw+6+jSj82wcAn/K17qd4ku6lxWXc0hibLmfBInTLkLqAY34Jmhg0eI6q0UZkQ3E0
	 F4dCo6EJopot1yOKNYeBlhwcgMoSUJSlECwDOlV6kf+yxS8TTRUVaDzIYQWhz/iJ3M
	 rxZevRcs8fV6g==
Date: Fri, 5 Jun 2026 14:04:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-phy@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH phy-next 01/13] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <178068629376.4187871.11165995094571921556.robh@kernel.org>
References: <20260528172404.733196-1-vladimir.oltean@nxp.com>
 <20260528172404.733196-2-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528172404.733196-2-vladimir.oltean@nxp.com>


On Thu, 28 May 2026 20:23:52 +0300, Vladimir Oltean wrote:
> Add a schema for the 10G Lynx SerDes. This is very similar to the modern
> form of the 28G Lynx SerDes, which is very much the intention.
> 
> We allow both forms of #phy-cells = <1> in the top-level provider
> and #phy-cells = <0> in the per-lane provider for more flexibility to
> consumers, and because the kernel code is shared with the 28G Lynx which
> already has that support for compatibility reasons.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: devicetree@vger.kernel.org
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

