Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C8225417
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331668; cv=pass; b=Zorh0Kai+8Lp3Q1zIgcLP6QzSnYUaVSrXfxUjMi3IIKjeFKnJkk4bxY6qCfjlIRVXho5AfvcpS0CTTZgBvFxlGAK4Nd71+MGXWG74z8zBseVc978xFrVCfikxK3ouotfxLvNshSKjloO3Tq9te3UONqe0djR8bjDgIKaa76HX4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331668; c=relaxed/simple;
	bh=OgOjW53rnAfiOwa0Z91cSeL+u1QOpFb8UUqaKb6EK9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIWdLeCfQa/9+VL180TRP7R7hfRf4/b/u+jCELwaNnycMHV5mRYcpRegy6VXT8g/sPsNfm06v9NPpeBG5MeGffsaXJVYIhxWABe14HIrO6QpCjRyEkKVbuEcTBxzqFzTKpWJHlgVFHvRgrUwk3zNZUsjHlWYcMIFFIGdiVXm8yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBq3qWiM; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBq3qWiM"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb64085c45so720094a34.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:27:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785331666; cv=none;
        d=google.com; s=arc-20260327;
        b=VP3nH5sNwLNG34yn5x+aus6pd128LpS/rLfPxuHEpsEvu6Z9Ha0ROFNtaY9s0/pI6Z
         TQxLv+lnPDJLdHtoGR6nJLI/e5XRjVfyG+VLRf6266C3Nh6MDrfHAizlDxIqxUeR5XXg
         1AM3TLtXqR1a2Aec/U3eYS4Ej2EkMQUDAVypCece5XgOdQt4a1Xrpf74WtL3HxaTWXUd
         EojjkNPy6J9r0HhROPeBZezDl+A1LJTlkVm4xNO9SZXIQxbz6wxYS2TDvjfDbFb59UKU
         lO32NhQinuuaavHEy1FUUsyyYK6AMqKs3Kfplfn/8akQS8U2qSW9WcgRThwNoijSyfvB
         K48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gxRULUArcLi/mAA3UKCNpTlA+ujH40s8IdE4tkoamgM=;
        fh=0jDYL18e/NRe63FWBrQ8RUhykTyh9TFwC+lQ31H/x5s=;
        b=e4DJ/+OA8VIoXajewd8P2tQERoZyhF1aGk+Oojr8A1ESXZxKZRpetbCLS0PDzeCnKQ
         gHdJ5PulWrVDUHKmyNHkOp5rWf4KzMdP8mDAfgVOsqW+m/xw15wB1G/KmSKxqJgijumk
         0LOi7JIOFPdVVX6hL50A5A1p7QcqtAQZnEG5icnsttexMRI/T+tv16nDPKChLtw0V67x
         Lj/rPMNSH8WIchbdmYKj5z4wT3bwMIH9HI/kxQ9kFY+BeQn50DzvgwZg6TmYWRNqWe/r
         3ix2GTovnJ575Slq4SFdIgjgU2SlCaKB65ckuXfFbvdC4D0r6jawvoLdlETHgv3DQb5r
         Xhrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785331666; x=1785936466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxRULUArcLi/mAA3UKCNpTlA+ujH40s8IdE4tkoamgM=;
        b=VBq3qWiMMzzyALl8omvN3uc5vwVRzI/mmztioDa9PntzpjCFCRYTfhnu0CfNb0ZET0
         jDqaAcg9ptBAJxeJHt7BmAzOLRZxRLb8C0PROMTEx6FjQSPbeeBM1NMfZI5Yf9vQlX5E
         98YkDbKqltG/iwD6bFdPmyuoTuxftzMVszGa+RqkpyjCO9Jhf0NMPaA1AYW7CIKRdeXG
         RUVyV9MJNo4Z0119+Lm1ha/cMG8I9VAJKpw64lSQU9sAnWJ+EvYFv/jIXhm6+O3FVTh6
         ZMFf/VU3LFzHMP5k1LlZVmf6Fw9RruZQVr2NvYqTSx7W0jUBDpr6iETCdKVI/z5vptrg
         lA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331666; x=1785936466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gxRULUArcLi/mAA3UKCNpTlA+ujH40s8IdE4tkoamgM=;
        b=JQKdi0wAfPKoaN4GM60azToX9ZvQI8YneTUXz8Ui4eZzfvxvcZBwlhv1KYF36lgwiu
         x2SVD3TKpZQkhJx2hKjqy00lm7DDDXQhIfjB47DosxUQB2lsHEgVWNC8wI/RU+DtNUvB
         u9Siwy332jnupjVS+QKM0xLA4+ZmXUUMRTg/8ovc1D1lt5thP/JB5+wDMidS4o0Z2AnM
         d1gZWdxm9VK5SxbDBR+1EUbCLxgtrc4jS/Jn77oVEwcwBuJ/fS2xPtdHHCt6D/4fGPP7
         NoQ5t9PEvvWx+ya4qnHU22e/TMG7ZUSRUAnTwxY+vwQAEHGprRI8jEsb0FE+a00nPOX5
         TGkg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7sbl15NblaBQXWmMcp9AAFQd1frQT05kcUsInEQIa/nchxiwxNnf/AGukI9u45OgOwLTURgmytY1k@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ISx2INbXC+GK5Gv3cXCcIXjrV2qsZqwNEyq5Oz7sF5jdsNWm
	1xyVCnI+1E04vb5Q86cAEAsEWgBs4B8bszRA4rLgkyqb8w0SWWnhvsskrsB2te2g0LgXvIWtz7x
	1Jf0rY4OFSVhwfw3XLarYBA4BsOu7jSE=
