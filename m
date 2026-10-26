Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012083;
	b=Gy3ApHQ+nO0gDQ4j2YULRXKUmevXVxIJz/v8GVVOWU7N/K5z7HQCRs8JF4lKAF4dPgo2
	 QKxYspPvi3oy44uUhDwnhjBUF8GUFEExE3FxlT+NUdOcIU+Gybqcf2TOfuyUOpPOofbaR
	 1VLLI5dIZVgRxP6yNpXgz1nEYYYJ+GvSVXjsXb7xjpsw/ZReYIYpy9xvW38xJ3McA2SIV
	 DXpXbaJzzDA8g7NRvYgRUUe84xr51hLIQxN7kUPgqYYQhOwFgBofLUxMapi4S/8sSPi/M
	 kRVZnEWVYEIW7IYflc9o/q6XU3YvpdWpihoWyk2EcFgwJTQQQL6laZ7Rfr2bXG80rAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oq0D2Ss++smLUiQ99vZjmEFsrbRIToYjC2WTlYiT258=;
	b=I7EY2egU0HEOsV6pgrlpTY7tgQ11/07uuUzTAfJ8UOuQ5o/l0v95JTu+DKguODacIdL3
	 /kqdzVXe/uoRbR4nBo+Y1rzLrB1YunmdVgr5sdn5CXeFXuTrzHwmO1Vmjdx55mbp40rpq
	 DEZ+NpzyXHpPDFa3fh/b7e2xIMUTMUG7d7A4xntnjLia65ywS8QDnqTDZ4NB1Ztonwde9
	 rHSIkwNjyC/RvMFPqNfAAtP2Z8vnoN+IrQdzUZ27SCLIP3lJHXEfYyAeO4FwEovdstPNX
	 A74x2YbqnFy+2s4s3Y6LJS+vy3YIx7PXPYSrM8bolpw+9RDSgTvX+xMZfwsklijhElQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lJT9wNFT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BPLFgbfK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF8C606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF8C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lJT9wNFT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BPLFgbfK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QA55w13450937
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oq0D2Ss++smLUiQ99vZjmEFsrbRIToYjC2WTlYiT258=; b=lJT9wNFTbz1ZUXG+
	XfeeYnfmzm9oGbGmvPV15k8JJxKnXdpuw2EmtDm/+AFh8DMU8zKmbCRWj470EP1M
	aRr8pH8TZ+8LA88ZAiCqHm9pvwMDMp/l/YNdfzAJ4w7XA7gIDu/C76G7Mtmw1+AQ
	CcDONmFUrEZu6pOtryh7Rjy2mrdHDvyvdht0vMT7iZT0erTpnKOapU9op4yf5qiF
	oJzKZxM6n/xz1Aqr6/iPXpl8fp9fBg2+JC/WA/8kKFvdO7pcXmKLWqvsmPiqK5Ar
	px0YbOyRTdl7aOfoN6USMVGTgdZ+c+hmNSBQtMptbWZL0XleqVDoJckX6jqem2mN
	i4iLog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s9074h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:54:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53635fe2335so3049961cf.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793012076; x=1793616876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oq0D2Ss++smLUiQ99vZjmEFsrbRIToYjC2WTlYiT258=;
        b=BPLFgbfKzu8Eb5D3Uh4oimWyGut4t2AP+Rlit6Nxvh2HN3ydtc5RD73mzISn+R8YZ3
         +CwhOgALY2B0Hklulxb28RQoR44C7/Ybxnx+/JWtEqhsx7HfWbiL3Q035CyREtXLQDfm
         48aUKvwLNJ03AUid1fXDip0t1xA58vEW4P4nkKF/ZY+l6pnclbQ0H2LVnU9Mqstl4zaD
         GuIuciiGhH96p4ueQHj3TomNOhZ1ZuL22QK+u5k6aCsOGq1tkxN3xue62AgVHPIiUzsa
         vrTCRNdJ1FDXpcLO5A1dNxmyiZPhuypI3N0/kGU5YsixQ1Rxh48DzqLK1rqFGzTeuayL
         sm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012076; x=1793616876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oq0D2Ss++smLUiQ99vZjmEFsrbRIToYjC2WTlYiT258=;
        b=Xuq1KzfS+5vFhyodvDVWB/bixW1GcZ5vIwWNYXAJ3T6Tf1T+w4AUDQit9+v9u6CPmM
         Kt5ydenyRBQvAlj/6E/FSBwE27+2WuHM+VLMgSXylQrDg3WosBlvbv4wA+ZUoclVqR1u
         WcoglhKoU4yici0q7R2XI3CEPj30JnHCVK05ocoDbQTigvBy7HJ/cyLoVHXXsTJ5XF0c
         ofcvapLk1V6yBthLFt8V/6cqo+vUGbd/6EK0P1AuVe9UPHuUKv62VgiwprdDD04HVnMH
         GNKV3X2nSLowbyP137fleUB8PdQSFVqlXG1+X5sWjfp3OgYGLuA05Hbjd8LG3H9yiNFO
         Psrg==
