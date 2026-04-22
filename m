Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765923D291
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873131; cv=none; b=j8TbkcTG6C4LhzLls6m2sjtMsAB2N6VuKBd7OIdBFWxmE/BjI+8LqQ3oitmO6ta+IcVMfANb4pnuJ03bp7oDXo1CKYLj2LGJSzeA3KLfMDNEBWmo4KuQmamyk+LTR6Cg+q/aDVkol1kW7jZeeoU6xEwKrOLMFyrqjFFe9z+h0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873131; c=relaxed/simple;
	bh=6WS5KevkbDL9/mki8RE5dkqfJgbwjC9bHfb9l7RoN9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNV1d+OXH7FUMXcAIhbxKYdN4vP6WwUJyU2WCI7enFAktCm74PLgmzPzG0nXUydoyCS54/Py57Q/HO/Sibt96AtQO/YMST8soq+6Ufnhxk8vVphu0hLv0WiR7uOF3+BH+2If/UkCtOfMm2sBJPNeAFb6sFkkr97NBGO/YO3g8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9c2YoP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLNNLS3X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9c2YoP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLNNLS3X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFfKjX2956091
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ANRyX7iZ/C6sgnN/eZiQYKoP
	NnaU+5A5kV7byHfKMEY=; b=U9c2YoP+TsvqEMHsHUApuqdlHnpzGA647fPYymFM
	VTFsoRlR7+QtBz+f0EJ6y0eYUO7cFepiym7HpHRiD/7Vg3nPWEubZsluZ6MfQQqk
	RLeFjRSsRtOPJ132zacGziC59T7IPhICbJoQl0Axf+NgiMa3q8j5qKgGCwezpEoo
	owXLoXq5S99Twr4KmDXPCYgKWuI5IXwhkaU0G+hADnyipcjVir/We7kdiHWy09fE
	3NPv8/P53czP0jFqNt+0qIMALaWygF3x/GMNb1j6GTbE/P6mMR5imDm4nbCrXBg4
	4s365M82Vc7Tp71iZN2yaWOi5FxixBc1gsjAEpOQjEwg7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q015v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:52:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc70cfbdso40709241cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776873128; x=1777477928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANRyX7iZ/C6sgnN/eZiQYKoPNnaU+5A5kV7byHfKMEY=;
        b=SLNNLS3XO5Otgv6+9+5Q3RxHJR2MRH//3nleXc3TiGqvQ7wokuAzYysFrvEpoKgUaQ
         Yp9sOGOYIwSfGsRy7eZmJsIUFxRHG9K6AGpEuG6BF9oThamBrq/TWj15otVF2SbakAJN
         9fsFSZFuG1OxyLu9YV2G2FNSAyln9vfQ5uVIACMgUwDSkm1HwSa/+TnYcj1EoIBBqKs2
         rD/5d+Psw8xtd0U3XLDtfw9gGwDcUF/l/ClnWN5P4yc1DXqJOX8d6a36pFsNMsoDuEDb
         y92aPwgzY8bV20Mx7ZxaOiwIDUpmsIFw7jk2WyLjFkxQ1y5kQ/fKA1nCFPhZzK7Qn2cM
         D0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873128; x=1777477928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANRyX7iZ/C6sgnN/eZiQYKoPNnaU+5A5kV7byHfKMEY=;
        b=rYLm9E19B+5mMMFVD4kybovEBO/R+jwyGvV8KC4nVoPwmfI/IokL/ENKswPsjUvdbp
         2YBF7PtFo6LenpKsFb+CqYnbHHGvO09eVEKhF5E4g1B3UJfAXBASHwUjl9t+AQ4CAJ4+
         qi7zl1PI9OLDGPdQUQgZYgwPDobRUfjw00GTspDeorxUtjydq2+G1TebqjTfuL0sa8Ck
         al6xPOMMpRc9YZqPm9gGoakAVS5jXdqVVZ9SsYfJ2FXuyJ/smCPshXcYw+ER3UO3fY2T
         9zCwIcPxz9CDNMfCO/VWPj6SUSlfjoAc5ptBPLOdOqn55RiV4GnlOYLxbuX0vNoaQCUk
         RI6g==
X-Forwarded-Encrypted: i=1; AFNElJ/J8SNW5dbOGAz6kpB1m6OldXj0ZFKRDZaRiaQ589MpZOC0PrHXBNpGpm9NrfbixPkEPNX4PjqgGqbi@vger.kernel.org
X-Gm-Message-State: AOJu0YwtsJQzCOWzK3XCotA39chsb3xHY5n01UZtVwT85/kAxJA7GFvi
	bhSeXHjAllbFQAslixrAADqdTko3jy/7X2UyOvSdm9OrQYY7Dq4RNECEkply61+IcisSu6icus4
	cYEccxD2NgKnImxysMuZroqMsAJfFIkrw9bMD3bUruId8J7LzhuFEd9SYkBrMH3Ek
