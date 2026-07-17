Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0D033BBCB
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304441; cv=none; b=A0lVcaUqmp6HFbxusSv2MTOC+C6BK8AXpnseApnFfC0yxK0k+IeYccBFVAZW0/2p7WEl+RYJ0OBRdL31OX2y9E2ggxC2zu3nYtTUNbfMgAPHcICqvBqVZwcMdSOOSrLrS2/nDQgiSf2NN/5J0SMAlMHotP8RiJ1qpbVB5sOPaYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304441; c=relaxed/simple;
	bh=iVyrSwrZmNx4bprcJ7yvv2W/LjWegRQAvxGt7YUy2mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtdAhWJezAiTyNecyYM+4+oA5gmNSXDPys+NJaYClV4tuhNQjm/KaOR+voxY6mOsp5Itucm1BV3PJqE4NwFVMta3KtaYm7/w0sIxIDY7nZlB9Pt4dfOXnofSYZxYmAmh74Gwx5TgEOHSq77p5nnmbmzmvsLnZ54IN5Iwee99V4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WQxI3jF4; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WQxI3jF4"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c0cea8883so19574891cf.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784304439; x=1784909239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iVyrSwrZmNx4bprcJ7yvv2W/LjWegRQAvxGt7YUy2mg=;
        b=WQxI3jF4/RoSRcLBYIFnJq37uVc+P3uBZgSN2J5whGY6r2LmLida1pKk1GrrHtcU+A
         LSvDoJee+1qT0rKJZP2VaL258HiDotdM1G3V/OFLpcNHfxd7PTEs5T8nz7RRw4pwBEfU
         heweIZbKGQ9Ox2BYRqfPGOtbP07zdYYPq1OwDbMCxQeYopFo0QSdbGhMk+MPWEZTAkVZ
         1QmpBN6Kr+Qt/YBwf6h133Tj2IvaGHO79yFfo0oyAeotJQ+e6B2Nc4z+NWhQHh+ruAC1
         PxeXBdFOd0IFspqwYN0DNQEfDQaHeXGdF77hm60plqcK2XJm7kg0LVhsKpjXGXGh+wF8
         YY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304439; x=1784909239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVyrSwrZmNx4bprcJ7yvv2W/LjWegRQAvxGt7YUy2mg=;
        b=iwvAeY1yeFMxAScLruzEPXLdCM4TxFc2EbO6LEwuZpvq70qdWLqsFLsrLitq/xlgAy
         X3seA8zpUF24z1BZw4HyNnYC8CCSkInBYFgetklvDbkGIFDNIpNoJScfbk7ewxGJxs6l
         U+IsZqX3FvNHTW2XI46LoTp8sQX2ZMIQilLcbOfrcO8PGUf539BrnsYmdg8c1/mA90d+
         ARZFkN3xmK8YribgLki4f80nhPFyFRvPY6LH6sKih9kRWadSBIrvQZAex6axWgsl+53X
         QQ/NoL1HRKKo9wx+qOhTIenyTeqwgcnBiMniRNJRmhuOpraTvtYo1eoUk55mkIIWTYxY
         ML7A==
X-Forwarded-Encrypted: i=1; AHgh+RpL37n5EuJQ2yLkYYtmXTmcK+Naew7Ty2c4E4U/SM8vfI216NXYVIgNngzPmBBntghbsT1NzkjFiJY5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl7ksH+fZajvMoZVBNYAva/gu8Lsw2w6f6avX+JFYh7MU33Uzk
	Ifx5E6Oef+TE7ebvyxwubTwP9n8szGhKxa35dPro3erpu3PSGfygD6rXXqmVxcspum4=
X-Gm-Gg: AfdE7cnO2WiU0OuRfE3CYpxGGdZb9TC124peW1+jdSM+wPYo13MjvvV1nm4UWzMRuXs
	Z2sznRN3e404pxfwn5zGjiIvcpJ1IWnZ4mc71t9cZNLYAdrnHpX4hFa6OsXlc61DEgaJAcEOjoH
	5Ln8hrjVt14g2ljIb3r3G4d43FFfHS7rkhOkT4H331Vg7ENw/TZgY9a9oCVgZj58VipARNoG8uX
	CVINvnLAINzlgMVjumvIG9uXp4ElgUsDIQbSYfVzFJmJgIqTYiLZIN1amJFbNYhlpPyqrLrCTNQ
	ID6M6uc77Ad9gZi3Sb7CUTrlxjCVGhxV06f1sGLalLSLHKSmbmsnwzJlY4+HRI3/Ry0x3Pz3XXg
	ZnffAp/jN2fwRm5BKBPJPyeNAc2zU15jwSbWVKLe7Q+MRim5FXQ==
X-Received: by 2002:a05:622a:1b12:b0:51c:558:cbbd with SMTP id d75a77b69052e-51fc214bd5emr69273551cf.41.1784304438760;
        Fri, 17 Jul 2026 09:07:18 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871d06csm20242736d6.43.2026.07.17.09.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:07:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkl5o-00000004hEV-4513;
	Fri, 17 Jul 2026 13:07:16 -0300
Date: Fri, 17 Jul 2026 13:07:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konrad Dybcio <konradybcio@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	will@kernel.org, m.szyprowski@samsung.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Robin Clark <robclark@qti.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH] dma-iommu: Introduce API to reserve IOVA regions for
 dynamically created devices
Message-ID: <20260717160716.GA701389@ziepe.ca>
References: <cfd23f75-8952-4463-abd5-815b995031b0@arm.com>
 <bb59f07e-ca7e-f012-6a4b-0a148350b69c@oss.qualcomm.com>
 <20260612172649.GM1066031@ziepe.ca>
 <da77c21d-25b3-46c3-a48f-71f0549e9f5f@oss.qualcomm.com>
 <20260615125257.GS1066031@ziepe.ca>
 <dcc0d02e-91fb-ddbe-399a-0191bab94c4f@oss.qualcomm.com>
 <20260617194038.GC231643@ziepe.ca>
 <e9e76c9f-b3b1-4ffd-9547-183556f6bb60@kernel.org>
 <20260618151745.GD231643@ziepe.ca>
 <dba037fa-0f21-4a50-8727-076a3b177c47@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dba037fa-0f21-4a50-8727-076a3b177c47@gmail.com>

On Fri, Jul 17, 2026 at 12:44:54PM +0200, Konrad Dybcio wrote:

> I was kinda hoping there would be more buy-in to follow what PCIe
> does, but to my understanding you're opposed to it because "vpu_bus"
> is not dynamically discoverable.

PCIe allows describing devices in DT. What this weird vpu_bus thing
seems to be about is to actively avoid describing the devices in DT
while simultaenously treating them like devices. I think it makes no
sense..

IMHO the approach inverts the thing, you start the main driver then
use vpu_bus to dynamically create a bunch of struct device DMA handles
for the main driver to use.

I think it is much better if you start the main driver, use the new
component stuff:

https://docs.kernel.org/driver-api/component.html

To aggregate a driver from the struct device DMA handles that DT will
create automatically. ie the reversed flow, the struct devices
pre-exist created by DT instead of being created by code in your
driver.

Jason
