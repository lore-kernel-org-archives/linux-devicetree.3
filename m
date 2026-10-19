Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BF929E116
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412541; cv=none; b=OZiPY3MccO/AV2jLkIp0WyWYYpAWBSC1oj68zA9AD4xjmW/IDW+ZLX55JHxk1cRZ5XZaS2D3B2F+xqFzcuiBRPSzCmZujZHBApcpTvTOcnJyFUyYE0tWNac8OR2K7q+6wYepf3wjtLoJOXt2aYAsmsNxXMs794B/k0VZi1zie6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412541; c=relaxed/simple;
	bh=GlX7baMHCqJ7RcPQiCBzxasm4MX02saiVgEKw0psFvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULG6P7u+4JkuQWJQrzReVz/NCS2D7cu8vCfD1+KJe7J0gl0hxJ+J8FQVrv+cyhOAszCCOGYOFTYfQaOW3gVY26jCTUpjWrlRjeqXBNBlr2exxa+5oJin8ADeU3ihs+Pzp/RuIbrteroaW6jvT6BziA3hHyY8JB4z1qniBa+oHSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/8V9kvy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYRlZxSL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/8V9kvy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYRlZxSL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrM91665571
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Hd+3ei/BCjNe6g+n0gXXNGO6XYABxjLWgQMlr2RSe0=; b=O/8V9kvynwE2sp4z
	rHdRQfkIFwB3AIKAOoghx/hZvq7tBgKxo8m5G0d9f/yM/zgszA+VInY6obwz/i+J
	49xThQaVj91nDnI0dzAimXHNUSdtKLXkwh+K2T1fKuT98/r5+mm4q9LL9h+XA54a
	Xe6th8rZ6uyv/3zlX3rkjM3VLEVzIvbBOpJjYe5/Um8vqzPII9sj/MtkhqyZ/5Te
	Rk05MTeabj6irJSW1P4PyXWJ/GTGXErwqdtUWl7fxCyoxsBa91R9B23VRbR1rfU1
	EveSVbJmXAMzNg8WCGua1zO347HAkTAcEwUn4gPXF8xrKe6AibMt3L8AiK9lWaL/
	YRaWJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n11vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:22:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so81810785a.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792412537; x=1793017337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Hd+3ei/BCjNe6g+n0gXXNGO6XYABxjLWgQMlr2RSe0=;
        b=DYRlZxSLjqyt9nULAv9rY735wdJTHCa8TxmaZDBnn/D0uDXaywPOMbHKnkrWESKpvr
         0zI7HP4hhTzEhlcBsBSgoDuiGRg0R1a/CD2BHfHlQm6+vj2YLM1HNZWAWHpQJxDQ9tut
         /Pax6EbFk3iGX9KJuX4x215APyiVxVZZyAVlgWz5bEvkJo8N8ZoVaRO+zl3VKlJpEc+X
         FtlwFyXvs/t+YpkiYERgluhClDTMoDt4p9x/fbS71jFuEXlTmK2C32PQVn071IggqEBI
         MD+cmAiICSaV0P2O09YGMBsJxMnSiwGt0FzxVFnfixBWFS2B3mgRpyTixIAg6AEwl6g3
         tFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412537; x=1793017337;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Hd+3ei/BCjNe6g+n0gXXNGO6XYABxjLWgQMlr2RSe0=;
        b=OJoh493u+byhTrS3Fck3ZLgZIQF5CxzeC0UGcbqFEuTNZKjwq2z6Q98mzVt2u+hz04
         0Loqa6AlrB6n5J6psUy4fMYGctNGMEtKxredhl6xJm61n4R/R0B3Y0rG8r5otm/0i6Rg
         D1IhDozquhmpqnzhuCgezJqeM5SXg/P3DPnERXyFcOL2D6QwDOYtd8fe7b6b9F3iO99a
         g0fm1jZIJ+pBUhm0xwPBN5OA70iAzJ+OaE5dN0P9q+tNvuoWrRCq8NtKZbL5sQG3FreR
         NjmRja5xADdAc8otqTlvQq5/JgXPctmd/UW5B+wfdNDE/66SxROMyXIQzT5Kh6/NW+rX
         ucJg==
