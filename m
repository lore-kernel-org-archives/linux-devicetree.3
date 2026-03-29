Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA7A37E307
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800366; cv=none; b=XWeQyinWnCqpesdSb+LnMaofYzs2bD8fVj9/iLgYLgnaruzdEetNNmx4x6x84OyZS/F1P6gdPN/VT3rHZpLkITUf/1pm9fe6i/+3i3qhn/9npx5dlxHhv6HZQWuZYj/6DxbxgFsolWyPH5APNeHUVdPZwLoe308ryT9nhc29tL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800366; c=relaxed/simple;
	bh=Wwe2bhibkSBJWH65bJq2OBBqLcUCNgCyphGaSLdh9H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNVzJVKImTeIQSGG0Hx/Mu6riDBflbkW89J4dWH9WR8oQ2UN6hZJr9gLgJ1FzqL3MstIeiHTocI+dhgkqbA1Zs91Wk14mPXw7mwE7S5X1mR+rC4fnTDmNqKUCOrMpShJg0XYXzcai5oq7Gt7VIrCYBhQQNsRmm0sGO+Ut0dfLeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJioA11N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OG9b/TfE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJioA11N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OG9b/TfE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TCFMI5078183
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6a7xGIW+v7su/rHPH4IwJYil
	91h7hViXWx6i38aywTQ=; b=IJioA11N3bt3gVfAXhRSWSHZKrupWiI00yCJ/752
	xsZP9xhPCm54Z2V/mXSAN7PFZ/Liq0xkd0qdnrA/DBiQsfvyn6t2k87CoV4oP9Nh
	kfSf0A2TzLuLZHstPjuNcCypEp9o1+IU2w5YSqke/AUQCvmnE0g5/Ckbf5T8n9zx
	mpR5DPTDGQIcTGrQQ9X8eqXGOAazitDWcISDvASoZFZYYSxa1vIOg639o+21hiPn
	QdXBFPexO0IBxgVeplR/BcI8X4mqyjZiSEx9IJ1x77IhPTqeWlTQOe/JsncZFskM
	b/HxUHkSFv+I3cLzO+nCFB4fOSdLHos7v00JQ+DlCFPdkQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d677134n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:06:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b317c40acso48572841cf.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774800364; x=1775405164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6a7xGIW+v7su/rHPH4IwJYil91h7hViXWx6i38aywTQ=;
        b=OG9b/TfEF7V7hapoX67KqkYvR0pE9t3+E/BTBqXRh8njiVo8CDZO+O/iJeCUC1BxCm
         1Sna5u4gNvZPo/Gdhd1WkBlc9ZQm2GD2oUUep7zPOylEzBemj1rjfbjEQcPIQ18t816d
         SPOTmN24vY/5mdVbXHDOI2gHTiqHYatxsbEEyQJNVihRSBLs6RD1QkSnJ+SFFFm/b4+o
         EvdPxSaAAhZItvrCSA+HuubFYckkhOhrH1p65aYPRkUWZDH1boBEA08/PhubQYyRj8bz
         lUmKL115M+A7CrY7cMOKumOn8mHCvhySaqXjs6zVNTRjuDQmmawTAmAdBJewOCo7X4L4
         SG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800364; x=1775405164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6a7xGIW+v7su/rHPH4IwJYil91h7hViXWx6i38aywTQ=;
        b=UJRcVH8DtKOfvep8uxD7gL7wCUCzT9B7cYMR0W6gn2uPzArW/LWr7cmaMoPtuO5UER
         eECBa6jlxvgLLl4byFVS9zqsc0nQ6CVKhiGthvXRoMGes5dXtZp48xzUFyvQWXkWnWp0
         pzjD+YzKa09DA0Vj8G9vR5bMWhqi496cFCsffFy2c8ynXhuzBCKXL3sxAb0gkBNjqJP0
         2lVL94EX+nzU1XDLjrORoYP3ZIZu9jgsBkIyedSpQ4/8dtWTCfl3XeEA15mNPOFO2t+S
         o+BuUekXHgiQWWV9PC6ZIE2ax5GTzm938tPo1bf7UoXBWlYl3csPwmr4nLFjls5itaVS
         XnIw==
