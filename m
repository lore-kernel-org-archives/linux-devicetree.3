Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204C03F7E92
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355774; cv=none; b=O4Fv6g8qHbFLiszUeGobVRaqroEWCyAosKijQzER9RH2qPNKLnhxoL4DjgNaDTQyPF6yR9IHU3ZCdjOGyvdZGEtMrGncpvmeJ4iZUHzeUC1RqSEnTWhyA+coD6voG/0aoUIZnFTn6O8ROyfqAM6ba503px7gxfgOsN0denZ8klI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355774; c=relaxed/simple;
	bh=ye9LlQ659YClM/e+RtKML3/FgS7NUsGw5Fqp99hnm1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bax2S8sPe5qNk2+hq7fTw7cfpwXXHK3hpISTEGMo3G8yp5I4aDD1b0Z0sCYbI7LFxkcjKJq7cYjDQStiEjBMZ5fndgZzAf9Sslul9tWxNFgEnSlc3xFdk/+cEQ8G9ZlKkfwOxYyC8E+IZVdg6ezkJNUdgVX2w4STQ9b+c2HQzsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqEc/gu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pju0Adec; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqEc/gu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pju0Adec"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC6Qa6409202
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Foefc7NLncsQsULtFdVyI52wAX5lZLxzE1pYWlbO84=; b=gqEc/gu3+V0ezOnC
	O7fMSZQ2TkDn3BVrVMKPdTr5LYN87oxKdgNHv+yS1BoP/AS/2np58Z1GieRcFpXK
	sl32LY7ECQL7tHMgCtYR9lvqFtOSym0is4Qa5T/sYH6M9Zfh68RB5xIpGMmwI558
	c8HzIMpfJhlzza8RccsbiRLVV5jYnS68hky3vc2pePTB3Q+O0sIWRNRy/l4Vp3ZH
	sNZusvBrCtzqrJmpTx5d5fMZlDdR9u6Qu0ikK5+FqgLrQU8FPm36dKHUDgR/2u4h
	V/cTRHICUwcDwswxmhEq0+fSJ7GPQW7wqJPesFGVEqkc5DmqNSzIeFLgIVDvz8Z3
	WLq1qA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexsbfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:36:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c49436edeso44155376d6.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774355771; x=1774960571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Foefc7NLncsQsULtFdVyI52wAX5lZLxzE1pYWlbO84=;
        b=Pju0Adec++S29Fi/xoh70mCXwEB7jnTuEKD/SaeW02Sm75RLQZyon3SFnkRIGkeet1
         J8cnXwxaE2k7nGyrvi0Fi6krzGayYtj3ClnwjAzPtIS0HUVxigt63M8UK0qmluTE7PmQ
         UofcKAvZ4nMBHtxwTAW0OY7jLgUbZWTDCuB844x+CDyJUaSvafCTGX+DfdPGlj+zVmnZ
         HZXLgL2yyoww03sRv1DBuVLa6aFZpxfUfEZOQLo1PTOnhXUGf3YprIu+jG3ksz0iKJuP
         1TDpQRcDJFlZDkZGkmWVtQmw01xcHmP2BkSslcxjJf/y5Hmahn25ytM7DIePoFnu061j
         odvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355771; x=1774960571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Foefc7NLncsQsULtFdVyI52wAX5lZLxzE1pYWlbO84=;
        b=I8NPBFssgWqVPW2uBeJnOirnIPsejIPZ1dCCgDPWxGNpaOpU3TTvhw8AvamKQctJcb
         Tm5ET2mcGKmdthniKT3sWS5tPps5vc7sictjT5YyoHR9VP/Ql+AdQ8KYqdaAmkosmqX8
         6Om2MzPNahl/CWigriH2bOynteunfCczoXWXjqxilBf2E6kOo5tjR0zJ5enR2vI+YII7
         TltA/LoZ9LEBFBJhBgAAFwZFv41ZpR2lr2kBJk4JNV5NQVc9ELL8KxVM655xBkYGW7BF
         mvacYeSfebapcqynQNOxu4Q4708s9PlB646Dgvho+gJ0IAzS0+/xbisI3U+vaO6MKdP1
         pNdA==
