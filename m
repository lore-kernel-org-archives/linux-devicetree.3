Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DC9453A45
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984750; cv=none; b=tYNTqnxZOY9CkJeXSHsL6Fu2N4PCnnXCFn7N5AbQBtCLIz/phQ/ocw6XkwznA9kTNblypt3DdGIYoNltgUtwJ5O4FxeFgoWH00GN4gQzSMkOQezQZWyVZW/vW0q046WPSXOH3xoDwxMlc3URj4ICDqBaQiTeGDNSVjmE5/e76Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984750; c=relaxed/simple;
	bh=7kYNWja8CyH8mpneiEndqSwrG6PwJCW7ROzqwDBd8PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKTXGzOkt+Gs/1XUVNSJ/AhitutZ9tqMLqBPPOtWnw71FxRbiP1pm75lpKEtfO9+0xcFsJ5jatzOl4KDVvQiaE9DxuF8F2bIzbTzzaMSsxPcMbANrzNpveORAG5q7CKYu54EGQotZWxHzGEu0ShVbOdbVWNE4L3uvbGaKPGGfY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e75rfP92; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e75rfP92"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4262171a91.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786984744; x=1787589544; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDW6+B1/6deHWJRz59EqQ3HrDNwA7V1iNa634fXxC5I=;
        b=e75rfP92+8fC/1P2vLDf9aR73+Q/sr1lBCoUtZEM0XorrxWlzLRgh89CTB0XHb9N3W
         lwvaei9B5oXOCEtWpYe+3RE5/Vvxb5rNH/XCbhDsjkKGIUcNfVDVCk5/KfCIlpqNNlg1
         C15A5Bd8nc2cL2tCqBbevxNKLGQEVgLH5tyOZZD16FfJaQhyFm3/2MH7Nf2CW0/46sUz
         J/X3sd4IdpdZz9UgpUzHXxiI8JdZFXi2LpW3ySBEzyhF7CF2z3SU5g3u1KDFzN2MxAFG
         JoRk4QvmsiST+OmcIgO6W6tNR3q2trVW42SBS5TWYN/aDkU2dlEknCfq2reM5QNizYtr
         Ka/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786984744; x=1787589544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sDW6+B1/6deHWJRz59EqQ3HrDNwA7V1iNa634fXxC5I=;
        b=Q97bmeN+xA0IsB7wpx90gl3yctdFXOJ2NOiiqPf3iTNimrb/H3H1h/SqamVVB44NQr
         UKKuycx6GMNvWZ0Ty1/2lKoIbY7zBO5KCdDmfsWebIfOtzhNVUJkwuaASAVo/OB7k9pC
         CclCy2UC9FEYFitS0esX5JenVOFPn+zS7p/HtKnIoC2eVIwWY+vuOyfpukjZC3dacEaI
         PDM4VGwCMjPM03G/2EdU/uGhsTqtAbzskHR3tBe1AIEcj/W6raTB5Q11KBmTw8A1Lu4j
         rrmhU+oZRrT5GGC6O69lDslVNGwRnUyABns7aP603+MTewvmukdYTaxDyW9NFFC0j2bX
         UsaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwkkzGYzPft46vOTIRCs7D8zXBDVoSdOTXeRM5DqBPvy/ehtsF8q2jhL/pvFp0s760MhNhD0+2euSx@vger.kernel.org
X-Gm-Message-State: AOJu0YwGFiXIPoRsdTEoy+ipHEEiesAv8tTQdn80zTA0ZC8W1mF217tf
	b9zg+EBEZY0INt1MgARuG2naXSXOTRwsxSgqXxMnSNUl215Vfvedvt/pbu+1nSYXVPIrfGSvQUv
	535vj
