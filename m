Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D67DDCD;
	Sun, 10 May 2026 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416300; cv=none; b=JLJMBtqIQFWrNZ15cqRuumPhJDVBqFnWs0TviTXgqZmuuzz0IpSnq7amNhhQSdFub3Iy9ZRgaGb9wDF+cS7MDroQQs1ckinMUt1vHciVOtDeQWWOfd/NS4pKyvlal+uXfmJrsjE4VaK6Vgb9DAVJJu/XDhFxzhF8UW4YtHKQhSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416300; c=relaxed/simple;
	bh=QhiPJ7oNWRgIuuxn9VuTh0SkuqQDWzHNu7+WPzds+88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F2EQOp/UlfoEj86/XRQRFRbLm3An5tKIf/YJuCtIEd50503UJDY4+wmw7JlH9UAiwtfgN4pDQry53Omh3TEKZ/e7pfZOwolQwh7OjXbrSxeRrJxtF7QXSjDdITlmg9dZoq9BLqDDmyH5gyoTnCTu5rzqUzVJHpv7CAszKgQDayM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEGCoaK8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEGCoaK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BAEC2BCF6;
	Sun, 10 May 2026 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416300;
	bh=QhiPJ7oNWRgIuuxn9VuTh0SkuqQDWzHNu7+WPzds+88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nEGCoaK8CBx9+6oIWFcahlJtSwNBdc6FjEkcjc3upSA+oZ/1wf/6G9O1PbZX8CzhF
	 vvWpBvR6XjVjSycBXZlPE7wS1ir9Hd5TZfAjs5CdxG2xhNtO+XFQh5hC9HtYA4Q/CP
	 /gPnUKX5JNFg3D/0tfPMod/+K+S1rNorYe+tFjg5mQyhjtRLicji2NIJs49q/9f6E6
	 OAsxAtUKG3HJhK5ARMPetK6qAMdjUuQo2RTmDsuPlYZ7CJN9ArLbxp45HfsSU7N/wY
	 TqPrW0gjVi8Ar0AD+9sFxNWb2S6B/4Y4qlSlnVSzqLFhGyQ4cHAC7MDLaZe+Se6tEk
	 qfk/J1qKShLMw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-bindings-qmp-phy-v2-1-849c4de8d75f@oss.qualcomm.com>
References: <20260504-eliza-bindings-qmp-phy-v2-1-849c4de8d75f@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add Eliza QMP PHY
Message-Id: <177841629697.434434.1495203271597382952.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 04 May 2026 19:03:41 +0300, Abel Vesa wrote:
> Document the compatible for the USB QMP PHY found on the Qualcomm Eliza
> SoC.
> 
> It is fully compatible with the one found on Qualcomm SM8650, so add it
> with the SM8650 as fallback.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Eliza QMP PHY
      commit: d67a337d28a2d852ff539e983ad6790caf9c95f5

Best regards,
-- 
~Vinod