X-Forwarded-Encrypted: i=1; AKwUvBweTyNLb8CbvJ6l6poGBRfd3jODCensqgnDOx7gWAbm1tOuimmkfEFdnlwJpFehO2HWs92RCU7mHwVi@vger.kernel.org
X-Gm-Message-State: AFq9FYKfeHVdwxJTqQgxc9erfpTlKqXRnTQOZzO8bjFDW7sWSd7Gk+Wy
	Al3dMghcV+hvJext9x63nRXPl0gOsjJdpJ/Vd5/WkEeu6gQrLrjCxBDulhV/4oJOZmW7baFbvDf
	hnc/oB/3mRokqM3fXMEeRaUxlfvWfkmjPiDh1p5Gfk3XCMgjR+aFF1YjqxrtQMf3S
X-Gm-Gg: AYBFou3asnt8hIkbKxkUHhDyfEwwhxhkK1anyJ9RqChZgybej+l6X+3RDTrKCoho3ct
	piniscXT2jItaH1r3l5NDKYSBwv7OLmK5jmD95N4XUyMVol3Koz5GlwgSn0rBTTaiZlomycu+XX
	n3kdMtIxlUh4DVX1myPlm/xyEemZ9uraqIf6eOrHnXNamrzPyzkZhQbho3eRpMf7eeC9uymDYqA
	z6Gcfr0nvisHMy3KFGqWNpuNm0L/iO6/UNcYxvA/o3EIBjyWXZGzY1d11z0a/GfUiqBLsbjgJZU
	sjwmKKZrtanRYTtYfVzw6tuDWik5un9zyKmK1SeHr5CqYGFv0G6S+mwMODiSIad/OaA4NW49Spl
	5KEyNk3E3FnC4/NIN5z+dPw==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1137088285a.6.1793012076196;
        Mon, 26 Oct 2026 03:54:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1137085685a.6.1793012075783;
        Mon, 26 Oct 2026 03:54:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea620sm305456166b.23.2026.10.26.03.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:54:34 -0700 (PDT)
Message-ID: <7c287dda-9e81-4e98-8a8e-0984afa5507d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:54:33 +0100
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
 <20261023072832.2642647-5-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023072832.2642647-5-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MyBTYWx0ZWRfX9qeNyFv85/EV
 cnAV9qbp53r+3fzrLfbac/J04odpOX93ps8FnWsteLxD6xFGQ6oLc37LTBeDwwj4spJohhBtOBB
 CQyUB1jfsn/v6KgWQMRXysnuvPBhUcFxOHOFraToEHzH49R8V47B57ZSL1yM+vrZslMoCt5yDuo
 yfV5GSmcMGZu/9JnspbVPeXj1UdMyYUaPnzujkdyUbrmhre2gg2N6aD/QWf26dD2j/c9XcxIAqB
 8i4c/uPtEGlX3YUFUt2TRQDpvizFr4J1u+P+wrBLbwm+V/1QAeYNWG6k8zkikDbmP0IJ2M134F5
 9DV3acmosbHrwwuQNGz/AtQtefk2ZVUVCWEnjToreo5ky2GCkVhaDHQt4UHJi9/7YAMmDuybgPA
 lO6wN3KYXcKTs+urBEnuhz/4rFRDvKTx08bmY1R6Ep9VwM3x7DLM0JrMlvGB3Qzpjm6wP0ZGAor
 RnH8yqTb8ywDMxCOtyg==
X-Proofpoint-ORIG-GUID: b_OokbfulaHZoQPeNS16Vd7-BIxPr-DH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MyBTYWx0ZWRfXzbMJlQYZduiD
 WxUPKh2yK2lfyzMc6T9w55Yn6BR1g8T7LyuHx80EKDW7fpzAlY536tZxX3QOfXaEnVz5s1fPUC1
 0vwTCGP/C4Ls6W8v6xyV+m6TaXrdzug=
X-Proofpoint-GUID: b_OokbfulaHZoQPeNS16Vd7-BIxPr-DH
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf316c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=WvK3DE_TvOQGC-msfrYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260043

On 10/23/26 9:28 AM, ShiTou Hong wrote:
> The sm8250-hdk has a QCA6390 WiFi/BT module which hasn't
> been added in the dts file.
> 
> Enable the UART port of BT, add the bluetooth node.
> Add the QCA6390 PMU node.
> Add the wifi node of pcieport0.
> Add the missing regulator node of PM8009 which is used by QCA6390.
> Add the pinctrl of QCA6390 enable pins.

Don't describe the diff, describe the problem

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

[...]

> +	qca6390_pins: qca6390-default-state {
> +		wlan-enable-pins {
> +			pins = "gpio20";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			output-low;

Drop output-foo, the driver will take care of that

> +			bias-pull-up;
> +		};
> +
> +		bt-enable-pins {
> +			pins = "gpio21";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			output-low;

likewise

Konrad
