Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009893;
	b=NoLSEMU2t/T0MlaeVFkkZgH4AUFM/knyl+RT/B/NMWTyKt8kOoHeYm+GLwZNh/2kkc8i
	 IkSRZ00qMRfZqKk3VXYmyZ/l5BxAnzzAf9KspgqxcgfJpr0aunslKjqDQ6anDKBSTphV7
	 5QBzkZjat8dxorBma0P/rOsqKp7TAbj5FyIbcQKlOJ43KjP28rDEsncqEkVTWbWC7Puig
	 dg8jPHJc0M4EUS8c5482DskkGUlMwgyYWpOY6+73yOkL+Eu6QEgZ3KDa80ZhWBrm/o+e9
	 Dx0GRyweO4zAx2PpEQv5ypy4dG1eMJmz7bSSRXltJpXfpslOwGV9/IakfIO6ltrpZ4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=;
	b=u3jt+dcFmOdfjY991PW0eWupiGjVgxXwnInUss8nOMldLa18hrUFLAgHGDhdbGdT766G
	 wzlNchn5jsOgIqIsisdt1aVS2XaKdPyG8l/PAFTnAsl3wCcc4/u+br7VKa09NTTd0pjn4
	 q2Wa0E9O+fqTn/EXEE7Z6pew2gqHPyquYY1OBejmWo4UBfnDD0kqI5FCq4hD0MaXiz/yU
	 zCqlkTQKFSI19TooOCV2lak32efryTHG1r9yw84Z98VNFZJqT3bGoiNzDpb1I+xPz3Khu
	 D6RskT2RxOLn5K67ZKxq0ge4OSCToP0dtG1j+EJGPezAavrpUTSgznEClF4H/957B/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPPxRNat;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b5Nd5Ctt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C160A260B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792C160A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPPxRNat;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b5Nd5Ctt
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b2HC2206271
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=; b=VPPxRNatdmsu/dNH
	lTUkUvHVX4UCJo1YoQi27WjjVDcUbpcUXACUhnctZT6VunyYiEDbysCZCR8ARfM1
	WuC4DoKBg+91OZ8+E7fY5ymRTAwA9557UZlMc5fBfhTKDIRpfXilN/51A8jQhezN
	yX5M3GhnsaHxAe1gpCVLVpp2O9mHkC9FzK0fxL3fjJ18p9COjtiS1p+dSQU/C+ce
	/ZOZjxOqiBh4olOOOoQhqYLn8bEvDukKgLWUfO//77YZDoSkxvO+pZ51SUoi1hZF
	IZHy7MQe/3tJQa2huoe0gJdttb0R2dgm99+iwf49hoLeNrPGlv38hciKm5lmf6d0
	CGt+IQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunw6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:18:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536708d1a3eso12041511cf.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009891; x=1793614691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=;
        b=b5Nd5Ctt21m9HyPBR1rCiVnyy5PBDlG24z9Ft/UOFYGu4GjIBQeOrUtNC/UDTJD21P
         94dUzw7Y6X0ocv5YTds7mdMF51vqRuVJ7UtUemUxs02W1YeoCf/rviQKA/D4OreRPorW
         8+1fNnG+EyfphXOlFDrDD9GsytQpKEvBO9RrTi3hGUzRmQA23viIWlnzmu4GxoNuBIZd
         X0ck3qH+PRwP5+vLEsBS0JcPTt1QWtABW8xRsbo4P0u233J5aakdlOjb+4ltRwVBfyQy
         eJC7GeRtneaU9DBEXqPUhQKiPcB1VXVjqvhtQ/YRlkblL3JnW01xBHuI6W/urmmsV1lv
         ss4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009891; x=1793614691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R5Zo4yAfimR6LnVWpq1lFnDn9+4WkdPOhsqjK8hrsA=;
        b=nz0a5BnhYM3kR/k3xSRFvTMdFpoqaGxSH17gZM32L/aaDnKnlpFUyIUr5p+zO0cuj6
         u15iatV+j3lIaixPKM004KyabtPh3RCe9wEbkb62MTXGj1ktCtbKhLF8k+emuBW0zF1D
         pnejL5xCS3+dnvgnUPbKRmsZV6zMJ4vJfCzXXk0wO8GYmgWU3JsY1gEizn7+STsPHcFA
         xTNwxadPdOD2hLMvYGz3EHKmo/3WQf/mdOkMm/AhX5io3/vhGJu4jEPzqhEhSWa5jh2h
         ekty+XWN2iM05tFwVZGhDc0MArnL2iYmtpRL93XNgUgf0RQEzLA2sGwgbDYOx6hPzn3Q
         3IKA==
X-Forwarded-Encrypted: i=1; AKwUvBzx+CujIebEgg5pLsTaTJishzueW3T/1tirjJeRLqq0ucjS6nQBhehMJJNDASIxdD6KpN8ZiadYgBmz@vger.kernel.org
X-Gm-Message-State: AFq9FYI4LY8IloUPwEaj3qinUjpWSHfNCiRNqc2R7mmjJeveDi+ODlHJ
	lEqO9FhXchPDEeWTuOvYGXuCLsqY3pYZvswx3I9zhYEnqwwVwiiMBbPdOfy8eIMR6FJsvvcLKDB
	/6zbdI0PaNGcRnmlJgjvnjzScgUpk80saslrNR14Nff2E8Myd+1+X3AT4ZX1IwpkF