X-Forwarded-Encrypted: i=1; AKwUvBxGso2+oe3UJgqc9NqL01h4MBwgSdH8FADiRA4n4W+FnojcTPtnQ+MZtvEebaJ06Q1WGb+t5+aC1zrL@vger.kernel.org
X-Gm-Message-State: AFq9FYLCsBheQur/5MD5dJtizcr0pwjCJ9VI7a6tyQQplAFRZcVX940s
	Q+W8sC2SffM5ukHAujNNNyxcw7Xt0srUFLjf2oYm0WaLedjdkkWhSS3A3NOhHYAXT0uKQ8tqMRb
	JlcfRnGKG2op3K/SNQRGCYSLUmlt9BA0JrB4Dqc33HMLf2UVYLlJXuN9D6vgTqQpHi5CMTpHf
X-Gm-Gg: AYBFou1wKidGtaiN9Qin7QUVi4S5oWP+vA2ptmdH4Vnw5Wu4WP061jcPIieXKCtmKad
	4S7a8/U6rN/NNMkMmDSuRVwjBYlGsQGxI2n3VAnZKmvp6TtrcVxvq8JJKKWQV8w3AwGvT+cDy8R
	ZVCt6NsWKGPgUIfEKED1ljIK0A19/jHQOmgdS1McTXPiPRL4pTrtmmedWTAFkTW1oh0YKdCukyY
	lIV50NxK84XBUTH/HtozJvh8imax+MMYsWbo0pAFiBo3CSiiZGbd/6qf4GhgqSswnP+qXUdktdI
	iOlrTdec+2o1vgry69QnWSiVUQyVnPBpMtFxMm8/TgPuyO2ePdcoAPX6a7KBNZkjCKMVPpLFiWb
	dQXS/+IvXTiIiN2Roj3qCsg==
X-Received: by 2002:a05:620a:414b:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f29b98f5bmr1501015785a.1.1792412537127;
        Mon, 19 Oct 2026 05:22:17 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f29b98f5bmr1501009885a.1.1792412536609;
        Mon, 19 Oct 2026 05:22:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4c5dsm351465566b.39.2026.10.19.05.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:22:15 -0700 (PDT)
Message-ID: <d58c1d15-49c3-4740-b24c-17b850b3ddf3@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:22:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] interconnect: qcom: sdm845: Drop the bootloader
 vote on ALC
To: yoxcu <mick@yoxcu.de>, Georgi Djakov <djakov@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013202611.3070778-1-mick@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013202611.3070778-1-mick@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX9MTLktHT3CAQ
 aKg5VEwNYF2BjtYF/PXdo5df7tmLK5RX6rJreJUL2Rz1/NrE8sOFtcAQ8eCwz9oIq7Y7Mgo6Abc
 EOqtJoSziPqoUKC+eg/WPMWPlGqDjCs=
X-Proofpoint-ORIG-GUID: b0QbSfZk3iyGDVzgogr9qr5zq_KQvWjQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfXztPFC0GVivXf
 WiyDrI+c5UF8CTCPsqrVHWHCv2BbxYqNKMYa8fwDV4z6SFSfR9NMNCfCtRwe5GYqhtpFBus59Cv
 uU5FAclnzncRXrIx5h/xu64A19xk99eaCo1Nz+8jVKgAu94PHAkkyYyO6eb4PQ56d40NB2XihhR
 lWjrmbJgvKX2FYh3QCm6WrurschgC3SruoHm3W+w5KagEKfbpxdfxO9T1OCJ5g/e+s/0f2M311e
 zD6YyNsHXNRgOQnTt5nUgRFpvJ596WI3WM0In0DbtZ7THupH4F6/w0/ldrSOC3QYjiQW86xh/zt
 B51xieBj6hufKvCQPMYBH4vyK9zYKP87r+Jt7B6Cot+bS/yfYT0KTG3n8UR4YjOndRO44YBAnyb
 +m8TItkH3R8U3qz/fpRucLfXdoX82IW2BmLHS93xiJzjOcmHlRUoNpP+Mw3RSHaLRo5jKYmhGzb
 oTk0buLFNYQr3TT574A==
