Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B310B3ADB97
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045545; cv=none; b=Y0JSdKzC8igkJI6WCs6atFdNho8efUpz3k75iHzNlvfjO4fqpEQApCQfwuspJLeBlGr45W65cvmSSG7XhlUZMwSmRecBxq/lziySqmNQ88PtvuHghNCXuQmpYwulTfWpk/AdryJVqYSIkfcXiWZcCYWUHYV+wNtcXDcGsX8Grn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045545; c=relaxed/simple;
	bh=LnWFaGodOr1tggkpDDY/aW4ATkwMMhWBEF1iONPT7nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTbX5qPiWEp2M+FNgNinT7yn5O+BXqdbLS7jNqXdVTDjfaplaoTAmXMVX/rCnSoMSRpYQ1+fDbRrt2k2hj/KmqJMw/okZUvPRdAPAETYrSbXkbSHcRo4RccCc3SQmbJl8vyqgjS0gNm+x/2/ErpwNsWNPMksCMdYycTpbSfQAVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJmwfnFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kldmfutI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJmwfnFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kldmfutI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0eZf83044120
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uT0/gMOpUpZ+5E9JDyQGOSjA
	QJzn3ux4WM6EmXZgqs4=; b=cJmwfnFaLIXFTK5z9I9pI7saGsqO7S9Z2yW9ptQ7
	ET4Zxy2GMlPLY16qiKUpvNxq8Lonhk7BhuANvQ6qUVprXv4fpmHKFwXbDhQcxPv5
	46gyi+/s8h3GNfCJe+1tAU50iDr1O3xRjV24bkwp1yJ+pR3GvJOPThIoPRDfsxBh
	ynFZzVHqL37c9F0fVDuDd236/OqG33Zt3hhC3yE1raHY23Fcq/64uNql/QiCa7ux
	s7Ge7511cjlco4rK4ZaT9NLw22ZZdi6eYFDLD/cG4ZL1iyPmCAe/eP2KJWtpyBUo
	5c4BK3CksrMGMVINCwBjhakA2AJacUGZFlUKsTrvtIXn1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbard92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:52:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so626094a91.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790045541; x=1790650341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uT0/gMOpUpZ+5E9JDyQGOSjAQJzn3ux4WM6EmXZgqs4=;
        b=kldmfutImJFK1Ym2MeWWzhvnoinI/mcGBMooG3u4vqAWShdrEfkUP16sxn6OPJqbfZ
         bJtS6fp7BnjonIizdP6Z2KyDuX42VXgj+6eNZFi/gXLPlB64KAmFjj2q+rAqLvd46r5M
         GCUBSzGuubMxqUd6bG07H98sbL+iqpjvcuOqZFtwL0C2kyhIvf0P8A11nLi0BCcQr/fn
         ve4OT3h0hkNv2mcQASF4Fu6jvzkSRixBu1pPk4EE7LprxiAhrkakz6iH0GrTdbysVVti
         3CxHCsOtNxW+I3Q2iID/Pzgz08RioDvG8l6qkxMa64EjwMrkIdTiBXLqKrUkfOPiwiAZ
         XXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045541; x=1790650341;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uT0/gMOpUpZ+5E9JDyQGOSjAQJzn3ux4WM6EmXZgqs4=;
        b=Lewe0HdNyLsR2YIIjg97lDEtC3/PxGw2ktVDrEC0gXvBtWTepf60z1Y8Mr5ZOEICZT
         /ApPxhlRIkIvEkmKCsnva71PJvVlEj3zF63nDhLDFDul5nweZvQ27dSMrg0bAQSdm2EC
         M6QPmBXuXzTTkWTJ5nM2iZFOJvO62iQ6seHFlNneoiZ2tadhIAq7gdhwbaoFGi2FRCVf
         qgbVjnAi6c+g6/EcNuYEG2HPDNg68K0nQQLNea8PlZWvZrffDAGyF6nBEqJ5qOebaRYt
         eAqlKIpr8XMpvap8WFddIcpuU739O+FEd4rSQTN4naHkGTaEsoBscyQzohXZCVW1A7Kg
         d4OA==
