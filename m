Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD23859DC
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052351; cv=none; b=tTjwgaNTBcO6NiaRhc7tnRLQW7fKay8WxtZ+VUfVFbZlmBnZ0daTodxCRzsAoZEM37zHHFKswnWLvZa+iGIZ01Fx+OUzpt7/GCccRMocBbd02yGx2NzAVF0d1hHf/YQAV+E6ndKLlsRALdaFELJ8FAv5wj+KuuY3Qr0/o0Nklwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052351; c=relaxed/simple;
	bh=zopyG0bfbdSVtQjsyaIOXoR4gkjZ/bi3zMrd8RviDfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyWFvbxjhAK3LFK7rxs9jO1WwiYwte1TwUZVnJrOIQRnYGsHWGjfbXSO66nZvtwRdRkp04+Ui59QhAxbE0AryJ6aslK+BY7yh8mTO2sjIZSYdHgyyHTCUxAg/TlMzpbgjGRlBCZ2zEfcTmAfs+CXzO2aIzlV8Qgo0U3TJUoja+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=qia3QxaU; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="qia3QxaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1775052347;
 bh=OuuOxL55HdAFY06SfOG3LOC3qubiad/RGrqlyB0hkLI=;
 b=qia3QxaUkg9jKvavExJn84z6f3aQSWTS1lbww/pEP/fYpNANvM93PArhw805Aao0mx74TnY6l
 gC4pan/STTIASgPjCdCDcYAG5FkfEwJfJ3JLNp/Y/7KGYVuoe05Z2my3ejTht9QotuzG/GdFqa2
 fCHxnXNZbi157jLJjMozg4UUPWmSp6tM4Vvn7VOmetfBsHTzhA2+Fgt6AT+MJ57tZXZQ1iuF433
 lZBcg3A80Vkv8pBkL+9FaIQ07LgJjctlZOtlHcx6m2f4T1lPbWC0YKqJGTAzdz2FYsjA7oyTj+V
 bUwshXSuUkkd8QovCKAh9vEbMMgwXxHYpsFCGO/8ybMQ==
X-Forward-Email-ID: 69cd2639c44eae2b77aac006
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.6.64
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d7e235c0-425e-4da6-a51e-5efdcac5a5f0@kwiboo.se>
Date: Wed, 1 Apr 2026 16:05:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
To: "dennis@ausil.us" <dennis@ausil.us>
Cc: FUKAUMI Naoki <naoki@radxa.com>, Hsun Lai <i@chainsx.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, John Clark <inindev@gmail.com>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>,
 Chukun Pan <amadeus@jmu.edu.cn>, Alexey Charkov <alchark@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Mykola Kvach <xakep.amatop@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20260401010707.2584962-1-dennis@ausil.us>
 <20260401010707.2584962-3-dennis@ausil.us>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260401010707.2584962-3-dennis@ausil.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dennis,

On 4/1/2026 3:07 AM, dennis@ausil.us wrote:
> From: Dennis Gilmore <dennis@ausil.us>
> 
> The Orange Pi 5 Pro uses the same SoC and base as the Orange Pi 5 and
> Orange Pi 5B but has had sound, USB, and leds wired up differently. The
> boards also use gmac for ethernet where thre Pro has a PCIe attached NIC
> 
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  | 184 ++++++++++++++++
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 202 ++----------------
>  .../boot/dts/rockchip/rk3588s-orangepi-5b.dts | 181 ++++++++++++++++
>  3 files changed, 378 insertions(+), 189 deletions(-)

This patch seem to reintroduce a lot of duplication for the 5 and 5b
.dts-files. Please reduce the added duplication caused by this patch.

Maybe it is better to create a rk3588s-orangepi-5-base.dtsi or similar
where everything that is shared for all three boards is moved. Or the 5
an 5b specific parts are moved into a rk3588s-orangepi-5-5b.dtsi or
similar. Then the change in 5 and 5b board .dts-files are kept to a
minimum.

Regards,
Jonas
