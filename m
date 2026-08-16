Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605523CCFD2
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786873432; cv=none; b=aMznkoLEs56SzY3NIzKup21cCaXmbJQ/UkcCo3xK6mgmrl91zS1UMFv1eCT8BjxW9z1T9Ok6EwsN6nvXrNUKcxYq6KpQvdJv30YOq8ALqupd5NIGQSolq4xZKtomR2FWK25AfNWh0g/LuO1IfAP4dk6sEoBuSLHLhRZy8RxAYi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786873432; c=relaxed/simple;
	bh=G3V/6NnfckIOBq82ny3RmYXsBGcXvQhSxd8L66KrD90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6xspeHQWAPQZn9phHayM2x3NPVvTBbWWooramhMkkHY8B+bUNwaBzadxKQrIaqsNW9E4F6yzsv13575BrEbIHhGz6GBiY1/DadBgbOQ4/ewRE2nT8KbOzFrY71DGb37jd/tnaw1MjRV8udWqrKkLg0D59u0oSEV4PZzk3902NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JT3cshUR; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JT3cshUR"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2caea3f742bso42509965ad.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 02:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786873431; x=1787478231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JSVI9EmcUArZjAZ/au+br5pNZJa0DmSYRx0foLnLp38=;
        b=ljbSbq8LIG8OU13zgkpv8dyj9HbcJDEcaWIGcAddAfvpb1HklPzGi2ULLGcEAy67yR
         pR59iMY5i6HMjFYFMFyygyj2dwN1qlNMdrIPl0lkCgh7XsjD8RGDJMFFl980Omwr3UFn
         AjFK40njbyk9xQxYXzhBpaMLW8rQqthe/jxQZ4nxLjIO7EiS9LlvDnjf8svyO55BTNEb
         Ap6wmHiFhGQTogwfpGlWyFqDb3N69n20oZXKh+oL5Dtme9l6LsJyc/rNpcwILEyqMkHn
         fSelVdfOd62EHrmNpXafcl1HsozOEnHDG1pOMEsSF6ME0T7AG4wIIXRJNWPs6Ggdm3/y
         sJHA==
X-Forwarded-Encrypted: i=1; AHgh+Rqj/4kMSQMfOCDGuxIdG0gZE0BJS//JXYkPL95pWJDrm9iw3YCm311dRpQtCmzkk7tml/oXCiyBHdoS@vger.kernel.org
X-Gm-Message-State: AOJu0YxMsWS9BUAUzFOjn6Q7ALhTCz3DPh1bkN58EnkEsRKB6Lw+Hw8U
	g2Tmzo/Q3TOJXAIlXh53JcHL7qTajdYDVUNZE0vFLZxvdACCbekZxRmbD6oTOF0DD/OcSPnSRY2
	HZrngSD3k1RitYR6eFaLLkFIRtQNO0TsKqGJwFkoGkpE34TKtNncBjiM4wPax31wArtXgl7heM1
	/Ewj+n5MUuUR/WdjZt2tKiMAXhcpoa2inU1Ln8j9bpeCekEqgVfX87vYMq6xebhCsWcTH/taszX
	oO8rqCzspllbcFF9fBvktQ=
X-Gm-Gg: AR+sD10NVyz8YD+ikdEf5v8K0PzjPmiDeTcdqJ9d+mhchZhcJlSBOiGeqVrR9HbGezt
	ihVL+uL3IqxdPRmH1cfPYIsLGg+n5eyTkzooe62Wz3mkU8WezvwvofeIJWl1Qam6+IJkQJ0veIY
	tE0vguoud5TfS7zNHR+YfN5C/hShWjLSv0sg+HrTviiF7vQWGBYZklWHf7hD/OkZZ519lb4xs2e
	pnzB4hske4dQOF7WFoQFL62xIax12WaGc3el7L/OnVu8AH9a8TXhThcIt1RgP1+4TLpvGL2VoSB
	PdXCb8KzppdFWneQs1fm0+NfVnBrwfOdbzQlEsH7AEwXzIrTtrIuHt0ie9U+oC77xYD/shf4OWq
	NyfXD6TYD7YlbK9T+P4koqEiVbALYPapnYhvn5Px+j6wpfH1uL2NTSN7EPYG8W9+IvMHJzeYDVH
	CvI2BxUcS+C026dQNkf/FGY6p7eDgKIINRmFo8jA0=
X-Received: by 2002:a17:903:1b45:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d3b084516cmr225065555ad.6.1786873430502;
        Sun, 16 Aug 2026 02:43:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d3aec5edebsm711135ad.51.2026.08.16.02.43.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Aug 2026 02:43:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-392cf18db8eso1478791a91.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 02:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786873428; x=1787478228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSVI9EmcUArZjAZ/au+br5pNZJa0DmSYRx0foLnLp38=;
        b=JT3cshURJxnF45hSmP1n3wvuY99IXfsVEoEKw4U4f9Xxb0l5WLabIVNRgeAxVTnFle
         XVSngsW0o+eoOfeoGWDLHLxAUa31NFJQ4IrnakUpee0pNJqXcT5aTdrH7b3RHgSjfXGz
         /BOLQd8vJ9GXndou62AMG+2+OaVhB7XlwSp4w=
X-Forwarded-Encrypted: i=1; AHgh+Rr4PSagBE2oCASWopYFq80x9oe2qX/2ViYqmRFVAb3vFwme/sHz4lIqxMENerqlTh2TngZvbubhB84L@vger.kernel.org
X-Received: by 2002:a17:90b:4f8b:b0:38e:8021:2ea9 with SMTP id 98e67ed59e1d1-3933bcc78a9mr18359419a91.19.1786873428470;
        Sun, 16 Aug 2026 02:43:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4f8b:b0:38e:8021:2ea9 with SMTP id 98e67ed59e1d1-3933bcc78a9mr18359386a91.19.1786873427926;
        Sun, 16 Aug 2026 02:43:47 -0700 (PDT)
Received: from [10.229.42.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df2504sm24436596eec.17.2026.08.16.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 02:43:47 -0700 (PDT)
Message-ID: <83ef9f7b-4145-4985-b157-6fb9fbb0b3f0@broadcom.com>
Date: Sun, 16 Aug 2026 11:43:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] dt-bindings: net: brcm,bcm4329-fmac: add nvmem-cells
 for MAC address
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, van Spriel <arend@broadcom.com>,
 "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260811192829.123410-1-rosenp@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260811192829.123410-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/08/2026 21:28, Rosen Penev wrote:
> The nvmem-cells and nvmem-cell-names properties are used to supply a
> MAC address to the brcmfmac wireless controller. Nodes such as
> bcm4709-linksys-ea9200.dts fail dtbs_check with:
> 
>      Unevaluated properties are not allowed ('nvmem-cell-names',
>      'nvmem-cells' were unexpected)
> 
> nvmem-consumer.yaml cannot be referenced from the common
> network-class.yaml because it does not constrain the number of entries
> or their names, and not all network devices use the same cell names.
> Each binding that uses nvmem must therefore define its own
> nvmem-cells/nvmem-cell-names constraints, like ethernet-controller.yaml
> and qca,ath9k.yaml already do.
> 
> Add the single-cell, mac-address-only constraints to the
> brcm,bcm4329-fmac binding.
> 
> Assisted-by: opencode:deepseek-v4-flash-free

Probably for this v2 it is better to say:

Suggested-by: Rob Herring <robh@kernel.org>

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   v2: don't use nvmem-consumer.yaml
>   .../bindings/net/wireless/brcm,bcm4329-fmac.yaml           | 7 +++++++
>   1 file changed, 7 insertions(+)
