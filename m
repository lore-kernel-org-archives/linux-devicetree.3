Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608191;
	b=LfhBXdYHygcapbbpKxmQodMOTe+OAF0wbTkBiUcL3mrVQw0ljCChGgT7DKmu7+MmVqmD
	 rO7hrwqazGDCBbbybmAzkOrF2F4V8s1x7eRlXNfWkdBdFO/6qGbhDLVlKg6D8cZk2iN4t
	 XTcFnxReL9lEVyQPeYu+rv+yhofIiv3IEmSq6FyDw+rh1sHNf4sxprWEE+pMIkByP9FVX
	 1Wglb9iYxemH4/RstpKLULVNxvbG/2B9kjWmkxeOktIBF/perQ7Q7lawGCXYrzHk0uMEM
	 RSDP7tP/kcj/AfcYfR8iWw/gHSJVaLS3L9Wbfnbt7UB9RQ6zE2qW6hdby2UPPGQu95A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608191;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=5OUKSo1BdTv2vj4HJJC6NpSYtqPSKygauh8XRXOSz5Q=;
	b=nhTTKD6dsx0EiZ/RZWd0abcaITMrhCe8JHDTrMXZ9t85MZMKNiH4YA8IfgYFcplDogKZ
	 IJyNO8DqiZj2j01VeFJFG4Rr1EnJXfh6RuFQ87dA+fs5Fc3chULTHniRHbSjeaJULqVz1
	 xutldVU7+7extXrqC41anvo3ib4kVzPLvlse36JcCvGrKbW3ssnkVv6ml5lgP/t9ckqSa
	 CxZgk21jaeshI1Nm+apsxucL0oEwzgsUe+soYQ1u5IpF9juzsD79iHTieK8Xw1ET4W9Td
	 Fk6ZsuPM7/pOav7VICmr9xZlYiIVAHBZOsmCPcePVmi7qH2qZAFWrIebyvHBXstP8iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5z3frW1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB493606A321;
	Wed, 25 Nov 2026 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5z3frW1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49F31F000C6;
	Wed, 25 Nov 2026 12:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608191;
	bh=5OUKSo1BdTv2vj4HJJC6NpSYtqPSKygauh8XRXOSz5Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=S5z3frW1W8SoN8WLcNRa12JyNL8xh/j6i66ENf1EIaBdX5ImdRiJB7js8ifAimvxB
	 AZlwUQtBYO+L671k0ydoQXxcHAKwAnWzY4aDKbwr0Oa9SX0Cz4pqPILayKpxxC5op5
	 f/YlmHzTfFgDI2Kn3Ii6vwDbhkKzGrrqFJQVn5udIv7aIt1y5wNysI4Pqd2qvIUXVK
	 z0i0ztzAMqux3fInd/tpF7WlQnGsQaDrYDBYgZhfH/gewDXCvpmx+xWswIv3aZ5xAZ
	 P0z2NdXkuWiQ6PaloyHgvtkUJbR78PKkGez6zd3wzjYBVBqRIjc4czFQu20A7v3xef
	 y6tpPgFsuh0hw==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 2/2] arm64: dts: qcom: sm8750-lenovo-elden: add
 Lenovo Legion Y700 Gen4, a Qualcomm SM8750-based tablet
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
 mitltlatltl@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261125091309.124354-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261125091309.124354-3-xiaqinghuan@mail.ustc.edu.cn>
Date: Wed, 25 Nov 2026 13:03:08 +0100
Message-Id: <179560818867.84329.911396338614062552.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-25 17:13 +0800, Qianhui Xu wrote:
> The Lenovo Legion Y700 Gen4 (TB322FC) is an SM8750 tablet.  Add its
> devicetree with the board compatible, the chassis type, the GPIOs the boot
> firmware reserves and the board clocks, which the SM8750 dtsi consumes: the
> XO and sleep clocks and the two divided CXO derivatives, as on the other
> SM8750 boards.
> 
> The camera devices are powered by a WL2868C camera PMIC on i2c10: LDO1
> feeds the rear sensor DVDD, LDO2 the front sensor DVDD, LDO3 the front
> sensor AVDD, LDO4 the rear sensor AVDD, LDO5 the VCM VDD, LDO7 the DOVDD of
> both sensors and the VCM VDDIO, all at fixed voltages including the offsets
> programmed by the stock firmware.  LDO6 is not wired out on this board.
> 
> This is one logical action - "add this new hardware" - so the board and the
> regulators it carries are described in a single commit.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
> Changes in v8:
> - No change to the device tree itself; the series is now two patches, with
>   the board binding entry first.  See the cover letter.
>

Your changelog or cover letter should be explicit about waiting on
bindings, instead of wall of text.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