X-Proofpoint-GUID: b0QbSfZk3iyGDVzgogr9qr5zq_KQvWjQ
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad60b7a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=kufxfYgKunYpcdHy3O4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190049

On 10/13/26 10:26 PM, yoxcu wrote:
> From: Michael Auer <mick@yoxcu.de>
> 
> On sdm845 the bootloader can leave a vote on the ALC BCM. No icc node
> uses this BCM, so Linux never writes it and the vote stays in force
> through sleep: the SoC never reaches CX collapse or AOSS sleep. Found
> on a OnePlus 6 (rpmh_read() of ALC on the APPS DRV returns 0x2000000f).

ALC essentially translates into "prevent DDR from sleeping to reduce
latency", I don't know what a good framework for that func would be,
but interconnect (even though it has the plumbing for BCMs) doesn't
seem like it.

> This RFC adds a node without consumers on mem_noc that owns the ALC
> BCM, so the provider drops the vote at sync_state like for any other
> BCM. The node needs a new ID in the dt-bindings header. Android's
> sdm845 bus DT has ALC as a node on mc_virt. Mainline has no mc_virt,
> so the node goes on mem_noc next to ACV and MC0.
> 
> On icc-next the provider reads the boot vote back
> (qcom_icc_bcm_get_bw()). The vote seen here has y = 0xf, so with
> enable_mask BIT(0) the node keeps an initial vote until sync_state and
> then votes 0. A boot vote with bit 0 clear would not be seen and would
> stay. GENMASK(3, 0) would match the vote seen here; I do not know
> which value ALC expects.

On msm-4.9, the downstream kernel for sdm845, the driver unconditionally
writes a (x, y) = (12, 0) on the active-only context and (0, 0) on the
remaining ones and that seems to be the right set of values. I don't
know how secret their meaning is, maybe +Mike can help.

Konrad

> Questions:
> - Is a node without consumers and a new binding ID acceptable for
>   this? No other qcom icc driver models ALC.
> - Or should the node use a driver-local index past the binding IDs,
>   so the header is not touched?
> - Or should the bcm-voter clear bootloader votes on BCMs that no node
>   owns? It has no list of such BCMs, and cmd-db has no API to list
>   them.
> 
> Tested on a OnePlus 6 with an sdm845-mainline 7.1-rc1 based kernel.
> That kernel has no vote read-back, so the node started at INT_MAX:
> ALC was voted with y = 1 until sync_state and 0 after it. ALC reads 0
> after boot and suspend reaches CX collapse (qcom_stats cxsd counts).
> The average current in an idle push standby test (Wi-Fi on) was
> 35.6 mA, against 43.7 mA with the ALC vote kept in the sleep set. With
> ALC off in all sets the phone has been in daily use for two weeks with
> no side effects seen. On icc-next both patches were only build tested
> (W=1).
> 
> This is my first kernel submission, feedback on the process is welcome.
> 
> Michael Auer (2):
>   dt-bindings: interconnect: qcom,sdm845: Add MASTER_ALC
>   interconnect: qcom: sdm845: Own the ALC BCM to drop its boot vote
> 
>  drivers/interconnect/qcom/sdm845.c             | 17 +++++++++++++++++
>  include/dt-bindings/interconnect/qcom,sdm845.h |  1 +
>  2 files changed, 18 insertions(+)
> 
> 
> base-commit: 3fd56a2833c22f62eb84297d0dbd47739632f1a0
