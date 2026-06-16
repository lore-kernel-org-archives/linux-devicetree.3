Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5403F1AAE28
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571305; cv=none; b=Kgyhdq4kThPhcAXcO5AgsqtHdGPlAj0vilMiiJRpLL0BMge0eJTyRucIlhlqhtTRiUVwMzJx+c+8CmaEzDxvabOUvCGGWWOG00qGUk3W5i3M22q2Q0BKNcBkDBH6cNcy3Wof/GSybOoLp4sYrazJa2y8YvNKpZ5Nz6JUl+sSsLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571305; c=relaxed/simple;
	bh=SJ31mK3JQy19OP0EvfHyWXGR1AXAJ6g/2vEzJhFf/js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRK/MQgcIdsCjplkZrHN0BlX9L7esau6puuHZPnk8rMGjEZ4K4jnZazijQTiHSoRxIw88L9jf28xW7n5fHKiRq2/ED57lO9hzy/gVhjK8WSrx+rBZMG+fVnkIXfonHFjv6Y59j+fo//WRfuLZ9Kmkp2b9kUPR+qohjAegk2BkTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYkLzOHt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRq7fTIr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYkLzOHt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRq7fTIr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0Ohof2064500
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bfH1YFfB8DVE548OmEdzvoO2
	Sfl2pDVWRVr/GFOchFI=; b=TYkLzOHtjzBiErwXALB1Dtk0csLDCxfFkRoQbiUK
	1lNAL8oCGQ35BWqBCa+ot6DYGNZSitul+QeXeViMXgnkZxpqDiKcy/0BZeXJEN2L
	cIvAD1aWbzYsuBN5teBejW90E+x5NRObKUThM4xwyJlizsaTQ//F6HWl4PlvMOk3
	qmZ0CNkrXNt6wSneaisyzRpxyaWPWN/jy2QTSE9QU8cJVgnxRw48ltOx/8oug5z4
	rO+dH29NaDmjURZxmspmmqiAGzYvvVoHtTxiVX7GWZwGtTdCpTMyvBxq0o23mR55
	32Qpe+eakA5qohbjufOjtKgQ15NR/lHkn6FMqaPBZE68LQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteguuwn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:55:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51956be1f44so44140801cf.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571303; x=1782176103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bfH1YFfB8DVE548OmEdzvoO2Sfl2pDVWRVr/GFOchFI=;
        b=fRq7fTIrP6iK2+H1KEU+CyxIUU/HSuzjXeyimR03wgbB+SV4GrpOE/k6+27YxR52he
         wB2JAYus+icNx0bMpZksEqUnkV8D6AyLO3hkGkBIMxfZHvghZC7a/Q1l8xQNibftfIZi
         uwXx2ZKfP65qkyB1TqVKYJI5TqiZ7hx0ZVEL4Hftd1prUk0Dx/AJYNJ20/V2ho00xRHh
         ovKo1R80da3YnH/L8ErLrvmvwZiJKGZQvwxuFw8m5i7UgSzbdjsT5jd7wW4SDAZzrAa7
         z7wVebAdkNaq4ldQR9ZPho/VZNjeXk+iTGxsWTQJkv4uhIb1tJxpn1tDtl9ALFI9vyyi
         EeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571303; x=1782176103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfH1YFfB8DVE548OmEdzvoO2Sfl2pDVWRVr/GFOchFI=;
        b=ooQ9lIzEnhAq2J6lp2lfZ8SmBQcVeuncTs+pkhAaN23ZMDNPYPJVzWCTqsfVmiXhaL
         rgunhTtHT2czJJXbBDtCaaTceZyay/zj8KZscu3kfi7WRzVrbcsPSgqI3arxnPrbSYYm
         7tO1QldO8CSP1g8WyKWTCXSctW05YVPgeCR11e+IquzdkMVpcvlYqMsHZnNHW74K5tKa
         uUaTsdkMvfvdy1cOyTtQAk6Z20QR6veIJZVcGoYHgWTgxUTbrTmdf88i6SjqBvdORXOU
         f4SPthy+A2o7Nojqm75sskD9Ubw1bTYMtErdlyh6/mpYXSGuKzyNj68yhJAd/EpEwbDS
         Up2w==
X-Forwarded-Encrypted: i=1; AFNElJ/ohbvW+aBMM9H7TeMTQSbugrY6D7iMxfrexjvQR7Khz4a2ReMVoq7FiiWgliM2EXs3bLu73K5Paf8L@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpz4xowmFzw7lmNXBc1TLYFhrmSWlXEUQAJyXoV1cJ8bHvEpnF
	pFKem/497os+8VPc9r1wb5JS8oGYpEsaLngPNDCthKlcDQygRQj8OFc82qkVifwpDRv+JSRqXPw
	li55jO6lu+0uOn6Q+Pdo22StGTOQcF3vOo1Dn1/JBMaXGigwZe/896VNHMwUagy4m
