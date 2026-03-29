Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D20E1A680A
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 18:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807672; cv=none; b=SVcjptKpEB4FIc0ka2b7X4tCjed+dIuTSB3M3RQU++F1PAj/pde8gVIgwcyHLpJ1biiIHGQoMv+Khy0lofEg1zRNogQKc5vJbmhdrPRGUjSDN0SVxjGcA1f/LgnDe0TxJBveAj8sMr90tqorulQ4oMaTft5+SFl/9SekGIzC2fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807672; c=relaxed/simple;
	bh=vUowB7nDStoKSADM/vzpyqzwMh4olIo9XS20qyLDbT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnhppAwUqSuwr2nkAXMJhEWHY0+rbs4pYVQAs8eOOLXQCDBhOSfjAIFlShO2vlW2Tck2VzJEn7ArBGd1lBP8J98T4xPWtc7eTfWqrOUmKYMlBSlw1+UBQlwoliEUk1uimfckKxZ7alYwFJgUSTBIHtxgwnOy7j/cTRzwIa5t64s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d37PnIhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gI88UDmw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d37PnIhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gI88UDmw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhoso201859
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 18:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YYl0wwaAziKR5O9zBqq1rjYn
	ijj6Hj+e36Geyq5FXZQ=; b=d37PnIhcE3QpLKIyhmgkimQ8DHespxGbgx6SkM44
	9H85TbHWOTnW0xsANb+ZgSNSGfKpY+92WzfazYeC1sO8qL84QpnnH6QqH3onVKJ/
	8GHfQ1m563t+W93IdncEbDgahJcIZZRxJ2Mbiht5jo/YAMN3ix9eJurluhAZaX9M
	EIMEQVDJy26c92VSdj2qy4ReLL5fiKDBo0w0SKAxkS1zdo8XaycGOukD5+FpiXzO
	cUsypOhNl9JKbi0EMdDDrz3zTQMX8RZzX0+Ue4SmTcfAzB0NPs1TTtJpvxL26zi/
	6IKeWm0yQJnIsP0YJrUmO/5iAAYJ595WNBFZnETtIIvzHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwke9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 18:07:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso566861285a.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774807670; x=1775412470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YYl0wwaAziKR5O9zBqq1rjYnijj6Hj+e36Geyq5FXZQ=;
        b=gI88UDmwEnh66sCs2QRoxgE3dAKKkzKpR3gzjOZniRiH0Yz7qUlrUBsR7ynFK6UzO1
         awGWO+0oRYoRtSCtJVzy6MtMbnkjx4DjYCT+ddWC+397pZ5m6boNYaYApjgxEJrUtdXY
         uHN3AChzou6TH9TFGgn3yzJEqLvAWFPN6CbQVkMniSXpaDeyS0ydfQJVyfCSoagr29EN
         4qCQcbOmMbMbTXGXKX0PAHN38lj0d4hoRJJ14KKnUnVUV6BYl5vvJxF2+Ot2mOqbBItD
         kQQmdoXy2kDVN7+TqUz3hU9FW3TkSThDTZbJgBd4Jz2Jvd2WAJRH4n/K2YMCP/Aar8tA
         yFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774807670; x=1775412470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYl0wwaAziKR5O9zBqq1rjYnijj6Hj+e36Geyq5FXZQ=;
        b=NU6riH4kyD8yTGyKF3EYaorx1mN9F+vL3q5zKAHLone6W9qtqzBUuMwMCO/XI2a33A
         sbA7Zwilajm9L/CA3KEgqo4FipxOyuHBNZGqi/RoBwGR7A81PsGzOqPc5zLqkjwZWMIW
         FbChNESVshdaBaZS8xKtSWQTmX9ngaPE9sD2hqqy8SM2QQivUnEMO9oeqo+Xb+MPzMX7
         mPWU3/lPhWBKJjPIkrBXZtGLdtLmzCOmjcyBrl+AmvQSuZo/oyApVkuDp5cqYiA2anA2
         uUzBCr33pyvYD1nFUkWXoiytIsiNnVjMdfr4sWvuNeOBx649g5GJSusUsW8AYqp0aicm
         GwFw==
X-Forwarded-Encrypted: i=1; AJvYcCUa400QW9MZfYVqBHl6icN6QCTiT1dgpHV6SbVUHmyYgxoy/rZjMZevcjrHg2aVjDbiNbrXMOeagDpV@vger.kernel.org
X-Gm-Message-State: AOJu0YySC4vhpHfVfLVatQbR9ZqbQh5Blup+ylB12I4Nr9535RLTL5+m
	NtekdJapVmEglB/1uZeNp4FnwaOXZSshIsWBMVAPUUlGWcF3MOxIJV9x6vvKWfEzEjlySbqzedU
	W/YhUBzfXyKzbDq1HRibo7SqnFs7uKjQblY68Le6aWc518T6hOiwVGyc/4RQ/I3xW
