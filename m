Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42720357739
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780071155; cv=none; b=anVwNvM+2SANQns2DdfQaOA+xj79O4EpZr6yaDIfDOczi7j6gJDHgUEYVnVQvhO/Dam2NhnGLeKIDZ6yg+U2MLSspHoqMrY/qR1fA9k5ev0ArR8vJDfLp/BiUI0qoTUem7Ff78wXh5P6OYRlQu7nCONGV0YtFxyKZRDBq6Gy7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780071155; c=relaxed/simple;
	bh=przyp5bNGse5tpmBoS6kVRjn0WsVKg8vjerffbq8d38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IO8VNZ7fTihFE6syKCds660kJI5DTxWPcglENITPiggGdsZeDqCy1dIcAFmSKn1gwCkBeYhoIyrteRanG2ORsa2woGaVy28jlB4Y6udMHgGAJbv2eYiBMhQDszvfUAFpYPQ1rF1L7SOcZ929/5r10o2eLUQHlOae5I53rKgc7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPtjMgIk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j1AsHFsV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPtjMgIk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j1AsHFsV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TFZ3lg4030732
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 16:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06DgXkn3vnm0O67cuWd7+N21NOACsuVZyxVwUzts++c=; b=KPtjMgIkkqOdpb2H
	ehkY78DZ9PkFMi7AmUljXM14iuKn/xv1AKShU8nDyhBtpqRtjJEs3l95nGzFwytt
	tw0C8pW29kQOOtvDcASZdEAa09pwb3Fm4kwMXYen/b0r4xpH+EHHJQBHKkqKbLXa
	LFinTTTAU287PiY5E2ZopKJSEfuEVYYzjzIYXmIlnwVAeCJGMHf9H5el0/jgS5Lp
	AewCR/1IkAiXociDUX39J2pyZncsQyoTK6YW87WVw5H0j9scnSJ/v51/XHNdEKmt
	vnl2mfKzhfEySzZ0i53FK9tl5M4syBHp9Inu7SgM9vUPQx3H4Z4oSjNlMWxtTGKE
	RjpOag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efdjng7e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 16:12:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso161553315ad.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780071152; x=1780675952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06DgXkn3vnm0O67cuWd7+N21NOACsuVZyxVwUzts++c=;
        b=j1AsHFsVnfn1hfmIpjLjPEj/Wdt5vj2FCRLG/TzK9vDY5Q+S5L3SjDT+ZS8ctVktmy
         wJjEyQlcHGdpacpUTpFDrcGo05Q/c/ZoLHFWcAeHrAr1Y3KIXI7cgFdpWvblNP+5JM6q
         fiDz6ixVxBIsSKW//wgsCAAIPEXMVk8B56ImkHuqlwW25LH5cK53CRyYoDVGI5cyxKIC
         Uu2z1VACgoHbtKFEHE8iLYnXUtXCWKZjftvrYJDS9T3GQ3Ph6J+5/6XLf1CI3La7tPoT
         kavywwT67nyuSkvw3Lf/uBHBFj+OKhMaEUUD899DBbOzcEUSNXPUQ6rchAku9mOrFGTj
         IA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780071152; x=1780675952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06DgXkn3vnm0O67cuWd7+N21NOACsuVZyxVwUzts++c=;
        b=Tx7ay1VSSgZTH/ZyqGbo2bw5YGyQb6ERHZ/4BYRZQnA79rZApluUHVpUjSC6zUCWbg
         Bj2Il0RUv26W0nXm1XDt1vQ0Y2shzv6LVv/4LC+ycpKq52Rilg5+4Q1e2nKLpm5fdInI
         9ctttqjzVfs5OddnRd/M1JexIWQG1Di62lyyVbhJ1NMotydChWspXuv8TWEMDnKUfmCF
         0DBiKnwsCLj4ugxNzk09ZLDU97HancUq+qEozf+j7RRZmGeJtwc0KfSGOfqfLupFbHKu
         8s0VhNKxMkR+RY03UDmgtJw19jwOp9MxV4fTXFfwU5Dd8b27fequyZ+TwpMdSAZm7eGr
         PUJA==
X-Forwarded-Encrypted: i=1; AFNElJ9WdF1JITSDO+jX9l+XEUOS1aKrp4msV6c9EURMLStTBYShjWgjRo8XiwI/j+XZQlxUAe3MB8iGMAJC@vger.kernel.org
X-Gm-Message-State: AOJu0YwReanvb3JYwP1Ahc+l1mFIQv5BUzCsBjWCFqqLobLxN+ibNSek
	UP/qSvIA4zvMpVfVusTrigxdolqwC5ofW7X8twVaYWQfHYomfU60/DVrUe5aGUBLQeybDMVt9jn
	QymSSERJHLoo8luN8h2B61bXoaP/yq4wO+re95N+4L1H1Gg3sKbzocyCxoPG2DzZC
