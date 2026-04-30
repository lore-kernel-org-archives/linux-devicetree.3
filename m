Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7033A450C;
	Thu, 30 Apr 2026 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541917; cv=none; b=cqDu9x00qI/qySmOQ6EqjS7xemo8QYUG96QzEzr5z5KUm0sOHgmw2hXnr9v7vAfVU5Br2VGr4XeqQZBHMneCcJNeS7zvP0DTiAE4u1s/S7rz0ikXwzifMf+q0iw/uECJC0LK9WuGNkXeoasya84dlqNyCwCFTIP/t4+xxYNXeGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541917; c=relaxed/simple;
	bh=JiT+0O5PVve6jQjJOFekHXnlt5jKctxL2hT5GIHUfbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llxb/KjEb8lGP1cImXc0qWR+GKnMWDKc6kbMcb19hPoDAFwn2C8wefSuMh0AUK2zRnAgBaNtHxbOAd+rL/QIkiqmT8HRGeJm3zct7r6ALxY9QfYTg45OgEQwky8xKNNUkd4X9DZrSq+QI7mOXQTqnndwEy3+LsO1xc3pZXpoGzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTawBjCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTawBjCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D3EC2BCB4;
	Thu, 30 Apr 2026 09:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541917;
	bh=JiT+0O5PVve6jQjJOFekHXnlt5jKctxL2hT5GIHUfbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTawBjCVZMssZ7Mb0KLf5BAvzP96xpfcHFpL7e6y50TQNkslX8bExqmSNQFy1IG9P
	 WabFE/XxxWsvJzcRkql6ey3uE0KHApjC555UXRCyU6BvTJ0lJDfjaWWdIsvx0JXSRt
	 xt1jSth+Dg/Y4uiy8ZFTbL73DawUE3wMsI3/BUC5AoJ8IkfS2REsEQz7qruvc3TmOh
	 DVBMWIxZKK1uCYBhzKv0LOqLICprd2kLqH/UB8n4xj6eTI13i7VIDpgiwCnkW0rZj9
	 GB7NDRSudZ/JMmDolzp/uxch+Fg4H0C6O1V8jK0Shd/vVCWIUjfi+rAOx9YxUwXrGT
	 hopwQC6ht3aQA==
Date: Thu, 30 Apr 2026 11:38:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for Shikra IoT
 variants
Message-ID: <20260430-woodoo-elk-of-order-1b534f@quoll>
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
 <20260428-shikra-socid-v1-2-6ff16bad5ea2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-shikra-socid-v1-2-6ff16bad5ea2@oss.qualcomm.com>

On Tue, Apr 28, 2026 at 02:47:47PM +0530, Komal Bajaj wrote:
> Add SoC ID for Shikra IoT variants: CQ2390M, CQ2390S and IQ2390S.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/socinfo.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

