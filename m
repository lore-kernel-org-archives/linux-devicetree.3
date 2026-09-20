Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971DB38D014
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939297; cv=none; b=tjLUBYeJgZIPZyvqt//LCaKmtDHINC2QIlL1J5KyqYBA/lou5Zlc9xNGKUX6Q6jT4g1mWLODNuq8P1V0PB4a50U33YVPDZLf7cIqYbdVMb3k7Fa/JB3efSvPxdpMoxxJ9iAFb83aZfvfYAO+btLY9zeSHIuFM5SohDx3ymUWAOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939297; c=relaxed/simple;
	bh=qoKr8F73jXZwuLTCYhGa0Hp+b6lJiLywfTbygYS4GYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmPUUD0xALB8zIAOrRAxrg2UZRixfoPtNY+IE5PQtas27FtZQZoHqUaOSQDwZo1/6oyL9oDUaeo48JoFIVGQUptB7yykXsNECIPrPIVe1SAR5fEu2DlvAyrwJJKAuNqSGVi5o1BvAyZRQhyhxHoi6jIMhQ/7fyiz2PzRVXPCze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9wPDC94; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9wPDC94"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so3524898a12.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789939294; x=1790544094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bHL0bqzjiVcWZ4wR3C4oOtKMYoG1Qe+r8qIwvuj52cY=;
        b=u9wPDC94k93C89cV8kHPTS7s6kfPnF6GFUD++1XUV8QXjWXUty5xJ1Bp3DsznbitbU
         JLZPyogRvCqN9XhnZGHiFWveOHMQd3MIl0eMFIAcTw61QdZEKL1Cyf8+9OKGY5frrbwo
         8Ht5qjvtf7vvmB9Y7Pq9dd/57B3Pn4rg61n5oZgHiLcheEvuXforkZNbyeTmwK8OR2rU
         aLNDpgcokBV2tJwhM0YjD8gwnvLiNdWDGTj8EI6rcwL2vgjqnWy7SpdaNGcHi4zW6WAy
         A+09nEqJaJnyuUyitvs2VX0YWufWSQblrEMVQP8Sdev6JxkTXAw9LNFGT9avVJtkhAzo
         /2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789939294; x=1790544094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHL0bqzjiVcWZ4wR3C4oOtKMYoG1Qe+r8qIwvuj52cY=;
        b=O/Y26rPaKWJchwtKc5MTZ1CcEbCOyuJNHFdlLR2PCG0RCaHC6dDnvL8nJGggX2Qqyh
         Pu2PU1dyMioeG/H8xrKw/+bvjvBP4QYUjmOi2SERXHSKo7/2T/GeuDFKMx+i4fEjUB8u
         MCq4vsE6cqVnD5WDfiJNEDTfojuOMPf8skcrlFC/Lcvo35NYWI/NAtvPrVslX3+mdS8R
         SFkVxB8YBeIIs8ejCO+8wGWrt+LqkVqkxYygT5CDJbSSfX9HActly9c68dKOE9xYJ44N
         a8x1qrBVPN8p9wvEUNUVvij49+j9W1PCpI+7HArpF9p56ypaaomLqH2yTrtcXFoAT2j1
         A+IA==
X-Forwarded-Encrypted: i=1; AKwUvBztOKs95L8nFbNWIrZ+qR3qc2VRla0HtBgQ46A1YRbSsr58Qm0kPagPWEUAo4ye6bCejnyRGnhd28Mj@vger.kernel.org
X-Gm-Message-State: AFuF++l0bW8BPRfDQFMOcp8KWR4B8TG0RA8y/Zb847LoIMqFU7whNtdk
	fe85jfkqxaxgxNEgjZQKFtsmdYoRo9UWLx0FaqW61SgEjdYSMEZWVfT9WJWktqTLLxxAdf6yfq6
	Bq2OF
X-Gm-Gg: AYBFou0wiZCYJBdU/tRu4m8sjEGZ+ofUGR6qqcqXZu1LX1X0hcSsYw5L9qgjwJWyiOb
	2lvOAoXnQ3aQDRMiAq7xneVFbJaqfJ3mqwg4r7ls1k6unV5/24qqtP2YvEQMfky5I+ECoqypVBJ
	SsW1ZDDVXWn5iKly8UUL/FQtbHRHNH4r+tQ229sLH6RBK9rVGqkJT0FH1auqw/O8c+EdTAferdm
	LaOhydEXhYu4SGo9+ZBEgyf7SnY8aBVMgEtA9FkP8TOhAIBeTBMaUch01VFnFS4hTUpQtzSORbE
	3LUOa02zwaarJkI3Y3sIziHTPjY3CkG3eyjSSkYzYxgjOfoXw7oP9YLysUbewRz4ICASGEIaYe3
	s2MS3iAl8p20l6z02S8SfzLWsaT/sPBfbN2FxLFXO8JAxTHuWYSK1bzsTrV4P+aU8JU/6TwsFpM
	xCiCqhDavpActuyjYR9qwFCSWPYpWsYGm+TYKi1njZgOpFY57dIE/Gu2RMUk5MHsekA+wW4/oqh
	lMr5wc1apM=
X-Received: by 2002:a05:6402:23d2:b0:6a9:f874:6de8 with SMTP id 4fb4d7f45d1cf-6aa559cd4dcmr5546423a12.0.1789939293867;
        Sun, 20 Sep 2026 14:21:33 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.73.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dd0000sm3062351a12.17.2026.09.20.14.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:21:32 -0700 (PDT)
Message-ID: <95cc550d-8eac-4d1e-a61e-60595afa9ce8@linaro.org>
Date: Sun, 20 Sep 2026 22:21:29 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: qcom,pmic-types: make example use
 generic VBUS property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
 <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2026 15:37, Dmitry Baryshkov wrote:
> The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
> device-specific VBUS") switched the schema to use generic vbus-supply
> property, however the example continued to use the old, deprecated one.
> Update example to use the expected style of specifying the VBUS.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index db487562cec4..dd56dc8afe03 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -176,7 +176,6 @@ examples:
>                                 "msg-rx-discarded",
>                                 "fr-swap";
>   
> -            vdd-vbus-supply = <&pm8150b_vbus>;
>               vdd-pdphy-supply = <&vreg_l2a_3p1>;
>   
>               connector {
> @@ -186,6 +185,8 @@ examples:
>                   data-role = "dual";
>                   self-powered;
>   
> +                vbus-supply = <&pm8150b_vbus>;
> +
>                   source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
>                                  PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
