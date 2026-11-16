Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808400;
	b=MoEgClvV2D7nbTYXIZzSBdo8S6ayMNJUG1geaDxANCIhIU8pcdN4SMSwEzNs4Gwb6AWB
	 0HsITAM5u/2T6jG4Bnu6IDROOT1xF8fuDbKzODnJXRifxfKknzQJV0avIIrHLfNp6bliz
	 r7M8citlB8/ktkss+uPoQjzn4ccLdBarjztfeGe+FJWnPQzHZKA4GkfgbrYdx6w7dvfSC
	 0T0QKXqYklrKRGUtecrXJUTjV/xqtR1pWWDqHdYRaXl2MWBK0Dnin2DUSN7Lft7fH219q
	 2hU7nNxbIo2h6SxlAODOyAtPhuFpPNyuE8aiZy9abYnltRZlCOUxs5cqA4BYaTlRDyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808400;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=eOwVzLDlfkSi0YjT0f74v9O8KdDB1ij1EtqULwicacE=;
	b=xqGZ9JDToUApWuL0Nrw3HnZgTlgGWhBODj3bdrZESmyxS07+P3X68VI3jsLehRnyOmYV
	 oA5naViYYfWiIKuH3ce8FhMetNOvFc5LjjIUJwLZlQQktUI+FY7P9lxhX2vEKMs5JIm+n
	 sbF+63ywmgwjxg0ncRI4CjGiIGfH/i7d5k7tVSbS1jrxVAIEMjfHN/7uMHN9XjNUvM0FH
	 ChzexSLma5E9c/CdIkG8F169/UaPO7UuPwLrCCPWDo2ZmCsqqJKf4BlE/Al542//n3gFI
	 hHz3Xh6b46TPB2d0AE69XNFOKqoqwBD17ndnCeTRNoiQnglZif07SjhCM/fUwZsSMIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b="T4XLHh/n";
	arc=none smtp.remote-ip=95.215.58.202
Received: from mta1.migadu.com (out-202.mta1.migadu.com [95.215.58.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2800606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2800606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=T4XLHh/n
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uD+FCsVNWp52CztDUUMpqbHdeuM/UhgnchIo9AuSFIo=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794808397; v=1; x=1795413197;
 b=T4XLHh/nqO0wmBVvTuTGjCvoM8HMbhY1sz3vr8TIfTESnPTn8vu1yYNkXMSjqw3bd6yPx42K
 HwwWXHFScGlgu5WEhPdwpntBglzqvCCKlUdiGrthb1PDJcPpreorX3sTqqjo1mjmf8aCpMUqAUb
 1cgWxa/VktYTP3bNo9yOXjyT9zyCmUUqmWuCb5SsimSTiQmK6nRVPZ8LCQMRegM8Yhz5WL7ZXTo
 1k5iVJFCjUmEReuy4vRsg39mp5qTDslJYjVhOfI7NiR4D2lK7n/rAxfRQvd+iLaYn9PTledpuQ6
 vM+Gi4gwfvQ22tKUT0x1y+zMD66+lgRYmn92dlVL+x+DQ==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dc7e3a2922be0e4a;
	Mon, 16 Nov 2026 05:53:16 +0000
X-Mizu-Trace-ID: dc7e3a2922be0e4a
X-Migadu-Flow: FLOW_OUT
Message-ID: <fc99d887-dabe-4461-906e-c40fed5d1889@packett.cool>
Date: Mon, 16 Nov 2026 02:53:11 -0300
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
 <20261115-qn10-v2-2-19b11603e776@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261115-qn10-v2-2-19b11603e776@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/16/26 12:49 AM, Bjorn Andersson wrote:
> The ASUS Ascent QN10 is a compact desktop computer based on the Qualcomm
> Snapdragon X2 Elite (Glymur) platform, featuring an 18-core Oryon
> CPU, Adreno X2-90 GPU, and Hexagon NPU. The system comes with 16 or 32GB
> of LPDDR5x memory, two M.2 NVMe SSDs slots, Wi-Fi 7, Bluetooth 6.0,
> 2.5Gb Ethernet, three USB Type-C ports, four USB Type-A ports, and HDMI
> output.
>
> The HDMI output is driven by the eDP output through a PS195 HDMI
> converter. The four USB Type-A ports are connected to a GL3590 USB Hub,
> on one of the USB MP ports. The Ethernet controller is attached on PCIe.
>
> Introduce the DeviceTree for this board.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> [..]
> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	hid@3a {
> +		compatible = "hid-over-i2c";
> +		reg = <0x3a>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&kybd_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +};
> [..]

Where's an onboard i2c keyboard physically located on a desktop mini-PC? o.0


~val

