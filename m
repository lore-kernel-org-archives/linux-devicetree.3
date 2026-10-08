Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96022D781B
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 22:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500297; cv=none; b=lCAacmi8BVJMaZGo8R4DVgBgRMIzzjIA/nC5Ak97hHoO/VpEau30CldffNUByjZ70rDHMbwB3xN8xUo9LofmlNKgZws+kMLyJWklNR7ARBd7gq5+Y+iYAGQ5zmGzsMf/QR5mr52ihqrRaJfMsvz++eG8GAZzlPS4IIra+oHrE8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500297; c=relaxed/simple;
	bh=0Vjg6EBigpEticIXsGtOabqNyL7EWzHSiVKHnaUPLwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATFaNj6bjVH2kfvfg4vEDNCqHN+cPkXJoR5XHPFbf0MFjCG62codiidXftvKCB8fvTy10qTLxvG3zL/9bvC0iAyp5tnS9oFNpY+bx9qAntnjbfNs8Q142D8Lv8y5FsqRJseJDAYuhB/DPj7tgiNnGrppyW6ynngOtk/NPYg27yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASaEn4Hd; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASaEn4Hd"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so8539092a12.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791500294; x=1792105094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zFx1lfnIWF5hRoeOi+LYMylQLVmz8uaGy+M0D+8XfQ=;
        b=ASaEn4HdiI4QqikhX0RBWkL8/fDBGXM9EaQYh9decgqngnsZ6dfOOBd6AQk62HQ5l+
         NP7v6zRrriQrin2nuhuN3glyjZDLReoYVDpMs1UYW/QsqUj1BlyojJwAZBUQ0iyi6JvY
         RHfo7S7BiWj5twg18G7ufPkavzyxEvuG+wGimNTdvroI/dDOIBcy0/tJEaRTHvgVdN/x
         pfghltdF6xiHuaUZZP3TGPBwXEAKral1fLAp2ElWrXz7HNcyJFr9PiyfoXeLHm5Za/dF
         /kwBcDjSFtYkfc4exy5bTiRswFfIY72uF6oZ5w1r+s8zNKJ5pJZyWTdMUwOseYElouMM
         VByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500294; x=1792105094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zFx1lfnIWF5hRoeOi+LYMylQLVmz8uaGy+M0D+8XfQ=;
        b=asSfh7KhsNMuUiT6IkmGA6QFVWuUufhSEYxm3YPGGlAtWhn/vumkUTrfUC+ph6AEF8
         LcCvyCEZCY71HamKxrDgcVABibcj1AncCqQlZsI3vrb1IpqR3L7u52ewJCHwWJNLmh1j
         A3zeHQ8zmqHUyQ5tHMmFvF8yNq1AAdEuqguJYxRWl939UkO0KQ0Tkx4qtVbcGvsSQ++U
         qI42BCW+Po2HjTMxrALqC980CiJUN4Sbt1gW8Hjz6gAfRjgjTImJPWu1AR1C4Bmv/2Iv
         hmlzyAAGe77zPXwKzn7GnC0BwUVkLDO5Bie7XAHq7xEu/zDQlb0fNe3t5LS7DtjKJ7F+
         0W/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzuj2SYqSyFlAC1WOSXjrAVpxkTm3C5og/b/dV8hYzCV69HIwQVNgFDzKa3UOdWRJieYfThO9pGLo6G@vger.kernel.org
X-Gm-Message-State: AFq9FYJLdKBI+z7zTfUvT0966iCPjgW7V51iQHxh5D3TwVylZ9qSNxpR
	9QoF3RNmuUV5ec8r/nMYAiPCXxiMF8IrEn5XLHaO6ngBFLb753uBMw+24cVZO9h39Yw=
