Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D70455181
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790291167; cv=none; b=luaqJnMYdq/8mfNlyi14SFBtmCfMtXKN6492WbhISrBFHODnarMPEtnnCMmpkAtkqRigpoDM9y0r7vicxiNIXfdyECESGor0b0JYETyvZAEESANDRvLNIYwKDAvU5kW3bG1fhbvju7yczG4ODjMWeXYqKyOkNtD2tbUTPTNNF4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790291167; c=relaxed/simple;
	bh=xlKJNWi5b2E8rg/y/va8nUurduBnJnez2GdpmjlIV4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyaiVytVfRaqziwctW1UCDGfAM/iA4KdDZHoCdroH+BwzaCzmvn/xvgAei97SSbNittXkxOIze1uxBBLwuhrpHGoGUSWSawX20240PTglZhklj36lqmVyetWnMHGJLdpP5Z5XOc8CMwyyNTotV4zC3oQPt2vR9gNI0TpI78Uf8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HtoXxH58; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HtoXxH58"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so192228eec.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790291165; x=1790895965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zQnsR23bVv3+/11lzu9TDysHJ//x+6ClkLoNDM2wVg=;
        b=HtoXxH58ig1H6BjmrNduqLi0wKuNdJ0rNX7zZbnurd+YS/VRUtHPubQ++JJm+sZImJ
         qzbbk+baLjnzI/vmuXGrPTlpzw0um8L4fmW3qV0zu3ht4csSLOmirqBKv7j17rOEQil9
         ITDQBwNbmdUqjCLe6m0KwZD0aGfwioXdzmNFcAoxYW0gWPYsA7LAOGS7Dc7rOqH7Qzu9
         LH6t1I/b5aK3Ff9RhDJv9/XQPg9jl5wPBQ5dq/tQhrHVKjZfdoUnc/zuCYDxA3sY0V6V
         lWwVxO6m+dEX02tNZEPCeNbJEtqmx5/I+gK5K8xpEoGfQ5b/k9a1ML8M+3+tzH51rpNP
         msgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790291165; x=1790895965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zQnsR23bVv3+/11lzu9TDysHJ//x+6ClkLoNDM2wVg=;
        b=wxC21zYsxj/iJCA1DMqC5sO/Okwqrz2+JF2xCzQIKJeVIA+Ecbp9sj9q2k2uPMefS3
         TMHZEAPjNUq2Z3e09TY5P1uEAERfb1ozgdIT6Ybn0yDw/igYCERM9FfNpWlNfsnsYNHq
         kiUij0ZvaWVwsDpJrcMsLNT9r1NBi9CWq4qyfhnrYtIWUs2sIaxlWHHQTxJNMP1Ux4T2
         bDnmjpnhWzCYzmfBUL40hNt68k9HG5W70ZbZl9JLBPxJ0iYWC4+TUawyBk/HhN2zdEct
         O6P+9iyPcsWrHpNttyW2Jd31Z4kbgo0TNxK071i8Eyp3xi/+uKrhupcYoBbuoLSiy47L
         ksuA==
X-Forwarded-Encrypted: i=1; AKwUvByurIwJGQ1FtcN+T6Dy4RZxGjvE6Jf9oOxnxLqE/RGaBiMPm6AjV83MxqE0ZphMakF3FzkYnKnKm9zd@vger.kernel.org
X-Gm-Message-State: AFuF++myjQ/kRbsWQPj2R7yCRXvk0Eyh/F4cqupsEi0TzfFxkyjJn1ZS
	JL0pzM4X6aEGnHiUVBpKmkI7+T3pv5mOXN5v2gSDbjXL/WP61kx54LOXOe7/LbAXeXQ=
X-Gm-Gg: AYBFou2sVHyCMktjxHi+PSP9Qe01fN7BgCGAJO1D/9BedDfzUqqggKVRw6H0T01r1UR
	4yKLWmiAoVS83QwktOg6eGu939RjySUbeysBw1WB23Jzd454Y+3j1vCtSAUvos+ClHE6unTYiCE
	8Lepsld2iikqkFfWfBVjadF9kFgtwfWCTEerDRB0+JSNW+0L3ORZbCXU/uO+s0jUmS2wnUbHzO7
	MScLx/1wRIKdc4933IkjpOeS0SjlCJOu/h9iA1xQ2cVWGytDiY/UCpoykaJqxBBS5/lH3vuhulb
	hCVSD6I2awHSNmxwbNVvpc91dpDwcnNtD0bd9BXX/17Uj4epnw56rKfPsJYWBEoX3YaZ++kjP+N
	xLUzA7dz+vtVB8n21pNxZxqu4eKOWhKFSLXacVv8+nvT9baUOmM4uVdeAdIMxTyEMwpnLdGYPXm
	PCeyivZPWFDN39hk8eAaSSv/xwJGEZlES7RZTrnYwc6I85
X-Received: by 2002:a05:7301:6406:b0:33e:42d5:1d3 with SMTP id 5a478bee46e88-34000c382e2mr2555669eec.30.1790291164415;
        Thu, 24 Sep 2026 16:06:04 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407d18fsm1480231eec.10.2026.09.24.16.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:06:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9sVu-00000000fXu-3DDy;
	Thu, 24 Sep 2026 20:06:02 -0300
Date: Thu, 24 Sep 2026 20:06:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, willmcvicker@google.com,
	jyescas@google.com
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-v3: Add support for
 arm,instdata-override DT property
Message-ID: <20260924230602.GE16465@ziepe.ca>
References: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
 <20260911-arm-smmu-v3-instcfg-override-v2-2-5804e4f400b5@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-arm-smmu-v3-instcfg-override-v2-2-5804e4f400b5@linaro.org>

On Fri, Sep 11, 2026 at 09:21:06PM +0000, Peter Griffin wrote:
> The Google Tensor G5 SoC (Laguna) has a silicon errata with the SMMU
> integration where the AxPROT[2] signal is always 1, which makes all
> transactions appear as instructions.
> 
> To avoid F_PERMISSION faults (due to the VMSAv8-64 requirement that
> unprivilieged writable buffers are treated as Privileged Execute-Never
> (PXN)), as a software workaround we make use of the INSTCFG override
> feature to force all incoming traffic to data.
> 
> To enable this workaround, the "arm,instdata-override" DT property can be
> provided in the device tree entry for the SMMU, similar to how existing
> errata workarounds are handled by this driver.
> 
> Note this is added for "stage-1" and "stage-2" but we intentionally leave
> out "bypass" as nothing is downstream of the SMMU that makes use of the
> Instruction/Data attribute.
> 
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> [peter.griffin: ported to upstream, updated commit message, remove
> feature flag]
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v2
>  - Fixup incorrect bracket (Sashiko / Nicolin)
>  - Add more verbose description of the issue (Will/Robin)
>  - Add note about why "bypass" is not required (Nicolin)
>  - Remove ARM_SMMU_FEAT_PERMS_OVR flag (Nicolin)
>  - Move check closer to IDR1_ATTR_TYPES_OVR read
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 +++++++++++++++++++++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  6 ++++++
>  2 files changed, 27 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
