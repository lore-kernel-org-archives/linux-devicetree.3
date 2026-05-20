Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5B537B012
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316015; cv=none; b=cWLA5+Gwf17oIc7XyQxvo9SiMOPFa7CYf1A2tqJUWEoqVAeVTnd8x0u0mNc7rciGMSjin8/PLDI54eUv0h2v+IbBRj7+jQ3AzX8r7KRZkNpVrBPEBCg9SzHlKAstWrSrP+7iPM5H7Jk/oGBfDhHPHmKeo2gW5obyUh9tm8MM7sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316015; c=relaxed/simple;
	bh=cy+Adq9eGUkKCtEDYTRhdOcKj5ym02Xspdpj1pEVglQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EF+ms4vKOQnsEyqzJXQoadNxCtGGhbuWnrgJWrWSp51Jni/RC1ufFJBAQkteNDyvOLl+8E59bi2HsFkeD+kd5+bDdJ20xDB1c1J6TboKYGK5g1lQ32nOj2YHLG1lx5Gjm1tGd2WVjdWIq8TetQVEVqaxmEGAj41g0YSOzkIBCF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jAg3j/Fm; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jAg3j/Fm"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3025d725a05so13707490eec.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779316013; x=1779920813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XBKzFLJqNcvKI9IGFU+zHGxm6jLvnApDykMdfiJ4Nmc=;
        b=jAg3j/FmVAk45onQ8QgNTyffC4tfm0ixpvh6XvtxupmU47LdaBkZVbQNpjA4CVI7CJ
         eGwGD2z2lKHh4hql6v+1mZiRhVMutW8CNCydmLv4iD9hYX9vx+Nd0fvd5c/k4gWC2hMv
         O19BrWCwG6ODegMaJdDMnHJV2yTCaU6asV1cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779316013; x=1779920813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBKzFLJqNcvKI9IGFU+zHGxm6jLvnApDykMdfiJ4Nmc=;
        b=AGN++qnMu6ozfsS6R2G+tZ/NWLoEJtqKiwdxMjq5tPRHIZ+FP1WZh6V834KBBLEa39
         mntWdwa8r6G/Tf4Tg/JzcVLK5Z/OYw4+w8AEWymn0NzS2papVxrpOfUJgX4KmZGW9+Nd
         aA15StLkMSbtuYIMmleH8N0vnko66SqsQmZCT7u8V5nOjtb5JPSIg8GddtOjcv39guYf
         VaUNxHYrLDaRQ3e1mvWs+O1u9vUqDIQT5eWTywp0mTkhxlTWINcib7QTGgQDAbRdE9Ar
         otRKMj0cZFk14yEtM5YFMgnXNHuAKGE8+tkyAlX0MckJgFKEaav2rOK2U9xhF5VyoVFe
         ujag==
X-Forwarded-Encrypted: i=1; AFNElJ8jI70h7odbb6fuXXcDA9i8eUEgU4t6LxU5n5I1IMWVlH8vroxBChqNsi3RZJzjg534HB3s2sHkLI7b@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ36L7IcmDgc8r/HV/5w+jKEdfIw/z/XadP50wCHRHEIzajjr+
	nQjf8ifQzDuq4+dC+EYj2zfzO92k+qZRGzgkxE4M4QTHGO86b8iELrsw0zmUmJmrJQ==
X-Gm-Gg: Acq92OFO2uJTn/COnEpA42tixUuPwFCJZ9etZiOG6uAPj8OTyuhlXE/yMWCmLDEQV2C
	azS2ovtrxZedyv8dkpM+NNJQ2ubpUv7FkKW+VP6PadgSnO2lqvJdXPomkn+KHuFUEO9cnHZTz+8
	9ZWmnMXVOVLBrnALzZj67GhLIxJrmVa11m2YaLeKdDCWS1hr7l6hinI6/071sx5EZuG6qsnIKXG
	+fDBQXrLJoDkEJGv5EzavUGzoF92M4x8nYhdCkHoRNnWsgB/rKeuHWPcAxZatFeHPxS6PYuYKwr
	Cp0INPNxb+Oxzvo0L6PbvOmCTrFwuGu6w2nbtYibwI+T44UDDBAxn8d3N6AzJLpbJS8/cvu0nsa
	dAmBAH6FuvXYO3ABb8q3/+fFrTf2Sru9Pe7QAoFT8jZF2BogVcuslwlVeX+P/KCbvuVLf+CTOWG
	nkZkssvFIjUIjadN5lEOF7+5uEvc4Gvl7tEENhTH522m5NMjk1M1fGdDYjeB80cw==
