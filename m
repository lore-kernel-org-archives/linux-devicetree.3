Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9C1DED40
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336709; cv=none; b=k1qwNc+NLq0ywGLmdX1YjQGeb1UdkyyhYHcCTTtWpA33/F1D4d8DvRO3lFEDyN6bv3oXzsZbuAuxgxDiFFzlnQoMOit9nUyPDC8lPldzHciZncSV3zcrA6+xXplN22zAwFy1JzYsfm2ZuZMufAgGc5opQkza37U++ZENpNViRbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336709; c=relaxed/simple;
	bh=43aB3Yxbi0z90zDEUpqs9121Cxv4GK2culeC3+AvvS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lA9PTwVaBoml9igjnaMehCYHEBcudI/4E14KoP9igECZ6sPRHf2SeyUgS+n2yXPhSpOglteBx1oE4CYFddLEu65JtLFtPVQ8u7gjqRQUZ6HscZCgBBeG4lndngq7vSoKo5YhJZkYqBli5XGkZU1qMrGuDiDqeJVY8kSuntFdBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVN9E8hO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctDqQa76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVN9E8hO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctDqQa76"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344lrM8919994
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NMHRND1WF2PTszeMkEbK4Rv7
	Is+/ycLti+5TAZCpHVk=; b=iVN9E8hOZa1RpoD7WTkr9/Jv2ORtanHvGTjhxD8F
	tPX57WsNdzxs7dfX1UN8+X1zaDOmNRe0cYihUBRnXEkIcWASaDCx3XbqdxTYkzID
	yvzJMb2c57ipLNLdPxOMuWjt04GmtM2i5zglJNBkdfodKt9Fp0+5ReuhCZoqUnPF
	d7E7JvFXQvPSOBzyt+UOu8cS6TBEnVYqyhwzMK+LUyoue8ylf3W4TgLEN+MwsV3F
	Rf2/4Ey3cHmU5NXClg/n108G9/kIrcVeSaYE/S2HLtvtQ+GbANadnN1ZPWQA+xcR
	Bnl/ded3OHT8neY3MaLHhEtHD+qLh1t6kjqXzNEINS+7Gg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux89d27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:05:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso12580281cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336706; x=1775941506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMHRND1WF2PTszeMkEbK4Rv7Is+/ycLti+5TAZCpHVk=;
        b=ctDqQa76lC5JfoGAvQkmgje+gikqBdzyvtAkMTESH4Abdmw6BJ7tcqwqvAiF7cDRt0
         rjJPG6nFz3we+CpjxGuB9HDRe1GsiffmYgK7RbLKuGHC029vrENkhmDv4MtGUsCCxpDr
         Dro8Hjl5xKt/w9mVkKqgxaaC2xWsxU8nIFCnT4K7oB5BNR5U9ufopkkgWA1xXWZfSSzs
         UF/EU27/Nc2EDfgq04DtpIYfSXAQn/bx47fbthEqgAxHXvQSw9UV92yIxJv53ab/VqP3
         z3ms6OYx0mJtXLLwmY4kyu/udzUu46mf8VrvmEIF4CnkL9MxTaND4nmDuon6SJ8+fhT8
         z/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336706; x=1775941506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMHRND1WF2PTszeMkEbK4Rv7Is+/ycLti+5TAZCpHVk=;
        b=QGT1oCZF+FpoiofFzJb691G56vUv00JmdADDg0Ve67+Qh4KA2a/bHdrhHxx3H+Y6Jg
         +e04EscjoiwFURHDywiRrOCjIzhqguAM9YvRjQy3ROpf4Ro7hf6J5VyqRCdeVwZqhH5i
         zDBVVo2tKrkkjZGEd85cfh/H552IZsh1TqUwihq44wNawTsdtwPxEuFQRcCT503hoL7W
         6BvU+ZOcQPOwqVOLRqbJe4R1B5BaHFIXfNgzTfhRLsC+0aXlBC/QpwYvhdF+W46Osbgi
         5ZFgK7PCH39M9zvgxWS4v++9gfAaM5DB3/akk8mBkOeLuP1ktlzsMBMw9HrJp1X4p4tW
         gOvA==
