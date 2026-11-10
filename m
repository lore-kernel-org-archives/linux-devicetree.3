Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309730;
	b=PNcRKCo7NlKE6pLmOhis6K9XcQjerCBAqTRAupeap/vcFcSHfhJRblE0gfmw8PB3LFjJ
	 wka5ziLvRr3Vg0yRrBoOiTGjN+Hfp4ErCrRaqxS75CAwKgCBaDgtHkmJjtRC1qQfDuQ4D
	 NZMeJxxZTcS3TyL9qqmAGuUOTtGAQxR6CNtCJdArrYJmbr4Y7d2t4PL5vTTnmT5lp7gTJ
	 7Yc+FMHsx3UNliX9nkU83+v9LqqHykMKFSOom2wZaJ6pJKI8ggRPZscPQY/+H88EOkm4D
	 /avgeaqm675It5ixKNfeqWjyM+NAmryhoomxs2zQ5HU98hkOB78Bl1S5HMZqpE+DUIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
	b=T6E/subnuNTRgcKDB0LtzfToo06efUiT0LZ3lO3eVPTyksPeCiU0CBkTJ3FqW7uKl4su
	 gZ1IZwXeqO0LnElpZCOqB+J+iFQfJOZELSQTwts6zJjujJ8RLCrHyHbAgpm819X4bEzBS
	 kw0QxdwoR6BQdpek42GG1xYGC5WLPBJVg8hMACzwwXUSak2wCYrNPX+m4Q5LxxKzFoeAC
	 zuFT4iKrErieOXlCAUEWvYxivgn4rbQNOnBAAhJUQGoB655UMNqJgzNlgf/q63QsDyAj5
	 vlhbYcDZwfQPYKhvZvL5BYnUbW7f45besxlD8xZ3bgxTuLWrvDMgjzGi41J7Y9Gn1ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPqS74x2;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9718E606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9718E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPqS74x2
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1228114a91.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309730; x=1794914530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
        b=WPqS74x2NUSC1tknWVErVJDYN/dNQGSgNh2hN++DSeZCzj7xEGWcYIMyaMK5BHl11J
         5GCY+COu5espLBEtyeUQNc3FBAcbXjida8XkdTvkjA7izRWliOola4ss7LiRfZKtwLab
         ErVzZ4xOjR8tnuLcCh7hgQFJ/z8tpJojKR6Ly87XdXz0oLw0ZSmt4wutVzBl1DkWXIJX
         sKvc5mftkffxfJbnwxxSOf2M92EBn3BTp3hcnOqMIpwD+vHwzts1rcKEimx2zYSrKpFw
         e9hCO6sravTaCPzSjjPlFBt1Vck0UH8pJIp1lRDm/W5KNJBR1A35mqYmM5DCdeSNLlyZ
         frFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309730; x=1794914530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
        b=u3CCPyz0bMNfTuUNWYDixZmUaTqW2pGi0RmWjCIVzFfwEbudRt0Cn4WmBsWRsrkpQJ
         E7IkCWxX3H8axF9litq5ejcxuFglJ7tKPf7ATgPyJEyTtxicRmrbXhSY+bb3nE6nWDsw
         NJ6S6MhY6slfRqo9rK8LWoSxZJcBIXOZ9w5/cNurDWMnrvXmbQkp7pQOtKlMPG9bGgMR
         3ajDBIFZFrWTTIL/cWVU0ctynYEhoL7TjHBp/KnGR4gOyrqdnB+YulddJ/oSsnZb+pka
         xqq2k0qNQtDsY6yWUPZp65orvLukkzsiLTCaO7sGXD4H0sVKb2Lmk7epZ4/FFONrrKCp
         C3OQ==
X-Gm-Message-State: APuU4Z+pSdkwtxsBj9rw7s98hEDv8W5a9Ls1k3kmSHo8mcRBOYrdrbuN
	iHYM07OQvIgNTuWv3woEg8y624nySynheaFSzD82dSTB8eFh1VWQRd/g
X-Gm-Gg: AYBFou18NfzDGq5KAtCaRC1quBQkTKm2anq+V09RADxjA4dey0tLY7BQ7qMfqdQKfeM
	cDUwG6YiuHXHMSnn9j1q9yMReYLB9Z6lOh9v9RoRSKtou5PsJ+zcVTkiHSN9EwhSJhaqX+it6ZJ
	pxtNttv62buRG51n1nMFBpheHcJBQQuV3I0YgLosvs9/8MLJBKexeK2Qapc95+HZ4/6A0kMzcjn
	Zx+uKrVJaZRdcA/FEDmSX/uTrO+GKuJVDdwFrIqnxour3fPBfia2O7j4eeb9KPH+O1O0DQRJBxH
	7Vn6AYin3hcJFEZyk/inhbmQ0hFWJN+u2aZtUut703q4a/GAZelnLRkmp6zFPyJrh1Pj8Oy55nG
	QSQhSxywHIN18Ar7QJjx1nO2cUZ0xNGfEQsvo9hYepRmHkynhGKl6JQ6vK6RSfk2J1n1fsg2K0i
	w8zBEH+ETITkiEyCL1/VUw6FC1ysS0jN8w1aWolGLJxo8f0ZXVZoEHICX+/LfUHBV3yNhJcwFja
	p/BxKKDG5Hczf8kWxGyfyBoJJ/BbSMPHWGNWF2afhXYaGANxNLj6BQbHdPFKz94zIL4akLQLGM2
	suCeXhIvdUlE/8yXr10Bq320jXM=
X-Received: by 2002:a17:90b:1641:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3b166ce8601mr2382151a91.50.1794309729892;
        Tue, 10 Nov 2026 03:22:09 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1c0csm3413913a91.6.2026.11.10.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:22:09 -0800 (PST)
Date: Tue, 10 Nov 2026 19:21:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Minas Harutyunyan <hminas@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Longbin Li <looong.bin@gmail.com>, 
	Dinh Nguyen <dinguyen@opensource.altera.com>, Paul Zimmerman <paulz@synopsys.com>, Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on
 Huashan PI
Message-ID: <avL-KigWPepz-Z2A@inochi.infowork>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261110070627.217946-5-inochiama@gmail.com>
 <2e878ad2-1a20-4ee7-8460-64e0d9774ff5@kernel.org>
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
In-Reply-To: <2e878ad2-1a20-4ee7-8460-64e0d9774ff5@kernel.org>

On Tue, Nov 10, 2026 at 11:41:37AM +0100, Krzysztof Kozlowski wrote:
> On 10/11/2026 08:06, Inochi Amaoto wrote:
> > As current the DWC2 support role switch on CV18XX SoCs. Enable it
> > on Huashan PI.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
> 
> 
> Best regards,
> Krzysztof


Sorry for this mistake, I will spilt them in the next patch. Thanks.

Regards,
Inochi