X-Forwarded-Encrypted: i=1; AJvYcCV+lmSoX+gKv9pIkSQtcgw0OT1I+m0jHfwa5ry1mF/Fh7W/Lq+qqkilCl6pCqv/V+yt4DPx7GdLTK0s@vger.kernel.org
X-Gm-Message-State: AOJu0YxCNvGhk4/ed5o4QVdC4LDdeF4JmKl+uU3YldDhawcii7UClmyk
	ycBiozabOOmmHjqt6rIhB0O1L0uV1mp+I3Cy7iMOLdrsmVUCdbcCZKB8mJkSHokD8CYrGfHUjTn
	O3JkaDBLpBx3OUjMzXhQ9KchXlKyu8CguCJsa21ebGS2du6pV/BHd3vqhwFjleThS
X-Gm-Gg: ATEYQzzTRW9L59LsOQ85A2GUVvhMIdJRGdI4y2219s45FsYnndAtBuqRmoN2Zu0YK/j
	iE70DW+n2c+88qje93+QDOQX0pTGi9PC6lPleJXyVo0Ggb1tqU6kB6nFxGFYn+9YrSWJU4r/1iz
	PzFSucT/AMnr/JWl1vP2SRd2VAsTae2Noijip0Fm4xet2CmgONikhEywYYvTCntAo5hpSN5ZVUi
	seJvoAZzixN5+TBE7xln5HMvhZuM2JidqtFsZglYp2I9nKNeVv4QtOnOXd3KKWdR/A6PaL6zjYu
	8Kpt2QWF6QUm+sZAo6V8oe20h5VDr/CYftUiaJcu53V6tyT9o/ptbc3bnGtw/IxtWwjIh2MqGe3
	ab7o4XqO7m3Mr0CpVqWqAEQrwJEBFe2rQPRsF8MM6PXx+yMzAo8d39hsAaUgiJ7Ic2nem1HxH1L
	scE8M=
X-Received: by 2002:a05:6214:268b:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-89c858ff291mr186891736d6.0.1774355771294;
        Tue, 24 Mar 2026 05:36:11 -0700 (PDT)
X-Received: by 2002:a05:6214:268b:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-89c858ff291mr186891256d6.0.1774355770680;
        Tue, 24 Mar 2026 05:36:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832fdcd36sm605400366b.28.2026.03.24.05.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:36:09 -0700 (PDT)
Message-ID: <c402afa3-1eae-489d-8358-fbf4f9a80818@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 13:36:07 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add AYN Odin 2 Mini
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-4-33a8ac3d53fa@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-4-33a8ac3d53fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMCBTYWx0ZWRfXxByCbSbQY+yX
 u585cGZz3D2VaK4JNVWfO0OEh9W/lPM3EApZ1gFE7uoFI8OXHhgnighUGtF87WACMILu+qkkDyg
 Yqt292TDlr975lxjk8KwREYvKS4b2bgZU6s50sMcsHRA0lWhLr5apWVWtYTYgYEXdnTLoGtpryw
 WvowQmexUY4paUwSAhs0eLh6Mg22Ojdd4Gs0po8PGRKoHkguCxR9cIdIzfix3aeXIpgMXRLVGRu
 oAm8mRCdHCX8qgZ3s79j/5c+sdweRizcym8IAhFle1U/+gzgI3tbT23D3TdpKD6PdiR8+yMAUe/
 X0Iizx3H0uepvP1gU1H8ocJXgldUg6bQyfiB1ZpWGsMssFkB4vQ4TZAAvngbCW3xSDodakUMvS+
 1N6NnXBdnF4MyAdPk+aeauzV3/pC36jrx9GkO0dAn1OCS40P9RoMkqlbVkgM/3JP8oCvkUbP+Z+
 yALcIHR/fRzDKc7hT1A==
X-Proofpoint-GUID: GdVBN6E7Hf5edxqn_ByKWySjZHgJ0FWJ
X-Proofpoint-ORIG-GUID: GdVBN6E7Hf5edxqn_ByKWySjZHgJ0FWJ
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c2853c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SQODTQQMv2b0s7nSLyQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240100

On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Odin 2 Mini is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5-inch mini-led touchscreen.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
