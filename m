Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705356;
	b=qFVIC+/ISOn9bIhrR2QHU2/z86wwH7WzPTvsiPF4Eoy9sV8DpHjcbBWMa3NF9wRGe+Zw
	 vPkhKYteY9rR84C6fYqZX36MqwIy0BM9vicSuYQO99ElXlcJBVFujQ7/vU5X73EvfpU4g
	 Uk8XCQD0S/Wua9fYfc+T6Lb8MtpcizKYnZh24j99Nb8GX9hcruw8Za2hj4WomxfuSmLK1
	 ugzin4PrLWKEWgbxREl+1rDzNY9lCdu2Jwyra1+EiimbSXVcJuhqnahCEkblqU7DZME6M
	 7Zqsh8OOmueCRcRqX7MpYi5N/2YWYv8dtpLTd91Dhx7tOGunnosg1lKenjB+1XO/6rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
	b=4e3z6Z0l/vH+qj9uNAeOyrj+1WzOGTWFwgQ5TuyHeXvaUuuTSl1OdDCk7LcktruTUVXv
	 5uguntUjuDZp9o85WJBxuejLdFu/QZ8vvSr6bzjKWqAD8rgHgoEc0RHJs+bGjeaXnNjN5
	 /Fa/ncFP35y+B67Cxpve9o3ohm1tQpXbdruDYU4CV0WQA/Pefy6aCt0AwXcga0GMk4RpN
	 77CeMdk+Ib28R9vdo8CI50LmIW3CaNB8TCO7hHBkZHT7hw5/Kg0jQnuda5U+y/3nytOE8
	 pztLGtJGkBdSZPdSTT65JoGvL8qoZmLNMiN1emecgN7b4KR/YDDV/Wmv14lHmUOqHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Sew2dQp/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFG1spZm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BFD606B102
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BFD606B102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sew2dQp/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFG1spZm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AA3Fu3577887
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 11:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=; b=Sew2dQp/0Bsn3yVV
	VvPKV9eau7fOM4MH+Eff2mYfZkjEH35+7hM84zTqLXYqG0hMMP1jtouqm27C+cyJ
	U52q5l/SUEx3rmAT5dM+m2zmbzCxIudXMFjVnn4UbSB7Bg1qfc1+GAsCPv23kbFN
	s/ocAIN0MNrsoqgCbzDq+d/v+Yb8ZMfefE55ggXax5oqReKqDbiGil5d3qekzbTm
	ALATqVOt3cLhNnId23gaqBMwMuoTAPX8CIeOPn2wf+uf5OGB1w7GAMtKmjhgGZFR
	f480dk5QrVaKchSi3IMWmGbgxI9ycjT8Op+ycVe86wPS1iFiiRz4bbqEgLnwF7eQ
	AsPBWQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d9vu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 11:29:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so382643a91.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 03:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705354; x=1794310154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
        b=OFG1spZmMsYtWa4OxILjU41MGudRRzeiEO/ISLakqaVJ5qPIsATE0JHpLiEQvzZrRr
         gPqjhcrLE9MZr24t9DABvNLjI8SHhhLQIYCfvRydkcTLzo+aWvVPHKVb7QNt9ND/LNJA
         T3Z985QuPCh8+YBNDGQ6s/v0C/8UZriakcRyiVgJff3exS5XIRDt2REA8AWQSHzEu0cC
         uqRzy5pptJVUIMXHTXLxfMhV4SCkdWXqBuFO5KVwF5UN8tMXrR8A3y7kkDr5HQ7Rkwxc
         OgW/cVZpLt9P2xc7mOwNsmah1zSL0okCcnTir+BRzLTPJwhJxutAs1ZkeiXa99z1y2Ef
         GBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705354; x=1794310154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
        b=M5IuUDr5fQ+qMsshvKnkvckyPlocRGPom4o6iawVRLWfs7Zq51acATJb9ppImSGe/S
         Ja2yvuU+esUGdGzoAzqHLoOMloO3lIhs8FiI6g1LJbr7WlQYSuGTEovstxmMif/dyA92
         pZT6kaslRk5PsZ62JBZaf2YuG5ExBV1hfSDCIuHWQjIq9GZrHydXAYDiFL9Z/ETH79c0
         KXKv5jEtRGqapC1e1is/PH5nETxfmHQ9QDrAGx6tFlYdTvktPbLBELOHtIRNuPIZ3sgg
         hPN6tPzYfSZLltyKbPWVoJNp+hzP81KPIFml2R0mq5K1Q/F0M1ZTTo0mBRygVFC/KaWa
         b1RA==
