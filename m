Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B58EACD
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783921177; cv=none; b=e8xUIXKhsfovKfntY8UjQ44ThUzMQDtlD8QhV7/frllUw0CEcO13oB9Y+5HYfcXzS2XS14TuiilwWLBj4g/1Nmmxw7WsZYOilPyLk4fg1EwHO9TQyCeuk9JsxiGUTWY+oJu2QNK3mVE1C3lWVFUtvvK01CbcD7wyajjCmOU7S0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783921177; c=relaxed/simple;
	bh=x4I6Scw9C8eqFLJvs/06PrDu9U23LOpRWWHuzG5NeCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1SYAfgWf5XEJbMX51NCWmB03FtPEyRzVJsAvLXq80/4IRCrxspOzYytd8sqWPmstajyMLUFxuarJH8bVOiCo/VbGWLIf7z1YwwSN1hHYUAKLNJYVY7c7it5XU/ynJZx6MY5TmqJdPPuZQH9k2ILEl22K3CHfMBBryJoRGG05vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDbv3dUa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gg1QKV1n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDbv3dUa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gg1QKV1n"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AiQB137133
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5wkf83Uw+RcAqzwU5I/kP144bnk0J0uMffXfepJFss=; b=ZDbv3dUa4vZ750Qh
	A6+gQIFU/nSAuDgAzaPRky98ADnVMmW1AfLKHvfXgVlO/xeC2V3INZRoTJqe/TUF
	QqFlrKAwyCqVgm5ThmTLoguUO9a9pXm/zU8dR8TVtRT2lizzPIcmC5xmjJLaUS33
	L5iITTOXIxMeTR3ENpmzKGJdqmpz1N14u4putWAYiBNbR+ScTl/09pIWwrpOF8jo
	38QHLD6kgUSGIMz3QVTNcJR0W01NEnJ6kGaGLYbu7npUEUlw9Zngr4wQ90LcYwHt
	1u/YbZ9R+R/ux4ziglf31u4CS9JJLDPqMlk23umShXdQTKbm7jKIRiEs1jDqZ3lo
	mSndNQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe914g2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:39:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f544944so2348579b3a.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 22:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783921174; x=1784525974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5wkf83Uw+RcAqzwU5I/kP144bnk0J0uMffXfepJFss=;
        b=gg1QKV1ngwIUidfMJhZbSbpUGUOIhip6lC2crPiEi1Li9NO2B/0IUd/wPHfDP7iDrZ
         xv1kweo1hDKP5EL8x5YDhWDw9yhqI2qiLLifYUJbCkYbEk5MBG17+a3jTiNRucplC/NR
         RiePXWxHcT7rIuFr3e6twxCZ/sKqWsFo3O3bI534bY5clREWi1MdK+9g2sRqHATDbQId
         2NHuBgdRLaZP5xDSklFJGQvW4kazEWdXF0HwjBe1BsYTvwwmoFDo/obppVm0Y8zkiQBs
         zPydNErvXutzk5R51WNeBeL1krCpYq9AeJ/HUiYezyiOL2eFmDe9AvCeIJT9FNuzS8Qz
         lCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783921174; x=1784525974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5wkf83Uw+RcAqzwU5I/kP144bnk0J0uMffXfepJFss=;
        b=IZgtxUyStXo3O0h3dLzjnRNDj/Hv5nlBNCxm8zqErzhLofkUQGffuSoOYqgEcMxMzL
         YlzyIO8/DMWsD7CzhiK/HdfFZ2A0/3VgkZs8Kf9veUbQJLjr25OfhnnaMkY6xLSIENdB
         /KfcVfxZ3IxL4hT8U264eCS4btbxsjiZictmgCj0POQuzN+cvJBZy2fk7jqN5lRKH02w
         ZgvK42xDxVyKS2EaLEB0MjRya0mhg8XIwvIIZ/GG1EL+gaMy5lWUGoSqF5RGcIzLG9gW
         NlZD3pmvZepB7LuzziEuy6nEM0ubJHsSceThqAukZOyAr153ctvfYyuI5Wao70WUj+Xv
         ZF6A==
X-Forwarded-Encrypted: i=1; AHgh+RpfcG6qc9spkysLs9+PBMYxsvFhnPWhb2jrTLlwVbZrJveBNJ77Eth1OwXKVigY/ZHpFydz4GlW1HMB@vger.kernel.org
X-Gm-Message-State: AOJu0YzwyE9aOsUruJ7nuoANKIuX3jq+2yJfmMNgWXSZpkxJTGV/LqSQ
	SJrOw6ZQdhZ38Nsh6y6gvuovjJr4LaFmaOza0plA/r0oyzXYysTb2g59xUzRrG1ZNGPB2hPjcl9
	NUlrJlJtxXIeZrVaA2uFv2nHaY3RtZ9OHOHw1zz0e0Wh63bvCmnarr/sRaZqwP+F6
