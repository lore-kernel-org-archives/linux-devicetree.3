Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795798662;
	b=ugtdNWetIZybHwXQga94mA7gscS/mUdYX+tQgnWEANx49aDndprljf98V+ctVhQzj9Jv
	 OuZIE7j4R/Ux0SfoT5f5+t6Mgx52oCw1pYVt+OvaBHiRMyXZQd1Yqhgql6j6YNcIesg3J
	 CCQXgAT1yxqfABHZa+0lkPnh1sw71KUjmLll2jf/KWlYzspHD8TeEf0BRqXI8l86xkZA1
	 MfDqTO1vhVClNHkaQHP/wwFvioM9LCb3yklnP1/GWdQE39i1PRMonSeuK1N17lxM4IsSm
	 WGZClXiF4u2P31BtUVCe2lUkAtL6BCUgc9MbxcteCfUkkDVsXUp5ttEovrmHfQ15p5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
	b=hFpUzspcWjz4r2rwLAXk+J6wN0Uwk6kQw46hPmW7C8QGIB1n4+65PZG7MCHh1jP7FI75
	 6MvKALYbolP/8u5IudlPfDF4oDslqwvb6ds8UdWCenDxLViC6qTuO3BJSTlP7yUQehJKk
	 lAzOHI7BvZLvjsdDr0rZRHyMk19EvflAO21iMHj4Cuwcvyye7BfpS8HWKlhTVUk4TlVHH
	 4LKLpOA7vnLz6B9ot2x3PYJWQV9aW1RTY/jTk2L1Jh+3Sh55Cw/TE47FPyZ+7fUj442pB
	 q1A3k2J8lAFE3vsDo4unocCMxvy7P7AoKDO84Gf1BrrF/08dNHnhDGusz4EMmqLtOFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f+CjY/BX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BCD606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20BCD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+CjY/BX
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5363316fa0cso85800991cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795798661; cv=none;
        d=google.com; s=arc-20260327;
        b=kjwsiUwR3UxndaPqL1ZBsv71zgB+KaURECuIiJyZq6hDKFK9k3N4wz/XSmEaosQUjn
         gS9KrG8qCpSQbvL+wJWtHbVVa/SF0Q1lVR2ngk4gDU9/gycLOvv/OJqXhavcBJ7peL84
         xuSiEv64L1hgLQec1/h5VgBFFj3ekZGgJA0kiYSwxDKmIn6HlLrGpWIB/brLNCVa80uU
         269S51OqmSVZbhdE5zUulaKDA2goh5kYziAzh27PISWejtJepuo1hr3cPVeui+ocFqDc
         xGnkJJmHMBsU2hDugh3lCrttx3hOxRBLoFO1V9Iyb8Bcak1W8NcsRmwr8NweGQHhf8ha
         m6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        fh=Lw1MAwN0HMkcDtkyyf91c1O1MXgqowL0/zwhHqFqgSE=;
        b=Cy1Mg9nkBsjFdEFUhmsFRXfHH9THuaIE82rQVYXS1Z8dPdRNnpJuWTKNYsy1mu6hR3
         Hzl4Tu059uJ8qGl8wOOlA+lF1Xk4oVEK2U6dnuGRNZ6t1CMEbGC31HuRq1fElbEdnCmv
         CLI9/tgxyaQeTx2WkZHhUjFwtOHdu3+AXMFgyfAI4bKq1wK01DedywrHAKzQMW5Ic83M
         BDmm7aeA1Pxc7P8htRTJmvWJhBDp0isFxtPWMxhalz6alS6+ztXvohVY9pRV32wb2uez
         gFkrtKFYdutJ8vfCBs0Zd97Uzvc/3tObhBlcr2b922+ViX5sLN2bNs3ANWKWsKnnkwII
         D5CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798661; x=1796403461; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        b=f+CjY/BXcpKl6jzX9OALdg1mfYorM8PIZRIjW5rU5+YXEtkDEecpk4tbM35O+h2l+Y
         3BySmVV+mW3zLErChy3JX8Fn4SNdfz8iDIA4tmhi5DY7Ki6vPLJIZlQNQrgRm+e7BiZd
         Dr45nSTD78QTB0+Gfx0Yfaf4hrdQNxxnzTAPR2jV1bMjf5ntnpwz9kaD04KIpjR0LYoy
         t5Ky+I4vi9mo4WJ8lucIof1Cx3aBixtmy2uew8gN82rbCeH7WFL4MYtu1i6S9NN1z6hf
         dQrP6ZJu+O/wvnlHDys73uhLW4+ve2adu9/IiRkeEDmKKWgUl7/St2Op+kUmSiTtTpf9
         B5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798661; x=1796403461;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        b=UtirbYuG6iPUs0ELrmUBYc3M/R3Vw1ExkImBTX/+uR5d6kOheniz/tZkRz/VY0+rJg
         at3hJDh75bmg1r7dTj4m+R4cUG1kGiwAtCUwj+97IBoo+CeH7FsyuP27itEWdAuvuefk
         5XocFVRMHnFK/Trw5IaL9iMXBNdYdfw+OpsCOrZrUMKxGBefMzL+y+Xbb6KNW+R5KSuo
         iNkCU6KMrcLT11t7dlFEx4XfTgSbcwdnbtVW5MbWDnrGqaq8mttk5FMHKCXh4GVpCGTH
         /VHr+m6ROTCieTaEb7FddS9fHubL2BUbyTuuknIU5svGzaK113nU+mJAAg/5AdQoFrvl
         YvSQ==
