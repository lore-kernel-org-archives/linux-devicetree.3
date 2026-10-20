Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498379;
	b=teF0T5zLvAtSUYPY3zhZdZICt0PamZE3OHdvPgm/jzv5pYF3OjrSR8zawcIIf5UCxUCj
	 raKw1o1Y45EuwxCoCYiNzFPVX6FR/SSmxWCNaeMfO3l7YRnMdiPwPPkiDGmIK5QLqP0oy
	 0faPjvPkhKDdFidaJCYuI//wsKSZ8vlNihKpOw2WbuQEkFQOjRzM7waCag0oJEWXve1Oe
	 QaOOJb6aefSHWSc8Ji4oMvahet1vpLyGeGXAHqtcFQW1Wv1cGu7c0EU7aRULiUCbFrai/
	 69EqcdJ5mAhhotqkAu9CKIsZROsyIfW2ZebNrXqUBX16n9z83GYFtZ1sBrVarCFUYbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=;
	b=SiFgct1sh06q4jarr/9Kum2W52lDJ/+LJTdOqGc/gI7v0J1mJ7kiN9ERmHngAlVl0b2J
	 roLM6gNUyiExHo8PsvIpPdkfREciQQA1inP4pivSY6uasg2EhuSdq+s/4016lKpMrZPD9
	 cQ5m9nF85nlW0OTkGIoB5Iz/ePjM2GUsrbMvtnekJtmsZ0uXqGu2soJ+f0TA+POzZvxu2
	 BrP+1WMNlD7bgVC2Dg6SgoBUsuw+RLDto1Uw7lcYnOFHlWOBlumSWAaYlUl1+cL8GiFgq
	 xPc6wzRVkpcy+FM5qb1+E3HATl1UhP+C+FWyyKauF1dSJqJxaFrbpnjttkZH5jvBm7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C33PJyFX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8yEIXMe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D816E606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D816E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C33PJyFX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8yEIXMe
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBXjWp2089699
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=; b=C33PJyFXKdK1FMZt
	cvgY4I0KNuM3qVkNNxWXg/gEEHdDO4Yr13qMn7p4LfYEQKfLQ03XqvjFnlc1htNR
	zjEbmYlK6kwlx/5nOtquzjvPtp6YR+O8ulYAB+V+UaTK0NLrQ2U3rI0wgDuls8aS
	UyFxcm8RO+hxwDy4Q4gELwfjzS6BknjAsJ+wq3KZqGwMHz1f7rpALSjoUMzbtf38
	hSO3IfWGWpqQE8rGmCev3ZeV++j5U1Ca50+wS+J5AR55FnxbAOLaw1A+29LYsNbf
	sG8wRUHs2CUe0Aj51KLhINdt+LST1sVL4gdwWeEA7Jc1VUkRg2QICEgIVuGhO55+
	yetTig==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjd8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:12:56 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf97f74492so103718137.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498376; x=1793103176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=;
        b=J8yEIXMeUleKzjnM5hqbQRlXENC43WTKbwDqArQ8gs5Oya0gXcm/pXx3IpfWPuYzUX
         ULFfdTvY1b3Wa0w6H8l7jDEZJg8alrCMJCajW93sgUYjXDOcvhw+VVtJWpLdgBWPVzWT
         4jv+q8gLMuw5imjeF+7MxJpu7oTeUhQLQTBps0TPbq6UeUuQ1f/pLpAv2SL2k8XbjRuF
         zbtocQTKKCjj4WEhobd/+m74Cg6KQlhm1nuQgT/bd2xhVd1/pq0PYW6RXyB1RgYh5rG5
         l52++vFXD+rC0JUI+6ftabZahJS3wT+ybnyIJ+iOxwzEZqIjtg8kh4f6L6FsiX2I5eMX
         Tthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498376; x=1793103176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=;
        b=qydQLKPVtairYkAL77+kMIUfJcPytSdHE02oZtYDsu+X0HFJH3mvSEeHBstAgmEwUH
         rZWQDNYkn04J3sB4Ylzrxo3SKzHE1D5l5Mo3vnCp5xGBKlR9sV4ZRZ5+MrorvVvs5v+r
         7AAuKXZ7nTN5ipiHuaW68raE+kHvUdg79babDTMsW3daCVP/XFAFRJd1o1W222CRgIQ4
         XiqGuNOgyMCnNC3yuF8O6US45zNOdvjYjGjq/9jRmHcmcp738uqE8LDtXbv2MUxzFtOB
         TwU8mhtxYztz8m4D8GbgMhJQEivhrfe5a4jI5TNLcwvmT2F00X4L1izZ8CmzEUF1vKT3
         4byQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyI8HlpoPj8le7Ri/Owh7mg0P6H2PbXIgCKyj18Iu2ACyJQQC80V/zcyu1/vJVD2WG0TNjFnU/fYFi@vger.kernel.org
