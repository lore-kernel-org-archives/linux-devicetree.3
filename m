Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9DC3EDE6D
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285102; cv=none; b=cfumnEs1P4eBJzUvazVgUaK8ecvom/kYY4esxki2L2b3o6zKlyRoR/TaDzc81VqDN/WpMjAFQN08OhkV2BYG3IeOdUVxf9Y5Kz1SHCo2AV8wcqCHIBM7sJvtROgu3JgGfxcsF7uPZ9CHlo8N2SItXB95TuQCEGwUa+oh0+Qf+yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285102; c=relaxed/simple;
	bh=2pEd2PoX7gxj2uadPnEorYAgEq8J/PjNx7zkix44hD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqXPwzUj5wFcdAPlaKut5UPMU4bY80v4a+SRjPwydKV5lbuvvBMI6/I1CGbaA2DD3QFPLtvfqT6HbI7YrMDSj2ZXlfauKkidnUua5uloRp0mhhY6GCFea+xr6s/kf9gcN/AbYBWuXJttFeVDBTptpYEtKtpkx5fqsKFfYQTmGyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ducQ3wXX; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ducQ3wXX"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so1339287866b.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784285098; x=1784889898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHMjre5IwjmjoZwiytENVYpWI2A7IWIyRw+/ii0+cJ8=;
        b=ducQ3wXXnM0/C16tx2bW4w73XQrvGY4nKM0b1cv6zI5EMAbtR1n7oJOgB7kGezYoTv
         fxwmR/zA/AKiNlfaRiuM0GUqqa/p2WM3gegjD5Pf2+IqLS6c4HN7/0OpHVqoPY5zVRke
         ftS/YdlP+sPW1Isn1uu8xwr+bgfpHjUpZFOniKxF7n1zP0huz2nb0oxg7DkaMZ+SRZQ5
         YBH64t/nr72UYJuTqXpQQnoJ6QXnq/y9/x+XBAyxZyZSaw3H7g5YlXajZbqqge8EE7vL
         BTiifURUn/859051xj9FFksz6zRNxDy+J6CnVbUan3XQ5KNgiYNTUkXUPKNW3xCQxmPk
         4c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784285098; x=1784889898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHMjre5IwjmjoZwiytENVYpWI2A7IWIyRw+/ii0+cJ8=;
        b=QC+lUbimwZBo+5DdF0nH4Ervi6qOavXG8lIpIUN6Rr4l7iK3zpAWIcEI4+xYkBZk6Q
         QHwT56O88DuiMVulYQ/uDn/JfTDwSETqJGX9R/ywuTkYBRT6WZcFXjhOjgdRhv3PSQMX
         knh2lPApoJr4mVesD3RWiFz7C503krPrjyj9yQ69gCxV6HYqtliixvvqzsiOBTjO/Fkn
         HyB0LtqYQxXOcOZDl2rXs/0l7uKjMebzGRQZD6Op3IT7I61qhlG7rJJnYDVDICGJO9FW
         GvzXATMaHuuAoEoZCuNaxulh54e61a8O1V9P07pV9EqyCzYFSAa0xOBzr9e+kV0n1dWX
         CQTw==
X-Forwarded-Encrypted: i=1; AHgh+RrKr8Tdge5FyWmNPnLpiha2QtQ3yuTkEZx8KepcfnuPQCWbrIN9FjGSzM1JlTZce/2vvvgrOecqycVG@vger.kernel.org
X-Gm-Message-State: AOJu0YweuVzlb31vFShl6aph3GFZh2CqEFkHxp36zpSwKismK9LFtcAT
	uxEyVyfLWXdekz2aO384piXu/Qh/EVLlmr+Fro6Y3cWNqMWZt5O+2GPj
X-Gm-Gg: AfdE7clOEFMkO3Cn6Dkkl5I1Exri0kxxRYaScBOxqoVnUnHEHOn5HGKPVFqrQdfjdNP
	E4UYMPVfmkD4kROInSgUBpG2dubTGE9Ti1K6LBAu/GsUHrlv9Abq2XD6tOvf/MQkvF11isOIxuQ
	6EspBN1G5cNR1efjTOoqodyDM9csxIjkFwl/ROMXg1GcIgpKKqx/7AEyEMna5GWIR0sFVPXDOnB
	cc9PMZJ6LP7MpgaU+Mzw0xNtRpJg2XG2llMFYaCoHL7VFk5XY3kT5jcskjImq1Cc5kp3azObVUD
	If6LLc9utrnwE5Isy7firWv79Pc19JCOYqM1aOdd4pNBhN0Ky7uEEMLq0EFnkjj73DXk9vAmj04
	EI4ioo584oap2Df999z0/8YnmDw8FswsFL2ueBZ6UuwZ+cJ/Y6X5PQNNZfGTtnTJmDXsh5qsueQ
	qpLs6u/Xg92xn/Og==
