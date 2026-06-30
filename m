Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B939DBE9;
	Tue, 30 Jun 2026 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804169; cv=none; b=XXMHRTvccABc6p0/WHsZKDzjbovc4GiYfjAAlt50hwJYRJv4z1wJYzkcBWlGHjD7z8f6x5iWGOFYVA6nsEFPoxx1YN1qOFVg6AqVf07cVLjloDd+vF0tZX9j/NipFuczB1GhgXesEVFWFYRqkb+7FqEEw2ScfN29lIlpkP0jqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804169; c=relaxed/simple;
	bh=KhDE1nTNO2ZyY46YrJf71+gBQuMbn/LqDfePdF/OsoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/Oyy5mYkCgMFgq8rnRW00BZLzq6QjehEXgLm2CAsjDqh2aF/pbh/OtoBNolj1cvMZUrJiC0tM3K5W4CVoT7p9YqNUM3Fo9DwJNUGTbF7fh7OQm/DOyMzJpyCbwrz07trf5Cwc2Tce651/GlU/OD/lYS3gwCeYyXLRQLsVHJUJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQ8ISaVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQ8ISaVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAC11F000E9;
	Tue, 30 Jun 2026 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782804167;
	bh=15o4K5qq7tiiYrARQISBqxgVYHpa/9wf+7SjLZ2Y6sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MQ8ISaVFYbFlEc3zyzDgHvYhw+iQtIDneEJqEzkupZhIm79ia7yr70OVW/Ox4QP2o
	 G9NFInht/TzBZRHDeTM5uhfLWkPcK2qfrMNBRf/3uzYHG2FzAuJRf9x/mxwpSEdOlq
	 kc4c/wgz5MuiYBeV4BdQOPh1nnsVBX1pauxgE75XrNdeIITHg1vxCXtURjXnDBE6U1
	 W4ejAxge/0m0iQMA3O9a6A2My+1q2zYMNL00kVqIgOLqyVO3a4OW+k/ALHY4O9QhAU
	 onNWzkiNe+GnY/KThuYCiW5nTuxSk7X/y6jbyUeyZD6VKrUTsaIZw4bsE3Pi8UEma6
	 qOdBXgXQPz6sg==
Date: Tue, 30 Jun 2026 09:22:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: imagination@lists.freedesktop.org, 
	Matt Coster <opensource@mtcoster.net>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, Frank Binns <frank.binns@imgtec.com>, 
	Brajesh Gupta <brajesh.gupta@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img,powervr-*: Remove Matt Coster
 as maintainer
Message-ID: <20260630-electronic-lemon-oarfish-ccaeb6@quoll>
References: <20260629-goodbye-v1-0-3bab53a80c53@imgtec.com>
 <20260629-goodbye-v1-2-3bab53a80c53@imgtec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629-goodbye-v1-2-3bab53a80c53@imgtec.com>

On Mon, Jun 29, 2026 at 04:47:30PM +0100, Matt Coster wrote:
> I'm leaving Imagination; remove myself as a maintainer. A separate patch
> leaves a personal forwarding address in the .mailmap.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 -
>  Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml   | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 91e4ff61b394..a6bccb600a57 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Imagination Technologies PowerVR and IMG Rogue GPUs
>  
>  maintainers:
> -  - Matt Coster <matt.coster@imgtec.com>

Next from next-20260629 does not have these entries, so maybe it was
already removed...

Best regards,
Krzysztof

