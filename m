Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD23B52FF
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642607; cv=pass; b=LpHcHv7KbaN2fOEIEDnLLUQxr17h7uLm9Y+eacWRd50jQZm+H66MowPnGO4V1UyHgV/ta5hweG/hJgYLoxMcN9z4cK0mGDRLu6+Tzs18Hgw5XwCvo4it6PGFOj/jPhDrf5f5k3YUQTsFDqzbxk3STRBSGyFlJJ1BiRUMZsRiI50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642607; c=relaxed/simple;
	bh=pp052ayrbRL4wt7LydpOTffYxrE1Uhcra5kIgYO9sag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkwB7L9d3qDPajECdn+Xw8Veax7PTPULAeMhPnZtZJmz35M0D14gXJT8G9OE01Xi24NxOiC9mXsTR0g+0KNiMIPpZhDEOdxkYsummW1HEfr9AshWbyMcsrIiXV+raCIuNEvaGtUYxwZHKfFt1N/UGlYfuCbfLE3t7y2Qk5ktPYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WqLwfpPJ; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WqLwfpPJ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59dcdf60427so5309337e87.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 03:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775642598; cv=none;
        d=google.com; s=arc-20240605;
        b=MUGgQq3BoCnjePUtZX1vBv7c3LMjlneihXkS8CLS8q/aN3jW+4kNGROQkERtVMaCfL
         khKvLHOSTSKIrdaYvow8N8Pgw4sm1iTkdKyXo+yJImXdbjFFZuSXav3IfjM+JQ8koX4z
         4KoH4YPCXFQtMCPAS1139K4KegpwTVvZ9Dpb7740RYHkUElNWunLv2x04lzKn46zhp+w
         a/S2yd8pK16u+gAFTivylh0/VovlD4lUfs5HMePcLFt6xGRuWEozyZqz7Rl3fCPWzFPE
         cF6m/TbyHCNn8n9+TjXsB5WOnmYv7paAHZyDJZ6GYwBAlqvj4/f7XnCLX1EmLPNhPQRI
         7ESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ml/GrUmk89MnBxJYMCpl21fN05QLwN5VJJYiJr+miYs=;
        fh=nHogxLuSWt5DNQVsWAkAdcPZWVerukIvRTT8PUEUhKc=;
        b=H41DCejM3dzjubEugbp5FlJ7um17Gi4YJ7f2qDGPPKUxVDM9ytAkbOeLcZt9z5a1V3
         yX/67TpFW7oISlaeVoh7xhnL4ZjWiyF803/yNeDaP0DN1I2a/d2Lb+4TNLHheqbZ+h+W
         E9sy1mE9mEPgaBjhBHLThP0gPeq4wIvtlF4Bzti/jxgTU+JDz7w/56mE03Aklrq4mSg6
         0QF1SQm4t8myxzhnFeaWdVUlPLCbFu5GrbRzOpfV2/PDxl9+t2wS55Pk4Xw7XjTEanI3
         Cdc/lzya90MNvDrIGIjpcPE37ZVJ6eGvzBVQHjiKOELQ3Ri8uaJDz6PZT5hxF+PSiQBE
         A6KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775642598; x=1776247398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ml/GrUmk89MnBxJYMCpl21fN05QLwN5VJJYiJr+miYs=;
        b=WqLwfpPJXb0FnBNpVIWeM0Dwru/UevT8kZD9bitjhnbCPaLuocTlb9JovbJAA3ZWFo
         WSCLAwukrlQsDJJvVLVaQ4SkbO99DxwKiCErs6/dbECc7p+Fz9leXAx6hVQTUhpvFFS0
         xa74u2rLdqia9Ph7J2hnxeOs6fxKbJ7la64Ab+qigbamkPFl7OWH2CUlFXONcmj7hXS2
         rMko1YN4cHCBJS/Vx+TQMUa3kDjkljuAypb4IalqhYALzHmX82vOy0HZNjeysINtjY/Q
         41IWJEBI7gNzyLofj33V2CQo4/WG4gGKnbW+E7DshMBUlduwqvq9q925a5uqY55//FMu
         XX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642598; x=1776247398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml/GrUmk89MnBxJYMCpl21fN05QLwN5VJJYiJr+miYs=;
        b=BsYjDlU+icmt94AT81zmYOSchtCBf66EOrflZfTSnU8hdkbN8B8Ji4VnQxxC/XXgP3
         icHxTUmqZcONTM58XTPKaz3LG1UUNX2HKHNnBqMJ2MyQ1ros1Xiq4Y7Oz///PiHH+39O
         3CKYt9OiFWmuBl5/EKO+zbeJ+ShLhvAI5lMyr/5DmPQX71ktYpk0lG9HgOJBwX44s30V
         DieulRjopkrpSUMPRx/Y0y8Z7qjr5vIw5IexznXD897AVVLKKO1tJDt/O7TbAn/RzAJO
         Le2xwmEMDEoVjNx8+WVU9I8UgpnzP0p1zkYFey7I9OdLvLzZUBpReCuGYK1zK8B4WR3a
         zjWA==
