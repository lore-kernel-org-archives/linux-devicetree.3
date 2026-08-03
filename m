Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4693515C7;
	Mon,  3 Aug 2026 22:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796279; cv=none; b=rejbVLtOh0iYjK/4itIvxraGbC0v0pvA/fUh/xXS8ZWhj40MiqsIoEGs6z93DKi6uDg/YhSGF9QFZODCDvXqaLRo6pGqKDbCKjvgseES2iJzbG1IbzZBWDA9ewormn4enPEBaJ05a6ECoSnbDHZA0P+z05Rg/rotpkAVpm13WTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796279; c=relaxed/simple;
	bh=qGN8vrZdXiCvElkNpJ6ir2QOEItJZTI03Zo4xIU/vNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEPn+dDUqLhSSFwVZf+6/Rn9yxycZ+p7XHxae4ahCrJ9BwGGGPAC5wAaWJD465ONUo2YqKXDZCeEg05JUgVB0NIxhPS1jU/hxoGcrsDpSDpXSRnAwYufU2GEvCJ4o8adzeyECv5HuKOpmUWoQ7oAkCK4Ch0q2jcaSqoHZmDmEm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fai4wvYW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fai4wvYW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2709D1F000E9;
	Mon,  3 Aug 2026 22:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785796278;
	bh=/aiN/n1Asm2Zl9MHBeCc1YfU2Yf/s/GHPHcIybdwyLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fai4wvYWXLdRiSFL+hj7A23w8pTTOt5bARpCAuygELZkr3RK8dCk8oBz50Ek873C6
	 PGyHOjCTPTbjeVjOqNot4M+ZJfYHaQ2sEw/ESV91SZhwkxhbChaZ7y1h7sP/3vHIIs
	 LKNlZSS7RbuxCrDsxqD8p2hQD3RMeabl3S6Rib06306QMJBCkUPDGYG87l63SNhI8l
	 E2uAcRK2eWx50kCto3QcFRMGttr0lTy9hscx8yAOTLzfYth+H0jKG9Jmpknvj+/1sp
	 vDWH9aYnGzayLq1UgIiQ3pmKBlTmALM0mz+Lrhem0ArY88/8DsWMKwHluXp2PvQvIu
	 B/jRUYO+SHGrA==
Date: Mon, 3 Aug 2026 17:31:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Test User <test@example.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/11] dtc: dt-check-style: Simplify setting depth of
 DtsLine
Message-ID: <178579627576.761030.6701982479196885054.robh@kernel.org>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-2-6c9776928cea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-2-6c9776928cea@oss.qualcomm.com>


On Mon, 03 Aug 2026 11:03:05 +0200, Krzysztof Kozlowski wrote:
> When creating new DtsLine object, pass expected indentation depth as
> constructor, instead of assigning it immediately after, so the code will
> be easier to read and explicit (depth is not supposed to change during
> DtsLine lifetime).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  scripts/dtc/dt-check-style | 31 +++++++++++--------------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
> 

Applied, thanks!

