Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCD14F0544
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970784; cv=none; b=D3D9wxmLik/EOP4WBcpiKqxxFQj854Opx8TLAZbldHsOBE7YUfetcioVYsZ4VpT9qS4rq4nabzUDWkKWFJX+kPm3hAOMzUm/HZMPe1ZPFGpZ6VlTAfDrlxYf2wbchzcLhaUrIjDbsGt4PZaK8t818XX7SMrzAG7jzj35fVyu0xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970784; c=relaxed/simple;
	bh=okzaYTuseeajn/y9/bMRisEYExitpZUhSZUqWkpEvcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvQ3EpsZNrqatVWYAbgBH9Gjfsaqq+ilDQQR4vNhEVi8EG+z7IddG3cfanhosRShj/kDoJL6SE28eiP0XEGH+tCuZbqawtGB6FTdAaikUnsR9SanUKoHi1+gNV6EHUDzbi3BUgb6z7IC3+9didqsp4xtK5BKTDOMub65WZGAlnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgYSlXmk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgYSlXmk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c350db5a761so491822766b.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970781; x=1792575581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1GZw3cNFikclMDGa5RfJqbcmWgweDgc3stMA6cogOA=;
        b=lgYSlXmke3NhGXgHOPHA5I/ODRDwVTY5w3VnVAo81ZF3piDNIh4XsBoU3F1iz85PkI
         MJPqAvklJACU2gpmfPp0bDi3ftPc2S1Jokv5afqZqDrddeeLU6yg5u0LIZMjrpADrc1N
         onBTXCA0w65ZLXeQQNQKl8w+ebMwLaeR5v+FDs2l8+xScqBXny0GK0jMDpASiBiMiJaM
         lMv3DXgCMB3swRdoZZbcFYcBfWygGMUKeWYEsz9X8IOMACwEMYccR+UV+LSjSUVZuKuF
         MMJM070xA+/vncqYacXgO07gjHyxC6in/VCb6VWENb131SGyDpWngnu01nYwWEMxibmW
         9ZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970781; x=1792575581;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1GZw3cNFikclMDGa5RfJqbcmWgweDgc3stMA6cogOA=;
        b=AstL+NZirMthUwahADam1jn/6N5lx/h3VrXrL+/BZyul9l8QghmTYOTEqydNM0IeRj
         YdRsS+7MRa7+MgR3QtkoenLKUw+sqNWQjTiDnl8DJiieeGw2OjgMH5kXJrhw2xr+7IQM
         ezUQHIa8Fha89Qju5ewMoYFz0lKfut5/fpNUUdCCWk/1cShHpLtUGyVSwPAIGfe7ZmT9
         8yaWF6oBIzCpXv7qE6bJ4i6Ue5ms2s8WNBVnITid/L0RuZWQ3bueUGQmi7Fk0M43wTl6
         uCZJWNSdDwwQA/J65RrixCBvTuJGmg0lRz9/+CaRYbK40HS41c8k4S7imrlCQX0pVotx
         g28g==
X-Forwarded-Encrypted: i=1; AKwUvBydqjrTQRnuoXxWqnLPU/9/LXVVFoy9S24cLdhFZOmNwxOtZrI5E+HWfHSj+aDN/y8tqv0bth0vRoNP@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/XZjSpwlP+IeINKybl16F1fE9tA4fMZ5ELqtmlFpQ/3qBJ3Cr
	JXpnSJgT+uMQBVoiOWHruVbOiHqTdYa89uGLhuiQ4Jw3DtzPBbW0GkTYDhfQyByu0VM=
X-Gm-Gg: AYBFou2sNeq8hzFOKp0B45CmkRqtCzeErvLThzxsmF9w90s3hn2Jzdm1s5AmSOxLiXl
	GEk7Ftgl4aEjUKX8qdI3eclwAhHeKue2JoI22gK38N5OsitaObp3I5whnSHbl28lN/X9HXXOZ/r
	UfVu45Yhg72fLW1S0ccAqfv9cd86+BoMPRRv4h28C4BS50gk825scOuU4Y7mKg8rov8QeHvK2mn
	2rni7TV/7qLPDU4iSWi/IJXnJ+MKHDliSTY8946o9iW4uIds0okVQHqhL65tFj5XWrv49eT85/9
	vHStAk3VJZMPpuiul9iRmrnswYl+CdiMutfmDd2iu1Fm/A1D4wUhDXT+EBfKhcP3QVSi+0r5fKn
	AxvYBe3I8w9mQveENFlYxlYZeDo2v4Xu89evGwXI3TbHmEgQ4+oBC5VjPdJGXR1nmr1k6j4xopQ
	W6BgiqMF2bdvVKux62mNLiRHErrG+Frx8rKSiG83AjkAKF+hU/S0/7PcknmLFpaeTPDtb112h10
	CFQ57mzLp+m
X-Received: by 2002:a17:906:c116:b0:c31:8441:35ff with SMTP id a640c23a62f3a-c31aa0e9367mr1389779166b.48.1791970780874;
        Wed, 14 Oct 2026 02:39:40 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm681485866b.80.2026.10.14.02.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:39:40 -0700 (PDT)
Message-ID: <d08f3f62-713f-43e5-bec8-dd58997c2249@linaro.org>
Date: Wed, 14 Oct 2026 10:39:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] phy: qcom-mipi-csi2: Add Hawi support
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-5-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-5-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add support for the Hawi 2nm CSI-2 D-PHY.
> 
> Reuse the Kaanapali lane table and adjust the data-lane CTRL0 value
> from 0x8e to 0x8c for Hawi-specific tuning. This prevents potential
> stream stalls and SMMU faults.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
