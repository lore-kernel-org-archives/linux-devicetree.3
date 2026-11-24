Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533352;
	b=qygMqtR5h0UkXYzOmc5ZL16LQos42QfDtEUGsUJkfbmCHxUg2cdo2fH70VUAWdSV2DFa
	 FJanpELmPaoHFbsADTc6IoIc7tgnyu8HRX92bfFcvWTPRXjyzwqY8oH5b4odudhJ/dGGb
	 vKKLk+OseGlEE40XNgB2rqWz4CyOWpD/W6u/Lsotw8wJcmwahiCb3vlR/kv2p0girQhX8
	 qjdZLn0DaSDwgfUZCQw5hAfoRRHuPJic+hpYPM/P1B9+cpu+TI69P72DbELIbZ8yXcMI6
	 oYaqxOiOUR5HsxhXSSfoaVt8QXHRuQRGeGOy/tUekHLLIvCozZheZ+UH+G2W7PbKLFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533352;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=opgmCa4GJ4PObKNwnikjQ2tZDyntqS1dxFo9rFAQ+SA=;
	b=bvOw0f3Y6kPGlOG730HNUQBt1E0hAma2nQg3a9ZjNAYVgdHd1wUShRR6GVqkF1ITBVDZ
	 UdNdP8vFHvoDTCMykPMV8+0JOI28PndBdbPtflZTY7wxoulXyeiIDSUEnDnbJbII37uPY
	 xM02BiDZeD2wy1JLrope5lvHEl0lotJNdBGM0v1hePpTIFlYu+nJFxNsHo/keUzHrxekk
	 0tWcFiHaj0W2UhcZtAtax3x92B8c8RzJmk1cuU84lEE80tb2uVImzxyF+W0oIEQQ7h9W8
	 9mUM8WfXnobs2cedRnTlNc5Roytuc3beC918mpMaCZ+dO3LiHdLCygvnH8GErHGN8Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=IPe+L9NY;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C113606A323;
	Tue, 24 Nov 2026 15:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C113606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=IPe+L9NY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=opgmCa4GJ4PObKNwnikjQ
	2tZDyntqS1dxFo9rFAQ+SA=; b=IPe+L9NYpMOJXM0agMc8aXE1mi5BjuqwqZlBV
	GYFewm1B6D1pwPZBxe6uRMMZOBwav0NDgHLF/o//pqXrtjdJ5DFJE9fxygQvbUwp
	enJnFY0eVCp00FvvMRoO+6IDECYe1o52ILFf6qH47gIJRhJtZZX4PXXzPDPaX3zk
	TRIycI=
Received: from [127.0.1.1] (unknown [114.214.193.58])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3w0ccqgVrmbbyAA--.1233S2;
	Tue, 24 Nov 2026 23:15:40 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: mdss-common: describe
 additional block resets
Date: Tue, 24 Nov 2026 23:15:40 +0800
Message-ID: <179553334050.1285678.9600414747998960135@mail.ustc.edu.cn>
In-Reply-To: <20261113155635.1677541-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155635.1677541-2-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3w0ccqgVrmbbyAA--.1233S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr1kWryfXFW5ur4xWrWUCFg_yoW3GFb_CF
	1qyFy8Kw4jqr9rJ3Z7Gr4agr1avFWqyr1UCrWrX3yfA34DJa4UGF9rtFsYvryfJan0qrya
	yF1DKrs2yr1avjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6ryrMxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07j5F4iUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2sElFt24wAisB

*** AI-assistance disclosure ***
This reply was drafted with the help of an LLM coding assistant.  The author reviewed
every line and takes full responsibility for the content, measurements and decisions.

Hi,

sashiko's review of 1/3 (2026-11-13, [Low]) says DISP_CC_MDSS_CORE_INT2_BCR (0xa000)
belongs to the domain dispcc describes separately (MDSS_INT2_GDSC at 0xb000 and the
mdss_mdp1 clock family) and is not an interrupt controller reset.  That reading is
correct, so v6 would describe it as a "secondary MDSS core clock domain reset" in the
binding and in the commit messages, with no code or DT change.  Would that v6 be welcome
now, and would you rather have the series rebased onto current master first?

Thanks,
Qianhui Xu

