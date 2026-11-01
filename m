Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571382;
	b=JNzGcRgC1IR2tRVc8n/CMZ2x2CL03WH+QsKrAbWMaIwmEeIquHEzDqppAle/wesHUDUc
	 cp+mwaSaOtBV+VBuiX0Dld7BE+Tdtbv81bKftZlZ19Aqum3XLi2XCOBlrMCKhlSV7Jrp0
	 crB2kl/GR5So+P8MZLWBw21nZtg9/3Fl0O1Axny2KxjAweAB7HiF89toVxYrjlfGnn0YI
	 FoTTxsy2/46PbvMn4oi3nVyI1Gn4I2u+qfAZAAKiuKGHN3sugtMB7IFqF/xlnnjviXcHF
	 auXIojcKELVnRV/Jg3fte1UeD/vB4VYg/exj77qsR4WF+rg/cTIafDx9kMPpAa/hz8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571382;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GYQJ26ybopccUNbhVj27BJdx0uHeN+9HfKodWNhkEeg=;
	b=RTmHEJXLQbC7wouxUl1DTnOMGAnVpg9jz1jsL656rL5KmHKJ/fuCEWUqtcIjmjTBuOVU
	 CHF+KosWGDhW5g5MYLb+I+AF1rZa12cexdBBp/CEPXaobhPMzlAWXW2Jda8e6VNNqg1E/
	 iQ0x0Sy6wbjWy/qYGOXUlSPOq6W42FMmCDUyVDbPkCfRVtBLDaRiP70VQCrqWoy7WLfI6
	 uVHmAD6+Ee9G7IixbiyQ2exxBOrec50FYu2wX1YZlkOcLw7+OYT2yNFwk5gmmA3WJMmaT
	 2wCHPl9LmAPgUWoj4YZggo+/cNegSFFrnlKOfDODp6VtpCW9mXP3ycdDNUZtehH2fQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=PFX7bvyL;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50882606B9C9
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50882606B9C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=PFX7bvyL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GYQJ26ybopccUNbhVj27BJdx0uHeN+9HfKodWNhkEeg=; b=PFX7bvyLTQ1AZti3YlmsOTtQye
	vZXLwFyiMNUH48OCY6Mc8yEzBdaiFD4BLXUNjdv22fBi59a8u4yATOSseM9Wqcl46ota7X2aTi0p4
	vidV9azk0zsqaIcCyRRAKBMAXRLAjOJ6MisvfMLKLdBnad1v9RYM3MlKQljWTanEumW0G8Mxj5i7a
	7/GYSbEa+fnr5kN8tnsp+cHUtTTfE32DXnrW0ZlAe+klaBzq+DtVeDFynZ9ylQRECAr1zrcap00er
	KJRfMGvgl42dBsIOQhMqGdutG9pPUsZDBsxqMXuwL1BxZxw0ihz1cW82fdcBaZxVebYKoCcS3tNxa
	nWFFy2Ag==;
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org,
	Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add icm42607p IMU for RG-Vita-Pro
Date: Sun,  1 Nov 2026 23:16:12 +0100
Message-ID: <179357136482.4108155.972231483096008168.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026152649.1576867-1-macroalpha82@gmail.com>
References: <20261026152649.1576867-1-macroalpha82@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Mon, 26 Oct 2026 10:26:49 -0500, Chris Morgan wrote:
> Add the Invensense ICM42607P IMU for the Anbernic RG-DS. Mount-matrix
> was tested with iio-sensor-proxy and reports correct orientation.
> Orientation is relative to panel physical hardware which is rotated 270
> degrees in software.

Applied, thanks!

[1/1] arm64: dts: rockchip: Add icm42607p IMU for RG-Vita-Pro
      commit: 4a17cc3bd48ecf4dcb7df2b26538e0d28e35d873

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
