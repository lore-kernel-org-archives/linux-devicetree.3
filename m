Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFE92EBBA4
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775760506; cv=none; b=lb4Utk6dPjv107uIqe4rwkMZGoPzojCeako0QHbKiUxGj1kl1jQPWEbko9wn5nECLJ96E7pPGQbWcLyHyCI8IHbV/s6YKZUE380ZVh84P4dOy7pGEWA8VowijWDUIcouz3OLA3CBaEg5oOphx96dDFnaBXN4lKauyCtabWfT830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775760506; c=relaxed/simple;
	bh=B/PO1g6isoQH/4CSdcSS2JFpe4MLKsTMjbALL52rnyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJxtunKeJCySVIOQM6cVWPKjmY0bFJndEsvILEzmVi9SeRbOICgDApBmOZ2g+ig+RxJS6LsWM2ykGFMJeE2+RxBSvlYzAjvKUaRQWR/9X7HSxLKt5Hdu8bo0c2DHhk6jWRKRFGTWP0etntSU8J5JO0C2co7lnEAKNonkOofNz+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAOYphju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3cJZBjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAOYphju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h3cJZBjR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1Rfb1972532
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 18:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fzKr+jCCYbAhAkTkPpAa165W
	nNaZvKCyJFBqJsHtSIs=; b=nAOYphjuKg960IBYE/CNwCgu7ZTsQ0nvp/u35pHj
	ihWKBb76SEXgVmbwih0AQM1VcDXpQghlN0SdhsYdjVFIrsBwYnQGUCaAqIStnn+Z
	QX98Jqp6ndpDRuzvCKa7azesF9wQmLv/IgSdXkrY12wd5atBXYYLKHmVBeikwKwM
	+QKDX1JIcnMDPLUZYQFUmvYpqZ/690bQdDIf2fH1glrCdrZ7/5rBadUq2rb8HT/H
	z6+CT8kAgrSMhCh+qwQv1qKvKkguLCw//EDOnelSr8uTl5yi5I+1V6vngmZopM7a
	An6WSt7hjUEh6wMOKQ1mw0E1sxxo10GnBk5IejqRIM1+tQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1aam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 18:48:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d831e8083so38626301cf.3
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775760503; x=1776365303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzKr+jCCYbAhAkTkPpAa165WnNaZvKCyJFBqJsHtSIs=;
        b=h3cJZBjRkt9wQez3MZgAxtCFSposixRyE9KbJGRtQWl5wFTX0jq/UlT2Umn25+xEVE
         uGySOuD9jOfDAXTKP8t8iLqzYZigsQm1yMW4RTNEnxvs9oXDAenPh/DaUV40pwWWmsjX
         6M/wV1n4d0BYrGCDiQI3zgfmDL4nCYxsr1gEqW0scPSaqC6Q3gpkkjVT5mEWOWQ8sdT5
         QOR70LADy0GhkLHDN8oS+8SaQk90rag5W4kI8llT/fqMfqy9poxPcmH+/u1Qd2fzjEeo
         CqBZClctFdvk6yfsKcMsCeiLRLLa7vKV0PJ1ux38VP9I752O5yCP7M+VPGEWkpH6DEhr
         qpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775760503; x=1776365303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzKr+jCCYbAhAkTkPpAa165WnNaZvKCyJFBqJsHtSIs=;
        b=r/T09KhTmi5DIzuM/J21Ds3R2bVgUD4O+St7CRtX0Ut5jlSQNnoZmSi5TpW14JEshC
         EEMvFqEHP6ltZM+M+YJl8exO5WTnoRhFEMM8tI048zjEX5DAfYRYvWaGKund3ROPyCRE
         Z1UPRvH9eAxfe9yhRIh5QoV4Ug4lIADUBqlyrTH62jxAsvyy2yHnc2NjsVeyGAWdwSpl
         6tYl6VNh1BiKh+TzBgY7DzshZfO+8Ny7N0KPLm4RDQEkcCZV8SPCQyrhMQgD8UJ6fHwv
         O9bAzLzQnYQKr08FLVV8DLk50YNRA7CVTdu8dR575KdvWvvD7eJExkMDI17Z2/elXs7x
         Lx4w==
