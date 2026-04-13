Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0263C3909A2;
	Mon, 13 Apr 2026 22:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776119143; cv=none; b=QPPHJOx4RB3TsqQwx8KOySjE2XuECNDVQHcjrROABPDMfjQOXZIeMnLCtMPmkxz/CZJQosY5XW7LM+B+a4F7XlrVWYgkvVaQkn/FZC+kw5Q9NmWLHpI5Utz2q0UcZoD/vUM8p7YIJf+66LIn1/FTh1rI8ZcpJ42VAdshJvITLsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776119143; c=relaxed/simple;
	bh=qPxaChfzSVz+uzhSLWRQeUwbcPQeVKJ23FDo/WyT5MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2jvtgQazfsj7rIvuf9xlYsd+alSSl7FkgG7q+YcNWUDUmGj4QLaQ5rEQUKMa+esIa2r5K4JUWSNKwxT7ZNIKEEAS9O/kgKlY0MTrturRHDeNycuK6MRY8QD5ew+t9AMJ2nNe7UiJ/nPVAKSuvGx/YcbCXd9bS9BkXN0RaRNAIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YU85GmQw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YU85GmQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59840C2BCAF;
	Mon, 13 Apr 2026 22:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776119142;
	bh=qPxaChfzSVz+uzhSLWRQeUwbcPQeVKJ23FDo/WyT5MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YU85GmQw+yaNCVSUtKQ6P7x713mJkyn58xlCwDeNxHOUNuGB4Z7w809cn00VYrSwA
	 yuG5l0MQESLeSoGeuTekIeI7ZsdgaNUCHolXeifw1jTtdhxNj4atgYLB3HVbe2jq0N
	 eIv6ruoncOSndBprOEnPYAgSefLen4/Q5evdCgv+lW4KninYocuzj1uvh3kRfVLIag
	 jSeUMnyZuKRf25uepGA+QWGEa1WgE5vgR++PFDhT9YmuL5+0v8HTjgVVMQ0SgjkSpN
	 CB1lK2rSzwg5IDGNeOmPJn+3vHgkzDfKuHX66RUPnSC9Js7awSQWPhGyvjI2Msn4fp
	 52YrZqqksiMmQ==
Date: Mon, 13 Apr 2026 17:25:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: qcom,pdc: document the Hawi Power Domain
 Controller
Message-ID: <177611913959.3647505.2231745846728551068.robh@kernel.org>
References: <20260401125004.592925-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401125004.592925-1-mukesh.ojha@oss.qualcomm.com>


On Wed, 01 Apr 2026 18:20:04 +0530, Mukesh Ojha wrote:
> Document the Power Domain Controller on the Qualcomm Hawi SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

