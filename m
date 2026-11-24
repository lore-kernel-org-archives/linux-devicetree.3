Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533352;
	b=Hq2l5uUdYzOad/14O6660UR7uMsZjXlPa7BVCBYPhWAmbhKhc9PHVVcfvGMKwpbLaray
	 oJ7OiigwfgTB3sweusoQiIXIAy8fUbplBLu0x9vQZlNYCcO2Iel7qFPHSEmPEFlfzlZ7c
	 1OybbSAZZeHINonFWa/tx4j954i2lTdWGOXOjKB75QJIJKnjO+sUArXR7z2rdL6avvjxQ
	 MXx2zzRcLkh9E7qgQ0C2ItSDg3uAcsco3fjPf2yACo39h1WIt4/Zdjhj7XWdHGg5eVmyS
	 t8OPYXidbwzHUisrngNh/ytFLnFjWWDSTsj0ASofIuTOQ8OgOX42RNsJ+zjQ+5ChJhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533352;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=r3GkmpRigQgVO4JsVA/4UmT4sTwurviyl5SpQg2cUXo=;
	b=eZipelecWoSR5tryswEILJPfeYtMgBUKtGw9h2TNu74b0kgYsFVaQIk3QudxGtN/1OgF
	 PVXK7pIwQ+y+CWSr4r6beNtHIs1ro1IKON5fYfXp4wBEXqyD9tbvBceYyKXerKoFlAetK
	 B7ukpRXeHZscEkQzn209BxuN7IG0ze+N0wd4CwNlc7PVZLLAQbvHIAe8LPqb8fSXm+7td
	 WGAfn/DINbFv3vShSjxMDJ+hyQnKqlelkHm6Rf5pMZzOcyNdp5vLBpJR2T3aSaWxml30Y
	 oZjHzd34XjC8px74WrC0DySW3/JafGwvgN6KPX+VGvNdU2MaPoOz+xWBq+DINjE/DoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=X0UiRqOs;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56555606A31E;
	Tue, 24 Nov 2026 15:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56555606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=X0UiRqOs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=r3GkmpRigQgVO4JsVA/4U
	mT4sTwurviyl5SpQg2cUXo=; b=X0UiRqOsOW8VFKePq357g91ZSBx5DWhb1dql6
	d1zo4NJzELD+H61r7zP1s+cmnoH326jr//ogWEJUcZRWktWkyYIm5o86doKOKgsf
	DgpfPhCClheZtV9zX3q8FySCb4Izqqi8MEdbptoKhJOgiRem6xAzJAR1V1lQ6wUj
	mp7Plo=
Received: from [127.0.1.1] (unknown [114.214.193.58])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3wEQVqgVrebbyAA--.3132S2;
	Tue, 24 Nov 2026 23:15:33 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8750: mark the ADSP fastrpc node
 as non-secure domain
Date: Tue, 24 Nov 2026 23:15:33 +0800
Message-ID: <179553333372.1285526.8130842532811879857@mail.ustc.edu.cn>
In-Reply-To: <20261111035731.940893-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261111035731.940893-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgA3wEQVqgVrebbyAA--.3132S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY37k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j
	6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
	xl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAF
	wVW5WwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUAVWUtwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjxU4znQUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2sElFt24wAhsC

*** AI-assistance disclosure ***
This reply was drafted with the help of an LLM coding assistant.  The author reviewed
every line and takes full responsibility for the content, measurements and decisions.

Hi,

v3 has been out since 2026-11-11 with no reply; both changes Konrad asked for on v1 are
already in it.  Would a v4 rebased onto current master make the pull easier, or is this
revision fine as it stands?  Happy to send it through whichever tree you prefer.

Thanks,
Qianhui Xu

