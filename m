Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555BC53C3A3
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077353; cv=pass; b=TTaQty2DRExZYi5sY0j1dlFHNgMzqJ4MXiKs7HsEUlHGVkbfGFn8DIGYWtg91A63pS1RMzPeMN+z0RO8JXJxBfLp4swzLHXj00I+GGj9qnk1QaHkQp8j/aPDWxsztoxfeCb8wbgFrivfuyrXgwlhkLJtmj+mLzhfduidZXkDQD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077353; c=relaxed/simple;
	bh=IH6C2ITjynYuyHLytAInZHJ667Lrpx57dguMaAwX600=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8Zca7jGSp9DUx+/1aY/wH/OxwsROUySMEIzKCn/THVgo85ucVniQ9TpAX0NppAOmqL8VS/Zb7CIElm5AmYFpAzRPFytKLiVZTrNGPqlPzp84Gw9Lrw2udwXP+SiUJCRi25iGmmBqYFLQ6ta4oz41GhzdEfVGoqZTw+joQQqpvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKnu4UbX; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKnu4UbX"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so966542866b.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792077349; cv=none;
        d=google.com; s=arc-20260327;
        b=RX03WuFl2iTCCExG4gx1q8YB01VCmBBLK5Xv9Uat+uIweEgPpP2yP7AyjHN5ZY15bR
         1LcHjEXo80ue7JksCC0InvlHz+iqAcVQF6akFxUx5qf4wOCCYJ+DZuEP6Q+4AzAsw8bb
         uYeZfo3RxbC+x2L7hwIXr8MboEl944bsw5kVdTGMPLFJBZU3Uz6SGxmzHDdtRxl/VoBS
         o0fD0KELQGRbCWqpTeIcPrhOR97ct/kthO6qm1rKQRayP52mdO8MHBA0FKcsINF9r9Et
         9ixKd8Gj1JImyRk6iCpd762ScvxsqUUABevf2FG9fLu3854qxZ1uOwPsf0FuJit3Bg19
         lARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        fh=rhsr3vqYlJw+U00LaBhQ8pHt95yuI6SSdMNwdlboyg8=;
        b=TJgomgZqCdB7urKYZa29HgV/56RjKbH3qLpB2wVPdO4eWprjBc+l8Oor02vYYRuhpN
         vPO8gJ4kvJSXoelKsmHiZeCrnRcbztJfc3SNDekL1g+2k9S+8rC7wzkTFljiBWOfebJP
         SoU9kemxXpkQu6FAbRc2dxrxtcHjTRGgyxyLGBb83h6PWnaBoszhWVneOXRQaQm6rLca
         Kl5wNJMP0ZlkAHUf1v64u35XWfL0f2YD3/GmmOHERBN2etbPsX9TVlI+TaRuf6n2PX6h
         qaLTCHQv2EP6Zx43tjRLD73qqAuW9WpvlqSoP3/YR+DmR0bVV+cKrdenoPNlI1OZpD6w
         3/aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077349; x=1792682149; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        b=nKnu4UbXM55FqTwsXsL5rqRbhxYX57pXWxdWa1UIfw/Csfnu/EABonwqCW41UjrO/S
         PBC8cak+s77RlztOUXxE0XyKjCDRZBaDuFgLcfuMpFXYXH6X3LnIUoZK/S/dsCQMGDTt
         DJ1nkmmtzlF+s72190lS6CJoMmrXM+kP6VhRyIKVmF1eaSf7HuoksALVwaHXZag9tbIc
         4NaavsXfG1fqgEbIqqPfjb/Txg6crHj+1zmHr2zHrt1s8mntv1AFLb5IBO/6kXlElJea
         QJnZyePcN4+yaZ2edvoUtAbu3NHu7uZbbDNTAs8Mh1AU2piH0hpBAZVpLGvA0CIN0rEL
         udJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077349; x=1792682149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        b=XcvGUz+cYUYb5bR+nOhTh/hF5VFNlYfo6GBtu9P9NKmmZKP+Xdez85eY6N0m0kTaIQ
         rLUJHhJaxiAiCiw7KW5inaQ/XZooxm089gZyBaFZ1iF+xI9pc1YVcMMu2RNrF0sceiAN
         an4glhvUuQuuD7tk3pZxWnP+8hisGcikM20Uj5OdnsmphX29/DCmwGH+Hpchvq+W7etl
         7sBcMcs5duGcJGJzLD7F9Pitm2Rwz7jizp7ZoP4S8K8n6K5k9LduzAkiMi3b12lSPfpk
         MMeWCFXGEawvRj3ILhdAF2EllZMvjOTEOoelYr7DLQMRbLWF4ru7pEsBWFSzdiK/bVE6
         JrGg==
