Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578584;
	b=WWaF/v5RDPtiIDKXYkw7dXPv93/LssW/xSo0hCJio0FZGP+BgSGXptxS43YjWQLVPR8R
	 UuJ3ZlWih2JJORQEpgBJW/McyLQQd2icCNZoSE6mZyreAxO4XNJ73mfljQLOweYM8cKjL
	 Y8hXGAs68MKlky/XcTlAPWOrkreXF70MyAB3GGDV+yvccakPkKcSQ+iMBAW5qJBprG9yG
	 ZoKExWhbJWbUrvnACPJKN+GUfAzoOcAsu7E3QqUpZkUq+eNxZWB2zQokgxuvHRLV/Jz41
	 yEbJq4y5o9iZPW5PcHtchgLjJvxoDWnq6PQcrUgoiPdx/7SwtwWx3Olbg5UqaSGWyJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578584;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
	b=A2WQU7L0D54QcNZebRN1gJ+M27qLmO4z4/d4oISzyouamUVpjMVrSpqqj78RtoDauyj+
	 2I2Z6iOkU0H370+W9MglsJQM3KAchHfm9IDy6FHk5OjeKcvMiDlk3sSc5Cj81uaxeg25W
	 qV06gNLyMiKVWIhYxT2yV443+u+YLlCl8dzKhAx0HaAs7F0pq3yjzqx4yJy+ltMoTZavQ
	 V2JRMOlw6PUcUSDcBPbr2ZRgYu8F1DziVSA3w7WO83MXA/737MyvODRcV44CX99ry829L
	 EqFC6moaF6B6fzBNNH6XVHpUTiueZO4uLqhJggKNu3LrfYmVrNy1Qhz9KXbThOxR4SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KD0TTfdf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RH2Avjfm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C39606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C39606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KD0TTfdf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RH2Avjfm
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5kT13015991
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=; b=KD0TTfdfaEkJ+Yel
	xsoKUVDsJoAGY8KnexfYH+f8Jv/TrEWvYh+k7bA+RhvgyLbR71zh6sWA8dHmswDo
	FCf+o5rV+NA0ZOROJiYVnAqNm4qPWg128eE0yICi0VKaRYBliukjgOHvlsHWeeeK
	70/jpNo/5wjEmOknYkaRhnK6WLrNi9N1AfiJSRmpwvdyRg+0sIsz53KhtLU/G/KG
	Mu0848esElpWOWpMJmdyl3Vw1xQLbNCGsmEvbMuq/UQa8tnaVJCVSaix/P0FniVF
	lWdLamL8lFa02RNlh3jBhsSl6DUGA7RqG4BYw1ECZa/MIeSG90ShUmxkmh+qaq0f
	tptwvA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78ka6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:29:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91795e52969so1877766d6.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578582; x=1793183382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
        b=RH2AvjfmKI/+PNPwqAGug+RpM08POCDnGILP7/tJdH1tqHSCVUVYLat8Z9OSx90nMd
         M452WzyDOVs6JHxZBAO/NfXqHPYhcmNBRZrkqC5noVUpoxKwtiSu5OOLPDNbHqljJDdV
         Mrfk3IzlLIBcqTuJC0fqO5dvGHJDxc2az4zVdg+gvKo5xUbUHzyGlnVLO9G49yPX23gn
         MYjtL3KDVp6wQDCtJORYdedElbETPAOwa7v5ZAxzF/K50dbx/dlTmqFza/6PTEcHsmJg
         xYSc7t1iahrMtF/du0U4CzPMR8iQcl4gEr40pcNbnf0EAxCzurvN/WIzwxURhJGKsni7
         xT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578582; x=1793183382;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
        b=dHbl4UuXp1aTjvV3S5IB9HUBthHiD7XP5QQGS1/r1DCqJPZsqO/5NBFy3M9l3xgVzW
         mlUsnm5hQxHZqHrp7R/SE4xBPgGLxPEWFSS2ZYGHF4HJJOz3ZvQLfDAvG5I70Nh0upIn
         Qhe0nwkcbcSlspRqYSILOI0ASAMeEzerhsz4pGibZhjaggb3BAejDfeDX8NFJFbRlBot
         69LC/Vbzz0wTt1jWET4kVp2eoe2tXe4O16v5cRMu4QxM05y5xt5CnWY5KGonzsF8OJkz
         8uDTNHjcLd52Mz8mXBT4IWn+RbQNXx/seD2IHNtmOEa1DcnNk5v1+uGK7vyGHUenzsD/
         TITQ==
