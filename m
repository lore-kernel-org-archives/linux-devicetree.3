Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109004;
	b=ubDFHgIC44h7fkfZd5M2wxyvArYm/Y96PJYNEMU6/H4eXvOdyrc1uwxVPMGJRe3sUEYw
	 A0LVTADqsekXR9XRFTAUymUVbbRw2bn8vhiIDrJsecLsCvVSdd1XSyFlUa0zITWhwFueX
	 Xd9Fj82IWmwOU+EZKbSBiP6CmMDPU+l2rGczCENjCaHk/xN/8XUL3uHM8E2SMzi0lIHAJ
	 GtWphN1NEqxuqsAhBcBiKPYwmRkJR9WCggu2bqph6iX2Cef2w4OZM3ZkIOr1Svb/ePSgy
	 mmFgA3KKgktirYxzkAxf/l2uCZzlFfSuGiIG/z/mQFXj8k+6coO0HxKmETmBzCtL7gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
	b=hIngoY5BiX9vCjHefOucw3lbnsnzEyXMk+Q/+pmGMEmVuZWql8ewDx6NexO+KczLtWYK
	 HulZn9eouMO0h7Rj1u3cxh5Cf+UvHeeGVqwzR6HOdyVeK0blcvNOurggtanov+6fMpTLC
	 52nVUPSdDj8d+VdNPvNFsNdwxyVZh3I8dVsKtBGVoDL2mM/7Y8H8faj2AhjMIiDa7KiNX
	 lYIQF5QUkiizTiSK8nZYf1RWs6pmACdw78tZ8e0zkJv/vo1rzV4H3z4pNRfDPjQWdY4YK
	 P6IlZBFxUO5kLoejoqHlBNUzA23fRoUpPPFiuFzZ/GTrQXPYyiW0cdEJqd30lZYYwoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDTkuBxG;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281F1606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281F1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDTkuBxG
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f1cf92c9eso499841285a.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109003; x=1793713803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
        b=gDTkuBxG9wEyZA26EZszhG9Uh/3rX/19W0sqMYQTMrJDaJUmzcVQj8Q5vsjyJxkhrZ
         ej191n5HdezQNZoWYNpWjnSH87R+ugN3VQYeIPp/zC32VuxNyAMnkNWAKDZgLSlOh8WE
         RdAuF+Zg1uwYuVkS8mWy1z80DBLeT2FyCRuFH1gvw0MbLw1U4udivwWLPpPvGFR2Sn7G
         NkXmzdCN/4KlmwzL0WafjR6fS4/vKwQlYLNnxgh5F4QV7qFrZioFlDVVQ2/1mLd/v99A
         vLdxmNi1B8dVQTg+3RTCB2njXv82jd1gXawVzEov8pDFcu7Boxi03mj5uhtfxinaBtPu
         kBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109003; x=1793713803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
        b=jtYPzFeQJKmpd0HbWkLBMsuu4zwdwXZv6pJWFNnwozLqbUxY/s8RPktIGEj0EI889K
         YXTQuBdaZxdxC5aEfWmXztxPfn5YwNkDU+Y9ELdAjNsopYFrdiv6weIvO5M5fY0o7CON
         LtpmvpY9Pl96flFGyo/3bH2HnBDNMBVuaymhiN2+7hRBSwNpG0YQosjqX2TfIxM/X6p9
         aIzQ5ThlwNBxlEnHkRdwT6e5fVp+T0sj/Udl5L0iyTlG4jpgYGvkwbpbPlpGa46aAe7i
         WzUk7CtDagRV1mNgA5b1Ti13fb6Ia8Mr0IAU2YxakNjIe756LXJn36MRJeZwK6oo2liE
         2efg==
X-Forwarded-Encrypted: i=1; AKwUvBxnj/siWgZVaNTBR/uvP1PDw4rIBK9regUUzohTJ807EbMTM1kYQQq40YsfaDGBrmnahY19Tu33P0Ej@vger.kernel.org
X-Gm-Message-State: AFq9FYIW2+hvqrCekmkXYnXVCweOQwPG62JofUKZkljGJz3yhihx8LXr
	LcpSIlPMVPh5gDyjOsFjaBDC0PT86krjaTUt6zDhPza8oQdp/4BESg90
X-Gm-Gg: AYBFou2IuMY7zLO2jZmUNTRA7YmUcfTaFRAfIGzK9Lw0TsVvyi5MaBsejSdL4wjDvBA
	R5Sig46SBmvT5PZU1lCQqH7YCJcNTVFM7SxJ2DqUd2jUte2AURhGR5md/idysLT8zRRw8MNpqq6
	C87AH+ns8MxpzseUE/e7AXTjVg/awrqbUoElpzLHraeQ16QHUe0Zy6eUYRxhg3/RR4IR4nl+Zkh
	yD1eESVExC2XIHrpGbnrWN4TyllZxlHcvAjh4NVN9yayBo1HQrRFf8Meklu7LBrLkFIt0YkHFYK
	YyR6ijsjZD/kmzscIbk/Jto3NElOQFVcO7uYcNMhyLDYCVfeGrhr2b/wFhk/TJHOglNMjnuTNHt
	9ZahXOJqbTeIZ08UJi+W+MR4Re5VjdUIpwMm1IrSLC02M2k8YMamfLbPooCRfRLvT0BA1FW00DT
	vsGCTVJbOut1PN16kJ3bzUKG+vgrCWnfKYoCLqNhy4VTZggGQmc7xgToEr895qvfqlMNXd7vzXa
	BK3zZDwa4TYVxyjZiJsg1BnQg0EPb5ye+VFbzA2AvQnxbWXt2SJa0Mx3A==
X-Received: by 2002:a05:620a:4152:b0:93f:565f:e40 with SMTP id af79cd13be357-940ef98bebbmr1567887685a.65.1793109002941;
        Tue, 27 Oct 2026 06:50:02 -0700 (PDT)
Received: from localhost ([141.117.117.39])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b1adbsm978781885a.4.2026.10.27.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:50:02 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:50:00 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
Message-ID: <auCsCPL7gK2lIR5q@rdacayan>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
 <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>

On Tue, Oct 20, 2026 at 12:37:36AM +0300, Dmitry Baryshkov wrote:
> On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
> > The Audio DSP (Digital Signal Processor) is responsible for audio and
> > sensors on SDM670. Add this, along with the SMP2P nodes used to
> > communicate with it.
> > 
> > The sleep state is included to prevent the following crash:
> > 
> >     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> > 
> > Otherwise, it is unused.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
> >  1 file changed, 168 insertions(+)
> > 
> > @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
> >  			#freq-domain-cells = <1>;
> >  		};
> >  
> > +		adsp_pas: remoteproc@62400000 {
> > +			compatible = "qcom,sdm670-adsp-pas";
> 
> Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
> fallback here? Then you can drop a driver part.

Actually, looking at downstream, this should use the LCX power domain.
Can power domains be omitted like on SDM845, or is LCX important enough?
