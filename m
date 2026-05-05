Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C1722083;
	Tue,  5 May 2026 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965602; cv=none; b=JkVMtwCEN4lJECu48F5g6dJNMcsYyhh3GjZTEnBykuNo0kU/cDz++DIYBtcun68lDB4z+mA2Rs1+QhNw0S3y1i9cRAuhj5Z4DKrkS7Wmnp5r/fpKHEKWTARjpzaOilqbQSdTtN8PgA6nmPByhkUwPkBXYWcCY2+8qBSITa5MgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965602; c=relaxed/simple;
	bh=w8dvtXopBTqK//nEbSvBrY922q5pu3Ww8ExMvkFAU24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwtSQt39aK7qbDqcvnTdO0DqCShTeBUployC/J5sIJeKE1xDMfU2RxAlOxCuh15PCvo9c1q0ps/gPPrY4xij3EPLGVOgUmS2D2Q4N8pu6DsBBaM6v6XJ++Plo3YxptunanVAwqAaY8bM9RKCJHtkGrLDINMNnFa9rqUA2xe1fvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cb8OnJI/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cb8OnJI/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70F7C2BCB4;
	Tue,  5 May 2026 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777965602;
	bh=w8dvtXopBTqK//nEbSvBrY922q5pu3Ww8ExMvkFAU24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cb8OnJI/mFRbK07CqO3vFV3Yuz/kbK7rMcLZRVQb926p7HdGzk5PjmknBEZb8TNRm
	 qsTFnzeAmNRYbzl5Y03WVEFH7Mb1/mZGjK57QieuseEjgjxv7l5+ileAexQdipdY6B
	 0oGR1ljQi9rbK/uOpslbFejmog2Cob0/b5QMrQfdpXy9gtTWtaB4JUnh2VeaABDH2Y
	 xhLzseLiSbu5wbxHxJuDxyq2X1GNucVJrqDaV7lUDg/tEQL0HPWt67W+k2H9gRfXOk
	 kYftkufta3fKRpNAoC3x4/cHz2vzimYZp1E+8+JdHgBQpkA6dsob+sJPGIvlMdr5Rl
	 SX2qlk+UeW4sA==
Date: Tue, 5 May 2026 09:19:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: Document PDC for
 Qualcomm Nord SoC
Message-ID: <20260505-snobbish-coua-from-avalon-b9ec8e@quoll>
References: <20260504080703.825328-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504080703.825328-1-shengchao.guo@oss.qualcomm.com>

On Mon, May 04, 2026 at 04:07:03PM +0800, Shawn Guo wrote:
> Document Power Domain Controller on Qualcomm Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

