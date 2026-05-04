Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061173FCC;
	Mon,  4 May 2026 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892878; cv=none; b=fQTRxBpTshGjQicQNWz/t6Eamm4CvOrI2btKr5QUW1cdJrCIhmWFo4TNVZtAul3eVzDKM0RWxPswQ8A5QHFG5Hl8rWuGMFOpksgQKIDhsRPq7sF9j+mZpTSHRvJLw0DjPdLF4t+nbSaTNj4VHVlKb1GIRCtUW0z68C944gYU0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892878; c=relaxed/simple;
	bh=NJBlii80Wvyq9eQxDBzJEvnqQ8O982NjKYyKfwGbn/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBYgqdUei1UlOkEnUN9Wok+zekGUoixpsd6VOGWF5njkp7EXNXF/83HWD566vgBCZTsRwmBtHiaDS4+QBIRRxOfhCz4SB3Dgm0boEWkvj45SJTLFeHeZBnQ9A5pd+uOH9lkvBn7HsATXuDp+bH4p/URHrZtQVVkGC/+ju0crigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XS+qJ9Gi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XS+qJ9Gi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F3FC2BCF5;
	Mon,  4 May 2026 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777892877;
	bh=NJBlii80Wvyq9eQxDBzJEvnqQ8O982NjKYyKfwGbn/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XS+qJ9GizsMp/DAtoeKFIdoNsvUK+czkyEkf33otRFl50H8Eh3tfCQHVmQtaB7NIM
	 tUuZxCvBvX42UIHMX5izCHEj9sqy8VDV3ZSXoop25CrKKKwckWWntTxGlikQOEJNnZ
	 8drYfFPAfJeGm0q9YfjFVznz1+OvM4dcZEpKEsWpTBqceIK8SFniWBkCctduAPEYi1
	 7e3HoaNrHJJNWKdIImDnYCDMqPNA6N+D+wvPLjMY1tWEu35t6N3Vo/6oTRTDD9Tq6X
	 y1HzCAHElQljDK0U8c4D6DVT5Sk0ZXUlg16++uUsrHJpnu4CDXlOLwZuUKRwRJQuQd
	 yt7n8ATzKtevQ==
Date: Mon, 4 May 2026 13:07:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra
Message-ID: <20260504-pastoral-devout-jackdaw-b84ff6@quoll>
References: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>

On Fri, May 01, 2026 at 11:31:17PM +0530, Komal Bajaj wrote:
> Document the qcom,shikra-tcsr compatible.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

