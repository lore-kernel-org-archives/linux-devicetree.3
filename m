Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445529;
	b=tvtAh1eEhbtpiBIPF8Xvg1UgcVGSVlzWDIBaeig41MZ8OCUcwk/3xUUsC3ZRBJzVN+a7
	 Ko4UkQDhSvcm1KQFye65dEz4BM7dgp7DzuobzuyFQ2gqsQJkd5d1wACfiTibPlx/c8dVa
	 6sGMuLr93SyHmE7hgKFhhz1L98jLTdAhfPFydW5AAR7WuaIPT8psFj/C2+ZBZHfx4E18W
	 2ePdiRYR6KUWWcqGfPyjUcFvX6f3V2PJD6vNPI2jrcXzuk2rSrTtpRLAA2D90liwUywrc
	 xc1QRknmzI4r3lmPEDtDU7Ogx5+Vr75OaTnryrvrwps7H06XomWSO/TrQVg1RAePRzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TuVHoTWOLcCyB9PSRvxtA5wjt2JdJw+LyuZbMuRvoqU=;
	b=rV/ddJmvyG+3cHB9k3lGuEixyhpboJM8UvgsH8bfQcMc14rM7Q1pe+gFzTsbNVFODHEV
	 YpcbdW6sECojItKcLfoWvm8bajyMjMEbQnfGtSfbEKq6bxCKozoniMhQ5nXABk4FXJFxv
	 MvOq1yW51GXLJ/w/Zs42tyzjK8IaGIAHWpp4aGCfTfG1AhFNnbp2NltObqwbd7SlOMwh8
	 jeArOUBTysSU6tSZ+ggtOe6MYDz5IO9XZ6lpluEYv0cbQCiXTj2tRiuXI2+ednpBVZOr1
	 S2WfKXj+sCVHKTrzLA2md5YqrjxdyDEJaSgzsCYLem338gLCpopuL8ETPqzE0IK5pFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sB0vLkAE;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D705606A31B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D705606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sB0vLkAE
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6290359eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445527; x=1793050327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TuVHoTWOLcCyB9PSRvxtA5wjt2JdJw+LyuZbMuRvoqU=;
        b=sB0vLkAEH+wKhJ8Cxe/5ZMP162nPvlE5GdfkvBekaDyBFLX0p/o/PJGYJ3m5YN3CQQ
         rE89zT5uCaC49tspBnG8VEmCCJazzuLMfdmqU77AYNC0IN3+CRUM7ufo/V2ry+fwvyTF
         5bYx67SjVPyM5xZL9GakJ9GcWKHEH+Wkgjkj0cQN40K2z4LXR65r6ShUPPfNzzyK/A2E
         UXUmfrHJ8Hj4MLHs8sNiLM9ScEayvARU4cHzABtX2K3eULznPMq25pkjXuBjrbpNLV/M
         Mu8fYVIX14Q/24xaNeJQV6G6lp/fKKlBp/AuY3x1nx7+fezvo/wOsXPwDvxl9okBAeTK
         X4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445527; x=1793050327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuVHoTWOLcCyB9PSRvxtA5wjt2JdJw+LyuZbMuRvoqU=;
        b=fGhFGpfH2FAmXBY68IsWf+GIxkPTThkGwTGXVjYJhEzozh0oT6Kh+BNTr+jqmVzmgb
         x/f04+lpWIVJdmuRa0GNZ8133mGxRxGyUVz+CHV4HlZIzw2WHo0lStcIG8N3pvKrRjRt
         pRAKMGNSbVJkBBxe1UcQwhGR7YASANR4Cwnhinnwk1hBHeTlDbqEyRPeVfFVwJlC0iuj
         TkQGLi2/wtO8rTC9TskUd7Ar7axpbUvuHCpJ8UuaYTnHUwOu+yyCC0/QPzpNSyU/z0ZB
         TLJGvoqCc5Cz5Rbr9tcqTdF7qXHTUARUlmRPYa9v6DFGW6/0tEeF4ofT4lS1MbAcXhaG
         o4pA==
X-Forwarded-Encrypted: i=1; AKwUvBydgMoi18pIMO3MWSXpGsPlVFO+gEFlmMch9VH/1YbOyLBbpZ1q+y5T5EGFagM2XWL0pYJor3uBOQlS@vger.kernel.org
X-Gm-Message-State: AFq9FYIFxlCIh8LLixffinA04hmvEmZjcUo2einKj1YT4XWeKL+IjKnd
	R76X64Lav7Ncqucct1WlLH4TLvAItednXQjv48HSK/HQTEFecq90QwUP
X-Gm-Gg: AYBFou1XIi2IyscREdfBUhs+x8Dt1+1zABE0PKzvE/iqfptAO90NhsdYmelcxrDA2bm
	7zB4CcDYmYdOzrm8qEmM0P2w3Z4VXcIWbRylDJO1OsEpdIzy1UxOWh4IB5Bkcq/uBHLSqeLCBCm
	VF7gcDOC4L0jvZekp+F23SbA2xXrXcT9CkLG5FrKsQC45qledsyo7TLYaQIHkj69TmSdD/IMLEN
	y6uUyMOWwCPqIkIEiztkLxfL9sdVPWZfX5+lMiOIWBQN0/AnXBxGEkiRPQ+cUmyXAm6Y7whjJlO
	iGzCluHlztTvx8xc3Gqhm4Ln9otuSyLZICPHqF1pvJphMRYeuWJnBbsfzZyWR2fbNDPTzyUKQRO
	Jbpp8Ok7Rpmcko2S6ZjyAXfZ9l9fC0eRsmWVXybldM5cp9CKRSgapXhO+tqVtc0Gwsd2DElS7A9
	7+9+xgqC/SBCHa777/oWXYsD6Ty54yVgoYYzjQBahKni6sMvjkaQqABVUO6BYPNWKtVyiWhcXgR
	a+Dx1HboTowugOmcKItSXKeHwrk39zM54EZ1jmS
X-Received: by 2002:a05:693c:87d9:20b0:365:b147:b458 with SMTP id 5a478bee46e88-365b147b492mr1344116eec.3.1792445527063;
        Mon, 19 Oct 2026 14:32:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7c21:7991:4e59:de42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm63920435eec.24.2026.10.19.14.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:32:05 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:32:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Support Opensource <support.opensource@diasemi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: input: dlg,da9062-onkey: Allow
 wakeup-source property
Message-ID: <ataMRZc7a0y6IUnG@google.com>
References: <20261012210054.2848389-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261012210054.2848389-1-Frank.Li@oss.nxp.com>

On Mon, Oct 12, 2026 at 05:00:53PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Allow wakeup-source property to fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dtb: onkey (dlg,da9063-onkey): 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