X-Gm-Gg: AeBDievZGaVpL60BNOCAH4ox3Bj86w4aJ9lFLUDA49AegnBQ6SxMwItnv629CeZ65Cj
	LmwvuUTe0FylL0S0NTBDNX67CNeLRWt0MOWb7C/YhlFQHOS7/6VUZ8XsMkbyZYMAt3my3MvQt8u
	S6JBd0v691Dd02Tu/HRZvvcvz83Ltn4Juk1pp45GPSgpfENvFlJOkV6cHu0eGsAivXssSdDi5gI
	nazCOJxeh3b/nhy4m1YLPopQSUTLXrtamLx+gtSQRCc2LQv0bdztw7kZCB8RlYSmJUWBC4O5o2G
	fV0XMWlq1BaDc3TWhapAhsz9gycjboq55uG+i9FUEO0L4eI71HBlfEh4iE4o4fkrdOiAzM/iDcg
	E2Si/AR2DDVrcRslSMQ66EGdl+QAinCdBlAvWDh+fuI89E4ffnoafPUEDODcB33CGbQ1W7k4PCv
	xMvvgfXT5yZHbanrpUUYseo5VZr+hnTMYdm0+MBAtObfTEGA==
X-Received: by 2002:ac8:5987:0:b0:509:1579:7c38 with SMTP id d75a77b69052e-50e36e9be9emr353488521cf.35.1776873128472;
        Wed, 22 Apr 2026 08:52:08 -0700 (PDT)
X-Received: by 2002:ac8:5987:0:b0:509:1579:7c38 with SMTP id d75a77b69052e-50e36e9be9emr353487681cf.35.1776873127877;
        Wed, 22 Apr 2026 08:52:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187eb5f1sm4447820e87.72.2026.04.22.08.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:52:06 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem
 region properly
Message-ID: <zfslhzkatlz5ytutij3cdjqsany4uhmefv46mfelw6ay6wb4xe@kwhirycqauvo>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e8eea9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Gv3PURsRAAAA:20
 a=OuZLqq7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m0SRece5YcxD1tc_IOYA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: T1By3qFqnjSY7HHWnDbfF7T22uBS_xwU
X-Proofpoint-ORIG-GUID: T1By3qFqnjSY7HHWnDbfF7T22uBS_xwU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1NCBTYWx0ZWRfX4VuAcZ9QqSDb
 RadaOuhyO7sGEGSONkCiHJ4sA9DlcflXfPEXFSiSKIA65z91v0cW/u4KOcbKrWNj3SYbsMppHT9
 rU2E+1goRxPtzUE3A2+rZSS9rJNMEGr++NvdknZavRpGmbj9Ehnx2RAdVmTWu/NRVh6h2zNR68H
 aqqYBo9Rj6g7uYTJXAR6jXrEvYyzrLL7ySfmdi9fKZ1hOJ0eDC2JGXz34WKzfaTb/ZQxw3hzb/t
 w19bEnfFRvkigqiIxmOVuT6tZ5TPOtIPJ9F2xbyf6lqUEXuU2ZgpsNX4a3NZVb3W+Jk+As2+Ipz
 ErFhWl7I0Sp+LGS4a8Kg8X4s+xeVurTX6cZeTrIxXTVCvVkBysdsC1YYz6v8Kz4jPNuO+OP6z40
 KVv7u9qCvYUaaCyISfzOk1fQFLpHISzVsZzbPNp1S5wpMEo2JwsbsLEUJZ9T7fsATBzuwe4wfPq
 TqqNqhCisIuEbqiD+Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220154

On Wed, Apr 22, 2026 at 06:39:22PM +0300, Nickolay Goppen wrote:
> Downstream [1] this region is marked as shared, reusable and dynamic so
> describe it that way.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
Cc: stable@vger.kernel.org


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 4b47efdb57b2..36b419dea153 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>  			no-map;
>  		};
>  
> -		adsp_mem: adsp-region@f6000000 {
> -			reg = <0x0 0xf6000000 0x0 0x800000>;
> -			no-map;
> +		adsp_mem: adsp-region {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0x800000>;
> +			reusable;
>  		};
>  
>  		qseecom_mem: qseecom-region@f6800000 {
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry
