Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8477230C144
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 04:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782275293; cv=none; b=PmItvRT+58SqtYHUiJwJIDYpPbxpAQ486qa2Eg5wvArH6zCsFyK6Q6KOsMSK/Pw61YdtgEltAV11edad5YNpSrHTY8GDQr59XkzFnVESFSPT4NmUb3fQaY9pY3PNXuppnEFgMRPc33PlhSO4etWL4Ial46mIDfW+OdBDPzXhDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782275293; c=relaxed/simple;
	bh=CatfsTP8wXiX+fsqwI5MUAVJoIpCzIOidq0t0/coTaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/99eWdDnwvyY/G96cN0THmINIXqLANzMO2gCCkRRe+MH+xLtuh59rYCOHh43WbrmsDr4shqm74gpGrH/TDaT2w6WoEUsoGyrvr8DPvMNR4ol0CiV/6dPd0Yb/XYSig/xeE0kqdWuMMV4f+U3sDFOhO6Iuwob59Ol70Ien8HSKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYhKUN2J; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYhKUN2J"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bf132969bso770272eec.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 21:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782275292; x=1782880092; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EEdnK3yMj7vaMPJob7ZvZ1mk4WeNg/B5FxtgUQVR5Lw=;
        b=qYhKUN2JvsDeCQcXG2CFYYYHESi3M4W9NrqLLmN0s4K5e/6fumhDEwdAIa8weo7sNJ
         cTRw4u34s2QV1nP95cqA00iKK0rCYKBLwsbvIYJxQ+HkYzQLXpC9Tgj8A1SUhk2XSftu
         n+73V0qDaWHErvlo2PwDVVdDf1vuw4ceFaaGd1MmpjcmcGYmow7GfDYIYluy4fYzN3cu
         QLi5B5El+xhe34yu8zpIdDx2W8f6pJrNX6ta6XDAb2kRo8tIhU0QLRFiyvIfQqQapifL
         CtGAPc2wNo4vwMxsHgV9L4ahVyjQFTcNKbFjVvO5EGXUWOLB29zlpsUaUI0W+bi41i3m
         s+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782275292; x=1782880092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEdnK3yMj7vaMPJob7ZvZ1mk4WeNg/B5FxtgUQVR5Lw=;
        b=HAIgTON1NNhBNWHha9O4DS5cRWKTr93emcTuZJ+7dlcRfaZ8PZhR4NLLlHY1IN3njq
         jnTsy4ictXWREhThj8GQHEWba2pe/J9zJoU2bBGkUadM1rISEftl3LUGfBR65mMq4VSv
         GfSYOGUMQP8Kgz1z4tSyERrA5SEmUGkgOEZWclWOMvVt83YnY1FtcjLT/N++RsuhEKm2
         sMpNcEOcEkObtISNlek/OM28s2MUfK7QtVB2tGrV/XM71EwEEN15u9ZAopj4KbOLAJED
         CRLBCO9uoa2lAyW0LRgTLq709YVv+HXuvpxjVecSG9s7yg8deQMQc0F0HEN6YgSY70V+
         bVUw==
X-Forwarded-Encrypted: i=1; AHgh+RoJ2Iqj21GKk2oBphvbcYfG3ne1b/2DRUzE1d7BfNQD+35I6Pz7NuPjb3QNhbYiRzPD3jAl43jl+xh9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw85MjicVCazHkLtm8iwc7yFmv5ZzQB2ohozEMN66nJX38OZfxH
	yztiO2YOl3hH4xkf2scUSNkSdT22NwYXNWgg6tHDExoNdNzFp50+zHtE
X-Gm-Gg: AfdE7cl1xCeTDZcSARiCq0K2Ih5YVrrpd2Sin/UfObOewmrt2uFjRsT0GkDZBy1el+e
	sebvTWtFokhl17GqQEFK8b+GALwD1XqrAaVhqnPqHHmuzc8adAHxOm56tuVmPuZ6GVjcRWBFZe3
	RQWy/+2AtwbqhbzQicInuBnJphQTip7xBYPS3o7gmay0te2rY8Yee0wTkzm7ZO3wtE5j8phCG56
	ApIOeX1YXoDpIwd8gnfzk3OUyNt+o3HqoUDEmIA1zxGLheZ9eU9l+xU1vaaS4Fzp/qTdJh0qwmg
	EAKLRrgkoMgbv2fPo6vijD0zlnKfhwL7ssqoZfNUbf+lEVMNhjkcSJnB6uT5HS4IBA2IFK2CQ5M
	jk+0/cUcpey4luK+lGmFhdgjQyRlRSHprM2pmp6Pyigdh3WSMw6hMTQmfXVpFmh66R6wGKhlNO5
	tj30PyQMdjKpe/VtqOwbVg/jVADcAgiCrgnAzYe+1wmmFfp++FcGLBXA==
