Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575680;
	b=vUeq7qs04e/JpOUurO9PeZvaYZ2xuAUilqzI2/Z3b5IwaO+9ZseyHmXo4/6PW3cgvaDU
	 JWSEXxM7dewEf6MtphUpAI7qDknkNnGkp4BLOe4O+P/+oZBxWIf/i3WXpLvP75G+8a61b
	 Eb7Uw7Lrt13P5FUuehWoNGp4dpLAIZDHjHelnyFLnknZRQY6RezlLe+ZdDbe2/+DORHLC
	 XM8jT7mj8GTiyeomLsAAii6GCymokbEHfQs3WylqUYMIYP5+XN8HHMYTzerQMdv8syJw+
	 Nz2hIY+H21Wi06UwuUGcPlLeiEWUS5qN+EKI3VsQmlCn7wX5ZResjkNWXMztNalyVSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575680;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=fyZC70zcs2JyMZN3/MJ99iH36eA3idZcChdR9W7M0ws=;
	b=0Jp0E3eyEE+jwVSXDIQk7Eop2TqeD16Ns0eWFssyJW5rrT2oRDIpUZeTxqwkfdm2nQ4T
	 AfHprZrn8PBLpd4GF7HgK4KBMWm6srXWvViKxD0kxErikjTp0i9bTrdBe5CNEYG6w5phb
	 Y7XnU1LeRe42FCcDQlMBIiKiSRLtYETAByshPjBNAYXxbQlwKrjwaV9Yv5llcCddSUd30
	 IXmYp5VfcIn1fGTaYQD4p0Hyb0vz97qhSBZFwfwFO1o0f7M8pJgkdlfui8hdvGT6yXU1q
	 s8hjbSiFl89vmg2OjEZEO/vxJSUbVQaSwGVum3jHVQ9kufO3S+2f+Umxp5rlZb9bjzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U54cVHtg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE2606A320
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U54cVHtg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C171F000CF
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575679;
	bh=fyZC70zcs2JyMZN3/MJ99iH36eA3idZcChdR9W7M0ws=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=U54cVHtgyaYCzaVg6lv6nnSrhp5kOAx1Sp3i4Xuu2rpNCaq4iSulQKlepPuT3LpHL
	 HtEHPuzqTixVtSC2VG3nrPnpOykscbOCeGErPz67XWoIuanXQBqgIX7UGZTB4J2VVG
	 qOiVaxyXC6QjSW1Jb0UaBRqBv8JJvIKAztju2mCujS9lL+aI9MhyuKRph8KKBeoLyP
	 EmTeFGCwR4y9PHOK8mjYVWY321DVOR/XVirs1V8usDxan04bQ7oH5c0F3TjOr0LFOL
	 yMqJgoMipMmi07Y7qJGN4cs00QHUnFzS+su2gBp/YMQ8xgtozRzpqpJB7kY9MFyE3J
	 2tE0IT1ke6koA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so4475001fa.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:41:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxA2u/hZ05gLdcNxFvEs7Ql9MMPORLfEubj7C0lj7SSElqblnmyPt9eKrrEgnbNq+v7DM3ow8Vd5Ouc@vger.kernel.org
X-Gm-Message-State: AFq9FYIEX1WHR4bVf8z52BdeLEySyMB2oTu1uVKndZ1GZzZXBujzIylJ
	M3/Wej/8hGmTTVm2xJErYO8lmRGCz5CoDn10ssPoHew4d4WHm+lTe0rRyv8kPorFgXk3+YIYxxf
	EfEQyvSwC+gfFzeMeJX+qghPmhr4H1f46La6U/R6Kzw==
X-Received: by 2002:a05:6512:6c2:b0:5bc:e661:d673 with SMTP id
 2adb3069b0e04-5bfa1d00cb6mr598516e87.56.1792575678483; Wed, 21 Oct 2026
 02:41:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:41:16 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:41:16 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com> <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 05:41:16 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfth7nH3dkn7__N=o3P0zYvYYp8S58WjwX=zttoSPEusw@mail.gmail.com>
X-Gm-Features: AclHuK8Sh9-m53G1_uADJjezLlpATsHIz1MTBlYIHav2b9m-Yl5DadTNtdz_ykI
Message-ID: <CAMRc=Mfth7nH3dkn7__N=o3P0zYvYYp8S58WjwX=zttoSPEusw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 09:36:29 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