X-Gm-Message-State: AFq9FYKn4au2agrmp8lPJEH5Xak8jsBhRdO/BrM9n5Syn0G6qkcaLkWY
	B/u6fs3cU+6UuT0V/8p/6E5SP6C9fsAot4q2DaY39bM/rUoR7CalcETu+P6LTsA7ZDEZjFjMM4X
	VzNe+KyPbOJi4p2Bmbgq5lYUW6zb2qZ4DhFRN7KmodFL0OL6E9oYtbs6nE/wI2pDF
X-Gm-Gg: AYBFou2ZlKzgOhDLDuXsbNeXEgqY96H1s1ZtdqlzrCUULCyqv4eGdTm4qHyW7YD2eLD
	tYoopGUYo1ypdpHmNInjd2zlsTF87dFEPS03sRbypvHChEKkH4e74Syja4cnGYqPXyV9HS/qykK
	rjOZPZIgPTr43rY9+tfJ8XE96KGnpWC/LizLn+5Glg2EjJd5t6UOfb14yy4VAdCnqFKhSJtWI7m
	Rx8mHOV3v4my/NW57TrAVy6Pgb64WtYwQV2mrQW5sYjc5LjGOdJpBPrVUWaDZNYTk1gHCLnj3LI
	WaBRRi5ZCSxYUr+KPAXZtU3W5aIjYSViGWij6wGwPjISG2Okz3g9nM0JFU81i+13JjwMVxY3Gz5
	q4FFezQiTACfXR7fdKuDzxQ==
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr2105931137.3.1792498376137;
        Tue, 20 Oct 2026 05:12:56 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr2105918137.3.1792498375619;
        Tue, 20 Oct 2026 05:12:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9db0sm5256665a12.33.2026.10.20.05.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:12:54 -0700 (PDT)
Message-ID: <c600cc5c-40cc-4640-b032-a87dcec284f1@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:12:51 +0200
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
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: lemans: Move platform resources
 into lemans-embedded.dtsi
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad75ac8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bWZ10KAKr9BnBMAnnq0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 0Q6zXVO0elpM7ZtoDp90HP9cG6_8qGqq
X-Proofpoint-GUID: 0Q6zXVO0elpM7ZtoDp90HP9cG6_8qGqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX4KpmNYCf4k1Y
 hIRY1VzQfKh/G0hCSyz+QNsA0ROeMSOZpTX40pG7gTVYpPamybq0SfzZ4kXFwIITJxMmORPUwCE
 SJyLS5/p+380Wy2q/2NbCQB7PNMcuimp+wWPPhp54d5xngYqgRLOvkidLX1qNr7WVvCA7xFQLXm
 k+Zb7b+Ce4kv66qUKU2X/9J/osz4jdRFfrciAQtTV/33No4hG8uwgeMgBWn+0TmcYLW60eOuY+U
 JEA2WfkTDCCNivESkjCuH7lwyh3CqrooHmtoKhS8AhPFNsFRkZiSF1mYJYMp/n7Ndosw+us2iJK
 nDXXmVYWEMeIxEN6URUid5O/dZS3RLynHg6eiI6/STesZ4Nw9vmHI6c1U3oZBbGsJdAdihhosEE
 dKGh5wwxgXmUABitIGMipwgQP6FKq5SX9G9x7/mfZ/eQoMBRPTB01UfY64qv7wXNn73SFkxlzzQ
 sGma2sYfBXyNxU49uvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX12xS3lPbrWTn
 CQtC9KJ6WHWegwjl7V1wA5wGLDrMYDioRKv/ePdVkXmFV2+57/SU0zucMcOkK2icNMzgV+JF6nT
 lYjjGvA6lUGRMLMRjbrE1mEv/pybbKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Devicetree lemans-embedded.dtsi was created for Lemans Embedded variant
> where platform resource like clocks, regulator, interconnects, pinctrls
> and PHYs are managed by Linux. Move them from lemans.dtsi to
> lemans-embedded.dtsi, so that lemans.dtsi could be used by GearVM
> variant.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