X-Forwarded-Encrypted: i=1; AL+hErGlK17cUZhAszfzn279r7N22LhDagy5QjHEotziqo6prEeipsBc3hccgBnWzu5eua9yaT7nez45DBIW@vger.kernel.org
X-Gm-Message-State: APuU4Z8swWkB3avRR9A7trtqtvfjzEsTnVxSxSWZg52GawiFAsvwa5YY
	we/IeA9875m02V6aUs4h/qo619B/kn3c8FQ2VteQpITF7i1qYW17sbOhesZrjY0OWqoBgZfcZ2y
	nS2DrXPuQ+95r0UhcA1sgZOvhZI4B0l4=
X-Gm-Gg: AZFdTZfYF3KRLPxx7sHjZqI2Izy/eXrMtohGDo3DQP3F6p3WdjWtama3RuuFMKiJlzV
	ebNJTG7VMO/7mTArUlEjy8tg7qzgxPSJb5C3CML1VfvdGWXEHZIQu26I5ho4AU+K3UBnEJ5Ext0
	RhuKHbqJnibaUA5ose3T8JXBTsGhZyNO7RgN+tRDxsALaLnyvtOal4UNNdwCxqV9kd3PppgOtkv
	M2YdwZRhC5HwL89mkDKXxhsm1ivNno/9Q3DJTP61tIDJi8tD+BiPTf7aWvZJ9MIdA/e7UsE+L0y
	0/glBhpAxue7mt3wdXi7KU1Jpogl4I2ywr14f43DDzRhDRHdWfLZowL3if7g/UdX+dhFvm3XtfU
	yvTEDWcsCh+Ji21+V23j60u3M/wVMM/CIURYLhW4Ka2FAeh1avFc0mcIvLw8oWe6SUrc=
X-Received: by 2002:a05:622a:5a1b:b0:535:384d:68ac with SMTP id
 d75a77b69052e-55d769e9f2bmr449322421cf.13.1795798661145; Fri, 27 Nov 2026
 08:57:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <LKFsWplUk1yOr4M1dEHqZ20-Oo7ya-QA5qkF8u2lcfPUsbJYq0AoJhyjIEBwg6PPzlPSMYfqn6CB-sQBOuQDKQ==@protonmail.internalid>
 <20261127134507.125513-2-hikmahgumelar@gmail.com> <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
In-Reply-To: <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:57:29 +0700
X-Gm-Features: Aa3M54oyapQeOF2CNR5heqj_kowOsQNp9ESIWcAwgObVTh4Yt2mT_qD_BbMY_SI
Message-ID: <CADA=zOPBRrzdST4rwNwejXF9cY8XJUFMXc=+FR5AQMiFFdKPBA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Thanks for the review and the clear feedback on the commit message.

I will keep "leaving gcc_camss_csi0phytimer_clk stuck off" and drop the
board-specific reference at the end. For the rationale, I will note that
comparing drivers/clk/qcom/gcc-msm8953.c with similar Qualcomm GCC
drivers such as drivers/clk/qcom/gcc-msm8939.c, along with testing on
MSM8953 hardware (my Xiaomi Mi A1), shows that switching the 100 MHz
parent to P_GPLL0 with a divider of 8 resolves the issue.

Best regards,
Hikmah Gumelar

Pada Jum, 27 Nov 2026 pukul 23.11 Bryan O'Donoghue <bod@kernel.org> menulis:
>
> On 27/11/2026 13:45, Hikmah Gumelar wrote:
> > The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2
> >
> > with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on
>
> "stuck at on" or "stuck at off"
>
> > MSM8953 platforms such as Xiaomi Mi A1 (tissot).
>
> ah I see.
>
> "leaving gcc_camss_csi0phytimer_clk stuck off" you can drop the fragment
>
> "MSM8953 platforms such as Xiaomi Mi A1 (tissot)."
>
> > Switch the 100 MHz parent to P_GPLL0 with a divider of 8.
>
> What is the data-source you used for this change ? You should describe
> how you know this to be a correct change - the code is simple and
> describes its own change.
>
> For example citing drivers/clk/qcom/gcc-msm8953.c and
> drivers/clk/qcom/gcc-msm8939.c since they are very similar controllers
> and the 8939 does it the way you describe below. Also "it works" is
> another good reason. Inferred from your patch but not stated.
>
> More accuracy is required here.
>
> >
> > Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> > Signed-off-by: Hikmah Gumelar<hikmahgumelar@gmail.com>
> > ---
> >   drivers/clk/qcom/gcc-msm8953.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
> > index 8fe1d3e42144..8aec5600e837 100644
> > --- a/drivers/clk/qcom/gcc-msm8953.c
> > +++ b/drivers/clk/qcom/gcc-msm8953.c
> > @@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
> >   };
> >
> >   static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
> > -     F(100000000, P_GPLL0_DIV2, 4, 0, 0),
> > +     F(100000000, P_GPLL0, 8, 0, 0),
> >       F(200000000, P_GPLL0, 4, 0, 0),
>
>


-- 
Best regards,
Hikmah Gumelar
