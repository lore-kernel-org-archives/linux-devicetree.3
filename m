Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F835972;
	Fri,  1 May 2026 05:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777613840; cv=none; b=hzFaNBAfFclrSSdBj4RlDTeFpkoTf/Qc0fS+bS3rVTTN2Yv2FX8AdELJyX2T7ccCwimDqdRc9YdWIp5TlL3M1p4DPSH90IDfUxqzllnXhY9PBNEepoBq6lVlS11mgPHuwr1TgLLZSinvDlXI4AfJpy1bUhFcO3OAOipsY4gYhTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777613840; c=relaxed/simple;
	bh=XTLPzvsfcrXbAZVl8iHlkbYopXx4JX/6pk7eeixQ6dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtTRJ7ZSNp9p+ajBZhL59Ix1VkPEYi5JvShlPuoTNOoUs6rxdY12rXOKDPoRi9dwkFTt9EmXVpaWn1TyfYiJme4akrB6jDPEVMFOP7fzDwVun1pmk33uGosOis6y3R1A+G+eJNVSTfvASfimI+dwsOippmN0yFAfMjdrapuaROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1NyFwXQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1NyFwXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D89C2BCB7;
	Fri,  1 May 2026 05:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777613840;
	bh=XTLPzvsfcrXbAZVl8iHlkbYopXx4JX/6pk7eeixQ6dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T1NyFwXQtG+PexEEq6cP6+1v9LbVHYP5D46ByONFINhqEtlaBmKVyEPIYV7yxJ7lA
	 zus6HtH1/RE5FJFdEIA2e666oF24vb4dipAr1WzGdoxliqiq41KGScnUwN4cWOfGwT
	 uTjWV1HY50vTqrWmTBCzy9cOij9PIgUWO3iTXumIP/aoKeRTJXNkXUYglQZcc2eLDp
	 fCjS2iSww7dHJP91OEkeJNdhIphjO/Ej2wFnQQQiCQ5Qt1S/LzUoFmed9FvSRMIwqC
	 lxY0yKcRlLlADNBEiH2yw0DcLDSzkiAfwUlJ4dng6zT7Xcc3JxkXvhySV4nGTlPJ35
	 njEQ8YGFJD2lw==
Date: Fri, 1 May 2026 11:07:13 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, bsatish@qti.qualcomm.com,
	akhiverm@qti.qualcomm.com, nicolas.dechesne@oss.qualcomm.com,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: Drop modem support
Message-ID: <afQ8CfsXOvQh9aY5@sumit-xelite>
References: <20260427112833.1160332-1-sumit.garg@kernel.org>
 <hfvrinoiv336g6zbqsxish2gyux6awgwlk74qh3arkkptligyk@74qfh23iaxxf>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hfvrinoiv336g6zbqsxish2gyux6awgwlk74qh3arkkptligyk@74qfh23iaxxf>

On Mon, Apr 27, 2026 at 06:40:07PM +0300, Dmitry Baryshkov wrote:
> On Mon, Apr 27, 2026 at 04:58:32PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > QRB2210 has modem fused out as it's only available on the mobile variant
> > which is QCM2290. So let's disable modem support from RB1.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> 
> No, this is not true. On QCM2290 the modem DSP is being used to download
> wlan firmware. As such this is wrong.

The modem is fused out as per internal PDMs communication but I can see
the WLAN dependency which fails to load without modem PIL load. So let's
drop this patch-set until there is proper clarity as to why WLAN has a
dependency on modem firmware to be loaded.

> 
> [    4.186507] remoteproc remoteproc0: modem is available
> [   14.811564] remoteproc remoteproc0: powering up modem
> [   14.883766] remoteproc remoteproc0: Booting fw image qcom/qcm2290/modem.mbn, size 8881672
> [   15.505182] remoteproc remoteproc0: remote processor modem is now up

-Sumit
