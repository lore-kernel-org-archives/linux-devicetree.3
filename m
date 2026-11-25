Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608334;
	b=nUzLZ2BdFM9DoRqSBvwsUx9AXY8yWzibaua9ZEoU/Wdx76wG9Rlp8DiO8fuQb3yNDAq+
	 Fd/tdp7G6JtKR2t2iXOq2Gatkft+x1TkAtCGFLBgwZUzMPrwqZpANm0UD3vMONdN3DUGI
	 cNXmQfTOK+b9ySBea14mXyNw7tTDUsUKSOV5KU1Dq/D9iLHkzVVWMD4MGThzx2XrWq/RR
	 or40oR+Rn3pMNUL2wplwlHofZm03tIo65ZD+5pUI7C41lNJFMO2nLYSS0Y9NODDrTzypN
	 0AMjM3b02ql3CBhWVP1fypckwxOrI/q9nyE8iFn3GfTtJ5McrSXKIS+RekBVgDp5uaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608334;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=2OLfuU8TDXu7/RD5JOuZOZ4YXwbpYfiX3cVi1VgAQiA=;
	b=gb9D9+1wcOPrj51H2pE6PScZg2wT5g4MY0bpouw4BV103mbc5wHlGk0jpPLn4dl0aZ4A
	 2LdQXrairqjUlkmBdcNBrCW8Usde9CpCr/AjABOl7I2P/KU734NsJ47iL14ik5dqx1P7x
	 QCSa0dMTNXNMwIxSPJtmIbtk96CuA+lkhCRtkUdM1aG9vLuLi23DoeYOvl7SS+rJF5fhU
	 YAkVsGkUfMy+ta539pMlMUoP5PCTJjPbi+7GFaQgBESODGGBO3H4vAhEU2fvvKI+7MjCS
	 m2WW6gDfi58NnhhjwmQbxm4IsUdqpc07rt49Gwu4MRpSJW/9aT775EnQLcCicY7UhGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HeZVYKBR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEF1606A31E;
	Wed, 25 Nov 2026 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HeZVYKBR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47C51F000C6;
	Wed, 25 Nov 2026 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608334;
	bh=2OLfuU8TDXu7/RD5JOuZOZ4YXwbpYfiX3cVi1VgAQiA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=HeZVYKBRgRMMQxq77FUnQmEI7TKwpjZ18rLTCTqRczX2nj+wbYngSSGXFjIZMl3N3
	 Oq7UBNG7Bb2TEG1waUj0yc5E5HgMcY/pgiZzjxgcPTy6DWC1TXbh59M2xlzbelBBCd
	 PtAA7aQQ/OT1+cKoKou0DRliWNMz4EejpVeI5NfnBrUOrYrUT6PB8XdaluBul9GNXL
	 fY0V0q6LaHu/RhgrOuQ1NtQlOfWSN2Pcvx8lBGdIEYcNO8c5s00LANl9B/PLUnZWme
	 PhCpc1EVUsKi3nE4aOLQDOtWwolK7xUqxsqfRmX00bXDE19WMP+hQMXXAM2BIeq1fT
	 qc9hbatEryr2w==
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
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK
 board
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261125-talos-lyra-evk-v2-v4-1-73d768714a5a@oss.qualcomm.com>
References: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
 <20261125-talos-lyra-evk-v2-v4-1-73d768714a5a@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 13:05:31 +0100
Message-Id: <179560833166.84329.10422429006005959147.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-25 12:42 +0530, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> 
> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
> board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
> The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
> qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
> than introducing a SoM-specific compatible.

Your commit msg seems to be the same (so nothing got updated) thus you
have the same comments from Sashiko...

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