X-Forwarded-Encrypted: i=1; AJvYcCWbYqRup6MZD4VC9I1Yfx7OtLCF0oq44Mek6HBoVu4QACvrZWEFdakAWYbRsnQt0+u/vUy/yhvvgalo@vger.kernel.org
X-Gm-Message-State: AOJu0YwJNppFdQO0yGBX14moEkQwZd4JOEmbThFXypCyYICdb2x/qD4G
	wM3PfIS0phZQ2DxQW1cIv33DZb5GvkedoXwwqiuwFxcnaahfoI8BD1Xd3ZtQYaO/oW+kzTH9tKz
	PAXindy8KHhDhMrnebdohN9M5Ly//gDrT5p5fUefWp1gaP4bNzM82
X-Gm-Gg: AeBDiese2itTHSFfNQDZilyxfFNL/gn6Dq8n79Jz4Dt1gAq4o584ga4tn1XZsopQc9j
	y3KZjUsnMvUWYTfFtud29xyPHIu+Dc/Jr4dj4Wm0RgOVeZpUptGcPJk1H6C1C7ApMTvRCA+16VK
	IRmagn7tFNlQGTtQqtMkPlpiSQ+H0mdhBD5uKTlNhcNUflo/wnhvIWpLo4xo2QmURxeDvgdiVYh
	5P2D1SiSBuvE2XRhciVY318Ml8yeglGKHHDzVV/vOkuBMUVpUmYHTmLKgz/MLEFzABFYUEG+FxX
	h5Mnb8I=
X-Received: by 2002:a05:6512:6d2:b0:5a2:aec9:95f8 with SMTP id
 2adb3069b0e04-5a33756030cmr6987228e87.17.1775642597659; Wed, 08 Apr 2026
 03:03:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
In-Reply-To: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 8 Apr 2026 12:02:41 +0200
X-Gm-Features: AQROBzDtafMmoyr_uPgMdOXiZvaWXClGB1QtNrcyqaeePtY9aOvDKCGpYJCPudA
Message-ID: <CAPDyKFqMp-uJouJuPNMmq1r8GTX4boVdVv4QqyZTpBqbQjD5kw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] power: qcom,rpmpd: add RPMh power doamins support
 for Hawi SoC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, kernel@oss.qualcomm.com, 
	Taniya Das <taniya.das@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Apr 2026 at 02:36, Fenglin Wu <fenglin.wu@oss.qualcomm.com> wrote:
>
> Add constant definitions for the new power domains and new voltage
> levels present in Hawi SoC. Also add RPMH power domain support for
> Hawi SoC.
>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

The series applied for next, thanks!

Note, patch1 is also available on the immutable dt branch.

Kind regards
Uffe


> ---
> Changes in v2:
> - Squash patch 1 and 2 into a single binding change
> - Add trailers for the new patch 2
> - Link to v1: https://patch.msgid.link/20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com
>
> ---
> Fenglin Wu (2):
>       dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Hawi SoC
>       pmdomain: qcom: rpmhpd: Add power domains for Hawi SoC
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                     | 38 ++++++++++++++++++++++
>  include/dt-bindings/power/qcom,rpmhpd.h            | 12 +++++++
>  3 files changed, 51 insertions(+)
> ---
> base-commit: 33b1a2ee3a3df63e7a08e51e6de2b2d28ddf257f
> change-id: 20260401-haw-rpmhpd-b40a68a3ce79
>
> Best regards,
> --
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>
