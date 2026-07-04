Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C334502F
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123554; cv=none; b=dx5Xvw8VaZ2lgGxMKCEqXtBd8kGiUnzuwqbBm2zNIcUpKpMV+AQmVCOZF19cesZJwhWAGdHXb38PF3OhgJzID4Xmqm343StRgnRaEcLqeNzl26CbgT9ZefAuv8isT49P2YQuTvjh+r2wDIyoOZrNI5HHWmHmEY3DqOnQtN6V3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123554; c=relaxed/simple;
	bh=HN5m/Ky6KNrB4KekaPSsiduEjRfi7N8uh7rqA+cNKXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQguMAFB30JzjvhBWu63sMS3WTSmN0jhBmd8y+hWVewPANCzFCm31oimPfbs1e3LcBHCEre17LaDoqURuWlTSvdopHRGaSo4vfQWJdg2FJqixvuyOwoXHu9tB9KnqMwMRvkA7n2IzWylF8I/2LymiQJ7yBvqlAru/kGljBiAHr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUlmcldW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToFT17Lp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUlmcldW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToFT17Lp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPUtc1019914
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kHuhyQoLRKepVYyh4wYVN/ur
	TsPJeX0lcSSiDWnFmtk=; b=cUlmcldWNjC6I14+UZW7DjVLenDeTVTZxGNA+J7a
	2UJyL6OsjBNtIWKAPKqw1HJMbuCeoWps9IzlqzX2kp7/PJgvR4q8OyrVCZHBrWYO
	rTNvItIVVhWsabVqe8gfJ7qErz+H6fTLgjbCFLMiLgiFroJ8urWVp+NnwFjWHfir
	IlZnXs1Fd+Ihkv83yvQo/y2xZwU0ql28/kP4n5y2MiPzFx4iZHZWwXN5LewnZpTw
	03A0bzqUGCRE9Hhpdq69V2+7z4VdAwhp47d05GGetBdCPHE4L9Z9QIPo8rWByZ0I
	Xbg6IyP0QCc4I06SmUngtv7vLlE/dT9gKLZut4a2DxWsjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkhu4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:05:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91931144870so82414485a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123545; x=1783728345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHuhyQoLRKepVYyh4wYVN/urTsPJeX0lcSSiDWnFmtk=;
        b=ToFT17LpwtecArebI2V6tmGIg3CEZ7O9bUdznQlGWLhz10m+zn+IOc4G6N09YhUE0d
         DxNGD2uAAQjQ80V/czBwsa4iXiPnj2lsesaqC/NJZjrbsUp7AbIuFupmkfLsS11HgyMf
         HFo0dK8BgVJw6WHqT64VZxuLjGBPc9cSuTJwrMM1xnQmryGQb3OtxUY6mtqhoDMSTKWh
         uPZtl5OSmbb9d/3famo7CjrW9eZ+6I8NcH7emyq3T/QZLQvOf8kXfxmESU5paCCJRv8z
         0DG0mmP6QS1NrNFBaoPuZpsNM4ipvhCJfG4revs1Q8K40dYC7Eemeh4WWQHSmpVv0rrG
         SwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123545; x=1783728345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHuhyQoLRKepVYyh4wYVN/urTsPJeX0lcSSiDWnFmtk=;
        b=d0QpZzDDDTLGpGDYK2uVR6FjpfWCl6pqeySnNfewgzQ0yv8GcSDVsOBe8KgZpPbcgB
         weo6cjPoCR8WluqxQ5Fzgy9LSWUBcLQSYkDlfzy7yiMXhxKweXhBgg7TkIYj436eCrDX
         rWXktU9yo80R1gYNiL7D2lpVYg9+Uu2kIpLXL0CqqBpCLgrspYtWANzHw+8sww9O5PR/
         QEwnWVKb8LDyNk9U5XtxGSP+mf0m0QLFCciMoAHrhRkjZ2p8c89C9VLLZiiS3ncn8vVH
         cwTTKN9UecwBIgog62g1RaF6xeao9yB4lMP3qwFF2IQ2T5t3BGxoFb/Jd27/nCkyICU6
         1wpw==
X-Forwarded-Encrypted: i=1; AFNElJ+a0CoRpC2XEsbxyAFaiNn1xFytBI3YNMxAApxFEPEFOf8CSBLy6a9VFawrj414aWW/cgbzFFMl/9Tk@vger.kernel.org
X-Gm-Message-State: AOJu0YypOjp9C3A5pZehcQqVqL47mOXsTpL6rq3Xq22PjU3I/Fx7u2P4
	uJ1XzvLWse3MJLUKjhut2Y0iRLTbpHorg+j/Co4gWD4iQuNYG4HvG9JvOp0hsiMKzPx2K9Us0dJ
	AbYseaJUpGfpvOVJGzWvocLvx+eNbwt3E6gQKrN3AuHsa1vnYn96N27Q8z3t1nLel
