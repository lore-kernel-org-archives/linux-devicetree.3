Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018971;
	b=Jm17LjK4iQ+KSa5q2qFxOGEg8rQAr6CogEyyq+EnCpd0+bgc2spJ/rJyo1at7Wj6u1lk
	 KBYi7s+lt/RfVGU885HPQkZJ7jOkLyWtgJodxDT38sDEJaFoBFIht5VPF01hCIXkaFuG7
	 CEcQwVSvfP94pr7OmnOlzHSpom9rapCCZ/TwxZyptUC2htlkzLuO8O0wVlmr0pLIcCzl5
	 VkzkcU1okPmwglVsnV1IhbFjvGsZGNK9OGk0DUUGqSfWfa+0N3ZC4OGVs3HqPDLFmxYIS
	 5kLTYAZdZ0YNhE9woBrf213m4D28rN6sf6EGg/8JxtA7k37DwTeZuBCrEuDlQB7P2LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=;
	b=DlEEHc30I/ODg5g1d1eqU9lxWvTcizqk+oygaSI6/auc/HHUSqmFhiX2YlvzkrrihqZ3
	 x7U7q9ehhVMBCt4NmqY0QSYQKf8BUVi/6ye5bgJfPGudUBBX5H2zry9AMxr+CbWAkZX+D
	 H17c7f7FG0UofxK8tIJD/R57etX2+Fzd2D1/DDzMWRQN5Jfby65A4ZiUExGDiqsLSqDkE
	 dTmtINrIkXVwLeiC0v0RPoD8u80wFGw4rjgfllcnCmCWl8NQThrVlBQvWT/fwdmC3BwxI
	 X5HqG9uC+7BsaXECoZ+u3xhCfZK24GblucF0E2mu79LKiHWfEOTA+9R5KP4adpUNbaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JCn+h5Kv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7TKOKLn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60F6606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A60F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JCn+h5Kv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7TKOKLn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKpa3085875
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=; b=JCn+h5KvK+PyV9OG
	HLETjM5Zg1h0vUQQyb09eopw3fy3y9DljnIRrvepywBaNPsn7u7dB6tA93aTKpiM
	TpPRuw1qZHCCUhiAV/gozw2Li0Q6ph5rSWCVTdF98AETR86sHTq7lzMU/C1HQVz7
	WMj/Gjhs1vOXByWmbLHR7G1ZRSfzdv0nKJdNpzWvOi+wweF3wmQNQuLo3TFGSOMr
	zs4G5nQobNkr0HyeszYA42imS7G0Ldq0fyKsJOQdTGwZo8DncKG6po5RYuA4rIi5
	1wUEKiC4BCia9ZlaIjpauA7LqoygVM6G85qEGrMtwqt60nKfacwammR2d3npY95x
	x/EXlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3pd4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:49:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so83448985a.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018969; x=1793623769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=;
        b=f7TKOKLnqBXZtFG3MemDn0gQdQp7uwZ8Za4E4x0iixSiofRYczl23jAcJ6V4vpLbv2
         CpxMuYJfyxgNiyZWEJ1e0Mep5lMCvkkCocbohk5f7BUeO3KvdpVNp/Nmx2f/s8XMsHXh
         0zMpWs8WcquURHuBgl0Jp/cZJ9WpgYg8j0vpS76hdQ5BTOsLpX7/r4O900VNdKG76BZC
         5ml9Ries6y5CI4eEJxtuXoe2EOyb5+czfnXBWagQJYc1cQi5Y/AvZHpTAIqGAGk3PUfz
         rFuldrLhXnEqEeEF7j53lnG4xGmGhywpSulbVZgBwmVLvP43AAyg6m4D9zx0Qlj751ql
         t4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018969; x=1793623769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=;
        b=kW75cV9CMqH9Cwb6mtYzs63LnD2d6VUX5FgKdHCoWWxUKRJc5SAzX/XLbUP77qUaRl
         xlhLoFlPP2lJtAMJs0MYGCrdt+N/g5JAFSN3ZFhmtmhR76RKYDl0sJ1ErHxnibUlgWzh
         u1kjhMaHyO16NI/7jDFmvWe1ZpVBCTpPaXEgKzNKipCcYcqbTIutExNjNEc0/YQQO4G8
         uP7nin/jH9858PG0KGt40bJcqKiLFXZLntS5E6wU/klJeErc9FNOWTTMeenU2qYJtgjW
         s4xz+m9uGwWztmmEVgrSicUrH7HV+CUV4UvvOq79NLoOucuPfBh1I0ujMbmhvDTW8JWr
         Kq1A==