X-Gm-Gg: AYBFou2uO3IEqMb5MEDwAOGB0Qmwva6pMUDApfPOiCnagJymOE+atkEUp2JOf6KpBRJ
	KRR/iiZJriG1c9dqUWUKlolXsfwCFTgtZ7Kh1zS0QqOjh18Bpo26q4ZTLvoXnq4AmU20IWqp/K9
	EjXo8t9i5qTakHPctNfLOdM16xK+c58Sx0PEVSOBz/bo5GU6Qw5jF66xiThD9bEpQ8FKogHUTKX
	Ql5NEqBhbIj8xZxHk9TZl0/TcksIep6hHDhP1dINzcX7d2k+gKvL32IUiAEqOauNGE2OySzWzXX
	+2jFeq4DCh6/BR7W832/SoZXWClOFYvOGaMNkfMikxGBcBirBt5PhaFTckSB8yqsKoGxxuBDbni
	n+gkqz8Z6+hPEao7oT3N+TA==
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr685923185a.5.1793009890698;
        Mon, 26 Oct 2026 03:18:10 -0700 (PDT)
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr685919985a.5.1793009890199;
        Mon, 26 Oct 2026 03:18:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd350a61sm301851866b.12.2026.10.26.03.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:18:09 -0700 (PDT)
Message-ID: <4e7c426b-f3c1-433c-9d9d-45fad28aa5e8@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:18:07 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sm6115: Correct cluster idle
 state parameters
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792840208.git.me@michaelmcallister.org>
 <b73aaefa59c2aa795af8e1c4ab117b0857b332b0.1792840208.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b73aaefa59c2aa795af8e1c4ab117b0857b332b0.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX948/fRGCzhgS
 47jDjFa5b8BHKjjH341dSDfYcQfk7dVQqxujsVtEVP8y/B0tSeDS6X7f+Z4J9uc4yjknyaGSBRE
 jJ4sTDesV+g9HIDz4BfyIgCBFLaYt71xO0he66NyTlFLV6acPnzuNlkY+QpKe7t3H12fsdem8dh
 Bk5s/+BHC2OoxRQxWLMYykehUtjwb6bvSMRwloxOihSXqE2StbtKWypc1ZSy3uS7jkfJ5OPvjx0
 NL85zNf9ml/EIBn1HOMuZv3Ul1OXBuPtoOpgM5U8lrZJBZP4lgWoukQ4lgMeytH5peG5Q29FmC9
 4pcAjKEsYTQnHC3jzoWmVE1GB47pL5oPWQIg06bq9pGT2L6ywc9yRIQVADkfQqpksVpsVIdxJY2
 Rz8jbrTfoM2ogLYabBJOlorKlF8RZcFqXotjsoBroJ73iqBerIcOfciRsQLDqiyUQHbKMy/960y
 x4RTFaQKOl0IzQKPoFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX81clXwDsF4Kt
 M4X7YCa+W+Q9sNJK0aPcgwJTSejxYEs5qNYQGTrtoy7oeIn++v2/r/yHzcePq5i2h14+DTpk6Q8
 4Cn/qOqHB1ZfWTJEFM1fgxV+7sRdRYo=
X-Proofpoint-ORIG-GUID: U3H1QzZk4uKdpHkHZKwjSiw64kyhxB-t
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf28e3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sim_hGIB01VkqWS-gC8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: U3H1QzZk4uKdpHkHZKwjSiw64kyhxB-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260040

On 10/24/26 1:10 PM, Michael McAllister wrote:
> The cluster state IDs encode unsupported CPU modes: the GDHS entries
> request CPU mode 2 and the power-collapse entries request CPU mode 4.
> The CPU power-collapse state is mode 3, as already used by the CPU
> idle-state nodes. The GDHS entries also omit the cluster affinity level,
> and cluster 1 requests cluster power collapse instead of GDHS.
> 
> The downstream Bengal power description [1] defines CPU power collapse
> as mode 3, cluster GDHS as mode 2 and cluster power collapse as mode 4,
> with cluster mode shifted by four bits. Its idle driver [2] combines
> these with bit 30 for CPU reset and bits 25:24 for the affinity level.
> For either cluster this yields 0x41000023 for GDHS and 0x41000043 for
> power collapse. The Motorola SM4250 tree uses the same power description,
> byte-for-byte, as the Xiaomi SM6115 release cited here.
> 
> Correct the shared states to match this interface. This replaces the
> board-specific overrides used by the Motorola Moto G10. Runtime testing
> is limited to that device; the downstream sources provide the common
> SM6115/SM4250 encoding evidence.

This paragraph needs to go. It's a conclusion of your LLM's local
work and doesn't make sense in the upstream git history

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
