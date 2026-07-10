Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFAF4279FC
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687788; cv=none; b=RiOW0lGwR0QiUQz2FzKxi5BfmMHG3Ge4FqVobD2GPwJIksOHaoHMCcsXic8+bNT0Csjr0eZwqDv0nvwwPB3+XLhCNZqL83tpjHE6x9fogux7bTCbulNBKeLPikxpRb1fHmVOMyDUTCjmIaLhtUHG6MAnGvlt35buBggrbsk1TYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687788; c=relaxed/simple;
	bh=vWIXDi7EN7g1RYhBdEX5hlBl5+pnybc5iWRcU1wS4c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q77YjNrUAH0Y5uNf4UDi65kGQJOftdNfOZSLWPKBjErX12ivupkD3HTGdKpivWD4dIOnNAfw40VZuRmQj0Z01KOsWsrbPJrd2lMNC8PSWPPX0lNDZsyDDtMT2hqSQoqgdEYi0JgYBea2Aku7kml2A4TxW0O89g112pUvOBQKp7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFk5905b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJM89Nct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFk5905b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJM89Nct"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAn6n5570200
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=de+6A6LUYB7HR+bg4pqaC1QP
	O+x/CpPRoPe7ww1CV+k=; b=DFk5905bj0/uFYu0OCqRd6KolTShPnMct5O85a/p
	ogv0fkd0OZ2Kf4zBlrQZomH44cUGNVaU0AEFMDjgvReEeMwPA/0ckTkveakUQji2
	exr8Uy6VBGJHE/sD2/xDcSd0fz3oZETcB+lkQthZl/34HFfZRauUWZD1z4IKREHZ
	2GSk3DH/U2Kue4b3b5wy5zHydY5FNcB1uv3j0LVGf71nPmm5R8rIJbbQy9C29zz2
	APc+foscIooaI4VfGqHTLvU52SoeYiL7suBrlXJce7YPyKytqWMn/E9u6ulM02lM
	V578iUT3vFnkRI5uBukfGUQakgs6FDhTW/yqUuPwLxK4Xg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8f9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:49:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6751db2792dso329829137.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687782; x=1784292582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=de+6A6LUYB7HR+bg4pqaC1QPO+x/CpPRoPe7ww1CV+k=;
        b=DJM89NctKYxNghJnO/LKqM43IxXzRKkKa5LZ+rcY8dwb4thUx9rhgUOin5cac0lsKi
         gtyjk8ARxbx7vCbZGRsux38i7h1vfTxpdh0qykApaihVdbpZPN9TVxLEtg3MfiINpnw9
         bzybDgRsPqByyLmRI6/MEkl3K0+c3pKa0yyR/wa0A3hKyZ1VCIMz8B6gvMdEXwhbjN+B
         kJIJRiSbgux/ruM+1rHBHRxDaQpKCpwzXvIN3kVffTvH8wcMP0y9WnD5RTIyPhF9wzE9
         4o/OrIqXGZOakJMZNVnThfKCUtpDMWv59W998M8Rv31hXXPknTYttbWitVocpCcJUN49
         CCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687782; x=1784292582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=de+6A6LUYB7HR+bg4pqaC1QPO+x/CpPRoPe7ww1CV+k=;
        b=KKV0e7Nm1jInG8Op8KyVwuM5G1ecj3i4OMwEmqi24om7rhdIFIQPNEpkTa0t/NY8vZ
         KR7Os03KIn9jbGa9UnAE8ITqg9RhuanTY4YnJTTCi0cju6PDo88z2Yyb9Bc6mzAcaF/1
         XHRsMwa6zZFzZT8/gzxjL+c1le2gs5POp8j/TST3csoLj0VC8cLzTqKX1XG2rMtn3Bsp
         igIMx6Fgcd7lxMAfXTzH3I3d2d010X5RuC17dFRJYsuK/ZxwcaxztI+fW1RtBLi1p/ig
         luh/KRHMV/G4enRRCvEh0T20sqGefzaZnd/Z0GMTQgwjHVY83zLb0CKrMwKAi0m4lwFX
         /fAQ==
