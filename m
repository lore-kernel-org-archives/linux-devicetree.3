Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7278349C4A8
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461434; cv=none; b=l5cts9hXBf0hVKrOxtEjb8KwuZLGSdyU0ZPgifPHxqZbZtZ0ic8gXFFY3lR5o5U5O6ZsDAOjiKrraqZ4/xglPeHDK2kS+cSUbWrkIb6pdJG5iSrNpXj48fThiHvF5FYmFuDmLBcrNAs9RM2aQGoCoUjXXxJwI9V9DDKnYmfWJ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461434; c=relaxed/simple;
	bh=YdR/sKqrRiv7YYNQfguHi7aoV7SCf4GdbKhjott7G9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfqC9I+CeY6z0DA23FPzpkp1JCiybaoajGRuhIGkAtEmY5P7w+qawfqcoMQob8CYo9xbP7Ec6a9fr6D40CoRwYq//Aoom6MyKlxkdRrOcyvo584rTGgKNWVLg0zq9KJPEBegBiz0w2humW6YEbgaITAHF7EqUA8mA74zVfI07ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFbucj0H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYu3d4RB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFbucj0H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYu3d4RB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZOmS3487172
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eMrZ14PD1b5lu0Pk+aBr+n+H
	IHnLdCKjZ3wX7nYZV14=; b=DFbucj0H19FopdNPJhK+wMf9I9uDX/qZL3ZVMjP/
	GCDqKa/AevPpcGvoOZumXYNpDtueSqkyMb4eXa3UY+PmvRk44t+h/C2J/Nw4bEyc
	iCRuAyabKGrsRXAOEMxJN8Rdk9ufTGjGKgf9IYwhu41OMRSeQS3VKgcwpNiiovfS
	JTii++W83AKWuQ0X0Un5HHUihMq5xzU9JOEJQWYVuG0PEXPxIf5a6pLOo1dD1DXw
	Gp08sY5gDtstyaNdHuevMDCT5xpgpbAExTGvUOYw43kUj2+sEHQyNImMWUvSSDhH
	LxL/KumD8iYvCMN9QrnUQfxI7xOrYz/g3mX/m/5FVFuCmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jerk9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:37:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0b66ecd9so342733985a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789461430; x=1790066230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMrZ14PD1b5lu0Pk+aBr+n+HIHnLdCKjZ3wX7nYZV14=;
        b=aYu3d4RBCne6K+j25qtIQm5qroGFty+KHGiTaTby2SLOgi/+R3R2/pWanpOTzpJHsN
         YYJE51srdTOnoEKth7ciV2lnFnvjH4VYv4ATspUgzAfsZhkIMtR3wJ25lURTiJL/KwWs
         csglEuFRpY/BfLeBbx2HX4+V6rgGfHasRqPLm7MTnrhq7LworpjXMYDKPU1Kfvs5tq58
         Y44eNEnKs0Bb21B5uNNzD85FuhZvT6dTl1iDgOdxexfumeeBpjB2xSM17kJTYHXXqKil
         DJrn0f1mGYYXzX9GAqCcIsj7WcYb8p33lMX9us1MtVU/U9SBWRYq4mYZgBBCLGy+fuEI
         IqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461430; x=1790066230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMrZ14PD1b5lu0Pk+aBr+n+HIHnLdCKjZ3wX7nYZV14=;
        b=GQcObF+clTfop4Emz1M2ymL6pLtDoeMViy0boO7G8T0x5POsUUaqWNlFjzQuaE/anU
         6ecCV9XZCUAI3kjnmQCv9A/IYeR6qgEyu3rfp62hWPXgyvLd2iGHpwPJTg7zoO4o9l+8
         Hq+jc1tFRygDbPlvlAXNtYV9vLSTFnyrK5omvFzS/yxWw8bkNwbof6716B7mr9bgysxu
         KJKHgTJfLOpE7si0FsVqvFyWo+QjJzbrmVDoB4NOfyBeFh3gXcvsQWZBPRtjtcsE70IQ
         0kTBh4y9mfSLrq6GBbbYWdqQk6ykbMHEAgoHPeEJ75hahiqp+KKfnAEBQ1RJ0653twoA
         nCog==
