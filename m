Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F23416864
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169263; cv=none; b=Kqpz5HMumc+BXB7rBD4fv5WFs9Wdhz1DY/ptAfgg0tKzpYU1phNBu62h/Rham0OVd8lZr05jciy1bmUFsYOums1WzjlO732jfhddeSVBd7w3Ukgh34C0rYd4bzk4fAaYn6KfpxeRbWJeTMdLutfo/c4aKRHVjm3II1Q9wFtp62c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169263; c=relaxed/simple;
	bh=VSoZ/Yvflf9njUDjolCvrlg1UsMLdJVo0IyB+F5fpBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APR8JD50pq8C7oMFDUdhu2Dj4mZo2+Lw1dHzs/QxaFhTXMg7e3JqRr0387KH88uVfSXjIoSD6Mvkd3AOK5Gx2vHiicWD5QbAak0hcrNG3xBvIXU2dfQi4I6byV5GEYdxpnqsxItmSiy11iKNV8w7eY2AM6iPsa7I5n/IulKWNEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Il2U4CBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYJX+YIT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Il2U4CBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYJX+YIT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZTB4115070
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TJC1Kk4z0znuYuI85iMSAY+a
	YCrRRnb9JLjoaulIkSw=; b=Il2U4CBwJh4Khum0EV76v3dE8/qPWLka3e+nThm8
	Q6NU4mESW0cnXRQuf0fsvVFgvioIA6eharIUaE3Q8FqWd3HiIEMHTR6uIUmMYZKE
	cZakg+L2qW5bCtm8uWzSjcDjX1bLMceaDM8ibjD4KS23A2YaOdV4CPSALfx/BEaX
	/WfYX8eOkn13MPH8obMMxa1g8RzT3/ioAqKCtAb4RCclbTnfbaSq2VFesHddCZvC
	Y6VaVvHh7MifSBmOddgSAjKKhQdTR6eE/DQgscxPAAx5NWVq2fUF7x3Q3UIUIdFb
	hcKTiq8nNHVthyt13Niiz/KYzAqqpZGcJiM2tXycbeENoA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrsqbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:21:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so59848a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785169260; x=1785774060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJC1Kk4z0znuYuI85iMSAY+aYCrRRnb9JLjoaulIkSw=;
        b=eYJX+YITrWF9oHrb6oqd0RilNZKqmuMKQr/KoA75KPx/bLY2lTr4kAzozRAbUtLglw
         7bQZh2uyAIlHzfYsS/w+JFzYxp0Js3sIvfXLAYqH3yn6WBUHr2+3zi8tCMdr7NJIjJU1
         015lBp88yR6TBSPTBvtSxS0UDvJ+mzn92FO8y8Basg47HGtzHvqSZPs3phT3Ys0YkZLD
         DhJHP5JOhfN+Aj5a5gfBAlKPUcjhT/4DEhXodHu/BsUwefbHW77uf5n3ULZFYFSg1SBE
         +pg1TdFRAJJ/S0P//qn4dDspjkUFxMCRacnNEGEy/QlIQVDiIsNu6KdjnAfPVLPZbdbQ
         7xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169260; x=1785774060;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJC1Kk4z0znuYuI85iMSAY+aYCrRRnb9JLjoaulIkSw=;
        b=qoCYKTR0rsAYNs/srqQxPpNKawd1n0yb3AhPNiaauAJldK34Exs0hMoSdfbt0wo70p
         c7wYN3x4QCcZydzbK1OPyh2zP860Wj64UPfLjgPS/+SzmO2+L+s1W2yLbuzhCIsWN267
         zyKkE7B1PMAemAtYqundI8/YFTkuxMIJhBxJkw/bALpFmGTyWgbmuNMT69wIqGnkpwnz
         jQmNO5y07ZlMlTnBBDuS2VZWgPb1086DxT98YmKTR9JmHhYQB0WiBMdt+1DIAE/Me9/W
         I+TjCQYhi21UVYsaXxyQMjwYUSJpFy2Vf2x252NwlfbiNbs/2t0UeOI0zNjkG9CNEx1I
         0ZAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqn3Tcyn6HuuL5i76M5F0s9Kn3rw6BYJ+QBme+h/oZSl7jWmZJOGIAfUEKKNsi8OXBoKDVEhB1T8SJf@vger.kernel.org
