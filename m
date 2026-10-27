Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098850;
	b=ozOyJEyu7LUDUlWDXI7+u3Q5K/OcEWpVv2DH2+FViKhzDtKRHD+oD594F8Bpj2FNvQXE
	 JslV3BkTdTXH6EHvJ89A6osIMpmydCI9/6NYLwYchB2IodYtR1Q7mrUHJclaYBIotf9Nh
	 +pqDGAC7Z4bb2rFWl1j4zuyLIgjHY8irzKkqKQ40NdETld7Uas/IPt/bF+yBxQa2JNNsv
	 VD5u/baGj4d/dcAabh0G0Tu1lvM1oR2jc28KmdHCh2M6LF7gkm/cyV3ZzXo1fgN0ygYsP
	 AStzSjOmpH+LGcw9uKI7ZCKXu7CKw6mVt8usFiAO/DApD11ye2iRlldkhjpN0iKAZKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=;
	b=MMFb065NGpDsR9n1PMmCeUIGULImN0elFL5ti5/wUQIAyy0U73M5VtUG/kAi6jtIOfXx
	 QUa5ETXKGQ/6QWHpPdW3FwYdMc+57+O+2lg3xRhTN1gDVYDKzgYNZ882GoHwax+6AibuL
	 nnFwZnc5araP9ZD6lB5vemXaongshrPyrUYeul1tcg2uAMBND26rX/GfEAAnx21gB+9Bg
	 BC1thuK03y/YgFSYlqQ4S7eUDgIIf6oFZ9boOgA30/6F1g4V4aF0FazGS0dwTSslQGEQ2
	 Dp/Bk7B7GpEpYV0DsSdeIUhMSVWHZaMZZmP4vIHuOP+3vL55kJS/amRvQv1QoWvmCng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g6UyFwRA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AN+at520;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0A7606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0A7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g6UyFwRA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AN+at520
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeB4C3026383
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=; b=g6UyFwRAdDpub3xv
	KavARD8Bjry6BX3/Vaug90AWHbvNAlnHsYB1LfFUWk2cyxTjGgJyJlnby68w3tcl
	AEMJfA8s/vnOPVIzXo60vyff9UqAzW4u8C5RhZd39rAzYOJTWWkjYFjefKZ/iyaa
	PrYwlLX120qSTGY7KxSbJomU4sxqrZpmqBFOq+hx8fDpJXJR+FwnzRYKA8bqoVHd
	LWj+GBSb+tIZptX5zB6yxHcEhM9AcH3wrqAkX9T85VHvMPW7ROdczlPEGoIki20Z
	8VaDyPPnbnE0m+WFavUkq8UdLdYR084iZD5MrlSLFM0/zqTpb2odNX8CAW8AufSJ
	aogcxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a3xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:00:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so108897185a.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098847; x=1793703647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=;
        b=AN+at520miud7BqLNv+4TR2aq6hB5sjMyGIRyQqzUh9HUECX0ef4oWS+PIyW01cm79
         0E/TFGRhpo8hrq+Ld8MCULqiF9iqZkosK29u/XRzuEL95BYFU+yoT7anZgJWA5VNK18c
         apnbYxZqP3VQlpjE+FZCh/THMIai5qQ+xrkOxQzcLW6zd8ild+zCD67jxbfsYgYqzxwn
         J5ZbuxQFTlplWmsM42bZBTCU3aQNuRH+hAfDxcRj5MxSyb4sOezJ9a50t+ne7Snty+rV
         Pgdj3rJeWY/RVE2A9AaBvWevuLzgHwfwEek3wUY56qtOUSPJ69oanwPkg1FJ8sNjasPn
         NO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098847; x=1793703647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=;
        b=jgUVzLjGyInohm+EnixD/gnmhMP06sZbNsnwKhQ28TTUCNnDguzRtl3EZX5vXvInXP
         ondAqEqBexaYWDxs9F6mwKI3xxR6keyDfYpoBgsFbSdVUBntwpKMl6xomaaReeM0tNXk
         RgB6vo2Vo9CuE9RbLRNGBhPNnK/ZuPB2aP9rRNDaZ/lkss77M5vsL2f7ssLdcvQFuTUU
         JTlF/EboRrX2wxhw6z5HYzI7RaOkJcyPWqn5VbNjBqztDniVvoDLtNBTD9YsC8evNPRY
         o9j4ZLywC6QeqyDUTAcJL6sCchB3cYUj9AiXt4taCT4d5sqYBn3etwHf/OrDEBOzQhov
         ODkA==
