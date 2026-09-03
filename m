Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E731E824
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417533; cv=none; b=YHgzyR7P6M5QmnY0bQzuDsN5FuFFNwJtmGGBLo67J1SsZcLkOdPLLd4nbvYbtpNkyJBNmJQMdQGbp2XsLy70F72wOclLzhOqAdsnKCCrsPDIGhi9wxQ3esA+49nkvXJjgbyisMtMk1ULon+ghvB9VJidkXmUKDtJVhX1zzYzZ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417533; c=relaxed/simple;
	bh=xr3EdbHecvtb48ZZz6jAzMvFH3J4sYscKx5MxVg6XRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXpKLWgePrM6dh7syx2unh4a414n2z1oLFsc3OuHzkOhfWk0sF6FH5DYst+tvWqTg/HmDaQkWLXdfWMeuUOTptgG2NyH8AUbxXhyeD6j06JatLnH6GUsrE9bJJEbpG59Ap/PaFq03KFZPH+Tn2ZJRStrBs22rA6q6qf0uKRoZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CG27UCLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdQ/riQT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CG27UCLu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdQ/riQT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835ldsO722051
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 06:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=; b=CG27UCLuRQNkzumh
	I6Qoqg5E21BRxR4VfC/MDWmPiaJsed6D32s3te8LFDfyXyiaagK6NrCYj/1PGT+l
	0l9Twpearm8Cuf9T43Sle87YWFTWiXehgqyWThvqZOvr/X4+PnczUW1sQQjCuJi7
	HdcH1aBSU5r7Nn1Gdicrv+1AxVgDm61MHC/TK5Gd+kIlehnmRpYytTKAj0aYoUBL
	CAu0ZrXQ3he8Jz9MxPJRdd+y17mb8TabMurRKW8lij0Ypnz4B3V0ozPDl5DN5sXK
	wX67vqXSixWzvdSUZNzNSQRfF+aTyd1YAKzxFvAXTHN3PFXKhzZ4hMXQwwg1sepZ
	c+aT/w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnkmy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:38:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so48037385a.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417526; x=1789022326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=;
        b=LdQ/riQT2eT9C0pMhHQmohtxPKaHmDhC2JVjUUvvo5O/RT++QsUKT4QzHuzcuETLQ5
         /JhK40Eip0ZkJQKtPpaVP4jNc92OAC8Fwy2P75ArZvCLuFJ3xg+5jK6UoC9n2S+3ESIX
         WV9OtSo31rziG6BwddMNIh97N7jQDryErNOMfWdUehzJGYHse6ljxjoJ1WHr2cbgMV3D
         Lerr+BGfHTH2vrxfG4ymd1+JaOlzF07JM2YMkfYySiYYcwTI7YIhdjYP7wNvWzqbA34S
         Uc8WwoURqa3JKvtdwU4JVpinccv/dwwsO/R6edUh5uwezNZLcBscx/BXWHGoNzURGvoc
         wlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417526; x=1789022326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=;
        b=YM39ucCzTUxOF/5W2bONfmtVftyY+QqB9Je6neId4Yv9vPliSK4N4RqLBAzinfLhGe
         80fQZw4H8znL2TG4iPqEWdthByKaGqWZ2AMhpNRAAoGZsup4FPGzZ3dI6DWaq52keJcI
         PZ30MX518ERMiRN8qJ1Jso4QDfG1MfEFy2rSuUkvSwsE5m/cSMW+/oUGqXDvny9QlWGd
         +aaB+6h0UUHyDDZOOSp/nzLBME23BhVIE/vF1RAuCoZWkdi/JuzmFDF6AdkCk/fFaoc2
         S25J15zBrZDlvuNrbJBL7pNLd7QPrB38FAe20NuvHIsRMG6La4vnGDLzFaVD1d2nvGrL
         jtxA==
