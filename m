Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581963E9F96
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590636; cv=none; b=FL3f4qjzh9nppBMcVRelz+33Y9puzVoiJckFWuVWlj6s/iqOeb6tL20KXAIdIeO3MLdDwJR3vVSvfqmv/J50EBl7o8GxcrKRY/4qWBbFys7kLO6JzJxscdQqzTPGrwRHv+8nEMwqS7BUJuHxzyW8u1hx1T9OHNvkzXHfaGN5TAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590636; c=relaxed/simple;
	bh=c5e+RH3E6BmrRa8UbjWkDjhMxZYQIeSQf3DOR2u3YjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4+NJLeUoph2aez4DwUaf7NeravReGaLrLdLklk3chOR8509MJ/ELs/iFsCrTGPwmw5xCxfGQO3J8J90JYy+yqGf+FiqRHgdiYd5W8Vq4RYMX4q3qnwkP/1yBJEspoJZwEQ9Ahcnk68r1wb+UjBuc34Wj4smeRr79Hxoq+dT2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8XptVho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFvqYOP8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8XptVho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFvqYOP8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960HR1887989
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 09:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XfxdPHx6eqiLlQQrPi+ZQ4yT
	Abs1rN2/s4CNpfPl/ik=; b=V8XptVhorMRLlxVwMsHSa63kRBbkvDfyoqRDa4pc
	u0CnliXo2l3hlzuQYpUAncHvJOOtH46NW5l4PF5fK5CSQuY67+USs5bTgtDl34cV
	+WKSD7pyQYJgaHD/jLLDG9JF+IQOfDGc56QD+7Wg+14Ajr7RqmO6Szy9AQehHAID
	OIH2paCPqWCEVjb1BA9OLGwFCOTZOrp7sV2UB5GMpWH9coNaYq7+9+UOqQApzi3r
	VqQLMAR4tv7nEuGXOpEaKWUm1XDr8EwXO8l4Qv17dR6niHfWLFZCbL1c+TLuJ2ad
	Sl6ut1ZwEMrLV8VCE5QSyC+/pkrDoZWVIVIcblCadFe9qA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33w2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 09:50:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738de163061so783595137.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 02:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783590633; x=1784195433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XfxdPHx6eqiLlQQrPi+ZQ4yTAbs1rN2/s4CNpfPl/ik=;
        b=NFvqYOP8/TaEwgV8+CytOMxRg/1Ef6xnjrNTdSzqWtgtRsWvAbrFjGXOp+dUS7YPqU
         SOjpiFS9ZDQ0eRM8nwhU59eBactXr7Abe1O6xEnuNoR7H8fyBHlcm1pbUBSRNgTQ9GOi
         bpVbFy5OfLcTwzGY1fn3vACQG21dxeeqgGV9fX12Oom482NbM62tLhYK5OGSeDB2pJGQ
         WakpjE5E7QBASEUYUL+FZX8VlmMK/+tNS//AtIHPXthi9sAXL8CjlgRYlQWgbWo4yv5G
         3H40hxkFYGedSDVPRycv1gaAbvs/ogpkiXagbEt5iYfv7UqTiNVCd6YV4A9eFBtDlgoe
         C4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590633; x=1784195433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfxdPHx6eqiLlQQrPi+ZQ4yTAbs1rN2/s4CNpfPl/ik=;
        b=CRKo54cxf/OOzT23pnFkPt0kWuqJPOXXRDBwAnslYBwV2Ld1jFxWolveTiypQ6nlTI
         Ugn3C9xex6ejwDWv0a1zpOKcjU0GnpbHaZsd1r1mXWMDdz5SGVVzvBXplWn1bnAc72J4
         gk6SPIeINAMVCMst/kkTOf9WYVM+qHSrnCu9DRMSZYWvrql3K+3SddSEt4nmnIgIZ2eV
         IW6i6jp4HA9w/SLZF11T4kKackIV4gTLjdeSv3fJjCKzHcHqGAtuqov7Q5Z8YfWIBFoi
         tKpP82X+LkzkEm6eNkTUVudvm8DHqbGDggxZVzAHxP3dy14caEMscDh+EfKUfH0n52ou
         U7KA==