X-Forwarded-Encrypted: i=1; AKwUvBw4YXKFfHFSyAhHRx1V/zjq635GmtG2Bn0A/WWjH+b/X8jxTBvH5ioB2NHlud37uKcUXsv+cTDLKf5l@vger.kernel.org
X-Gm-Message-State: AFq9FYJgQh3ZBPKATrEGz+Fb6g8cATtc91X1a7S83A6zkpeDmoqp4o+v
	2Yr/GruJuNRLHWNI7TGhB/KPfY7Zu98qTrsmtxEOH39vBuzpVujg6K27/deRByAO2gWmdhR131A
	N9yRIrNJqFC4QLPfOCJevQsc37Vs3fF2gbT21A3jBSViseVVrZY0c0+PzeITiP5Ta
X-Gm-Gg: AYBFou1sbgA1DK7hKUmFheqRvKkyuKVxUQsYMMbrWznou1AgGyqkt1WjVbtINoBBcQY
	t9PAfKLRoecOOlCDqHmhghCc+wPBIIR5qn+awBQE4Q2I9tgYJXnWL2fhY5t9vdzw/5rXa+tJw9W
	Gk9Q3W2i6GDrEHRfxOWE7kd7R7CrcE/JcPwZt3YKz3ahXZVEz6g4LIMiDNYsgBW2Y+1Rmnt676m
	AmIlTxR3TfTAkpSj4YsLu1Ie/u6O9aQuE/4AM6gqqLeIMGt39RiQ2qlLvS67zMNl9a+e0LhS3AA
	lN793GpEWkI8Su5Aya6+3jfAc85jNGQNU/2DKL/PT6I7zKQE63FQ4cbpDPZkXKynwDxgAjiRiCf
	yYR4fw9h339RSoyyh/BEBfA==
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr1494958585a.1.1793098846436;
        Tue, 27 Oct 2026 04:00:46 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr1494942185a.1.1793098844938;
        Tue, 27 Oct 2026 04:00:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd28fsm4706281a12.3.2026.10.27.04.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:00:43 -0700 (PDT)
Message-ID: <0032f652-4ba1-4a52-9241-635207f0caa1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:00:40 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add SA8797P eUSB2 PHY
To: Hiren Gohel <hiren.gohel@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
 <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ChDvBqYl2k8PDjA1mDUpA9gGAuUAlOGG
X-Proofpoint-GUID: ChDvBqYl2k8PDjA1mDUpA9gGAuUAlOGG
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae08460 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3LHc-E_swVJ6H1yvdaMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX9VRiaswkxvJx
 vOI+clecoe6thiioASJEdm030URq1kWWbDl2cMrsV2HceWYyc5XyT2h2fLZ+QOWz90QTzdRRofO
 J3nE8OOyxxhutlO0vJ5RZKjpVSOx3WubXygt6D+5+2FNSMXWO0X6IMCv8HplGmb5eL+B1sSJUx1
 z26H8we//EFaDI5oLBP53924tdvWYqw/sN/jpYm2aIZi42Ss8lCyXyhmmZZvhlyET0ZIjdzzi2S
 xIPPR2AV00kzrH6U0oCG/9/EnxGk8zWQWows6uaivCxBnMAxTly7GH5G8qd6SZ4JCX6k+rWO9jt
 ymAY3F+GV8TNVO4e50lkZiZyUbeUVadtxSrZrY9TCg25kCHPM42bUWN/jQJhd1wxsU6iK76aOCz
 UxU947PhAzlgICsDrAccE6CbpT4RwgIdLZWbMvA+y9JIkKWy1vXQuk0crXt9S19uUhKhtBjBmBU
 1njStyMMxI5GVB3j9kg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX07ijvQju8ofL
 QPjOYrOz0be0mevhZJ1qAMQ1MW+XQh0lzkfIfCI79bKCzo9Qf++E+QOqGsbpEYRUP1n87fx+v+Y
 KXMzG1zz4tLHrgPgLdmxNJcjp3T4spA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 10/26/26 10:41 AM, Hiren Gohel wrote:
> SA8797p platform abstracts resources such as resets, clocks and
> regulators in firmware. The SCMI firmware exposes multiple protocols to
> control such resources which are identified by protocol_id.
> 
> For this USB phy, 2 SCMI protocols are exposed by the firmware:
> * power domain management protocol (protocol_id=0x11)
> * performance domain management protocol (protocol_id=0x13)
> 
> The power domain has 2 indices: 'core' and 'transfer'.
> * core controls the regulators, the clocks and the reset
> * transfer only controls the clocks
> 
> For example, to power on/off the PHY, we should use the 'core' domain.
> To disable data transfer and keeping power enabled, we should use the
> 'transfer' domain.
> 
> Add a new binding for the Synopsys eusb2 High-Speed USB PHY
> found in SA8797P.
> 
> Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
> for which we don't have any information.

How come we don't have any information for what the firmware
that ""we"" wrote does?

Konrad
