Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660518;
	b=ii2F8W/geZniT1h6vh2K7RQ05BTCd58PCcRJQlM1GjMAd7qigm3ce7QRTlOYCqwJjKs2
	 hrqCmLbgKXUxcNcFOkCS8mymwe6RZOLMDvgPMCQWqhl93ofCcuSSYTH8E6zKmZtc38Uay
	 gdYn2eS1G26bwty/P73wNhUm4bVmtHPmINKyRfBrrtUlBxjC6ulfuRMrsM9XIYi+WQxwX
	 9svVuExYiFkmsd+lexWnsXvthtemWrTPYb4wA2DmRNGjBzmvC4F5ULWpuG5FYtD1V55DS
	 XQWlm2Bpfu3i8fP0FxbFwRfsAg8ePfKp6635V5j7GL2PidAHmmdVQvYiEdimjGGwacQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=;
	b=o/qHC//iBKxcNTLdWNMIXmIdSDbK2TYEJG2+Octc83DmP2laqq2o0YbSi5usUXVkE5VV
	 TTnopIHRPhsjLp7ca/OQn2OUSbhPiQ+JlBCqCWdnsWm2+9TL6T3wFmNV0wesiYAPMaYqv
	 8YZx7Z07kOhQOvYyLWCNxUpXrMvALeLYbmOf0OiptEErAh37z6KZxYe4U0fS8mTzJJUxb
	 VNj9zmbG/kCUzi+IyKKEszCmJyudn/6yO9vmq7I+qm+ahxFvmlsbLYO37l4sdI2gYA0+0
	 AUCDeHp+oCWVWp0s7FX0O6/InTDPhI6eObQKs/wpxcqrqCCCYQJu0xEKzW9hm4HkzLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhSpwpBD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P++bMImR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4E606A325
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C4E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhSpwpBD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P++bMImR
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M90siB3294751
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=; b=GhSpwpBDTx4whiF8
	H+7IU3lH+queWeCYxxzD85GVF8LsYxu6vQlqQDBrYgFuliTAH047tkWpCHhxd5t5
	UosdZCVp2SlDAjrZKnRxJWR/PDRc+h6ZknnYGnf4tbnZJwA32eeAelbEkbHAXhuz
	Gz+Hxey/4HfPNvjg6PrLEQm0mHFjYeJCoaMojKbEnGmxF/YbRBiV+lKN3aGbvpue
	kCbT+SBtWc4ZLxt0elx2HVEgIatgZcK3Cx39TKaTEOfyagr80n1xCqVNP6u3ENmq
	jDhUWKefIwQUtuL+ZSdhm/musld6YKnD5E3hUBHrAg9kHBu+d2sIRIEPHz+5bPTz
	dQx9Cg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93askbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:15:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so36062485a.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660516; x=1793265316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=;
        b=P++bMImR7Iyi6DfJ5uHV4DrYzUSN2FT+vJTaoAR/6EAH2QX68CKHpzyrCfURhHLipP
         QgEm7bRwkklB/wEENVUhnhxMLlETLIuc/NtdHWSZ+G2nREBzYi7C8o3MsNlWKfpmwjXe
         PtE/NaWGmVQ42M8E2/Y2bqO5PlO0qAzbvG7K4DHsG7U3Ol+cEx7WngKw3CTTuhNcjrIy
         hPFQhna0Zh0lcHxq1jMPBjjyAIT4SiX50++qqohzqvD/BvSHDw/a/ODlBc0demmltmYc
         mVZ8yd+GYMm7x5OvmNmjeYwZjilf94k622HXJO5HuYP9iX4biLl4nvUyOvhqD9CdCiwC
         rqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660516; x=1793265316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=;
        b=qIG8a3mRLCLo28IJ2WP7j4oLV4bo0YqtN9ch1DV8kuLwuBIuitSQ0DeoFHyB1GR4nz
         x5xpc5aE1P5MErMOT9xwNhEMEccgNLh/3UKmw8vgqp1s//vAnmTLeLpx1HcrrOZI7uoQ
         3BEW4xazNl2RSpmIWj8ih0l2BiLq3KCIgVBZsTU8m4riupMcgTtZTGSP+gPaqLjPqCJV
         Q++jfwiVh85kJWJbjUOjAzzpmbeOAFOUFeLNXnSugg42z/XPLBmSTkphrw7xSXG2toLe
         lo9Fc8hDk6ZG9U3fpNQNPiRMNmN2DFPb/13A3bgJmWSWyVpUCCaumcw9Sfq6o0WCi+lj
         r0mA==
