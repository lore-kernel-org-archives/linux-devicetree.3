Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338869;
	b=dd3h9uQsVq9s7XE5f2jAwfCxrt6yaCOG05vaCOiRhOHkBJIrt04PBcNkihZQBAC62/uH
	 ImSkB+fFVQR9HQBzFlEyz7ypXVitktMpCdI3T8tSHSS5ORQjMsRmiDnTmRyRcZ8UjJS0k
	 D7l0q4e3FtfwWu1HK//hVGtYlzitw2VZ01U1/qnW71NAV6Eh+fd1N87Jh9ZrLWORO5Kvh
	 rdBev32uRvyPHYoXDKVXuyqE8Xi+8EqzDPkOzRwuJT7uvT4WdWHov13tGS4VzNve74Rj1
	 btUsl1XcMu0K5s/+kseTw5dtwqpnG1ZfYIli4bltp8GBJRw3TGrrsSYL3IdJaBzCldA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338869;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QT8U/Wbxd0LEOhqdFM9UgIZXVJTz3ehOLkQh570wNN8=;
	b=je1nZd+N1LSN2XvpMJFMDFMop0vzjkghHR1ebAbSVG97lgMIwn+MFiDVDvgJJ3omEJID
	 8TNQCpcXTCG8WTJzpJ0UyFXHD2e3qQPlXuSYwSVBrynANQ8tEJDnEmYRJIdlXck+fRn39
	 +xHDNCyherKSbBu8NvJpO3o1j1zKH/gp0dFUqjqOxaNX473JsMi96tk2gon155lcMA6pq
	 odSfx/4EiENxr1Y6j39pusOxVU9XyKgV+P8b3YntruEytbY7w05EQw5pr5AhP1wZHWYon
	 289GIddkV1grAumjkOjKb1I0V0LzEGz/Wai2hXoeCS+mHXFvsdxGnp9L4eNM7WJkFVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Og1g4l1H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35C7606A321;
	Tue, 10 Nov 2026 19:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Og1g4l1H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320AE1F008A4;
	Tue, 10 Nov 2026 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794338868;
	bh=QT8U/Wbxd0LEOhqdFM9UgIZXVJTz3ehOLkQh570wNN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Og1g4l1HR9MXueT6FF57KRax4ZIUpWr8DKEXHZPuRHFJy5jWjbkRr2rz/jcYmay7F
	 AyFFLy4Fl6B4L0Cz8L243YlTL2/g2UaxA98hdKE6ABd8/LY4UyCuhHyP2zRI1URUh7
	 ya1eFH/JBQp0NAnCy+QYn+rb8Npyl6clu7lM6MHBSKpLCdcqy2To4y/mqQDu12qjAe
	 gZYRntNlBeK+9/tfEyMFZlwRrzxnfUYmCTWdBVazo+c1FcPecuq/nSXSBdTaLBeJ2Q
	 C4tD7LimFRoAGpTA5B4E4vAr3gtnGgAIVoplTVFsVP/zAtshVN7aklwQHrz8DLSZma
	 F8pl40GtZaPdA==
Date: Tue, 10 Nov 2026 13:27:44 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: msm: mdss-common: describe
 additional block resets
Message-ID: <179433886406.1494254.12130093452944735192.robh@kernel.org>
References: <20261102055026.438521-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102055026.438521-2-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261102055026.438521-2-xiaqinghuan@mail.ustc.edu.cn>


On Mon, 02 Nov 2026 13:50:24 +0800, Qianhui Xu wrote:
> Some platforms provide more than one reset for the MDSS hardware block:
> beside the MDSS core reset, the SM8750 display clock controller also
> exposes a block reset for the MDSS core INT2 interrupt controller.
> 
> Allow the resets property to list one or two resets, keeping the MDSS
> core reset as the first entry so that existing device trees describing
> a single reset remain valid.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml          | 4 +++-
>  .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml     | 3 ++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

