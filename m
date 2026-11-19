Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104909;
	b=PsgHMnTHkXB1G+HnfBtmS0iJzYZ5BSTcrSZ4HxnXph9YGmsyG5d38JTUed/+ysRDLnQ4
	 6KYhpfSMqYo4hT23sB1Jgwlt4kQ8hVvc8OkoF2h1isrz8JOVaUCu/EGpkOxTPynlWS0Oq
	 AdcHOjew8EWKdDxkmiZR2eTrZhztil9/qvQ464+uOngdCqRVUyqnRZCQ1MiXsZZDUtaf6
	 mK9Iq2DImQwIRj4JkdbkqkxqGx9VF1l+bOrFnMLATke7EVApE0Jp6a/lSKE1keQjWVNug
	 FUho5udsarLexVlFCtQpuRgQbfTQ64fgcphHREn9jjPtkDHDZbLdOam88B6BQPxpohg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
	b=pofSPlrJjQ5u+D59eIHoG2DYRinmh2mF2fF+sdoO3VAnzhPhtl/Uexghu7uCCS3lP5bX
	 i3UUQEO7piTLlb8KAfLzb80RbDnJ4LlxH2zqOSOd2xD1dW8WGjDlXxtsmsex45mnFbcXj
	 QqzpsNZJdYjOX7MsoI7RzOhdLoCrYIMLmvWxkzY0W1J9Jg87MxRhPUng7H6cODb9Oh7Sz
	 EUuxK+feRLYEpSkR7FdSYsGtoqpiMndrH4nFNbFaUvavASLTXYqDNN7JVPNLIy3usvbwc
	 3OQuneLHSgUWwUeeMbKXr0CweE9inH8o9nbt5YQ+SaVSk1YS6PdrlWwQD9OszEaUl3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nF7KCEXV;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3CD606A332
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3CD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nF7KCEXV
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d427836e9so335121866b.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795104907; x=1795709707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
        b=nF7KCEXVOJWPVyLiyh9gH7j6TgFIshYrCfF9a0YLidBgWbQthopZ8X2XxlMIy8y/oh
         9+jAjo+uOTQbxl82APPj/R/l/JgRavu7yB80ikV6WLGXUkO27NLpZT5H4KvwdrWjt67l
         HUrS3WJWRDgnZyG9KpvACEv13gKwz+ei6ER/NSpbtsLskMyMUfQnE28bjGigM0I2udwV
         9P4R4DsKCnsb5aZ3ap4ZGUxyY4+05QCyB6d24j0haA+9Oe2HRNFd8+9hg9qmsqBFX3md
         le7PeMLrelKN+cLHMOWq++P81fcQgGCR3SwpuRA6gAhF7Y62xOg6PfzZW20Hlx1IdSIY
         CvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104907; x=1795709707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
        b=QI3jzLISIxtyPMd8cYXx4ZGJHem0KSI/2D4Q8032MX3zxEQRH9/Vu6qH7Y/KTlqlNP
         Ao2YG6vl+/MCallPDOwNxjkt/Kba2HWO+sM/aC0vcE/hP4j13qOspaVDxAhHAAsvjV3L
         Ya8mwFnCXGrJi6mCMoLHzOtdwKaPsvG4mUvLuCU4qjiz3velsmLXb4U/L4EIa4rUuwFI
         anYS6/UboNAkvf+baC2gQZVy+tX8xMhjFyqTH9iwPqO/hpSdj64AcI0mZihQgs7l2Hcp
         jTbF9IGl4NK3CBDbDv+VkEtawTFZY2NU13Lpf3VVtQIld/YLt2EhhpX5tIi8fEbhyrHB
         5Puw==
