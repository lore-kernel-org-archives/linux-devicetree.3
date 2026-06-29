Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22823BCD0A;
	Mon, 29 Jun 2026 07:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716464; cv=none; b=Gaw17KmHX4Q9aCLv8ORGM6QDZhJ5idh0nQM4S4g5P3VttVY7r/cGn2XxqOuwA1JCW3XBsb7lwffkWdOs9G4ARzY3QqW/RZCJVJ3rjLgmu8K+Y1mcyyzfc+gAi7kpFnu3bfWlh+RjwMLzaANNy4At8AriTN4X1CyznARgqop5uio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716464; c=relaxed/simple;
	bh=ab5c/HahK1A6PXiqZaGoa4gSnTB40iS+GdiPXoVl7PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zmsry2Zl/Z3CwjCBqj+wjeuu3X5JriB5iXQeJSKyrw+HezCfhaRmQ26DeYYHtsiZBdBXP929RennzWd/tzWX9TfgmAeDzaMRyYwpu/tdOk7PLCbrmIQmFeGuLWnCIGopGEHk92u0i5qT7JvkeUlK93iZlfLbcMhjmJKXZdFg8rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1E21F000E9;
	Mon, 29 Jun 2026 07:01:02 +0000 (UTC)
Date: Mon, 29 Jun 2026 09:00:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: socinfo: Add SoC ID for SDM850
Message-ID: <20260629-spiritual-arrogant-trout-d3b1db@quoll>
References: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
 <20260627-sda850-v2-2-44bf46ade42e@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260627-sda850-v2-2-44bf46ade42e@ixit.cz>

On Sat, Jun 27, 2026 at 07:50:16PM +0200, David Heidelberg wrote:
> Recognize the SDM850 SoC.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