X-Gm-Gg: Acq92OEsZjwmV0AP0UCfVGQKvsJDulov7ENzQK2C1U+aYAuq7qS+5zYbTi6I4UkJpj8
	RUt4Pcvm1sq1rV/S7fBm6kdVndeZltI1r69H1YiQ5gmrJ8JFXjvd/lN7ip1fBHwa3sbsj94VCbn
	8JqYtFU+E9MF0ShKVdBsripWA0lSwc2n9XFMNuF70lnuZmwNsWoTYDgIfPsUJTh77F7gbOmjmmN
	46Z8JfiQoeXnHwqaZv40mizK4oA+e/kPPNR2imByTFcPuEuyFj7NUIUTUhbp84X8Qna+wdBrQAa
	baMMnBDUlZ1J09qeRYnMLyyGsqNkZlGC1lzhThQ3STSLb5clurx+NBIUf/VkhvEWY/rzI3OMiBm
	0+BQ7qNmkInjCX1GE7T//WEdINwjGKLC9XRmPtC5BTRoHBdD67cy+QDsRvsfY9Q==
X-Received: by 2002:a17:902:d589:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bf3684acb2mr6154405ad.19.1780071152170;
        Fri, 29 May 2026 09:12:32 -0700 (PDT)
X-Received: by 2002:a17:902:d589:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bf3684acb2mr6153675ad.19.1780071151582;
        Fri, 29 May 2026 09:12:31 -0700 (PDT)
Received: from [192.168.0.114] ([49.205.87.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm35557685ad.7.2026.05.29.09.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 09:12:30 -0700 (PDT)
Message-ID: <df7e4e0a-a31b-41aa-88b5-d50c8a6e18d1@oss.qualcomm.com>
Date: Fri, 29 May 2026 21:42:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 Embedded Controller node
To: Daniel J Blueman <daniel@quora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260526112409.66325-1-daniel@quora.org>
 <20260526112409.66325-2-daniel@quora.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260526112409.66325-2-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE2MiBTYWx0ZWRfX5NTNy8QBRrPP
 wBAgA2zAY67LIYepGuc1MEZzaV2DnBDz4BeKM6OE25V5S53dLnPblNjMM83yhk7x1Y1hwL4vtYR
 d/FOF+6V6AwU+6mudWsXO0JxrMivS0KXI7iCJG+yL0PjRNwOgcRaMDM7j4GR/rxN+ErQ+yQrs9p
 ckiBAa1Y4l2hjLx0oXeDh6IUadP6wP/KalFShLKwJBnyvUM6Gml2XSy5WOYOqSmSMZ3mTw+kHQd
 G+xM5j8So8QpqG84DL4NThki7IKSVpAiZ5WKGUnYg0ph7rLhLnzH8sw6UKEGZblG5gOQMfg2uuG
 FfbF/DPuV7TTgp0xgdc38F39LVA4MZrf92jzd0piTqs523c2PxcJoDOKMbGdNUm8ZG2wxk5LjD2
 628sAYlverdA54npidOE/c8XXLsUwXOYoM+dNyRRUy032YxP2owF4EcVHYpYLEa2I9NlmS27GKR
 WfZVZg4kfLPN0jHMihg==
X-Proofpoint-GUID: _OBbKAlW0JTsHeGQs2NvDyQvN29bccns
X-Proofpoint-ORIG-GUID: _OBbKAlW0JTsHeGQs2NvDyQvN29bccns
X-Authority-Analysis: v=2.4 cv=PtKjqQM3 c=1 sm=1 tr=0 ts=6a19baf1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=QeBY61bkPGI4yPcTgj5/Kg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=J7uTrBVL25gZzBqQJcQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290162


On 5/26/2026 4:54 PM, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
> X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
> introduced by patch 1 for fan control, thermal sensor and suspend
> behaviour.
>
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> Changes in v3:
> - use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
> - v2 link: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
> Changes in v2:
> - corrected DT compatible node
> - v1 link: https://lore.kernel.org/all/20260429103301.17449-1-daniel@quora.org/


Reviewed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

>
>   .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index beb1475d7fa0..1ee2a2296129 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
>   	};
>   };
>   
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	embedded-controller@76 {
> +		compatible = "lenovo,yoga-slim7x-ec", "qcom,hamoa-crd-ec";
> +		reg = <0x76>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
>   &i2c7 {
>   	clock-frequency = <400000>;
>   
> @@ -1352,6 +1368,12 @@ &tlmm {
>   			       <44 4>, /* SPI (TPM) */
>   			       <238 1>; /* UFS Reset */
>   
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>   	edp_reg_en: edp-reg-en-state {
>   		pins = "gpio70";
>   		function = "gpio";
