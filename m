Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879984519A0
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774704; cv=none; b=PmkKIBv552mSzAEnMQs62J+hss7ORgYyAMd++IO3OAMBzV68c13zw9M3hoyhSiskskBbm6utgTSzWJJtlyEaO3UmTRLTykuodM+Li8UWO7gH1yj1qsnXmxCzyLyjsWX7Bs8lfR/dcKDB/LDOFIDp0RQd2h9vEaKuQmlDXco12Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774704; c=relaxed/simple;
	bh=GX1J609L4ewNGoSLCdkBnS5971JofKvzcxEp0Pv1YzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eC67P11YPdGRuhKQKGluaLfeQb8fmIToq7xroS5IwvrN3PodE0+ThNpTB4m1SRxLemh1EKSr1tnobf9NAjVaHGL7A7y8LS7hrKx3OVgVjE7zv4nT6Ox3oMo2wGIh3togfd/pVV1uznisJBKw3OghAAIHaFbOdN1siA1LTnq3wd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A2yNuO0T; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A2yNuO0T"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b5e50eb70so44745e9.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 02:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788774693; x=1789379493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=prkpaaH4PtZIEL1VXNG6kV9VqH0ieRh9wbQ8pDJm+gM=;
        b=A2yNuO0TsXVD4xfYrday9nCp05jexL5DZfB/G7/fIKu89X6oO+jvG+e8HjKs1xTVbh
         Mpl8Uymhly3/OzkvdQrMujNYaM4SdWG/QpwpdrFOK27PYqnnHol3YJDpyJ27Whh9ATJS
         NU5o356J8VNfDeLra3cQ4m1sisthgc9J/JNFIh97zIQL+9Vfp/MfYJgzONkMVNdSE61P
         LBDtRIZdrE3oVE+SaJuRUOEB9YPdGCWyXtqVDIIhU8jal3vK1t/0OCOLVeENCAb6gr3L
         n6wY1YVmpPcPTHN7rLLVJbWe8JLMHFuIFTwvNcnuUp6vneXQcddA9bZJfwDi/WVTLU7d
         N7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774693; x=1789379493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prkpaaH4PtZIEL1VXNG6kV9VqH0ieRh9wbQ8pDJm+gM=;
        b=ZY/h3SuCSiwglW6qd72SVdTmsxNCLvVryxSnD0b2yYZpK/X3ud5XH7MG1irxf6jCTZ
         Jsz1IJ2U3PKdPORrhKeCpDCUthhKtGebSNQGFiejyyapjsnm2cPyDM4Ps/Mn/kTLbemL
         V2Dok5tioa2nE3wpNA6ba4mNykIPT5DbYP6cyHyGGLG7f93vdhZGD+iP3b2we1/Vl0xi
         xiGVenLCzVNwvLPIg0e9l4KIQMN1kE6HrzuJU82ncePQ2VitcKldLMRcQIsIn1PMVmfU
         vHeH7ZcC7rZ72c2mAIWs2/R2OBtZ+saB+lJvCSCVjdf5dk7CP5zE13bfqqgVo7VZ9wi3
         dpKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7YD5JCkTUZaTrH0QLwE+MEq0PsFR+YS0XTmw+ajOLkRnPaY0WIPqdsBRJx0/BWUW5UTJojG3U6ZsV@vger.kernel.org
X-Gm-Message-State: AFuF++kytyMD81/u9oWnvmE9ZG2e+dDmyL9yBr1W3jWt0O7nHf2Mhs35
	W9YFI5GedlkzArfLo5/Fy9RaLDXps34PPytCXk7TyPS4+XLvLg6gAfQPY1ht7dJfEw==
X-Gm-Gg: AYBFou304+rLHdG6/6/6zNSPjMpV5JAzD6Q46WOYT1A4LdJKqhSmVy+i7i6GKCuI0EJ
	25iCOjVPdFTYFlk4am0xMLGr3pG0hzruykRrxc2tmrXNPf8XsNBfFLIHay414N6NvjRBV2HaAsX
	p35TA5s+2bPBr3wgpv/soKMNJwt0kNYKF/FP4p/yeARo/I/hNZhzgBcRmQ/jkqsM0zpKdJg6EpC
	P27St9QNvZo7dq3kmbtXS2PkY/Ahctj8wjNLwG0Mtw4oUlYYdu8fvqIrwyh+65UbydUdIy10U0s
	AjaFYi7WL+w8AUo3J5wwrjnfiG+oFhwKnWQ2CbNNspios2foWaTVV1IWPq+/J48nJ8A95/a4umm
	8DnTF8vlvt2LSILSXeNCLq582/AmwdQSt27ScfCd0olbl+IwZ6y/WIJwrO22i32+77AMSjFeQCR
	KHry7vxWaoOfGenPJM7dIBtvdb0HixJ5VSgelZ9WlLE/2CY038itRKlHxr84MsY+fDGWtTlFlKx
	rewwk9Qh02bv0Ibr1am0TstAPHtbA==
X-Received: by 2002:a05:600c:350b:b0:49c:e0fc:2260 with SMTP id 5b1f17b1804b1-49d15b06902mr216555e9.16.1788774692358;
        Mon, 07 Sep 2026 02:51:32 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm441544895e9.13.2026.09.07.02.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:51:31 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:51:27 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: jens.glathe@oldschoolsolutions.biz,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Message-ID: <ap6JH_abFKi5ik0F@google.com>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <a8149216-536a-44c1-a981-54ec169f07c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8149216-536a-44c1-a981-54ec169f07c6@oss.qualcomm.com>

On Mon, Sep 07, 2026 at 10:57:42AM +0200, Konrad Dybcio wrote:
> On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> > The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
> > (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
> > chassis, different silicon. Stubble and the DTB loader need distinct
> > compatibles.
> > 
> > This series splits the board description into
> > x1-lenovo-ideacentre-mini-01q8x10.dtsi and adds thin leaves. Each SKU
> > keeps lenovo,ideacentre-mini-01q8x10 as fallback:
> > 
> >   lenovo,hamoa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
> >   qcom,x1e80100
> > 
> >   lenovo,purwa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
> >   qcom,x1p42100
> > 
> > No qcom_scm change; the fallback is already on the allowlist.
> > 
> > The remaining patches fix the common DTSI for both boxes:
> > 
> > - Build the Hamoa EL2 DTB like the other Hamoa boards.
> > - Second M.2 3V3 is PMC8380_3 GPIO5, not TLMM18. A 2 s startup delay
> >   is required or pcie3 fails to probe. always-on is a hack until there
> >   is a real M.2 power sequencer.
> > - sound-name-prefix on the three DP ports. Enable lpass_vamacro: no
> >   onboard mics, but it provides fsgen for tx_macro and rx_macro.
> > - usb_mp port 1 is not populated (no PTN3222 @ 0x4f). USB-C is
> >   usb_1_ss0; rear Type-A is usb_mp port 0 behind a Genesys hub.
> > 
> > The Genesys hub is left undescribed.
> > 
> > UCM [1] and AudioReach [2] topology for these devices are online, too.
> > 
> > Tested on:
> > - IdeaCentre Mini 01Q8X10, Purwa (X1-26-100), 91B6
> 
> +Mostafa - is that the board you previously poked at?

Yes, thanks for pointing that, I can test this tomorrow.

However, at the moment there is a problem with the ToT booting it:
https://lore.kernel.org/all/apgeBNSiP01YfNcs@google.com/

Thanks,
Mostafa

> 
> Konrad
