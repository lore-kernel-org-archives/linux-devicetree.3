Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F359D37BE8B
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 21:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141413; cv=none; b=t5QmkmptZ2nVri5AOHns5VDqy7NNjisuGdyn4UHnpnYHD+OroqbU1pJx60wNghjW5Op2f0Pi4RM5kudtibrSLRaTyW/wyMF6JjripmqQTRI9b+WCMFcM8s6o87qGyrAlUaBtMubrTqO/unnmh4veobIloogcUxgDZZgaZHTK2R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141413; c=relaxed/simple;
	bh=Izd+ajGb6hhShbhE86/HUzaqPbJZjDWmI8YZcDks5uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4MQdZlq9ADGBwbbO1HLYAsYVlA5duCtcqtWLqFcWMf1KUmzEkahK4B6R7iT06JSN0yVGmLWFh611XktLo6Vh7MlLvTHi5AWJAANSYPMufrr1Q7c2SH8zJz6Vxn6NRZkNUzw67MQKmVVLAkW2sWsbKEPZi+n3+i1Wwwv+EAdFlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNrFffrh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNrFffrh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so2554350f8f.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779141409; x=1779746209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJv2EIPjGK3glu7utsDpkLohNn1a3Ary13YAALySZ3c=;
        b=yNrFffrhTQicJDkxQNZjHKD7cPqdOo1u2a043wNdE5j9BJmW2kpOahJJcZ8FBrHzfb
         qdB0KaCS5m4kBY7RDrUZOGgHMZrgqNZCU2LxEAT/mDKJ678HSqlzagaE576fZOPFlaeU
         K0XPQrXT/xxqFfzoaAkVnpaZkkCFbhJX6yXym7EMKORwLi8g4+QtEw/vPhh9mQt+CkK1
         nQ0T+eOaJaqUil+fYfu2Fcvmxeoq/I7B+xITtwZ6v3gW9btGQ5xnJcnn4kZ58bs8tYPY
         sBvvqoKY+A5w15z2ay2xpscwe2Jm1LTgJLluwJomAQvBCvVfcJ0rWGye7A2/t60uakKK
         SBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141409; x=1779746209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJv2EIPjGK3glu7utsDpkLohNn1a3Ary13YAALySZ3c=;
        b=hnJIwwq87rKTMrNluCI/aMo+TaLTcalXBpesIhSF4YxePDeUNUa/2rJSZq94eCk03L
         gVYf6i3HTALNqlRKFy5wjt2fiSJMz92vVlXGrAR17gE1DPeb2Kk9V3XfvuEAEGqj8MsB
         9TQ3Q1mWFumA/OIIPtGZq0qCT0M2jdoezUK2Unc0CtgvXK76jvml7avMftGvWGzIC6GU
         q9P+e7qyOSWMfG+IlfZ+6Pxia2q1mmzOjw7k6ZTzTaFjxO4CBUOxkziyrheAd0wDNHYP
         q4Y5e1dba07aU6q6X5XzqOwdyXG0Au45ilkDZPsB9EXgYSs+ivYOPeRidEHGUsq2M9d0
         DY4w==
X-Forwarded-Encrypted: i=1; AFNElJ9lsOeWWsysLlZvwNV0n6FfvW9rO5vQZWBg5eOL4cjLJJACUbr2GqlkCWfMENwspW4D3jpMdcj95JT2@vger.kernel.org
X-Gm-Message-State: AOJu0YyZqX8f+5xsqcEFnA4IKEFm41DsSZOhu9323Ig4X5bcbHJyldpp
	vukJQxqw+uUYeuZmwl8frvIBlQHewMIWl++zmlMN82qOPq4vTyrjd8uP8Nb3sDssjKk=
X-Gm-Gg: Acq92OEglqZJ2taLhpVODFLrYRQ2oXytKYEWe75Uh7pFQxnttSfZ6rElHtaF1C2THJF
	zyBPipHbpjjV2fggwwq/fVhg4y2ROV6iyajt6zlys6ZMmNYRE0Y+UsaMSZbZ9A1AQR1lBPVNV+1
	QzNf1Z1ZkigW8BgfUNGZy2jer7VDPf/FPKq5wBH3iTHhb4DsFkvnBIXJIQBXgwILgB0SAyooZbV
	SCiNpy3r6F57KE/aGJfs2LHm/od0lLaW31zJiAvFV616UMKVtgG22w+pdr80eC4oQOpFlkpjuLE
	g8VCxIvt+CK4V8PGSjr3HW1Z8e8X7O3MFNcBQdS7fN/MkOZPcgvjVKU4ShC73vbBdb6lkk8UaKB
	vw6vQn9pJjkQrrjwlibjkrm0enNfN7/fs3nKnCIFjffpTr6o8abX9zXvEzbhNMJKEi/yqIQ47pc
	Ec7QGDsntk4+OgxelPKbNES8FttzWH0WGM
X-Received: by 2002:a05:6000:22c1:b0:43d:7606:5a47 with SMTP id ffacd0b85a97d-45e5b73a043mr28591671f8f.2.1779141409371;
        Mon, 18 May 2026 14:56:49 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768c4fsm40379314f8f.8.2026.05.18.14.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 14:56:48 -0700 (PDT)
Message-ID: <3170e034-5780-4b85-9d25-f55126f4a2cb@linaro.org>
Date: Mon, 18 May 2026 22:56:47 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 PMI8998
To: taygoth <taygoth@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
References: <cover.1779127507.git.taygoth@gmail.com>
 <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/05/2026 21:22, taygoth wrote:
> The Qualcomm PMI8998 PMIC integrates a USB OTG VBUS boost converter
> inside its SMB2 charger block at offset 0x1100. The OTG control
> register layout (CMD_OTG at +0x40, OTG_CURRENT_LIMIT_CFG at +0x52,
> OTG_CFG at +0x53) matches the PM8150B SMB5 block, so the existing
> qcom_usb_vbus-regulator driver can drive it without code changes via
> compatible cascade.
> 
> Verified by inspecting the downstream qpnp-smb2 driver and reading
> live register values on a OnePlus 6T (sdm845-oneplus-fajita) running
> mainline Linux.
> 
> Signed-off-by: taygoth <taygoth@gmail.com>
> ---
>   .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index fcefc722ee2a..9e2e2c8f9539 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,pm6150-vbus-reg
>                 - qcom,pm7250b-vbus-reg
>                 - qcom,pmi632-vbus-reg
> +              - qcom,pmi8998-vbus-reg
>             - const: qcom,pm8150b-vbus-reg
>   
>     reg:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