X-Forwarded-Encrypted: i=1; AHgh+RrjlBSgWjsIF8nThXqaki8efxDvGEDmTKWpQTe58yWglF5D/4qX0LV3tsc6zFhIV42Ui50W3XGqkyQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YysE11UcNGPUWfG452FcheQlLVfyt/fb7sZ2MDYdlN9j+IMplRa
	+L9cL4FK/Py9+SbAy6MZbs3Xghy13N+QGEq0jkwzHeCpvvJbmS4oyccc9EbvM03xNh5ndCH1ys5
	WklPOpcdZ9qQxWguehRglo4lxTPZ2TPbpzgZhB+EGzuX34dssBI1/juYwGo08sevZ
X-Gm-Gg: AfdE7cnZ6Eu9rqOrrHnFZvWGTqoCDmuW9Q66vyxMc1I+PN2ExXVUpnWmKu7C7Z18R4p
	lKI8/hnBFYD/hIW0ok3om5Xg490YYr78n04i08Lwg0cE/ROp8ecqjgHvmZxu7Xll0PnkR612bi7
	/gbBBz7ee064CtV5vyyr3KOsDhdNxkyEGbmgUNmUpl6SzI6KGJTu+T6w8257fi5atRJnkBOerfD
	mwgh2oCCUuImmY87og6mmHJzn/nnTMpG6f6+Ooi7K0w7kwZefu2UHKcw9QLj8ZIzusbCqqNcuwa
	mBbHDZUiEbgjX/ile1bqFbzAez/Rnu9/puQm01yDvqKR9ttR3dAQaV/JMuwrPrhsi4ZMxhe1Cja
	ilNGWY2ZFRLXhXQ36HiN4XNbxGbtp0F4Hk8ldvmjQtrLlfE2HFzpB7tFgk2tZtqlU5tG3JKX4cm
	SeIMG+JolsveIskgTDfirhIcJs
X-Received: by 2002:a05:6102:8388:20b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-744f616e672mr863034137.0.1783590633480;
        Thu, 09 Jul 2026 02:50:33 -0700 (PDT)
X-Received: by 2002:a05:6102:8388:20b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-744f616e672mr863016137.0.1783590633015;
        Thu, 09 Jul 2026 02:50:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a2dsm5141546e87.70.2026.07.09.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:50:31 -0700 (PDT)
Date: Thu, 9 Jul 2026 12:50:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Message-ID: <qvegfsqxrtfucwf4imq34a37im4wailbw4atk4ixrcoqedbl4s@ztdd7su5nmzp>
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
 <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: o9JqrRN5zvfhj7LbhiSGDmZ2hltRgmyf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5NCBTYWx0ZWRfXywie7cZD62Dc
 I5/Sg5UPKrteKQIXUX5D9Dxw86yarOVy0uQiDNqr+nDUxhLpgd3NZh0zYqaXkgWuGpD+fHMkROE
 K3hxwT7SQfdjDZgXbv7YW0nuPG+TKnq79VCskQAkg9AW61OpRENLVJw536NGFTfkcBhvjEhe4aF
 iG/SPnFhZ2yeQ5/gkWZu8t8lKYEacWCtmtqazK7dcnq7sZBBdhIj+2wDCuV0DF5IO2NQE9rUSB1
 Kvd4wmVsm61WwaCn4n4XtiAzINj9l3wJflyzpCZN3028AdScUFsv6oD5utmyfWl32CMw0BYV0jH
 X8HqYH7ljk87TSrT6iAtwI6L5IT2ko8ZG8LWUH8hmyfhO158kUehOl8tZRDHb+LBsnF+qOXpzYY
 ShPM0JtDPhccUq81eQGhVp+F0IR2DEJjniKDDIUzY1DvJrwooG05Bjb3BDBVqUUNLROqOMKT8bZ
 ExHQAxczvxZVVE1jUTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5NCBTYWx0ZWRfX9rvecw/boc+e
 J4lf4xfloJdhl5u8RJnHQWlZ1JlGF5u6esPZy8deg/+xWv3zxG+UFz52LCUDtNqADruMxDeckWi
 gYWG7jncECiia+qmFLsB0jKHx35wuuw=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f6eea cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fWLX1mbbJC0hcCIqpMEA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: o9JqrRN5zvfhj7LbhiSGDmZ2hltRgmyf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090094

On Wed, Jul 08, 2026 at 09:19:12PM +0530, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
> 
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..53f40283a3b70bccdc510716b39251d377be7d24 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
>  		};
>  
>  		sram@4690000 {
> -			compatible = "qcom,rpm-stats";
> +			compatible = "qcom,shikra-rpm-stats";

Is it compatible with the generic rpm-stats format? If so,
qcom-rpm-stats should be a fallback compatible.

>  			reg = <0x0 0x04690000 0x0 0x14000>;
>  		};
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
