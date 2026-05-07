Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A49C36A008;
	Thu,  7 May 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162488; cv=none; b=Ffey7X3fH7oS9F4zA9GLTZKbsRvlFk4JKuzmJSf9AKE73o4aV7V3o1R/ZINYkCB1Y2sZ9phdQQuGWYBc5SFefBACaf2bJgkzsCcTvdH5udlZu3vNPu/JrVauK/hLbPXiC37oJe4OJKHbSjNgJ7Dbd/hiDWYVKSgR4SOGkGM36IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162488; c=relaxed/simple;
	bh=9Q0yyTk8fhXxRkGVuTTrnubEiJEGi19GcYh079J4Fcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7D+ZmobyRJlo7JekZ95RYjD6JglWUsUF/zc8spaBpCKNQ4o47Ufta2Hyj/FJu/dWvvlCznKkAliIKQz5KEWCyUWqIQjm3KhOZ4NUm4J+1/GIIEU+tLUuXvxDjksgTg+wup05RKoNX/lkvT47RssBiwFtgUDaYZpRisNX9Pfxwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muonouMR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muonouMR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03478C2BCB2;
	Thu,  7 May 2026 14:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778162487;
	bh=9Q0yyTk8fhXxRkGVuTTrnubEiJEGi19GcYh079J4Fcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muonouMRmz1mLBSqyt9jAC//B8uXcEGLmbv4abi8Qejf4pOL67pd8eLqbDKMzATtp
	 Mn+eLLv8KsDv2NXzMBAnU7aMRSGGvP3zUYMuzqDA/nRR5rvUA2KVmzoolGLJgLPPMj
	 M9Blh8hpS5JlxYadk8NyLTmO6L8AxgOZYpn23ppwl0zFsrCpP8yspdcuwPUv66VVKO
	 wzYh9D9TQd+h6v9kn75demlc8RnpT789/P0ofi/WcpMJteOzNxYVtqzhwIJ8cPXJ5H
	 gbjYqBqkZ/9qujoL8iWB525jly0ymZAJRCQZADfj+P6pI3YU98LKfMB0nUnkGHMsDy
	 iUj8umqKLO1gQ==
Date: Thu, 7 May 2026 09:01:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] firmware: qcom: scm: use dev_err_probe() for dload
 address failure
Message-ID: <afyajZbt1hjEbgvY@baldur>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>

On Thu, May 07, 2026 at 01:37:18PM +0530, Mukesh Ojha wrote:
> Replace the bare `return ret` after qcom_scm_find_dload_address() with

Describe a problem, not an action.

Why is this patch part of this series? I don't see how it relate to
"minidump SRAM destination support".


Change looks reasonable.

Regards,
Bjorn

> dev_err_probe() to produce a consistent, deferred-probe-aware error
> message when the download-mode address cannot be resolved.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index d9ee180388aa..f65b132004a5 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2762,7 +2762,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	scm->dev = &pdev->dev;
>  	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
>  	if (ret < 0)
> -		return ret;
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to find download mode address\n");
>  
>  	mutex_init(&scm->scm_bw_lock);
>  
> -- 
> 2.53.0
> 
