Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.227.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793877098;
	b=YmyPxRyUsng1Qnmld0Nkmrn1ANkw9zpB4O3u2lf5WyHnGEkputHh9slCjEuusf7su9rW
	 IQPtvnAdLz4IpAM3sAGS/rWiqBwrn7C/CXqmxuFOU3z7TB8rAHhM0kHJXxSD2FugB4Xp6
	 5RzplIPz01zC/vgrttCw+g7MWC60FNM7/GVyFsDk/vIq+N8Gy//PqBhIrC7BTr4Pyiu4Q
	 Uwy1VQNxjLL8DUQgNXiFnwlbOpEEgroA5RLS2sPzC2DEqIx7gcZV9wz9ZaLhrH4TtFe2t
	 mWq0vpBQaRhg1mdPm6OAo1oBAYz9yGf6fGrzKKeFlaRlDpIKT/G/2PVahD1yZBbI8Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
	b=JOMRCGs4wVgvAvf3JJcwHv2Wq087Z3t93ttGPXJ+1rzpATxvCufSsbrzOD0R1LNdCWZh
	 1O6zHe/92Z7Z05B4j/gd2w43HHufZtarWZVI2McGty5Ks049cx2M/zm0Hf5tUw9qSAuh1
	 1+Rci6ToYV3n+/o85StaY2ntJioqG5thGi4gZtITMCX75yOJjj2onDeASxFTq3C91jByr
	 KFl0bz4J6U+Ud1Fdwy/3068FByCwN5knw4NljqmF9E/c3ej/x0CIV1ZzPoATHA/PfZ4DN
	 LlxvzXOnm3mabut3NV03N9c/CNSVWyo/Wdkmx03JGLEvc77J1Bh2EFaRwZ9LtIW799w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCJHKpGU;
	arc=fail smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029CA606A335
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 029CA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCJHKpGU
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e609985789so6302875ad.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 03:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793877097; cv=none;
        d=google.com; s=arc-20260327;
        b=FCvKAlbIcTLNesbSrP/K+EMg4gsRF5BjMMlQdWY1RU4KbvcdCQlRKm8dQ+o/H8HC50
         Wd3i21Ab+R0++yVVfi8aQkJQtBcbZ0OLzcyaR/2YlssCo/Spcsm/K8KuXGH61QyiIe4q
         1o54o7uwiT4hWl1DkN5/yy0VfDCj9Lhw5xqSnDW0VXUnXarY//cg6sOougZsA6/e3AAw
         Q9PyqRY8lHewXSg5oA3+l/+kshMoO30Rj3ZisOCG892UEVl/z0v2maYv6ybl7oWbWpo5
         BiUAqA/MXt0SOirYG5+f9gtz/Wd36HiGLhLzG6MJdfxslZvKueGe+NW7wDJaz/REdmo7
         kgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
        fh=6rYplwHaB+rXjOxwe1sKDYP4rak/flqPFeWhZPFNLEQ=;
        b=iz+SGviIxBuwFkBfGxNlaKuS0sINzALi8wFppXbQLcSu/EVnwDm97h20Z3XqoyQg5X
         GEVeUl3E1SEUeJobTS+gmgQvhcZMM34Qbfb9VUUWDoMlUnH3MTTtRGYWnmDsKhcsGmcP
         e+ZxhyeWI+xkSy8k23qZXab+wXaRj4b7zYOiDDlGkbxpaJ1wFgUZrVC6+QMkRA/HQZ+T
         zJj0RGqj98FsjjdDCqfb+iXUkqJjoFYQ0ivew/C8FXo8/C+GWOv1oSEYYbnknNeZNnfd
         +1KtCmGs/vxA7CY9GgsiY3pIuocIZ7YUtKt097ylZltdSz0yt1TqvstBecUZytcbv2mG
         s6ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793877097; x=1794481897; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
        b=xCJHKpGUq7uzZhoQ74QyaADEcbOAnTn6kZVHVUMQQjBb41VKKpimkEb2TmR1fjgl3r
         s9eYFKxwfoGMN6yrGs7ZuT+oBN6HNA2n5EaP4pUGcfKjSh5pI0S1jllEaiMar8v/40Zb
         wZ5WRM6oKOTA6KlZFC05vsGytferTk+vVQ4u0R+lyo/nvZkH42SsIdR7mW+fzVN9IKZU
         w/Jt+eF6/yyPr5W4NBKk8TGb2JUMOu/GrM+791mRV+XDmJ98gnbjThKYcPS08UeHNSNj
         iOiAJR5dH4MnNhcvcO+rxiw0jV/PiX0acPFVoMGTzdRM8L0/Esjv/B7j0nY9EivpJKYb
         d/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877097; x=1794481897;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
        b=ouA14Rtcuoz9Z1YdMSdEhaqnYkIsSed1i7cUbmgxgtwhQdHTyzhPEMAW8Hf54W+mvm
         RWMIts/kEy1INaplyvHmKsq/rPICcEN+oLYxBngq8FWfBNCi6PjgdfFn2KFb2aULc8if
         YLyOQL4StSpyVofhh1EHpJYvVOVnwD8df/6yrY4ZdWMYoC0pIuh7Y1UA90TOI2/XPT0Z
         2ch+T17w3456+55JStNq88NFbyGmwk4TFZS18tJ/leTzwkZ1m95SxrKEfqyhHODXBBqF
         b6XnKvGD3ERVYWQjTn4z/ZqUCVtwyqFtLt5YiwM6lD73kgGegesDYNUB4bDTUKtupFmY
         uhMA==
