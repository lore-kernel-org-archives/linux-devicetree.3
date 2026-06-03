Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B683DB307
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474243; cv=none; b=F289ntKFjkALyGw0Ntt7lTISylFJvfP7jXkc3UZPHJpsEYh+buBHDOroQmnG9VWLez9MFVOemwbVKKlxU2J+DMJvtfHZkZA3/7XVnkPoCpdFwWeiZ/Z1mutxKNLcxS3Cr3oSWO+TsT+nydiYOwsp/gN3QJdq87ph5GhPToqMN4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474243; c=relaxed/simple;
	bh=L9urVhS33Do6zCalZdU3eSAmMtEgi2x00tmzzJLChU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aa5gQiQaRz6y1B6a1Q4BKJNWwqnsY8VlRgBYBCRJJgo5vgooUif9lFWsiRor8hYMdJDKdFFetiOrD1YrQj6Zd/TJyFn+Ssj7YiuCWYkEJFTOj9mE5CDmobeEk/jpcNrk2ziHcGkaNDpln1fx37KiBpnveyzg7afCg12ErecAeeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3DxiR/w; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3DxiR/w"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so3308050f8f.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780474241; x=1781079041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PzoJAMfBbn1uwW6pXQumFkyZkDU4AXI6hlryg4nLphU=;
        b=I3DxiR/wgkas9T61mMvmWAnhkNbZ1yajrGGd9lBHjuWhR7RW8L+KI7KeWezgcsOIbR
         vkff6JQ202Cp7W8Ol3/k/IpuMG7KPAvPi1JsjGgRk9xmXKYssOJ+JiWBFTPcFHeXPeXW
         eX7w254F7o15PQsDdkhXPN2sZiCV6H/aOFAWM4Md5j2cjBgH8d5kBCv5v0hMWl4Kez6J
         MUT5kvXwR2P8YD1R3RgHiuh8+qr8gLS2heVwCCkMTa2MUe208NfGaXB7WRFEZ6ve6Bt1
         CAtrw+muVtoVqsbjONNNmlY1kVqJZuqDb1HfJ5bLxChXXcRjOaJOT+UhN406Bf2Furyn
         k61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474241; x=1781079041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzoJAMfBbn1uwW6pXQumFkyZkDU4AXI6hlryg4nLphU=;
        b=fbxowCANB7DrJYIFDWyLS4EoOdTdk4oRKlw0JmoSIgUpHUq3uekfaHcDDty0KfHooT
         1rzaATyz1Cav0CRAnilTp/9a6Eb4xaH6S5wYsITV+MrIxCu9fpSD3ZIfyl5lb5wglFnf
         MzW/uPSeDEA/u0xMs8PIS6qF5vkG6a+5A47Du+Ovi+al84BmmVaaduVdqNUlDj6zul1r
         edfVV5b5hCsrOyJ1qFLHFTPmYOpAbx5rP9i2ew/KaHIePP2v/uJVW5B6CI7pyIX1h2oQ
         nlvRQnG9s5gGQi1i5qqkr5AeCR4Wx6jXVODY+UGM64kwKiivNh6tRAWjF/4UjM/mcoa0
         7ukg==
X-Forwarded-Encrypted: i=1; AFNElJ/yoNbQDTf0PKSXBemQ5MXr6ckNJlf/yPyzpCjeZ2YV7QZo1H7BCG391vEeEg5O1QxrhiKWUOZjwCrS@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxlurJx7lYZs3qDXWpqgSqcLI2VnJtR0MaTkI/C/VSZCKeGeU
	GknS+/RDP9WO7XaeatPNHrdh2qbXXRcWjA8zrQk/9kCUbPhNslnY8M9I
X-Gm-Gg: Acq92OGQAYF0v/FDnTONHJVimSviwWMSwZhIPQD77uHOWC1JisE672DyKnwrTCU8ohY
	RWebHt23PkUFRLHZLcklsyWwRasyWnIMVp5t2PUFe/NVkJTnF5xCYS52pA4irRi1MIpCZDE6dYi
	pASVHa+Jx/jBI+NwqZBbjDKz154P/BHWW6Tye4tl/29zQUqo3Olab8FXKmO3ySy0tEn+Bta8L71
	81aC5Qe3OKwdegV5X+2YKn6hlcx0D+AID0qNS2Amz/VYCtBpTpio6o0TGG9VnjfjlMOhEg073pg
	HP/+2D9aE1O5YC15O9lbaGSKQfvA8qF7BqThj+Kyb/lQA/KVVydq2Jwb6f91VtmLZMsTOYuAgYR
	1ugTckd0RYSyex4Sja1ODvW1nrilDvM+JknL3wWd3f8rnEAtL666kZHyssZva07TA9C065XVdu6
	fzRGQNWjCBMsOrEhowks8/hyR2qvWLiyplLfVvBqalIWfHFvJ1OglJATMqBbYgX/kxngbQ1Gp1a
	BkjVMVJyTTfMxTqYLwWW9iAqL5OOe7z9lo6uYHrm04OH3kSmOehBs4=
X-Received: by 2002:a5d:457b:0:b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-4602184d442mr1812471f8f.29.1780474240292;
        Wed, 03 Jun 2026 01:10:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm5638407f8f.37.2026.06.03.01.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:10:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:10:38 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: imx93-var-som-symphony: add TPM
 support
Message-ID: <ah_hfhpujDwcGk9W@Lord-Beerus.station>
References: <cover.1780051874.git.stefano.r@variscite.com>
 <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
 <ah3wMi6QW6DUPrS4@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah3wMi6QW6DUPrS4@lizhi-Precision-Tower-5810>

On Mon, Jun 01, 2026 at 04:48:50PM -0400, Frank Li wrote:
> On Fri, May 29, 2026 at 12:52:44PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.
> >
> > The TPM enable line is a board-level signal driven through the PCAL6408
> > GPIO expander. Keep it asserted with a GPIO hog so the TPM is enabled on
> > this board.
> >
> > The TPM binding does not provide a dedicated enable GPIO or supply
> > property, so this cannot currently be expressed as a direct TPM
> > dependency.
> 
> there are reset/reset-gpio, can you use it?
> 
> Frank
> >

Hi Frank,

you are right, reset-gpios property will do the job.

I'll send V2 soon,

Thank you,
Stefano
