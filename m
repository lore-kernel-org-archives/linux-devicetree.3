Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573427;
	b=PS6tB7QWOQMO9DiI7Nz6ZsLG4ZT/Q228K/WJwv/O1Qy+ycTv8SV4RcUXXCgsho58SoqO
	 7Q4+7yIOFqIcr/tAbFOrGJDf+PR5chQWxM2HuTbnXNcqDKtiJz1jmWBYIWFtGbN00W/Qg
	 mwsoVhSvzAfBdwbrUu0CaJe1k73Ju3/kZLHv02s0D1D8cuZzCIsVUJ7ua8Ivz/Da6jbzG
	 T9DsxUR9Ft8c5ASFw06GHImsGN2TzCf4Roz68jx8TjGZaXY/lwdGFlkGEv8vBWMIEM/Mu
	 LvIaYWQW+KPZ6qjKPn6t6XvfP+Nc5oMUY3KKrk+wSP9EywK9tCubUn7LDRFusCxFNWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573427;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=6JYkBB8UIePaiLXiNaltg/hK4DSXBJ1SrTbQ9MBarpY=;
	b=GWKKF5iaGKXCVoYrBpsmHq+VOMFHrUKoPAyN+Iw1qjC69b5t6YOv25pGmsDyNj2pdWcV
	 2lQZlxDQGmMRmqoZTbSVrbrwzld7h2BYB4cJk8Rtxj++QUzl05eYgxxS98nNm7F6UxkGg
	 j/dOqHghLnyh9zT2SkOVRD2Rydj9BotHpxCmL7RznuP47aJa2AEwhW8lB/iT/70tBE6Z2
	 V1JqvLImhFzj+Q/MfOfLWPcGfV9FbCx4LmYL3U21/+aaHWhggYDXD+Cpuf5l0kvMKnB7H
	 3QhvPkiC3P+ysI0wNGV4lwDzUBMy0Jpg4N3c+3SyAfpdtKOw2NRTJf/KyllzIfCkF8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ibrQk+Cu;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14C8606A31E;
	Wed, 25 Nov 2026 02:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F14C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ibrQk+Cu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=6JYkBB8UIePaiLXiNaltg/hK4DSXBJ1SrT
	bQ9MBarpY=; b=ibrQk+CuIChP4LPlg+EX22IjHuprfJR0z5BSqLXemQzWEOmala
	/HbYygwGVhpcTe5NkxHj4to1SeU/dC26LpSw0uXkTJUs4kgkZL23lbjDi47nrOR1
	4oIb9O1qK2sB+y8KVh99/uMdFcp+f6Uw3IQofMAur1IWMXlH+QcMjtdkc=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.196])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgDHUEWlRgZrNvn0AA--.116S2;
	Wed, 25 Nov 2026 10:23:33 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: mdss-common: describe additional block resets
Date: Wed, 25 Nov 2026 10:23:33 +0800
Message-ID: <20261125022333.680119-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113155635.1677541-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155635.1677541-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgDHUEWlRgZrNvn0AA--.116S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy8Gry7ZFW8uryUGryUWrg_yoWDXFc_uF
	1kta4UKw4UXr97Kwn3Cr4Igr1avayjka4rCry5XrWSk3s8AFy3KF97trsYvryfJws0vrya
	vFyDKr4kAr9IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07U_HUDUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARECB2sGHiADxgArso

[Resend - delivery only.  The 2026-11-24 15:15 UTC copy of this message bounced for
one Cc address, dmitry.baryshkov@linaro.org ("address not found").  It is replaced
below with the address that reviewer currently posts from.  Nothing else changed.]

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

