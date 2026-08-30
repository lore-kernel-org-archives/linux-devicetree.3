Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7099B175A79
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 00:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048345; cv=none; b=YIkJKy+nsb0+NMhZM8ez7PvHNdeDbggZjO5lDSFEUYxWz/Z/vvIO/jdV0WHsXvdwE5ilHTvYArekkQaw99owzy5fOy/8gzMIO8tUr6qIO1T79U3UryKQWvayF74qJC17uHcHes9m/O5AiXP6XWAO7pgg4n7f88lLZiV5/qs3UiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048345; c=relaxed/simple;
	bh=5OlOabdY8uKB/4x6qhVMXN7GdhUuhBiHg4FZT616wGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFthjUFLm8l7rodT69R+WcxPujv777i6sLFtj3TMVXh2P4MWAS/nRMmIUbI5ut5wJWrKEVmDMpsVoaFEoSJmOjcAxmcgbR7HRxrpNXDpWZcYfQ/VPq/v/KYXkHjY3FzRN21nvZLl1/xxZzUCqqardhi0HBpOU5zImHr4TntpCc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSrIYaNW; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSrIYaNW"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2171687a91.2
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 17:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788048343; x=1788653143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=74+MFDCnnMnX6+RyDjQR2/C37pOAkmvUU1iToovvHzM=;
        b=TSrIYaNW/VNnYUULq7Sd/sWs6huJzd9/OMBiiCFcMgexGH1F+3UjEsLxCRGvcTA+xh
         f1X2Fx8yVJ1Fla6FHw0fijkOCh6rds1TNWGFbhhyPfe+QftPsD/l1HFukgmSk5Ix1paH
         fLQHRBa3+l3w7K7HSDgcGYwDRPkrvKXx/pJMO5DzAOA0ZDi6olGFcp+q2RChPdJXnoOl
         aVRg/G/rowhsakrNMOmmZtaTIlfLzx6L5fynaDSKHPV6V1OdDLIYSeFZotFFBB5gBf5+
         646kQCNNef+vvL1OAEUPWMjZcqsglAdP23CAyuAp/rmLrUAu4xCRKA668qi9eMCIzqzj
         Ou3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048343; x=1788653143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74+MFDCnnMnX6+RyDjQR2/C37pOAkmvUU1iToovvHzM=;
        b=irwlJgG+WJjjc/56TVQH9stl1V9wUuE3r5OpilwDwwTg1emUD2gzrxjTwQzObtK23E
         sBnQyOy8xxghUX2EA0AJmYsTnPbmfWmNNPRPpFgVVqRBHLtPK/ixREen/8Zd/oYmrNIg
         q/eepC2Km5qIt/1L4E74sjgVehtuwcUaE4dUZqju/Qgzk7lKtGXKvsxx0AOQX1zQeydY
         OrAorTxIUs+Y55tPdyDjEyQUrEjT6iBPzkby8U+XBO72eYw5NdendWL/v6fqHGf002rd
         A4deXSZdxE5XzooMXjfNu8aa6WpXbNp/q0Hl7sD50aX2tBVVP1Z08/j441aP63cZ9O6A
         bXVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSZ1H4Jq058abd/Hpsnl2uhPXOgjm55/VFkiwe2Xoy++QhoOzJ6V3GzGIyMbok+etu9G5NQz+m9hCt@vger.kernel.org
X-Gm-Message-State: AFuF++nOGIfQXFld4wfOfjmlr8SbDvOg/44/CF5vUWF+ZLivDfTOcR0N
	8dsbZGSW+D3zAdEIpVaT9UQuaJlQUaCGAhDIo+AZKCCfBmA4rvSKvxba
X-Gm-Gg: AYBFou1YkPLh9jBvbs/CDhGqNjUPAGMqyTPBCTKa57YCFJs+5EGTlLLAgYhCKB4lBYZ
	IPFmftbDb/HuSroBhb5AY38GiXLMvJYDoPSAiqtwrCzmMMC2C/cR+KTnjPhkpRQEzBVwmOhDmGV
	3NXN66pntCqcSxRePo+j1PmUUc6vENEviVSirhWbUCGu7lpLJ1fBj4qK7dAl5duStryOKKyjcap
	cUECKNcQDKUo1KEogYUF1noK9+wdMU27P+FJTJxSf32fXPknTiEUO7kRca13PI1Hskks+3iPzo9
	P3xzL9yZ/I261B7Z//vUTfoaFRdreHBkPdUl+kh8zFA5QO7nQP2EPZcy7ZZlR+5OT7/XaesQIe5
	iJ/Yu/z44oh4LjfceyCuk03Um8vTJONKvAVsyY38BiHtpsiGprEk0ucRlq50Lmz8jDfiXh0Zjfy
	4XFONYPV29BTZZlsQvIS8sb7MSy7OJ3bKITphzbiKeJpzGVosdewm0L3uHwZzBbgCv9G4CD0WJ+
	g==
X-Received: by 2002:a17:90b:574b:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-396d10178d6mr30568280a91.14.1788048342632;
        Sat, 29 Aug 2026 17:05:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda368e6sm8678734a91.4.2026.08.29.17.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:05:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 29 Aug 2026 17:05:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (lm90) Reject channel 2 on chips with only
 one remote sensor
Message-ID: <ea37ba3f-004f-4544-ada7-06e712160cf8@roeck-us.net>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
 <20260826184750.4798-3-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826184750.4798-3-flaviu.nistor@gmail.com>

On Wed, Aug 26, 2026 at 09:47:49PM +0300, Flaviu Nistor wrote:
> Validate firmware channel definitions against chip capabilities and return
> -EINVAL when channel 2 is configured on devices with 1 remote channel.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter
