Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351231F9A0
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986444; cv=none; b=rAP8q2m8RBqEWlf12i1VtZWRAKpiGi1rMaQ/9GSjcPK+NMgZP7UX8e1SISOly1yhamZdiMdQramq5l0SM8CqsRbBAx2Qk59PqNIBiz35GrfsbeToYlZcjO3eJ5zNr1g8iq55Vd4IpyfB6lPOXLBEka9K9mK/NEWdR+R4QdSJHsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986444; c=relaxed/simple;
	bh=k522zUuMn9sacMhN42z+H89jqUmO9HqplfLaFSv/g/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3LHCwxbSYj2eHVqsont5BdGuyHyFQAlVz+Ys0b34nHKz4ipdDI1lZG4FdZdQx5HTx1AJQ17RCwhHi7KR31JK6UOTKuqRuH7mzS/5GeyECTFqfYpg5Di9S9o/R+W43dPhkkX6Sn7IIP8urZGV1RWqR0VhZ7aX13tL3iE1qJm1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSVwNXQb; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSVwNXQb"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c15849aa2cso7009546eec.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 06:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986442; x=1778591242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3w3nNiNCoJv2dXKyaye8yTSfZ1rSI+EK1/c2kHTWpRw=;
        b=HSVwNXQbfkG3QrOYRi1kKA3RT3ONCNNCGDODPlQPrcxJ7C1ftdAkLNkhDNqYBLkazF
         iKWmqd6TLjqa8ecqnlNTpcMzKORA6DZOJ5EpJN+ev+whLhtDdM+LE8xdQmD3p/zXPps+
         Za5m9qGbIIvsPejNix0NGJ/XnfTbnXaWhfI4/zfJRIyWWq5IHwEy6oRr97x3i6CjZMZ9
         6vS81HgAQitvlzj0j1Gf2L14AavCX8dB3hlTJBxxuReruBVKs1AdwEZ/dxd4hbPuEzkL
         8RzRwT9+d1nluISsgHFWlORyebzP8VgtDMCvrM8e38kFc4j2ABKsXcYpnnlH3iCuurfF
         v/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986442; x=1778591242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3w3nNiNCoJv2dXKyaye8yTSfZ1rSI+EK1/c2kHTWpRw=;
        b=L3V5/7Q61n83SlG3s8+cWrX+PNVW7/WVGHvJmmm12Xoo2E3WPfESee5PeZqZ1CDeQQ
         ld3sFpoyLcEyT0/yiDjAfA/nxXrY7IvvffIpnS69obTTE0zVlDsjTxYbiDMx8H1rmqbv
         HW02IC9vuiSwPD6d5cebSy9F22t7gkR/k5OzsAORMG/rlYtkm30YbDd203mnCffHUBaA
         GE8XVYwz/7Dy+ZcGdSowUB/0nB4n0gvkKmK4Bm4hj6UIWJuQROhveVaAiHR5x3NtaJE9
         4L8UIG1I3iQTdw0a9yvwDQdAATowtsBU8YpQuFwjRLP80a/jOjZEuZCg7HXqv6W/yf6C
         PC+g==
X-Forwarded-Encrypted: i=1; AFNElJ+uwbZtVE64ERk2m2goz/1VqIRTD0J24KNivzte5TueZe2I828U78q4OCwS1Czfhw5fGnPWBmsrF4gd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+5vPtbHKadVxa5e0sxJLifqkz4VgYTakBbLcJ/rMbEzfZcNBe
	AzdYwyDd4TqBreW8mTFzxhzOa/WgJaLtX4p9wHjatIAkgLSJJwcBJ8Fr
X-Gm-Gg: AeBDietEgSGgd5RWMPo4dipUb7nbbF4uroJDMuMWq2YjLKtPaJpHopLtfXZn2xOpuFd
	zosiLmKNLCckZatUzzglmVay0b0WpUJ+p6g/faYarUagu7Y066LclENyFThbl218OE14ldmk9vG
	AwWfsoXFD4sy4795DzuFSmtl+7L9LlnHwKUr1uMjpa/UeS5a/X6sU/dVLbWxlZlY1u02J9xQ/jO
	H5ruTogZQVAPuZIXGS817ESSWRGFxGHZXl5hznKmYnI/jExZMClmKL1EoKk1lBhbltiq/AzQ1tA
	4ll0XjDeabILT9ssFOATgz36ZG/euYjvVeusZsLj1sMluO4ouPZ3mCMvhE1EoNi1EqDM3ricBp4
	pRb5PoPA0ojfUfu0w/VscxqpC+xav6yOpspOiUv2IEZ1/xXPG3n3frYoDb74mseBY6g0cEnGCA7
	3Zaj/1bTfpkebt0jAmYoBya6pOVqG7VaJof3Ru94T3OMfYaPw=
X-Received: by 2002:a05:7300:b54b:b0:2ee:be86:7b90 with SMTP id 5a478bee46e88-2f40a18f9d4mr1458206eec.29.1777986442074;
        Tue, 05 May 2026 06:07:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889d634sm24278078eec.3.2026.05.05.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:07:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:07:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: watchdog: qcom-wdt: Add compatible for
 Nord watchdog
Message-ID: <e0faf165-123d-4a1a-82dc-23693cf09963@roeck-us.net>
References: <20260504081643.826038-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504081643.826038-1-shengchao.guo@oss.qualcomm.com>

On Mon, May 04, 2026 at 04:16:43PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Krait Processor Sub-system (KPSS) Watchdog timer on Nord SoC.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied to my watchdog-next branch.

Guenter
