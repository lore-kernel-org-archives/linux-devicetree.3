Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABFA3E5A26
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701353; cv=none; b=dJq5SZfPZaDXJkAmfARgL9QLPFxz9Su96cyLs19/f4G8MLw6R5w8GYaH1fH2Laoyi6G0tZUqto7pwiBWRAjNVC8Xcukw0VxCqpp9yK0durl1h7FT6uc/UXXEn3KI51ojUsH0tbMvZ6TuN6mhXJICTNVnWaGd5xILDZ17LN6CdzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701353; c=relaxed/simple;
	bh=bgx0puC9B1x58t89nsIA/Vu0Vaps99oYM2U+hYmCYMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew6YYTrUGHtqtHAcDwJax2BP47r5UVwggfIKDhO9Foa0nKTlP1pfNuWUHiLWyEmWM7RLtqWOWzAJ9hYjXqRy1PjowNaOyxUmLGvJWF5gU8/g+ag8MgdwGi7+RbkNAQmi0g/YOQb0vu0V9bdsJn0FxCrKcf5XVnVfL2XIFzTCmxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3F+DjvR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTIeABVk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3F+DjvR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTIeABVk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7dwPn1594683
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XhFILbTxtLrUyeqKqIsvkPpS
	bVh7DYMyBkYHZMO4Wj8=; b=R3F+DjvRnhsO+sq4eitp+mA6txC1Cxi5Q482SZbH
	5seK16JnJ1HEiDONWx+v2vXBvr912j+xfAsa84iWzzacHcW0IZFIBtoLisa4mqpl
	yoDh4gSwBqFy0+jFZUJxcVpccCyfW2h+wAPE/+1Xmqsk18I+W5+754gFr5y4Fc8p
	lcm3JyEDRaG05Q6wWbFjN9NuIYtJhtrVMr8vlEXy8DFUcrNwl9SuOYIaN0dzYQed
	1YFj0HwxWisZT/mLrg70h2attw9Gk9U5IUsc2n1Z/nmZBEE1kaRHjOCg+848303Y
	GQVEkqEnwa7lhocFPEPZphxctkmeZyQWwuvkRK7cQ2KVsw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5g4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:29:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514551d5f2aso22471421cf.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701344; x=1780306144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhFILbTxtLrUyeqKqIsvkPpSbVh7DYMyBkYHZMO4Wj8=;
        b=KTIeABVkWj8MA37U37nXBBcuMGlhAPptDp9/LNqa+cEsSRjgt1QTEYKXNDk+/7zark
         A4ZvCeOGuqedpjZ5yM3CjJhXJldJMPb11ASWZW5mEXXUNiT8Gu+k1UvcGbhcwOctwah+
         gs591tERPtFEKiQOLnNPm/rQgWjDE9692C7BGL5oLqub4fod+OlYa6wBaUhNizAz5/dk
         8WNu1h2jgUD+N7/6XuY+pWZcmRbfbnTWmvfzXcOQYLDuOrM0xqAaSFZU/PDCn8V7vhsx
         DKJ5jTeu4KdcW1PG5cKFoDSbPNq031dXQp6zXDLTuRZrUPOBVo61ffbTOrk5/SddHevv
         nTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701344; x=1780306144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhFILbTxtLrUyeqKqIsvkPpSbVh7DYMyBkYHZMO4Wj8=;
        b=SjTgNXzWAZTJs0i//Yhuk09o5GsH6HRKDIlNlIRyLQ0LK94ZyDW2jN6seHMZznxL2X
         kfpXA1gqEDQ7DS/yOpm6iosCUSR6wOE7pl29ngmWdGMRX0WuJBT4JflO16Mrnn2Yqj5Y
         hZ8mbCRcUL2raY821oKwEHwlKpQGyE5KqTIbcImMZz3gFg9ftepSO7vhiAZ2mT/G6h62
         xqC0eYbUQK08Fzky0iUh39F2mr/W9Ao0+UEDM5uFpTYIxr0jaYgliRcRCC/8AZVabrY4
         sUuYfBEo0JjqVyyfQLlPDqCPRs3mVN1k0cecVBUlzbu9TZZ+nY0PLtrpQJsm3ZhqFD8B
         N03g==