X-Gm-Gg: AR+sD10gZbnBrBlgZDbzXW1BmZZxTAQW8+BiKDkAhEwfY/v9tu1ZEqEm1q2ph3M6zsW
	WVXVXrXSPbo5Do9q8Hl9GFRDNEp+PTwgpFUmTv6tLepMJKqiMPV6qHZc38XuagLVTc76NKa3Mow
	XIRcdppp0RtEaaMMlW9JWigrzIR2jw41+JtzcAd28/1XYTR7hKPR79X8PFFHGT08H8K4axOp8qe
	Ii+ugE/fdOuWaJadbTP6QVcNqj6YdVCpYE+iJsCjy6SA7Jg57P1iVq7dDJi0UsAIkMKCayFn+bU
	r/FKLNwKqDwUodyAVS2jid00RXvi4Q8Pkeb0zNk+ghHelKXWAJ7wRfd0dg==
X-Received: by 2002:a05:6820:2215:b0:6aa:ea7e:1dac with SMTP id
 006d021491bc7-6ac96bdc308mr3238719eaf.33.1785331665974; Wed, 29 Jul 2026
 06:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org> <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
 <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com>
In-Reply-To: <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 29 Jul 2026 08:27:34 -0500
X-Gm-Features: AUfX_myssxkk2aJ3MvoN2H0D6ZI76cn0SYIfqLF68G-ApdrPJCyOOHfepLXThTc
Message-ID: <CABb+yY05L30Gt9cmF8Hoz2sGwUc1XocZG3vPoKMwEDfRH4tpKg@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
  Replying in one place to the two main points of contention ...

1) Compatible string :-
   I too think leaving it too generic is a bit bold ... we often think
it is final but more often it turns out to not be so. But I also don't
particularly like the idea of naming it after the SoC because
controller IPs are usually not tied to a SoC. So giving it a
controller version specific name should be good. I hope we treat all
controllers as potentially 3rd reusable blocks rather than a part of
SoC's identity.

2) Single-channel Controllers vs Multi-channel Controller :-
  Looking at the description of h/w, especially the separate and
optional register sets and the fact that we are not talking runtime
ad-hoc links between two endpoints, I lean towards single-channel
controllers implementation. That seems like tidier dts+code.

Regards,
Jassi
