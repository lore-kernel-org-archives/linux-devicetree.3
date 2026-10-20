Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482064;
	b=uQZt9sr2N0bj4V8h+CJx0h1qiv54+NWEQOpwAIxbuLNuSoDBnhjToMWjPaPLmLOue0yt
	 bKUUeQNz+vFFZ4vCZMP65Cmiv12rilyuHxMBhwfYR9t1wD73/QBCBTH2yQS4snpBn0lCG
	 Ct49yWCm0ckfJl2+yoqeH2xaGOCec8xs3Cx3mZJJ7YFTf98CfxYBgY53vwPspLJ0zqu5L
	 gkB/8L0vKKR+HNSye5/VvyB8AhXGV/Nh1vUSBsP1ObAAvZ6pK4m7FqZ3d85UbPhdbJaND
	 yQXwb4ujqEieokBhAISYXy9CDv0sko5pmP8p+gNtpEAEKzCS+R/lOKVsnu9lOOzyesQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=;
	b=Au25pnYFIgtfvo9VHkGXPMb18Gm0jcXcUQMtDqDINiSlzui5h7XJsqDN3qa+cgL5CrPb
	 zSwNny8hYbSZ11M1n16Rz2B0A/wrq4wpgNmrRgPS+HB7k3O5ZUg+2FjUo91s5a8o8kmtq
	 HdM19ke4ZxX/1tiWj72NEg99WHW9pgB9SH07dDF+YZvalbvVkyxcQBFyYFf4medKYisAj
	 WvGmHd7ODdQDykBBpDFSOAz/0gYxO0aXz2h36a7mUYGl77Q9fY9GVC0gFoZRJbMy1knwE
	 kcrSC8jfjxkCDED10OXpPGsY/VwH3HW5TLFYRqITaWpM31/goun/FZcNq/mkrPH/z8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaH755m+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MMcLl7FV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1F4606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC1F4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaH755m+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MMcLl7FV
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tBoQ3807021
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=; b=MaH755m+J3aEMTH+
	PCxxT72diq2tT11z6JtY3r4IixHNeqlOVpN8FL0r/Vplgxek5zVIVyCT1B75TrYw
	Hk7z4linNXb8fESvkTT3stNJ1Z3FUqi32CcSj9tf9OgNswHoxfvtl01SWReucujX
	s5CL2FpWoSgRmwvt/qCUK0GUaX2pmlhAp7W/rdnlQQwtVgAGg9Z8vD/7Uyqy+vOD
	C/kpja4oV5nYoLrq8Yp64KCeqjJ5OvCWbaeN8yiILhyF4IIWk95dJ30wHkpr0abW
	POLu82aaM81+fMIzFx4KLsLGqftr4b6gyeGWZm7v6ckUN1+FN3l647lkdt+w8+WC
	IkbdDQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9edr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a54501a8so8243836d6.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482062; x=1793086862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=;
        b=MMcLl7FVbgkcNgibqy4w9ZJZ0SIvfk/Ig2s5LcO26HqwkZnVW+5KAIV5iZK005GOJv
         K0szqBVIuNpQKPX9MbsyVPckJAlSCWX3IYCr7MVbPYKeWJ3dsH7FtbKrvo2bQsW3J2N+
         IgTRm+EsfqUuK5ylXENiVczpZO5gyY2MsshLjl+NeD4h+B1JKPAd279UZJTNTuZY/wxX
         u9QMtw2Xt1+EkeVg8y20RsiYzZPG0N43fo88p4aHkE8uzi4tLna3bRY+aOjNynvR47ua
         f/vFpP0KQW8D+VYtfhCmplA8+DU35YtjM2dU7KfcjfulZrzqo1pk30Aubm5wEf5xk3Bp
         MZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482062; x=1793086862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=;
        b=ChaUvMkO4/YCgK3nl1+L/KAE+s3LTAtwRP4yTuAHUATspz4x1P/rh6yFYKMNmb8/4R
         04HsZqR78jVcpUiJPAfSdJsg/PrNm+b1s+U3SrV86V33eXqZgHfn4HaWNVoCGNz24+cR
         LLJUPwQ1i6rfzOHp6FlI6mEV9IRgbHKMMn/VRmbDchK4MenMOI3fka5F8kyGEJLeispD
         MLU1KplAOxwdRPV223NPzaUwHh3/XZnue2AFzDxxYE6rwp7cw5ZFAAj4cS+SAotkMVm0
         iG+KRZqUD0y6DI8tEbYyhVvrtcpTUosiKHQFWhne+bSgzxERO9vwMnKPRUrT4ABSAYD4
         DBBA==
