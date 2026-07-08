Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D0244685
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516258; cv=none; b=U2oz4oUMTP6CijPyqddaAiHQZEu0S0c+3X2nzbBL9W8Tp6JpdmQIhfs1erKeAFRCU2jmxc2j6jB6GpJN6ZpwPBMqbtf+54jQRo0LAQliSj/EX12y0SfPF4ON+PF0hQF2q7g8cpetVU0xPHD0vl++ky3xZ1elqwIkxDv9odkIJD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516258; c=relaxed/simple;
	bh=/r9vThEyEJ36Cw+vj1jJ1Sk2mDAeNJX9YvUbt0gf3zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCibHPUftmhLVZ4+ke7RGQFM9RPVJOUH00B3YT7C0qXfxYTpFthw559616+uENxm1//FH2lYqC+dH3JB65MEcgrO0DcqH5p8OwN8wFW1whf58DaYijSwxoFC9/RVz5lVOE/UeYse4j4YqYtBYyB0Hjp9Wb/QTZyTWM3LGxNQ8Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0qmUbPQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdEiDsXn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0qmUbPQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdEiDsXn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3DTn2751263
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 13:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VitBXPuDKN2bJBrIHBwNqn8i
	E6+VSQBCBJkCh1O1kvw=; b=i0qmUbPQhK3LGktUywGpZxjxz40cjrgu4Vj+Mqdg
	C9JliogfLkFrrfQd6zD/clJuAx+a48zYKqrXiSm0B09AjMqYg/ZHPswZYNGvU6Qd
	7fwuKoMwpm+PTF9BxvGvT61XS82lwBQdeW1RcqQ/b2WOErTc+J3FgJr9EC+IA/yZ
	Og0C+McIl21tJEf027E9Qe9qHFKsQkmdsMT/DSNr0iUHm2TXX3/0rwDgreoILT9C
	8UrbqTiGoVpb3j0opT/pm/Rq/OvtmWAdzcoown46MqZYtE1mRsR0pDdWE7suQldL
	lB+ai2QZvm1pG9oAU9RjsiDqYXMkMS7LxtciKibmlgqZwg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hhs54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:10:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751db2792dso236765137.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516255; x=1784121055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VitBXPuDKN2bJBrIHBwNqn8iE6+VSQBCBJkCh1O1kvw=;
        b=fdEiDsXn94UM2M4GtI1ayMqEtl8a95xmhrSX51LYhoGvbVZ8Q5aTz+Hu9nl/Dw9ag5
         7Uau1YUm6MmCFo8XsfcQx7rj962hoLiLW8QDT9I3BVeWOceCI8x0fdl/oKiiLyC1H6IM
         f+BRETf45dpJR9rx9Z4ECLkxduZw3z5QEJRwqYx/t/8sLosatT+mZFo0+QDiQF4hz9ai
         VjR76DYRbLMttjjEukMomkjLryPUJ6nPD0ko5EB4Tp9LOG2jozMZ7Ch7LEQX8WZsgY9E
         Kdq32kmD7AHtN8hkdi8PVHctlBuXqE9iVdIxQL6tkflSEcmUP+F6Yvo7SoPUS4CNhM2w
         gh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516255; x=1784121055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VitBXPuDKN2bJBrIHBwNqn8iE6+VSQBCBJkCh1O1kvw=;
        b=tFw4sh1AaZSi4ZxiXK5br/Q9r3ELXXb4iGHZu3PbPvubwH1ox4j1jj7JaG55jQHoyC
         jIXa7Re9jOZg+XkKwmU+89tLhnpAjyfJ48dwvutvfoae/YZ3ZngFQ5caT7e+d+xj59bU
         4WbT8cCYsMUq+Tb49zhapSmoy1F6eq9A4hvI1plZhTDddCcWIW4sm3AKJbZuHG4S45SP
         +3mehGVJ+JQZCn+VQg94wCgU1cjxNqyWPgQ6emlmS435eTsbiY3I4xsvPVmDR2RSw5VP
         ZW6uFZRsfmR/XniSP9yUbGt7aFikBBNlvgIIKWjHjvReev0WX0lUguPIvunGz209SmDP
         cWoA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2rPx1eT79ctRdCa5JOdyHrR+8wT5TMfEsiQhmDW7TK3pbE7JlfAtv4mi++8iUlyTUL3koHisYZtS+@vger.kernel.org
X-Gm-Message-State: AOJu0YzexDUuVb61lrs3eI4KO5EWnNunjC7aDW1pzBUVu2o6BfjIwj7y
	gp/IwS8r7OYgJUh0HW7nNnCZkdNmuu3Xo18EoD7ocIBTQVaJklrbDZQJTOohmyfGwnq3AE3KiHE
	SdLcxOftYYNtiMo8l9cjZY0xMPPANscnqPda5d8fuFI0YZVSRoMwVUrn1DIBin0Uz
