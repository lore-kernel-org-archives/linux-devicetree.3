Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368E6395ADE;
	Mon,  6 Jul 2026 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373136; cv=none; b=RWQy8qnIsxFcz++0cWqqfqkMsUoXK1zHxARdCsFX1aMfQBBwdiZ5YbyxD2sWPItr1wIxJckekCnQGpeoS56QBqLhFUAnKTBWxzZPCCSsseOucmmf0vmiNj9Bi21kEuz9TqAROX/y0telmUJcbCNCuhgon5twkv7VjKG07LBCI48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373136; c=relaxed/simple;
	bh=9XPJmkFC0i8vZleo0gL3ayvrM44bthGixU1Gz6xUCB8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=GdzNs/XcIOOVRuYA6Wd/ZUOv/zvkfFruoOD8PsLwk1acTcLu+yfJKqDjJOxpbHvf8xdJqJH3C+64LCIQx27WYYFwBqnPbBBKFRf74/b4N+sUOQoc2CgBy/h6V9XxiPAKIFHPj0JVgWaESO6l9bvaunWhm9vSJkYBVgHujFPyPAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=MpTHLDMf; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="MpTHLDMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783373126; bh=RWhSVJVORFM0nmb44FtaW2rLu6vW8nVH7CmnaXSUUlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MpTHLDMf6w4zJ8tCB4YVUh06nMl3l9QCUpYqfRSp8H0Q7yA14nxkJ/pI3tSCxEe0i
	 dtx1g3h/8xTeqXGoX8r4LlFOVxpr8X2qhrlpD/KIbgo2sKZ6x3aJwNhKFsM1WdFsoP
	 CNeeA3pbe04Hob8q1AzUVBvOp+JAKow7skOs/Gwg=
Received: from AERO17.taila7786d.ts.net ([220.171.158.107])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 6571E26E; Tue, 07 Jul 2026 05:25:23 +0800
X-QQ-mid: xmsmtpt1783373123tq31asxge
Message-ID: <tencent_3C137FCC795067C558C9C8BD86C03C180006@qq.com>
X-QQ-XMAILINFO: MZtEYADUG4AgQcDlRbWn1WAYZSJBgI9Ur13Tuyix8/SlyXAxMGATkk2TqiTkWi
	 cd9D+8sLM3rvBNt2nAE7U2MKbAkBLIIdiWO5NpFcVHLReRy3G/F1ntrcewIwGoGc2UBRpgBieu9Q
	 vn2qWspL1HxLiDycBA2G1I85B/440dKVV+UY31gGM0qaksP00AY9rHvY12a7Grrrl6XiQig7WOS0
	 D6nzKkSg+RfUBSElxCvORLulzUR3Dvvxxi29V6WFPQ92I8Ext3n8V0Y2112k1Gqw4gd0OI7sVCip
	 8DMwRSvjx+Ip1PdRVpmAYoW9Pu7y4EYZ80RMoJ7XH7wsI9S5Gx+pOfBj8pWdRnZlH1F1rK5LlqDJ
	 +mT74c7RXjzfvdIkBCccXnynkdMefDK5QLmzNrH+0q0rbIKsFNOPqAITrCTJ+fxrfUWrb0qq/jov
	 t1L5h3MYHMsLMS0djET+/AxjSL3aHjc+Auxr0OaSRPALqpdFR4uqHJErLHQIw6O/fZhaTFUKLgkB
	 hArBfdIo2XRfvIkAK/njoCtJeIuscGzXFs+at43BZVU5h71osTuuiTEi9rjEy+jKVvl1Fzositcf
	 CWwf/Ro05ptkWLkLmpXR+Afoa0t1YbexlMOeJpxL0CPImp4LHja6jacg6SOfnbEFNJi7WcPGV3In
	 Xc1XBp0ApgaPeE0OAS4rhi1YV9sztw7XLWdIzSJZ88/DPEpOdaFiLNuIfUET/O5w8CpXVFyQZ8tv
	 UuDTWevZdGWK3Un0rX3ZCO2XpJYW9N97yGQw/ss8C9P2BIpbDvHZ2w2TbBMvC2VsggNZqIjVry+G
	 5QwlNONZ2EE0dPH3QrkbMxbu9eMBoRVYfmKiBdfSzkw7b4P1qjJ7AYOMFhTe98l1vfEnnJ10Nhto
	 co36NeFmqMvVG7FypqQhkZ1LRs3LKZ1OFzNjvt3kM+r63OQfdMb8LuRCfPSLtxycMLzJyFSpPQTq
	 X9ebEL60O637wcDdLcX7s624vDWd85k5ksmJWj0X8b4rFIfbNXsFVOWZo3qMmTguAhh58+0wBVMO
	 amNrdRZhMGEw1h+L8/t+RH2rFNup4CNRWZ3XVKYggtrik/V8WvIPxXquI65kE=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
Date: Tue,  7 Jul 2026 05:24:28 +0800
X-OQ-MSGID: <20260706212429.691312-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705-matriarch-epic-37add5cb97b8@spud>
References: <20260705135014.1004166-1-2254650260@qq.com> <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com> <20260705-palatable-hardening-48f73a84244c@spud> <20260705-matriarch-epic-37add5cb97b8@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Jul 05, 2026 at 03:38:00PM +0100, Conor Dooley wrote:
> On Sun, Jul 05, 2026 at 03:37:00PM +0100, Conor Dooley wrote:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
>
> Actually no, I just noticed you're not using your real name/a known
> identity. un-acked until you sort that out.

Apologies for the confusion. My real name is Jin Pufan.
In v2 I will change the author identity to:

    From: Pufan Jin <2254650260@qq.com>
    Signed-off-by: Pufan Jin <2254650260@qq.com>

(family name Jin, given name Pufan; using given-name-first Latin
order as is customary on the list.) The Copyright line in the
DTS will be updated to match.

Thanks for the review, and sorry for the noise.

Pufan Jin

