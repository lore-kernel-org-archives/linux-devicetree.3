Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F308A3E8695
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810603; cv=none; b=eJBm2ZN20tenwewSl9Yc/xlEWcDLZxHE5LvxNSHY8ppX12uz8S3pbqtETdkw229UnqoSveEseXeTx+fljDlxg7bem+IrOuuPnpFRfSsbaUjgmuYmVd5/8zthw0NlmWRagqBDOnyWdYGFfNOaI29ceC3xVxqWVasJjux0lM401Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810603; c=relaxed/simple;
	bh=ptOVKjkZwQrCkAzXCeGoGqQIndI7yCJPdxRUgantAbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqPJgC3R4NZjbZl/GqFvY29yMcCkzToVRsQvsVej8wVCMYP+IFoREyqSzlkg4I3g+qBZsZjGIgHrtLoR++pgus7Zmw7yEUuZ2I1XtikyBcgM7mKA+EaE11iYF28FmX1riKiiWCxfnDvsysOjK6A0EdAuWp1j4w63r4RnP/ngSkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGDZAUsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvepGzCI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGDZAUsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FvepGzCI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CMe11088682
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KkFq0X6wqxVvjJjzcRaiua/SKPg3yw+BNzWanfKbdtY=; b=cGDZAUsT3321ar0Q
	uIQFG4OLlUrBeZEamVCCDLodlgM15gM6zvaxGyFFi/3AsaNK4jlmGayPocuhyX3X
	MEkBKu0NbZqY1RnLAKPRPc0DNSrphwYe8n4NYzUUtRRflsW6/2XN5zEgEECAjO3l
	9klmoiitBGvgqPY+lSlecpwztSiCYz/RAxlSzKlfgARJLOqdWtVEC9+sBoWXiN9D
	rVt725k0BNLLTQ8dA7B6tjgetPrsD6C/Uw64+78PaWnlCeKOOtH/SiYTZBeVuI0j
	XhV3XK1ZbPoYb/1EuZniWCb/JNu5YXWBpEXJTbwcjQHip4vEENAhqUo7eHv3iJm6
	fuEz0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fhb86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:10:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6b97afe7so3563985a.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782810599; x=1783415399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkFq0X6wqxVvjJjzcRaiua/SKPg3yw+BNzWanfKbdtY=;
        b=FvepGzCIjL+5t7EA4AfGfToMjR/RI4dYDsqj8co/eY4cL0QOm5RgrB3QbyU+ejHRZf
         HViD9ECWHdkgO+4GgIQXaQV68jX+m+a/a+77DMIAUo9JvP7FNsenFx030u324zpwwvVh
         7W2ivhFPBDzwXjd07KGaGi6jb3GmcTNgptgW6vJ7ER5531q9TuEr9BMncIoVp9qNKUS+
         MQTs67d0fURr+aWo486fC74ZweX6KdnkCckQ7giVj2UqrX3qljbdnH4QRsbaGVU9vNTl
         KnQrscYJh+IzAJsruxxge7okPY2F7PLBe2tpwzRSrZX4DTWG7nwyj1C2G3cFEMET8ZGm
         t73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810599; x=1783415399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkFq0X6wqxVvjJjzcRaiua/SKPg3yw+BNzWanfKbdtY=;
        b=MP0TRdevcyMcXROxtQtW5vHuut0bApqxj9FPGd/8O9qzzSAQvEPGLzM5lqTS7bH7Yz
         YbzeLNScHaaROqVQgND2z8aTlt/DEjg1m8alVX3dYIL2QlegJ+bHSdr3+7NJc2P95vUl
         w7z3VuEPvB2wuUBEukqXbdLBmKFqNVRQJqg9wBut8EVP57oCA0lQzJCsoRRFN7XgqnGs
         6xQW/5hOVM8AVSbV/0xbK9rj2shPKLjyOTq6b2iv6SJhHBPK3p3R/8JWdVABahoft8Ck
         lAbrOWSLURj9XTZaAKRMfHMsftLqwsW9yiQxBnTB6/FMCZW0gvT/2XAF3Oj+svSMyKuO
         eD8w==