X-Forwarded-Encrypted: i=1; AL+hErFF8JG4BqFBk0WtfrtAus579G77BMgw5FJujhXhzcWohRAwFGbBOmOpHmJM6BCPGcqnVnFGBY6lu9me@vger.kernel.org
X-Gm-Message-State: APuU4Z+BaKqwgGf+N7lVoGKx30/4QRurnltF891ykc+4Yb9Rozb0C0MF
	07pvp6sKeUvFgCSJuww++tLD/xhIz59jNVdxDINudHA8j48/du7Vl4SI9DTj/SFb+BE=
X-Gm-Gg: AYBFou2/EZmmt+aWDqXuGWYFXuEuue2fDYtGL1iO0M5JH5Ak8CgwQ8pwUcj9djJcrD6
	yFUW/1lvpz5SrtIJi9BrFw5yonKJOmew9kQGsSsZTbHy0wjkanTevf2ojnKQzJu9gOLFi5JBDK9
	M5HpsOc+pf101gB9uj5/2eZjhqBbwEFeqFPtIpWfru8Tpgd9Y1zwWMFLf9TRhJpgy67xSl2Jdzu
	ubojmkCPbcWa0MrbTqIa7TMQbC5HCM1vJ91yWSoynUQ9WErbTPlZP7r6GEWQ+0NNBHVTZY4oOkj
	kXdrNaqb8a8DYIMJFk9wT1o50mtjQTO1u8RXANskxibjwbUju8N5Jajb5rVGKpcQJQtjHgtyi0e
	ixozfk3Cl5kVLqkpvX+IDh+kBwfsvCc8B5w6if8MT50bwEmaOhoAoM+nrQ0v4PJ4hL3XQrVhf7J
	DEWhO7fW36ictqTmsElrFGrXMr+I1nvbNGa4+Iyp3G3aRifmP38qsmOaGHHYbj5cRULwA+YRhbq
	2tEnZfHfeI/ED+4B4fFkp7rqUSTsG0fMXZ4V71jBC9/+7dngcH04F/fhHZeergkN3hXyTZ6BpG+
	EofiiNbIcfbO1og0e0slVTU4GVledVjy
X-Received: by 2002:a17:907:2d13:b0:c41:21ef:26ef with SMTP id a640c23a62f3a-c513aac43a9mr40174166b.20.1795104906817;
        Thu, 19 Nov 2026 08:15:06 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm16082866b.4.2026.11.19.08.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:15:06 -0800 (PST)
Date: Thu, 19 Nov 2026 10:14:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] remoteproc: amd_mbv_bram: Bound device name
 formatting
Message-ID: <av8gg6d7eKwpfcTQ@p14s>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-2-ben.levinsky@amd.com>
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
In-Reply-To: <20261105051902.1646651-2-ben.levinsky@amd.com>

On Wed, Nov 04, 2026 at 09:18:57PM -0800, Ben Levinsky wrote:
> rproc_mem_entry_init() interprets its name argument as a printf format
> string. Passing the device name directly allows percent conversions in a
> DT-derived platform device name to consume nonexistent variadic arguments.
>

I read the last sentence of the above paragraph 6 times and I still don't
understand the problem you are describing.  I'm guessing it was generated
by an AI.  Please refactor.

 
> Pass the device name through a constant format so it is always handled as
> data. Limit the formatted name to 31 characters to match the space
> available in rproc_mem_entry::name while leaving room for its terminating
> null byte.

What to you mean by "handled as data"?  Moreover, the size of
rproc_mem_entry::name is handled properly in rproc_mem_entry_init().  What am I
missing?  I also suspect this was AI generated.

> 
> Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
> Reviewed-by: Tanmay Shah <tanmay.shah@amd.com>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/amd_mbv_bram_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
> index e4a103cf8455..6cf33c7b7e64 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
> @@ -72,7 +72,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
>  				   resource_size(&res), da,
>  				   rproc_mem_entry_ioremap_wc,
>  				   rproc_mem_entry_iounmap,
> -				   dev_name(priv->dev));
> +				   "%.31s", dev_name(priv->dev));
>  	if (!mem)
>  		return -ENOMEM;
>  
> -- 
> 2.34.1
> 
