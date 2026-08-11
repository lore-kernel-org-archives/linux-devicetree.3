Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FD6430CD5
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442874; cv=none; b=esjGh2txd1cF12nwJrWvKqxR0CNKesaMBbf+r+sXHY+mbDkpLprXt3fuf3uwiOaWJeVT3JzJ6N6vS2VxPeOmyP3XR5U7LygH8RtvMJQRyw3jTRZFhoMKNi/NseWChPG1HrvGSZMspTHeqnGC52ZlIi7qbl3Zy7ALLPE26GQERqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442874; c=relaxed/simple;
	bh=IP3uviSFgqAdqvLku3HwTuCcjOeQSXS9m+wWP0ujGUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbM68ALys8V60/JzvNUhE/g6tZiEqX2utlruZtfYzXhkrkeUbHFfhlQllNh6kF6urNngEVFicgmFVGQslNyoE5oGH12Um8mVSeWwXu3yQoxXVkodnhE3hG7mJKjgUzAqmqmr+V6X+rLKrBQwNcSiOj4aGxqj28JFtHQlrRrlhnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiXIA5qv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqBEtMHi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiXIA5qv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqBEtMHi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BA7IUX310209
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f0PV1nf78gJz/48ngj/s9B7Z
	KT+dzu85I+qi7/RstUk=; b=hiXIA5qvExVGQ3O0hs0wUOaNRIQ7ujA1Nbi5VAL3
	KEGhzL393fF5LsEiWpLHdxumr3hi4DbcMGiUEHCwL2DL5mjtsP7hQSWO+CVZ5AfE
	rs/POrbuO2S/d8DYBsjhRe/uYpp5+9+kUotHIaptJy2jbB88FZHijzbHQR1jWjm2
	4CIqJzRKbR9nLIPhDlm0qg0TCD2jHjVcbSJyfUVZU+3FRxsWgnz5pThmjNK+1FZi
	8D38OuCrosGT7Za+WpUheh9zxa9jF+v+iAw6iHQPQ1zHWua70KaXkPSOlUwql/p/
	pRfP9SiPCOjgImBX+fAool2oTOvmytOH8OiHAThTdduQ+A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q10034-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:07:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efe7db1c42so6330126d6.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786442866; x=1787047666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f0PV1nf78gJz/48ngj/s9B7ZKT+dzu85I+qi7/RstUk=;
        b=dqBEtMHidGORbW+1rP2soFd1pFzLj5/rFEwUi+5K3el8EqeCG1x9ycD1+cYbibiQs3
         caRPDf5HE6ROSabbgVgqKGmx7yDUTp6ZXiDWgTdHE3CjtajVneRQdprFsRYNmt3dObQ3
         gkMh8sFeSmwjotl0cqb5jbbE8+3GBTeYqGRrp6GTMcTh4/YGmnbedEAWo+FsunJ45ZMU
         tm4gRnWN/E0aDB06KSiaoaFK68Ko6lJ6zgGeu8h531LlvF0H7SF9F/sNb/cgaV74Xxwr
         A5rYw19+/iaVK/D3tJBKdJ7eHug1glSdxe2U3crcir2qJJCebwMU2W7P/85HFXQFvzPf
         vbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442866; x=1787047666;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0PV1nf78gJz/48ngj/s9B7ZKT+dzu85I+qi7/RstUk=;
        b=IuM4nx6jc8OiOSth8pGnGidz/Krwpp+qgl8ROlzOaXvSjJfukbV/Tbbfmsrx7ilfvO
         CF7FhpYt4EHh9FMCgf99UdWgITMQWu2wmb6gBAxqvcbbfFHVrMYHsrbi64eBNQCfpirt
         V5reo6ThNDIDhFgaazUhSqKRZZxw0NR/F+xdOYojuuSg9JXK0HEHPTdvWiWxd5OcnTmp
         aYPWL661lwfgIxko+WGSdFwYp7GpwAiQEzrF2DdUmLyHuITQuH1gvPFac80x987leBuq
         pKvT8NtEyeYHaIRmTuPoKlqHcjh3gUfLEZVN3QFcSis4n73h+A6dl7pLMJK753CLUyg4
         DvOg==