X-Forwarded-Encrypted: i=1; AKwUvBxT9GtvbZb7Ft5jycGeyggzwOxk2mUh0P7WZkBHpbBrLbtW5y8JRT2XxtI+/RwO1oVf8zsK4dT9YDBB@vger.kernel.org
X-Gm-Message-State: APuU4Z+PqKrBalbuRi91zlhna+Z8X/1ve8hU3ZuSN85sEkKyx92Rl0MI
	UN+AUHNRtCKZv+DqzSwpF6tQaz2A/gt6OdNl6ZK1uU29OJ5lzOhlKEkehBIuiyoeuHNS0IkuIM5
	J2foh1e9metSC3jTsHHSsKATxBflwIpeU0zGdF9Mty5IGwFOvx1m5uRR4oeLer+yZ
X-Gm-Gg: AYBFou22A6fRYATQFc3xF358AMChRf78McMcRAahyZmj6h23jLEVCY0VLWH2BTisqhF
	jq5PuiAW77/dyJ5ID6N1dXIs4VtQ5ZhxGiziE1d6C+Wg6jFZF5QlnFVXi7fJKkQ8A+6Foar9NnL
	gMK5lUbRHHYQ3xQKQi+Z8LYv9/eRlzlngWPJQCUF7SLyqEDWuMBnqTRIOgVx3ShCAeOxI0a7aM6
	8orJj5TFZZppO1O/Z3iczmMxxthkNVq/ma30VJ2iouB8CqE/1oGpnz2gTCFPKDQG9sbbv1LEvgz
	UwgA4lGTkYx+StBj/uZ42Z6hHNZ5nQCwmClIZa9J0LVoiQnLszw78c1cWQNhN5Ax95ex6FkiiJ9
	xSu1cJDoTNPr2EOvUKpMwAi115x/zsKuiUu0GPC6LwIInWXzw2WY+cpbRYaeb8nbaXVFLmw4v2d
	w=
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr7146011a91.26.1793705354443;
        Tue, 03 Nov 2026 03:29:14 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr7145979a91.26.1793705353952;
        Tue, 03 Nov 2026 03:29:13 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb91e5sm10519214a91.0.2026.11.03.03.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:29:13 -0800 (PST)
Message-ID: <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:59:05 +0530
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
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9c58b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sEFLFU3R8KEXLjjolHsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX0fY/wB3ea4hk
 1tJCAGSeZxcNK4lXr0+hM5TwHc2VRgHa0V3tLxE/6jQzT367Xp3NjMJ17ohzRrNx1w8aMd1zo6c
 +4b5gIup0N3EVqlQHAK/e3pXlay7aSk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX2m/CCta6DKcq
 1SUzPvSqPNKtj1yx3RSeRN4oksyzAf74BIvRuMW0tLmvOe2u24dKR13dcZOG3V29T2+jpXAYhW4
 1oEeWtWy8Gi/cioApSfrgvwxrXjXgB5uGwL78i0+1YOlj5eG8ILkhomWHO7l7zFxRKe5Ra+n0pt
 yAJirvBlF+bQD+gaC/VRCnO3vvNsZ6/GiqhBufXXIUh1yy95+p4BmqjZRZasIsAiACXR07IJphp
 MA10ZHNyGxhAq5vt88MjlEBpMIFedQomhQ8nM0bpJyiCzex6OK7FmMNNm+gcPnlPFd6ydYd9exR
 z9hmkzF06ZyLCeuYT3I7aV0xPtWUPF1MbaLKtBIrh5QBYPZTF6ZwvcsHwVSOnwqhUa/8LleGWbM
 KfjSOxzy4K31TzSHss1ILRH3vmJ+zi8wF7fkvaM7LKYp4V6k41Fk60cJsGYqJiREOt9TS03mUOL
 XiVGc/1O7iq8jsuPjPQ==
X-Proofpoint-GUID: secdvRP97AgVaZtVeIcVAZBjt4OXmNEZ
X-Proofpoint-ORIG-GUID: secdvRP97AgVaZtVeIcVAZBjt4OXmNEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030045



On 02-11-2026 21:17, Loic Poulain wrote:
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Add the Offline Processing Engine (OPE) device tree node for Shikra.
> The node describes the six register regions (cdm, top, qos, pipeline,
> bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> and OPP table.
> 
> OPE is a memory-to-memory block with no board-level dependencies, so
> the node is left enabled for all Shikra boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM

-- 
Regards,
Nihal Kumar Gupta

