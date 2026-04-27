Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466513101B2;
	Mon, 27 Apr 2026 11:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290886; cv=none; b=j7Au6BIE+FDJ7lST+mKmz8AmKCoYRXRXXVNUJqL4uqyvfwRoeAeQcXd9uecwxNyp+lqbMcbJ9Au2+54lBP1VrYlbTAusc0D9mXF0a5QlNG/ouqFDv1bEZdxmH6gqMhBljoJHZ4biigwKctmlWz/jj2zTbu6NEGAWj//fqQ+Zo1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290886; c=relaxed/simple;
	bh=itBLV5Jr/D2DqKYDJtBiJDVFJXd/tHgZJShMGQqX0m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCixKexQ/mj1uJ0OoJuxtSWO/5k5d9ohigOlaWlzOteaUyvmkwZwrokO0JbKe7OBugRegFRdJoR8c6gImcYdFBQ2WztOL19iYAKYM1ZjsvwJ0mE7MKYAThvUDKnnrf6Sn6vPSc5WnvK6I8TjXcNEIrf+dQmct3WvxJy2prBYySs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeYd29gZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeYd29gZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E172C19425;
	Mon, 27 Apr 2026 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777290885;
	bh=itBLV5Jr/D2DqKYDJtBiJDVFJXd/tHgZJShMGQqX0m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeYd29gZN0I6bH3tK3OC4ow0yZeiU62B0RKxQiQz9/1efGwCcLwVkB8lVnmk92yYr
	 /Vkd7EU1Ck/K+S2uuCO13l07azH5ghuVdNLs9PwczizRXQMOJBv8ltDoLQLpghHVz6
	 1bdWajSkrU1SqTXFYYJFV0byX1tpNrD864t6B0Rhh67fNmMBYMeLviLVJVz2uQn9mE
	 sF6sRySlEVTm3wTCEzQ3KEZpKnHcUHk+snhc3GLNlpVyydS9flqmgYIXm7LEtFLDsN
	 U3O1p+C/LeFv1q83Xv701z3PEImZ5Foy9DrmF09HC4nR644gejXNj9jNYU4mLfB3jq
	 cdsSGaHgXbSWg==
Date: Mon, 27 Apr 2026 17:24:38 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, bsatish@qti.qualcomm.com,
	akhiverm@qti.qualcomm.com, nicolas.dechesne@oss.qualcomm.com,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb2210-arduino-imola: Drop modem
 support
Message-ID: <ae9OfsQI6FUvQX_o@sumit-xelite>
References: <20260427112833.1160332-1-sumit.garg@kernel.org>
 <20260427112833.1160332-2-sumit.garg@kernel.org>
 <c037803d-d33f-47a6-8db2-736c7b49092b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c037803d-d33f-47a6-8db2-736c7b49092b@oss.qualcomm.com>

On Mon, Apr 27, 2026 at 01:43:08PM +0200, Konrad Dybcio wrote:
> On 4/27/26 1:28 PM, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > QRB2210 has modem fused out as it's only available on the mobile variant
> > which is QCM2290. So let's disable modem support from Arduino Imola/UNO-Q.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> 
> On previous APQ-y SoCs, the remoteproc was still physically present and
> served various functions (among others, GPS, IIRC). Is that not the case?

That isn't the case as we hear that modem is fused out on QRB2210. Even
the marketing page here [1] suggests to use add-on chip WGR7640 for
GNSS.

[1] https://www.qualcomm.com/internet-of-things/products/q2-series/qrb2210

-Sumit
