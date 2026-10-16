Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91095499F20
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154031; cv=none; b=FVVayuJK3qRS/tecPHNpwpMVLHl5SyBVqnRNt7F+kU2PbUKntELd5Amk67tNKgWmM9sxm8reSlL5oI0KJNlki8VXqVulqEt1ReI/rRuFFyev1GVoPHHi0kx6P5mI8KmZg1dNpEy3K09AzI1mFIbrGHO4AoJhpTKHgxyH5a3PFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154031; c=relaxed/simple;
	bh=JfDefijwbtezDgijQgyKJbzKl0+gWmC5y7+nqbaenDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoEj3tCsBm5Y7TRKvi/f1qHH/tFvzCMN0tLiT6uKvEutptRuOMEZaXtPYdQ9JcD07U3QJtme+PToN54qDT1dPw3QcuIGqU04mNEXFsLFlj514WnSUSu12T64XHBMYd9L+OLzhrEEff6nUERiKZMiyScv3+j28FDjhHnK4/LEp44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=lHNW62Ew; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="lHNW62Ew"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40e30c26a4so70274366b.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792154028; x=1792758828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KjxNdKF35KA5nRKq/qBO1VDFTjnQTP1XeouQ0eeALwY=;
        b=lHNW62Ewd0eGVls3qGF7+sNuukjdC5PFmAbaFCo79fpbHt/wV4IyIcucNHrw3HbS1u
         O5WUNhtDzh4Xa6iPg5tzdFM75OfRw2kFjY5nyD+0uzvVKQNlKuT/4SIKIP1lWilG6K1I
         y/JjxGJZxyoFVkhX4dlPvfd6+cEDt/Dvjt2b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154028; x=1792758828;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjxNdKF35KA5nRKq/qBO1VDFTjnQTP1XeouQ0eeALwY=;
        b=d2x6BYXPnyn3HcmK6VwKxJjhaVnG/dv7U+TQ799Kb/1dYTGQYcEGb5RgsNixP9Dzvr
         OOE+Jffmov5hGUagmcaR81wty7oOFjAhBEf1xbAbo7wwlk6XRT4EEzldZ44UVZdZ9k1G
         wvKDlnqOpgGz0oshM/q4u4bHEzMb0Y8OzACY6nvhgeUKVdGaC5Y8rxPVKO31W6tB3tNe
         u4Ax4Tq3MfH3tGxFVTlMDC37EZflRGkjl+uQw7pjveQMjn4k9kZCcvVp9LHSFGy3Lxd3
         46rbSD6nLajdK9zrliXTRS2hUJhN/j8DdamxF2s+/1/HENpPUri1Cf/oTUKOO8SasFP/
         gL2w==
X-Forwarded-Encrypted: i=1; AKwUvByrfuFQJj5oBYSG24/S60rWgvOgykSth32Cn/qx+ZUnqMeD3nnhj1T+zkZotu5T4KqmjbAPRQb7y2BP@vger.kernel.org
X-Gm-Message-State: AFq9FYLbfGANlyYSEhouh7BgPxtHNjHiTfVdIe1Im1rraRxHWB3kHn/g
	wnkM/isfKZfWzBLUF9dUnqWjy99FlCATlM0f3e/Qc5y7N2fa7pFjiEip4dp1E7E7Jck=
X-Gm-Gg: AYBFou1ks9Cgt0bmjAX/TcXUvZANrmvauUw0eS9jT27zxcW7wIwPTfNaVSccLlGTdfB
	bhkVrRGIxxeOmk6g8R+XJnoAEGKGgfw6wiQI7MsVQwwJQ7Sc7dbLMXIhOoWFc/gMN41nDe0c6Kp
	Aebxn0D2j9q43OkWjwX3TVU3dkFOfIgP56cfDGDnMuP4Drde7rj/x6ZHq5LvMKn1DjhrL+douCA
	ordrEtVWarTkvL+Mc2GCfv4Pt1oNLUvwRhgO09F19JwU8Y1mAcw0AZbPwfhJsgRWyhHeE1k3CYj
	18tkMOkOMVpXpSwRUZzzUAR8LOakT/9eqEfnnLG4BkTWDnmLvIPLPxdB10Cvgu4t6lCqXf/ebKL
	jIVe6fNTOxE0tlkDg/SEQLs259vvbmACMPGGGytdw/fjyBsbv6R9f9n5cSikx57/Azq12nRMesU
	rBbyFPHKf6TMDfktzVVjrZS3sBFAnfFQgGgVr8+5E6GhpS0t5Ii4pRqQ788KZ2WmJWFLEJOFxiB
	YB1HqrLXdQ7uGXFqVCDs3BbiIIOVqqT
X-Received: by 2002:a17:907:2d11:b0:c29:519b:3aee with SMTP id a640c23a62f3a-c402349d091mr280091066b.33.1792154027651;
        Fri, 16 Oct 2026 05:33:47 -0700 (PDT)
Received: from carbon.k.g (87-243-94-255.ip.btc-net.bg. [87.243.94.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ca52esm69793266b.38.2026.10.16.05.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:33:47 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:33:46 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v11 3/3] arm: dts: altera: add Draeger M48 CPU Module
Message-ID: <20261016123346.GC15187@carbon.k.g>
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
 <20261015145804.3632839-4-petko.manolov@konsulko.com>
 <62afc804-8a9f-42c0-93a5-8b0b7f3b84f0@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62afc804-8a9f-42c0-93a5-8b0b7f3b84f0@kernel.org>

On 26-10-16 06:08:53, Dinh Nguyen wrote:
> 
> On 10/15/26 09:58, Petko Manolov wrote:
> > M48 is a heterogeneous board made by Draeger that is based on two
> > independent cpus, that are monitoring each other.  One of them is
> > imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
> > independently off qspi.

<snip>

> > +&gmac0 {
> > +	status = "okay";
> > +	phy-mode = "rgmii";
> > +	phy-handle = <&ethphy>;
> > +
> > +	mdio0 {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> 
> You also need this here:  compatible = "snps,dwmac-mdio"

Thanks a lot.  Is there a way to send patches to Sashiko without bombing the
LKML and, respectively, all of you guys?


		Petko