X-Forwarded-Encrypted: i=1; AKwUvByqKREgtums0rqAmGvPDEIq5cwDOjTozrIWD2rJghJL9edQOzL2W/Zce49ym72FUy5MQXmeVS1wIxyh@vger.kernel.org
X-Gm-Message-State: AFq9FYKGDSkX3sjXcrPCU0yp7WJ2rF5QNKR2D/DZ2l/YpsscBU8pFxas
	bPrQr283gX3AVnF1l9POdiw3lQMEqe44ywpHSPa6U83NPTdOSctmnk5hGtSSF2wQge9oF1Pv392
	eCSuHm+gpxhbhbBGVKWJLTHgk8CNKKVAkeegf5uBQ8632K+jzq+xAI37CzF/M3hqV
X-Gm-Gg: AYBFou2PlmmSFvMnNZ66xyOBs5r0r6VgkkOSWN65Vb2s29T2liDRFnMjGi3mF9KpKh6
	I0cF9flS8nE/M7ryOzMxAdyuLGXdX7SHGJYZv8rEa9fnIo+tRwApa5rdTM2EkNvHohBOscbeA8n
	MaYDJibDXHqZeV8S5YF5a9F/hOqfk8BwBRMEqojnbrKdc3QLFWQhdp7vksIExPNuRK8kFpVKhpa
	hHwb7Xb4+ynrcdzxv3yuci1aKIQei4jgV1CQbqpJvzAQxAs2lt1OKRSA/uWRwvYP9fmYkZhD0bj
	l6Hmyv48wjf8uNlTqyj0CG6n8Gw8WdKMenMcz+INJ/ZgLX3A+tjchDeT+qDEUXlPvxBQINyXQFT
	b+5EEJU5iEXyAB8wLBwjYzA==
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26734071cf.5.1792578582578;
        Wed, 21 Oct 2026 03:29:42 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26733781cf.5.1792578582113;
        Wed, 21 Oct 2026 03:29:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679009aacsm64407466b.78.2026.10.21.03.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:29:41 -0700 (PDT)
Message-ID: <9e60b65a-f412-4026-b84a-6a9bb8b5d42a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:29:39 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 gpi_dma0
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AFS_9Z0101-6egiaurH0P0uOgErkkGod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX+PgWOksgJMf+
 93PqoYLgha8GizM713C7Fs/aSHiD3R4PYfQhgSb0j5Toz5EASWxDpglG4Btt3J9fAQoXJBe7iYA
 Uhi/IZ/r6hrpu8Ou1tQpDtbJ9/tMA28JvTJ1+0oHC8EcnZp/zA/uYKXMxiXZndPw5XTDPCayes5
 DIE9GMppeiCbZh6PgOkDE1ONYSb8JYx0lclQVmk/kM3i3k5hic/0cVkK6KxoENOoSTbuod9IoD1
 xzS9EGv8w5AMA+X3VPwvQIQW8zFZEAEq7z3wyocK6QMPNfLulX3Inl8T+cigO0q3SkYb0wQeKyU
 MibbRcWMI+bTunikd0Qt2q8U/S1zJVlc+83Gaas1VxFyQGx9cHwy4XSKUBgsK6Nr27MQTANKA3t
 PxAvUO6e+UN11azYnZTVzNNk8t41h4dbmNB93wLzeihGI5PqRjoTllzNOk7xcRIGKHjbKWmYrBJ
 pRdM/5QvkIvOJtgH7eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX7lO+yF09NRlx
 6melueQf65OQPo9O68C+7HgzrQZ/7V3zfmNxbpiIecTQ9DiIHoOV2/z4/Q1q/XPh8uJ3Ai2bhdJ
 liVuFeZegM4VDH6UesJQc0FkKujvKEc=
X-Proofpoint-ORIG-GUID: AFS_9Z0101-6egiaurH0P0uOgErkkGod
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad89417 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qbaKm5uNP53N5VyfHtwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210041

On 10/16/26 8:38 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Used by not yet introduced tas2559 codec connected to the i2c5.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> We don't have upstream tas2559 driver which would use it yet,
> but the gpi_dma0 is confirmed to be used, thus let's enable it.
> ---

I can't stay this patch is wrong, but I can say it's not
particularly beneficial for both of us to go through the review
process to offload 4 boilerplate LoC that don't have a functional
effect..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
