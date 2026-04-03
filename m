Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ED83D6461
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 19:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244620; cv=none; b=YOLpw3FD75Aj5Nzj+PvjONnWzV7Uuv0w2CqteqaZ4mS4E9n9CJqW+KH1gJQ/MXYJR3XJ11uygaPp0DhmkfgztvDAiA+hi4oH+iAhhrH1S2wbnz9A8dXqt2cZ+137BsPTRFwVItGP1fAQVwrUK9whNiecgS5nNW+hzDRSY58d/Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244620; c=relaxed/simple;
	bh=5nbHgkZ8sU9but8KPZCsdUP48/vis75RxWzu+7Hq7ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3/8QnVggO0O0yubZsRol21n0gt2kchmROyVLAf5Gz5yFnHrAnjoFtusR7rjqF23WiIl9V+6Y5ZL9cxpQ/8wI8XNhE6j5vF8vZnlGbUG5oBLoUp/rlrtBoMalI2E9pHqtdOSSJpxoSHTPYk19oQtGif+u4qdykPhpmUpzj4ut1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzIkdM4x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heP7M17f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzIkdM4x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heP7M17f"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EAsWU3772536
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 19:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VsyulyJEd9fkuORDKRPPQ4Qo
	N9xTMT3iEK0TAJuE1+M=; b=TzIkdM4x1vxQxFaWhQ5g/fzZ3ffutyeUtsQtQe0u
	6QpN8gf5dwvbLwkJApk9Q0CukSmYdGiRw4vNtnOBS+7VxrySpF2JgOJd1iKP9dUd
	U0YHF/SI/3YYtBjt0rUCuh6TtgALvQUEBQMZnobZARItCTCY1oL5iTCz+UYJZjyK
	Q4qCdA9ONrC5HM2dTV4PmYrReNXQ9bzLdXjZqfgEoLquKsuIA7iKUfwCQpmJxy5C
	51SoPr3VOHcf0aPlI6W4TYmw30g+Xla16zl31qzo/f1n83APbDCPNIptlDGWTJU9
	c3HwRa8lhIAQL7HUGC3y+8xoursrsXY7PIxC1E7quLVc/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs40ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 19:30:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b52a2d70cso36567711cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 12:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244618; x=1775849418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VsyulyJEd9fkuORDKRPPQ4QoN9xTMT3iEK0TAJuE1+M=;
        b=heP7M17fW3elKC/WVttZPn4f0uihexcgeWyNVQKg5Yfv8f50UJRHTqsiplDY7y+sp2
         CIAG1KdPRzcHQqUT9OlBjDBntQPZVAiQYafMfZ9uGL5I0OzCFbBwiatrqnAUvrVBiqPT
         wa34KVdLr0TSJiHfuEmTsxGaCuu8ltzyeF+s2XAbV0jD2kabn7Z4SefvEBQ8kx5mfzoL
         Hd1BvuyFQLHew6z0VeDK/7/vWsIZf9oNSi8EqM/8dLRXZB3rStKysiUQZ6D6ARukAMC+
         nkBFitH4KZgJrS0bC/3G8R3qropV0/Kg/UsscNpQjYUQfHPtrJHgwo47bixxNPUVMmKz
         YJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244618; x=1775849418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsyulyJEd9fkuORDKRPPQ4QoN9xTMT3iEK0TAJuE1+M=;
        b=D+01tuuRnYegfaaF1keLKFu2sd6HH23co6I0/N4eIpMPzGv7H3DVKl+clVqjS4HFvg
         /ZZbffc6aMFys857LQcwW1egqF+uJUjLMqS80CSqStgA3WSvc1bAG9EFMHuTiqvadQiu
         x7zXtCm4cs2GBAB0ddarMaGZ8V2ixHaCX5ohAdhSbhmM0dQZ/SxN/ExV18zdhQkKUelM
         OdIJmVzK7FT4ebGw3TugjFFf5e3KDsA4hdocc0NmeayC7t60thmfWgXbE2hQRPY9ZWMH
         p1LF3/OQcumXtw8wHWY4DfMdNmMjZ0TuRf6BksHclJlIbUOk9mgIURZjjVAT17ZXUu2M
         0hdg==
