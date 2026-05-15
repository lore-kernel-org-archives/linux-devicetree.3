Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FACB477E2B;
	Fri, 15 May 2026 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842752; cv=none; b=JBf6+Oov/ri94WFLij4Nfil1le3xtWN+Bwsp8Yk3JGGyM8vgle5W00mW64k2PDqOVP9PbgzIBY5DgC8wlbAQN7Fw0SKFslYDViciqct/ddpbD9JHGYDmiZlSY7QOZ87nE/Q7qdIPTs3J7XRiw0XKneSA4fMYZC/ncYukE6MDlH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842752; c=relaxed/simple;
	bh=MGPuJpNRn9FOipTBakkjr5Fc0lscvUuuVtT1R27weBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BK7fXRpM3zfF5OSykYE6pz6AC0dHqQg2e4L8MDbVCWVT0H0j3cn+yXftR7WbquxoEh23aXrz4jvfKQ2zZxbT9/Jo/RFiFLMwxBumDFHgU8dD7x8T3tePKAjubfIokmJ7+2OSzlGs0aeSE94icU0kq+kCUJjHACvEdpAPoGI5h+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrtVMJWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrtVMJWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11B3C2BCB0;
	Fri, 15 May 2026 10:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778842752;
	bh=MGPuJpNRn9FOipTBakkjr5Fc0lscvUuuVtT1R27weBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrtVMJWxkZI7KzrRYSGCKuGAtOFoBlgktoCUtEkgS/k64afbllHVr5hIx9i5hHvao
	 kA31XKlXTIf2Kgt66PEcfYlwihc62PIop/8HSwChYO7bm05/gPVsIAbiVcsSVfzIDU
	 FQlcKDZNSF7wOAGnWiOZSHaKRSGbwepyA3QZAdSvchwpVAXIuOQ5DtQnECsMw6TT3S
	 Oj/p1NC9GUBrZrC8LKOso32EwsLOc1WJGfRB3Ca0qgG9xJLsJx/oYK0SFSjRdhBrrt
	 U+ElJOiCrdD7chpPyQji7sGDRHrHwlSbijErP8eTFqVRk7N9ooY98wZiL2jPZDjXAV
	 E8OYDeF55y0kg==
Date: Fri, 15 May 2026 12:59:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: qcom: msm8960: Add CPU frequency scaling
 support
Message-ID: <20260515-succinct-auspicious-eagle-27f6d4@quoll>
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
 <20260514-expressatt_cpufreq-v1-3-487fd2d78859@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514-expressatt_cpufreq-v1-3-487fd2d78859@gmail.com>

On Thu, May 14, 2026 at 12:04:02AM -0700, Rudraksha Gupta wrote:
>  			tsens_calib: calib@404 {
>  				reg = <0x404 0x10>;
>  			};
> @@ -348,7 +477,7 @@ acc0: clock-controller@2088000 {
>  		};
>  
>  		saw0: power-manager@2089000 {
> -			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
> +			compatible = "qcom,msm8960-saw2-v1.1-cpu", "qcom,saw2";

NAK, impacts users without explanation/justification.

Best regards,
Krzysztof