X-Received: by 2002:a05:7300:5415:b0:2ed:e14:7f5c with SMTP id 5a478bee46e88-30c68e42cfcmr2209522eec.32.1782275291490;
        Tue, 23 Jun 2026 21:28:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:6026:1e6d:4a80:9bd0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c6f4993a1sm640193eec.17.2026.06.23.21.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 21:28:10 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:28:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vincent Huang <vincent.huang@tw.synaptics.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Update
 compatible to include model
Message-ID: <ajtaUb4YmyZTDLmQ@google.com>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
 <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
 <ahdoBl3qCTyvlYJf@google.com>
 <1d0e7e31-f808-4347-955a-7246dea208f5@ixit.cz>
 <742c7a13-9465-40e8-8990-e679712e9784@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <742c7a13-9465-40e8-8990-e679712e9784@ixit.cz>

Hi David,

On Sun, Jun 21, 2026 at 07:11:45PM +0200, David Heidelberg wrote:
> On 28/05/2026 00:13, David Heidelberg wrote:
> > On 27/05/2026 23:56, Dmitry Torokhov wrote:
> > > Hi David,
> > > 
> > > On Sat, May 23, 2026 at 11:45:35AM +0200, David Heidelberg via B4 Relay wrote:
> > > > From: David Heidelberg <david@ixit.cz>
> > > > 
> > > > We know the driver is reporting s3706b, introduce the compatible so we
> > > > can more easily introduce quirks for weird touchscreen replacements in
> > > > followup series.
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > b/arch/ arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > index 6b7378cf4d493..148164d456a5a 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > @@ -475,17 +475,17 @@ bq27441_fg: bq27441-battery@55 {
> > > >       };
> > > >   };
> > > >   &i2c12 {
> > > >       status = "okay";
> > > >       clock-frequency = <400000>;
> > > >       synaptics-rmi4-i2c@20 {
> > > > -        compatible = "syna,rmi4-i2c";
> > > > +        compatible = "syna,rmi4-s3706b", "syna,rmi4-i2c";
> > > 
> > > So I believe we established that this device (s3706b) does not in fact
> > > implement rmi4 protocol properly. Why do we have "syna,rmi4-i2c" as a
> > > fallback? Shouldn't it be just "syna,rmi4-s3706b"?
> > 
> > The vendor supplies s3706b which does implement the RMI4 properly.
> > 
> > The 3rd party replacement impersonating original parts may not implement
> > it properly, but I don't address this issue in this initial submission.
> > 
> > With this compatible we know which original part is used by the vendor
> > and installed in the phones, so later we can deduct specific sequences
> > for the replacement aftermarket parts to keep phone touchscreen working
> > same as they do on Android without affecting other devices.
> 
> Hello Dmitry.
> 
> May I ask what is currently preventing this series from moving forward?
> 
> The first version was posted in 2023 [1]. I picked it up again in 2025 [2]
> and am now on the 9th iteration (this patchset). At this point, the series
> has been under discussion for well over a year, with relatively little
> feedback and increasingly long gaps between review rounds.
> 
> The current approach is based on the guidance I have received so far,
> including suggestions from the device-tree maintainers. When concerns were
> raised, I tried to address them and rework the series accordingly.
> 
> What I am struggling with is understanding what specific issue still needs
> to be resolved before these patches can be accepted. If there are remaining
> requirements, objections to the approach, or technical concerns that I have
> not addressed, I would appreciate having them stated explicitly so I can
> work on them.
> 
> I also split out the straightforward, self-contained changes in the hope
> that at least those could progress independently while I continued working
> on any follow-up requirements. However, even those patches do not appear to
> be moving forward.
> 
> Could you please clarify what outcome you would like to see from this
> series, and what concrete changes would be required to get it accepted?

I am still confused about how you want to differentiate between the full
RMI4 support vs the OnePlus flavor. The "syna,rmi4-s3706b", as you
mentioned, implements RMI4 protocol properly, so we do not need to
actually have it documented neither in binding nor in DTS.

The issue you have with after-market parts that are not compliant and we
need to figure out how to deal with them. Inside the driver I
essentially need a"incomplete protocol" flag that we can use to
implement additional checks or skip known to be not implemented
functions/queries. In DT we could introduce something like
"oneplus,rmi4-i2c" that is decidedly not compatible with "syna,rmi4-i2c"
and neither one should be a fallback for the other.

This of course needs buy-in from DT maintainers.

Does this make sense?

Thanks.

-- 
Dmitry