X-Forwarded-Encrypted: i=1; AFNElJ9pTwkd1Y4Qnkkl1A8ul6rCKMS/QoPZwIpFabDzbxHJE1DbUUiz1pzlVHVdWzbFxcQJK6+4vdiH7muy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7JpKaeSaOqhRS0KW2hZ2/VQm4R2zJy1aDKaKG/EaZOVmD+ojD
	DS5GNdAOF61UdTKRpgiE26zl9JwtnEQx6AthXhFc64FaNiTjVSHKGqLFWbTxGOSUpvzM+nx/aJs
	Ik/cSPz20QuOXjmBeHLkhGcSNpeI1RDD0n05LuNJNCOjp3meOGP0oTYugizQDp24z
X-Gm-Gg: Acq92OEol89M0KCm2AiwVXxiVpC3PqckRbxFkK8rm280RK4jyfV+RtQno+/LRo9jF/t
	e3R75UhSu1kSPDI9N+kpr4AZYs/JJBhTBX18cDlxYK3UAnrOKscOGodzDPL2/SoCuv+zi9aCm8m
	0NqC9XUeVaJXypkXi3t1hFyUF2MhIzbg8YWuYnbFuJUirds33ha9lex5BWKgndPdn0gWAYHl28w
	YWQKGWGWkj4VTyAQy+Da3leckMHs2u1+G4P1oEGl/0OLIgIg0UgxI9X62Lt5Nfscfes/FyWU3QT
	UQYR6PVsoR4HIlq5F2pNZ8QxRk8CfUk77uWtfuenAJyMwltBnRnWs5g9tSK7JzHiafVcPHgTHLN
	0dIdxJN+H6GP6zvKrIMICugdF2P/o2eBU+lUqpSnAY1vMQ4fyCCm1/cZuj4qO30p/Jz9NvRrORD
	fCGQJMl1E7fUlTp/JaeXB9mM0aWn87snfENvI=
X-Received: by 2002:ac8:5912:0:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-516d4376f00mr168713811cf.37.1779701344180;
        Mon, 25 May 2026 02:29:04 -0700 (PDT)
X-Received: by 2002:ac8:5912:0:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-516d4376f00mr168713451cf.37.1779701343752;
        Mon, 25 May 2026 02:29:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca7853esm22438921fa.14.2026.05.25.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:29:02 -0700 (PDT)
Date: Mon, 25 May 2026 12:29:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 10/16] arm64: dts: qcom: shikra-cqm: Enable CDSP, LPAICP
 and MPSS
Message-ID: <xq6vkeer7c32fmmofhu3yxnwxns4mn7umzwjf6k575m55s5mek@zrjiuo3eiq37>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-10-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-shikra-dt-m1-v1-10-f51a9838dbaa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a141661 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=sdsj3k5SV4FyJC0wfRUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NiBTYWx0ZWRfX9gEsr8I0W0sJ
 1mpUcgRG834oGxT/12jwyZXBiO5UircOuPjt07/LIf4l+pLn/rIRg4hjYOGSJgtDMWhiqg7+9cw
 TQNnjFT6JZXIn1F74VjYTQJCrf3MgUEC+gJRRaHvbF5nTYWMFY7TVwQYNf+jmGdei7WBbihd4Kj
 KJ+TzY9/TbesxW+yH366NqgV7TK+bkhyuOLsvOPS/qQ4rlrVYhRU0Dy893dxgoGfTo6Ey/cn6ow
 fBZmYWknC/WiufSa8xDjCIIcnwy0cjxw4Ff8iDcq5IfuvMrsfoN4YNTHyc/aN9iDY3AHw/1lk5O
 2qr/4ciFMF7nXFxhI7HAOwnVi1RJcX2UNVQbadJ3PMUE/BAMrUEgedYvEH5AGUl7+4rKrwUZ7Xv
 M4Ri+B1RjTDuubT7S3ihrCdR8oUMj74HYqP7YiVmKMFQa7UoChcJAmbbprQ3MWZsbrJI9aWnQl3
 bQIKgdAL1e8Avc1OO+Q==
X-Proofpoint-ORIG-GUID: OdBIlbV7vt3pgTsI-jA2B8cpO_pPDs_X
X-Proofpoint-GUID: OdBIlbV7vt3pgTsI-jA2B8cpO_pPDs_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250096

On Mon, May 25, 2026 at 01:19:14AM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM EVK board.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c..b112b21b1d79 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -23,6 +23,25 @@ chosen {
>  	};
>  };
>  
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/shikra/cdsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_lpaicp {
> +	firmware-name = "qcom/shikra/lpaicp.mbn",
> +			"qcom/shikra/lpaicp_dtb.mbn";

When can we expect modem and LPAICP firmware in linux-firmware?

> +
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
> +
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
