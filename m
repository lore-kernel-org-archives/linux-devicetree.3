Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC354D7D4D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895759; cv=none; b=OjkGAO3EZjEUPYpEVwKgeGFZ/yQU5Ycwp3pmRNngzjSO5Yos1Tayf8r6/Qe6dgupg0O+J0JBTISBDoQoiRL4OoQw4mpBKo/SXh7qgYC5DztL4HDgSuGcQH9CTZIFyYAzm9rxOmCF0jUTxADsqBdsOYChDT3mT94Hx21V9CTkROM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895759; c=relaxed/simple;
	bh=hy3ocuhI/6vDP5S05nfHI6W3yZv4jEsBq9cAYewde9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYN7YfVO+zMRC+GeQz7amnlKVC7nmz8LkCXf4PKyyzXoD3s3CBYk2qOq93/7JWsj/Xldml7bg+tY0yBqC4YYR4V66AvuT/6DvYXfv4qC0SmpDluupYUTxkpp11DGZJ9w/NSANhtyu8DQVTnrahYqhFjo9uJfeIwcrATeRpioI9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVCTX84K; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVCTX84K"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2859509f8f.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895756; x=1792500556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOn8xr8BpKgnJ6Gee1th0C/2r3v4X6hPgJGRiiP13Cg=;
        b=SVCTX84KQfto6of6LOHGl3AqeZAJ+IvR7PH8JEDFO4Pu8f5ibtZGa52ECm+9eZ5q2G
         G9i6uFz6yxKB88p3Ik0eEnZMTiaKmfe2FsP9cnmz3Vm/YLt1AhLv37zDXLBNsKMXmHK1
         OZAH1PUxY1RPUo8d7lLFDJ53rhPQJgHJz4i5InK+TxG+cqK7E60amYjxXbqsbxOFcp1+
         II1+oRL3mRc6cA4czMw/Z+tqS04ofJn1xiJfzP4F4Arqbzv5np3dtY4rsCRn7Mf2kaAl
         w9kOFpvu3VW6Q5hXd/tB+ldamMByklC8+nBXyG53wt4L3Y8EnDvQ+5Th3Bs8DbLnz+Sw
         QlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895756; x=1792500556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOn8xr8BpKgnJ6Gee1th0C/2r3v4X6hPgJGRiiP13Cg=;
        b=CfceFn80Wj58jppls+l5r7zu5mxDkuT07nMQVtJ5xWzMZti9SypuXcYPITty9sLUY8
         eaZLK7D2nCWoMzUpBz52EjGFwzJCU5Nb7fokEF+8G5IOwfF+aWvhhHYAoifym06jLnw0
         lAFZeFXgiLYgqYze/gjH9bF0jnyHUafg+rPyBtyYwsb148H0yV8NZ2Ic6qTI3GJtA+0s
         a72c9CrSndcR4PPD6laFn2LPPrer2R4xjuY8WYsOLAPFQF08OswldQaXQCMAMKT31pND
         xQctJ6HC4AGjNRZyICebuBb1/SFVj7cN/zmchsPErDFTalxI72vOxxKxnXutYBxkbX+k
         gzhQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/YOOnzAhR+srByDrnaAdxzJcfh5Eavjqq7gYqN99/hApagPctFb6UcA9UilAFZ0SNmMYo9ZxHXf4Q@vger.kernel.org
X-Gm-Message-State: AFq9FYKzJklnOUIDIZM7PlhoqVDB9noKCUMlRGresMflAhpUgcXfvWIH
	6IKYHjs2XKjY/fVfrVZu5pAxTliJuEfMWZCMcjKCx8gwh2n+CYq4jl6+
X-Gm-Gg: AYBFou3/uyePqDWzTRJ4mcNDrWuk2pjGLiHIFxL72O34YM7uY6m8ec5p3OaabnF3YJX
	vPoiAJnV4bv+DwzDEJzsSFndK+jnqwvXBUI+gWfD16DHRh4BqygYCVTRETpJKfef/sRINPHyvKA
	3udwyEF1t5/fcQyMz+7W1hX9HSaJGZtcRZJ05oAZB5ZQTBkpeY08EX22gTnGMvTEQirq825RE65
	SYSJTqGapfgJMa+mzdC8jDw+6NVfOVQ3C6oyFp2mliHaBLFSuYK69m0OiDhiK+sqOYgLDb4VCeF
	q/OMk2R8nLoxcsDw8IM6PSU3BfkER6yNZmhsf+MLWtZzF1zGercPC4JGFdxlbK5Pw4RRvgxwwfG
	z2Torn+p5b50m8W7i3B/xWqYw2tqQ/MyMoV/SrI8fQDlc/KvXAiVNVSPmv+LS0CMOuiwjLg3fSc
	Btg9URJVDaGReg2JCfQPBfxLICyT0OmTSDTP1f7BuRfDn0rbO+5aYi2O8SpvY47DQd75LnrPi0U
	rrns0wOPE1DAIJTMgb0xSXmUCEOYjGNfRH/FMauAy04ACaZCXxslGgbWIN2CnVTwlJGu2k3ISNg
	clGxlYnr
X-Received: by 2002:a05:6000:454c:b0:487:c3e:8df8 with SMTP id ffacd0b85a97d-48dba77cf87mr16911311f8f.5.1791895755870;
        Tue, 13 Oct 2026 05:49:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa05sm4447635f8f.13.2026.10.13.05.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:49:15 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:49:13 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/7] of: property: Make fw_devlink follow GPIO, PWM
 and clock nexus maps
Message-ID: <xipbz3gva66o56fjszlhioxgprcspwae7dwcqe7snub7wblts3@qqryckq5fau7>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
 <a754faba-f904-458c-8ddb-7502e684c868@kontron.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a754faba-f904-458c-8ddb-7502e684c868@kontron.de>

On Tue, Oct 13, 2026 at 02:09:37PM +0200, Frieder Schrempf wrote:
> Hi Ernest,
> 
> On 10.09.26 16:16, Ernest Van Hoecke wrote:
> > [...]
> What is the status of this? Can you send a follow-up?
> 
> Frank is asking me to use nexus connector nodes and it looks like I will
> run into this issue.
> 
> Thanks
> Frieder

Hi Frieder,

I'll be sending a follow up very soon and address all the valuable
feedback I got here. Thanks for your interest!

Apologies for the delay, it's been quite busy here, but I also had some
nice chats about the topic at ELC 2026 last week so I'll follow up soon.

Kind regards,
Ernest