X-Forwarded-Encrypted: i=1; AJvYcCWRWN0XuFz5YUQnTJR3Vhxs1RKHWKwKhA/t++ocLWOS+KVlWc6xXWCrpeXUZfrqxnm1GSzBmN/COodY@vger.kernel.org
X-Gm-Message-State: AOJu0YzjKlfBK9jOhcyIrdnIsRmf5FMDVmHDc/d0ljvMBOQsz9lK7hHJ
	HSzCpf/MAssxhwq6eoo3PXyDCNbIpVMxVSaV5zzV6F6m8aahxZqW+L/HIX9xZkixWLNQWfOvUhq
	25Tcg8VdBB+qeaP56rSBnD6t/rUQhqnMWUECFYWMY5ogjf2nmpW98tUDuXUtPlyZH
X-Gm-Gg: AeBDievNTc9K+9Ry/LBap1MSpAoVd2Heil0LBpG/EnwvKkheSkZnDCZbKgQYXFJ5V8R
	WXlPNiwgqSxp4kPUV+il8td87TV79zxY9mkqGoEN8yRRuobDbHjP9phIDxbnwkK35XPQL1I2BL1
	H0WNgL6vsjfIpFgsaAtntYMIpBIeGEh9Zaz8B0GgIYBF/8usZlsiKNOUNiFWnPb9d9rFJsPqVF8
	jQGuu9gIlWhGdCqHfywNTkTNFX8QzkiUgJgN9gsplOYYpIXJhK4PrNBTUQmfKrUciCK5pMvIGd7
	7Sx7yDGP/GGgrYqVuLsPE7Ohl1TsS3v2zGJFPTcK8gIBsIsn54ZRuZqD3qDlk8ym4isLM12hiLg
	3/o+A2+ty90dAnzi65vzBebH9cg2JYU9b6JQilGy69b22TE+UAL+7R1WeCCJZigVHZYwtOaUyK2
	iRL9SgKi21vqFLV2G0SHKkveRCH8hSSdIvVw0=
X-Received: by 2002:a05:622a:6852:20b0:50b:8689:bd4b with SMTP id d75a77b69052e-50d62c327d0mr91009621cf.39.1775336706542;
        Sat, 04 Apr 2026 14:05:06 -0700 (PDT)
X-Received: by 2002:a05:622a:6852:20b0:50b:8689:bd4b with SMTP id d75a77b69052e-50d62c327d0mr91009181cf.39.1775336706180;
        Sat, 04 Apr 2026 14:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c9810044sm2030981e87.26.2026.04.04.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:05:03 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:05:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: sdm845-oneplus: Enable NFC
Message-ID: <44qdi3uvm6qcsjnhgepuuxbxukcqu6if2dxeyyar2rqewksgzq@lwha2jpvpic6>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-2-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-2-fbdce57d63c1@ixit.cz>
X-Proofpoint-ORIG-GUID: a10jle_ZsMx-g2UOoxNlUfI9j4n3p48n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfXxFSanlw3+f0x
 Fd0JeonTpiet/+w3UH8V6BREsaTMhDBPJTDUkAi2h5ZkTgMRmg40rGOjguj5IkNkhBe0dzNJ88t
 SBp2a765ylqBji4cq7+tMcP2Ev1I0Q+xijWa7Xpr2+3gurXEq73HfJjzqzhu1GUn8vgB8mGjUvY
 2Pp4wMKpQZr5NyciNNXltKPGJAq7beSRkgMZ1h0U50ncvE49odcm5JjT6LiwG7xqF/MyhlqspxJ
 thwX4M2p0tgOiuxYVrOlFzMGCT8nvKUuyOYKSzcN6L2emS6tWYZZWH/UUYwgZgU+AezNR8cajuk
 C9IdnYcqlAE7jELtGiPWxAURBzG7EJH33/JhPK4kChYsuefMAEERr9c2Ar/AQQD0kqtk7ke4V2V
 aPJtlPefIdRsJAv75FiJQrYMYm23ItCSedOgns+beunhI7jK/fJoSYgl8CeLrKJRC3raQp97v7q
 rWM4ObsvP0aQduHm+JA==
X-Proofpoint-GUID: a10jle_ZsMx-g2UOoxNlUfI9j4n3p48n
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d17d03 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=wuwE3jySQvoYGrhSQ40A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040200

On Fri, Apr 03, 2026 at 03:58:47PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable NFC controller NXP PN553, which is part of the package NXP NQ330
> (NFC + eSE).
> 
> Based on work of biemster <l.j.beemster@gmail.com>.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