X-Forwarded-Encrypted: i=1; AFNElJ8ldJqToOuF4Z20DbUwLBvlLx0G161NDvONwiY9NP0ohpwCeSdB+GzK6DbdQAueq4aNHaRcY1bBKmht@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbxi4DLZpFSL3QFYRh5BZSyV14wSHWlNOPnXoIEPCIrzARAjYG
	O8vSvYkzmnvAzpzHTG1ZLZ2ZanbTOwsvelenkabwjp7kqOxksByOkDhfNsqFujFjBSLpBc2qY4B
	7VsYeMi3Yc1hhJAntiFIPdup2xOmcPzjUK6wiJbVefvmOS9sZ9kRmZW7tIposNdr8
X-Gm-Gg: AfdE7cnHdXvQS5xlPebO5G8IOQKJeQlx0ploVIcEPu5s+C7VhQI9u5mQK48d8SBFFvx
	zdN/zXxqMY6u2unKCmwC6pplg5ikt3w3QZfbXhDIK11etVJvDFNCRR9UYiGIghCw8zglAw9Zpxn
	1B99hSmF/6VtcNjRaN8sAl/LEWqAWhQcboxpJen0OPXiLilOJAZmAI8vS2dTz03NpBVqEoLzrsP
	wFjEkNpxUAQ5jxh/T/ko2WDn+Bfz8eyHXgEsM4o3etdPMyqRT7AMrEg2o+q46IazbCI9K6EjNBa
	Di0MEjtyYJ9/QLACcJ35nP41AocjHeYOaH6h1JS4QByDevkpXqiDUenB/m+BMWlw1PQv9scewGT
	OF9lhadngAoNUFTPO0YROqGos2aW1q3uQOPw=
X-Received: by 2002:ac8:7e8e:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c1070ea79mr24049571cf.1.1782810599002;
        Tue, 30 Jun 2026 02:09:59 -0700 (PDT)
X-Received: by 2002:ac8:7e8e:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c1070ea79mr24049421cf.1.1782810598476;
        Tue, 30 Jun 2026 02:09:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6b059sm89407566b.21.2026.06.30.02.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:09:57 -0700 (PDT)
Message-ID: <7c29b53d-54e0-4667-b775-02e3c01ead3a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:09:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
 <20260629-monza-leds-v1-3-0cf7c0a7dc14@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-monza-leds-v1-3-0cf7c0a7dc14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MCBTYWx0ZWRfXyh1kgMtDsn5c
 y6sceqk0bYtQf1m8pEvp0vBNvP42RrNJYUuEMeSsBcyV1xY+wvAM0olVhbw/YEnikRmmwxN03bp
 hsoB2FPWhECr6Fto11UAIlE3VizqyKg/rdTIma3KwH2+qxbNSgSmeE1SV4jKjWq2xV6E9rvHkco
 BQiTKYn2zMjKjwBanVIO7lnQTUXh2gHbdMIDaIpWhzIDj7oDhbM7/JmDuUpz25Lg7MiNb0ReXHD
 euD2R0cGxxeIbqL2OECz6LWd9CJTw7D8KLAUXxdw3lBm94YHBf1M4hJV5HCWPv/FA4EibgwIZy5
 MvywbciKao9KsaSmkdmph7cDLgfEYsNJ19mK+k6eDIZ1+Yri4V6PAnXJzz8TRcaNj2oPC1LprLy
 J5rlclVtDHj5u2p9UZrRQgt9JJXJ0mwPdfdE7p0cJIwl89MIsrlOI9TyK4ORu+9uRCj/M34YTmd
 QM9ISStRmYDVthy2P0g==
X-Proofpoint-ORIG-GUID: IyPVgqs7MZiu2gU8WhhjMMoDnnAhTm1f
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a4387e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mmkDOsKAXys1VAjLnNcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IyPVgqs7MZiu2gU8WhhjMMoDnnAhTm1f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MCBTYWx0ZWRfX57neP9qamJAN
 DO9CEIGovWVFWaiF8DSA7RSkrXkJfbMmfUs/shTPPwHyJUsB6PcROnUvRQ0qLxQPfk/PKeNWbKH
 j1feamMpB+TSJ46c2hNyefo/c+/beX0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300080

On 6/29/26 9:52 PM, Loic Poulain wrote:
> Onboard MCU/STM32 implements a led controller compatible with PCA9635.
> There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index 379b796f261f4c8f6b7712c5d340b20be1b9217c..71685e54a3781c9b03fc41cacecfea77650a7182 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
>  #include "monaco.dtsi"
> @@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
>  	};
>  };
>  
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	leds_controller: leds-controller@22 {

unused label, let's drop it

led-controller@ (there is no other 'leds'-controller)

> +		compatible = "nxp,pca9635";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x22>;

reg right after compatible, please

with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

