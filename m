Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163946;
	b=xaC2gywiM3jKfe3LywSN48VQzIKxvvKmmBDEJf8mV/vIoU4yV1/xHgo+Dvoy0HyHNTb1
	 a1l9OFfDTRqoin3G9ygoF9cswdXsV67XNZ7D91F/NrM6oZXDIbzD65xIa5114M02fXqlJ
	 yO98ZN1FthHtbQWv7aX7zacoHqHNFAp4QdZtg3oLu3l0JSaOiyL0KQRmMeEXTnEfTiqGf
	 5inV7THpFjUc9mexarE29b2RdLe0C3lYKD8p8McLiyrzaQMzMf6bGrTUXFN5YY9eycbt5
	 XISOfDIJVpKs5iwf5Z/BBrXfitfk/cOcb1kS3Ljwb7DgOj98ddSYhlAX3X1w5SrmeYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MxL85Sxg8r+S5/kdCqyPgvf0BRmAuv9WK9TtBPMBZAg=;
	b=GsiO/DqZXLTbjc3VMVbMcwJ2ldPI5Nn3ZLmvK34nOwifd801174n7cvUQ+u0taK5/D2L
	 W3+Vru2evLnwShX+BAxMkNGOllPlVR+c445kEg3j5++A8UIMR1LRuEQzfezBm9fLqN/a/
	 d8b7I5lYCBsuiwbQ9ccAUFEOHlGSjma9f9/QeCa9g1klEf4M6SELSVtj3L0taFMONi4J2
	 7byfX4iP5wq1fZHcVjgx1wYGeWNFV99mxiolReVG6mo+RnCRah8RfEXZUJtM6w5rgMKtG
	 FFi+mEQp1AG2nxA2997Kzpbf2cU63cjYxTFUHo6dsFycqT+Ct3dGAmFGojMwlcHoGew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="V7pGQ2/J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DyqNdjXS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D06606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2D06606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7pGQ2/J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DyqNdjXS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ep2Q144410
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxL85Sxg8r+S5/kdCqyPgvf0
	BRmAuv9WK9TtBPMBZAg=; b=V7pGQ2/JE6UEEFVms/VQyMr1yIr4KBvqGydNk7Lo
	osuwTK2rJfPMGognUWHWpsW51HucPpOZqgSw7Jry4gJ88uEPfwuocpeKuXcO2u6q
	kQfm9Iu6Z8lqKdaMENXN4Iv3qlbDRjsEPMouIXMs0qfaW97BgBBeOmpo7vfhspaj
	pT+0rWiCg2KWkQPFchTX5uqz4L/QRQO5Tt1CRgXEdE0xwl7/v+uEAib6+kyQ4DmZ
	PDCASnJjtHbKC+7M57rg44StUzwgNzdcazpaSjKmKwR8+Fy3xkzT1/OAOhRYe21e
	25r9GrwGbDjMM1+N3WsKI0eHnkckQyR4IhoaRj1J4MzHFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbgu2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:39:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so117753285a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163944; x=1795768744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MxL85Sxg8r+S5/kdCqyPgvf0BRmAuv9WK9TtBPMBZAg=;
        b=DyqNdjXSXOyLSSixmqOwLoBayQAE5IqBE5WmBQZcTDi6wXOBMvvR5WMKLa5yFfeuc5
         6OdObj2odidxSYMfqxAjkoMlFX4fhXjL2MDNm63POKWJb6Q19ltejx3fqA1aPfQV73Aq
         5DQkG5cNzH/0bcEo76ZSmwRQjnjY7LkBascbl2xzHIBei7Y2YFGSDDfoAwq/nVPDjXqH
         Lz2uRLx8QVs9QJz6iQ5bkQBmjxKORzlJuE4Hvu5u0erVEjUgAc/mfWOKmN2qFAGRZjkK
         +j2pzVZU+EDe/VaGuioMmcC+KYk2Lo9JHqfClET3Jc3In9uv4/QXZPkZLdL0Y0vTqpG+
         8KaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163944; x=1795768744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxL85Sxg8r+S5/kdCqyPgvf0BRmAuv9WK9TtBPMBZAg=;
        b=qjcdIVt0yItI2JCPcbGWgf5l5ZRo+cPKvYSvP56t5DMhh6Fo/kfnlsiNBeSeFedWLa
         DU75nQwqjDJf7jxTu4EnCNpIPwJnOTeFcWkNp8WKY4+MwyiaOc2cx3qCxE9BJg6nMztL
         BXLM7AmDbs5/RWDnNdreYINalMqObT9NCl+BlFsM/6cxcHTWy8q+DxQhKh3gOdhyzUji
         PqPX0GjVVkzPshvD+A0u0qg7G8zSq4+luZBbPAcch6HcsfhbHKkccbMMi6toR+9yHOfc
         k8b8HdKcicP/FF2AAjHq9gwF/Rb10WWYPeTtLyaVvWexhR3SKUCgFZBovazdNhHjkWLH
         ZTYg==