X-Received: by 2002:a17:907:841:b0:c16:66dc:3abe with SMTP id a640c23a62f3a-c16b46fe83dmr88156066b.28.1784285097922;
        Fri, 17 Jul 2026 03:44:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm52739366b.63.2026.07.17.03.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 03:44:57 -0700 (PDT)
Message-ID: <dba037fa-0f21-4a50-8727-076a3b177c47@gmail.com>
Date: Fri, 17 Jul 2026 12:44:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-iommu: Introduce API to reserve IOVA regions for
 dynamically created devices
To: Jason Gunthorpe <jgg@ziepe.ca>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
 m.szyprowski@samsung.com, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Robin Clark <robclark@qti.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260119054936.3350128-1-busanna.reddy@oss.qualcomm.com>
 <cfd23f75-8952-4463-abd5-815b995031b0@arm.com>
 <bb59f07e-ca7e-f012-6a4b-0a148350b69c@oss.qualcomm.com>
 <20260612172649.GM1066031@ziepe.ca>
 <da77c21d-25b3-46c3-a48f-71f0549e9f5f@oss.qualcomm.com>
 <20260615125257.GS1066031@ziepe.ca>
 <dcc0d02e-91fb-ddbe-399a-0191bab94c4f@oss.qualcomm.com>
 <20260617194038.GC231643@ziepe.ca>
 <e9e76c9f-b3b1-4ffd-9547-183556f6bb60@kernel.org>
 <20260618151745.GD231643@ziepe.ca>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20260618151745.GD231643@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/18/26 5:17 PM, Jason Gunthorpe wrote:
> On Thu, Jun 18, 2026 at 01:57:40PM +0200, Krzysztof Kozlowski wrote:

[...]

> So, if we are going to do a hack in DT to accomodate Linux, I argue to
> choose explicit child devices so VPU does not need to create a special
> bus, call of_dma_configue, or hack in new DMA API things that only it
> will ever use.

Bit late to the party, but I'll chime in with some more "amazing news"..

All of the multimedia HW on QC platforms (camera, display, GPU, video
and their specialized variations) has at least part of the same problems:

* Multiple SID groups that need to be accommodated for different purposes
  (normal vs secure buffers provided by the same device, different
  "logical functions" generally speaking) apply to all of them

* Different IOVA limitations per SID group seems to also concern at
 least the camera uC ("ICP") (but not all of camera hw)

* Remoteprocs (and therefore also the audio stack) expose a number of
  subfunctions, some of which we currently model as subnodes (although
  many arguably only exist as such because someone decided it was
  convenient to express them this way). This, for example led to the
  representation of each SID group associated with the remoteproc
  (fastrpc/"run compute on rproc") as a separate node:

-- qcom/hamoa.dtsi
remoteproc_adsp: remoteproc@6800000 {
	[...]

	// no iommus OR iommus used for another purpose (fw loading)

	fastrpc {
		// no iommus

		compute-cb@3 {
			compatible = "qcom,fastrpc-compute-cb";
			reg = <3>;
			iommus = <&apps_smmu 0x1003 0x80>,
				 <&apps_smmu 0x1063 0x0>;
			dma-coherent;
		};

		compute-cb@4 {
			compatible = "qcom,fastrpc-compute-cb";
			reg = <4>;
			iommus = <&apps_smmu 0x1004 0x80>,
				 <&apps_smmu 0x1064 0x0>;
			dma-coherent;
		};

		[...] (there's a lot of them)
	};
};

There may be more hiding in plain sight, but those are the ones I'm
aware of.


I was kinda hoping there would be more buy-in to follow what PCIe
does, but to my understanding you're opposed to it because "vpu_bus"
is not dynamically discoverable. PCIe generally obviously is, but
we already have prior art regarding hardwired/onboard devices - many
qcom DTs carry per-board iommu-map overrides to please the allocator
with known-in-advance BDF values (because the HW has only so many
SIDs):

-- qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
iommu-map = <0x0 &apps_smmu 0x1c00 0x1>,
            <0x100 &apps_smmu 0x1c01 0x1>,
            <0x208 &apps_smmu 0x1c04 0x1>,
            <0x210 &apps_smmu 0x1c05 0x1>,
            <0x218 &apps_smmu 0x1c06 0x1>,
            <0x300 &apps_smmu 0x1c07 0x1>,
            <0x400 &apps_smmu 0x1c08 0x1>,
            <0x500 &apps_smmu 0x1c09 0x1>,
            <0x501 &apps_smmu 0x1c10 0x1>;

Although it seems to me that it's more of a hack than anything else..


With that in mind, do you still prefer that this is handled through
separate nodes, presumably for all of the aforementioned cases?

Konrad
