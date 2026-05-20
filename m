Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92F8375F69;
	Wed, 20 May 2026 07:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261242; cv=none; b=IQTGCSHGXjqQXK49x0HOyshgruPUiYKC3ISqGf9lrRi76RLhIk3Rua5Yep3FtwtNo2FNeqMEBr/nFvL1nNIdJC1pitThGxuRdu5dF1jid0tSWUlsSydlOebVt+L2FIdAyg/wNrQpBXaq0+0iTX17dspoBR6EKRNnAx6zmltX9EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261242; c=relaxed/simple;
	bh=7bhu/3pwHi0a4RGUEM23KsJ58cl11RCTYJ1eCoKexZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzPEFkJfamcMbCXBf6SFUYay1e2jQyEO4tgobr/wEf4ycudvMrZPywkg+pJhMq4quvZZpCTbOoF/kBHRdYAp3otcax+Siw839dYoJxb9h8cJD7KJMuBIbwxe97uchGiu8VMUEMjGsp5+1tYTACp3Q4/P7XhyUViS+JhuV0LlIEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eavSexl3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eavSexl3"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EB9B31F00893;
	Wed, 20 May 2026 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779261241;
	bh=ynRPwo2RCDanVemDlYKybThG1Y1g4MsFCiwpqfVobF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eavSexl364HbOovm6py2OAe6GkarbNkB/3eF32hZjEJtlpaKwXTB5zVifTZozUuO/
	 eGZeL6M9OJXHl9rBU1tLt0lPXz7HAXA/8YC8zQLVlu/KFAZK7yPHE+2t5MlxLSkTtn
	 BJ15mumJw3fq1ILaqLvWQ08vol905ADRm9L7Q3bUNncKLYxTVWJQJQ8DGspUUHLpyw
	 YCifWMUx3Pg/Ux+AqeMihGZD/vg/5HwJAlSlTSlAsWzbEHc2yQbh7FTKIibuY3wSb7
	 BknfOxnD3ENjbdSuGgKlcgO0ImLIKUpRHpv/xdiu+r9o5tfE7hbhdym4kTrRSvqjLd
	 5wmOPgdyp/bKQ==
Date: Wed, 20 May 2026 09:13:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i3c: dw: Remove core reset "_rst" suffix
Message-ID: <20260520-scrupulous-notorious-ibis-ab6cbc@quoll>
References: <20260519055105.13079-1-jszhang@kernel.org>
 <20260519055105.13079-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519055105.13079-2-jszhang@kernel.org>

On Tue, May 19, 2026 at 01:51:02PM +0800, Jisheng Zhang wrote:
> It's redundant. This suffix has been in the code from day1, fortunately
> there's no such dt property usage in all dw i3c users after grepping all
> dts files, so we can remove it.

Hm, how could you grep all 3rd party / out of tree users of this?

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 655693a2187e..c4a848cc978a 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1587,7 +1587,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  		return PTR_ERR(master->pclk);
>  
>  	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> -										"core_rst");
> +										"core");

ABI impact for something released since 2018. Cleanup of name is not
really worth affecting users. core_rst is not the best name but it is
not incorrect, either.

Best regards,
Krzysztof

