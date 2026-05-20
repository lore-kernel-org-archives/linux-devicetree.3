Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7AA3DC4AE;
	Wed, 20 May 2026 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278542; cv=none; b=t45657usFRt2MjAWm2BmjK8PtbA6ni/Gf/82739opxIuHjDHX+/7gdEHthZsYM84hcIvcFZVlcgENDVZZPp7FZByJZjoYsgryn5QpbRLNowvt8BT2kGECEbfzwtoeGs97vDjoTjbGUMeVDxE+2ImhCeAf80qGSa8O2+NKMJJmwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278542; c=relaxed/simple;
	bh=IwHoBwTcu9CoxNvtGrR6WvLxihfPTWzT3QCtYOHUpO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfsooBZeDc812fb/PDepMGbg6xScZkkMX9X+BTd7B0B8nYUKb44TxXQjakMFB4uy0Wdd0m2KCKO3jBnK8UgyYZ4rX0sKMMHhjJwT3M9HeRPIoVzzHd5aS65YDdacBww7720dbScaYzm7Tnqs0UD0cJobizQ662wsxqXBJxtFrLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyMWBeMm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyMWBeMm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF241F000E9;
	Wed, 20 May 2026 12:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278541;
	bh=OwNl1UX/k4o116gRoppXZEvVWlPAyHPJkGrRGNCJ8nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UyMWBeMmGSmmzk0MpyjUc77HHlhoo380oXbCbvkLlsIb35ZCTVHfAG5Dofwh/UKey
	 54zfMhLUiJkrFiyF34Wi4HRApPCuBgt7nnS/xFPTyueuqLAHLBXCSuqxFpzBf+PcNH
	 Q1cSmeOLtnS7aMu9hKvtg2IdGniKxH5HphDJAcmUqk8zkwHEq+nKXSLBwboVVho5Ui
	 98vKMJblYb2tZH85rDCCdaLhh1PegQ+X1pnj6mq/lgMUk7rQsRomhDYkqAUZo3CiLQ
	 cXPrFnI4n300iUH0oCs606Xhp+vzKQU+ai2aerXzg7YOTSv213zBddL1yAC+lHZSTs
	 5sRontRf6EUzw==
Date: Wed, 20 May 2026 19:43:14 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i3c: dw: Remove core reset "_rst" suffix
Message-ID: <ag2eUlweJdgWRKUG@xhacker>
References: <20260519055105.13079-1-jszhang@kernel.org>
 <20260519055105.13079-2-jszhang@kernel.org>
 <20260520-scrupulous-notorious-ibis-ab6cbc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-scrupulous-notorious-ibis-ab6cbc@quoll>

On Wed, May 20, 2026 at 09:13:58AM +0200, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 01:51:02PM +0800, Jisheng Zhang wrote:
> > It's redundant. This suffix has been in the code from day1, fortunately
> > there's no such dt property usage in all dw i3c users after grepping all
> > dts files, so we can remove it.
> 
> Hm, how could you grep all 3rd party / out of tree users of this?
> 
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  drivers/i3c/master/dw-i3c-master.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 655693a2187e..c4a848cc978a 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -1587,7 +1587,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> >  		return PTR_ERR(master->pclk);
> >  
> >  	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> > -										"core_rst");
> > +										"core");
> 
> ABI impact for something released since 2018. Cleanup of name is not
> really worth affecting users. core_rst is not the best name but it is
> not incorrect, either.
> 
Hmm make sense.
Two questions: if the ABI is introduced but never used by any intree
users, is modifying the ABI taken as "ABI breakage"?

if the ABI is only used by outtree users, can we modify the ABI?


Thanks
