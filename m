Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573421;
	b=DMvHFLgnOQfUTDL9ZZPCEsyE6QnLiHFlVfmeuLATJyzl0szsLMAlKiISQ1dswG0BrzmE
	 HAcWLBH36PuVznV6cSFw9pkfoLOPMDZjVeCv3h/d02a6YpCDVFvw09Lge8/BqiyepXBgx
	 L4asUcyMnHVkyqd+rzvnz68u/RPEv3kOLcYlmC0e1nfM3MfmBal1XY4VkJPnHXZDaYxBG
	 krZ3XUc3DgoX/pijWmVexHd+Oyu0nJlB3eIBxtxfrNF/oHT5edjwx+Y4BfdYKwTJ1Dby0
	 QRsvJEfTnBdpUMVdoga4SWJuz7fLBub+6+tT3sGDPatYVDuWUsWP0nptZSCAXjXuGfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573421;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=UkxnDhUw8EDd1UUu/J1RSXDHOeIlq9WTm/z2TLmK4gs=;
	b=PTzmJCV5ORNE3TtpmA38UH8PJuLU2IAMiNDwqWzjKq/5TCz9vZ7cZJ7LqErngIArhJA5
	 lqk3GdkkKtBqf+tbfwHcwM62No8p4iWDhfEnCZahwojkwZRBmAPN3WmhkePGBwBIncTUw
	 6J0sZ0QgjL1MMsbv47c+p/S/J6rmZig28puQgGW/3nMotVJ80pslHYF5hL4bJOaHsP0eG
	 beb/bw/QpZxLgyZFPnf2HWBGPRJGY1SBHdJ7RMZYLRmZyV6s9xGo/e1l/DY61l9Ej7DbY
	 jKGblNQGOFV3jWjZrAHJILXezBaJdTrOl+q28u/s3/HtFD0EDyNE88YvHRCCloRwq+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=xmM1qu+x;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1827606A31E;
	Wed, 25 Nov 2026 02:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1827606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=xmM1qu+x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=UkxnDhUw8EDd1UUu/J1RSXDHOeIlq9WTm/
	z2TLmK4gs=; b=xmM1qu+xPCQpjx0F8BNyij7/YkGHgwoOsqobDzlnXJXV/S8UHs
	ODke3VTXv/9roQi4ny9LAtp96n5/Yp7RVl+zUherfhFqbbZHEQFAy2BjOGQQgro5
	B6gwRM3zccCcbfLYPhs0Xe9+G6RC34RIDctUiczIsG01BvaimXzA3s3t0=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.196])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3wESgRgZrIPn0AA--.3793S2;
	Wed, 25 Nov 2026 10:23:29 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srini Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8750: mark the ADSP fastrpc node as non-secure domain
Date: Wed, 25 Nov 2026 10:23:28 +0800
Message-ID: <20261125022328.680070-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111035731.940893-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261111035731.940893-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3wESgRgZrIPn0AA--.3793S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyUXrWrKrWfGFykGr43GFg_yoW3CFgE93
	yvga47tF47XFWDKrs8CF429r4DW3909a48uryUGryfC3s8Xa43tw1DKrZ3uFyrAa12vF1D
	tF1DWr48AryavjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8sNVDUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARECB2sGHiADxgAqsp

[Resend - delivery only.  The 2026-11-24 15:15 UTC copy of this message bounced for
two Cc addresses, dmitry.baryshkov@linaro.org and srinivas.kandagatla@linaro.org
("address not found").  They are replaced below with the addresses those two
maintainers currently post from.  Nothing else changed.]

*** AI-assistance disclosure ***
This reply was drafted with the help of an LLM coding assistant.  The author reviewed
every line and takes full responsibility for the content, measurements and decisions.

Hi,

v3 has been out since 2026-11-11 with no reply; both changes Konrad asked for on v1 are
already in it.  Would a v4 rebased onto current master make the pull easier, or is this
revision fine as it stands?  Happy to send it through whichever tree you prefer.

Thanks,
Qianhui Xu

