Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D55B47DD67;
	Tue,  5 May 2026 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996023; cv=none; b=KfYLSwuXdI2v5QEUvgVP+EvqlOJBXjyDJMgJEqBWzaAAI/n3ZayxdKpLU0TUEG0VCkAesI2IuJs44vPDVSGxwzt4hco+YBEefFu0PW7l1qabCslG9Fz35ggrmWOL4bQGlUpJIAQaYUmE1oSFi9Y+fcfT4H5HdMegbLgwka8g/K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996023; c=relaxed/simple;
	bh=loSXYggyKfor3zLcUOfD6vEQMzQ6HkN5o6t2z+QPJNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4Uub6iA8Jh5Q355Ixw8SwhhLgKK3RD3Ax8z8goli7efDKsC4SWZoFumW1OOedVoi1z3GMl/3RnSQ2FmgmJYJB5PZKg8XMONINFOmKmysFCumSwNILSTXu4EIGmKu2fdLjxM3z6Fi0e9OJPq40LyI4LFWwo30BF9RO09GvA6nlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0WcJMCF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0WcJMCF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2D2C4AF63;
	Tue,  5 May 2026 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777996022;
	bh=loSXYggyKfor3zLcUOfD6vEQMzQ6HkN5o6t2z+QPJNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0WcJMCF6UILtJk2Trr9mpUfzIFex2vuXu8MVIv7a+dBezzR0mTxDvj5zSzU3FOua
	 NKCyOo/hKORk6yFnRVZjUnzEuu/WQW/2f2cHfamuYplYmcslJKOXbU8CbgLluUCYcv
	 hJI0gOLUYRBiifX394KWtkw3ADI2x51JEn/jblV7c9X2kN8Y+Cra25abgEe6aISqMJ
	 DvKFP0qu0hzPTStPnwpE4IYSXX8wkgNmX76HvpDw9l0iPQhYFcG2t4l8hp37Sf8DYB
	 Bj2A/JJ7HedGdR/NS1LSvXyN2LIdEnkWnt3zKOFk6djFSMnm1gy37b/Dj39zOqp9EW
	 RX7zu71h0Rd/w==
Date: Tue, 5 May 2026 10:47:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: misc: fsl,qoriq-mc: drop trailing
 whitespace
Message-ID: <177799601839.2983920.8894154052886581968.robh@kernel.org>
References: <cover.1777434096.git.daniel@makrotopia.org>
 <20fb6993052534958ca57b537204de6c5617215a.1777434096.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20fb6993052534958ca57b537204de6c5617215a.1777434096.git.daniel@makrotopia.org>


On Wed, 29 Apr 2026 04:48:38 +0100, Daniel Golle wrote:
> Drop trailing whitespace from example.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