X-Forwarded-Encrypted: i=1; AKwUvByuyBNksPmBnUwGFmTtgowrgSFOUh40MvLwxms8sTAq3CvWmDbC9GyDgnSjSJcivczYjG4PGphaSgSA@vger.kernel.org
X-Gm-Message-State: AFq9FYKZbL4GCIYiwonZ7xkQf+kbpyjL3Ul+jTo/NtDMPx5wSZ1Xi4nZ
	H4Dhw03GD8xoFGiBxQXH2OqODDSrJUSYwc7/1SrQGnoUq5Ba4sipYtVDUfytzO5ZN+H884Mly0x
	Hd3AebABj9B0CHfXKGbg+7gwZrCA3/0tKlsgDdbtQmRFlKaiIfh4LeYlUZjBcHGp/
X-Gm-Gg: AYBFou2dO1ER6vIBvMqLq5Ay+untNaT5jPF7ehps1BkKTa7buuagg8Pq/KfJ8a4SyNj
	4dw4aMuygXS0mP/qyms98LYCzW6r6HWm9akdqo0J9qLLiT0/HqAuHLQ38tdPVHDNONZZ6RnvsP/
	vsMt/bLbLHCpFCYw9SfgrqP6t4Ufmiz0T45kSd5q8vm2t79L2lIiEF72BbWfs9vEgH+EFqu4Vuq
	fBE1SdwRnn9r5b3PVeMGTj62H7wjymsUcrarmVWWW9kIwL2jxBwWp5l4wwqCXsRpcMaMSutaV9O
	0DKJr6LeVAlgGkHaJPA1/3kDkZ2Hhk56Hqy9013OlSKQLuVSEKDZDt2dTdSILn9fM5xEq7+RDi4
	VWF2P0Kg6iSF4rK6Bigc5/g==
X-Received: by 2002:a05:620a:7307:20b0:93e:508b:7800 with SMTP id af79cd13be357-940ef66e196mr986884285a.0.1793018968942;
        Mon, 26 Oct 2026 05:49:28 -0700 (PDT)
X-Received: by 2002:a05:620a:7307:20b0:93e:508b:7800 with SMTP id af79cd13be357-940ef66e196mr986879885a.0.1793018968475;
        Mon, 26 Oct 2026 05:49:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650890sm329086566b.51.2026.10.26.05.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:49:27 -0700 (PDT)
Message-ID: <2e928aaf-0659-4bc2-b6f7-e2a0a5e8d3f1@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:49:25 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add SPI3 QUP core
 bandwidth OPP
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7J7ywTWA4a0fVvj5xNe26pO2FvOX4GQn
X-Proofpoint-ORIG-GUID: 7J7ywTWA4a0fVvj5xNe26pO2FvOX4GQn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX02zxpGCpejsS
 eo1SP6wCFNUXioTdbD4kti4oYmIFUDO+iJMTBJ9fBd6iw0pDjvQrTvsknId0fIxOpjGcq1H/HDd
 TSqBqzlgEHTKAkRQPkEXKQ7bQO1S/VU=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf4c59 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=62u0kLJnlP3cDVRif6QA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX8pG+0LDsnIzR
 c9d/9VE2eTKmYwKXoMyXzRnFNu4VRV/LFR3YykeJnHXtL/MhsxhNW0SxApm9SfiuGCepXMyTz6l
 OQORe/M9OIpxEqbWNB0eDGg6cMrjjLwYmzL0bTTMvb918j+z2mibi3/boh+v0Jr1AdltlzRjV+8
 HMNqFJ/D9q/cJ1bGXPwkv2xN4Y4V3+yPSFXhZAN8eXEsfGwV7Nj1Oi2Bh9ZB9sjRW9jbuybfgdG
 Or1vn5+xr3m2+bT2SrqU9yBzdgtWuNFagJm4zEowxuog1Deic+qIXp3GXUClZfwvZK5pFJwrn5v
 Bqzb8MUr+yJf5f+DgyBf9POvLz4kug5GN++ED7I9vaM66D28QCO4TW/QcJk050KTvKyFzvHoric
 7WxoUQ99/bm5znhKLkiCjdZSeoh6ddahSkPKC8hezJ7hS0WTvJjVxXcEMhsxpSbDgjy38hoAMfr
 a7lx41KHpXTJmJhYyFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

On 10/25/26 2:43 PM, Viken Dadhaniya wrote:
> Short SPI transfers are sensitive to the bandwidth available on the QUP
> core interconnect path. An insufficient vote delays Serial Engine
> register and FIFO accesses, increasing command-dispatch latency.
> 
> Add a dedicated SPI3 OPP table with the valid 75 MHz and 100 MHz
> source-clock and RPMh power-domain OPPs. Add a 100000 kBps average and
> peak vote for the QUP core interconnect path. This improves MCP2518FD CAN
> payload throughput by approximately 38%.
> 
> Limit the vote to SPI3 on RB3Gen2, where it serves the MCP2518FD CAN
> controller and its frequent short SPI transfers. Other QUP/SPI instances
> do not require this vote, so avoid raising their interconnect bandwidth
> unnecessarily.

You can solve the general problem OR you can do what this and
create more work down the line. What if I connect a MCP2518FD
on SPI4? SPI5? SPI6?

Konrad