X-Forwarded-Encrypted: i=1; AKwUvBwVif7fFssEjLa0P8p5j5H5AQ9MIB/D52Hd+zTk4cK/xR/2ZS9UMHOa7ghAuuYrSl8DS7xtA75SUmSL@vger.kernel.org
X-Gm-Message-State: APuU4Z9b8rnZNqOW8289zbpp/G7T/ZbBe6zrimdz6VLYg7r8XFZu99ZR
	a5bVWC8cS+50Vkk1HuE4HdvugSRuQVTmU1/5dBsSoA3QNdlb+ROGN4v/9mHd67m236lGswjkvgZ
	6FhFBTnJJYttfIrr53U2M6aea3N87mQ==
X-Gm-Gg: AYBFou0xrKw8oVxOqEJ9rrQrP02E0eBUSPtNY/GNeObGNxlIeLLnkeT8vWW/V2vsXkC
	27Hri5kJJ6HWoG3TM5hDMHwQOuExycVu81+iVB5tCLBO8yfxMHLqT5YndpcXuzTS1RQ11eULwW5
	gTvYGj6N7QXoAxuNQmeMgUabFr9svhudo+X25zx92wm6dy6kuqG9f/B//XShuuP0y12w5TH/82j
	zdgP2rlAskNXUPEYDxmlDyiCC6Wn3C1IHPjEoIyrkpAL14fGOBkJ0st8J3ou3PXEwPZQiq9cIIX
	qsFnTIyz03MNsh8G1qN6h2RjoF3wgfzH4aKtPFxH6hvO+RD9aL0iEnfsk3yakfxZ6Zm+fBBbuvG
	tpbXPlsQcqhkV++8wjL7q64J+C5hs4+BS0iV5
X-Received: by 2002:a17:903:3205:b0:2e9:5714:608b with SMTP id
 d9443c01a7336-2eb364b11ffmr186637435ad.34.1793877097307; Thu, 05 Nov 2026
 03:11:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-m52xq-dts-v1-0-b198f02912ff@gmail.com>
 <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com> <b2498fed-5420-44a3-a215-02438b623ef6@oss.qualcomm.com>
In-Reply-To: <b2498fed-5420-44a3-a215-02438b623ef6@oss.qualcomm.com>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Thu, 5 Nov 2026 13:11:25 +0200
X-Gm-Features: AclHuK_K1rA2ODQYQXEgmmGIBBNJicth9b7WPHwdpfBELTwGQmOcDjIv1-lq_Vc
Message-ID: <CAARotkeDeZAY-rxXApYE0qs_-kYEvLX8e9UjjtEVFH83Q+ogKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325: Add Samsung Galaxy M52 5G
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/5/26 10:10 AM, Konrad Dybcio wrote:
> Drop the reg and unit address (numbers after the @ sign), since you
> have a memory-region handle

Will do in v2.

> > + /* NFC chip power, switched by TLMM 42 (no consumer property in the binding) */
>
> Please fix the binding

Will do: v2 adds a pvdd-supply to samsung,s3fwrn5 and makes the driver
enable it, so the regulator no longer needs regulator-always-on.

> No superspeed / displayport?

No, the Type-C port of the M52 is USB 2.0 only. The vendor DT limits
the DWC3 to high-speed as well, and I tested it: with the QMP combo PHY
enabled and the orientation switch wired up, a USB 3 stick still
enumerates at 480 Mbit/s in both plug orientations. There is no DP alt
mode on this phone either.

Thanks for the review!
