Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF3C50C2B1
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902765; cv=none; b=ruMsltSEeDCDB/HfeERSzGOwNdRwJ+KfwisxCnOXjg2xnwsIaDaseaTvt/AwHSUr5rvBpsxI2pADSFaYsoRjJ5cggCtCad7GlJQ9zFDatJm4nI2YtkW6PpCs8H4lIQsUO1Fwy+8X39Aw51eOrDn7b4UYbYReEDq1lboY7k5HoOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902765; c=relaxed/simple;
	bh=b82reGu2AP2bjGYbUSB+ai56EpBHIBMVUFBj20u6v30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRDmEDXTgRiWo1nMY6CIkMxJuE8B9cQOQ9ce9XH+6225TRRLCWaiibcDBV83ZtVjP4XBYjaJRCCvycfLXmS/apWWklfGnXCTeFW97qY5BHR37StwMrXCvHThG05vQ6bSo3O4CUWknuwuU4ZRe/rMzUjkwmJomI+f4X0XhhhukzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O02yuiVP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7hSSCBZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O02yuiVP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7hSSCBZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE49U2009645
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9rqm2vcii3oJi1tm6En6nqGtIepvnqMZn1zzxoBCAc=; b=O02yuiVPwVbyBdDk
	kayRSH1KJGh2/Lw/04Fd1vOqanm3enwjMb9555js4z5ayt7p6ky4FEUIDYK1/wha
	dxYwGADBLhJtPjGXEK4eU8VkzkzH4GwFI5jGZcJwp9ITirg5mUttAb3+dvNpAYGm
	f3SdcZv3+l3K2SEAZYdxhYjf7Q03eptRvPsiaWNNRygYHhviODnbkySN/mCfY53j
	4UcftGTUIWRqgflstXyocwZHhFvWFrmje8V7Ubct2IXD18b3Jn3jP/Mk/p88eQOy
	9cjEfMQgb9gd1jTayQIAcQEALnfHkwgDMTU43QYiG1DiXTb9frFcOuyY/n5vC7zV
	UfR+Tw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjj1p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:46:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917aacb7abcso8449496d6.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902761; x=1792507561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9rqm2vcii3oJi1tm6En6nqGtIepvnqMZn1zzxoBCAc=;
        b=O7hSSCBZR0l+Y3zynGRkVmwcqCFYr3uLltDr4mDHIEPe6icooSp+JfcdgSdbHFkFkB
         7r5ijOW6K9ChSFsc02gaZotEwV7v0Spe0qPES2pHpANj/0kHgyYAmjaBhq4GVVdqN7G9
         PULkLCCPLV66HxSi7HgerDLZbMM4tHqRIJUCkLJK1+xweN3EgsuBNKGW33O12Eu5Ji6C
         0U/lvkA4XNoR//vMd3MBEC1RyF+YXMQofVFGhr2QPT6lNCCo5yyEp2YW/CipootMMMlJ
         1kErKqNg/+WKpyD8xcvX2oLtwE8Sct28sDScuzdRWxjaAOTg3l026EQ17jNQ33CxHbL3
         SY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902761; x=1792507561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9rqm2vcii3oJi1tm6En6nqGtIepvnqMZn1zzxoBCAc=;
        b=Fd/hIUyYbqdR7e9xD9qCJPAP3/Co+QinECkC62B+sMh4Fm+CE89ZYhderU9itKYf5E
         zLFTScw1IYRsGea6Le8vNvfvICcaSmFJ4FxwGHnqycNqLN0Zq1VpD5yiR5oQrTxiYCD5
         QpZ6vMmB67uR+n/VLJT7WIAzYJWUJdC9cu1EWGAbkVgflPaTk2XM5gtmR5h0aThn/Mc2
         Rx6DviHl6wmca16yLBjXiXOpslq0FOsV+tjt4oUXq597ImETHcVPY7yOfv1klGmK/7rb
         DG0DutQBMPAPAXUr3gGMUnQVkhg8Xzkbrs5UUZg0LHQM8E/Qf0clejg2zv1juE/rQMC5
         P1gQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeP14Nt27I0leswOzBjZquQD059OUXmNcclfOSLB1DgKAnDS0V1yF1A1fMxM9VR7vIEuwOifgTzRAH@vger.kernel.org
