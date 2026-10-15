Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053D84A1E06
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048488; cv=none; b=OWoIQdIx2sVG4UymVUfPhh+Bn2fwi/zEVuYnj3KZoD92uPbobU/Pu1oagURGCkCnB0mrex7oFsdivMbqEZIdK9jt4DTbtdkkHmA8eTlcShNzjmmKuzF5TY1yrgRvAPo6SnNOKRY4Bs4uwxQ4/bClqN1myMXiz4Za1PSQSp7k5w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048488; c=relaxed/simple;
	bh=emkzokqcHGoSiNdf7/IR9GL/48zbZC4tKViItldNSFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCKbidI1wJr1VP/BKM2FU14rBimVptKt9AIIeETXWtZjVghSedMpO6gqehpQTQMqGPSl/hUSz19wJKcoJMihI+pCACXlAGVJDcOXyhzoBJ7epmAmCkFxmutUGG/dblRJfgQOmZy2E5G09tNG+93ZputrurYHKP2HFpWq8y32FKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HlN/egU/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6GcvJYp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlN/egU/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6GcvJYp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6w7tI2121427
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoScrv3WBuf5zalDmn8KP0h1kd8vXuQSoJFP/Cj3PYM=; b=HlN/egU/oUVq9xjv
	418nceLeDOEW5d0Sc/J40XwY0zVm0rtwt34JXdDJPw9Y+poJuMMWaMqY4fJt9Bz3
	/vG7RJjDjUGp3dUHBT0ZbTLVqD/D+/XPihQeoRPf1f6t4dhKcsUEMaBVDvEUBjH6
	DpvlYbFtEcjD192kykEzXtja/tIG6Th4ffzvJRab3lKcfVvKt8iRqdZqpaMyyiNC
	c4/WmqNfC04Oa2mu/5v0cK2nvceuODvBlG0KPopycLW/iIKyn14JKcqd/iWO6qHB
	kOwhIuV3FGGmYYLc8e18EPGJ+2o3UhSrBj8qF+tAriA6QTsx+q68lFsfDcmJPEGy
	3qcyCQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1d4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso7895380eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048478; x=1792653278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoScrv3WBuf5zalDmn8KP0h1kd8vXuQSoJFP/Cj3PYM=;
        b=c6GcvJYpeETNrLkooEn1R34QJDAy/sORjSccB4ayPBLPDgAfnDV8XbMXnvFk/h3mxq
         IBLjzecaptaJVgP2slf+5J5JZ+35ZR6jmp3uhjmPsSVBp/S9uMDkJGNt7b4Uh7pUe6Hp
         RrrRyivl4YTHLeOsbiX1XJq7ureOJdPtcbEGc5lR70erLEJ+qcBemO1CGvFWcfKrlBeo
         G1CQ23EdeEbIJS8Rphpo9argyEUxWWU5ca9CFhxJ98oH5DNMtrFGyYbcHHD49KVmV4dt
         iJUtpbjzAdTQkfJebxoJo6puv9yKjTuvQnkIP3gGX29MW219hfUF6s/xqzXHzZpPaVex
         Ya1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048478; x=1792653278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoScrv3WBuf5zalDmn8KP0h1kd8vXuQSoJFP/Cj3PYM=;
        b=mPC6KvASMyxje6A+M95zjOW4gKSlHrqnhfCFr8Vo2l3UP6VoABlNmXOTj2VqS4XYi6
         DcY/aTbhLjFawOorW+eim0582ruSOs/pKZxBntpPkT6GtTda4bPVaARgOq3aZ9TWS8E1
         xnTvEyoF+nqkK+JKUXQdYtHQ4tp0OkyaNaLN/0aVd/zDNPzgD86aHvvPABSrLYcxSRMl
         Tiv/UAZqceGeew1WGErdK7Zc7uSaQksIS4MTPQhE7ttKbPj+4DahZqK554nZWUFVtLNz
         pT7mbzX0Wgn71QgTcq9bJ6PzyliwmeEA+JzEHEmLyaKR2pLk9agYFLSmyyk3iThoApOi
         pg/g==