X-Gm-Gg: AfdE7cn6cM7ZV/2jk/rNc14FP7ul7m0LtQcFxniTf7Re8b4F+Zs2zndvEZ07js2wPwV
	9niSGu945oFauDmXrsWKaPgzUgh9E12yg4BX3O+Jc3fxYlWOA+Ser9rNjgD/Duy1dlXWEAxaq/t
	wC9hN1yqZBFxuUHNx58dvXDwz+rk6T4IY0NL903i2UK+wcuNGvJHfa0P9WCIe7WmMpmNaiZlmnn
	2CPcUI6A0/0lbOphGcZzX2rmMcTbJbVQhJVzPp0thrtPFvsv2wrXg4M/6wkH2tjuYxasCPY8/GZ
	q/pW6Kgh4Wq8AeGHJvYFfwqzmxIwYPMnAeSFh7+2rJCXNQPY1Ocas2nSe9fISCzuywVtlOYQLWG
	fkOTolLaE1v0PYstFXEWed7Rw0qwfY0fiCFnjg6aZBbfbLDNr8Z2oZhqUJex/pZit0hhMx21xKJ
	U7VeN4HkZ4W0v+6DnTosrO3vY=
X-Received: by 2002:a05:6a00:b4a:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-848896c3a47mr6413483b3a.7.1783921170110;
        Sun, 12 Jul 2026 22:39:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4a:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-848896c3a47mr6413465b3a.7.1783921169655;
        Sun, 12 Jul 2026 22:39:29 -0700 (PDT)
Received: from [10.79.194.163] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9a832sm13511408b3a.18.2026.07.12.22.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 22:39:29 -0700 (PDT)
Message-ID: <ab5b5cfc-e0af-41e8-8f55-d8176f633bac@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:09:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
To: Daniel J Blueman <daniel@quora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260712134601.99191-1-daniel@quora.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260712134601.99191-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a547a17 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1obtQX-UFFl4KiQxAf4A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=CsAS6f0m0zARWR-uHzm3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1NiBTYWx0ZWRfX+IbqWsnZYOAA
 zdBZeqD6MS0iYLL1p7cPm9VV9Rl2XZvlMPDh8S+ezCM0GB+YimgKh6YAUuH5+nfFC1mYkhrhXRY
 kXx3cNPaKQQMflwT9DKRIG8ePDyRP1M=
X-Proofpoint-GUID: JlR3I8y5z81ETQoUGjqhFhNYOdyT31bE
X-Proofpoint-ORIG-GUID: JlR3I8y5z81ETQoUGjqhFhNYOdyT31bE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1NiBTYWx0ZWRfX3lJzFicZ4yeo
 YA9e27fQdck/HhVy6plwvpvu/XRHo731BmABZQgRdM2lfXuqiDWE+VLmFnt4JoZQ8CgGAWt2kEl
 zbTRlTlFzgeiI40Ja36x+DblXOJWRIubXVR8zSXjOIVRGS5vJtivWNmHLqfnalLuPgLgMYt2r1l
 ucWX35qVKne4HsDVNwyAK8Sbc1Z6JyZaBp7gNJEvFdsPrSLZvYI1zl+X85vUp6yOmKUFdh8hIzq
 hf7F/6jYDEuVkrUSR5UT7MZUySGr5uEgYNs+NrSmefExWKRl10ZiKdYV9PNxR+jpleZVu3PAfW0
 T6TX8PHlojpzDTtmjMP13ICjs4YdiD4fbrsV7Cce8oAg6/LMoJqjdp1VaUbiBW00UlEVYJcKuEE
 uY3B05gZi8Tat8aZrmyXy1vKitlWkj76UDjzgYpxp39cYrK5oixyZxLqP1lJkw9NOxokbVWaB/h
 u5CCn+NlinUrzPmXznw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130056



On 7/12/2026 7:15 PM, Daniel J Blueman wrote:
> The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
> Hamoa X1 CRD. Add a board-specific compatible with qcom,hamoa-crd-ec as
> the fallback.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> v4:
> - add reviews and acknowledgements
> - updated dependency URL
> v3: https://lore.kernel.org/lkml/20260526112409.66325-1-daniel@quora.org/
> - new patch with DT bindings
> v2: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
> v1: https://lore.kernel.org/lkml/20260429103301.17449-1-daniel@quora.org/
> 
> Dependencies:
> https://lore.kernel.org/lkml/20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com/
> 
>  .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> index ac5a08f8f76d..813d41769c0b 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> @@ -20,6 +20,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - lenovo,yoga-slim7x-ec
>                - qcom,glymur-crd-ec
>                - qcom,hamoa-iot-evk-ec
>            - const: qcom,hamoa-crd-ec

Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

-- 
Best Regards,
Anvesh