X-Gm-Gg: AYBFou0Aodsn8VUNWR6xOJRa9olvewTZSg4F90lQmSPbl1pUdXMN9gIXp4cepCh736U
	5XEulpgGwLFMGWCR3S98AIvJBoT4Gq2PCV7GpLF2+5xzbSSwpv5Tl26npdLXdVMQZlMTqkQr4Hq
	83JtSEUUP8Dz2EQABCJQm3FoYb3aZWoFrxtas8x+eesfTIVBUNIUJLJiSSewCTZ/yIQjT+LN3b6
	p87NjfhPHX1QGPMpGWes0P895MqttngdgU7F5XUwpN10FOLA//3jJgZa3hyaWeR9KhZSnfhOBRw
	6BI8dFex4mgQ6gkZkbKBozR247tgKUSar8pMFbGP99vugr4Y4HnxJ9wlVpLe3K4bdB+PB3oIWkk
	Q8xr7sGSQQKiEwM+Fvn4ZEKbqi8iQKyn/c7CE36hp8R75DzRJQFeSLluyXl8tkjWqF8xmBfc9X4
	WzzIHzeFodlXjQxEW0wGl6bMahQ1qo76Uz8Twyd9T9uu5cE6ZBabNJTL6peFzaCeBUM5yMHs6WF
	6r6IVYdV9Tv
X-Received: by 2002:a05:6402:23c9:b0:6a5:f202:c1c7 with SMTP id 4fb4d7f45d1cf-6aff377c995mr5693532a12.8.1791500293961;
        Thu, 08 Oct 2026 15:58:13 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e012a7sm181609a12.36.2026.10.08.15.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 15:58:12 -0700 (PDT)
Message-ID: <1e736d77-6bd9-4a16-af62-82b11c7e5681@linaro.org>
Date: Thu, 8 Oct 2026 23:58:09 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <zC3sJZSv9CSB2RI5UATAf3fT-MZvHb8XVvKBu7steGEH0xl4ADC7TW-h47VyQw1v75g93ppW4jYx0X45XHLtPQ==@protonmail.internalid>
 <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 07:34, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>      +-----------------------------------------------------------+
>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>      | 0x25800000 - 0xe0000000                                   |
>      +-----------------------------------------------------------+
>      | pixel stream addressable range (0 - 3.5 GB)               |
>      | 0x00000000 - 0xe0000000                                   |
>      +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was
> discussed and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach was
> later concluded to be a hack to avoid having subnodes, and was NAKed by
> the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> "iommu-ranges" on the subnode describes the *allowed* IOVA range that
> stream is allowed to use, so the IOVA is allocated from the specified
> range only. Define all the possible subnodes so as to describe all the
> VPU hardware iommu interfaces, both secure as well as non secure.
> 
> address-cells, size-cells and dma-ranges declares the 1:1 DMA
> translation into the parent.
> 
> The parent "iommus" is kept as an alternative via "oneOf", so platforms
> that have not been converted to subnodes still validate. New platforms
> should use the subnode form.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
>   .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
>   2 files changed, 97 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> @@ -91,21 +91,6 @@ properties:
>       deprecated: true
>       additionalProperties: false
> 
> -  video-firmware:
> -    type: object
> -    additionalProperties: false
> -
> -    description: |
> -      Firmware subnode is needed when the platform does not
> -      have TrustZone.
> -
> -    properties:
> -      iommus:
> -        maxItems: 1
> -
> -    required:
> -      - iommus
> -
>   required:
>     - compatible
>     - power-domain-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> index 59a3fde846d2196ab1e4588eb396012ba6860712..68d5e592a028c5eecde04ce72cd5ae6815ba5c82 100644
> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> @@ -47,6 +47,93 @@ properties:
>       minItems: 1
>       maxItems: 4
> 
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  dma-ranges:
> +    maxItems: 1
> +
> +  non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +      iommu-ranges:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - iommu-ranges
> +
> +  pixel:
> +    type: object
> +    description:
> +      Context bank for VPU pixel buffers containing uncompressed video data.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  video-firmware:
> +    type: object
> +    description:
> +      Context bank for the VPU firmware processing domain.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  secure-non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU secure non-pixel buffers.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +      iommu-ranges:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - iommu-ranges
> +
> +  secure-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU secure pixel buffers containing uncompressed video data.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  secure-bitstream:
> +    type: object
> +    description:
> +      Context bank for VPU secure bitstream buffers containing compressed video data.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
>   required:
>     - reg
>     - clocks
> @@ -55,4 +142,14 @@ required:
>     - memory-region
>     - power-domains
> 
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - '#address-cells'
> +      - '#size-cells'
> +      - dma-ranges
> +      - non-pixel
> +      - pixel
> +
>   additionalProperties: true
> 
> --
> 2.34.1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