X-Forwarded-Encrypted: i=1; AKwUvByz3yRyvRhOxUmqwzyjlxQ2LeDaAC5WUhB3b5PC6n/jBB+BmDpmtJyLgKeiV1kDrS2V9to33LRWyIIT@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ/LcQiP6oVeMy2tqsE1Aumgmw/3RpvbhdgGlcGV5PTs62H2CH
	b55h22tvTwBwGN3zICEHheCt6QTbaa2vrnFXeCE0aWhmGyyDwCWgzXOnOD6KFxuFI4PI+0F7MWk
	QtZ7UbxKH8R+P3wWHs38dZ6ujeqg2Mqlkdux71nqW07kAVNYMBqKtaP6J5kUkWAxm
X-Gm-Gg: AYBFou0jdKX6MYyK1G6iRfEsvj+buCP9uLH/+LBP4z3WYNL4eiwdVy92OlJHNO8nFjS
	cCwQPMsigrLp7a6sdQM+8gNPepoPgBwFqO7vj4aJhrYTW8pMZVGNCeus/711Dt2moU0XxZOqLNG
	9tenEuFvcizNw0ypsqp6g9yIy6O92wpMqChhprUYVPTOis/fz7YH7HN3eOg1pYJ+CkPL/wA9RSr
	CwODXLo73JS+flsvajiA2n0/LpI5jdUY0Rbv4m7JsHffwxeq1VpftIAlFEcBkggxDCb6PR5ESZ5
	ZtVH0CghvTVgTwfoDy/ZnHP9dfbsdW+3KZJ0qtwGwdASy687BQxvuhQf/g3XGrMgHAMwfAgZd8l
	nG9wKoxlcP9lwz09WFrydLanYPs8=
X-Received: by 2002:a05:7301:fc08:b0:351:4d2d:af26 with SMTP id 5a478bee46e88-3537ddd6633mr23170013eec.2.1792048477872;
        Thu, 15 Oct 2026 00:14:37 -0700 (PDT)
X-Received: by 2002:a05:7301:fc08:b0:351:4d2d:af26 with SMTP id 5a478bee46e88-3537ddd6633mr23169964eec.2.1792048477221;
        Thu, 15 Oct 2026 00:14:37 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm14059954eec.25.2026.10.15.00.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:14:36 -0700 (PDT)
Message-ID: <57eac8a5-9963-456a-916d-3c997acd15d7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node
 for SA8775P and QCS8300
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
 <DJ3HSJ8UK5MN.3FWLDU8CG2J2R@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <DJ3HSJ8UK5MN.3FWLDU8CG2J2R@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX1XOuwfUjHkvy
 7r8p8XS0NnM9Ne55MSfNz7mCE4zFhgdHIQwHOGr7pKMpzhLx0EF6et/1OD9fHzJxlULcU+dlGpv
 l+nxn5GLl0Z9/ZrioZJsdpkX1IqmJTo3EnV3SgAvjes1OvKkugADhVjmgT3QUOJvfWztWwqBxH8
 erTUhgW02t2pbOL4g98wWtOC0e1XZ8elBcTmxkS4Lcd6Vx8hKbkWW2Ky5YmUlZ7Iv7GLsUNM5z4
 0VRp1wSK1DHMheA4MYQicV77/svktoj0Er5+b1DgXzZ3oOXiCAhKnxWLiYUebN9eUVj35+U/GXE
 ky1knP4kU1bP78s6njaIXpVT0zJrnm9E99D4le6NTmkquTRwB5Tga9mTjgRy2GyUpJskw71tbJ/
 fmgXCxarC7Gcqs0pIJFwHw4b45PkVy1j36WBNXaTjacOJ5lS/we7IM5Qy4Wd1DKvCxzxaQSH8g1
 2YtQG3umlAtsjw4P1mg==
X-Proofpoint-GUID: R3T4La-jB3Wkpi6BDF3tHje5xhzmJHIu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX0zBGXcooNhgQ
 DX58g22+CBfkWPbA3vPps/iG8oDZa7mrc6Lwr8/Mgatck6TbCzjSoVUER5kBYpZmnv95mYh+aWz
 zD2y6zkMKvh/k5frhVqzCtxJOfvHvJA=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad07d5e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=yyOccef8O3uynvDP9xEA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: R3T4La-jB3Wkpi6BDF3tHje5xhzmJHIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150028



On 6/8/2026 1:03 PM, Luca Weiss wrote:
>> Add the GP M/N divider clock controller node at 0x088d3000 to the
>> SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.
> forgot this in the previous email, another kodiak==sc7280
> 

Yeah I missed the name.

-- 
Thanks,
Taniya Das

