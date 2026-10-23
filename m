Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758638;
	b=TSBAhCM57k3okD5mvdGDmOkIl47muamxNzP9c/xva2EEZ+G8wAUqDJ//oPhNpJS6uQks
	 mpKusclqpRIux0TBgYNI0TvgjalWoR7Tql0noUtJS3Bw99k9vwlrxs9EIl5gJHLqpKwBW
	 Vvmmn1YG28aXF3EdqT2GLJFdA/B79wl5e9rniDdXBGEmv0s3oJc6qxpRPPT83ctTfQTB0
	 ob9l7rkh/JzNPgKDLuHMoo9+010OHGhPveLIv4OSIZgGTtpGPrgKFLIpWOpI5NJMoAOCI
	 AG1dOTd8UicQP9ueH0WFVZ/PgQLvkmGDXqQEKljcqSG/10AeizGUxMoLLSB+zFLmPXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=;
	b=bDQ8SEBYDnubYGsiRDgvCjVCMsJ6yP5gRibrm1l5vkEKjoqe9ruds1b338pNq9WsInbj
	 8aTIH7ImW064JXC3QOm6EnO5LPIFr7XjxvdK+ONK8c7bYPVmwjbYuzDjrEWhRuI1exVxT
	 sJv8E8XB7BT0RzYAMRI5drqfZTVhSqb7i7EkBDGvo2jzCAnV2IA/LjGJwmRjC9Wtiuos2
	 0VJabM1TdNzsxQ69XOjtfe/GsQhH3tLhubYBBHN14qNdOE6HPm7L/bwNSWdiYPOd20n8o
	 TgD4tWuOPcKoo5rMmQ7BWWxVDUVDRMpElNK7QuvFsEW6+YDKdEZKpRwyfZKQkjYZXJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GefZOR9V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Al0PgfCm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51D4606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51D4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GefZOR9V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Al0PgfCm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAB0Ju1444105
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=; b=GefZOR9VYvH6EOhK
	atAViuU3eAyJtLYqjxrnvK/kHFS9xm0xRy38tdeV9SmjWO82HyM2sLAtwvvr/jTQ
	QKCimYHiLijfvBm1OLiLSCYFitDdnqJikRP+r1glZQZv7qjCLJWLZ5PxVuplORpY
	9EBXnnbKshrXsd36Xis1oOUz+0lHtrRD+BfoRXFxbuzCyhUIKTuZ+AKAMp7WhBxJ
	3DSm3PHsLgFkryi8SOI4inXDAItovCBMBcZug+mlREalBL1EHrN2nrKAHkS/Yhnb
	f+7TEEkMvwqUpsdhjKQsfRzLC4iIJgfM1E7t8diF6e0DATCfrWF3pEaBJGXdymKz
	vw7xkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbkpaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:30:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3960dca5so19655185a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792758636; x=1793363436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=;
        b=Al0PgfCmiteEWZG2LKzj8/55fOg8sluCdF6VTZqVwCuKU5K9lLbNDemal8/2Lr4DaE
         a7nDBmXe7AZI1NTRh/2821g4sU7G9orb/mhLR4ssfnqJP2GyVuZcw+8q50PHNDjbs1dJ
         3r/x5NstOqtdRNEBvUHvf0nprsd351UI2TLEXzrJLownSgEeUJp14RPB2Y1vpeYNU/Dh
         H9DxF1cFqPeMkfy/U4XhULSpsotp19xfKkS5ChPBSmqYMnm9NhJFOCgW/c7fS/9Zy4y8
         k27ah1rAic2eUssKkz45BrmxYQCTPPtcK/GZ7zVhXW5bo1kJwshiz/5Amin7EVornZEo
         3Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758636; x=1793363436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=;
        b=n6quHFKm0Hk97UrmeBET2PKQflu7B/zjCCJbpLU0dQ3JmbyXQojgTzCFTo132n7S9o
         iy4W/ZyDiZki6E5WIbxAJJpmk0IU2ptBDer2D5OZuD0bS39PhehtZ+gfMCrNpX846+ns
         FczJHpGT5lpVgBaivNEqfmh9Upz+c8ayLLXgKpfKo9mETWXWFXCGLRwLDveb7kidm7sA
         hwPyfFPl4en12d6RX5CCs2sCvNDZw3itSqAtS6dzQiAJHJBC6DV/Kft7pZs8b015p3Ph
         5XLI/pRMNWHNxwATbM9aG6/knGudoyIiVsdqcBnyQARXpJtdsFavNxoyG/DI5yiSB+4d
         6BHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZLl4PidMTcbpQiU1WdnFdFaYteAiaRiMM83VgWfIGNyjYbHYqzTiLt7fW/izfEuTtT3mxpdukcQKD@vger.kernel.org
