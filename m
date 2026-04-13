Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9278237DE81
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068867; cv=none; b=GPQqI0oNemz+eIerB1drLNANUIacqbJkAGopmHGmhWTPa+Sing4SknYUOj5P2u+0OBpwntAPBOk6yHSJUJyd17hhbg0rl64g+eX4O3+gRH0KC5HKJ+TeNSmOymAuYZGKC4njBF3GCqyw89gl3wSCDcgfSCFHoh/BekT+hNlvd/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068867; c=relaxed/simple;
	bh=RX/e0s0VR19SMuEOuyMYOgroZ3TuAVHof0b/VRTSRRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2Ejn71JX6DP/YS2omCfI/JeOtZUSV0j+SeLZVuD/WknPGYpJZ/QqbVw3hW5yEsrloBVUArxtWkawXQIPCZR1CBy40uBQS/pqC2SN/uGBOd3vn9QEi1ntqr3du6gkRFuriaz2LF97skSn5tYZDIaZWnWf905IEHI2meBEqI6p90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uo2h/Y8H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMoN0zc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uo2h/Y8H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMoN0zc9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7lwfk1733699
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWJXLv0fsrJ4VOjwQCZ3mV8mZryqzFZRmH33NOXHaOg=; b=Uo2h/Y8HHxXHvRPH
	OM+ChvOedGeWklj4EMg8aXkKBCrHgyC5cC+VRV2FvftmyDIr84/u/P61oV7Vz/v9
	d014iSymiu4qZZDn0S1pkAzxRwb7Rc/cO+8SCrn5QJ+d27GKsUTZrWm35yQpRe/a
	UZ08BDGdBR8dVCwZ8WSgEBELhU9OX//ZDR3Y0zlISFmmDEIQoVHr88o+27YsQkIQ
	MQ1vFMbmIm+qEtHN+kJC5IMUqNpbX508jgaeYoeANqHJFf6nNYS8GTJ6GaajhMoD
	FdTk8HLObI41jwC3UNZiTfHq7PKihoPrcSe5wRdoTKXuCrd4B6R2rrvVmXpXJlWf
	y9iEng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfveq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:27:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d45ebdbc9fso73525985a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776068865; x=1776673665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWJXLv0fsrJ4VOjwQCZ3mV8mZryqzFZRmH33NOXHaOg=;
        b=JMoN0zc9GJ4RG1DEeb9S/wS7+yijZ8h+Qe4B31KjQYCCiYn8iRLSDsYi0FU7WXrzmr
         UT4nSeqXH8QIGrvsSB45Q4QPfd+SqsSlOCfEIqqVXQeipaDLoW3wMyAovi6Th979uHdx
         +aq4znH7cOzHcnex/WRrGmrumIplvHrXuRjK/sPsIfe1TI7LGIJ/s2aoeNlNVmArMi65
         V3qF0NoGmAFdNk85s/P2NSfT82j6UceMV6ORQ/gmoeWQfI+gV3So+Bm9bUPhGu3Vs8hv
         a4QEOsargEi3Nsq9sdc9JybJjlrPvbKK05lxMY9KohFxQ3XooDdDLltvGrHfP6DkJXJC
         rpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068865; x=1776673665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWJXLv0fsrJ4VOjwQCZ3mV8mZryqzFZRmH33NOXHaOg=;
        b=RXe9pcZpWw557t9k4p+gTn4MaG8sSCEwctf4PL4QAtbyR0kY8tBpFlmODBatIGibEN
         grYM+NjLNONvE8vTHTFh11RHdaQGPMpQy46Yhcz4ZreP1LZDjT6TDDJrlxn2/vDyeLUr
         3to0IZYk7wEFlXsiLT7XhQyn2f7NAgDUL48+ZcCVlaAilkxJpyuj4mQsEawrpAQzsa4k
         8NHhLhpITfBd2tNTcR5bGgLJhsvrQ699iiUiV34CDr1YZx1tXRxZ7Nes44/FJufrAlUV
         DpYRYy2XiredE45yjYx1Lh/qZfD333YYF2oW+Kvs99YsTOQbLC/U4KTxHdbb0sGnAp0C
         15Rw==
