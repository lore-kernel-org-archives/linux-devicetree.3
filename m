Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=218.76.62.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717902;
	b=TUWY2d6LL6h/V7X3vSxRO9sJFtoAD/WxJv1U9OKKIzIwsfAO946HySZTq3j0ddOSVmOb
	 vpg3z1UrK1I1QfZnMFhjciK976HiN5Qwygj9s1R8VwmxpZnh7AggcRqHKjxJbdpK8TxoC
	 kHR8EtTUpz0vG5ThfWHIx4yZO+tMky8d1jwmlXE6Sq77dhUdVT40BS860ZNzKM4NxQpLi
	 3a3EAHvYd8oIV4EFaTZnbpl2Z9mHn+V2ipnzlBDKduTmNmyEwaPikKlxtx1M7iGBOt89X
	 loaZyByTVZWsoSheqJzLaexXZQCzOKrGFPKAWakjaEeSI3tK37uOCzKRvV5VKmsdCiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717902;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=oyC1FY3rGOqgPSuXYaWNWk9KieqvUn0dqJ+tbaWtoic=;
	b=47n0/muKQJD6bEDHKOYVJz4L53IMTe+4DdwrPw85zMwJX9i+HdHS/cnA0QcSnAqL4zH5
	 QUCdPpMvF5mUBuafpi1GARxzdEqumldn5tbGNyV+Hsvf3cPLjepOwVPQ3Fa5zCE8vyk1Q
	 ZD0TedVrfzQ7BS8jBYgU8xZccnnbnxqg3g1gk536aWum9gnu/9YpayeF65L6WCPcutt4g
	 dOofQOxG3uAXMphJJOQBlK7PyKo8RnTjUTi98tqr1lOcw76ycuhdJG0/JN1yz0HV8V8UD
	 uoXVEUeFrKHgXIZVH7wMFhP1rx+qoiz4tJTxvdz2cA2OSbRc+n/NilOpekXDd9XowOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ultrarisc.com;
	spf=pass smtp.mailfrom=ultrarisc.com;
	dkim=pass header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=OUnG7TEn;
	arc=none smtp.remote-ip=218.76.62.146
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CCF606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67CCF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=OUnG7TEn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=oyC1FY3rGOqgPSuXYaWNWk9KieqvUn0dq
	J+tbaWtoic=; b=OUnG7TEniGZfsM7eIBqInyMvIa7TOnlBNGTOtsZLBepVrNqGH
	g5ItkFGpbAi49axt9jZbpscr7wnPFI/6isBpfmEbWG4NGxOZLiNyDjhgU7yRdISh
	lFt+T9Wz0JqvXv1KhlPJZjVuRpawVeg4kcGaaNGA/9lDXmss0J5w7RGR4Y=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwZItNpq9aMCAA--.1100S2;
	Fri, 23 Oct 2026 09:11:36 +0800 (CST)
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
Subject: Re: [PATCH v4 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
From: Xincheng Ji <jixincheng@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Xincheng Ji <jixincheng@ultrarisc.com>, sashiko-reviews@lists.linux.dev, 
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022-viewer-calzone-06a380c1c377@spud>
References: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
 <20261019-ultrarisc-dts-v4-7-3979747cda2e@ultrarisc.com>
 <sashiko-outbox-176776@kernel.org>
 <179246063943.3442927.10941907832509473109.b4-reply@b4>
 <20261021-badly-issuing-847ac366c9b9@spud>
 <179263206397.701068.17555028009758516675.b4-reply@b4>
 <20261022-viewer-calzone-06a380c1c377@spud>
Date: Fri, 23 Oct 2026 09:11:36 +0800
Message-Id: <179271789693.1356992.3556092251329071074.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792717897; l=314;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=gOvq4U4Y8u1l3YlKmBWKmTM2iHPkTHPwQc1KRqoiDK0=;
 b=Qbf28f4rYX03Ecs+AAJwv4fkNw6tKcR3HnOct1CcVGpYffn2rdp0Y+5ahq2xRpRlvnFX21tL6
 XM+gBdVP5KUD1a33OU5BbnMuMNLDBqXxKQKZO084GxNW6HNWIuPFuvQ
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwDnrwZItNpq9aMCAA--.1100S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY-7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aV
	CY1x0267AKxVWUJVW8JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
	x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6x
	CaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY
	02Avz4vE-syl42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_JF0_Jw1l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
	4UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUUUU=
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAHDmrYYSwADQAEs+

Hi,Conor

On 2026-10-22 19:17 +0100, Conor Dooley wrote:
> Cool. You're too late for 7.4, so I figure what you've got here will be
> 7.5 material?

I was hoping to get this into 7.4, but some delays meant I couldn't
get it ready in time.

Thanks,
Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

