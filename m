Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19976322B9F
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363466; cv=none; b=k5fMMEPh2AMdh+UwJxI1SUnYqgnoZALYzpB0nRU72MgCXO38pYqalO2XDzAKMjrMW3qXmcwmZ5k+W2tVjT+4HwJ7rXGt8K7tNCXA7SmWzoHF7upHRulHccSrIgtpPqRMelz8fu6BKybJu1qPIUpARote5nx37BFcMvix1PYKgzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363466; c=relaxed/simple;
	bh=RU2RfIsE5wPl5KsOhJRREp+MuYdS5uZPUVCQPRYO/oI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwZi/JAE/mgBeTJkjUn6ygxz8PKN74asIGe9g79TkXq4L94LPiOFDQF5IA/HWFxCHe5bdgBVZvfI+6+da8sSViYSw1oEBTL8V47uN8K/Lf80JyYtH+2BI3fGeN4Asu4Ui2fxn0DwRK5eco2nV2mQiMplN1pemash9Y/jx2jjmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqUNCC6p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqUNCC6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA8BC2BCB9
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363466;
	bh=RU2RfIsE5wPl5KsOhJRREp+MuYdS5uZPUVCQPRYO/oI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=cqUNCC6pEx0EA84DmTUS5wWcDDKCDyotUHQamocWl1fgzFcrW/b8M8OcAq3Y7Pe/v
	 jnwG6z2u9s5Y2230o1DfLmjFUSl3Wb5zQM7RS/OrxQQyxMIQR2cJaLPhQjZrPEAroo
	 DSUlWo01izIkOXW1xjrSsCrnBVjplv6bj0fflUtxCrWSPxSJTMAuNT0GXKwzxs9hu/
	 EVx974wAD33xBxKWWv8UfL0r5t1ycALZQnJEfV3Gu/kmMFcM1U1mFhOuPM8yDKD2Yx
	 jOfM/PKtmbBPQ4SbDRHZ2LYz98mvs76X8NwHusrfWEm6sSLcrZuMn1ET/3XIwZsGes
	 Dh+WvQp8yd+UQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e7d983f91so112875411fa.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:04:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8YuyBTznEQXbnhbiiL8G/nRwRFtuovRr7MQb/8FaxJI49rv8DJZnKT+kJF4pUaI+z80CvNC1at/ZTO@vger.kernel.org
X-Gm-Message-State: AOJu0Yydem/xtgkaz30HTVL6oNLOuQ1QEcTI3wExoI5aW7lwb4E3P5Z+
	GKrsYqnPC7oYuim0eEOPoWynOlIPR0kQ1j+mEYwesIhQzfqpFt33gOiJDdr0DExmlz3Z1XamU5j
	DGI2r0suklI4IMrokE5AzQ1a+McmsePQ3Y+AbOl2alg==
X-Received: by 2002:a05:6512:3b87:b0:5a4:1918:20e with SMTP id
 2adb3069b0e04-5a746611061mr910141e87.30.1777363464618; Tue, 28 Apr 2026
 01:04:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:23 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-13-dcf937775e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-13-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 01:04:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfaTsZFrf4YoceODg3_R0-1jreNBabfsmOcuvJDnho4iQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ju3RPxv-6duyvbXGIr26bogK-Xp8kGODdJYnjXZthAG5bndYhRYJFxrZQ
Message-ID: <CAMRc=MfaTsZFrf4YoceODg3_R0-1jreNBabfsmOcuvJDnho4iQ@mail.gmail.com>
Subject: Re: [PATCH v21 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Song Xue <quic_songxue@quicinc.com>, 
	Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 19:34:53 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
> psci-reboot-mode driver.
>
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via the
>   Firehose protocol.
>
> Support for these modes is firmware dependent.
>
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
