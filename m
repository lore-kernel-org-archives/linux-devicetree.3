Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9474071E4
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 23:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780789237; cv=none; b=KbKR+FUNPwYwLf/nfYjkm+xU/b6i37gF79WsnqbcQIViXvaPGFVUiMlfhFzRrihhimhL+3mYGk94Un/b03IzT6i4+VX1TDK4LMwvc+potaT3Osvyqxhv1tiofkVrBDAKeirJKxECZMJQjuUYRxilrCiCu/WGim2BvC3TZoR2fjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780789237; c=relaxed/simple;
	bh=0tSg0qtetG65h43kizYT5Ef15BXihynhKBAYPep/I8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAPrcSI0LaBW6XIqcw18ACIG7UZ23BYaM+79cSrVsSaNYa0PpintBPRAFy1LMT/v19G1hQEkTdU5eNrdS/KMvzEC5YOkT7814l7eWXdQWn+h1P8j7uDIZRfe/wGXiwIRy/XG5dQeZlTOzLgA5kuOFUP/3NcGm7iHWOCDvONp+0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMEh7HsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMK2IwYm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMEh7HsG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMK2IwYm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656IheHi2240388
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 23:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ytQEAZVz7Da6jMOM9zHAfTS7
	wz3IgU/VofxpTcuRh/0=; b=AMEh7HsGAgeKLmsrVlGxmY4DyYVgqaXUHeDa8f12
	XKJhiq/GdpvsXqkRKB1/daVMA2BqYazj3xYMdguk3H0PzUSmfNWL1rhm+YJNVU6J
	7lpdhh1WHlEfu38MH060/ITIR4pd9yz9vcisAO/7OapWwJNo/Ufwq+ROEBhUfkFW
	VMOlAyaYEOxG5lz7HvEr7yarm8uYJeVtcrR25WCXj0n0CuQgE42MdQzT2zTOkPPb
	8einbOFjpYqPNghqvNC4DDvWfar9FaZVGLKXQ4xG2AstvI/Jkg16GAw3DbroOgvX
	aJFbD8vc0lO+JZk5A2DJt5EO2uB0SrvbDwNQdGU+Fo+wOA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cty4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 23:40:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6e907a982f5so5723644137.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 16:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780789234; x=1781394034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytQEAZVz7Da6jMOM9zHAfTS7wz3IgU/VofxpTcuRh/0=;
        b=eMK2IwYmPm9Tme/GBXguMiFimvaileQjf2WQx6h5NPGQhUqKNDJG5WGHbF7ojXQekX
         MsV6kxtZuis+yRgmhDbQnf5v+QzOkMpZbx1/aXxIxJfITQT67Qm6uhXZ7xEp+yY09/Gs
         ru2LVIhnedC8/8NEjav8X3C2n7X0DIuPk026Lpijcrz2T8+/ZBUyJFyrdOJtVy8G1vCT
         UelJh8xcnV691SpUrdFDQ4vIaB3SF6Y71fWT29ZRN3f3pxj78t2BPwxnf2w8YlmNBFbs
         eMGeK/qHu0w7NdYDdsz6ho9N4vJDcMTsBtuw26ElcqIyHgaKYJd3yyxx+6KqHfr6q42X
         S2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780789234; x=1781394034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytQEAZVz7Da6jMOM9zHAfTS7wz3IgU/VofxpTcuRh/0=;
        b=KpHdW1ZRkfWLEw4NEMKQXIup+QOowLOfZEF6VKQBwMRwgzq5Gks12DxoVx+v/vs32t
         Ec7yuHRrN4e9+OsfutdGkTNIdq16QSG+n/HFJfzb2eU0wv6UmISL9l1lzgr5JMu1890w
         JslElAerkryzWxgFjAD4bfMtXvullc1jbc2orekM4TuTeaohZ3dCtz0ViF3SRvH6TaGt
         WEjpPrQPcb66um8mwhnzI8RHLM3WawIHFhOHMc37vHH7px2E8jZFVJPEN+TOAOJSyY2H
         g0Pe7sS+vV096arbLXyIPSrXZS6q9WIF8AIVwost9dGcogTKkEGd5SZc/c0+iJfJ5a2X
         bbYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZBMB1hfK+2/kauGeq//wnmewFBDTFJ47M0ltblavt5BLiaOQ1JTbWaOc71K+YIcdi8n5FrptWXSD5@vger.kernel.org
X-Gm-Message-State: AOJu0YxQmBpMhA18YZ1W1Z28tLUlGzu/XNIdpEDe4L0tcQkiYAm+y+Zp
	JwZdZZu+NOZdr4L6nExD4INxJnw2cOmT/5UfaZJQfskVunjr4+vIxg4hDeH1QgKE8VFOAXI2ODV
	NnxCKCbfwo3fCCbqTddZlMD5fkqFTQsqVOVbVbJFeR77l0xT3qqL6h9Ee6mhdv5YO
X-Gm-Gg: Acq92OEL6pqlps9TdIxT3wL0xPJ0uDXDjA6DimNja/U4mzomICpkLDio5KVKo91kCPm
	9vWPmJzF5ppLS3PzJSaEuuz9zF3Mhl6dJNUb1OhvWwXB0q+03AAeQTtFnu+Cq4KRqjntY1wnJk1
	d1pt4WnJ21YwMeFKzho7vueV0FdL6mQOfiULa7wbOfVQZFMGB3w7dNt8h7j85yxqETJW+vC5O9s
	Mn4EG0faBOcFAI1mGfqQzTCxNT/G27sevYYrSixl9aIWSCkoYiOlFfxhdXTWw/i9kzACCfIt7Xb
	TKGe2Nt3kn5CLp/n2Lg/QIeZwDpJ3/ud1ab5F7vLXB+I9bINFLDjx9GfJPUJPoSn374sX6rLDYd
	pkuJ3eeBbl4jrvwWmwYg+F6X22YG6DXrphtbAG7ZkRcs4nrC1RBf5HUmawC1z+/11+FWD4IrioM
	EszGmxne1t7MAV72nMzwDcleg0Dz/LISC3vE1UwkbjxOt0qQ==
X-Received: by 2002:a67:eb47:0:b0:6cc:8a90:9f88 with SMTP id ada2fe7eead31-70037cb32b6mr2469823137.16.1780789234351;
        Sat, 06 Jun 2026 16:40:34 -0700 (PDT)
X-Received: by 2002:a67:eb47:0:b0:6cc:8a90:9f88 with SMTP id ada2fe7eead31-70037cb32b6mr2469816137.16.1780789233950;
        Sat, 06 Jun 2026 16:40:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b98fddasm2695147e87.64.2026.06.06.16.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 16:40:31 -0700 (PDT)
Date: Sun, 7 Jun 2026 02:40:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        rosh@debian.org
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: qcom,sm8250: Add QCS6490 RubikPi3
 sound card
Message-ID: <6svyrusik3lljjvoo7c27b6agr6ipivjxzeyyo6z5va2qaiatg@g4l3vcrns6hj>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-2-7f334e16fea6@thundersoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-rubikpi-next-20260605-v1-2-7f334e16fea6@thundersoft.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDI0MyBTYWx0ZWRfX/Wohlirh7M2r
 61bfZGobfMzZWjuU4joEBslVnGjAsaujkw1KgeJq5Mdrd2NnNHaQxYPbE5QWIIRze5ybHIHFwEP
 OdMP2z8gtlKUkpSbrnCeGC3NTEAwl5CLaycBPN66ntuTwpjA36nPQ4bMsGtwv0IoqO/9ZO4FfId
 4naiAvIWrqPqSYDFRCQxDdgXL9WzIeNTElHGxYGdI0rVIzAVsB3wov7sUaHOYIakqTN/AQIi2mH
 3UboVNVqEjCd/Ef0HTP74RBGrPxNT0GmpaySkh1HDIbI27UWjVesG3ahV1z6QRirf44nffyTgmG
 Jr5P5PscMu0K/MhWxBqlIDSusA+iwFVS4EZ0UvEu4iV6imx+RTeAWqTwiBsX0cvfJ6i2NUQd/bp
 BXVteatz9RpW8grcuJiOEsD9dxTQVEbo0sN2AQCmT60zIRdZ7klXOZ6Silcg458Gp5t5ttdTqkT
 cX35Lmun+cIjNGTDQVA==
X-Proofpoint-ORIG-GUID: mynsHbNjzi2hN3z2zbwU-qO2sY4qozMP
X-Proofpoint-GUID: mynsHbNjzi2hN3z2zbwU-qO2sY4qozMP
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a24aff3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Wdb1h0LgAAAA:8
 a=rWzc97tzM5M_N3PrT8UA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060243

On Sun, Jun 07, 2026 at 02:58:18AM +0800, Hongyang Zhao wrote:
> Add the thundercomm,qcs6490-rubikpi3-sndcard compatible for the QCS6490
> Thundercomm RubikPi3 sound card.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 15f38622b98b..d95e072fab25 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -48,6 +48,7 @@ properties:
>            - qcom,sm8250-sndcard
>            - qcom,sm8450-sndcard
>            - qcom,x1e80100-sndcard
> +          - thundercomm,qcs6490-rubikpi3-sndcard

Would it be better to follow the newer pattern and define one compat for
all Kodiak platforms? Or would it be possible to use any other QCM6490 /
QCS6490 card as a compat fallback?

>  
>    audio-routing:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