X-Gm-Gg: ATEYQzxjN6LvHI+MS8Q1/1q4pmrqWUcImmtzowt8IAueoKlJPk2bLgJdim5SFXYvB34
	QO0+Xsxgdf8JjlwOtvvioIl3KMPmUFQDz1e9ctDVpWgo78Dw8lVdVm7tuLbzjQE/gkrd7u0uQPh
	bLl2YbpQsj2FzRRhnEmsLz4wnfbX894zdI/KfHqOqkHU6LojU/Ml0/sr9XWoakKFMtfouGCB7pB
	PRehtJ9hScn1ERy0Kh0PRcnlw/sHQB/zm4RPniaNW5RGjy7fvDKauZ3HJXmzdL/KkMh1bDalHdG
	UgZvQLx0MHwfqcsKINZ0Ds3QMd6bNVQqqirAOs0PhILlVtZX7DOieBLcqaz5VtHKT5QX+UVXkAI
	1wKIRfaoOTglusKnZEN/WQ4thZpZaxz+TvTchxD1VdwAVPM69gPJxnFuRkeqNlUKc+6IL/L2EdH
	m234Usb0kXnl7fwYUcRU+IeMHU0BOztKhIzxg=
X-Received: by 2002:ac8:7fcc:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50ba38095c1mr130949641cf.8.1774807669631;
        Sun, 29 Mar 2026 11:07:49 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50ba38095c1mr130949301cf.8.1774807669118;
        Sun, 29 Mar 2026 11:07:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd743sm1157062e87.21.2026.03.29.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:07:46 -0700 (PDT)
Date: Sun, 29 Mar 2026 21:07:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanpaali: Add USB support for
 QRD platform
Message-ID: <qycxxxlt3koyt7snnwpkmpo2udskhad3l5vjpj3mpdi5qyoriy@akxv27lrpi3n>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-4-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329175249.2946508-4-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c96a76 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2SPG-oWb6AOt4c0v4PsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: PZ4OU6GF0xvmh4zFiZqLqEAgsdZQNhWp
X-Proofpoint-ORIG-GUID: PZ4OU6GF0xvmh4zFiZqLqEAgsdZQNhWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MiBTYWx0ZWRfX3w9a8YQvnsM+
 gkj9oaDbNIDHFvyLiRM5drIbrTgrB3WZil2Ftg3APAay561xSk5yqds958lpM1huyl1LcICkGLM
 hMWHBx2yQNZyTqIdAYkWMdoSy1TnOg5pNcfDt8gQWrfNTpxIR4bP3O/aNPzfA86+6ITC9v3EzlK
 cfbaI267z9bMKLdozPJsnpI4TmWw7Htqf6GBxJa3mEnoeI7F+PQkMWwoYpYD+VPji/xcEmtt39y
 f14qibRn+qndj33b1kPLYaU6gEh//pVhXyXmfsPpPZu0MeKu4UDWIBCr//zhiyxoFoVmuqib1zu
 8pYdudhH9pAlfZQeTvQzoHcpfmj5c9Oq3Y41lb1Ku6NO7aFzgAwvxuJXuPlz1EF+Zlpn7kZ6MqM
 b5nj/WK7Yuzp4emHTosElP+FDQ/2i1Tt1s4vYSrjevZ73V53JUv01a3xmMSGcfk0iSATwPoRnk/
 02bewzM9/4KzFj6e6yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290142

On Sun, Mar 29, 2026 at 11:22:49PM +0530, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali QRD variant. Enable USB controller in
> device mode till glink node is added.

Why can't it be added as a part of this patchset?

> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> index 6a7eb7f4050a..1929ea273a4f 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> @@ -80,6 +80,11 @@ key-volume-up {
>  			wakeup-source;
>  		};
>  	};
> +
> +	pmih0108_e1_eusb2_repeater {
> +		vdd18-supply = <&vreg_l15b_1p8>;
> +		vdd3-supply = <&vreg_l5b_3p1>;
> +	};
>  };
>  
>  &apps_rsc {
> @@ -821,3 +826,25 @@ &ufs_mem_phy {
>  
>  	status = "okay";
>  };
> +
> +&usb {
> +	dr_mode = "peripheral";
> +
> +	status = "okay";
> +};
> +
> +&usb_hsphy {
> +	vdd-supply = <&vreg_l4f_0p8>;
> +	vdda12-supply = <&vreg_l1d_1p2>;
> +
> +	phys = <&pmih0108_e1_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l1d_1p2>;
> +	vdda-pll-supply = <&vreg_l4f_0p8>;
> +
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
