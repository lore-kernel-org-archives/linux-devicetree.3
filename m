Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B260C32FA30
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386630; cv=none; b=VtGMQ00oHwXK3uHhd3NidbpB9MSQ/vag7A/HLHm0iTNjRizjE4HwLbBXEBE6P6VSNgDID4hz/DkyV8jKNori4oGOJ1220GUTsW3vOx8DK7cH3r/eqvTjPiQVQsDkQKv3iQclcGE6VYax4JhOuLJtrB9N5+w3ERPtwURGASLmix8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386630; c=relaxed/simple;
	bh=vCd2e6Uhd7ifWZ+XC5Z2X16HZ/PXYwWVNNFQyVtgYZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnhS5dVRL0b29DYk9eC7+MYA/QRZ+W220iAx1MnVD9jgql/526w7VPYc38QsAHPQzyTnn8eWbNaGty/6cVmXmyknsVLD02a7Yk9lViuprRald+apPvhKhh12+sfYz7ilOvaZIEEPV/Z8rIU8VhOzoipvUuLE5Ik3cbpT6GgV5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ErYNFNbv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ErYNFNbv"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f943870baso4843134b3a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777386628; x=1777991428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FsYz9EF0cuVmErnqDejVSwtFx0hR3j24m1rjRwretrw=;
        b=ErYNFNbv28BIE6wwTFhPCytJOv1O5iz+mL7c+AjL42dw/M4M4P86Qc3PrKB2jvX+43
         bjZbuZYNio6ODA0R1s7ySls6EI3DwqyzBxUOEBNJhRr/GlZjTrJMN0iAaFQgZJS/T4/8
         7qSmask1XfKzt1H6anSrqeEY5Kn7U0LOWaeck6aijVuf5S1RasCjA3ffTccMdwIzefVG
         zratigG5BW/YAI/G6q1tSFXz5tHPvQP1CROGiWzPolID/ZVvb6pQ33mW4J9xiJBfNQCj
         AWuQmb5RvrZ5j/aVBIvI/oZRhRrQu0SdAqwGyue3YIdE7ZVEg8R1ObJ4YUeJQScvzEc/
         kfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386628; x=1777991428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsYz9EF0cuVmErnqDejVSwtFx0hR3j24m1rjRwretrw=;
        b=RZSygyNz2ScP24wkeV3Ap0l+ZtYwIlbeRvZfj+G3g6dRdNhJDsPxQ2icqi4fM5V6JZ
         waJuVNBPObAojeQMInJuamVJrSbQ4rn49qmcr9l3kktT/QS2EOUnqXKBa3X+0DI9SIvW
         JLyPbTkgKLKJhcZ3jDt0SKyxDlilTg4PHXzfJxnl89K9STJMS5lXO9GAXeH7W5G70fT8
         BVxI0P5LPfJjXGDWxXXAUhOiZ6udt2YwE5DNzfa3e9MXurv1VTK3C5g1LtbRBcT4f+9X
         1rv95oSanZv8/LHT1b1Z7KqYFAmgLWmEWCiZqH60bKb7ve9YR/ajaI1yjrUFd+/Brcz6
         1rRA==
X-Forwarded-Encrypted: i=1; AFNElJ90d3XIlKMx+WF7N2DY19L6fqkHT5aNEiDGDUu5JHm7enE/wAfrmEFND70s7iVIu00LK5S0Pzf7plF1@vger.kernel.org
X-Gm-Message-State: AOJu0YzC23pmufLkkUYy/tc2sRXhfyyx7QP7lNqQIS80Nqw+o1FdPEP0
	LpGqWmQWeqvCJYuJonxcuiSq6p7ENxfhwONegIGFRT3Keil9ZjunmnWAtfhvyX5t9+w=
X-Gm-Gg: AeBDievJl7Y0veKdMIwzKL74f9iKFn1oh59ZRuaxKb27N7Z4TiAhb1gzBBqWK3NYeWi
	ctpluZ7FUidXuEj4mn0mbE1r4Zr5JjCa9mWDbf7JIJVWDE56k7C+QiiYYWwHaYH6OWP5MQSAFG8
	uBbKB4PmMqAOSGprrUmDuwrq1ZsDDQrgNtfFXRVfAA+U+ttOyBW2eaxmXWl7LbDmzs5VPd18lDG
	U3+amSVVIkLMD0rYRtIBe9y+wnQRgSizPB/wk6pdCT1oU16S2BIqtRLy0wsQsTU4BHz78jlolFl
	Y6c1zz+sG01GdLAGm+eEwI1yVFA56J/fXPbDp3f7n0vgC76VYoQ0kyIXcqjXT7VoDQXxnKltqUu
	TThuX9dPZ3nlA4AypWLlM/cIFLS32w+MOX2nGK5/rK7qif4E6J80oFaJhDPVc0S4RPebMUMw9UK
	t6XpG3o1sQ2mby4BhXRIENwDqpQMeD5EI1Mmem5uT6pECmc0Oe