X-Forwarded-Encrypted: i=1; AKwUvBx8Z7bJvUk9uT8t57EJj8uFcwzpg0zueEWZm+ukCPxIUL3MKZVO97km/7VO0Hxvoo1PmufB1ChSWYZ4@vger.kernel.org
X-Gm-Message-State: AFuF++mkmDlolHS0gaqLQ+Y3PP6j3DH4tpTnWz5+OR+jcYgi9Lwl/yCE
	BPWqmvdXKSkPS+pUpnyt3iZa7mIXawxf0Upfg3LJxnwHNpNVK5XYLSFYROxV5WUul3Jo/gtrH7h
	VgG2sYR/wL6kFEyYicA+bJsIDrBuOzK3VAh1rCuQisfZI1FLljbDYxKadgsoww8aolIQx1ROs+X
	E=
X-Gm-Gg: AYBFou1LxwoKcy2xO1tiy68Mdj7XxHAKFnQ4axtRQ9HBUYHUUZhJyWMh6f1ju9v/EDD
	UCSqbAHNHCemO3l1rndaTk7GL2uDaBOke9KPKgUk9zk93B0WHsMBfQRDatHLxnu5gi4cqqS4iR0
	9ZqFLAlNXfolR2D3j9LucL1jz8dzDUX7ecp6qscgceT5qExoVUDly35eDQGrt0PFhoUKNuN1z8s
	C66SPDTPgchqhJtAtbeZ81clkaQXMZhDYk6quIt826XoGcNxJIsAa9t1vJ//PGzxq7Ir358yVjZ
	ACYY/1+Y7jKxrPFxhxl6RSCZJfTfnFQAfntauf8Cytk9Qh0AQ5tG7cuutE/ntNUBf5z7NKm/wq2
	9pAqlr9+mi96Izc/FgJXAUlBJBtES3GCrsCr4gbjVaQ==
X-Received: by 2002:a17:90b:4fc3:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3a066638ec7mr1123830a91.0.1790045541260;
        Mon, 21 Sep 2026 19:52:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc3:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3a066638ec7mr1123817a91.0.1790045540753;
        Mon, 21 Sep 2026 19:52:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f294d894sm1376807c88.2.2026.09.21.19.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:52:20 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:52:14 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Message-ID: <arHtXsaQtWWpya3P@QCOM-aGQu4IUr3Y>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-2-4f297c983b94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-gpi-dts-v2-2-4f297c983b94@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfXwBv8KDTSVeOf
 uxyc3CyeYcSJlk/wVhYmt2jEzxM+Mhz0JdEiWrH6M/3kY0OxuPGgYtgAkrBSYIL1U/3tNDNBC3B
 pNBEBH8vrHoXdtsA1NfNjD14pk7dBZ59vGIo7sq77Ei1nWFdjbODh1IHg0m5UA46WXkjKkOcxgj
 O8uk3bBCcNN0/+AoTAlWeJKOa6DkFWpDC808OyAlJtQY4lZulG6OZIZFWUVDtwnjPTLSR7qsIsZ
 it3mwYns5laMhyLyll+ScD/RSvWdR5PLDUc1LR9mx9FzsC/j1VlFpMuyhTARPKUKIElfhaLl5mH
 vKrT998UXjpvO33jYSsrqUXYdABw2mKD95tsyauXt1O4Hy2qrnKdv4a4BvPwpNN/5bZYZES8III
 RDoo22ZWxor0z/vEUjVGvtqTRoJvStka6Qqh7UL/HJpz1GJYJnXyplpjBGfw4fh1+oPIbsPixNa
 smoGCexK/d7PHNoDF/A==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab1ed66 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IF4djqKm59Tmvoe2PpgA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX5UNVZPiAz+SF
 9mcywgLwcuCCWLOrJuGZ5qG7xbjC97QMdKs4fqbEqZ09KPmZ5m9XTEgGwNXmUMfxZyczQ6Lexaw
 uf/amQIJc0tha/YBUZ9tePEzzVUjm6k=
X-Proofpoint-ORIG-GUID: irkUUv9EUyuienaLXjgWYE-GerK05s-E
X-Proofpoint-GUID: irkUUv9EUyuienaLXjgWYE-GerK05s-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220037

On Mon, Sep 21, 2026 at 04:46:59PM +0200, Bartosz Golaszewski wrote:
> Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