X-Forwarded-Encrypted: i=1; AKwUvByw5HbK58n7j/y91xdRLGqYrsqwzHbE9dtXecXUyxrl1giENm0ivzuYatk9VYH6U2uVGYWUqaqLdrPW@vger.kernel.org
X-Gm-Message-State: AFuF++mNfL/JaGmPcm4Ukuq0wf3bgO9CisZip41IbByh0I57MTrPu/qj
	v3N8IOmZZ/tusPv7h0AG8o/+TumKKlokOtsZ4Y1ChIutoBX+nEKWoqTdLvK2Zflo8Fq1ZDXYfcP
	vEgeAQd0v9GoiLRxdC7zhxa/NsXaL6wc9oshhzChh0ABxOcW1MIsx3q6LhHfiGiW5
X-Gm-Gg: AYBFou1wo5PtRdrIwPOFlmoYF/laEKniFZXEAjGCnCeTMVfs7TDu3ZgJlc1EWv1KYle
	WlZNq7f/ltdxF+gGMs4B30cdnk2O8m1tREBe+ehaSGaxYLTnTpt5zYUypYGmMr2FzerQA7MFLdC
	0idvPl9m45V83kz6niZZHO+p/DI7qfnC1jAv6SS9e+jJSpbrKGxwOQupJGwlUeeqIwk9odYo2Es
	7yESue2NbkfX6lRnYNfakec3OjX6FGz102vQtgdEGnwhzH1MUy+wL4V2JHEGAaYKmi5HCNgbd4v
	PYdMxVpxZIi6FjTulRuRsCA/i6wRgD99i3/zkfJuLEceuihBi/WzrSsj9T/ahy8sYIRg7FRU5nn
	LjKDzWSSNotyY8g==
X-Received: by 2002:a05:620a:1d0c:b0:939:bc7c:15c8 with SMTP id af79cd13be357-93a29a97b1bmr986442185a.45.1789461429559;
        Tue, 15 Sep 2026 01:37:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:939:bc7c:15c8 with SMTP id af79cd13be357-93a29a97b1bmr986438385a.45.1789461428954;
        Tue, 15 Sep 2026 01:37:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d695677sm54843475e9.5.2026.09.15.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:37:07 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:37:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Use SM8150_MSS for the SDHC
 power domain
Message-ID: <kn36ymkh6ky3dakcq2hrblnqunwc7i2w3ny7c65tramfpbnomo@gx6e3glriqgw>
References: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com>
 <158d06a0-2e93-4300-bf96-eb8937ed28af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158d06a0-2e93-4300-bf96-eb8937ed28af@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEyMiBTYWx0ZWRfX8jJVdvTEdvTz
 uYDfBkimSQfFHz1KoNsJuJgyRyG2hbgg1rEFqQ0crJ5JtA3ohrsrTX5ojNGfsA+j/c26wcxqAEk
 TVlOQh+uxBbVZunJFEYgzV+yxxhSXKg=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa903b6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=VEMV0py1LmJu7ly8yMIA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: K24-MKiv9TmulUVNkCPn7V63VGfaRsDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEyMiBTYWx0ZWRfXxepl92FB4NTY
 yyo4dmmEV5PYpBYGABGObgDh38PtxnuqAK55+VPpIQHvW9sTWsjpqHCRlLpy1WzPp107U4+Bw+r
 w84wJK7HgHHABcD/SXmmCThhiUTA0AbR5NZS0le5FBLdIc8s1l8nCirycXPtNoKmA1FecDtn2Cj
 7uN1WajmpVMQxpc+TQjS7j5Uo7R1ObTuDEZTpihHHQOntc2DM94E0bCtanxvFz8sb6m6oN/q4gs
 7Ej5FDBmgj56M/HsQyAqeAAvuDIvUNFtMoMmmB63nViEi7GTZHpbjjsqtPuErQp9MR+58KKqNp6
 AspgBJ5lYjsrWTTcJdQROwSreMoRiu/1VWgQfq1RniqoBTKcVp0h9QbHyb/G+De2ukihirNSHYJ
 eBviZ58HIsJOUeyk8m1J8MfTqon5rV+5Pa24Mkq7bc3eqQNPinRSabC0Kdl1kRVdEYW9HfROhh+
 krLoR6Et0U9krSUtLaw==
X-Proofpoint-ORIG-GUID: K24-MKiv9TmulUVNkCPn7V63VGfaRsDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150122

On 26-09-15 10:13:36, Konrad Dybcio wrote:
> On 9/15/26 10:02 AM, Abel Vesa wrote:
> > Replace the raw power-domain index of SDHC2 with the SM8150_MSS binding
> > constant. This documents the selected RPMh power domain and avoids using
> > a magic value.
> > 
> > Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> > Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> MSS is the modem power supply, this should be CX

Correct. I'll respin with CX attached instead.
