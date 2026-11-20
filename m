Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190638;
	b=zvGXqBS2qISkSTIZmO8cSss4arC+n2JL8uY0wLYZteMIMLvbUsN6SDjtyz30rJPqY12a
	 1+5ijjn4JCaOFj04iS86wAw+pk3cKvOofJxilpgRb/7QXizJ8zqL7C3KMg1ySMlIyLCjc
	 NlWPnJ7K4wfnuugskxHg1HFrevuQBs/wUF/RbD8GqJJ5Phzr2WsMdn1Qu9a8+5FxhZF0U
	 cLfnEDTZCpt41LeQSXqqpJXVv1AVTxynUBTK9Ki2VduqD+d4PD+Fff1KKfHZxzo3D6mwt
	 VUQ/HzPGLNVRdzpxz9sxNdFZ84NFc+AA46kZnd0EjCOVsRbgARzPlSZF5hRjopG9EEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
	b=w5kjm8Wpx4Y5caP6KFCf6uAMo6bMJltcYwV7Ehcqcqlg9AbpO4Rd4EfgSqpaP6LeywJh
	 xeI79k2P3VwHHuMMnHlyVkRb4i4MVz+Wa8CME2mCRvU7fjlOGfH6a5OCFuW2SzvG2KlK7
	 NrNjsvluaw6Z0UraQJRbmOiMH3iVO+0aYV7sMJuuCYXDp99iVVLnW1I693WcCm7+umqBJ
	 5Sf8U2xnXP7QnAAfiJjD0iOOAEz4YJpMFH1mE8CgkeJkkOPzYBSz2/ARqVpBqggqqIQpW
	 4Sd9ExPGKi6aIfw1+pk6pCKsCqydlqBKRsEXJdvhPmGd7axAAd2W07AMoKlByyECsrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hrq3427c;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EB3606A333
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31EB3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hrq3427c
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso610715a12.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795190636; x=1795795436; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
        b=Hrq3427cOfucxEjOLLtbn2V4Cn1I00ecESZQvbznHtS+Ajucudltlbk5Kck6unjyzP
         OmK8MbnL7Mf7FADR5bFMEwielqji3tE/hegkZl1JBYBqibn9fMx/M/kWY0bt6bCvutKF
         aBQMtnl8cZdm7a7ZsFjCMIBIT1A8QH/yolEFsIptwyyjBiF11Qfuv8TYl0ESY/4y3Z+T
         SMZbAQ50cOmBtYaZBCkC1hhEYLjpZTkyDu80tlezaOgXID8A4rFu8+EU7yDlqYusjYqU
         JlKmHzP49QAQaxUb3+eRiyMnJ5lAq7crkIfXr5wGkh2+st4AwCOhOmjwHuob3zb4wrc9
         qpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190636; x=1795795436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
        b=GZ3RPVgtUPDHmi/rlL8NHkKpG12XD3/ttf8Zt/vjcq3wyiNsZJAYYtKD4wxzmv48+z
         ljBFaHaWtfXOXa7+2YHxZFUg2olU+zsT9rei+SE+fpoUyDl0juv/q7lqelyM3n96EWTS
         GaJ3bd93en9T9Do0ZXmCdrGPRKMRs6c5geri+g27AB0Jh6fK85W2QGuwk8JX2cTPS34f
         NLYYNFVWlkFdBrcCukuPS9IyF12L+XiSoqqkV3gtec94coGeymEmUNlBxmNWXRLdm2fw
         trP9jfE98nUlGYKDCPZNNx+JZmhhmkaJMDyPK6yKUSFbSSGKawZ+Llr3nhTTHekgwGa4
         Fawg==
X-Forwarded-Encrypted: i=1; AL+hErEDosnHlZfO/UE6KlGyw2sJyOTnVFgtQjU54aLeaSOBUNm1Y46iLCrfr1PX86qHbILZEKIw1JGe0eG+@vger.kernel.org
X-Gm-Message-State: APuU4Z+7yJfVFhM4aqPFmASWDcXtJP81DmVy+InNVBKYUx+h40OPBOfK
	/Hvwk0OSZc1hEiwn96zR2vUae/y95bfEJs7rX+OExMSw23GBf5PA+TR0cirARMwbFnw=
