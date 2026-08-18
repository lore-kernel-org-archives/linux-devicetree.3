Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A52823ED5B;
	Tue, 18 Aug 2026 20:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787083458; cv=none; b=Xo9khooH/jVCuJL36/DUgRZeD8ptKa1D/P1CNXi4xUkzO/RkeFe+XFi2IbALTy4yUCMUur15Zh3MbjhnFk8KSM4341QviV/AbL3sR09aYwVaAzbAwbUlIHZg7toy3S7bXfac1RPVVMjhhStlbXrNb9YaPKS9M0R//TmMmDwVwXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787083458; c=relaxed/simple;
	bh=6OLBomFgelmWW5r4RjB9m6Uc5j5amy8Z6krLxGVm+5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvHqo5h2+qoJn05r5AmX6awlHF7xcRa9DpUrS8YMPp97Gf3Kv39NG/0exH17BlthNtm1hcmyfui24sGeqFh+YyfOBJaik5S6CsEUfMl+kzZtpYcYb7TnHvsjd2oA6djRYkIG8Dlyp+DBW1IEFRF2p8pZA60KzJs5moj2Oi+lD00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWmTOARW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWmTOARW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F6C1F000E9;
	Tue, 18 Aug 2026 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787083457;
	bh=vOaE2p4C56CWWbYQHaNxAJOhQcBgawoA3CrZB5lnwS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cWmTOARW+eBAQ2o1Jd68lOcsLTmoZ4YFAnoWYLN18bccGnmoObzjSTzBkJOWjuXqb
	 Qu3MYyPnTm3gfWmmIaFa+CjgryI1E/+O3+j0krSznvnY3FiP7VLqdxhSEmAMEJ1zQb
	 YH2/qXTdomx2qHxq4mC4NpqTfHPsFvSxFbmTo3jQkBOgM/TxdxX/ougjGaOc99k1D6
	 GKAjYtRvzySXSN2lnMHsvnVRx1EehewgyQ5sYutTgxvtqiYDaJ2UkEzS2dteZA6YPs
	 dpKFtO4zYYk972kPykCwqB5O2E7COqt0tiWnn2Rmq7Vfyg5eRWoiKNaXidfSSsfZai
	 wCqJFYLZy3gsA==
Date: Tue, 18 Aug 2026 22:04:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add Maili QMP Phy
Message-ID: <20260818-solid-nocturnal-hamster-b46cec@quoll>
References: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
 <20260817-maili-usb-v2-2-97d7317f64b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817-maili-usb-v2-2-97d7317f64b3@oss.qualcomm.com>

On Mon, Aug 17, 2026 at 11:16:06PM -0700, Jingyi Wang wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Document the QMP PHY for Maili which handles the USB3 path. Use fallback
> to indicate the compatibility of the QMP PHY on Maili with that on Hawi.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