X-Gm-Gg: AfdE7cllAmzt5Pnah0AM6iqoSFf8tRp/IP/0bMdLGElY73qqQ3wu8JYTrQ6/6WPUdtu
	CwCtEIucMyXelYc9fnjGiSnCRX+x5h19cU1CJ1ZaXVCGCy6pjSQw/VaSgdoUdpMsLJv/cPwOjV2
	pyIFDu2X9MHhSUxo5BlkgXQRRMFkbDCRaXuluNf1luo6hNNQQOruSdkxqyJ7nqitJxbile7xRfJ
	gSD2E8APfv1/EWeOQmvxzMUxeafbmdzHPjOb5WY/N7VQGZ5WnbWqXPEMR4pBBwGfpoHC9DR99y0
	D5mA7S8sCZuI+kAtDuVBo2G7p4XhYxVDl2Ief87F6NF+uUxqEMY4g/GwMAbxEOl6zjKmRf86BaD
	FnUCGvUbvdN1/awQLdYUcrFCKApBs0/JSlEv6HnZutw7pE4KorbDzHsF2+171npqevQPnTj4X7z
	s5c1y1zS5+Vmftu8QJPh3CkrWc
X-Received: by 2002:a05:6102:8081:b0:737:80f0:7887 with SMTP id ada2fe7eead31-744dfcb32f5mr1057930137.8.1783516254695;
        Wed, 08 Jul 2026 06:10:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8081:b0:737:80f0:7887 with SMTP id ada2fe7eead31-744dfcb32f5mr1057905137.8.1783516254115;
        Wed, 08 Jul 2026 06:10:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5e87sm29799821fa.22.2026.07.08.06.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:10:52 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:10:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] phy: qcom-qmp: Add v10 register offsets
Message-ID: <5syxe7ckrzb4bytvhnvifqbo5owxtkko5i2mdukiopg56igsju@i4at74a6mart>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
 <20260707-hawi-phy-pcie-v4-2-8d9cc6324947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-hawi-phy-pcie-v4-2-8d9cc6324947@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX1+Ut+kX9TXrq
 tksQh5TokYEt8pvu9iuU//qbUAPK4VWEVz/3bIXH9SRc/U570FQUHVnZsb6b3HtwT/OD3GHLBJb
 CWE8qws5/9U96UKODSPpBw7rnlaX3EDA3RpzdwReqH/VO6hD17lFwqOhVdb4aHMZbyE9lMwAgNg
 ENU6WqUTUWBhWbXKL546xU7LOJDIf4Lx7wQXe97VEAg0T9yW2q3ePcWahnvv2q6e3yeO7nGLEzV
 rA9IECTc4tIHsAqML25NloBO2CRapn+Z6SjaCk4/aHSF/2WB0M66whkXeVcgirKT6RVPZOXBDmB
 Vw9hf0lpPNvDj51Loq4gcvkiN+Kf2+o1wdCOPM3NFyF9aTwtQ0VaA4PR0ZQFKC2vCsMQ/oWNzsD
 HctWkaO58YhM28xWIzGWRwg8zf33sNY0p4ogcyhppaTg10GwdrKiHiwQXAQ4BlOP8LSQydsAVQ4
 Gr9titK3gTAIs27O5CA==
X-Proofpoint-GUID: gzpFlPKLrYWjskgHi5geX7yge6mNAqNp
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e4c5f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_DP_PzDrpJ8qHd2sDw8A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX5QgyYa3RxnpE
 Q+YvcJGYMGTvDH9mapBeJg4XvDio2fABxn801z2Wfqi3GzCW2PdUTSzJjLf2BSlOKYZtBr7n6HV
 FY5AZ9ycVk5FUaSHpBVSNEDZK+795XU=
X-Proofpoint-ORIG-GUID: gzpFlPKLrYWjskgHi5geX7yge6mNAqNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080127

On Tue, Jul 07, 2026 at 08:32:47PM +0000, Matthew Leung wrote:
> Hawi SoC uses v10 register definitions for PCIe Gen3 x2. Add the new
> register offset headers for all four sub-blocks:
> 
>  - QSERDES-COM offsets
>  - QSERDES TX/RX offsets
>  - PCS offsets
>  - PCS PCIe-specific offsets
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   | 18 ++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        | 22 ++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    | 49 ++++++++++++++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   | 47 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  5 +++
>  6 files changed, 142 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
