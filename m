Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B114427F93
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785915; cv=none; b=f2dSiWUhM7Gb97TLUDgsNgnVR7LDCFcxW2wh2ITTsYh5THhifoNHAT1nd5zTSAKlO09GDGqS3ITFXLyLGfpCqr5tfxa6GEaIldaR7zhy77P+1VCN2rVNlEAduu2XfWqgBmh6AxBKK1/qcQDsbr+c6Sj9gy6rQP3HoVB8uyhjJrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785915; c=relaxed/simple;
	bh=DCoJBl7amgy1yhvT0dMKEv17zLSUXval2AKvsyCluU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEKcR3gMkl6+VNOpG+ugrPTC6L3h20IM5HJ0x9W5xFwthrwJTFCx1SxKAakMobDLOx9X4cLp6CG2GqoXMmM8xt3lsa0RM7MiOyqAa/WBS4J8u3SROQWUfJjrhLsQbyreL8OlIA1IH4Gq9TZw2soxOKbxFChMkfi2gyhsBwv7OgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtiU6jt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPRLixt+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtiU6jt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPRLixt+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnUsh3777909
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 12:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=; b=XtiU6jt+gVsasIn0
	H1tOky+lowiW6CAOXCYyJ2hXrpaBAVdk674w6O4GTlX2+WEUnmzYId94+TMokEz9
	KMVBsRnHXeheFBoKwFC+yGGYRiBv3Up4az5HYr0H0lZ4SSPaZIIiS+Bou/4UMFqf
	Q0SWc+dKPRD5XzWpRKIG64YJbhhgKsQGfBdgX1H11gdhqVd8P1l6pnTgwvKbWFek
	kip1kiiTtK4C/2QPzEy9KnNGFgcuqc9rvu8FmFxpig90+NVnWoIu0JFVie1fVBIY
	i7wI6V/g1SW5aRwYrT5Nqq1IamDxwkCSCiAqJGQu90HoyIR91+Tlq2F3Dcx8QYWV
	Jkqjyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyh5cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:58:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so49915485a.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785904; x=1789390704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=XPRLixt+FYBo8hz34XL9zVlQa147iHBiR6bTb8a5cuNc2fkIBTxc4WTc1OPCnfSlgm
         8pcjeSKGNd+I2a5Cs7k3u/vQntecCoiBJduG1eRPkHoMgczgok5mzy2TsF89OB9MDuMZ
         9eDmC8KlknlVetevYzoQS2/Hb/TUWn5tFyrbWPid6jOxR1omuAfr8ru407MUGiDhVBAg
         ABq4loSNkNHHNbpiDVVzbmVqbS6HDAP1PZUtS9hdxhQOjiqHHPfc/nnPwfjQYSoJ5w0Z
         7rEVnhGQSSJQIbTFD8CkeY7tuvHG+kHS2/NXMAf8NuJnm7G9FfVop6XzL58n7LOOmxJQ
         WUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785904; x=1789390704;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=gWOBiJOSqYGaADGT4q7hZxPz0Bl09VAVnqbCFTJ54CDvWjtMAZzGS8usPdX7YNtqbF
         wmPXf8D3K1ftD2yU2+f7TQFU4RADFLDmtsjm86ae0PEwuvplm9/7zVO+0k3hsRAyPXZM
         0R8cIr5WtzDIoLVCus3x6ASDvJaFJO6m1ItULqSgUUfXOER+ZaUngI8lFwBw8Amchwbm
         mshqDCJTCsI2/3sHC6VcGj8nAb+yWQLkdWwqbpbIwkkdLzICoKpdsboiit03Fc2hxKlj
         Xo6UJIbyXAXEOygILw5rPgD9jDgkohmEnQD4WKiYnTJ+PHCcqs8aC+tVBh4vHxV9Mm1w
         rs3w==