X-Forwarded-Encrypted: i=1; AFNElJ9vKF9yVymhxbQOYIgOB5pscY2QF6DDgl4/M8ff1duH0ow0ImnNZg5e8DnYdYdG5p/dSYnJpqJjKWji@vger.kernel.org
X-Gm-Message-State: AOJu0YyXO65eYXkVpWpmQ03Duv45UXUVuvNUU4nTARqyPHEOqZ4r4KNZ
	rmGOKlsMSsZcIIcFxycngR1xxEZuaR4Osq6PbNdvU5zgldDj1nFMMU230VYYcJYBrKLnqb8SKrl
	KxBTzecleJOUDkETVAXK7Hxc2clZjj5QuVH1QpiyCmBI84FI2AdfIx2xayMKHluMf/uVu3Eha
X-Gm-Gg: AeBDievIfCyXL/scRzzeaAnW/GOAREZP/8FAeuvdqnbBgTqRAR3yaGCGRzRaVz1IHe0
	dErNjBXQ8F/fQzTbEhIujNxVqU0fevi0HfShGcNEIZV5+Xxq/Q8g0lFFjAsH+y1WEUsAlOifZCX
	6QAA0D3KIIem+OquOIfeUrly15FIMzNjII4Xyjh32nbfIjVEjfXltAwjFU+XpqEd9DrthIF9dLP
	xabERASJc3SlsVUwbyD7ZqdUoTkfZNIfSu6rHgm//eaKe4fuMiQfcXbPAAe5j9y3pahHWjogmwe
	SWaRQvPSf4mrHvp6L7o1KxWvyJQDlCV+PsOFyLefDbRWURLDY3jeqGgBniR+9XfSkEBHhzD9jxQ
	mhYbt1euP13Q7D0aYvaboMbASAO8s7QW//VnSIARtDO3JjeQ2/vk3MbWQRA+vTz0Xb4PS8iakwo
	kU/Ts=
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1200932385a.4.1776068864949;
        Mon, 13 Apr 2026 01:27:44 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1200930185a.4.1776068864567;
        Mon, 13 Apr 2026 01:27:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671a15577f9sm198124a12.17.2026.04.13.01.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:27:43 -0700 (PDT)
Message-ID: <23c2f6c3-1bcf-4bd3-9fb3-71d6c8d1a4eb@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:27:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/35] irqchip/qcom-pdc: Clean up register mapping and DT
 descriptions
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hQo3yb0nlyIK4w3X6mJ7zH9eXvCbpiZ6
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dca901 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=DAk3-xv8P52wg0kA9P4A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: hQo3yb0nlyIK4w3X6mJ7zH9eXvCbpiZ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfX2U0VSdm6gJP3
 Gw/m6QMCpzLK/ufnj/Irb6nUBYaJv2ec0rAK/FU68DlE6qGSrZ9UB1TRhhml6gcWckhFE0+jznO
 MSgySMRUp4IrEP/PmC7xHZyo5zPjbbVZaGu2h/DblnFJDMvWurLozvU+C+ICa0+Fgu/F8ciVahE
 XcSOEHMYvJEsudqtd7thkDa/UatE4ku8BdHZ8YrqWgiFE66b+H4Cr5X5rFwbBQN7y89H5jhABPD
 Dng1akPe4BYa+KmPqbA0rxqrEaqjqmfBMtAHh6utXifM40/Ez6fO34Kyj90nIe9kLg+iM6Q9M3n
 wiOPfn9oDrl2uUwF/2KnHfCgJ3noUwTDZR/y6uFPtdr6jmupRQm1Lt5t9e4wN8AlGwxGpXLpKJY
 jPDb3vdSjDOV3F2JbiPkRWl5QdxpbJNd7Wsr6Qw+edFCxHvECc7DnrFZFLOd0UBH2i6tbUFyXuT
 k7+bgrwUUXMrsESm4eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130081

On 4/10/26 8:40 PM, Mukesh Ojha wrote:
> The Qualcomm PDC (Power Domain Controller) hardware exposes multiple DRV
> (Driver) regions, each 0x10000 bytes in size, where each region serves a
> specific client in the system . Linux only needs access to the APSS DRV
> region.

[...]

>   arm64: dts: qcom: kaanapali: Drop unused second PDC reg entry
>   arm64: dts: qcom: lemans: Drop unused second PDC reg entry
>   arm64: dts: qcom: milos: Drop unused second PDC reg entry
>   arm64: dts: qcom: monaco: Drop unused second PDC reg entry
>   arm64: dts: qcom: sc8280xp: Drop unused second PDC reg entry
>   arm64: dts: qcom: sdx75: Drop unused second PDC reg entry
>   arm64: dts: qcom: talos: Drop unused second PDC reg entry

I believe that was intended for this feature:

https://lore.kernel.org/linux-arm-msm/1568411962-1022-8-git-send-email-ilina@codeaurora.org/

Is that something that ever turned out useful?

Konrad
