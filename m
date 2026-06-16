Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9472303C9C;
	Tue, 16 Jun 2026 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617998; cv=none; b=Lyso1GmTBCT4z/Mo15m1UBgz07yZ+esCGP742ChP0MzTdqsoS8XvJRkQo1cxtURvdmWKJPyuPZOYS+dFHuA+to+QVe+XQnCqbSPatIi/b86T7dngcNBseFs8redxo3uNKOyC/6eUspdkD3UxRRLn4K90OainHbMivC9DoI4N5cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617998; c=relaxed/simple;
	bh=WTatwfI22UxeblDbcKSwQlC1ZG2dALRea85VAx0sQzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7Y1Zz/K6ejCTvbstRbMzCNfWjsH20l4vjIRA/mHY/+HoV+etp1mW+F3P44PwBRiIndRGPhrz6ixHDo9VgIa2bHdoBjV36btl6p6/OEuIxedb11y0m9VUqIx9E5BIhjKnvqAy6RIDa71qruhPIc1JQCHJTqckjS3S208mv+JHu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsPAd/BJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsPAd/BJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BE91F000E9;
	Tue, 16 Jun 2026 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781617997;
	bh=8apPuupUBTzcIqJ0vwU4f4jvZub+nypFR7A9VH4COf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CsPAd/BJrw+CCOe3DOSKfMW83AbCDWFD+KFf//7HsTS9WqH4VeLPFQPicm/gvvGO9
	 JiAWh505xKBXng+USuqaSw5W7Bf/qVk780fmSiFqeuHwdk/dhKZnAoUVtrMQ/hmnBR
	 ffWpRFg+oct606/DxKUagD0MbiC0Oqil0zWWctXp8DKsvwGEoR3gi5a2MaCTmH6Pd+
	 wfYQH8stWS30BAiluKBbQ+oKAvr5IlH9yivFy8crxdshkODLRFxlopCayQQlsKLkF5
	 0r7B+M/p5la6HrrGUoEFUYiIyriOMTqxtTT0c5UCDYhDx+3fhoUsYOLeWPWqr82f6a
	 OdWR+PPJVNltw==
Date: Tue, 16 Jun 2026 08:53:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH RESEND] dt-bindings: interrupt-controller: qcom,pdc: Add
 Maili compatible string
Message-ID: <178161799282.2361519.14936351019925087319.robh@kernel.org>
References: <20260615-maili-pdc-v1-1-add21e8eec3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-maili-pdc-v1-1-add21e8eec3e@oss.qualcomm.com>


On Mon, 15 Jun 2026 16:28:37 +0800, Yijie Yang wrote:
> Register qcom,maili-pdc as a supported compatible string for the
> Qualcomm PDC interrupt controller binding.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