X-Forwarded-Encrypted: i=1; AJvYcCXUo3NbUNOSnQKTwHsvHwWr6oeOBBUuq1NsK1A+O92aNgt5H0Bys2m3X6AZQ2yY0LAGbPTG5HQjCV/3@vger.kernel.org
X-Gm-Message-State: AOJu0YxKykN4rVwLIlZipRpfFKCwosBZfXzn2Fu9BzuW1PzxRs1wIp3R
	XEqiGAx6vCcsc3XSOyz/wR+LahncqyB2qUWnhMDD4MuQrKx78Da+JPGqT5aSEVe+WhWtPfeLscJ
	+D1ir6zwKoU/Wi0qnpVgQFEJ+3tl+d+SpkqMwHB0f2PRxTzP6zhEa8zveKv2pd1XZ
X-Gm-Gg: ATEYQzzqFUXzHCuvOVk//OLA+JjqQxiRQr8Dfz6q9uuzwrq3WeiaMi77iChCSHvSP2g
	rylzj98IkHSvtQCffbLAR2/gpJqYS649qCCUAJjEmrTk818ErgOF2ewwCLY/IIZKEBToKyWyGF5
	WJzwH9dCc5X2F2Zo2WP4zYyn8QpV/k9Zp5KCpZUHvSkAOHBpd+8f62H/kgVyu7hvk6wHZcILRKF
	9HXwO7ujhQf/MqJz/xSPHNOEC0CJVb7dMz/RNaRe1Ky47/FPs4UlvPF+cJ7Mo4ud1mLoF8rEbPS
	SbJ0HxD8W5LH514pK6uLHLcQP67H5BvLkBLC+cFFkURRpcJWBtkwHi9yOG0FRDQcwxImxE2/P0m
	PA4IBv3k3t5IL8pzRAvXTquzwvgAKLdx2TP/Mw91QDp4e+oSjHDOJUncNumd5S8CHKmxQIxuC7J
	ySJAJ+UI+jHDFiIdmsvdQkLdoPdb6KjIDjpRc=
X-Received: by 2002:a05:622a:908:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50ba391864bmr153157221cf.56.1774800363815;
        Sun, 29 Mar 2026 09:06:03 -0700 (PDT)
X-Received: by 2002:a05:622a:908:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50ba391864bmr153156571cf.56.1774800363385;
        Sun, 29 Mar 2026 09:06:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444a04sm1115976e87.48.2026.03.29.09.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:06:02 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:06:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: fix indentation in sdhc2 node
Message-ID: <5xkirxih3u2nm4kzeyiudisa2vmz7ujworo2rciyuynjp2npqt@cll4ysv3nhkh>
References: <20260329-wip-obbardc-msm8996-whitespace-v1-1-ba3a278f043c@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-wip-obbardc-msm8996-whitespace-v1-1-ba3a278f043c@linaro.org>
X-Proofpoint-GUID: gA0EHFkwif7vIOFetyRo9mQraRoPqfrW
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69c94dec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ohd0kZHHd8clEy_HuuIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gA0EHFkwif7vIOFetyRo9mQraRoPqfrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyNSBTYWx0ZWRfX24sxkEoX0MJ0
 c2sx2wTlHe4I+ge0jTHM3yn0wzxxS1B5JG8p59OmU9/dabzKkp1aKoPhhiED3/v00FYs7R1CImm
 X+cb8i+dpf89uLbgRJA2QBr2OkT9YyJoErt9ItA9WA2fwQl582dz3YsT+fqRGgvOsJsYAYLG4IC
 OWW0LQwZnoXiXgD7SSzsrmBClfYV/rUguB1u11y5KtNRCM2vLAlDDUUCc6Cr6RdR20iGXswt+J1
 BJRm740K371YBfWUplE0u/DCE36QrukpIjVVBxqVScOkPa37sfCLq70Zu4In9QLyYasjyeiJ4HK
 Szy+UGveO3VhUccMRmm6DpFuWQAnGeHqNNeeagQtDVBSsKy3v+Snm2JpJggLw63PwRY9vaMv3Un
 PkxJvErd9rcngPquSbX+qJtuiW1OjSZV/hOhcJZI8Ng2TBlr82j+bT4JWU9OCZ88OqbFWARsp/2
 l621m2etKjBoE+SWBpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290125

On Sun, Mar 29, 2026 at 02:12:26PM +0100, Christopher Obbard wrote:
> Drop stray leading whitespace from sdhc2 node.
> 
> No functional change.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