X-Forwarded-Encrypted: i=1; AKwUvByT2uqVF33CDejyRVpYOqt5u2FhXm8zmLRom9AEQlpuxPQErLd5iKkRYj1/GiULU3zUJBi6KNiJKJje@vger.kernel.org
X-Gm-Message-State: AFuF++m0jxheE+qTg5/MAhMJKWZcXwjeoRLTa5MUyGr3UIu4DlnE9IJy
	he8Qctux7zGV2IgVMYRCUqw7maSEwcJJ/NL63mdhKbQqXbU3hgI8YsDUlkkwrbqazP9cJLhguHX
	pvDJ2IFL5CVaRiJpMEMdz2vnl0lByJczOQdWjzNhkfAAsinzcHzCUqHkLy1DOqQPB
X-Gm-Gg: AYBFou22G5KtdlHXKeyvFm7815KsTOEYQ+R1sNs4QnyArmnCPVfFTRis3svU7vw1rcf
	P964jO3Me13BtQfm8ob7AJsznRGv7QU3LoFQ557La2TjU/+EMaqfe+hyJ0i/stVGTpBiztkylfn
	14QIEgd0iUBYfRjxAY98I52zr8FeoR6FLdA4I5yc18IahRNyu7ShWtZUlUh8OmjOLCrI3YZmnaO
	fDCWLiVBoFc7izXTXLJrsHGovxNLO7mTKUnzFZzc8ZxyB4mBwivY6/DwrGZeIOMqf0FT4gjrXtL
	PU/H4OQ9N3Ioj1M8bjWorU3cb9jv7KG4gNGfV4kxfhOPIQdFzZDrEOgphWVLwsGNEEC6uCXawE+
	pUOT5+xf22wlaip4uxKZYjQ==
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr362288285a.2.1788417526126;
        Wed, 02 Sep 2026 23:38:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr362286285a.2.1788417525612;
        Wed, 02 Sep 2026 23:38:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm40501766b.35.2026.09.02.23.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:38:44 -0700 (PDT)
Message-ID: <ec4c4c56-f976-4e6e-9b62-127952e839ea@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:38:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm670-google: Add NFC support
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
 <20260902-sdm670-sargo-nfc-v1-3-bed1cbbffc46@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm670-sargo-nfc-v1-3-bed1cbbffc46@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z1Y6CL_b4n6DwhU3S-EMR9IT5PyxwsVR
X-Proofpoint-ORIG-GUID: Z1Y6CL_b4n6DwhU3S-EMR9IT5PyxwsVR
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a9915f7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ROI8ggJMWDmTJZJ5NsAA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfXzM051CCbZuwE
 HrPvR+anWsLE2k5xBofDrfJFVksA9nb71Go9BCntEg75Jq2iO3SiS06DVedUX1vD6j6Z4cl/KXH
 AQFUuK5RGEA3yc05ZguyFodWfhg/K3gHtvEI2lCvCF1trtGalDFt4DWfe7VCSwc4XN7yg2l6S5x
 yojI2DwPbjsMkZ8vmOF8TUeeSWa9H3OdmV6Ib87WnvgV3HZJtLj1+vlwbxGlXXGsfBkn/991z+h
 LItPac96aU4EnqrRYzPPWhopVQZlI7GpSB95pGR2INGrY0wfiD0LA8lihCmosIgq/nytNkShaSk
 ATxo4IG5ctEyrtF9wDdaykUBG4nQB5/5+a4Xd6nD+cv90km9AypHNcNuNsNwXOAx+XtBHcCAZzI
 dgQhD9M1EnJeWb1Pi6HL89k4aILExLKrgz0R9LFgNV41hx3PzY0bSVWBBIXqoSM9kpuOwpJ1RyQ
 YRICFt1c/OEq1ongrAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX6skPxBKk5jjD
 JBawIAsLvtOt06uH/ixHQnSMpEEBE7xRtWj5WRHWeyAbd5yrmAAeDlFnoUYmJvQ7VXcjSd/iV8d
 fQA64i52WxSU9lqLNqTNPyf1m4c6/bc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030057

On 9/2/26 10:59 PM, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The NFC driver can detect and read an NFC tag.

We would hope so..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
