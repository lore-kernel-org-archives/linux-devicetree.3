Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598016;
	b=jpBsmgTFgKAtgOiL62bDngZaKdbWcNXSQUYix7PeklZ78nzAelNsdKcE5vezTkqO+goR
	 zrx+MrRqbzb+Giuw0poUdcG27CfKAytEhWgnDIUTaeC1/u30G44xHuNi3ozcKPoGHkdcc
	 7UnMZIdq/DyLe+kBpMa4Vad2/ihfRmu3LwlzO9rXwMLhL3bTMMUSgsFhZ/re0PBvxA49v
	 pjNVyH/h2BJ9uJpNNl0fxl8zWjwGVEAk5yRQPGi7oFfkICCbj8EmiPBU4bLorZB89uBIh
	 sxtrmkAEyjD2mIO8KUW4G5Cky6FIvT6RSJz+a4SxPPtFr+tTTRCeUdMn4eK4o3AiZFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
	b=U28SERJT4s7mfQTxrnkCDHZWVr3BaJp2I/iHI+TP8yvtC2aQAPRKiIlbHuSMBeRUok75
	 R1utw4+1e27fTPTytuh0+xMTGJujsZAfQPE6Y1q0IniIjDnmTEBWSwY+l6CCwtY6L5Xbb
	 kyM3NhQyo3RnbgpYZrTmi488mjPjtPNSjTkh+6Ge9mJ6slwI8g29Dg8pp158wgIO7C4z3
	 l2nE90kuw7BYvWk3gO8j6cz+2ED1/WoTDLfs8Dx3rtY48UKXrYeZBH6NfkS4pJiUhKKfx
	 /kY4BLrE8Jv2dw0f+GbjHMglXRKyVp/GdkKxI6D74WRnTJB6AgWjF085LsbvIStN5ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKbpflYN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GxVzTbwK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4E606A68B
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB4E606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKbpflYN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GxVzTbwK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9CoP12039226
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=; b=fKbpflYN2Li6SwsW
	x+0dVOscZ6J/P88HrREvH7MGuODuqPalnXAOpCuBvPZ59ShYGzNDBtRLAOJmjRQV
	53NMD+0JkdIne0+qz6/U4VXo5SlyMzCC0FOTbWMmz8wR21AhwmHk+AdUBGKiFqa9
	pf3+PWllITR6Z/IVb7E30EDoXgrDACWfusmEbECbkjR0l06FRmRoYIHe/cW3tBwv
	/6B0GJDa6W+SoJ0lCYczbd2nrrwJ6BzAdx8wJBiAQJJzsh2jjLu4Ov5Xcso9jhDA
	RoTpwZGAZd7VI0B4qsDJlCS2BkLJNp59fqLsqlTVog/JiyyCSsKqHoxmbIAfb2JW
	fUF1Tw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukr08d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:13:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94964828890so69581085a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598013; x=1796202813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
        b=GxVzTbwKEYU7Sie033naFSlQk2rFjQ1OnmiKB9AH0oSaD87NloYwolaT6Yij5gcYjg
         238x8Hg6E6PEuqIN5zcTEb8gSW+GSlAY5Wg9D8WrtwQgUM0jpatT5Irzj7dgcL2AJZFD
         wxXfvAl/S1MFbXcMKFesxXwhVsRvyoi2Wl6J+r6AVbqr6hetO4C3c+d61vx7aD3Qdli+
         dp4xTkdfDbxUr2wqsBb+0KZBE9uuMcIfRWiKJ7UK05D2qnFpmSTgY58FflHR4FY/Ru2Q
         HJIj7xgRyZT1hHFIMRT9uQlzGuuopNKLhya0n9f0nn4ie7E0csPmuYXfHUgYhuyc1/po
         dAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598013; x=1796202813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
        b=f8duovWqZOSC/VzhujlgRmzzhe9fJvFKuK7PGhw2zh8bdf7BLvQWELgFD5lxRx2U84
         N8RZStcCqbGhnD9E4RdrIt5tKfXQ/KFiGAxv6L//r1x2vuLDDGn/NKAIDBAj0reqfBCq
         Q6B+3yeH7nGdVxvJtKjAv3x1vWghBQb6ruArCvhq21DbzhvTh3oWVqWEbNPl3VA4tl1L
         pK11eU7wDJoSTPWeit2kYTk8jYsVqHWmDV/ly57FL1/yFzJ3WQczPZBjrd3PRSUdK0pG
         tGu34+0LpDHXPnbsCO69C7IpnUZd1UhYpRfcdoy3aDE44t8LXNDJzXVkna0iQZ9lYtvi
         PRhA==
