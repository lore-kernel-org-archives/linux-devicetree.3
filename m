Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5760138C41C
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120006; cv=none; b=apXqc7WY3eRE0qpSWKT/YvXPJeHCGN1ORfGhgV/LiwOACXhDteVz9W/rzDdOlc7pVn2aW9HtLteTSZ2SEY1HytNbntWWVOvNZnTsHgc1tb4RMQUOHi+FYqd0X/neS5LXInOH6f7Vsw1DedSE+W3g10oDSBZeHmv6J6w6ql59Do0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120006; c=relaxed/simple;
	bh=S1G+2gMXsKrDNLlfzL1NOLue91bXXM/HrhPE2rvpmdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMl5tZgxzNnYK7mCXcu4JfSql3/MV21aP4i7rAV2gtfHMZVTPeigdv4Xd6Teq5Ms5+ev7M3V4lL1RxEXMkO/cnHaOMUpf6pivSMjinn4xCBrgIOMTrE9PaAuGnDaH4ajciC9QYo+zmtgiG0X9hIV6D/WvHudWGFda2p5DEe+QGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwdEYzko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OverSMh8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwdEYzko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OverSMh8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632715FS1425499
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWlhH/cc3mCuVRrupRUD6r8mHHkfA1ig20MbqEoQEwg=; b=WwdEYzkoIexIQxdQ
	SbhBqDAQk6v8DJbo5grDF1IzilV88SmkVvkDoKHpqgBypQtCP6MTtSPYD+IMPz3p
	8KdEfrjCIVxPN9nueBcXlywG9se9fadUUCDTx3h6pYfbBldksQavPnIFXny3b2gT
	+boA8NLSLqeltakVZJ7QI4vRNlIGLbUk1wxHvDQgXonJTDVy2Bhepw/wAy/xEiC1
	5ym+pdo9WWvVvvWPWlWLbCoBvD206SioyRoGT03pe5H3RtXxJrkDHPF6reAw+Kbg
	wfoeobdHL2g8Nk2JnowNk8irlpNOBOhtRH81KkPfKkTJwGPqi/1ekCu/tS/oBJ1y
	GChfwQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511buxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:53:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89eadc12c84so2931226d6.2
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775120004; x=1775724804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qWlhH/cc3mCuVRrupRUD6r8mHHkfA1ig20MbqEoQEwg=;
        b=OverSMh8a8hC8WZCQlT/OBtHtdnVenLjm0yCNc5dS+mYFK9fLH4gprwjX37FmMAwJw
         7XGDnfjxxGjXIuQgcY5aOTzOO+7D1LOSgmh5XBzfqR+TswRZniW9hBeyvO2XmiDv6Wo2
         bgpYgYjRmNk57adZaX7arjqc0szO/zDnUx5J2evxO3ceUpEAHdzcNStPSGDxEYrbj0Xq
         ebJYg9WyJ2UMisXv4WtnGVspUfRgNmGPvrf69y3m4Jk62VWBStu9RCVJMWCytlLJ0jo2
         i3b1aUOPy/KMdddYW4ai3x11UaQDCAtnOXze6ssCCnnh9XRTPlWB0z7swGMWS6hyBD7W
         D6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120004; x=1775724804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWlhH/cc3mCuVRrupRUD6r8mHHkfA1ig20MbqEoQEwg=;
        b=NHc1z2ULDF+Ox5ekjN9ew3mn1iSdbZ2o7qJhW20XlegW4TeZeyMC4X8IbYP/FKOmsx
         GUpQNIfZ5vMBQ/eLhTK9HhCeJ1bi8aGzw4+L3zwCTYlnPEymtWwAsLgdkok72sUbHNUf
         1wKi+ORMCOxJytsMyZzewIrneCkd0r6sZ17ao94smnseynMztBVrr3BAsnUnEcaUVEgd
         8yG2UGyyiP3dst42mbCo6p8MoiRg3YIPCwp9s6rwzAPXBcWsSyLS98+7iVVLZ+g2PnO6
         JWWvgEM3QxrtGJ9VQ4cBzSN9Vrfs78r3++uJbfj5j1WD6k9Sq2PJs2YrUNK4JUVK+bt2
         wYig==
