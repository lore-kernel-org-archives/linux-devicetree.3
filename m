Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602874;
	b=wQsP9VkHCXvFjbgIbPbSszNEvWvt2FbWSnAb2F+4MAqte89Eh50HnbXoCiLDTcNU7CsC
	 oS5qKZryFUk5/xLUzs0I8QBSyjeqbOn48v4f/0rze5A8KRu2gweFAMzeY97pEMe4ODvsb
	 2zQ9Jwkp2pe+NCzRQ0lxwECmj3ktnJzF2ANWxK/5x7O8j/AjRBkJcQ7hXeWjEmyTAdBtu
	 LdCCT0SAvO3F+A2Vpry+Z7in36+wgFY3ooCRYGIaMzf6c747uuUf/ISePQHNN+SG9U8Rx
	 uLatetGGdSIeVQVpT4paKdrSCiKPyTMRA37GK13TllaGTXLPsjkWpVju03SOl/gqgwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IIEwmheUGWh0VnqKa35MN/XtrDI3rgz5r0klSZQPba8=;
	b=W9wSheQAOAiOw9PZPckqsRZ2pw0MBWELda007LPnRSGPAamNBUW94Bo8XGMfRlSm9Ze5
	 8Hk13QkWDX7YQnl63gBnZhMkmAo3wmv8KplCJRSn/1nvmhmhgAbNeGzxmX6s9L6uawmdB
	 gl95qejopi32Mvkznl/uK8zETIQorCwiCybFfnMmtM3Drg45i9ZjyUHpdhhzpIyMmBpSb
	 F6WZoLYF6SJp83ItGGG4q5E0pO/mvhaPO6vsL2jB0dZvnzxVfFpJujRMWo+ZLHy9ax1c6
	 e9dq26H+rPXYGrq8bpu3LO115TEehGWd9osfrKb7X3e4FwUU9bsRMv9BwNuI+Dstptw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MV+0efPP;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEAD606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BEAD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MV+0efPP
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so7192715e9.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792602872; x=1793207672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIEwmheUGWh0VnqKa35MN/XtrDI3rgz5r0klSZQPba8=;
        b=MV+0efPPjre42SVRq3x08Nqwaif8RbXYpP/8z4IZC9aOkuID0XUwy/drnZy+oc2V7U
         +x6j6MDkKPPCHgEtU/icfbi5YZkSM/4pmVt5kAgka6sSoh8m2MuL9dJTd33xZ+FSW3XF
         M8/3m2BYNewTj5uqB9hTQ9xHHXtulTbRx55m0lgFdEHMP1PhhaUJzLEfeWYtVMVApNsy
         +oRxH3bKVcRA1xc0HEFKiywzEspm3OzT9qmr/DFyMVDx7U8rgA+cGB/oXvHezl025tOC
         s3IGb7yrvmwgqvg0P3/bFgd7xrwZT8KWG38ToEYi8hdgDilPMoZqn8/a/avR2AW9C1c0
         erQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602872; x=1793207672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIEwmheUGWh0VnqKa35MN/XtrDI3rgz5r0klSZQPba8=;
        b=ye/YLfsNTPc4ou+UWsPVnh7jGpBL/FLBJi3Po3tKp/n9uBnqCDtmZEfvBPcUZ8Swgt
         3i8NHAtoMYp3ZCAhp6/+S8cXFMGO3eaos7WFEszfnSGFVHhwOsnm4THxe4jGVerN9zie
         X/sFxf/sQZFwdsw+wbCawVdYr8PVJ14PqgjaJEqB1cox8aePiCm8W07jjk60BGSR6+bQ
         t12Ins5SK4gbhxDtpa8dM9uXkOF/+F+CWlu+BuHqwGQ7Pxc8llGlm2yIw73yy9gmzGne
         61rYrMp4GeYkdufjhC9Qedr3RX03qjGqj2mNPYZlFYSJbhwX4Yh+ZM5lbn8hSxq0OlFS
         8GwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFg7mXmjeeajacGVLyb0OBuZ9BCcgt/NPzdbog42T0d+QtyVLFx7MzOqk2FvXoCSM0OglYkc1mL0nm@vger.kernel.org
X-Gm-Message-State: AFq9FYLRViVYGx/6mbcsD//7SLhsJZe4GkEndNAMZg63Fm7PoYh4NNox
	b/RDmQTmqz8nUPEBVNtJkkF6phn98XSlcLzDZppcz6/Qo1qZxuEKS1OmByGOvJMJrtM=
