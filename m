Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E143A5E67
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550367; cv=none; b=EeCUPPU16O5ydW3KWg/qCFlyLVteik6XTThFScu15QiyZdhatgUy2mhgTqpiwM04iR5VnsN/XmmLlv2PotuwOltIIxkdcUiF0JWhDkAwAro52KsTa7Dqutpo8vHac3SQFPTo1k3tnE7EOpqrtsjdoeZOPgagDTzM2fNqBM/sQEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550367; c=relaxed/simple;
	bh=zqygcrO8Ojeqem5zuMJaEBnyLG60aJqsmeSRNn3NpUw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmsKQIy0KDjwnfoI7MyH6G7RR7WkJ8w2ILSar6pPGg4qzpxCY9yK5BsPqTgC9+6Y20cNQ/P8zLytnx4a68cMI54ZBQSfXamDmt/AnuKnq7qZpyCVx57Fhho6VDMbXdiQ40LSDKY1lNXk6O7/QLidlikQAVPpAfuXJkM7AfHuhZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CWG04K2G; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CWG04K2G"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43ccda008cdso2867561f8f.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775550364; x=1776155164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAhnvdn7hKx6YnOufXJRDlAYALMzw6HqrxcTsLc/17U=;
        b=CWG04K2G8TgRZ+LclYnSa44LQoqFyCNQlgt1jfGxJMSw6BR4n2wUsg0AqKmEwYv3sq
         1ssmWtRC0WtWJ5X3rnsHJVRbd0vJsJ1TZ7nQCTMQr35yWMhl40rQL/Pcg/CnoPzKMpFy
         yrwoDEXIxOam/gC6ZuR5aoliDxJYBEU3wCKePmVgcyq4gT2rkG5BnAfDLFXFOOiKRrYn
         Oy2qbSWqsEQOApfkIOEjzAacZUS2ZV+1HZM6nMdjPReht4YApx90NBO+bXug8HS9+cUA
         vmaddclN9/kNxRXQxvpPDOmIIV1cLYfl7vxm3C6vZQee6SLxZthr4wp1tD8bGqmT6kgf
         2tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550364; x=1776155164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAhnvdn7hKx6YnOufXJRDlAYALMzw6HqrxcTsLc/17U=;
        b=H5ePDOYjh7CcqJi2vz6shI6tYVHNKurTq4f7URg5M9k72B3Wp4b1PY4xMiHnmfgP75
         eexZEGbuQfc1jTONNGKfPn4oYEY3+m/+m6zsA2F9zqhn+nd4EBfmJmrCS1IjYRp28vNi
         yYrWipumKDWos+qWnSgoA1cmPch6Ycb6H9HIwUkdUx2tQPPsGfba7Fp/mpXha1DB4+v2
         zrbxs2lTUHLtG6vrWw1GxcCfRPTncBjT2wZKz8Yaq+suB0ttbe/fFzb+VXN0SjM+aMC0
         9pV7pWnEo1Vh5GfqPsnn7TtqMAkL1hjoNT4Tj9IZwaZZlAE94OJE0gii0GkEoYTULyZP
         w9sw==
X-Forwarded-Encrypted: i=1; AJvYcCX9/LsF85w1UJDgxdRf1G1BHWXZvAfE92/Gi0FWDsGDSqUi7mxHQetShOAI72G/JNP9DHiT24HwpqrN@vger.kernel.org
X-Gm-Message-State: AOJu0YwmG/KYFLsr3kBKuUPsRatjajB+v949KneWPhwvTa8AQZ0ytfx4
	zjQso/On8GK7T97FnIcl7zbLIVJqCIy3pDh7Bcyw4zD8OQGGiS+IUNNQyJEjnY0+cg4=
X-Gm-Gg: AeBDiesvnbjUm0rFwwcC8AKlLAJJWJ1F6iwUnDysU7V8QtDFYuHJpSaI8k6ihJoxA5N
	JmH2a5mMlsLlypjR3dFjcgC58mERs2IZ5aWdfBRpcSAhvEy2Z3E3Nif7U+iGyZVT4Nlqkk3JbUu
	l/9oyqz7d6aDr/KniyIC/LT1K4WSpfGeIUg+BZqcJP9hFbj/wBee5PYQafCwmNVNmkK2EwFvD6t
	AM09Y/gLZoX9QPzb4RlPvA32So1KrWaV62570Lq63noZ1D+TfRuxmucA2f+bthGjmEnild6pLdQ
	FPppXzRjOV6h8YvGdEgmr9fhrlRldrLFAqIcXOk++wWnCp+O5muZ4zNmiOmgz3GXZYIatzwUCZY
	JKzS9bP/knJHzFdg+PBdhzai8JQ4dqvB0+XhH6hVYD1jreEl0A+oC9ltMLrDS6y13gZzHVH1vMF
	+sYXYWevLBVtVec6oeZwZtDypxG9VS7f5Q9G71ADipvBgPWxa0Kg==
X-Received: by 2002:a5d:5d0a:0:b0:43b:9b0a:7e80 with SMTP id ffacd0b85a97d-43d2115aed7mr29018679f8f.3.1775550363998;
        Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c637asm46018051f8f.14.2026.04.07.01.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 7 Apr 2026 10:29:09 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Message-ID: <adTAVQddjxHgoh9k@apocalypse>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <11b5eee3c22cfd034bb4b425d28a5a3ff2a71828.1775223441.git.andrea.porta@suse.com>
 <20260405-enormous-glittering-avocet-285f82@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-enormous-glittering-avocet-285f82@quoll>

Hi Krzysztof,

On 09:52 Sun 05 Apr     , Krzysztof Kozlowski wrote:
> On Fri, Apr 03, 2026 at 04:31:54PM +0200, Andrea della Porta wrote:
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> 
> Missing ref to pwm.yaml.

The reference to pwm.yaml is at line 13, as follows:

allOf:
  - $ref: pwm.yaml#

currently right after the maintainers: block. Are you
suggesting to move it after the required: block?

> 
> > +additionalProperties: false
> 
> and this should be unevaluatedProperties. See other files.

Ack.

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof
> 