X-Forwarded-Encrypted: i=1; AHgh+Ropwt2bs9FSk5ZLjkH2GJRS+reDUjWiArmwZTBEkCuTMZc/xi7pSJP4+1e5jkx6+vTmR/8dxQXmZqzk@vger.kernel.org
X-Gm-Message-State: AOJu0YwgpGMzGWXQfPVOD0wXAgIOnZua61+yi02fKkh7yGmTOpP8CFpX
	qCxgiaYLggIBCPfzWsBSNIPWGK+70B1e9QbjJ4JZ52R98yCXFjhbINwZ6QG7wMe6svHIo5XRWsO
	m3TCJxVbrxnjRdciMR3xJkXvlvLR/6HwvySP6p3BBiSk9RvFh+oyX8gqL6bWXUdr6
X-Gm-Gg: AfdE7clMhE8xoOsXN+gUiiOe0p1rcYSYD4sdECwe9enN/+hJGeVPb0N4ydP+ZuXH+Ht
	dTilT6pt3Aa7/Prl6+e3DwHoZw59e3apEi82wmIZfKzWP3uyEY2BQb7mjnn2djrxNNLRheFZqTW
	YTk643LDjglYVubbKoov+CQGw79Scn9p9+amY+0TsF5y4dV2df3ieQTCck7REYkjIbqRcXc6w+n
	sn8e/gCEChE+5wU1PZLx42vm0Sc+EGtbDWc9MioVsK67U3EDz5ZxnwJCL3/sNtik6dWZJe9tAMq
	5bM8OwUEpTsy967UyQn+nBvHc+TLsG0V59IjlNaxcD5eeOSL+scDAQBYv5gH02/QL3s+/q3JHVK
	jg+YolcATbQjSAzi4UI5gIZ73X8YsoKDw2cZ0TbIoJ2PMqJGGwWqRTKBRvGPCoj5JD1JMxH8z2W
	ORx5F6zqavTSGCHrOcCRkOq2V+
X-Received: by 2002:a05:6102:1620:b0:738:9c30:2bab with SMTP id ada2fe7eead31-744dff0aa7cmr6816361137.24.1783687782098;
        Fri, 10 Jul 2026 05:49:42 -0700 (PDT)
X-Received: by 2002:a05:6102:1620:b0:738:9c30:2bab with SMTP id ada2fe7eead31-744dff0aa7cmr6816350137.24.1783687781672;
        Fri, 10 Jul 2026 05:49:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849174ebsm8983181fa.7.2026.07.10.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:49:40 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:49:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <vq5bhzo3ui2zfodk7bcbcsdrewrucric7i6v64gtt2ngmz7t76@5y46ajm2iyuj>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ilYeIuLErDu8xgz9kWFrs3N3qCT0Xot_
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50ea69 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=1PiqmVFGVEL_F1alYJkA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX6BquvywW1byr
 8CGeU0NNc4gEWwp8rDZLpFVknibV29XbsWOUEbpSC/8EFkPfCN02CMWZy5LaD+jA0IDKaw7xTSH
 wUiEtI8mZ4MXD0ZulKFY/+D5G50MnZ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfXznc3GmVDM0oq
 kYlwu6aHdQ/n9oHmWkdr4qR26TW+utH1FwaHmCjjsquWMvGDNONlwLuUsrLs9uFA4MN+bOKUoMy
 ZqRCp8U9lmt5b+hEp4dUVOWSg6WFAj6OPBXODviT8NPczuuTjLLgsjE4uF9Vp5pLa7ZNMDl3A+m
 YRVEmN+na/dYJ35jrQik5V66XQQSNEBndCmkzdXVekIyfmRPH0+HLEpZwsQFtMxWUBPqlOaj9Ch
 h8+OdGbfJAlV2N691RW+Qd/Ctn8tIP6oT6uj1qlP6XIiFOaVCj/an1duCAp+5h87fABc8i5xGXk
 0vKZtq8T5o6uBKwPAyt/HPmpity66J+ykuRFizFNZEWjtQXaCV3X3+0Hnu42MPZgZa47qaex9yT
 C34+VsjJcssRRqepBYt4mAq5TZzCRLZK0NZvVlGQ1eX2tSjYAbe4wVoiWMHy5zg6vNWJOzXiNxc
 NKa1u3OEAYDM8tj0geg==
X-Proofpoint-GUID: ilYeIuLErDu8xgz9kWFrs3N3qCT0Xot_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100126

On Mon, Jul 06, 2026 at 11:34:42AM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 126 ++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
> +
> +	panel_bl_en: panel-bl-en-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +		output-low;
> +	};

Is it an actual GPIO going to the panel or is it a regulator on one of
the daughter / whatever cards?


-- 
With best wishes
Dmitry
