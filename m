Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7B320CAD
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363426; cv=none; b=jYXp8zdz5zY+Yh5jwVZCOJDkhkHCuI609r18Ja57nt/0KBUtzLFTYaKjqfesqF0QXssRKfZFCsynmJYJSr3NhswwunMayYFNKuVqmlFa8jtA+ugNghP1lB1lSlmGIq6jqmHppiJ4qFajWgelTQDM4KTXX3hS0uRKhOmcUr8OuFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363426; c=relaxed/simple;
	bh=nVhY0saX0hIlsPhBZOfgsMBCUpdbk4+El+viqARp73s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtf+7ryLNZ1a1sebhbkaoVyfSDJ8NciT8rQAO8ZszwdeKhXGQh2SqbbPEP0NVT4fkDiNejorc24dXDFh46k3WNI0NFtjEVJ6oH2o1IvzxKUg+PLj5kZLGEbgSc+1PsCTxLk4du9CySDOK5oniTVENVWkxORL9qt8eONLyRkAHNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNsj5G6y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNsj5G6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9657C2BCFF
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363426;
	bh=nVhY0saX0hIlsPhBZOfgsMBCUpdbk4+El+viqARp73s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=TNsj5G6yZNY+l0aXqUiQ4SpAcgeMKg7eakKdZd9BNO8FOWFT5SBnVRpH45GIlyFQI
	 sfu0PJqgZeterYZM/6QPpY5oDbOUsAZhyJvRr6fzhUaGPRr4Ym82QOPD2bqjsPIz/G
	 K0ct9hqiAhWCG8jZr18L4W8i7q1UOF4WfRdJANgZC82x3HMb5l5oyW5PG3hEnSZJWa
	 wGp68Ahrh8SUjDPzYpvXIioXUha6ciDq4gStvwlZzR1UKgU5lZSQsVUjQCnzHJRXMq
	 V/DAQs0ayEjtZyR4i4espP3KgoPS0nHgknrqnTK+G/WsGwHtEjh1OHTjfNX79N3cdI
	 oR1Yxn4pif/mg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a62a049c1fso8430835e87.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:03:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8/jgSvdpWIh+Td+tCcJ0o04osw3aJoOP7W2r9nc7hBE5NWthN1y175VRZfkALe7Ds7FAxNZ28woDTm@vger.kernel.org
X-Gm-Message-State: AOJu0YwjVPmqTznnecJ/BIG6gco2C8VvYS3GVwWuNtSsFC6urTVDPNrB
	fm0Hivu0jf67W/LNf1LETWcmETI7L3PIYTKIPrD+k8WlNWq+Po9wjXjVKM6DyUjZPcTgIumntrg
	9Q8xCKcXxk7CqmMNnOpQyuMA5UNiKz1LYji4rPDPXQw==
X-Received: by 2002:a05:6512:1194:b0:5a1:4158:ea9b with SMTP id
 2adb3069b0e04-5a7466182b4mr698217e87.22.1777363425259; Tue, 28 Apr 2026
 01:03:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:03:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:03:43 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-10-dcf937775e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-10-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 01:03:43 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdC0dFadu-gyHLa2zM6fKWhBeXYpKxhcz0n+TwaEQ9XBw@mail.gmail.com>
X-Gm-Features: AVHnY4L0_XpeAfopxwETVjDoOWklya0cgmAaZoipsKTFpenV3YwDa9FcdgYB49Q
Message-ID: <CAMRc=MdC0dFadu-gyHLa2zM6fKWhBeXYpKxhcz0n+TwaEQ9XBw@mail.gmail.com>
Subject: Re: [PATCH v21 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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

On Mon, 27 Apr 2026 19:34:50 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
> for use by the psci-reboot-mode driver.
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
>
> Support for these modes is firmware dependent and not available across
> all kodiak based boards.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