X-Forwarded-Encrypted: i=1; AKwUvBz7a1dxHkBe9dy+3MjxetjG6fB4xkb/rHRJ/FFXSIeZyenhJH3XK4yiXVDuSfP/KEFOxR1me2vOdD+7@vger.kernel.org
X-Gm-Message-State: AFuF++nPCsJgbGaMFtjDXSTQ1yxJY6WXF9Hvymnz6/Oc1Lw6OEkuAZI/
	FS2O1AGpOksAHlu3K/LGUmszzgrc/ZSVe/8pDJ7luBKEslHG2Z3te85bK1Vg8HamxrxEMLNIV8H
	KKKGjg+JuYHsd3Qqt1pwFNvRT+XXr/ofWvMp9e2TmUg+e6Y2wK1Tg9le2NCqyZryX
X-Gm-Gg: AYBFou2YHyY8SNlYK0Vsy8xa2SkSuLonQdd+DzJYh9s5LQyYgqWbrXIqRgAY1IZ+3gR
	Dlkr/gOw1eXH/b+l0E7yNyzZah2deXrZwfJ+XN5m3pJfxLm0vR1QcvPMSpkIxHeYfoRrBcckKHF
	rl2wAUih2xamel4qzBPK8TMkjGl1vma3j3c1uTxyv0mwVnT2yuu21SP5Va0HIczBMka60MlqVKX
	VkhchnUmVGm75a9TlinbWCx9bVLpUW9yakVMI1Jbv+QJQKHBx3/z+hm2jCv+fqhyOHtDYoRxKTZ
	rCdS6NwUng/tk1+X0FdgkOmthD4GSfM+3GbB1fuGq59HnOdtM3bQCHe1yxUT7Xq0aLWXB9dhj95
	31uEsR6pJO+zngg5cYrD0dw==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1787125885a.1.1788785904702;
        Mon, 07 Sep 2026 05:58:24 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1787121285a.1.1788785904186;
        Mon, 07 Sep 2026 05:58:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm408829066b.4.2026.09.07.05.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:58:23 -0700 (PDT)
Message-ID: <1c955b6e-6f79-4ddd-90b5-c667b68ce947@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:58:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] arm64: dts: qcom: ipq5424: Flatten usb
 controller nodes
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-5-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-5-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Jsv49nyg_bWIbb3iGPF3uFVWQNuiPR1H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX2k/DvRBC91xg
 u4aQ2kS8LBuMsDzDsGDKHu4wSWJvPdhr3LQ1mr2BY+3ArmgIZplk4fULk8/mTWduhv0ClX2ZFL0
 wgLpxnA5AHu3oeifc/lz0wF7ml2zoCEpEuPy0SZwSdUkjTFBptOOQhEiHGGdylCZcyZxwiHEpMW
 S29jAFvobNshtM1rp5CPIBuqQ6u0fWt3IHD04o8m7reVDIoZdiPPXhxNbjRny2Uei+3w5hkqKVb
 t11NhzkNvmQaGSxLzejZSFQ3sI3YgemDZ/TU82errzstNNXT43CFyM540D20XwhtqBqExNfEz5u
 gxZaqWnOSpbSn/Jb4rkp0EeFOtU1GJVWka04/uGIRzOulsn9e6/cTbw4M3e4hwLNISKprFm/rGk
 e9f5xWvmm5G6vny+uvZyGjXOWmPjpgCxfRguxXmYc8CpFcmFGIgdzxVzFXIkaIJdHsuM0snyPu3
 JKcrWOOJ4LDrUTbf8LQ==
X-Proofpoint-GUID: Jsv49nyg_bWIbb3iGPF3uFVWQNuiPR1H
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX7bjYNrn9lMcu
 avq7BBNnqLUhzNuWYjCeyg3uUTEOxNewOWmfuH6qlWgjCoL3hu0TvmXHLKFSqOyFGgMtjc36bfn
 x5rwvZUzTnN+Io3JLQCTRHMPalBKiGw=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9eb4f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