X-Forwarded-Encrypted: i=1; AKwUvBw8CyGrs9u21fa+2HnebT++2LBEUjhbR+0cF3OCAjBoyRtiq1hgynewnjNBbdkZ1uIq+iq3869j6LMr@vger.kernel.org
X-Gm-Message-State: AFq9FYIj1Rqr7K/Q9BN0//04PkhngKgR3o5NBpeopC+gcbCxWGQZyA83
	ygW+xmQuFLe6SJLobJ6EKooyJHubZsdtatLKNDwy+FVZiaVmzc87C3VQ+zFAUx8ilHUrpZQBVlz
	eksLO6SYLXOy4LqopbtfEHmA6z38v26EW92JhoS3R1VKn5HdAPXlmO/tgv2yrIGQM
X-Gm-Gg: AYBFou1sQ/y40An/hQ5uCg1gp4XFMxZFqtDqOIY2oGC1g1VzOOxI09xT/v2eFzB7DTd
	2sUIbR5PSe0oZ+qu0YbRMwIEHPzRpCsMFrFLPwYpalPtjv7NL6NKlsD3Wt77pNPodCVauhh+gxH
	cdDrb40nTey/TB+jaT1VflSMZuPGQPe/xG9q2uGaLnLU0yJhuphBGarHK+siu6nOw8Q9tIgtj7I
	j0IgCTtmKby0XyvtYonuU3PzQCESrIzDQWyPS+D+W3l4zT76fFgDQbvC9tFXHGKHv1xuQGdTeAT
	v7DtMUA/BB6rPTKNX0naGC1OpzaLxJLvTOMBryreS7iPo+x3+LTP1UIGF9wtm9aGuLIclWWFlnE
	3uY5K4aGR73TQcHUSVFVg1w==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1113497085a.6.1792660515737;
        Thu, 22 Oct 2026 02:15:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1113492385a.6.1792660515307;
        Thu, 22 Oct 2026 02:15:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a61a2bcsm82138266b.87.2026.10.22.02.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:14 -0700 (PDT)
Message-ID: <5130b971-7576-44b8-a27b-49f3c104e250@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:15:12 +0200
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
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: eliza: Separate common CQS SoM
 and eMMC configuration
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
 <20260928-dts-qcom-eliza-add-ufs-variant-v3-3-9a2fdbf6baf2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-3-9a2fdbf6baf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX2TVuwSJFODpP
 y6FUMfmm1auSL93lVwRIIiJ+gv9nqFURjckGXU7cwOjggW+k+SUhpuowQ9bcejAryqUyqiya+we
 BB62DuTKh0fEamm9XKLtJOX0O72ResOa0yurCNorVEDS4nnSns+qmzty8ic8TN+MTf6hlrK6WNA
 lZZolpLSvLVPyk29OLB7Q/zMJYbADyQagOmj4LbBB+ceU7Az5HnCL8+Fdj0dIn0dnzXDrUUgNHW
 4cX89cORG4s66Z8Qln93EJmZXMy9hGPqHMseHyaIW6uFg/B4TlbJ9LYPLxXM4xEndAw0Og2YHat
 2wM+G0HDNDogCyHvddYD0nYpMjPYi2nYuBfiY75dC6Z5tUniNKGTlRZZkA1b7/wVQy91AlP6VsT
 K71B3WhA2kgWKa5MoZ2FT44whbC+eX1kDHEwHmfPZvA1/52U0kVYuQjJqpNp4mhqgEzVt8N/NWn
 nTX62IdM0RGNi7/XRHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXwrSLI5Z846GW
 mJqj2vQJ7tHyK6edGuRpAkj1H22JAM3afuiXPra2yl/sbBvw7w6CjCFlAU1pMKxX55nk0TOntav
 gmeYef6wUPTWtCQVvTmXfRMBROOAZ0k=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9d424 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=f-_yMVppHRA7q8N3D6sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: aIonrmF7RQvsGUjTgwDtPrQCR9-ucmZf
X-Proofpoint-ORIG-GUID: aIonrmF7RQvsGUjTgwDtPrQCR9-ucmZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 9/28/26 6:36 PM, Abel Vesa wrote:
> The existing CQS SoM description includes its eMMC storage configuration,
> while the SoM and EVK filenames and compatibles do not identify the
> storage variant. The UFS-equipped CQS SoM uses the same EVK carrier and
> shares the rest of the SoM hardware, so duplicating the existing SoM
> description would leave two copies of that shared configuration.
> 
> Keep the common hardware in eliza-cqs-som.dtsi and move the eMMC
> controller configuration and its 1.8 V I/O supply constraint into
> eliza-cqs-som-emmc.dtsi. This lets the UFS variant include the common
> hardware directly without inheriting and disabling eMMC configuration.
> 
> Rename the existing EVK DTS and its compatible strings to identify the
> assembly using the eMMC-equipped SoM. The carrier hardware is unchanged.
> Neither the CQS SoM nor the EVK assembly has been made publicly available,
> so the DTB rename does not affect existing users.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
