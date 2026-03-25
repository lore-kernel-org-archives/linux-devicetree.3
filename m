Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59E732AABD
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774459066; cv=none; b=GWdHxtUy4bQqPes527j56S77CswThDgs7QvTWTebVOGDQO2pwy/mi+N5YpzOpKcJW7f4z2Bcr8Nw2L/Zb3HKWf8dYoRxbmGJhUTaV8O0UpaApZ8IlZ8KrzS+kQ/p3KOMYsd7nhHcaDLdoTKMz8mv47ErMEQpPzF06/0JqGlBUe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774459066; c=relaxed/simple;
	bh=DUeYUo8v2hrG8TO/xuYnnbrW1r9eSwbd9072+pSakI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H36I5/AtcCwUezVJsdL4i/cT8SfNxWNUps58QkgP4TKmv65ee1nH1jyIP9KhBsvZ/GE10BMxuI7qrcDzP6NFcKh1FwSEyBjAJBnZadSEjdCCGRjCgUCAqTk3t2LA7I4avlzlt8E8AK7uYTJqVs3H/QSBtndKhQ/jrtnuJfjdv9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPnzPXf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBJ/JGBL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPnzPXf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBJ/JGBL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH4ZS265560
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 17:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T4wGSBtw4Oq+7FiM6cxcwXwB
	JwT66nkOPrc5ssKiSsw=; b=cPnzPXf3LuOAZTFFQ76uGhTtMTKKaGRkYK8Zbzyy
	RelwctbN+yrwSohdaMcOxrW2WLe/+D2OGudVee0GDbdZsAjKobNbTslOxK7chksJ
	7VlfNSjzS6VFSFByvYQy4Z2HAOgTvIiWETtrQ/Ca0S7rD0RdjAWM8nSQOvV26Bz7
	prDP8f2QozwVWo3QXvJKU+nXzjeVW/c4uFpcfkDFFzReN2g6zqMR9ucpj0y5zxi3
	ma9lk2P/i80H1Bsc4T5Yhx9WVc/QlLX2jaesF6RDQzSvT6yzX987oXSIaBdpKY80
	X6izwoPhikT64PHPXUdzpzmaXISB6Be0/HsZbbX6MPwTaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rav6ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 17:17:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so38575571cf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774459064; x=1775063864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4wGSBtw4Oq+7FiM6cxcwXwBJwT66nkOPrc5ssKiSsw=;
        b=fBJ/JGBLVxxnmwkj4T4mQz6aSXNwTw1ZG2dOTrntXAuWE9AMWd2z4MvvvhwvpB1ILO
         HbIxc60EJkY8pnwlBshkfFTS4kFMZlPsuOnptX5FvnZqN0yvTgMlhJ1FkyOAGPMUyp/L
         9FlI11uJ8htavkSAkzirn7TTv82A6AVZJSS7J0uZlR91nhvwWRptczAwI5/Co9y4bPR0
         nLiC1BEf0vUdVKIHXHoryhOMpihUvub29o9RsVun9sdniPu1dDVWPaWVkWH9qBs/n6kt
         jaZ0pqaLsVeOkU0yvJRPgLct6CQYPsTvBchZg7vuhmPBGtUWmqHUvt5tMri2VBsqZ0Sz
         Hhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774459064; x=1775063864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4wGSBtw4Oq+7FiM6cxcwXwBJwT66nkOPrc5ssKiSsw=;
        b=P/HlWzAefpQpnsMsLAXKM9K9vdIG1kku7t3jNowKGh8+Ks62Tn5F+H/gi5r7Id0MWH
         zUKJH7GhodE8ZkwOpfP3pOYBG1gEE2leWflO1j1+q88vgA4jqzvHiozDxeTWctbZk8nQ
         1po8up6Iv635Xssb+6VVCYxjwD88WdWkG3xlazj95LF3Bf2dvPVXW7G4+DYhtCk0JHe2
         j0I5bGu2xB7Bw58UNW+yHTQm+JrgdT9cy2CSR27IPTkqAm8NRXV1+O1HdR+r9cohax9H
         bfuowKvOBYBFrfNfyr2BsNW3BPYIhLhHHdkqXmYK/lr7Htud/7waOFGaz+WIQ5VDEL7e
         ZXDg==
X-Forwarded-Encrypted: i=1; AJvYcCV3KTIucj4ZxsarmAjDOqFL0Yc4+gRUutRTJWN7P6J+fNAW3HdVY0f04npqI+61E6ghooSFw4v7kcGN@vger.kernel.org
X-Gm-Message-State: AOJu0YxneRy9UxdUWiZ1qIaHUPGWRkxZ7Boj0omFtkjjZeyvaiA0ocQh
	C+hG3pUUihM7PH0IXLORK4CZBFGCbI9e6JaLkya6IpasRvXhJhw7GYEx2/OHneU2IFXweB730vb
	qLv1iXPcDwNSWXw3V+3HPVPAAFr+RllHAABLOcqYBXYDRj9GRT0jCodpeSWRn7Zr6