X-Forwarded-Encrypted: i=1; AL+hErHPqldLkzKMNblFrIs+UWbHAwSX7C++2r2bwysAB46Uf8TBhp6gSvdPlC5xxvXA0ZHq6BpuijVG1w28@vger.kernel.org
X-Gm-Message-State: APuU4Z8W1iP4fe6Pwpxu6PPAzirhE3ekSw3SCMYC+F9xU8AsE8GbhKb0
	dzPGvkAoNALScTEafvxxSFN7jrguLkC5YmqpkGVD0HNK6jnbZNy7KdviflmvAvoUldxNX9UyaJA
	u23f36J3P30x4R+olEuCzXuzPGHts4/94X9XvdfkktAuJLwYkq66KoOn3D+YQBq7z
X-Gm-Gg: AYBFou0Zj4tOH71u6uzHJgNeIn7TPmfLJ4abYhtY6W1stY4wYd1KJ9DGDEFmGUOK4YY
	X0ICVjYojVsKqZm9LHparQs1KcmE4iwCpmqoHgSaBe6KlRCVAznNPHywqy8HKjhwaOD5AMnKI5n
	T28mXCOszRAz9I5iU5XM2v/IQ1ulxMBZnz8MQYyLLf4CgdR06h7w87Ve5tRzgpzgfKbGPgZefxd
	zOStOLlHlAN7uFVYdrGVN2qsgQSaY5XYLeQg7H/xMzqMvVBrw3NLi1dgGivt/4hM6Po90iokTh0
	7z94oWDz504OQ95iTrdcsbsZUsphlrlPL6+5EHyyp17mqErK6/rwkZAFUGsNb6dpDxnwB8BNYNQ
	J4kiMicSzhqsBwYzh23MNSm6vEroPFvBsfwXKwWe3olKnjy1/+1DSxi5RCGRPRiuX
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id af79cd13be357-949ba7e227amr379042485a.7.1795163944087;
        Fri, 20 Nov 2026 00:39:04 -0800 (PST)
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id af79cd13be357-949ba7e227amr379038385a.7.1795163943488;
        Fri, 20 Nov 2026 00:39:03 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm4317185f8f.6.2026.11.20.00.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:39:02 -0800 (PST)
Date: Fri, 20 Nov 2026 10:39:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: kaanapali: add periphid for
 traceNoC
Message-ID: <pwsze5zu4j6qplgtncsgohy6x77tomyl3zavjn43jmpkszrunq@p7et6xg6zqhf>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX4Y8ktczTwYFR
 QRUC/ZLcpcKgHQeSRtDu7lLZeufCnaJUIzeX0iFl6SOqPfn5C/2U8iTGIi64wiZHy+uc7zQTttt
 k1W62ruNtKvrZUj4jpx3XpRnZHqn+Vj9mzwuEuVP1vZeeDPk1fLMszLsu1FuC82u/Xf4sD9GsdC
 CJiifkcaBAu3Izlq59OR7EWiOyQqxRz5S1jxz+YLVeRhWFWnBQPlEqrSQK+qQtxHM89OvabIpVr
 TcscVkJNGnhM8adIK3svxqi+prqcyAg611LCGkHDLl43tHrSWDv/U2gVIDXnlVVWRyruQrbRwys
 kyVjxlG0FNx8LhLstBzvD47nq4+B6mcF36leMykSN+vucTao04jkrA9qIgozL+8F5yDRAQIxhDN
 NcFOHb4bhECtfuAZbYcums/36YkvoJj3ZPFwRaB2lSiODq+BaIBAacGvSGSEfimFP7SIkq3mNF+
 4l51ORvq/Mn6LqRdLEQ==
X-Proofpoint-GUID: TBbTjIsxkCDCUW4f9G9tg1Dor_BgqZkQ
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b000729 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WMmcwxbHwbnGiJZfeH4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: TBbTjIsxkCDCUW4f9G9tg1Dor_BgqZkQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX9EpANhfAyBf4
 VEUsW4nMQBOuPGud26bfKh25EEXy4ZoGtcHsmVVELDq8L9Nm2xXp8fpRrP83fVYKpI8pf3wOzwa
 f4nChUP129mm8Ndfe5talLy/YENIer4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

On 26-11-18 15:01:44, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
