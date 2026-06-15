Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6596303A0D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781547075; cv=none; b=qkLBc5wQI9VqUITJODGK+rjBVbcOPRqNChLcTYCt/MJwleeIwP7CbNkOIXw24M8dsPsPv4RW+mWbrJqpW3KCIOveGInW7+IrYVmdzk187T1HmnshVCrZ9MuiHb8q7dJaUODXd1bK56zAM0kB4k3kpD9MKaMK39lENhNUuJfzRIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781547075; c=relaxed/simple;
	bh=PRz5HqABEFNqcItdRPhVqSjN9FdOe0gA+IYlzrwHfqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLhA/nl5YNnz1qVa19SiAOfD6TUZo544d1wy2Wn0DLYkHEFSkvniktf222XuJXPFLvB2O79ki3+BmYfaglgdWtWCGTuC5kRVg4k1FgInDG4icNrTg52TMkzX4Ff5n8OWM5SFMpQhTs3Q7LsfE5GCJx6HgwapEfdSfjBWvQXNSPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e36rgyIr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e36rgyIr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2099746f8f.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781547072; x=1782151872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YhHfYhZ56ymdmxnyjLOGaOGjwnoWlDkDUgcgUvLusk=;
        b=e36rgyIrOUrVa6GSonzh8FiHa1MPy12+v1Lfsz/RiAbVh+MJ8Noc6wXXMpKG0uWxJJ
         hwLspc0Zf4NDOcg1Xx9xWDzqs+oUHCEqJqlexCBfEFkDptUAEFmZ3hHpp9JEfaGhYQ9J
         zSEFoKrM1fqxO8kkXVFF62xDvvym5uZPC2GvjsjpFF7aT6j9sAhKtFe+4INpNJdO4UgA
         vxzSCA3CiYUqLQGEoxhQ2wKkpc1VhnUA4dWvViOJpaPxDy56pOwRi3kSQpjcDOL3Ae33
         UwDzm9tPzFOp4x92kOR7Qs6Bv8cgo0HbdlumED4xfZ/itxuii+tIOhW4Aix/XQbv5cD+
         HcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781547072; x=1782151872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6YhHfYhZ56ymdmxnyjLOGaOGjwnoWlDkDUgcgUvLusk=;
        b=bKSBgaFKUDEPI4k6QrGHbirCK+EmfwY1yi4KvXnfsCF6yOevkYtglzBXyDLeUPG5cM
         QUFOvc4imszXOA/PL+1yuG9TKOEDPp1rI6qYa27bOzIfCTJieKzG0OJjaxQGnD/cKTCL
         UGC/DpobQLrqCewR167xhx/ZeEPTKzsBmjmGD53gIp7S5MdswMoop/1mlrxakZlqI/Dy
         OhnGKzMLW1IXPSqipDLQHLqfVxMKkn09Gzw+KFtqU6ZcZz8fybHWZsIpsMeVbiEFGEcz
         Y5i4L+TrqrSsOi6u/RsWidx7qPMSosJKiZactzMAuuXsxX7LamG9rKz33/mZSiqhexch
         Q5ZA==
X-Forwarded-Encrypted: i=1; AFNElJ/EJKj2cqFUvWxTwM8GzSIoqRArz/N/1kTAqlFCF10qopvqJK9/LNwes0POR6Tv6M7RwrQuhJnthRAP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Hrfro2bqyWhvUWasfZIRHx9jNVuIAw64uNPSDFjtY5eH6cHU
	yYcMwqeytMvCwdVvpO14jLShLkDvP0kkqy/YoPDC89VnmiFyRFA9X4+Q
X-Gm-Gg: Acq92OHMPXNY4qJqJSEVZALUwHc8SOqU1QkxXpYa+RgQ4HvCgXCNNbsQPt9FGFcttOA
	H1R1TOBLnugN3SOllOSAG5OBHP1LgijQ0k116CljB4Zetrf2eIncCDxKkIfCIR1L3OY0VScRZ3s
	1TwX78IjE7vdOaPuxUSvAZralpDUwOi74XNjLik9b8dN9h/XiOwn7a1RzmNmplBoCIbg09cAkFh
	8ZwIGXPE6eiQuc/I/y1iA4Mm5OecVMli8RjgZU7MZRlkhsT/Jrucv3KrbHWz+O1Fu2q2vSYjpHd
	wSCjGJm2SzEHAVdrhJJbY4lZhfPeEP4B5MjBfwfjMHhKGUDsLi9iNCLGzRhvfBAYjpSSdB2Uvdj
	kvUlZnecfN9xEf5UVw+c4Ww8idKz0k/cM7oJn67+UMuTU/2QRpRA5FhRpHIffqkv2ZveTA6E+7O
	JP5BtLQVblTCUtVFxR8I+uKfC15FpVOAf7TsBiAaQs
X-Received: by 2002:a05:6000:4301:b0:446:96b1:f5f with SMTP id ffacd0b85a97d-46074a80071mr15768412f8f.8.1781547072261;
        Mon, 15 Jun 2026 11:11:12 -0700 (PDT)
Received: from anthony ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263950sm37158556f8f.7.2026.06.15.11.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 11:11:11 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Amit Barzilai <amit.barzilai22@gmail.com>,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	javierm@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: Add Solomon SSD1351 OLED controller
Date: Mon, 15 Jun 2026 21:10:44 +0300
Message-ID: <20260615181046.96655-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611-psychedelic-funky-foxhound-a8e39d@quoll>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Thanks for the review.

> > +  solomon,width:
> > +    default: 128
> > +
> > +  solomon,height:
> > +    default: 128
>
> Drop both - deducible from the compatible.

Done. Both are dropped in v2; solomon,ssd-common.yaml already declares them
(as optional) and the driver supplies the 128x128 default from its
device_info.

> > +  rotation: true
>
> Either drop or reference panel-common (if this is a panel) or at least
> reference that property:
> $ref: /schemas/display/panel/panel-common.yaml#/properties/rotation

Dropped in v2. Rotation is being removed from the driver, so the property has
no consumer.

> > +            reset-gpios = <&gpio2 7>;
> > +            dc-gpios = <&gpio2 8>;
>
> Use proper defines for GPIO flags

Done. v2 includes <dt-bindings/gpio/gpio.h> and uses GPIO_ACTIVE_LOW for
reset-gpios (the SSD1351 reset is active-low) and GPIO_ACTIVE_HIGH for
dc-gpios.

I'm sending v2 as a standalone binding patch so it can land independently of
the driver, which is being reworked separately. dt_binding_check passes
cleanly.

Thanks,
Amit
