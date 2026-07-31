Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D122B35C19B;
	Fri, 31 Jul 2026 03:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468296; cv=none; b=qYnMd6su7oSxKpKBCPPRx9uVgtp4Tr824JPz+AltTWzYSU/3Ghv7GjFELYp/woGr9cQ6ii5DRdwN7zJFpZHUkL8Qsp2B+/vyZHhdzr+ttPFT4rK5058rW9G8mRz7zQCaDxf8Zq1pm9i8p0+Ahjj+3vfypEj9gukb7CZgrRWgQUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468296; c=relaxed/simple;
	bh=GUE+3QhNDbyWD28RTVRWtayeAuqQzONg5MuUfDPy6cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VI4ZUil01d4mWgEYvQB71eYmb3u30+5OFQLZoLY0uXH6BkT1OOk5vUO0dMwrIlAFthQ7ewzOPscl2TBQrjmwb3JbqiV2qXMLJ2azCOu0PXPHcuUVCfbiXUiwqcQLqH82SWzNOEELqUTxL+QLDP+5xjPF+rcr/xILKNbtpKwjY+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZ4Kg0ej; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZ4Kg0ej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E011F00A3E;
	Fri, 31 Jul 2026 03:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468294;
	bh=mvr8RaODAIwvuhZFLXlY4DCP61QD4P/XUS/Wppcu/MQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EZ4Kg0ejzHi2qSkXjLoLjufI5BJOn3D8V+suLbyqEHC/4wDVm9m3sCuEvVfSQTJrX
	 dz8N2EMbCpPwhNPcJasnnJgsGdeXs4CNJLlNR3qPx+8y4eEJjidOfIP0vHA2odRYp7
	 lCTSkxqP2/A4pb6BGAN03llzLO7S2gEv8dxvk0OjP8NzSOe1c+G4g+Lwc4oZ1qL7I+
	 UJFmTzdRR4oVz6O666JrxZ+hxQtI2qZyowAF3S6UYfjoRB7P62Vg3wVkZtCQVRRwIl
	 fMqwgZrqwLzXOsmpqoP3h61/7/LO7riPc/yOgPCHVbopIsNlVUFn3EDb+4hBNKaS8U
	 wRcPNsG02doMg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jianhua Lu <lujianhua000@gmail.com>,
	=?UTF-8?q?Dawid=20Wro=CC=81bel?= <me@dawidwrobel.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-xiaomi-elish: correct the board ID
Date: Thu, 30 Jul 2026 22:24:27 -0500
Message-ID: <178546826836.316815.5167988611342509597.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730-elish-board-id-v1-1-92f99e9722ec@dawidwrobel.com>
References: <20260730-elish-board-id-v1-1-92f99e9722ec@dawidwrobel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Jul 2026 15:44:07 +0200, Dawid Wróbel wrote:
> elish declares the same qcom,msm-id and qcom,board-id pair as
> sm8250-sony-xperia-edo.dtsi, so a bootloader choosing between appended
> device trees cannot tell the two boards apart.
> 
> 0x10008 is Sony's value. The downstream device tree for this board,
> elish-sm8250-overlay.dts, uses qcom,board-id = <47 0>, i.e. platform
> type 0x2f.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250-xiaomi-elish: correct the board ID
      commit: 299731d4fbeaaa141ce2e8226ca00cb30d6ab647

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