X-Forwarded-Encrypted: i=1; AHgh+Roc//eVOzMGwlZfV2VQdPCfQFvm2x5z+dgJJAxRptuEFmtCCR7suoBR0eZjqFXkFmT0br2WkxhWsudH@vger.kernel.org
X-Gm-Message-State: AOJu0YwHaDTAubTQutuxl2K/bKXksdPVnIhkgiyAmX1cuA2kF75PL5KM
	80ZB/mVGan4Sjg0q2dE+kiBNQk4YyI8SwMZ/QKyiORftpEmIYqHr2wcTXv6TBNo1GfrmV0j1RIv
	fHC/QQe2qnQykkbiEkgDNM4SjDmswSvpRzXsxMwkr+pnr6EvJ3HsBMKcZJFv/tJEm7GGdXGFS
X-Gm-Gg: AR+sD11zTBekoZMZZsMKUZZaN982hMJj568fX64HHESVIsUWYCGqI3BK8aGiRKO5wx/
	8RSbiJVj0kvVmV8NsafDM2qkKd09sipXnODUjfFwWxzzYWxfoEfEHawoZS2tm3b97ukrEgtT2t8
	LWRsF7YCijnVN9ZLUJpltKbVZThd1cyCuKpwNi6wDlhyUdHlSjp9YkQPhliqiUV6IyPXM6eRMCl
	Xw4Oo51agIwcZfqOfUNfK387F+pC9gbpkWixijaaj24qwyRdP9Cdjv6zEyVMA0mEpXQZP3s8xbW
	bXu9Gwlc+UDEbwRg26rHDU9KtiKegGf5oZFpjGwuqUtUDxb1b8PkbJSm03VzZrjstbUM5W1J8uz
	AEsUEz/5bjITyRWd/mEIBk9B2ChlDaSNWKw+2PUmNKmWAJmWZnuzVVzl/t/2piedTGlTtXkKeYW
	3eo/OhgxDk+VWiPg==
X-Received: by 2002:ac8:5cce:0:b0:51c:1c2c:a8bf with SMTP id d75a77b69052e-52d5870199amr14591191cf.43.1786442866417;
        Tue, 11 Aug 2026 03:07:46 -0700 (PDT)
X-Received: by 2002:ac8:5cce:0:b0:51c:1c2c:a8bf with SMTP id d75a77b69052e-52d5870199amr14590961cf.43.1786442866030;
        Tue, 11 Aug 2026 03:07:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3fc5d2sm1669011fa.10.2026.08.11.03.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:07:44 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:07:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq9650: add the PCIe support
Message-ID: <e4gwudluyhv6y6obygojott6dbkvtqnrgo3x5t7n7ogrrpyhfu@l7lkbkry5bex>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
 <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
X-Proofpoint-GUID: QXEtEokkBSUKh99A6zC4erFVAZABp6f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfXyIJxqe9N0rmL
 fvPCEDj/JfKGM8UEJPK0K+UvsjB2qv2tfD1dfVcWZLYsH3rCS4UaTOWhry8CVJ7Q4DwmwFJkxLE
 gZ+Kxfyte10lQSfoexuHaPw2GO1I8O8ooJspNcySQYx5nIHqhRL/ptDAHVJfMLQKXC7jgn7ZoFG
 7aWO5vbY/zwAH0QW0sFHX79889OUJKn/hLH9Kd05Dx5MnXKnJ6x3wi6mkj1VI1nU0LN3MPLxBNh
 JD+AMOr1dHwlIi9oUEtZymAOgJIIjKB6/SPyhuyfMdFTo/n0kBW5Hr5Z/xXzZ8Jh9hxAlf5wDHU
 nT3zhAoA5j5cL6pne065GnksmF/I5XDv9Sk/cyZf522AxF8v+zTnnvrVB7xAzfzAMD7uCsshyTZ
 TgTz4bWnA0CONYlzb1b24uvGGuZJ0JOaSTdKE6oCFhPEfXw/Ef2PxedD06dhOrsHuOlCkI8hvIy
 VxVN0dXWkGePp53Luzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfXzPYf30eHaklh
 +2X0LwuRsP1T02h7Flkvj3jFVKuA2axcjHCnGn9k7bja4vZyBV8LDs0yn5Js2HKkYCEF+qD2Bui
 iq04tIAFLJLEQellQ05pAw6LKLgwWls=
X-Proofpoint-ORIG-GUID: QXEtEokkBSUKh99A6zC4erFVAZABp6f6
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7af473 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jIVGqzqqGd92ZoTDXmYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110083

On Tue, Jul 14, 2026 at 09:59:16AM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 has 5 Gen3 PCIe controllers - PCIe0 and PCIe4 are single lane
> and the remaining instances are dual lane. Add support for the same.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9650.dtsi | 665 +++++++++++++++++++++++++++++++++-
>  1 file changed, 660 insertions(+), 5 deletions(-)
> 

Provided the dependency (gcc/icc) lands first:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