X-Gm-Message-State: APuU4Z+xfBe64j92SnM5KH2uI6UCoJzMXh4a7DCwI/sAVhZjCgH7kLKQ
	6/Zg0ENPmkwEbLweCPHuxvW5mb5kbnJVTeLm5ycVcxUFKZiamz7qfPIk/pXiDHJUzBQlOa4tfi3
	bO9JDRB1HjFJMZCIfWBF5s1WQaYOfes/4T1Px54N9kmT7sHt0N6AqMXMje5u7erzV
X-Gm-Gg: AZFdTZfCXNpkKIdhK3k32uLyXMSloMjMcf23UlVdBNoAhbxEMv+WrypVeAQ/b4mHxZ5
	PABkgSPXRihOjAlDr2nZG/tvR7/dLATMD4p6p1/MeB/5ipldbRzgEhXgU3H8gRfNacR5P/kV87M
	4jsZfl+aBw6i/iaPOGp+clyJ17Zr+kiSSyph2FUnIjXQCEvAlFbQodAmEFUq5OMYjhyRSIV6Gu3
	8jPEgPpnXXhI9DIUn/7wsvPRdHsgFRFogViYhhdWj3yu2YUBuFaBVbOLwKXv+vRJUV4qv95zKDI
	jsxltG4/QPFgad5XV2/mOMjwkri2un3EmPF7MGVfT0nZnQaPYM8BrOVnYFXqsPdKgUOwV/OGya6
	fQoZ997iCF0kxFjh3pI6hrBBZbgKObqTGoTuJx74eGbdReiqFcmBFySJRlfFhHE5j4gY/+MM=
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2845920285a.6.1795598012613;
        Wed, 25 Nov 2026 01:13:32 -0800 (PST)
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2845917385a.6.1795598012173;
        Wed, 25 Nov 2026 01:13:32 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm7951603a12.27.2026.11.25.01.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:13:31 -0800 (PST)
Message-ID: <25657ef3-3bbc-4d70-bc80-e368eda447bb@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:13:27 +0100
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
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Sort the TLMM states by pin number
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
 <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06a6bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IcN9rPl5bsQiho1bYRUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DLsG7sJtSenfU1Omg2vx28iGe9FbyHuk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfXx4nNxzXlYvFh
 rvJAz5vEE7ebux+p5xwis8Xqs1cs6ggMd+YLwOsyJHbOBA5SpWh0VE+MALyWQiWK02DpKi1PUoS
 SnHuj44G8NXKsLnIaDmtNtTatAeDDZg=
X-Proofpoint-GUID: DLsG7sJtSenfU1Omg2vx28iGe9FbyHuk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX1PKFGQuLtX66
 7J5rTAENyPcgsBmRD+ILznu5PxUVv/Zpobd8832BHHNmXH7yjNGGMZ7PLYmgMmKrz1U7axjPtss
 EygVAYJcnRlwCDyJ3bRYiLGcxgFlwC3sTRLS+vP49sFV7StqJ0hG43GNcHqljkcmKahRg1YJxv8
 lHXBb/X+Va/bKkSqV6rhq1OpmT1amt+E588nY7vPgESzDG1brr6X66cgIBF9uOtF1QCNXOe6wyW
 xaMaq8J5KldFbA8rQN0L+ozVnfAnWqjo25fECVYneDZQ8iY5mj31q5Z/14DiuwYmblrF5laJN8/
 V3ooAI3kjjaq4nV+MCbzOR+zUpE4kz6cxc6+6OZ3l9+BrO9t+NrNYeKq3bOzRtjCWVApp62523l
 uxAp5WbH+ausVknCDCUx1waRJ0N3cSVEbH5yz+CLO+hFC4GmzYwetrWUdtwwSzOVmxBUgJn05zy
 n6VcTX3kF2xrbNm6SVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On 11/23/26 10:35 AM, Abel Vesa wrote:
> The TLMM pin states of the T14s Gen 7 are ordered by node name, while
> Qualcomm board files order them by the GPIO they configure. Sort them
> by pin number so that new states have an obvious place to go.
> 
> No functional change.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