X-Forwarded-Encrypted: i=1; AKwUvBwlQ63haiVsCXR31ljugxmyBowPmC9LA8i1Zq03Q/PgZvn3PycDE+sAUeoW4HnH7qcp+8xTXNU26xDj@vger.kernel.org
X-Gm-Message-State: AFq9FYJVARbPjivCDmKpt3OPXunzo6D8ZZ7oAtaDTtleJPW4zIIQyxns
	ddcy7mY440Rj0MzqxTrrlO6mnNWnKgDCBMhh5r/7mIMF/9lnN00p4oAgUVlFPEqJ+T2MIx1Dcgf
	+iCrO5+vGB2RIO1N0ci/McjJerLdyhto=
X-Gm-Gg: AYBFou14aYEjZIcdUUIutTfE4z+rqGr7U4ESL5yQk0iwc+sV98FoWQNCTVkKfLsgxb5
	Olu5i6uJ2hcT/J+ZHxnsDt62i6EK4f+bc4ZFw6ye49IEsBzcDzIjIM+piYtfXNZio+MzZWlQd2E
	P3uSc/XZH87SYMbs6lqgKd7AvLMXW2t7FkrHN2GGH5mZ6RwACdkEBoES0D0wf+qwGfFrW/tmExL
	lObCtDw3yzYC0IyJrELv/0PhNchBaQSMEOtz9v32rDTOE9b2oS9ym3zyeM0BrbmyJQBEWKUTRZO
	rhvV2aaapW7dzAem8e+2TKE3+zGIS433PWTDl1BnTK96Ss1Yth2evg48CR8vA6MqzGLS6QPxR0g
	2egGXOqEYKXyE8O+M6V3J6QG2+FWZNDpHfgFoImmt+5Y=
X-Received: by 2002:a17:906:c155:b0:c2a:d65c:c194 with SMTP id
 a640c23a62f3a-c31a9d56761mr1838328566b.29.1792077349343; Thu, 15 Oct 2026
 08:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
 <20261015051926.13752-5-sreeshankar0910@gmail.com> <179207236622.28934.8455006218721757519.robh@kernel.org>
In-Reply-To: <179207236622.28934.8455006218721757519.robh@kernel.org>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 15 Oct 2026 20:45:36 +0530
X-Gm-Features: AclHuK8CtOHEeDeQkZ6GhBte8PNJPOJgXaJdB95NIQjYT2X3-p2J5_V6n9AGVI0
Message-ID: <CAA-+uk+iNj0TxAkUgGSHhvBjDf7_EO_q9Zv6N1f+eoHBJf=q7A@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] dt-bindings: interrupt-controller: qcom,pdc:
 Document SM7250 PDC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, davidwronek@gmail.com, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, viresh.kumar@linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, danila@mainlining.org, 
	jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org, sboyd@kernel.org, 
	konradybcio@kernel.org, andersson@kernel.org, radu@rendec.net, 
	robimarko@gmail.com, bmasney+clk@redhat.com, rafael@kernel.org, 
	tglx@kernel.org, mani@kernel.org, linux@gurudas.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 at 19:22, Rob Herring (Arm) <robh@kernel.org> wrote:
>
>
> On Thu, 15 Oct 2026 05:19:24 +0000, Sreeshankar K wrote:
> > Document the PDC block on the SM7250 SoC.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Applied, thanks!
>
Thanks,
Sreeshankar K