X-Gm-Gg: AR+sD11yr+6L3E9xMKl7yU+Hnu59qxBoYIvIf6atN9YvTkNrDA6D8TKJ/toQaUJZ7G8
	0KsTwTn5wzPCSIFVt7BF8W+LubSoFuvrr4RPalnp38tClydsKUc/kvZRH9X+gS6Qb2bDsDgKBIT
	9buExXlHooCfP76+C/2yyLtzNEfdgHpyT+YAgkGxGUTO9dHS7GiAcq4HCPOqioI+n2Lvgwcvm3J
	yDvO/XKHNvzl8UDTY8hAH9Uosj5y9ou5E96p69+aGborQEIsERfbAxLrYqNJL+OMyr/bKvg7sua
	x1ruZv4E38Pe9g5FazbREWptePmbIe8s6fbuxJsu30Q/IwWJJCHHE+CjguBgWkoBEkNMM288fMd
	OBbKhviltbeVhh4oRkd5GeSaJvEEExpefs0fApxe5us9ClGvmXLXkqeBg2gB1QJcysmoXe6xJgl
	zyscRSAk/XepBlT+eSgAPndElvzM89YySLjucMvhJr/HIYjqCyqBqOyQFwVCp1P9qU
X-Received: by 2002:a17:90b:2e4c:b0:390:b41a:b92a with SMTP id 98e67ed59e1d1-3933bd0d632mr29846740a91.4.1786984743634;
        Mon, 17 Aug 2026 09:39:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4474:5926:fe69:196a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm3029317a91.13.2026.08.17.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:39:03 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:39:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jiafei Pan <jiafei.pan@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Z.Q. Hou" <zhiqiang.hou@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
Subject: Re: [EXT] Re: [PATCH v4 1/4] dt-bindings: remoteproc: add
 imx-rproc-psci
Message-ID: <aoM5JKcbc4AxoyO_@p14s>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
 <20260812104633.22420-2-Jiafei.Pan@nxp.com>
 <20260813-imposing-blazing-gharial-fbb19c@quoll>
 <80dfac6e-3408-4f62-887d-9da39c827dd5@kernel.org>
 <MRWPR04MB12277AD3869C2AA396ED9A5BA8ADA2@MRWPR04MB12277.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MRWPR04MB12277AD3869C2AA396ED9A5BA8ADA2@MRWPR04MB12277.eurprd04.prod.outlook.com>

On Fri, Aug 14, 2026 at 07:37:36AM +0000, Jiafei Pan wrote:
> 
> NXP Confidential
> > On 13/08/2026 09:49, Krzysztof Kozlowski wrote:
> > > On Wed, Aug 12, 2026 at 06:46:30PM +0800, Jiafei Pan wrote:
> > >> +
> > >> +description:
> > >> +  NXP i.MX SoCs integrate multiple Cortex-A cores. On certain i.MX
> > >> +  platforms, one or more of these cores can be offloaded to run RTOS
> > >> +  or bare-metal firmware as a remote processor, while the remaining
> > >> +  cores run Linux. The cores are powered on and off via PSCI (Power
> > >> +  State Coordination Interface) CPU_ON/CPU_OFF calls to the firmware.
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    items:
> > >> +      - enum:
> > >> +          - fsl,imx93-ca55-rproc
> > >> +      - const: fsl,imx-rproc-psci
> > >
> > > Hm? So you just ignored the feedback?
> > >
> >
> >
> > Ah, you just did not bother even to wait for my reply!
> >
> > After three months after my review, you send reply to my comments and
> > IMMEDIATELY you send v4 without waiting for me to address them.
> >
> > Srsly, if you have three months, then don't you think I deserve more than 1 hour?
> >
> > NAK
> >
> > Best regards,
> > Krzysztof:
> 
> 
> Hi Mathieu,

You probably meant "Krzysztof".

> 
> I sincerely apologize for the poor timing. I was not familiar with the upstream contribution workflow — I did not realize I should wait for you to respond to my replies before sending a new version. I sent v4 immediately after replying to your comments out of ignorance, not disrespect.
> 
> You are absolutely right, and I should have given you adequate time to review my responses. I will make sure this does not happen again.
> 
> I will wait for your feedback before sending any further versions.
> 
> Thank you for your patience.
> 
> Best regards, Jiafei
> 
