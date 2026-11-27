Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779020;
	b=fss+iQfx2f+Y9ROuH95Jd2CNwbTjrjkCVRl8cni+kfZTXEtt9C+uJBf9o+KTu84cgzIy
	 tXc/Tz10MFbLMTaDaiT3mgGcnTKGYPzeQGhrHRnt3Qf1VfgNvLqZCs1X6bCvOKyox8XKl
	 lI+VeCWQfbUA0Icepl/9KpXFoirTINZ++O/uZVN/v1vP9fnNW9VAwlTTJJmdCBBr8K6mb
	 NIHl98wuk2u5LVVihnYQVEF+n1GigY5UI2hKltVO5+3JeVy9t3QHA7+D/Wh/w2h2zcoC9
	 dKHF56IBfRZdm+hGCr6YDz6XLoyKB1L7IJTttAWoydRXbLc4JIpEnD+FXCHMkXJ+nVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779020;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=15lHObMmyGPpj6YoAIfUZKJfHfZrP3j6tm+aE9QITgc=;
	b=3umZarCgtDf/4qz1KalaaVoKY2iCQw3phvZiEGhhf4RQQBIRQP23IMLyYPADqtPPgY7p
	 iPKV3Me/DL0yQpuEm4bckiP/BzLicIFN8Bxtsx7LReVVMWMFiL9GldGhawc+wIqQ8LlF9
	 G82B0EMMVc0U+ji0oIsxayDMfQ2oyW9mwYMY+bRyUW/2NjpC969yCXYthSlN5QAqjCJu8
	 iegwsESV2vrP5G2VAJUW2DHgaGCeRQsapa7jd8tKoG/Wftta7+KqZCXOkrtlCIhu79rXw
	 JfohC5/JSXWKrKziwktfbq907gA0KHOCTRXP/cZn583OH9uOwewDwQxDpyLvMvfpAUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eRpJ3oiJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36596606A31E;
	Fri, 27 Nov 2026 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eRpJ3oiJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1B91F000C1;
	Fri, 27 Nov 2026 11:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779019;
	bh=15lHObMmyGPpj6YoAIfUZKJfHfZrP3j6tm+aE9QITgc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eRpJ3oiJWlSUirmaD+LmxhuRi1qhGdFgQgOJ16JgA7cDHI6z8NvWcNJjrCMheJKYB
	 8idaGg+O5UwqD9w2E7Ctps4fkioj/O+VAUrWDx/FM51PbVFI/1FO88txl0AaIdu8Ub
	 CFiSeSjIVR3SFkT2BeFCV/RRj/nUNkzxPGC08cRFZXoco0Ld9g4DfPnbUR4QNeWd6m
	 uU+ybC4a7Pu530Z2z7h2A6pioyF+wpnTkuR8PC5it6Ftrag2l/snSfFLGxF/KM74K6
	 jTVhaImUjQTSJQb+DLbqhaWqUqnGdsyUPO5SvDBB+YNnQFyDGwu/ZDlPlhGMrlM6Qm
	 t8OCaNmNBHFNQ==
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
Subject: Re: [PATCH v4 2/2] phy: add a driver for T-Head TH1520 USB PHY
From: Manivannan Sadhasivam <mani@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <dfustini@tenstorrent.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
In-Reply-To: <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
Date: Fri, 27 Nov 2026 17:00:10 +0530
Message-Id: <179577901023.3421.16085123878298234680.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=524; i=mani@kernel.org;
 h=from:subject:message-id; bh=YyFV7s9af4kC0Pv/cS0wCU3OEWYq0SK2owkuNnqdByk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWnFEFB/4u8peT3P9un5fE8fPPjIzxZqIShYF
 I4eaeQlYgOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlpxQAKCRBVnxHm/pHO
 9anGB/9aTf3MYaPlIVjysYpZxYxQ5CPAVDm2b4edKul/qVV3rgG86keiI9l31FOXdhjTwatY5uM
 xrC1jCFsbIXOtoCqPe3I1HAaZHVY/HwMeMEQL/e4gm2WU45ECc+ivWDqr6BDuMZB72kN86ZDuix
 4zCwxiUAWNaEmA6Qw0ct45dJ+e4UnnWfimEn3qz+YoApLyfe24Ln6RrsyRID113YOiKheLtWesY
 nCq6mYfWH42PWHJs7Vg4aCMq/CmFb+yn2joXP+43kz+Km7iFMvulvYL/+eFEw1o3HB0ihb0vHdJ
 G01z4bsKP4J6DtRE17MMqKtu69l3qmp5rhrYsJPl8XICrerr
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-03 16:14 +0800, Icenowy Zheng wrote:
> The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> some PHY parameters exported as another system controller along with it.
> 
> A few PHY parameters have unusable defaults. Add a driver that programs
> them before releasing the PHY from reset in addition to
> clock/reset/regulator management.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