X-Gm-Gg: AYBFou2cXCB3FrHxivSt18RwG59vMborssK86tDAhnxINFu9IX9xJJSh1JPd/TTvVrl
	wInwLPyxsdG5c6dTB0sj/kkWYAfL3I6untcgIDqrhUCezJk76GpU8/OeN6czPF5GCQrcPoGhe9d
	M+A4fDciVCXRnQS7ZViRpqvv61TRMj/rPUol3cr9PmrdgRClUTK/hba7zTasyx7yX9BWlnOJ8Oh
	qmDQSl8MN86UC4iAemOVIfKT0rb0K1lmYHbqlMVWFseDY4788vVEaiE0rs5DYnRhPakjGX8nOnS
	WuVnAoPCCMJrlZ/Hx/DiRDrjlDC6ceMTmSlyGeOV2p7OWGTypu1mc9cI6tME3p06VxRUgQgyVdK
	0cUagsX98T2b0Nnm4vD3cKWYu0xZZePLPWzX0B7OfQ2h6ctEazez+Ih/UnFUAFojCwdhwm8H1QW
	fMUFI8Ol694i88MNtqMR9DubNr1n8HilgtpGUYaOe/tfQOvXuk0D4FjyE1tBiRiGw6z/itLCgEO
	j3jn1FhwS3kFF68JUyDgDS0cmuejPyGb2a9fzajImUUACajrtkoZOWwd6ID2dI68IY=
X-Received: by 2002:a05:600c:628e:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a1fdb0a346mr56541315e9.18.1792602871904;
        Wed, 21 Oct 2026 10:14:31 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f10:9608:8385:755e:e1cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b42befsm4715775e9.8.2026.10.21.10.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:14:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:14:25 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	konradybcio@kernel.org
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	johannes.goede@oss.qualcomm.com, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Message-ID: <atjy8ZVUW61VBa26@linaro.org>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
 <ath8tHxHOdA7G-Bx@linaro.org>
 <2d885d41-7d05-458c-8364-e206dab12792@oss.qualcomm.com>
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
In-Reply-To: <2d885d41-7d05-458c-8364-e206dab12792@oss.qualcomm.com>

On Wed, Oct 21, 2026 at 06:20:55PM +0200, Daniel Lezcano wrote:
> On 10/21/26 10:49, Stephan Gerhold wrote:
> > On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
> > > 
> > > Thanks Stephan for the additional information, that's very helpful.
> > > 
> > > We currently have an urgent thermal issue on this platform, and getting this
> > > thermal mitigation upstream is important to prevent overheating under
> > > sustained workloads.
> > > 
> > > Would it be acceptable to address the sensor naming and description
> > > improvements in a follow-up patch, so that we can get the thermal protection
> > > in place first?
> > > 
> > > Of course, if any of these changes are critical for the correctness of the
> > > thermal mitigation, we should address them now.
> > > 
> > 
> > I have no intention to delay this patch. In fact, since I'm using the
> > latest unmodified stable kernel on my T14s, I'm also suffering from
> > these thermal issues. :-)
> > 
> > On the other hand, we are at the beginning of the merge window and Bjorn
> > is unlikely to queue patches until that ends. The changes that
> > I suggested are purely cosmetic (the names of the thermal zones), there
> > is no need to repeat the thermal validation. The throttling behavior
> > will be identical no matter which name is used for the thermal zones.
> > 
> > IMO we should use the remaining time until the merge window ends to
> > correct the naming to avoid any confusion for people reading the patch
> > once it lands.
> 
> Ok, fair enough
> 
> I propose the following names for the thermal zone:
> 
>  dram-board-thermal
>  gpu-board-thermal
>  fan-board-thermal
>  wwan-board-thermal
>  chg-board-thermal
>  cpu-board-thermal
>  typec-board-thermal
> 
> so we can capture with the name the ones related to the non-on-die sensors
> 
> Sounds good ?

That works for me, I don't have a strong opinion about the naming (maybe
@Konrad has?). I guess people reading this might mistakenly assume that
these refer to separate "sub-boards" in the sense that there is a
"mainboard", a "Type-C board", a "DRAM board", a "GPU board", etc.
But I can't think of a better name either. :-)

Thanks,
Stephan