X-Gm-Message-State: AFq9FYKpigKS81efOxproBzPZXrPnORcAleJVA3McpJEipaePPyh3+xV
	MvOON8ZWxdEsQtD/iHtLYzQ/UxkAnJC9nDHW9Xul+gNKNVYtVFu4RQxTnwlrqcZz+VrL3sN0omp
	uFeJn/8taoNbwSz7oxUVIlOvCwpk8IYlyKYtWMK2UrE/Pq7yyqjLqG+X8V92JhzkJnJOnmf02
X-Gm-Gg: AYBFou3aG4epOIFWXWVOxFDW3nfLAEQQ8eEIdFT7X6X0sASGalsIfP6krK5V+Oe0ZwR
	AcPPIeZOpnqL3YhbE1PIs/ZgGdfqMK3C5+86F/McZrUWFFUmfmOC6rh+27jJQr86Kj8QY9QQMQL
	VH3FlPthd/3M/O0DxB6e1Ni6y96W/JgzbCfDRZoocPvc7tZXKWR5erI1sEZgp49lKiP9yvyDsDE
	5lldZb7h+w5BCx9gHU2a2Qz0ZoFPICusQqG1V+LddkPrmHdafKezKGaY28jjc83IkDpcd5OuO2H
	i5o6bBkOGE33z5UemvREOUS3TEtlT9YQswgIury2V9MpRDxPEdUUhuzgHjJ94fAR5VKquge3zgI
	TogHIQpeVvvWH91dILdASYA==
X-Received: by 2002:a05:620a:a184:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f6f7a8441mr365715785a.1.1792758635918;
        Fri, 23 Oct 2026 05:30:35 -0700 (PDT)
X-Received: by 2002:a05:620a:a184:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f6f7a8441mr365706885a.1.1792758635248;
        Fri, 23 Oct 2026 05:30:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5d17e95sm97254166b.83.2026.10.23.05.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:30:34 -0700 (PDT)
Message-ID: <ea77837c-0a64-4705-bd8d-946a0a03f16f@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:30:31 +0200
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
Subject: Re: [PATCH 1/3] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-1-a34d778ce9ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-1-a34d778ce9ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfXwObnMetLGxN/
 orcsSjVQKDrLw7zuh1Ki9Q5PE6giVmqgxahWpUp7kUCLlKkgR1FgJ/Rl8ON4/Kr2tAhGgQhUwgi
 WyktRfXSgW57azYndRYbpr4PJr1+fdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX3EkNfuCndEer
 N6Ac7yWc+5X4pq3vy0VJllWxtCpb3pHraQSeUZ3+oDrjOU/mVNRg+6pIw2JRiHeInaIR+0UOvtn
 +7MMgfKRk9fyFLb84kF66BR0SvXDmSwEapI4TZZQldWRm4MCvOVBX1VlcSnCECHIpy1excQWH5H
 7WY6vH2C/VUoeL16P1m6aJuh9QiooEqgQjJzwb8DvndyX1k6vY0u4sFYoUGwsiNDAAVPgxmVWZT
 PbX/viAEGHj8VyZIK8obfM9TA4F5/WgLIHbrDjHzbkKAutI4l5F9TCBQcr/J51T5Bhsyb6FhQtw
 SrcT0qoM3mj6GbHLlzSSxm3ALlmVAYNLOx3FYQ8ph5hjjOb7pn1DslTSQsPTxKLbeT42pUFwY2u
 u4bOPxRFSlBeWE/by9HvKNwwxK9oCcpPHlKMrve8wN1YkQtpeuqZpXpY3MMA8zOlMaP6L+alJ/X
 h4OETR9JdLvEtCyMLEQ==
X-Proofpoint-ORIG-GUID: VMkXkvDMNQnEbatI9ikmEwKFVZHwaPjM
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb536c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MNZHkl_XmBfbRSJpkuMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: VMkXkvDMNQnEbatI9ikmEwKFVZHwaPjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230048

On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
> The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
> stream IDs per MAC. We should actually only use 8 SIDs. This has
> triggered a crash on sa8255p after a boot firmware update. Use the
> correct value of 0x7.
> 
> Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
> Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
