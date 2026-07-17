Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F058D346E70;
	Fri, 17 Jul 2026 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303339; cv=none; b=hhGeVsRNk5hVm/ylsbnO3TVyVcwmcWLSPylgTNGPDCX8e1rEwcJl0LGJGJsrhkuGOJcRo7zpss8Lh78qKFCHmHBVMGvNGZltjAWiwj/u0MwzBY1tkgYWk8f92t5f+KYzRMDCMIL35veiV16HtF61hQ0MVaxeKd20XJ+HDobLlt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303339; c=relaxed/simple;
	bh=Azf1SHScTWGmXLvQ1RoVgqOpdyOSBmhtAHWkYheRZos=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fwqTLk/bHUEWycqShp/KDiVOEE/IubJObiGYMUb05Cnrj2nqJlEKDbmPPX2I3rmJwrfF3FpG9DdcdzyLyDw1LFnYF+MgCqKLITj3EjQmpt6e8rDwbYNtAXdOu/XcEh07pprScLu7X8EmXYGcstn5oELFJxo+mG+icWdfTpSEaUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lUx7HJYA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lUx7HJYA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51DB11A1067;
	Fri, 17 Jul 2026 15:48:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FDD460361;
	Fri, 17 Jul 2026 15:48:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F6D011BD0B3F;
	Fri, 17 Jul 2026 17:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ILAZx3KiebQm3SN922353u7J34YdTY+Y5ojwzfg/Bvw=;
	b=lUx7HJYAxpgrr+azw1ZLyNkz0ti8uZaYrbeFdeVWXf6exiFI5XURmZpRE8jIyk1oFSDYMG
	yIVEKzdrrVUCFKO7dXVHsO/upQyfRPBXZr5qP3w0Ok1ZCoy2UCTIuJ7R3f7038WekjzqoO
	AOUFBW4PwlYUsF/r5DXIV//Q8KankN/FXp1OUE0tvzsfiTFtpgxO+JB5k0LkcF3xL5O1Z7
	g/x8m6Cd+FaqOMFqRQwJb7DU8kc05bQ6GKbBUF2Rj+Obl+2D6c5A5xlhAhGIUwY3mumDFZ
	TvStic2mYJy32tOG/Haya7/ccOc9+uXK7CxKAhX/0LXuTX/owJfV1QdSP2Hbbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
Subject: Re: [PATCH v2 0/4] mtd: rawnand: qcom: Add MDM9607
Message-Id: <178430333120.4128272.1902568397543487777.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:48:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 07 Jul 2026 13:56:00 +0200, Stephan Gerhold wrote:
> MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
> is missing the rest of the hardware changes in QPIC v2. There is also only
> a single clock that can be controlled using the RPM firmware. Document and
> add the new qcom,mdm9607-nand compatible for this setup.
> 
> 

Applied to nand/next, thanks!

[1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND controller
      commit: 4529aababe4212b9b6d70e83ceb6a99f9691c811
[2/4] mtd: rawnand: qcom: Make "aon" clock optional
      commit: 533ec816312baecdb45bbcb8a279c6561aa71215
[3/4] mtd: rawnand: qcom: Make has_onfi_read_op separate from qpic_version2
      commit: 0732595d2f8cf846be3327c8c9453eb10b10ed39
[4/4] mtd: rawnand: qcom: Add MDM9607 compatible
      commit: 69e3c504e18bf1fec03fdf6293320860ec832af8

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

