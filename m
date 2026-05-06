Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34E740DFA3;
	Wed,  6 May 2026 01:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778030258; cv=none; b=UYWGQJM26TkTwxUe6jCv0OVSnysfYx2G4fsA40Pnmd33CbqCJLX5Kh+exO3b5e7gu3wPmh8Ie4hs30XyqApsKFOMdA8jISvUluWJJzLr2mk/PJiQP5mY9b6JPnJvsk1YvlLTqbnVlyDiMkCjL3EfKKZ7wrjSyOimMetoOtep6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778030258; c=relaxed/simple;
	bh=uNjE8zToLvULhjmqF7HY+tvd8kzOnaVgEL+CQvM0G8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJTdx8qlPoMjHXIYNMYbb6ftF3GtreM61AuUEndyTBZkbJ4m0saltGx36k1yPQPst8aus/1pBIkNvH1FMdtirPBzeJjkXgiMgFXI4OFrznh4l6oaDJabLy4D4dDO0I1tpsW4XhRUsM0SvPYSXPKoFj39Xt0oZDz64HdII7pfBxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6kwb4o6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6kwb4o6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25038C2BCB4;
	Wed,  6 May 2026 01:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778030257;
	bh=uNjE8zToLvULhjmqF7HY+tvd8kzOnaVgEL+CQvM0G8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6kwb4o6u5TgeCY84+MdSaQ+mv/FuL+DhauN5O7qq+tVu/ulRuA2G9Z0YxB1EckiY
	 gUX0AfhbdBGgxn/AqQbRxbifOYn+cSHmD6oNSeBc5oXXBxZxAUBYTZHhlLvFblmEIb
	 EueS9adw2IShYTjzGG0VpJmDoHOtwK7eWuIeem+EHqtOshPINv2M+Hbd4XLf4h77Tx
	 qn0jyvz41c6mE72lAemIerdl8jiT05Y2RoqmpH6vSugfMaiMf5p9BAwA8m+sZrnqIj
	 Q79YyV7r22viXeDRpLEjYIWDGX6/8v9pbByvWlKOccImmgcHDfktXXlulQHeth/w5x
	 R9me4TZSBAOZw==
Date: Tue, 5 May 2026 20:17:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add compatible for Hawi
 SoC
Message-ID: <177803025320.242630.3812073319585870856.robh@kernel.org>
References: <20260427190913.3680717-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427190913.3680717-1-mukesh.ojha@oss.qualcomm.com>


On Tue, 28 Apr 2026 00:39:13 +0530, Mukesh Ojha wrote:
> Document compatible for Qualcomm Hawi fastrpc which is fully
> compatible with Qualcomm Kaanapali fastrpc.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

