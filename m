Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4440910F
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338398; cv=none; b=paTog7btuQGiA30COjuHLkXd31/PAc73rlGrwgnRYPiZwyJnkOAnXc1arLaCITFpjIveor1mwd5X5mZeKIwB87+kpiWwjRVQwnQYBRT8UF2TgUEaQAbS3JvODDZOMEZPsbzccU5G+XlpfCKGy9zfhTlI6q2k2Zd15/PuKv9sia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338398; c=relaxed/simple;
	bh=iX4AJMwPLfsVdiY+C7qzj1yuG0l60NCNEJe0uP+pCQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpZtqQ+QmqwSMcVxWjd1ULBl249HwLyN4KI3gq7JHYLPy/JbD5q5h67M3D0AFzBjD894W3JnMrcyAuA/WxUMku8/Y5b34qS9+MzUn1t5CC3/ONpUKHu6NDB5Nltie+1NF98CnK5R/2kityUp5uEd1q6alyYa+38GoxZVvwtgm+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qh3c78MC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qh3c78MC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B271F000FF;
	Fri, 25 Sep 2026 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790338391;
	bh=gGJU1er0pxsC//VVVFNkE2Y8xjVJtJgZSaDkQVRARAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qh3c78MCAiVN/tG0qed+1Nd+dm7zDMpcnzc/eu3gBROrLQr1f9f3ekT70zhYwHwm8
	 JYqSS8Iw+ETljWosJ21HwULUUDieC05rv7yC9zZPkljFuXoTfbotxmEZpCqa6rH/EG
	 vPEHjhK1wRZlcrk+CaX2iW212xqA1xYbuHHMv/dMemlCMe2szQEVXY308wucenD/ZH
	 QVXFcChco/IkoB/tO+glJzfbEZvj2CdUVNh+xBU/EJCXfCsdnzVE8sV59dIAckbNY5
	 BGc+F25euMG9EyOCM3TJqvj+ARkmInyJV1vv1QI3HrjcCoUMLAEGVA6KZsxqLxtG5M
	 fzkLG9x2W4nWw==
Date: Fri, 25 Sep 2026 14:13:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leander Kieweg <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v5 1/2] dt-bindings: display: Add GlandaGPU binding
Message-ID: <20260925-rich-persimmon-mongoose-6d3bc5@quoll>
References: <20260920193944.110983-1-kieweg.leander@gmail.com>
 <20260920193944.110983-2-kieweg.leander@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920193944.110983-2-kieweg.leander@gmail.com>

On Sun, Sep 20, 2026 at 09:39:43PM +0200, Leander Kieweg wrote:
> Add Device Tree binding documentation for GlandaGPU, a custom
> FPGA-based 2D display controller.
> 
> For hardware designs and RTL sources, see:
> https://github.com/stiangglanda/GlandaGPU
> 
> Signed-off-by: Leander Kieweg <kieweg.leander@gmail.com>
> ---
>  .../bindings/display/kieweg,gpu.yaml          | 56 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof

