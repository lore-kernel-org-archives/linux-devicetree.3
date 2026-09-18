Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BAE5111B4
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747631; cv=none; b=FCsexLHk7RDQUrhilsUM5eyLxIky5J1y8BSKbPFm+EN29gJZ3x8CAQVEHMV6Ay+RkxXzaCiDOEYuZxabzsabmTr4uXtx4ZteNvJJnDsZqJlU7TmeuRegf3IaEg37nqCQQXyhml//E/5bw5HAjbOq4oqhYsOG02nDFR4/glU7IBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747631; c=relaxed/simple;
	bh=+fXFt1wmuGm36I/6m2mLaabGRHYph3PCUFE2O+zRlTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxQ/3hU9/O1u5CZpmMGfYUpPOBS3KP9sVod8kWS9j4TjR7VTXtvxLljUCwP/ivDRofLt5efirBsTMrubEfJdpoWDwKhjsVBt9oFfvHVVcPcypKHAjoAbZztKPe/SvRaQ1Go+L6TlBnGBSu2m8WvArE3dL/x9+7iUx4wevXKb+dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMz9yvFz; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMz9yvFz"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso1053117a91.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789747630; x=1790352430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+a91oW+XEpT6uwd1XGhqfpSXASpWO0V95HM9oxBjsHU=;
        b=oMz9yvFzVJohjoZAp+3wAr4UODJZWG7XDCY6QTsLxsQMUPcI6fb5KI6L508ICcRQEY
         wEAOxHpqxQrDEoNX5pYCniZ3pEp8tkQ5kbMBTtlRBFbj4gdGD0K7Punxoq5Og2DlLKBQ
         WhzGR7PP7FOy/OOqTMoUCsklyCtN261Tcchk0rtquY5REReuy6OSQ4g7cnkc0yjH2ton
         hiI5KrRfQxToUfYWlZ68BQVah39K0TFbAi2NdG9ty7scEd1b4yqeQ4Q604hVi5XGqV6F
         n5PFEePLChw1MFUb9CHiVdzPcBVbHLwrIN3CBZiIXE9ORpFbQMSP3XFgxxT8RuNFfhwY
         a80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747630; x=1790352430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+a91oW+XEpT6uwd1XGhqfpSXASpWO0V95HM9oxBjsHU=;
        b=C7VjrVRvF7hlhayGnDRl/RDGiNrXnB+apibDFqwrZnVuWLEjnLF9j4HKADGoJ1WXkR
         Ps4y8/5IRZ3z8JzBC7nqdKTuodlrMH24Dc3lxUfXa6ujlhcLQWk5I3S+XCJ4Lq9p5zmK
         wpLs69hGymtZJgJjFhJMg5YOt+FEqxqSFk0Lt7zSGhNXNvwd639H/+S2weO1NZZArlwe
         BYvpMoBfDMtaE0DlA+u2HTzSD+K2aqYLHnQkEtASkUVN0f3neBSndaXJQc5RRysXf/TG
         /1G4KiqRHUHvjRJZqIwz55Q6YCyHJjpfZjuemtplXJxs14QGhfNQeWOo0t/JWboh2F5p
         fx5g==
X-Forwarded-Encrypted: i=1; AKwUvBwOJnZU09PM5o9+Egfa/Ab1FA/iMc5JPNgxFE14/UlmXZoTI5JKW1/QCsoaJMq0bzDPOiyT52CmtHIw@vger.kernel.org
X-Gm-Message-State: AFuF++kFjYV1/D2Ws7Amdc/LEwOTj/rhu6mdms0rpWt+fRDcybkElwPl
	8otyDnloJMGyM0jMuY4+ZJDnnw6EP6cJAXewhs/ZUiCF+t/W36qDxym0
X-Gm-Gg: AYBFou1Yiu7UGi3kU0tlZb7b0p0xmpFqyJ7PkqRzYDTC76+EG9T13ccFMcUa0GbD+FS
	NvV6RMLYEC2vGBmnnjXRHA7glJbL/gximuZQuuMCJipWZ1jvCzep9S2GOvXnSwoH6xErwanb/R5
	Z06t1Aj7zns7R5kamQj7OxXp1mXz0I0VGk9P1g32XDYUDxWOUEd7xIRmMBh/uKFdyQdzF8hrLkU
	rASYGKr1JTHVNuxcC4wZfX9t07sDSUzUMKdVDp5j0OqvCI5IakFws36dtIFc5DR4n64B+Qpp+63
	qTj3u6yPUquXirWBN8BXJ7tythqrVVHEucOLfpGovbnRsQViJKfjPHXIWHQ7gInULO/hwUVbjv2
	D0VcbNN7LaaJSzRYlX/q9QM2K/prnQk33BFjFXhOOsKqgqgKpJeNhPwKre2RO2c9KeNAYQuxZ2Z
	lDYPyVHHVvKxL7KxPfKM0aXx55f9HxrN2oeUryT9oxlqrdqSh6lAT1H5EJ7jciwlRRP6rsj5OOh
	jYD9O6g3GCd
X-Received: by 2002:a17:90b:28c6:b0:39e:6a82:afd2 with SMTP id 98e67ed59e1d1-39e6a82bbccmr686160a91.36.1789747629623;
        Fri, 18 Sep 2026 09:07:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32da4960sm39043eec.0.2026.09.18.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:07:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 09:07:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: vexpress: point the DT binding reference at
 the schema
Message-ID: <93b9a44c-d595-4ba3-afc6-eb6abf0c17c2@roeck-us.net>
References: <20260917115818.540344-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917115818.540344-1-quchaosheng000406@163.com>

On Thu, Sep 17, 2026 at 07:58:17PM +0800, Quchaosheng wrote:
> Documentation/hwmon/vexpress.rst points at
> Documentation/devicetree/bindings/hwmon/vexpress.txt for the device tree
> binding of the arm,vexpress-volt, -amp, -temp, -power and -energy sensors.
> 
> That file only restates the compatibles and the label property, which the
> arm/vexpress-config.yaml schema describes now. Point the reference there.
> 
> Assisted-by: LLM
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>

Applied.

Thanks,
Guenter