X-Forwarded-Encrypted: i=1; AJvYcCUhBM/k+WIOs683jzNOgZCi3FfWJyvfZ6AxBzvJIQwdDFeK9eWAY+N7d8+8AKRAfy/sPwMM7XwEv9KP@vger.kernel.org
X-Gm-Message-State: AOJu0YyiLxHpEOVm3eTRjIhvpt5j5dwFmYv8mnO0LqWbYaQuzB9sqbaj
	P+jSmlOBF25QXOgzhS/nx36da2opbQkSU6PnFlf3QUQWsgBMJPNVy/BVNZQXM/zfqz1sjYGRs4K
	abobPt6xXQwGSjqD5sBb7QxLhk04RxMiUBV7KLcxPQ0vJTIQ0HvAmiA5O+ZqgtaFC
X-Gm-Gg: ATEYQzy3hugYDR5eaK7H2PCBSHyt2XS7P117iK8HlULPkXcEdbp9mp8PoIxn4ixKqgF
	6nffL9JjHTxsECKY+FJEz73MKIh6rzVILTggfJ1hlxNqjBSR7OphgjEBACe8VmQiCXZepxnv9Uq
	7SqGSZ7fChLR0U8jzK6fhyCG32X2GUlaVgE5B46SivK4mPyZWbrk4/ACt/K0MTDAGkYvrrsEOAY
	DHsizNrvKtBo142mSliHxaLJN4QM4QN4IKx1mXy1qIEcSFdmeohnkWt8II7iHYqg05e7Sy6ThtB
	BCrDVNMG3Lk35KjZo+gb2nLiYOda2r5iNnFMOSTCS1U7D8zIen+T5jOulI4K23ESqJMIaVQgjdC
	DiSf69n6ovRnbOwPPuICREKaVw2ZiBULl3DW8NEX4DEtpBhhkvprjriaUG9kFRhJ2mnqtLAB/20
	9a4+A=
X-Received: by 2002:ad4:5c68:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a436f0bb5emr71493076d6.1.1775120003680;
        Thu, 02 Apr 2026 01:53:23 -0700 (PDT)
X-Received: by 2002:ad4:5c68:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a436f0bb5emr71492866d6.1.1775120003251;
        Thu, 02 Apr 2026 01:53:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm66160466b.40.2026.04.02.01.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:53:22 -0700 (PDT)
Message-ID: <16595c9b-a59f-4243-9041-e6c52418eb56@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:53:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OSBTYWx0ZWRfX5tg5SJzZtMea
 mGWfWxnxGiv9qoO2aOOhUsJzNKSGYHhKrjzuAthNr9DMEYdg72VoUuqgELE+J7CSHuwhuMAS2QW
 +61K7aUu0oIVTPDKgo7cDvrjTr9vZTwRalAQEoBeglANpCaFw7sQdKt+9TKkbwgJgasXVfcMp04
 h/SPxO3Vi6fUikRrmi1JBgbjoRIBAV81Es/nC0L4XtEXg7f4SACfNvRw9kDAuX0lS034Orkfq9k
 rfcpNo/AVTNR9OPI1MpP2hMWIQPp+09yg7CAVE46cetfO0nvpSpNJkDtiVIrLm2ZVz5LHqEd/cx
 riAzT4LgyJuY8FZFJ52CRLFRF8f1c0NyRcEmSVJyFOiRR9Oylql0lSN2l0bQhX14RpEa0dvPRW1
 jKIfD06oSQboMCo5x+BwyXysOclcb6xXLH59C70OdKl1pBm4TPg28hYD/yhL/V6KxPAHwBBhRov
 3PKM9aQD+rowPVNW02w==
X-Proofpoint-GUID: Zh6Y8aZyYN3_NRiEumOkGJrxqyR-_FFV
X-Proofpoint-ORIG-GUID: Zh6Y8aZyYN3_NRiEumOkGJrxqyR-_FFV
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69ce2e84 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eTI-YJAz-J8MpRop-NgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020079

On 4/1/26 10:32 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Reorganize the DTS file for consistency with other msm8960 board files.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
