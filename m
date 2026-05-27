Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7CE2A1CF;
	Wed, 27 May 2026 03:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779851163; cv=none; b=V4QRfkBCUbNpipkfue2ggbIzKZRtJ9fFcxfXQLmeI/2Rq6dzpXTN0TFq0SfxGCoI4JJQVIBTGVA7KwcWIQ6GjzV60a50L6K8dZUi8qrTgrILPbKaax9jwl8I3DW2QzEvP17qEzs5mxBrxPeWMekLQdomKIC4wm/SJxoenXS8lX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779851163; c=relaxed/simple;
	bh=+Ekha747kSi+wMi1A0yI1VRI0OpcO7R9S0RZi7mnmYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mRS4TW3oUvGA1IQZiUX3Mob4OTQov3G9gM2lYGQvQzXYvPkUe6OEKVGe2liY3S696QqStD+jOBqqopITEVdcA2vI2BE8FnIqB9qRshz2IaNgJsw5afwz8MVKzApwSIuz6lT8oeuon2cOFp9tWikAQPV3+ONnM+m2q89zCDollCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=BoixamT2; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="BoixamT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779851160;
	bh=IF4geJPizXwz+Vvc9PhYKe2Due5htIQsfI6rr6h/nk0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BoixamT2E5JqxH274O4RVLgy39fLf2XmDHEcudXvmtDQCi8slpm/b+D6rdTV/89Zq
	 6TSnbbWucDOJC/tbGPUyBQRRRW+6vVs28L481iyGUQHktTxj33K0TnPkTFbHmr5mNL
	 F1b3t5ovLfeqmlKOfnJE4XfVfgjIzg7r/TnGHweKAviWNKTMxzCwMV2zswHHNS02Gf
	 KEUeOGYHfXSLLCxNgt2ahuROfzsurvj4QWJ7evOFOdR7q83MaImp71bajepnikGgl8
	 6D88/o6hTr+RmQI7T9YhbdT3sIjkGVilR3lryT6IAvIMQRQY/xlMS5AjNifliC/wzs
	 DxCIhhjJ7c4VQ==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3DD696001B;
	Wed, 27 May 2026 11:06:00 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Mike Hsieh <mike.quanta.115@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mike Hsieh <mike_hsieh@quantatw.com>
In-Reply-To: <20260522-clemente-dts-remove-iob-nic-tmp421-v1-1-ee2509a71502@gmail.com>
References: <20260522-clemente-dts-remove-iob-nic-tmp421-v1-1-ee2509a71502@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: clemente: Remove IOB NIC TMP421
 nodes
Message-Id: <177985116014.389804.14182803385657639805.b4-ty@b4>
Date: Wed, 27 May 2026 12:36:00 +0930
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 22 May 2026 18:07:59 +0800, Mike Hsieh wrote:
> Remove the TMP421 sensor entry from the DTS, as it is no longer the
> primary telemetry source.
> 
> Accessing the CX8 NIC via I2C while it is powered off causes voltage
> leakage on the bus, leading to EEPROM corruption on shared I2C devices.
> Removing this node prevents the BMC from initiating traffic to the NIC
> during initialization, protecting the integrity of the shared bus.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