X-Forwarded-Encrypted: i=1; AJvYcCVfCGgMx6Ynp6B8IXf9NHfV1Iy3Ae78BLfkOMwoOV/cFJfZSUUDmlgUGWWFlUkAbZPnFtaSwoUgtjy5@vger.kernel.org
X-Gm-Message-State: AOJu0YyL/eW+CKLHggql4MtaUxhdLNejUA3lKFb4tuS/M9gtYhJcgyK2
	QijhAWqm2VIivnQ41olbQzLIz5QjRoTZ9hXQIHTmCFEfQXQvOe1rKtxEdb4NToVbNzIwKdRhnhk
	jn0XpYE6+TJbBpYsQJUIQUM3Ml+nIroTWwRdAq7l15YZ+P1tSCW5E1t+zAxAXAxDx
X-Gm-Gg: ATEYQzxdv6PzE9rzDFsHu4bU0+GevUPmI4BBR3k1TLQYjQlIIXwDN3Ce4m1OhpP0YHE
	4E7iAAno1yHDnpnvEdAe8ZrR4wnQKjEjbzi3ZdoePmJ8SJsifWrseguu7lHq062ThMZd3OGD5Gr
	iwCmRK8r5cbkAjht5eAt0YoIrN0DBNebFD2/Y3fZPFG3zzWasjfuxWm1LkCxHDDjP0Wcd8mm+FT
	/l77EKtJK8t5ZsDKBfZQoP35kZzs0DjZGOeQRZfpM2JUD9tmJhd0eEsPfg7Ppi3vXRmQs6JDgN3
	yKX5o5cTgRjT5ImirzOAKQkefjda4s4tzl86Xb1F5Dl5kQthevi4gwD6sZPWiAxadekQEoJbtsZ
	ab5JX3B5kRxvNC/c5n/XeLvl5otsN4pjxjKPl40xuX+TzwOk9ksJAKmXMpJ4kS7XiQ86wjJevBf
	1sV4G7j4Y1iyg/OqT2CJIIx/IhPZd630+vQt0=
X-Received: by 2002:ac8:7e89:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50d62ad8295mr64091001cf.47.1775244617868;
        Fri, 03 Apr 2026 12:30:17 -0700 (PDT)
X-Received: by 2002:ac8:7e89:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50d62ad8295mr64090421cf.47.1775244617352;
        Fri, 03 Apr 2026 12:30:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fa8a93sm13810691fa.7.2026.04.03.12.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:30:15 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:30:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add IMEM node
Message-ID: <2xztppp64gvmde4zvj6eevjdowdioojawcnbqe4s4izwgsjixm@kkluxswbo2nh>
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
 <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
X-Proofpoint-ORIG-GUID: F0J5itIApgpAyc4S6EvAdJ0FBGE6mV2w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3MyBTYWx0ZWRfX6+dOxGOQqduT
 B6bml6F2/gIK+FAMsbGvoBbxjUlg/ND3udG2Y2sO6Z3iQDQ2QJPPlW7mc41nUdzJr91JA5hg2sb
 VmMYLoPizkGg44RR5nSomleS/SZ5lTvucUvCqYUO8bOUjMrzljUUTEAnl4bV/TbcvxYWaVQNE95
 EMJnkbAvF8hPWLHw29N5dC5E0hN9e3kMJxX+c6ru8MFIsnkbcUp9/HRlCdYZuONseQKqxuMYc+E
 ltSz0rxm55NFVmSHx8QtSGezjrR6vxzt//RO21oV59p+IzPusso18GqFJEsz54FX9zQjQFQQWBG
 YyJTMKyl1ZQUD4gKsVSFKJXgEoWGKFzM9oe/Re/5y1uMznolt1CwssUrab95L4BMZ97TYvbtRTW
 /YEpFQzhazVbY428CYxl9iEvDglDt+VpPf6cEkhp/QhCK1/5ilfg/11CES4jwiKSkhKjPuNWjzB
 zdEWtcDiOWl1zXWlhSA==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69d0154a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=6H0WHjuAAAAA:8
 a=Lmd6kY3naWo9R1DdeU8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: F0J5itIApgpAyc4S6EvAdJ0FBGE6mV2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030173

On Fri, Apr 03, 2026 at 05:00:24PM +0200, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 4a64a98a434b..1c045743ef77 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -2289,6 +2289,25 @@ scl-pins {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,milos-imem", "syscon", "simple-mfd";

I think, the latest trend is to describe IMEM as a mmio-sram.

> +			reg = <0x0 0x14680000 0x0 0x2c000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ranges = <0 0 0x14680000 0x2c000>;
> +
> +			pil-reloc@94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x94c 0xc8>;
> +			};
> +
> +			ipa_modem_tables: modem-tables@3000 {
> +				reg = <0x3000 0x2000>;
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0 0x15000000 0x0 0x100000>;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