X-Received: by 2002:a05:7300:2156:b0:2f5:5dd3:1fcf with SMTP id 5a478bee46e88-3042f477009mr321500eec.10.1779316012933;
        Wed, 20 May 2026 15:26:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:3e8a:9a7f:5887:90fd])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-30294500a97sm22879655eec.9.2026.05.20.15.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 15:26:52 -0700 (PDT)
Date: Wed, 20 May 2026 15:26:49 -0700
From: Brian Norris <briannorris@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yingying Tang <yingying.tang@oss.qualcomm.com>
Subject: Re: [PATCH v2] checkpatch: Don't emit warnings for ID-base USB & PCI
 DT compatibles
Message-ID: <ag41KWtNpU1ZZs6m@google.com>
References: <20260520084428.257066-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520084428.257066-1-wenst@chromium.org>

Hi Chen-Yu,

On Wed, May 20, 2026 at 04:44:27PM +0800, Chen-Yu Tsai wrote:
> The USB and PCI device bindings define some compatible patterns based
> on device IDs that use the comma to separate vendor and product IDs.
> 
> These prefix patterns include:
> 
>   - ^usb(if)?[0-9a-f]{1,4},
>   - ^pci[0-9a-f]{2,4},
>   - ^pciclass,
> 
> These are not real vendor prefixes. Don't emit warnings for them.
> Instead just skip over the DT compatible check altogether, and leave
> the real check to the DT validator. This avoids false positive warnings
> about undocumented DT vendor prefixes and compatibles.
> 
> Note that the script mostly only checks the first compatible string of
> each node, as it processes the source file line-by-line, and the check
> only matches on the line with 'compatible = "..."'. Otherwise there
> would be more warnings from arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> since that file also includes compatibles like "pciclass0c0310" and
> "pciclass0c03" which are not accepted either.

Looking at IEEE Std 1275-1994 (PCI Bus Binding), you're right, that's
incorrect.

> "pci0014,7a24.0" is not
> valid either,

It's possible that's trying to follow the "pciVVVV,DDDD.RR" format
mentioned in the spec, although it's not clear if it should require 2
digits after the dot/period. Notably, the dt-schema does *not* include
the "dot" option at all, so maybe there's room for improvement.

Anyway, that just adds to why this is a good choice:

> but this patch leaves the real check to the DT validator.

> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Moved check earlier and match against full compatible string to avoid
>   false positives for undocumented compatibles as well
> - Added comma to patterns as they are now matched against the full
>   compatible string
> - Fixed patterns in commit message to just cover the prefix portion
> 
> This is a simplified version of what Brian Norris previously posted [1],
> but more comprehensive and more perl-y than what Yingying Tang posted
> [2], which only covered the second pattern.
> 
> This is based on next-20260519.
> 
> Also, odd observation: the other regex patterns in this script escape
> the comma ',', but AFAIK this is not needed.
> 
> [1] https://lore.kernel.org/all/20190223022440.146915-1-briannorris@chromium.org/
> [2] https://lore.kernel.org/all/20251210073812.1380803-1-yingying.tang@oss.qualcomm.com/
> ---
>  scripts/checkpatch.pl | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Brian Norris <briannorris@chromium.org>
Tested-by: Brian Norris <briannorris@chromium.org>

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 0d18771f1b01..d4ee9d88ad07 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3783,6 +3783,12 @@ sub process {
>  			my $vp_file = $dt_path . "vendor-prefixes.yaml";
>  
>  			foreach my $compat (@compats) {
> +				# Skip ID-based PCI and USB compatible patterns.
> +				# DT validation will check them properly.
> +				next if $compat =~ /^pciclass,/;
> +				next if $compat =~ /^pci[a-f0-9]{2,4},/;
> +				next if $compat =~ /^usb(if)?[a-f0-9]{1,4},/;
> +
>  				my $compat2 = $compat;
>  				$compat2 =~ s/\,[a-zA-Z0-9]*\-/\,<\.\*>\-/;
>  				my $compat3 = $compat;
> -- 
> 2.54.0.631.ge1b05301d1-goog
> 
