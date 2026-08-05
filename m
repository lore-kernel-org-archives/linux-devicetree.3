Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4EC38D3EE;
	Wed,  5 Aug 2026 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949269; cv=none; b=VQebdC4rBhT8ny55BL69pdwWhZJepnmDya+PrNmYEaRTPwvaLbgaey444UKmou8L5Sgk8Cxg5a1fJSsrWOpHWaLkkAQNUMlNp4EX315ThNx1hK13HfP58kudtOK89OrP4ol0a8RmKWdtlSz5JTHCyhQYY0wy6DgiBvSmbaqnLXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949269; c=relaxed/simple;
	bh=wYKOBudt0uhQ3hJOEGm1KHcZCUuKNg4bZ1AwVf8XBWE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=H1GLTlozoIxiJfCWx5JIJ/ETxSi95CoEFA7E7KOic2mo4rUqCkVhxgB1ATh2uIMjboVO8UgbmRoEVLYCnUWZ4BiQPcxKFBfCy0E66Qkklo9SXzE/jFErJ7LenGyJBwEd6gmtwESMo3oFaguQ3PHYiwHfGflnR2RI0I61Kz4s3Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ugsHNFWP; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ugsHNFWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785949258; bh=wYKOBudt0uhQ3hJOEGm1KHcZCUuKNg4bZ1AwVf8XBWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ugsHNFWPAIscm8a3y/n2BQkKjk8USJ2RMdLkl8G6GcMDaCj6SpWs22yjwq0UfSc68
	 MAdiX44qP6KUwEOHGV/7+1s7AEWAXrBoV+W0XUVV/mIZa6BA9lRAqmsZyEOSU1DiBg
	 DZ1f1/Aim536xan7vM3/fw4zrOXoeDiyktfPs1RY=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 37ACA63; Thu, 06 Aug 2026 01:00:55 +0800
X-QQ-mid: xmsmtpt1785949255t5zhr05ms
Message-ID: <tencent_CF663AE8A4E2ACE4EB5E5E40198C8E893305@qq.com>
X-QQ-XMAILINFO: MhK4DKsBP06idkYQZ1KmLE8p3prVyjyv0JplOFvX2T6BtmXXyI4Q7StkqzY0DS
	 I2ExgAdxdm5CARZQQHh2DI/85FxfxOtkA2z6lh7L6iyKte5O16OFWwUjDh/UsizimVmdaSGNsKEk
	 u700aQJ4Sx4nuTcUZlJflX2qxKFgXwYxhxxhWphXsHL2h9ZKdf16q5tkF7NV7LeXob8MIqxVEct8
	 fju6lWUhkXaMIlZ+aT+4ooOE74+v7CMe5v5oTc8TFWOYCh3S1S/Nd4zU5pEw3yCYICqlZkcmPvjr
	 9ZTE6ZmwEUKTk1ckvJ8QJGlPOael3dBS2ATy4JZwzKhtxXmsmLSwyA/pQW2wav12zKuTL3wNJ9vN
	 l2NCAnttTROnusPa4smvyBv4sZWLPBRBvhBwvTpVzEzZqO+6BQtK5hF7mzz0PIVYSdjBeVJaWJ88
	 rCs9GLLM00ukW4EUi2Y7+9Y4SsRjGAfwwwje0hUXbf1b9pGye27sjMzKY99CQRGfk3nSy4AGtGTb
	 f7nO3xU32mmVjIKdqhy6zyK42jZo9oXaOVnH3QbNQcfBZwvMVbwTW1FMwKvDmIuXppfeFHGDHBDe
	 Hw4RY85VKFsWiGnExSFvh+qLY3On86zpjMSc4ZhIbQTbVnRvgwsi/Ka/tWkOjxpThOSvj4zfYEn1
	 S3zvhAYCeZvCKVV6c4WyH2Kb9mw7Ryllv0KJreIRo3xTWU1qD08v7vK8sBq8nCXAUS++4ymS1PWQ
	 3GsBOPk4PW31zqwLHwBE/ZET0FtVyXMsnLgFC2Ego5fjtSRarjsPrpprXaT+gPf5IzUyzkvfjlPe
	 QHJ5Vhlq1TtJ4BAVeSklvM+7vGrJMaugjxdlq17PXAKs60SesKArbgr/7k5h8hemBFjVkeQ4FurV
	 hxPreVGkHm4ZeXl2VcKtK8djnStZhC3TOJ5Y/lG7cYbrICagfWvc+CwL5wY4pvF1eZWA7suj7TNk
	 8yXJQVfm3ue0AHChwS7dknnTYdcPUbL22H9rxPOLF09vFHj/cmGVZk5DixqLoVvOYq/NTu55QbpT
	 OWfB4Q3rdBlgPtri02II4NtsvEJbIqDCYPNbroZqz2CQhimtDDXwmkxceeZGk=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Pufan Jin <2254650260@qq.com>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable the NPU on LubanCat 4
Date: Thu,  6 Aug 2026 01:00:54 +0800
X-OQ-MSGID: <20260805170054.143528-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CALWfF7Ly=o85=ZQ3Laewe5VwW6agHLvqqSPKFDzcf75UWYnP4g@mail.gmail.com>
References: <CALWfF7Ly=o85=ZQ3Laewe5VwW6agHLvqqSPKFDzcf75UWYnP4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Aug 5, 2026 at 11:48 AM Jimmy Hon <honyuenkwun@gmail.com> wrote:
> As you mentioned here, the power domain will control the regulator. So
> please remove the regulator-always-on from the regulator.

You are right, thanks. always_on makes _regulator_disable() skip its
last-user branch, so the regulator_disable() that pd_npu issues never
reaches the hardware and the rail stays up regardless.

Dropped in v2 and retested: the three cores still probe and
regulator_summary shows vdd_npu_s0 back at a use count of zero while the
NPU is idle, so nothing pins the rail any more.

Same change commit de5b39d16318 ("arm64: dts: rockchip: Remove
workaround that prevented Turing RK1 GPU power regulator control") made
for vdd_gpu_s0. I did not add a Fixes: tag, since pd_npu had no
domain-supply before this patch and so there was nothing for always_on
to block.

Pufan