X-Gm-Gg: AfdE7cnURiVFECQGNo06VNyQ23ZKd6MIeOZE8R2osuTWeRrHObOrcwY+HQ52lzJOCaU
	TstK3Y/VentQ8lS9v7i8d7Csaoq0cXXi0xjt5Pcu0fruN9mYCPaJ5scij5XKcX+vpjQqxpn/9/f
	vIW+O75aKp0b06QUMvMlmrBVF0Sfy/HLMgUfYHcNRiwA17FkTx0zp3P9++7ycKrQg+dobiUPKeo
	EouVIyTn557U5NDwTOKYynX6vTTy+cblQS9nlaZGzzC90ZIxvt1lhZUe3JSzAtj0pjkaEA1SOt1
	Mx6mgvzs7TzZjE+88QrZlk+NU/lZ6TIim3jpu5CPiJ/W/Z3DF1FydW2bGZrZdnoZaPrC7uFMmII
	BzeRzRXO5/B6KDjXsTktXgJid9G2R0gMwLlmcuK4zVykmzgkqxl3wPb95pQ7jFzqjd3PJNwxHfn
	ufrDj+1mYYdAP02HAKtIkfXJ66
X-Received: by 2002:a05:620a:1723:b0:92e:6e55:cc66 with SMTP id af79cd13be357-92e9a4c58b6mr227038985a.47.1783123545577;
        Fri, 03 Jul 2026 17:05:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:92e:6e55:cc66 with SMTP id af79cd13be357-92e9a4c58b6mr227035185a.47.1783123545010;
        Fri, 03 Jul 2026 17:05:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377096sm843872e87.25.2026.07.03.17.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:05:42 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX6jbhpsprJKDK
 fValjyufk0R6bq9qnPYEAju7tQ4oowY/qUdaPK5iNjLk82lcDxen+e/bofsp1xAOJpTpLpeMFyX
 SMc2puUNDfNY+baar7GCok7YWQg542Oc/LJblugb6Y4S6jfj5NTOSjcK7xJltqDkOEM01d8qPbi
 j2xfGZP6shQfcMjWBRCKtDbhUVyfz1VF44+m3Nje+OwsCQzPUeySNja4Zo0CPbf/oIcmEbxOLaf
 8Fp3W+sqJ/TB2/WeWXdlCfOWX6psxRw6kFB5K+wSBeNVAhyUa4L02VFlm01xoKsxCLyhq9wlu9r
 m0vWyLHE7sFUJ2I2N3nPK7cdVFNrfnyxAxQizSAHfzdLdkUXyEJzO6oYLFmYreKSY9C46oTBiXq
 o9IqsK2KJteZtkagX9p3oMfR+q3gdaZ+/t9Gzs4tZ0Fd3+UBT1tXmyV1H9rzHkhEggE+rWNMjtS
 BB+Os3R2nh+ZCR8E6dg==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a484e5a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9O-rVQOD5xMnlwKyy4QA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nLS1JUh6eHwuVyW7rhcnZy2Zac3jOlOZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX3Bpnwj2RGnDa
 bodsA8lVGty2bJs5QYpaVBfPHxJZQKS3/v4rwn5Li/jje1Ng5b21w10LZhPkuXFPE6Zqa0QHSS3
 XswCy2Z2CVogWovdQVmhOlNtEm1C8fM=
X-Proofpoint-GUID: nLS1JUh6eHwuVyW7rhcnZy2Zac3jOlOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030243

On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> independent High-Speed UTMI paths, depending on the SoC configuration.
> Each path is distinct, with its own connector/controller connection
> and role-dependent UTMI routing.
> 
> Because the EUD sits between the USB connector and the USB controller,
> it must relay role changes across the UTMI path. In device role, the
> EUD inserts its internal hub into the path to enable debug
> functionality. In host role, the path remains directly connected
> between the PHY and the USB controller, bypassing the EUD hub. These
> hardware constraints require per-path role awareness, as UTMI path
> roles may differ.
> 
> The existing binding models only a single UTMI path and assumes a
> uniform routing model. While sufficient for simple device-role-only
> configurations, this representation does not accurately describe EUD
> hardware when role switching and/or multiple UTMI paths are involved.
> 
> To address this limitation, per-path child nodes are introduced to
> describe individual UTMI paths through the EUD. Each path includes its
> own ports description, allowing controller and connector associations,
> as well as role-aware routing.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,eud.yaml           | 55 ++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index 84218636c0d8..21f75038a81c 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> @@ -45,10 +45,63 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: This port is to be attached to the type C connector.
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^eud-path@[0-1]$":
> +    type: object
> +    description:
> +      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
> +      to associate role-switching behavior with specific port connections, allowing
> +      EUD to manage role transitions independently for each UTMI path.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Path number
> +
> +      usb-role-switch:
> +        type: boolean
> +        description:
> +          Indicates that EUD should act as a role switch for this path.
> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
> +          between the PHY and the USB controller.
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description:
> +          These ports are to be attached to the endpoint of the USB controller node
> +          and USB connector node.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB controller.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB connector.
> +
> +    required:
> +      - reg
> +      - ports
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> -  - ports
> +
> +oneOf:
> +  - required:
> +      - ports
> +  - required:
> +      - eud-path@0

Do we really need a separate eud-path node? It doesn't represent any
particular part of the EUD device. Can we simply add more ports to the
ports list?

For example:

ports {
	port@0 { endpoint { remote-endpoint = <&usb0_host>; }; };
	port@1 { endpoint { remote-endpoint = <&connector0; }; };
	port@2 { endpoint { remote-endpoint = <&usb1_host>; }; };
	port@3 { endpoint { remote-endpoint = <&connector1; }; };
};


-- 
With best wishes
Dmitry