X-Gm-Gg: AZFdTZcgXehchzLqgvgmQwCpNnXR7UMmRbkWhEgMu+ppHvMxhubV4xxAYTx0DXuc0gQ
	UXVw0jAdtkfzLTtDXbWNXBUFQZimY9Q5QuzziROSgRC++j2UpsJP38dfiYgOXcLMuBmmYOTgWGD
	lKThZgwNxWY1hw2XRohJNcNj3ObjyxItQ+2rMWvuQvo8IwVMac+LPKmDgcL3RLuIzYAhQZHx/dz
	4cLkfY/eWBzk91+4T3wCVs98tHRCS4aI+D/qxepeDIFEu3019CXw84dXr9dcCkHgNwEekdyWw3+
	qhKadJsOt752lk/HUoWO3YB9Zpbfe0LAeuno7XVEUHewSHPyInD9HzdX1TU3VPUZSRcTWMl26+l
	pRh3AvcUgeqVKuS6IT8jcriKmSFKQ/Z2fRQhe6SVy4t6sfcbLHbdIbu948WEog6j4cCWsx880X3
	EunqLwXBInuXDttcvpSTOLuSNNKxw1NqmVoPVHdFINC4sDWtkuv9yz2fVcivkiuXbM+hrgIiqlQ
	DT+HSEvpZFIFovwaWShw0HieCJ1oDTJMOGdHdMz/K2DUO7y0j6z87+TpkD6/BIsX5KWUKJfOjKz
	WDltEvhchidamgjspagqhXDMfhyKYThS
X-Received: by 2002:a17:90b:2cce:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b41c95e0ecmr2249223a91.33.1795190636291;
        Fri, 20 Nov 2026 08:03:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7124:798f:1b98:bea5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm4809307a91.15.2026.11.20.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:03:55 -0800 (PST)
Date: Fri, 20 Nov 2026 10:03:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/5] Enable DSP device for i.MX8ULP
Message-ID: <awBvaca7Az__X5Te@p14s>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>

On Wed, Nov 11, 2026 at 11:18:03AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The debug reset control is one of the HIFI4 DSP’s reset mechanisms used
> by the debug interface; add documentation for the optional debug reset
> controls and update the driver to use both the soft reset and debug reset
> controller APIs (the soft reset is already documented).
> 
> Add a HiFi4 DSP node and enable the DSP on i.MX8ULP.
> 
> Changes in v3
> - Split the previous patch 1/4 into two patches
> - Update the commit message to explain why the reset properties are
>   required for i.MX8ULP
> - Update the commit message of patch 3/5 to clarify the switch from
>   direct register access to the reset controller API
> 
> Changes in v2:
> - Update commit messages for all patches
> - Require the reset properties for the i.MX8ULP HiFi4 DSP in patch 1/4,
>   as suggested by Sashiko
> - Use sim_lpav as the clock provider for the ipg, ocram, and core clocks in
>   patch 3/4, as suggested by Sashiko
> - Rename the reserved-memory node from dsp_reserved to memory in patch 4/4,
>   as suggested by Sashiko
> 
> Shengjiu Wang (5):
>   dt-bindings: dsp: fsl,dsp: document debug reset control
>   dt-bindings: dsp: fsl,dsp: require resets for i.MX8ULP
>   remoteproc: imx_dsp_rproc: use reset controller for i.MX8ULP
>   arm64: dts: imx8ulp: add HiFi4 DSP node
>   arm64: dts: imx8ulp-evk: Enable HiFi4 DSP
>

I have applied the first 3 patches of this set.  The remaining two will have to
be picked-up by Frank or Sascha.

Thanks,
Mathieu
 
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |  4 +
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 34 +++++++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 23 ++++++
>  drivers/remoteproc/imx_dsp_rproc.c            | 76 +++++--------------
>  4 files changed, 82 insertions(+), 55 deletions(-)
> 
> -- 
> 2.34.1
> 