X-Forwarded-Encrypted: i=1; AJvYcCVnrrO8o6dCO3Ppcqee550RUxM8mNIeySWdYFDcHfNukEgpbyi/LG6gEr8fwoV/LCuEgl1gaTcowPL2@vger.kernel.org
X-Gm-Message-State: AOJu0YxSbzU0i3uAo9nm+XdpQk7BXyXMI0rN5grJYXCONrbfKdGkFS0y
	tti31qZlBBpC6mDlsH+oSdUhUgl0oPh0tzGzz+sIq5hrqGUIIxXWBPEZ2koOWJosSeIA/bM7gEH
	czIXmEyLQqGg53tQWWrCLvWmPq+d9E9c0rbKOgYTKIVJYJW46WAV7baE4JboNU40R
X-Gm-Gg: AeBDieum0mqE0/qi4bl8sTFZEgxqH66JMbPOJOGQ9ELWbDPd0Xc/fmnwG8DgXIsdc24
	Qg9zaMI0++XX1KYQtQFybvvKpAOCQ+0OBv9eR2/Zq4BZNZSbMDZWt4HPnhickHtjJn4dP0avMB8
	KtcHieOROp1biebXQlskvbngF3bqZui8HLJQxXxYNkcjknZWQDbai/UthIkdw6PKaGLR/H0Zk/o
	DSNJghSk2u8Ia0Zzg8aehM/Fx3IE47oaMBueT1q5LYR6jYLIc2+EeEehI6JneosXinTipQqKE/i
	H5SSJMopfZEcceU076HIqMfcT6sBBE47hXJCQqfC/RuHG6QtmjdKK/BarewHHg4Z0Romw8Q53/2
	a1R15dYd7xaksJMycgeZ2VMtDHSDv/EwtdiRXSwdGdbVR6aw95ngdba8BCJtSPragtTxpY8FnsX
	y258Lq2hJ3SWbrna7y3mzBAaose+TeDJm+BP8=
X-Received: by 2002:a05:622a:15c5:b0:50b:48de:5448 with SMTP id d75a77b69052e-50dd5ad0a9amr6226971cf.6.1775760503264;
        Thu, 09 Apr 2026 11:48:23 -0700 (PDT)
X-Received: by 2002:a05:622a:15c5:b0:50b:48de:5448 with SMTP id d75a77b69052e-50dd5ad0a9amr6226581cf.6.1775760502800;
        Thu, 09 Apr 2026 11:48:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49541dd1sm1145581fa.24.2026.04.09.11.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:48:21 -0700 (PDT)
Date: Thu, 9 Apr 2026 21:48:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink label
Message-ID: <w6mog6pigbqzvcbmedjcyvuth5ipjodi3xso4ibhbcfgqirdji@wjuhdbyywpzh>
References: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: j3DIqLis-dbtVHtIdOjF-IvJUqsy-y6O
X-Proofpoint-GUID: j3DIqLis-dbtVHtIdOjF-IvJUqsy-y6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE3MiBTYWx0ZWRfXyiIjIv5Md5U8
 oXXzGget+t8ZYSplCy/OicJmK0KqPukGbsJvSFYgIVGYku8xAQqlwT2C4JTncHeoSLZGie0Oode
 gEdGZ9cAXJpaMTAc4efp8Yg65z05j2ezG0jcvDaiBAOwSqUhxDLLKJDThvV+cS9WyT3kOpHq4E7
 3y3UfTsS/mVWrPxdMeFZaHl7ZC2n2MGgq29hxWfHCafOlpvXMWcfuk9Wzqy6tAsAV+WPNzc6a2A
 ZL5uEO/C0S/wx7bDWoMsQLYpJvJJ/vTXfwhcvFdJrHijgN+1Kz9Dz9m4t296Qsx9rrqUNk4QXpE
 INNw9C845IbVMYoaFWFL6PZ+/BGml8xj0IOjUAU1UcPcfd1K0SJUy3MU9zd+ilP/QQ9EbUoTJZU
 cM7sV+3jjjg9rFtOGYFoF7v7ExJ5YEOPQe5yWybeCwk9D3mFGy2fjCmebw9imCb9o+Hyp6rfpLn
 vMLYhyEvy1caJP6Jz8Q==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d7f478 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=p2qfuXT4Ie2wcHrZ6aoA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090172

On Thu, Apr 09, 2026 at 11:43:29PM +0530, Mukesh Ojha wrote:
> The remoteproc_adsp_glink label on the ADSP glink-edge node has no
> users in the upstream tree across all affected SoCs. The only user
> of this label is qcs6490-audioreach.dtsi which references the label
> defined in its own SoC dtsi and is left untouched.
> 
> Remove the label from kaanapali, kodiak, lemans, monaco,
> sar2130p, sc8180x, sc8280xp, sm8450, sm8550, sm8650 and sm8750.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Not sure, if these should be individual patches..
> 
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/lemans.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/monaco.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi   | 2 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