X-Gm-Gg: Acq92OHEEUzTLaY/P/c8Vm3Y8uJ5Jn52rmmmoYlLmqB1bByxno9EB+XlOH84833unpe
	+U3rDH5QJ7TFdqjBUKP6Wd4KGo0DhgvMFH6fy7y820nKwNU7WbP1M74PBqMR8KJsfptvXADY1j1
	NZ7j/8B8YidiE7ElHru/EIAaY9fWcrkW8QOr8OIZ4nnZqdoBgPaoW38z/Bh050DrpsEgiDgzr9/
	1Px9GT7ysZ8JTv1VuZSy4bwUZvj0ytc3t2l4Fs4s7wFe8jfh95NlIC7W5/9U0EJUhSZLX//3Luu
	aTlaV0Ta+cr7iouqoWqXjkkiTNHUI+mb786XBOqN4bospYk3tLLKjY4Eu604USSvJjwPWsTiVPm
	8xWvJ5TeYmo3PXlj8p3vTCqtC490nRB75u3Pv/6QqAJYRNdqgwZw9r7qbz73C7IyGcbWdgB7/ju
	vx+Z7Wo82RbaDIw94Wmm6fL+VssW42t7hZIQ8=
X-Received: by 2002:a05:620a:2985:b0:915:29cd:306c with SMTP id af79cd13be357-91c2c4d288bmr257334085a.9.1781571302538;
        Mon, 15 Jun 2026 17:55:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:915:29cd:306c with SMTP id af79cd13be357-91c2c4d288bmr257331585a.9.1781571302114;
        Mon, 15 Jun 2026 17:55:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f2fsm3158366e87.11.2026.06.15.17.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:54:59 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:54:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: Shikra SD Card support
Message-ID: <boo7p6mgop7rarfu3rfsrfah6eq7zp6y3sf6mdq3hsejtacwxx@yl543m4lj47d>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfXyo2iOHppNHZ5
 9KTgyeI7JZ59LuXnaeNUmvkC0H/A4MiDiGAdcQgephoc/SmzB1LpepmdkU+Rx8vgELEhhj+4Ccz
 Gr78q6Pume9xLntfih1DX+fSQEtHlZ7JVW6Mqukh8Ybp69OteIicuc6AwfRrlKLp/noQp2TMPg+
 QE7SoczOz99nLzTZeC6zB6eoToNt0mp6AXOZD5bt1VUS9qgB5cHNQU4oNnn3ABw1EC7r2q2CG2u
 dXlHz3JR4xLkuN0uZCqtbAiUGAd3vXH9Qp5w7Z9B6uOWMyJs6ntUYWnTHqdFq2PU1/BIl9C6Ql+
 SMUV1HnQjX/FKhptiwE9akbxQqJB6kAZzKrqiRCusPXmTitiZfOTlxSMcvt0JSnF9rUpGXma1ol
 /u1Xy9g3EULkbz2/7vdfkHXe7gYZM9ituLIlI6pHL4gqH8sdQsZIJiyH9mJABFiP5DSuwhb+ydl
 +c6OiObo774YrLOPArQ==
X-Proofpoint-ORIG-GUID: GMVXA7CsMCKgCvNkm1_bOPPLCZlWcqtT
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a309ee7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Sqa3oZAXkj-0WgPsOd0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX3Z5+4PL/fqt4
 vlOmNX57kQr5iGyEav/RkJkcDeSDo0vmLy50pdicjL94qz84jYNlj86k1r4QE/yI1lnrCiph6Mg
 tQpM+F8qgKKxEIZA4hjvcPbT7BXeJ6g=
X-Proofpoint-GUID: GMVXA7CsMCKgCvNkm1_bOPPLCZlWcqtT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006

On Thu, Jun 04, 2026 at 05:50:43PM +0530, Monish Chunara wrote:
> This series adds SD card support for the Shikra platform.
> 
> The first patch adds the SDHC2 controller node and the necessary pinctrl
> configurations to the base Shikra SoC dtsi. The second patch enables 
> this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
> the regulator supplies and the card detection GPIO.
> 
> Testing:
> - Validated on Shikra EVK variants.
> 
> This series depends on:
> - https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com/
> - https://lore.kernel.org/linux-devicetree/20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com/

If the SD card depends on remote proc, tsens or cpufreq, then something
is wrong. Maybe, the way the serieas are organized and sent.

> - https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com/
> 
> Monish Chunara (2):
>   arm64: dts: qcom: Add SD Card support for Shikra SoC
>   arm64: dts: qcom: Enable SD card for Shikra EVK
> 
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 93 +++++++++++++++++++++
>  4 files changed, 147 insertions(+)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