X-Gm-Message-State: AFq9FYJzvc4qviGG+PS3NoJHX/qrAYM+y/DtjnqSuV2oFLDX/5lXHWLp
	3CQ5UUXop/kvy4YMGe+foCTfR9u+5SuMcs2xog34Sm0OxYwSHZ9f00xQS6ohsheAuOarEww+s6j
	6Mch0r2ZgHGwRwp11YT6htpIfQZBP5UALNoVEqsxw+wphxy4DF9JfRHj+NKSGAsy4
X-Gm-Gg: AYBFou1dinyAmlnttH+SvE9GKy6v8I6gq38fLVaYmJsk+A/xUrkadATEZYzLqUiuvyh
	uSg4gUEGpQm6t38GgGGGvFtMiwHGhM1sqs3mLovoLeb/yKYn/E4ZW8FMTcws2jg/9V7Tkxj+paK
	IF2e2fWi0S8UMgiT3/lZ8LmywmXuOvOXLtGwCHSZR/SViEK9T3h3mgZPtkDEFXIbMXh8qpWBV/m
	o9+VIhzpiqPBDLL+wkqPIyidITiH5iGrb9sT/GQNIbkv2/7CH1qMtBXbAgN+XxMY+6SReHQAnW8
	pB+aMwEhYHk7oJz0frWecGdPd/mv0F8Y0rDDf5XQhpH85bwaRZlmVYx32R11is81fieOYtrFiZM
	V5SAtMPd/q5oZeKxr+vDzIg==
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr2356775385a.1.1791902761086;
        Tue, 13 Oct 2026 07:46:01 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr2356765085a.1.1791902760341;
        Tue, 13 Oct 2026 07:46:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3596566d8bsm202245266b.16.2026.10.13.07.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:45:58 -0700 (PDT)
Message-ID: <612c9163-4b38-4d91-8a5e-9636458145c8@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:45:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-11-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-11-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KYxmspaydQBUwt8uj_mmlaURhkmaguLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX/+cVTXx51tlj
 WT7dB+6svuyqX1828oJoym+hZKMeg8/Bs4LA63GMm1q5WDijU1Tv7hGz/rMFIuAW+HzyrJ50mIJ
 Nd/ALHH6dN5+H8LHnhGfuztym1559Y7+vMQ23WD/EBjh+x7W9SH2q7OdQf8Cn7Nu/jsixdXf31O
 otypSV/gT92NpMti1z2CJnhxBQF+QvhMgdA8wJJj+uAxc5nUH4uWmFnKTmbN5/Qvq9OhLnh+5H2
 LZN6jzFzZ/icXoEcG27kcbBrYABVjvCeIP4LxA+e4e8Ck1FMclymQnDKBkRYnRCuRD55GzhZauw
 NsFEn8kVle7gqEM0ngZ062YhXszRzF32En7ZRSU7vuMHl05pF8YkNY6GUhGN/hXtOnCXCJ6Chle
 4tRwcFzRslrKFvZA+d57cf1a17x2y+9tZriazKbEy5nOlY5/5/6TsbANMzxEVQQ+HPAgW9IOl1+
 Qs3sLZJXITI/q+Mg8Vw==
X-Proofpoint-ORIG-GUID: KYxmspaydQBUwt8uj_mmlaURhkmaguLi
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace442a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2XTsMEg2AXb16ItvnVoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX6XLzLEx+pC7T
 XlnJWVxQ2K8SlowOyUPxr8aNYbE3wvHBNbJfSQ50fjvd9EYohcX0V5zTNA4L1iUeRYYUuSaunlF
 J1OaZvLWScHnBqyTWRd5kVHsrPtuI7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Add random generator node for the RNG block present in IPQ5210.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