X-Gm-Message-State: AOJu0YytezjHmVT3L7js7cp2hxslrtT6xahvaIIp9nj36xppOVIN1//8
	+TrbvNFNARF4G51OCtyed/VeRLjY79arYb0o7hOVKPB6X+iRG0KW3wzAIxHMliktMTuSkvoUSlb
	q25rbndVax9kbc2+0e2Hkik5ssF6gii2ulw0JGjziMWtKWSqXdSpeLLWXdZe8YdGV
X-Gm-Gg: AR+sD13rTOro13eFEQSnd8L3rIhGvyLsCFUVMLxdqlVFU7nbx0CqacYgCuPcMe+ABcG
	p/RcArLf1X/zCujsZXmCqA71jSPJ6Y75iq3M6tuS4jODHbDPlBC4Sft+qqvUPQ+GZUbpNb8lQKf
	ApyyZKLE8pC2e3SgB38+0uGnwaUGTu3pMw8+vwQr3HRAAuwfFUndIyLpeGzswu530TLTOvWqwcj
	m8V0N45rF8d4ermUio6kJoMfzl0151evTzRG2MyHXw63o2cX2ishdd76GN/9aAzB7a/e6G5eXy+
	p+xNbQHPPpRODhsEPUcgIcnPL8IhDtHbeb4lCExZFQonJD87rQjjm7qvhOp+jIMLU1ISpXZOZbM
	mxEzL5zE8EKEswdZ950UCnCOMc5E=
X-Received: by 2002:a17:90b:3e82:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-38f644f8722mr82519a91.21.1785169259960;
        Mon, 27 Jul 2026 09:20:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3e82:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-38f644f8722mr82502a91.21.1785169259365;
        Mon, 27 Jul 2026 09:20:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm89142555c88.15.2026.07.27.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:20:58 -0700 (PDT)
Date: Mon, 27 Jul 2026 21:50:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v11 3/3] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Message-ID: <20260727162052.eyvmubroov4fex64@hu-mojha-hyd.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
 <20260727-wdt_reset_reason-v11-3-eeedb22beefe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-wdt_reset_reason-v11-3-eeedb22beefe@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1MSBTYWx0ZWRfXwxa3gtHJki6+
 aHHcLXE0J0GISY6fs0/aAwCORerxACDQlTjqq4RASI0ACPmZDtbyAUpfReKz3rHFozK4Fv9Qg9E
 P92ndDWxK21SACpkgia+Wq8hXwybNVU=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a67856d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sTVwHD2wD88z-ZP_hjEA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: meXwAGzW8AA0zs9asnYyb0vx8SU8i3dv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1MSBTYWx0ZWRfX7ZDGKvlyvFag
 FkXNTxJRn73XaxEr/UMe4vOg0hp8n5uVggmoTPl6EGa2xr2OzO+4Do4EHAI+Elc2m8Vn4rQSxSw
 O0Y4WnkZS7q/E+TAcAH/VXfQRG7HBk0FsGjfurIUD3vMEgQi5dch9d455hCsvtxAnXzUJntF28i
 YN8caVIatTxeiwM8qP2Kaq5OrL9IUhHoK67hWzIeT7LYZ0bMOURgf8ZeupFqtMHPVonYBD5VLct
 vhaIx/AjLyeAJ8aqupZyLoUdV/QkwV6BdM+mN3iu6xNliZU9hFY8otyMN1kzQBoq7ZVHIalgYwb
 6uC2+SE86m0drkKaXDJnoCpoqFxJLryVQXbJ5khEVz/VSThJu7G3szUKM7b0jKBZrBjJ2akxNrQ
 LPO/zvHtH2k4DeSsdi98W+Plzt1xobdVVnyB5PZ0LfyvmBkby1SMrcXGW1qohlwd8CuF7wUR3c+
 egLEm5tAh512Y/ZT6jg==
X-Proofpoint-ORIG-GUID: meXwAGzW8AA0zs9asnYyb0vx8SU8i3dv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270151

On Mon, Jul 27, 2026 at 09:17:37PM +0530, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.

Just checking if it's XBL and not TZ? who writes into IMEM.

As when unsure, mentioning boot firmware is a better choice.

> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index ed61db0749f8..23f851e9241f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -624,6 +624,7 @@ watchdog@f410000 {
>  			reg = <0 0x0f410000 0 0x1000>;
>  			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>  			clocks = <&sleep_clk>;
> +			sram = <&restart_reason>;
>  		};
>  
>  		qusb_phy_1: phy@71000 {
> @@ -739,6 +740,10 @@ sram@8600000 {
>  
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +
> +			restart_reason: restartreason-sram@7b0 {
> +				reg = <0x7b0 0x4>;
> +			};
>  		};
>  
>  		usb3: usb3@8af8800 {
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
