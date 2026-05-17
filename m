Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4E821D3F5
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779049999; cv=none; b=olvLRPojap3AiaVgZ+Ax2KARyVv7C0GJSspuW4iX2zocbPEo5j5ogO7QUA/QBAPbE1FyGbqSNV3AqfI9X3H1k63PDwQf8PGoD+20YkE5RNNXQ/Bxmo9r52Nj3WpSYPKovLtKQdjeRdheOBQHebXDgRFMbSSMgsxfIspj+ah8f6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779049999; c=relaxed/simple;
	bh=NCXa2smXI5Sk6lIyKm+GjATDEzuCyAQ8FuGq9LlCVG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyPpjOr7fMXiFKrbQFy36rJOrOoow5GbDb8AB2jCHZ/meNSZDSKhi5VDik2EsivGurCNmOLpxg0HpHkX5inkhUQiEG2yC2Etofd6t0SYdh0B1HFQ6y5vq6szmLo9DpdVul6pj8+yntetIjACB+wWpyafGrxKYd5ADycUBrPZi+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTRwjI/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LKZpQyDS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTRwjI/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKZpQyDS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4jlBN2847494
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T4pw0unNszXyTG55BrENIc1k
	yB+AqFsyc5jFxzO2O/U=; b=eTRwjI/2QB2u02PQWbbjI0tZRMKyovUsgr3tn9B7
	zR8eX/fi+PSSlh8Eweow92510jtzBcwDoG0f/4fj2jOzb7Y+RiTDYmhMDDKRrKZh
	o/SEEejVKvknHIzO95DKcZphq+rOIrwdMF5XSJMACCrt6lFV1LO3rkoRPOoqUB8i
	erO25kwcdSPRJfSVJuajtfsERlqpVzMVybmwOhydv/CyFN1rlpTY8VT9dmgHi/cG
	23OBsAYtQ3bbGfl3lpHbGRCpC/b53JeCgxfPdID0jsq2GsyazYcDUjIkwvRT9OjD
	cllCxn4n55Ji+82OnK2IokwVAiZK+HMu2iSKyJuNapeyPg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h01kj7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:33:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51650041428so38056701cf.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779049997; x=1779654797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4pw0unNszXyTG55BrENIc1kyB+AqFsyc5jFxzO2O/U=;
        b=LKZpQyDSYcwnZTv53ULOi9hZ0eZ4tlPu7A8GVIsHSBdQrLLrhQAdy+N7lizC11EjqI
         FahTSk+fnkQj3JPxgMHklNPWeVi9s0GdTux+NRmDFhYrosyrjQlH+yqJ/ylQdrWjh4af
         7oJxLPzrDG7IQe2D+YcTq4Z3+Stc6mtuYNSSvuoCNiZA/GhTVEZkCzJbd/+7g0kOk5mQ
         /KDlz0HNLRPia90/QsgdYnb6eiEVBISO/fAJMzLY2rjUyyZ+KSrSvyl20sts4tqpJUSB
         /vc5q1VBUGDXkPY9a1VMggaFdag3LYyXJHpn8NdJ2DJv5Sg1L0uZD9c2KKazt+6X+OOb
         YCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779049997; x=1779654797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4pw0unNszXyTG55BrENIc1kyB+AqFsyc5jFxzO2O/U=;
        b=DLm2UjAmBCYFRxY4s56kUw2SZvBoRgpAbE1XFaBEfKRXqGFf6iiwWXwdFHkgaDSIOV
         yFpoU07TcdwQacNj2rZgSzSlmdZ4Sn/YHaUDjxcnHIunb8sPP3k2foatzlIwJx74DIGr
         KB9FeGLMHVnrAWuE0xB2y1J9bCzHY9xhbHvy1yOO8/Vj4rRuq6tCQUKDfYdKmev7RbMx
         E7mDLtPz7t5PGVHA/QQL0YBo7w0GRqZRjShJQy6wJ3VO+JXFlXCnsJECgQna1lThMn7i
         a8o1QSh3GxCi8XLunrFin3Ny1izBhT6YmOdPJ5ekze7K4KMPKbQAQfGPTHYVP92OJ0lv
         zh8w==
X-Forwarded-Encrypted: i=1; AFNElJ844juRbGgDrTFjPZVMZVfgJClb3cxhlFjBXMpQ0TkUtxXdzAsxU9ZMcmNT/RMwOkqgLUqatgpGl4oB@vger.kernel.org
X-Gm-Message-State: AOJu0YxS6kNxMQ0Azd3SH0eTIHqe8fzfw2LK00ZL61sPHv2HTA5vAz2X
	Z/jf40qORpvDG0JsqTu2D/gI/Y/QE4p3xYf3SL6fyuM5qAm9W61fmV+YPFXzmrqYvMJgoaCuAv3
	HlQoGoEYEnu+yceYUQxXXjT72UVFKVykTk8GQWbkhDmEx60WmPqrt1BLasD6NCAWj
X-Gm-Gg: Acq92OH3H+wybBzdAmunL2PqvuCLdroSPtAqNWxdp2YfT1k22IlXq9nIdr7VmdXstzy
	YzUZHusxFV9wFR0yz7nTZa2kVUgRuT9F7QSw47erg8nl/VFu29YWVFjrX1JjU71YyegyC9yy919
	Gd/HYyVzqQZf8gw5NJCrFvrlF54SQX83v3CwQWiNWdEaohzazneMvxsy5YXzBFVeXOWGOUkqw8w
	7EPQBaj4BnmfqeGv/YCLXfg8f54K4xyKV2eUn9u5pjSlc/Y9UHLwZMlCenXUTmEMKVzlXlhops6
	K7jfSMPcpicj8/umgGp3RLjbV5jiQdXjikMiVVKsuWBE8U3ZjFYqvCUydpWfoblvT/zfBo+k5an
	/EljitsKuU5nX33MEzSvLyH+rpBjaLerJYkIoQQLKJHh1bA1d35ADVxKC9Nq1Mou1VZf0LQYtJL
	32tW6iTyeYfLapC+q1Wcwaaw77kXcuHBIi2l8=
X-Received: by 2002:a05:622a:1b90:b0:50d:efc1:841d with SMTP id d75a77b69052e-5165a0607b5mr186192421cf.23.1779049996956;
        Sun, 17 May 2026 13:33:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1b90:b0:50d:efc1:841d with SMTP id d75a77b69052e-5165a0607b5mr186192171cf.23.1779049996582;
        Sun, 17 May 2026 13:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c89bsm2921695e87.13.2026.05.17.13.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:33:14 -0700 (PDT)
Date: Sun, 17 May 2026 23:33:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: azkali.limited@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sm8550: add labels for thermal
 zones
Message-ID: <5bxq3x4oodbzjw7nwlv7skg7v2gypna2mrm7h7ch2gx35b6dv7@m5kjlyldb7hy>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
 <20260517-pocketds-v3-2-d5910c801756@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-pocketds-v3-2-d5910c801756@gmail.com>
X-Proofpoint-ORIG-GUID: 8OBikH8WdbdcFC6UQsjDUG_7hSoRz_Ad
X-Authority-Analysis: v=2.4 cv=XbG5Co55 c=1 sm=1 tr=0 ts=6a0a260d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=jiQX-HWlOwuQXeZHxC8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 8OBikH8WdbdcFC6UQsjDUG_7hSoRz_Ad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIyMiBTYWx0ZWRfX3aXSWWZM3mQD
 Iixfg3jWzr1MFLy5fzf7BWfxMUK214PVtcbBU0Ap0aZGDVdmtwR7to6lBQ6EZmRQfPCuPF4o7KS
 JPEpldNJwBXc2kN1UNsYLqtKZQ8AZREHp13Pr03WnUhIF7Mvb3gOdzCocvSaRV5VJdluS4i5AeE
 GSyYvgDuG1vIuKMUxOVK7X/U0iUyuCPWquifvcGGmiom6qiZlSUFttB8oma3fu8kmekCf6Jdniu
 +IeX4bAwCeABCtyJseqP1h4Gjt5dzqa7SgzjJepr4+1V+NJcckNhYDDyKzh464eYbqZlgVTLs8e
 hFtAl5eC8AI9wOA/WvRpt1Ur3KiKGxuej7G1BafPrTulQIT7w2mUbtuuo1Xyj9T3IoBIWyAxmYf
 a7Npr/TZi/6MGX3iiqHHr+I3cdbEmE+y+z+HAZmuQRFmTpu50+lopmqwtDzH+wciqVUx4NxOWuL
 BDYOdoLKUcgg89eGGXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170222

On Sun, May 17, 2026 at 08:14:21PM +0700, Alexandre Hamamdjian via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> Add labels for the cpuss, cpu and gpuss thermal zones so board files
> can extend them with trip points and cooling maps through the &label
> override syntax, instead of redeclaring the zones by path.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6..a9c678fc9cb2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -5764,7 +5764,7 @@ reset-mon-config {
>  			};
>  		};
>  
> -		cpuss0-thermal {
> +		cpuss0_thermal: cpuss0-thermal {

thermal_cpuss0, so that all thermal nodes are grouped in .dts file.

>  			thermal-sensors = <&tsens0 1>;
>  
>  			trips {

-- 
With best wishes
Dmitry
