Received: from mail-pz2-f16.google.com (mail-pz2-f16.google.com [74.125.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015AE34DB41
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344831; cv=none; b=ncBDqP2wHH6skk8cRJay3Qo+U7Vcvv1rU5yPfBPygIr/GZ2WiplVqVJE8pi7IYuzocLZ/x3KIcymDIvnvXSXBcsWa8zajv1UuGZ/4STNvTjv/7V+mSQ5Zz5KvUdcs8lx4zeeJJepIa2HDZGCxNE/TpQWes/GD/OpF2bfqJNOu7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344831; c=relaxed/simple;
	bh=2H8He1fIaWEIMN/Us026LinmPPPSEuu9arhpUonNLWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2Xdu5OebifGfms1pCiYQL+TYCViXVVRZIH1bHDOsMVB/bvkjjYMkqeTAT+nCgQhdjkAnK9oOImiirvj76bxoa9Ih2OF1tlT27EnYkQwtsCGdE9w4t06ZOraCottIhRaAKpLMT/ogj6dmW6RUrPLulSSvhVJ2Hm58bJ0PKxBy4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsHGSbSE; arc=none smtp.client-ip=74.125.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsHGSbSE"
Received: by mail-pz2-f16.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so315514a12.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344829; x=1790949629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UIT8Wz/kXm8JbJjsdHOy8KnROa55AifnObjuh2CsK/E=;
        b=OsHGSbSE/Dou2eSCRNoobq56lEr11LbsgaP9FoCGLna+XbV2fW4izGkhG3xCZTLgq+
         2zSnPq3TFs30vLyvpLxCSRWRYXYzr94TKF0c/7tW30Q304wiQixBI8jVx6qTUw1YBIYK
         +HVVqeDYcagxtgYkCvhn/rQnt9+PQ1hYj5iBu+O2woZq9pVqDrnaU+TaRqzya4/FKAZB
         F4kBIQp3/ucRWYotdfy4xfvcgnb2DZ0Jj8EYIiVEm6YrxNus1YAfNoOb/O6gK0sqxRJd
         YUVGIsHJ/I34Ldc4Ssr5/YKh+1Ew28UCz+zZ2pEKbqKYg4lrmTl+VdeSJ0h5GK+oH/Tr
         kAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344829; x=1790949629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIT8Wz/kXm8JbJjsdHOy8KnROa55AifnObjuh2CsK/E=;
        b=G5ws8C0YLOmYCmU8erdb4IyAqNVvbcP0eFMnTS0lRBRqGzJa6D1gqjphxjpZl7u+CS
         /Di2vPkFsQfpUXKjegOZvRr01FwOSOFJRkuTntKktVZUCLwOGa9WO/Svo3WbXcE6rEm6
         27reZhrwxm2NonH11eRJfMh2p67LZyu0pDtmzBVx+KhEGzhTUCl+LG9ezGPeG53NDqzK
         rQv74l0N1JqQV5xwSYx+k3nawHnJd93kcCylYEGAZH0+rehLS79q7ewgnO5oMEj/PZtD
         BX6uhgka/7VT97Gdup7ud9XbS9B/H/UmkeLYcO/2/szVcUOqf7nX/LARWTq74Zcddefi
         P1zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW9c0ARZpSTb7QwtBvOyx24tAvCHQnMJZgeW6F4tp/Od6gsSgNCYz8xxHZwiSgD33EVCi5qoZyUWKB@vger.kernel.org
X-Gm-Message-State: AFuF++m5hT8NMeIAUmPIm+vvomFh98RUzmVYViJo17cjy3eXhoeKih4p
	LZYMmU3QQcoMbjUEBQbpbWoybY9nol/ZnvdZUhvdQzBoV+RTw6fVgIpJ
X-Gm-Gg: AYBFou2ebsODCiyRcZbvZuY+I1U/GUfhp60NCqye9mPStN22WaO8Cv8Qpps9D3lU2yp
	I8yhaBnnieDICbWRHFVamLf5XcPBLc2xN60hUqLEsBjuMpC8UrttM1oMBmCHi/QybdVSy1w0kkg
	DkkxMNK0A7QXtX6jRYxwSPgCCB8ZmYY/Po2D9e+MokdxO3e1DJly8uB5Wps1VydOKa7avWNw3f2
	fy1ACWU0cHxHOYE5uYQr6nsAvpVT3I6UpyHTxPFpnvKKHSDNw4tDxMGQfNuWe5vTPiPlb+KPS0f
	musA7GRzIFAlw8m/D93wdMVh8j4NOX6xXjbdlvbq9FE2lmaOGX+pCrk2UDErGo+slACBsh/Wx8v
	zTY++xGj1/exR6kJBY9osOAeb4GvTPGsmxCvJQMEaQNn73y33fs3NOYzycf5Hvv6d6r23X/mJNE
	YOaduvwd9lsdo9Q932Kr7IOZEMslkMAq46FaSstz9Ns5cO9VCIb6vNdHH3QTWnIJsQV3YxeFU/U
	dVB6Q3M9ptxOZ4jg+u59CU=
X-Received: by 2002:a05:6a21:6e86:b0:3d1:39e9:b269 with SMTP id adf61e73a8af0-3de0e713a13mr5286119637.4.1790344828912;
        Fri, 25 Sep 2026 07:00:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb57e56csm1193045b3a.48.2026.09.25.07.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:00:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 07:00:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ashish yadav <ashishyadav78@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 0/2] Add support for Infineon Digital Multi-phase
Message-ID: <6d6d168d-acad-4ba0-b0e4-214dd07822d3@roeck-us.net>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <CAJKbuCZ1733m5UKXNwOV-3WBYNOFbgUA7QUfhAY51yskv6z-Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKbuCZ1733m5UKXNwOV-3WBYNOFbgUA7QUfhAY51yskv6z-Aw@mail.gmail.com>

On Fri, Sep 25, 2026 at 12:01:28PM +0530, ashish yadav wrote:
> Hi Guenter,
> 
> I hope you are doing well.
> When you have a moment, could you please look into the patch to add
> support for the XDPE1A2G7C voltage regulator?
> I would highly appreciate your review, feedback, or any guidance on
> next steps when your schedule allows.
> Thank you very much for your time and continued support.
> 

Please do not top post. Also, I was waiting for DT patch approval.
Besides that, I do have a paid day job, unlike this one that isn't paid.
If you had bothered, you could have checked the status of this series at
https://patchwork.kernel.org/project/linux-hwmon/list/. This e-mail is just
noise adding more to my work load without any benefit for anyone, including
you.

Guenter
