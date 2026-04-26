Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E98239085
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777177707; cv=none; b=XfJnYp3iwTW4HvqFz9JecczBOpkG2/3wNoJDHVyQP7ZlqGxTSw/T/BlGls4IYYDfjYdshXjOHtP+NBks9887U3U3tqgV2g+aO0pSHuhQeSagyzVGk/haY0tvKw3YlxBYdycDPNUpQatSSkhmMGv8IvLanNl7HeIpW2d9PiW/zFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777177707; c=relaxed/simple;
	bh=xfsZPFOGlUAzwf6fVdJkq3KKTEcKYX3z+4B7g9iLlg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tR+7f+ukgJfw+1nwBRtbjjAyZQ4qcrUwgfs87VvSaf0+Rrzpg1IgrZhQNessNRwjRPQvm4J++VMWMa2V/SVfhZhOywgOA/hxKYYEYHxjYL7QeHxahNGPUnm3RBuQtux4NnSfq8aXO8SOrTYeka4EvPA+KrKiM5cfCULavtTVoPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXO8iZFh; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXO8iZFh"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c726ef332so12623047c88.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 21:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777177704; x=1777782504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QiNFy+Pe1YgCLRW9GTmW/74h6LPgkfDMo8eqshh65go=;
        b=SXO8iZFhFi1r/kJsdK5V9uWeO4e5mjKh31DUnYKRXyTk6K4SOPZeBGTKTvBwLtCw2x
         WhdS4aI4IF3BumeSNeupmPMRKTxSFTdXjVlYLH7gsV3/X+XR744w6M1AFfjLIVhcx2VM
         Sez89YAw0ylalI9gBzccKIDeC8jPucbFS87AoegssrB1lKvPbhFAT4P5viNVzCYrnvTM
         tVV4haq5o59yVFYwekBL0d1ZXlyLgYRK1mx/hQrA6rN/wcr+/r2PKZWChOFr3TovmNes
         1dlA9fQtmAt6TA0tPEjc8+FOFPfSS/bOejh4NeVisAbgt2llYl4rUeZ1K8aCcjJAKzlQ
         B02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777177704; x=1777782504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiNFy+Pe1YgCLRW9GTmW/74h6LPgkfDMo8eqshh65go=;
        b=MBmktHTZaDX1JcAALfodYmHQ2KoSBWhRzwApEViaZ2vttdoniVMG33ExGPYDofiN1l
         dTkWSpo3+WGPWgGh9dNuExiYRF2YFzje6p9SethvN2wmoAFZGvY07VHlMe69W1A/o+zy
         GyI4SKxH3/PN8kMgKGb0V6C2GJpsJ90vnS4vWRZrvS182NkeRjP/d2RrngO01p/nQ/50
         CUkQ2d7Jn/tOIyBWMpukErPV/HAvzjulXVIZTggzKp6QiMeFXtpwV6jE+N6IkDYUJHt0
         I5Bi2ok+GRGEAXtpa0b0sL6evnCJpzNXqn/dMTHOQRBYjzHgZ81KyMUkR+zJxkD2GlOS
         1qaQ==
X-Forwarded-Encrypted: i=1; AFNElJ97kDrfFnUfZNXYNc0Z1ZIZvjB00nQE5LgZeOuZBmF6lEDMwp8eKzhy2a43oaRzZrXLl5ZwCY75Qd7B@vger.kernel.org
X-Gm-Message-State: AOJu0Yw40PGue8SjhN+5YhqxcbPUc359yn98pVpjnHdEfbcseOxftn2+
	QllglFiKI2NRQAbtlgI+LclhCfL7eHF6fMLqDbB4de1UWX+Ufw1/calw
X-Gm-Gg: AeBDievLXXmpLiJgkuRt7+HwrgAzaH/jNHv9ACsStkuBXhheYX/R1NKCscZ7tI82X+4
	e+Gef5dBcEHbXgVR7JH+EbJBcnMwfi+phuqxXi85RuD07lCnb30r5CVsF6KLI3SrvzHATC/gfrN
	iv730fA1FgTyMm+ihvEgZ0GIEH6f5353j7zklRXuUdqJg0aj5I/42GMB6pbpXqaxBf5C5vOnnDE
	0UCGvYXdPx6Y69XdBrx7gJVEWybxHDBIpk3vpetaTQKw6lNE92YUsNVfjDwt8bdYPBzzEQnkVvQ
	cpzByoHrhpMg3e+3RPx22bALOCvd0/u5xzOQ+HJqn4H7kj/YIhPZVMiJEyfM4zRWtLk2WogYAL+
	1z+TcxT0hU2HR0pCaxwAZNpgGdy0xMLvif9ejiiAJ0urRF+dSJnniYMDF6Ky1pIPtbItwkTRt/K
	uX6f8eObNpZdj28nHM5boUjlufSdoAP7O+jEcEyKCigSOVjIkGc5vFnCegWehkqxlHzdMbHHWy6
	HY=
X-Received: by 2002:a05:7022:fe08:b0:12b:f881:d8d0 with SMTP id a92af1059eb24-12c73f9987dmr19784551c88.18.1777177704040;
        Sat, 25 Apr 2026 21:28:24 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f359:aa0c:530d:9dfd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c837f7feasm46022289c88.0.2026.04.25.21.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 21:28:23 -0700 (PDT)
Date: Sat, 25 Apr 2026 21:28:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] Input: isa1200 - new driver for Imagis ISA1200
Message-ID: <ae2TswfLCEACzPcg@google.com>
References: <20260424071305.89503-1-clamor95@gmail.com>
 <20260424071305.89503-3-clamor95@gmail.com>
 <aeuMn2w3kSUl-wxF@google.com>
 <CAPVz0n1POe_YuA+RyvLLUdO2D526hb_YQUXJb72Y1h6mW8M6kQ@mail.gmail.com>
 <CAPVz0n2-JE6E10O_rFZYPSET62HfAz3Zw8vyNa8xoALQQJR7Xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPVz0n2-JE6E10O_rFZYPSET62HfAz3Zw8vyNa8xoALQQJR7Xw@mail.gmail.com>

Hi Svyatoslav,

On Sat, Apr 25, 2026 at 08:26:00PM +0300, Svyatoslav Ryhel wrote:
> Hello Dmitry!
> 
> I have a question regarding this sashiko comment
> 
> > +static void isa1200_play_work(struct work_struct *work)
> > +{
> > + struct isa1200 *isa =
> > + container_of(work, struct isa1200, play_work);
> > +
> > + if (isa->level)
> > + isa1200_start(isa);
> > + else
> > + isa1200_stop(isa);
> > +}
> Because the driver tracks isa->level locklessly, if an effect starts
> and quickly stops, the workqueue might only execute once. When it
> executes, it sees isa->level == 0 and calls isa1200_stop(). Since
> isa1200_start() was never called for this effect,
> clk_disable_unprepare(isa->clk) will be invoked on an un-enabled
> clock. Does this unbalance the clock reference count?
> 
> This is a valid comment, but I cannot find how this should be handled
> among all available haptic drivers. Maybe you can point me in the
> right direction?

Maybe have a flag reflecting the true (committed) state of the
controller that is both checked and updated in the work entity?

Thanks.

-- 
Dmitry
