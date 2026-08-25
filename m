Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67A23CA4A0
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 21:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787691975; cv=none; b=nMYiF2HammgJNV3iknoSQgseEyIK3Fn7WhqjPDJ0EKlFG5QrEiJAxZG444UsqundsVxvQXhNQ7JlzouP5AcR4lvBClSIBff23OCzV1MU9yJXc51JGwayafEfb+y6392xtWG6ReR2cgUnJvKKFcdbERYeJYVI0D8Rp8nCeK3QGuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787691975; c=relaxed/simple;
	bh=bUmGqiGJN1LIhHuKEpPHFBWlPa9jmzxDZwZzMhWy5aA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kez2yRIqJTrzmrivjBj6RVWea2OGEh0vbkZPB/AzspSy0yJR2bZ3pzS6I+Jbxu015JFDqcIbpz1RIR4iluAEOs9IZcSJqIDvQQEqrIlgVToNrj8E6SIVJrX8yUQUIOZ9rhOdhrw/V5VV/Xpy4WIKO1+RMIVLAGvvk6Z+H6OyG4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=DSQOrOLD; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="DSQOrOLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1787691967;
 bh=mXPE1zcGo976EzGHDXx5Ar7VnZP3PdhjhoOGWAuejoE=;
 b=DSQOrOLDqyXuBLtYTU76CByocWFEvOaHKDTtS3uZEVSvss4pzHxOoy4vifXyLtuwmIwHYsF30
 HZisROCXVUaGY5aFRaRUSdW3kCYiemkUToey9/CZhOU74kO2rtsDTIQV8xcMUYWneEK0WXopC+O
 0vWGuJKMaFSeXuVDbx+i4F8=
X-Forward-Email-ID: 6a8e03b750593cdd5fd1e5f7
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org>
Date: Tue, 25 Aug 2026 22:05:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 krzysztof.kozlowski@oss.qualcomm.com, peter.griffin@linaro.org,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com>
Content-Language: en-GB
From: Thomas Turner <tturner@lineageos.org>
In-Reply-To: <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sam and Alexey,

On 19/08/2026 20:51, Sam Protsenko wrote:
> Can you please tell us a bit about how you tested this patch, and on
> which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
> sure how exactly GPU can be useful. If you have a use case or a
> testing procedure we can run on the E850-96 board, please share.
> 

Sam, Alexey could you please test GPU on the E850-96 board by following
these instructions:

1) Apply this patch series locally
2) Change status="disabled"; to status="okay";
3) Make sure these configs are enabled:
CONFIG_DRM_SIMPLEDRM=y
CONFIG_DRM_PANFROST=y
4) In terms of regulators we set up a basic mali regulator via our
secondary bootloader [1] and configured with this dts setup [2], NOTE
you may be able to get away with a dummy regulator so try that first.
If not I am sure you can replicate something simple with u-boot PMIC.
5) Boot a GUI, I saw Debian was used for the bring-up, that should work
6) Run the following command:
$ dmesg | grep "panfrost"
7) Compare that to the output at [3]

I hope these instructions make sense, but feel free to send any queries
my way.

Best Regards,
Tom

[1] https://github.com/samsungexynos850/uniLoader/commit/6a2ed2d97aaf1616e581d0979f9e56a046093e15
[2] https://github.com/samsungexynos850/linux/commit/68442271304b7c7a410d85118e85df67bcda108a
[3] https://gist.github.com/DaemonMCR/63fa564483202642d6d66e628b8e6c90
