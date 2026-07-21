Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6C7434409
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620293; cv=none; b=CbLjeYhYxNJMhuMWqmt7EugDaDNBtaUaPBIKRdEgzrJSB/vJpROViwGwaszY+pfUO6zNP8NGgJtZTeHRDZzU3fl59NWbnONCuPL2o6bgB9IiTQTdBXi0J5YoOalvqN9x7zZpxudTR8Q/2NQ3YE+vunlejRxaNCD6QXA2hPrmjCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620293; c=relaxed/simple;
	bh=edo6W7d14mH7Fu5Lxagl9T9a4yHLKmozkFxFeoIFPoU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnYKs7PgSV1Wk+UO7k2LlD/La8J8AALn7yLVIHgeQ5OJnx7BtzlgRKwc/1Y+KZ66wlgfVmDjAUr4NsbgQHC9JjqZNwgRRKq9wU0k0IpB/tb9iAuUiPhGL7dycsVtkdRmZxxwofzWlwdg6RyD9aUphecG566vHcgiFsXyqoxY1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8MDh4Ww; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8MDh4Ww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABF81F00ACF
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620292;
	bh=Qlv2HAnbXB72odlhZukuhXahac8O7i04apMrlr4+GB0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=j8MDh4Ww5goeHk3Pj+y079V02JZz7yIKPeijtA7dDawGUjCGRygK4F7ReMiufG6oi
	 F4s8GNuSLySgiDLncD1/d0eTqC8GBHRkZtZn2U/Nfzu76nQzXMz3LWfEADzfKWi0Mk
	 27yCsAO23z2C/tjybahdfMvBNZjlnR4UNSdiDxiAJHP7eKKwnpyvm8JcDcDPx0zj+2
	 SSx0rAcy+NzgWNCXCTigVd10gaLMuwvrL26eKHx2GjX4L4OZEpPH3IArlvxg49iqxt
	 C17yX7+w1+tPJ5KOkYDuANHJR4ZDQvZtl6Wlx07z+TK2ikw2gxnlZ0ba/JxHvI6yLy
	 iX/w6uJT4Ykkw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso10156659e87.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:51:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqYQBHbZYQLvY6saof9XZaBWQ5YW79d0dQO5QqwCeo6CunrXT4CkM2xkws5hGTbIWuwDbvOp+b81vBB@vger.kernel.org
X-Gm-Message-State: AOJu0YwBLOB6IXeGkYwxZCKN31fj5+sL+ySsfr/8DoAJqxsqCChUc21f
	V1+JITJHrU/kdlm/tuz34ATbgSyR6lpLiZZTubDpHSQ3tdD6vUdvCSBlxiJ17aoSx34skxAro10
	zujiCi3zwiEY+UPKia1yYHLM+/EuAmxwbR9grKX48xQ==
X-Received: by 2002:a05:6512:2250:b0:5b0:1708:afa6 with SMTP id
 2adb3069b0e04-5b28f9a7933mr3348919e87.43.1784620290688; Tue, 21 Jul 2026
 00:51:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:51:29 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:51:29 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260721044005.2882803-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com> <20260721044005.2882803-6-shengchao.guo@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 00:51:29 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md4xkLe8JFuzv280t4uigJc3np61LksQAPOPs_O74C=TQ@mail.gmail.com>
X-Gm-Features: AUfX_mzEyApNxJ2B8d_6H19H1FGjfri7UoCh4sr9YzLC_1FHUUz-Q8jppfUnqVQ
Message-ID: <CAMRc=Md4xkLe8JFuzv280t4uigJc3np61LksQAPOPs_O74C=TQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jul 2026 06:40:04 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>
> Add initial device tree for the Qualcomm SA8797P Ride reference board,
> which is built on Nord GearVM variant.
>
>  - Configure UART15 as the primary console and UART4 as the secondary
>    serial port
>  - Enable UFS storage support
>  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
>    all sourced from SCMI sensor protocol on channel 23
>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