X-Forwarded-Encrypted: i=1; AKwUvBwgVP9SwteAI1YTj7NdZocXDrmewilEVpIouHzA5Z1qAptlu5fV4c1PUfQ8roG5fqkkyiVOkfCPKxlv@vger.kernel.org
X-Gm-Message-State: AFq9FYJV1PScYHwCtudRMvcCD7NyZvB1TAoHPPL1BZKQ3HxUG6X3e52y
	/IqBTKDSdrHSjpwBpzU3eLQholnHME/7u/K4eXdNa99IFt0fkqCk6tlKXW2Ut5bdaypuURHuHCn
	kVVbuWNn4/H5p6lkAMDFJBz0YzTqFNMI/SOYr+z6SIPSYkLTd2KsCds0C4keJ7Q8SahTAKGFK
X-Gm-Gg: AYBFou20oyS33Qbv12VenylSX4LUmeCDS5YUrX9kJ8Wge6cvh6UB9Z2aXk1j1KYw7nW
	iPiE5L8WC4Z+ebHdGG4jwe7UuHry0nyhJrudd9koats7hz/pqepRnnq1y+P2TyVCBoXNtm7Zlyl
	pYRkLYxNWP6ax+Yg+ZgRDazA0e9s+2K7JPHGsGyZmBmye19i8oFUWppFnDoNqHPzeakHLr/haYg
	OC+2nu9aHBCm3u9FBQfVNhj7Z1TwYWYPSR1SSoaUGNRFUPCy66UgDakCDsCHNiYIx5zkkS4slmv
	0CgMVQXCK+UCP/E0aqNpL/7r+kjIsCXiyLDRddJ3fOeIsFTPUz70Den8LupTqOxLRtdBSTHZbIW
	fVe4yHb1DkFbLGvrL15E7sw==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr465669185a.5.1792482062410;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr465666385a.5.1792482061925;
        Tue, 20 Oct 2026 00:41:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c42a3f4eaa0sm287773166b.0.2026.10.20.00.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:41:01 -0700 (PDT)
Message-ID: <ec59632a-d923-4247-975c-7ab9e23c739c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:41:00 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: use
 'ipq0518' prefix for dts
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
 <20261007-tplink-ax55-v1-ipq0518-v1-3-0ef058756596@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-3-0ef058756596@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6gN3ISxFN6IeZAkpoh1nxX7ZIssZrfn8
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad71b0f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pyv2_bVU4k4AM6XG6ZMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX9VasJ5yOoINT
 9ATYqq3stO8UXUXIWAZdckIOrNdZERkrVUZ2Wbhm1JkN/S85aY4f1vbPQumI17JkiGIYz6V3bA8
 pNG0E9vn8/JpdLglW3XyFlxPW5GLzQ228uJHnOx5Ge5azk3egYBCHUmAugEFvDA3MmmWCEIFFTz
 W1/5atZ41XeLZ90Y7d3m+IScJaNHDqyGXICv7DNOnYDJ/w2fXzqpoIXlJD7/ihaFIAVC38tYzII
 gWEpqa+gzORvOvxko63Fq/PDhqwiN5LmyttHiDDTQ2g4F1hHGaY9jaW3flOc3ieKXTjaCzMiz5K
 5a19S8B1WI9mMw8EPpPl3BhWqcDFvGnr5VK045x0cd881j4dBneaukTdNi4P4iAyo88QFmt9kKm
 svLHbDGcZXYq6jokC2yAiYmIavPQ5jjluYCHPRqKL2pUsnuFallyCsIXXCL09Ab98mhN7vZcuHa
 HPnsQlzDNGiO82c0j5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX74zIW2VhFVXN
 fek0X3F4ado+vNJxdjDtvA4Sd4mqm1TUY7T4OeT9Zbftim10dWrvwtPsJ0woVVsoRurhJoP0Pmt
 Q3pk3fTldrctTCe2e0WMbR4EifcCuEY=
X-Proofpoint-ORIG-GUID: 6gN3ISxFN6IeZAkpoh1nxX7ZIssZrfn8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 10/7/26 6:59 PM, Gabor Juhos wrote:
> The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC.
> Change the prefix of the board dts to reflect that.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

I hope this doesn't break any of your workflows

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
