Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974071;
	b=eYgY68D1FnA+C/v9Rh7EPXpK1XFj6YZHUt7nTXt/oRER71WbLkTP1EznqVIkkP9Zgd9u
	 4n9lC49eczRRuE7E5vjSz54kGrncoeP6TV8tZCIKrlZ4KVrZCJkdQ0Ab4aliKVyJOmNj8
	 p97a0F78JBh2Zo/zgBOjXqLSPzrUJZekHxDB8WJm73Q0YORO9C/oXp3vbo/+IQJsXH1QF
	 cKTcPuFdl81RAP7hRGM7dbbMCrNLlO+WPemN+2Al49WDuVefWiS8bKAmS5H16ZLo940cg
	 WEHc1jqVFpesaSzYVvCdbEYTWTe4qoozosCprF7KINi2s/qPt0NjpFcfuceD7xpFU1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E5UQIZrsUjY0M8HBvkzofYrI4Utc73LHtISdy+Zvk0s=;
	b=z9nCC2Z5qerem5KzO3y8LutP+bN4ofiWpxyUMcj37vT+LVx4Fc2Gx3fFyDIQiuwdUEw6
	 yhvlcnMK1pzWcTkc8juXy3LPkknfwrLm6Vd6SUceOjLemhyb+dNZrIClYwdA8WXZpIUg+
	 11mXG2lV87ZvaHWmFRIn0J67WjKEy4octeFF/CSmc1ypmXFgIuZ8YpaqHXb53ponGSZxW
	 2SEldhROiCDcZ87XvcPGZK3WSaYv251l65H/0RD542++BVbtn9upa+cmi0ou0zlUGE50L
	 x23tWweXN7+Q9o009mtYKAqIlNkfOWCAaDKtgRgdwTmS0Jv1x7bC7A3U2VIMGVdcbJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lewLJdSS;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54686606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54686606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lewLJdSS
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1797171a91.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974071; x=1793578871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E5UQIZrsUjY0M8HBvkzofYrI4Utc73LHtISdy+Zvk0s=;
        b=lewLJdSSPjEPcv2HMEZBJkaENtQqv6hgCWl9ZeCBJhkMQbdq3AEyopJrdBPgiVhkMI
         iSS9VI99Pp5a9R8/9v+yHAwrDFxVhH1eDv51PboYzZT5D0JliUYuXWXdKqAqBlqE/IxJ
         6LPbDn5UbmPgQdPUzDwfgEl+q+FewgzwjypRp9zmJzzWW+i2+b4TamOKPWIXpqTQDZwH
         pO8bAS8ru47TViuC3fY2qZVTwTqyHtdzJFuiiN7oJUcdY1lUMVDJU9pNG9el+aqrbw1x
         7LBenTPDiHwnDZ1KbDUNAu/hzPPP2v146U7huSrULqS0OPt0aV5BwF0Vr9aVoVRHbT9n
         jpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974071; x=1793578871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5UQIZrsUjY0M8HBvkzofYrI4Utc73LHtISdy+Zvk0s=;
        b=Eu8AQnECVZq3GexsJ4xw2BNVGetP1p6J9wF6DLBTWKA/TRZlmLq4KUf55cAgczUWC6
         4VoZYeAQw4EXGtX/xiE7thH2DpGRku98NB060DePxtY/n+QKnsI+SXBtrJUOCC9TKRtU
         s7eaebrqfhJmxlumDlKGHS9+eXQUql8DMBujWBcn+bqVPHC7AlDwReBAwGj/rlmU5T9D
         OcZuVkLiA/oZ1S9y0H8YTrr1tuNfXmLAwffjJF48U5KBlWzxpe+F1k15cacB3eVY2nA2
         zESZ50tuTtgh14WBwcJUqJiF798R6k0YxYlX03VyAI+ljStnAvJxGy2tJhFeIB1at2eP
         9RnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw79zzB/AXYU0tUzLEm4jmejm60qDoQ5ILejBKFIKvgJ9ZaS65r3g/etb2b8xUNamcemywwZAnYyePH@vger.kernel.org
X-Gm-Message-State: AFq9FYIBlvFJymt4B8b2qwkX+sAg+NQtQ3DJHPdA9Epby1QwuRqvnIZ3
	LNTig8wsjhxTi9c8v6g/XZart0lLPfrffSUTS4VRs7R16QQVPhpuOWtU
X-Gm-Gg: AYBFou2WxW/0dDvAijQ1iIUmP0wMZtDpNhI3vtubz8lhaHnHsCNM0qRfHDCbb3XsKIt
	4ei0o+mYPVr5zb/biJ3HkqN4oa0kuyOW/997SAvvVI/hyKh1koH+bmkSCe4i0OJEv99rnXx+IjT
	MA2c/gJiS5PvMBUJQlzOUjb8DwdppE6aXtA5HAip5YLmovnndmL+gOekUCT5UyvJQmLF6ruHRxB
	JxC7x8VHU+2mROUmnGnADsduyBZ6mF46ZmZdjbqIa8MauOmoKm8nxMnRl37P7q93qT+/TiAU6p3
	Bs0y0cbPFQOaUMOHMHHWdRvdeYjUuvQHB8t5h/AcskfS884Np0VRGyS2f94uNLDT4u/NahXSv75
	XrzbHhSfwA8LZeCymMnP9u8Nxol/4X5PEwqX7XFOG0e0tmSh6hVjAqngRLHF3bc6985lSE67aSy
	4s6eC53AeouYp/uC9axl+Zwk93+qV0F0M3JHm5JAmyK6DGX3y/GzRPq4Zx3gfobKSxWuLASInzE
	OddtrlD+SR+3OTKWLE/nrSEdANOPAhvcT63NJomhpg92KWrgXpX7bjiMxOLSIkKVtEhamk=
X-Received: by 2002:a17:90b:3bc7:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3adead5841amr4344724a91.18.1792974070632;
        Sun, 25 Oct 2026 17:21:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacc885sm6073592a91.5.2026.10.25.17.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:21:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:21:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: hsyemail2@gmail.com
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: lm75: Add Nuvoton NCT7715
Message-ID: <c7532675-6cec-4613-a3a7-4cda31bf16df@roeck-us.net>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
 <20260918084042.19541-2-syhuang3@nuvoton.com>
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
In-Reply-To: <20260918084042.19541-2-syhuang3@nuvoton.com>

On Fri, Sep 18, 2026 at 04:40:40PM +0800, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> Add the Nuvoton NCT7715 compatible to the LM75 hwmon binding.
> 
> The NCT7715 supports an ALERT output, so permit the optional
> interrupts property for this compatible.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
