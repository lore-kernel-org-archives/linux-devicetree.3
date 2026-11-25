Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622153;
	b=ZVSepyqfY8M3snuVe1ohbslcisPMxMUPARXbStfDDEuGFUldrdcwUAYNWmiOjd/Ng5XL
	 D0VU3tv7Q8RfBkyOPRirFhZ3W7rdoVARI76xmGHYACni6Q7zM0SYA4eGKAfVuf1HRXfXE
	 tgyX0rJf0h2/eKOdg2TXU5JK4dxQTi2i/Ow0vu6BP/tzrUg6dLlmN0ZqcI7ne0OshTfpm
	 A+7ngErjPKPE14fB8imaQsIupJd6qulNTIcSeYazwBVSez0zbZNv2sm6Al+tRdmMy/M8l
	 WqzD0qLVspl8T6RS+I6u5DFMIn8iTKgFnAkqA6/7ZCiLq59r3VQg+yr9dy0kJDQ6KGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622153;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2TWoWAsm1Apa3orL/Yt0L4YfqkBPFNcm/0g6RUQ3LYQ=;
	b=1cfjDYABp88w/pbSwUGv8MAaEErNizavX1BYFgunL6dWQ4evC+wCmqrSlH9d+AYZfjsf
	 NvDxiAXKo5KtJI3W1Wo7dN84szGYu0bcd9uiHIsDarcQRaRNsXcAEVNnjTUe1+eUruJiE
	 DMPlxJXat+vrvYCW3+tXut48wE8HeFqvvnzIVOfmoUHZj/oyHNLMjVYhY4Ypv+mJVDpjw
	 XnOczg5hG2d5XaIuCT3a7yhTknBjMA8BfJWqqZM2+Y5Ao12zjA5YfiAuGZuF2kFxY97p3
	 /8rdqEZUtwTBYGwvWVLePsCozLecBgzSrWXleI8d0UDLADakaLKqWD15JSSLf6t/V9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=gU46oP6B;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE0606A33F
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CE0606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=gU46oP6B
DKIM-Signature: a=rsa-sha256; b=gU46oP6B9c4ypb6Im7yWc5TxHA9zpsJAykGWLcCYUKNxyioQJFo72y4uY+uWPDrzoGz2sZ2sSqIox7MDXPhmIblfpqZHbyJcF56flo9yb4N7w2lZJd4mMnKzRWlss556gu77NU16hJ8AjeQcTH4cVEUm7Ei7jVUhWQiX38He76YCq7QNcDTbtxoYhCI5nh1xjXVzJ43fgF+6/dg2wn12ln5JKFCLwTgtBb1RvZYWEg+FzHNOLP2NPtPXkLi0Xr0c+Q4NKqTWtglz59bxbndl/VkJ9ZbLBZVFT72tk509S8omYPM5HalNXtpZ2B4eOtGvCJU4RjM2SZZ1aWYQO+BIjQ==; s=purelymail2; d=purelymail.com; v=1; bh=TnfnPC1swyrjuv/n2UWWnJpupbzh/7OS04oP4lB/JOM=; h=Feedback-ID:Received:Message-ID:Date:Subject:To:From;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -532728891;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 25 Nov 2026 15:54:27 +0000 (UTC)
Message-ID: <f7a64060-9e98-422a-ae2a-1eeebf8469e0@mentallysanemainliners.org>
Date: Wed, 25 Nov 2026 15:54:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add USB support for Exynos7885 and enable USB and
 FG on gta3xllte
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Henri Ommer <henri@ommer.net>,
 David Virag <virag.david003@gmail.com>
References: <20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org>
Content-Language: en-US
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
In-Reply-To: <20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 17:14, Umer Uddin via B4 Relay wrote:
> Hi guys, this patch series enables USB and FG on gta3xllte. All is tested.
>
> DT changes were tested with make dtbs_check W=1, and the dt styling check
> scripts with --mode strict flags, both of which returned no warnings.
>
> Please note this patch now depends on David Virag's changes for USB[1].
>
> Best regards,
> Umer
>
> [1] https://lore.kernel.org/linux-samsung-soc/20261123092244.1792040-1-virag.david003@gmail.com/T/#t
>
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
> Changes in v2:
> - Drop patches that are being picked up updated and corrected by David
> - Link to v1: https://patch.msgid.link/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org
>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Peter Griffin <peter.griffin@linaro.org>
> To: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Umer Uddin (2):
>        arm64: dts: exynos: exynos7885-gta3xllte: Enable USB support
>        arm64: dts: exynos: exynos7885-gta3xllte: Enable FuelGauge support
>
>   .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 50 ++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> ---
> base-commit: 9b369f9debe1253032abb90a9469fe44146835d1
> change-id: 20261119-gta3xllte-usb-battery-b95e4d89ae85
>
> Best regards,
> --
> Umer Uddin <umer.uddin@mentallysanemainliners.org>

Hi, dependency has changed, it has now changed to David's V3[1], since 
this patch

still will apply fine on top of his V3, I am unsure if I need to resend it.


[1] 
https://lore.kernel.org/linux-samsung-soc/20261125145458.2594179-1-virag.david003@gmail.com/T/#t

