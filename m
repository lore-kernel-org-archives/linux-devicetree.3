Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126413;
	b=USxy4rfA3a4Q7BzZ5uxHX7OuoEtvzhpJsIOgFDRuVLSWXT0goC4t4rfbiub+0lzyQ91p
	 3gd7afJW3d1W/A1L0CcqOX9lROnPFleunKsQrAJEyKYcroPQsYAnBT0I5ooT2mE085we2
	 fwFX0Sbn3813PhxM5SuR99gPjqi2bz//HPWieaH5MLE7a/hzD7IxQ3cyU5BSwmkR4GwYc
	 Gd8QhU/bSxNs2WfmanDehjuIV4Gp5mhn9Yssga5JlDmn4QV64i95dHZVYdK8QE5Hmayk7
	 6JJpqwnSnXFxMAkL19Q+EyLMIrG74h9jntd1+pl7v/cICTBJKVk59+ty+qnyhpbky0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126413;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lOSd5J4FCYgX98Se5iiOkvY37YVWiB+QhTNatsC3gsU=;
	b=WfClrQRIkX47ywubC6vLRkd8vzHFyI8WInQotXkal2cTA89L2xp+GPUfhwuc3bcrMbhh
	 QMQZbRmbzS1+DIJ/ND3a3yr1SfRLGPnu5ZHFKdWG8pNJdBVqGloBTr/BAk+3AuGdarYvR
	 2EeSSiMHIdcPamHyAgXz209tnTZB7Cw46wX5q02SFoblHACwKQDTFyJ2acrIGKnM+OoAY
	 kGQ6COWmwtEt/ElCeml+ECnCS0SySBuf89Bo+071k8WVfyGu6VLVIh0Hal+yPuJdhnVNQ
	 wKiwQKiGwm0tGO3Onge4q2Zi/ULLcvHvbyEI3DwzRcim0UMsERBNx/s0cw9yfGGQJFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJ7B4MPs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446AC606A326;
	Thu, 19 Nov 2026 22:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJ7B4MPs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975A01F000D3;
	Thu, 19 Nov 2026 22:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126412;
	bh=lOSd5J4FCYgX98Se5iiOkvY37YVWiB+QhTNatsC3gsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WJ7B4MPsIts0ax4y4MgrqQg9BS9ZXVquYhA2B6DQWXw4T8Cxcpnoi6Sw86Zh1nNo3
	 ATd+jKwpGh32JtYrV6IkCwV8DhDJ0nDLbrbJz6ZGKawnjZVdyRp+RmSujCba15K6RS
	 xKVQ02U+sTue8TZWkVVjVyZUePAsCag5V2o3z2U3Sj91YIWVXtKSiBf3xrkPtv4GII
	 8y78ruxFi5/8zY993oJtwr2uCer5cu7O6wttZ9MYdCrHJEvh0aRPkZGt6ykcaAGM49
	 +2XhANmBzOJ3gTihCUrg14zY1JScWAy+AFpPm53whHoKVArcterfTHCEysAJFBi3u+
	 Y7QKQ5CS902/g==
Date: Thu, 19 Nov 2026 16:13:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Demeter Barna <me@fromdisposition.org>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Simona Vetter <simona@ffwll.ch>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: nvmem: qfprom: Add SM8350 compatible
Message-ID: <179512640965.935436.17254466813902279332.robh@kernel.org>
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
 <20261105-b4-sm8350-gpu-v1-2-a7175cdd6512@fromdisposition.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-b4-sm8350-gpu-v1-2-a7175cdd6512@fromdisposition.org>


On Thu, 05 Nov 2026 13:30:01 +0000, Demeter Barna wrote:
> Document the SM8350 QFPROM. It needs its own compatible because some of
> its regions cannot be read, and the driver has to know which.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