X-Gm-Gg: ATEYQzyYfiuNVgEd7zS4JPgXzf3LxS00/0tORIm0ZKkFjUvoZAt9BSx3QClhOyqDGtm
	t5qxsDhOdiG2bW2lhbS1Ebafh0uBgJpx8c0xiuF+PoWd4FC9YjWf0bxxV4IUtP30cbFiVyl2KFb
	Dd/oCj3mAxGeVCIb+XrTuTijj/3m9jL7PKcTlfIn6i1pv/8Qv+En1glSP+ioYriSJQPbswCYDCg
	KOkCDq96yOaq/pWk0RWaf21TPKDlL1Bfh+R+pE40jSfpNlnBxgWHSCzSdKWDoEq0AmINDJLPy64
	bKcehFzA7bhzuzSxcCkQNLD8Qf1RPxkRD1lwVGYfyil+I2tXzPq9HiPQKdCWL4hGqRen9z9fbeE
	eH6roTfMQcPTTKnShJleD0lsX7GK7LIQ2fwaTeamMtH0SZjv1PNmKI5M29SAfxsIzsQ7TzVtRTj
	kuGDepZIr0VBTtAdXbAHaEWSxGNTj6iXarfVw=
X-Received: by 2002:a05:622a:8349:b0:509:e46:84ea with SMTP id d75a77b69052e-50b6eecc75cmr86464611cf.34.1774459063952;
        Wed, 25 Mar 2026 10:17:43 -0700 (PDT)
X-Received: by 2002:a05:622a:8349:b0:509:e46:84ea with SMTP id d75a77b69052e-50b6eecc75cmr86464181cf.34.1774459063384;
        Wed, 25 Mar 2026 10:17:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a068f8c7sm27169e87.65.2026.03.25.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 10:17:41 -0700 (PDT)
Date: Wed, 25 Mar 2026 19:17:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: lemans: Correct QUP interrupt
 numbers
Message-ID: <7ifkfgabmhkap7vnwewajmwtgptgioapgszj2klswqixbk4nex@f7nnwfcrit4v>
References: <20260325-lemans-irq-num-v1-1-a470d544966a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-lemans-irq-num-v1-1-a470d544966a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c418b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZAk-9iMX1uhtNleSEbMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: RzhOYD0GAYz8nGK81cT0Ldbs_nXTXCoM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyNSBTYWx0ZWRfXwhxO8cfGWTXj
 8RP6ZUrQft+kh3GhPGHaYFdvugpOf6W196Ceh8I32tvs5ulGOjo1JLeRwh0PUqEdlvzRPRQFFEB
 UNu75cZy+r+G+fsOPn8n7J68zN5Dju00dfFCLYKwBJz0Nzhd5SRPZOmeL8F2Tazw1uo665iAfqh
 KT+PQkwF6YC3I8mF4Z1jKZu3+4VcbWz9sgGkx1xaow3ICKZ5ItYthhrGT4hOEHkEBkdz0GwbdtK
 C2CgVd3eLvP0jO8eRqFMLkXsNxc6buU0+2VhgptW5XTd2r2dVXQnSrw+A8X6Pj3ziGdNntzQs3U
 RRLmWG6w1Pn8i3F+suhZqSVQ83frDU0XjYd67CSKMCQToE5ptbDXWRdKJ9tbv2FrKw9QOskrGlG
 GXNgL2ORZjIf+zxyJtR2P6sk0OUx7rO8AbHS0SLnY0YQPk2KR2RRkvGSGDbl5LsQR0V/B+OFUbJ
 UQf4AzwV3d6r04xPbng==
X-Proofpoint-GUID: RzhOYD0GAYz8nGK81cT0Ldbs_nXTXCoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250125

On Wed, Mar 25, 2026 at 06:30:37PM +0530, Viken Dadhaniya wrote:
> Fix GIC_SPI interrupt numbers for QUPv3 SE6 nodes on Lemans SoC.
> Using incorrect interrupt lines can prevent IRQs from triggering
> and break I2C, SPI, and UART operation.
> 
> Fixes: 34a407316b7d3 ("arm64: dts: qcom: sa8775p: Populate additional UART DT nodes")
> Fixes: 1b2d7ad5ac14d ("arm64: dts: qcom: sa8775p: add missing spi nodes")
> Fixes: ee2f5f906d69d ("arm64: dts: qcom: sa8775p: add missing i2c nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