X-Received: by 2002:a05:6a00:1885:b0:831:7627:4ab7 with SMTP id d2e1a72fcca58-834ddc145f7mr3744150b3a.29.1777386627662;
        Tue, 28 Apr 2026 07:30:27 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a4ee:17e1:59a1:f1e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf826eesm3066074b3a.61.2026.04.28.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:30:27 -0700 (PDT)
Date: Tue, 28 Apr 2026 08:30:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
Message-ID: <afDEgHUN8fWatC_u@p14s>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
 <20260422202558.2362971-2-tanmay.shah@amd.com>
 <20260423-stimulating-markhor-of-masquerade-aac0a7@quoll>
 <2351c698-cf08-4037-9777-0820448a14d8@amd.com>
 <eac0f387-c38a-44eb-aed4-6c4022f01777@kernel.org>
 <faef3c54-2292-4470-be6a-4c347ca65453@amd.com>
 <67f442f7-377d-46f3-82bc-86053e34c277@kernel.org>
 <09928c66-f041-479d-954f-56dcfcfa1c13@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09928c66-f041-479d-954f-56dcfcfa1c13@amd.com>

On Fri, Apr 24, 2026 at 12:52:40PM -0500, Shah, Tanmay wrote:
> 
> 
> On 4/24/2026 11:53 AM, Krzysztof Kozlowski wrote:
> > On 23/04/2026 19:59, Shah, Tanmay wrote:
> >> Ack, I will rename it to xlnx,auto-boot.
> >>
> >>>>
> >>>>>> +        type: boolean
> >>>>>> +        description: remote core is either already running or ready to boot
> >>>>>
> >>>>> And why is this property of a board?
> >>>>>
> >>>>
> >>>> Not sure what indicates it is? The property is under remoteproc child
> >>>> device that is SOC level property. Remote core is on same SOC wher linux
> >>>> core is running.
> >>>
> >>> So it is implied by SoC compatible? Please provide some arguments why it
> >>> cannot be implied by the SoC compatible. I gave you one way out, but if
> >>> you disagree then no problem.
> >>>
> >>
> >> So on some SoC, the bootloader supports loading and starting of the
> >> remote processor. But it is totally user's choice. User can choose to
> >> load & start one core of a cluster via bootloader and leave another core
> >> powered-off.
> >> That is why it is not possible to decide based on SoC compatible.
> > 
> > OK. The problem is that "user" is a bit vague and usually user choice
> > goes to user-space.
> > 
> > The property will be set or unset for ALL of given boards. So all of the
> > DTS->DTB. That's why it should be clear why all such boards should
> > behave like you described. If this is truly user, as in user-space,
> > choice, then DT is not the way.
> > 
> 
> Okay 'user' may not be the right choice of word. I should say 'hardware
> configuration'. On same SoC, some cores can be configured to boot
> automatically before Linux boots, and some won't. So if device-tree is
> about hardware configuration, then we need a way to show which core is
> configured to boot before linux. This configuration is board agnostic.
> So I think auto-boot in device-tree makes sense.
> 
> The only advantage on this platform is, it has a way to detect if the
> core is running or not runtime and don't have to rely on device-tree.
> 
> > 
> >>
> >> If we don't want to make it a device-tree property then I can implement
> >> in a different way. New way will detect if the remote is running or not
> >> via EMMI/SCMI call to the firmware, and take a decision based on that.
> >> If this new way works, then I don't think we need auto-boot property at all.
> >>
> >> Let me know your thoughts.
> > 
> > This works for me and solves my questions from DT point of view, but I
> > cannot judge whether this makes sense for you.
> > 
> 
> I say I will keep it open ended for now. I will avoid introducing
> auto-boot in the device-tree for now, and send a patch without it. In
> future if for some other reason this property is needed, will send new
> patch later.
>

In light of this conversation, should I still review this patchset or it was
made obsolete by "[PATCH] remoteproc: xlnx: check remote node state" ?

 
> Thanks,
> Tanmay
> 
> > 
> > Best regards,
> > Krzysztof
> 
