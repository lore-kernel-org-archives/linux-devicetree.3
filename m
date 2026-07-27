Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0030400970
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163307; cv=none; b=Uv6Mm7zFmc34Aw4UYtuB5lr73JURd6hEP+9esBjaH6w8VWm/6b5oXtusbvMgQDPuZvGdrE94fBL0iuUFWE0NTn7ZcqPxQtQ1dPkS7M1u9xaNaj4Oe9NdzzA/PdxauDa5DySA6bsDT/pw4FiS/EM9XZ2GjqeFchINuIY8gO0T/pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163307; c=relaxed/simple;
	bh=t6w1Im2DkuyzdMCE+ASzKdfVWcpCqbCUNEi+RElOGho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGgQ0D0bi1WulkzklfVeOS89s2/drO6s6jweES5WCwbDVyFpXUYmQmgsbA84RN4x07/v1alCiSw0CPJ2HQzoWGRnqM1dfpy+Nad1tZF5vtRy88IMYJqGwoGHo2N66slu1t4FryaaqpakNX3tgAbqhByqf/mD6/h8Isi4BiKcX9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5F2L6/A; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5F2L6/A"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3442876b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163298; x=1785768098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ho62qmc8k6xuRrfZ2CNtaVu4pSIvsJ17TU2OHfivqGo=;
        b=q5F2L6/AJpLZgEfyFsdtxAZMGyzP8on10GYdDW8kFSoMtiwZuKZLeP9pHNBpdMU2Qa
         SCqDQcmfu+CspaUIrdvFzEobHwIuDDuMxy8Y4/9KUQUWSJvw+FnB3T3S7uoe1lvCYcVE
         Eyr508+82v8myGS33jvkxwvDDz3fiB+mtAlZ+iO2nkEIzVoBXN9ysbOtc2IhkqrcHet0
         OfgXQyNTLdLS3W6zDBP86iMavCHwAi5fbQexHnnNdaMi37eN9QX2Bm5HRQ6Bpq/OEwdI
         VfLkR3omfhKhXae+6f/KH/Ec8eRKLT5+7gZe9r7z/I3G7nDV6eCdC4hvkdYu6Oq7++vS
         dJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163298; x=1785768098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ho62qmc8k6xuRrfZ2CNtaVu4pSIvsJ17TU2OHfivqGo=;
        b=NK7rjUfTVIR0JwCSxl7ide3TyD77kcQi6++gvtfSDOGeocaXsg+2Ko0xYfW+NWdgRP
         lNnNcBc5O2T8CGEIbcrO/6YaDGyRaibrURx1c6g5oxPz1beuwB7y3FTC+Mxm2iBVzjo9
         b9K9TFDEMax4VqiWpO5KM0BZri13vQU4AVTTGJPw0agX7mnWzjUvhg0uSV5d66dr6qi6
         Ea6yzRTSl65fqgoNt8MxSd/qxLGodI9fZH+uFiakFfERaWcNCFtTlYzD6NprCpys8kaR
         1egVgq6JPfEaerOkaCnkc6V0HC3fgWI/pDzNFpkSGsSivaJOFAkBmbNSJXvy/BQrPfct
         d4Kw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+lBSbTFbt8SnSqZFukYMmTTEjQDScn3Kumemz8hAZcDntxzBYlavk92EsioWIyWzbhXa0sjIYFPkm@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCJrXECm1PKJ7MBlioY5MjWU0W+PueK2OR8N9ATXCDkl/IIMx
	TuJSUF3p5FDdqTuzYkI6flQGbCDbxj+Z3UYR9lqbIcvkXxfg9WHDX+j7
X-Gm-Gg: AR+sD12+FB05Tr1Cq6iywjTQT6ggfIHuPbq9JTKVrgDehCsxpamLBCuxgd9CqnFH0Al
	Rpdy9mEtRXRd3NoMXorA5LwbsHx6CUz0ZGMDq8VcjllB7sXwVcBImdPp3iEJztQ4fcTzkassrEx
	6nT65SyN6jfZJB6CdSh3Cb0G4ccJ42C//ub+oo2bCK7AyXqTBUNl6Upe68XFgXFa2DLEoBac787
	U+mNB1xw/2c1z3OwSGLuvpzEQt+SPHKNcCYxRHrQ4UQgeotteW8uBMwraA6BLQRHieeSTdUqrl+
	1RLEUDtdi9Kk9I0GP9X7DR8OXa/QPwXYy12c7FFX/ETBkHw4g3BY1DStiraSq95i87Z0/kW41wP
	3mlQsTnMCg4zuv45n0deTMsxB25nparQ2wWX5kKg2QXPmCqiKYOBhcAl1PFzxQroFwkou3P9pDX
	kPH7P6NpXpyP+U/+U=
X-Received: by 2002:a05:6a21:4e01:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3c67240d4c1mr10310593637.15.1785163298516;
        Mon, 27 Jul 2026 07:41:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc288a79sm32928271eec.0.2026.07.27.07.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:41:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:41:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Message-ID: <9151a4d1-a23e-4247-8583-03a1e8976a1c@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:39PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
> target with mandatory PEC. Add a hwmon driver reporting the firmware
> aggregated maximum die temperature as temp1_input, with the firmware
> version and boot status under debugfs.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Applied.

Thanks,
Guenter
