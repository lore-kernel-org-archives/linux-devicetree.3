Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660537;
	b=Gw8k8nnCv46DCFtG6nXw5N0fzGo2o2ibFynVq4kHt/ELvDgCBUVN9QVsRBQWyU0rrbxh
	 +dbgTbz386jACIRMYTehlfJuaRkfFNXTxSnHWjpkWjuIiu58OFQQYL6d2a2mUlD+CfpMg
	 Z+kmOMJbnlG0nJjRKr6Aun7+AISpkWkbqYpCFpnMoERHgGgcGVli1W0LAiwVfZyrr1vyh
	 0CqGaUG+esnm6eIR3rAVLfyUlh3Dt6+2PmF1mOFFeuAbXEDMToBUxTUtlUqoR55osDxEa
	 FI//fOZSVNbkEXX9zvSgSR1SrqyALNsMV2FXMF4OMvR428agPnRXlpcLlXEBXAExZag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=;
	b=siRq0avuou4NXDTIK70hF4g5oLUeJpN8coHSHecyoA1gGk5c17+FnIhqXWZd//bwiWHS
	 9Mx5YM1lUUrUqn8rMsSUwAT3bMP2LHg6jMXY6B0zMWZhvXSqjju0h7DImyKJ8AQ/RXPmW
	 JirJJD0Us/OTE9HqtoDR4lQZyZ72KZ61HjvoWddPZWURgOgOq5lTbpn7JUVoDWyjhlVIV
	 GimQ9KT259nlL0GUjJcvDz4Iyr70TVJlNDFQoubSDqU0ZN3aUVqvtMGKaIpy1qd1nKcsM
	 XzIxeCBmBarcgP7yfoL3SmrkLfoqR2st2A6B7BUoEJNg69XKCN2OchDY0msYX0Pk8GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQic+qDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyCUDJVG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FBA606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16FBA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQic+qDc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyCUDJVG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708q33517467
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=; b=SQic+qDcVSYCx/+t
	H4gIKSaUSwd5A9iKu66KtqA7hSgYZfs1XePZDC97brugiYunwOlFmceQ/UBeiFr5
	h1o8sFdbOEt1p04wMJDV+p+UJTSpuB4zHV94+gk8Ypjw5l4GGU3aSG6AX06x+Bha
	59lNHVCmJso+Mv760ima5l3Jrz/K3vkO3tEoy4HNdjxqEZHb9UBYRQol6i89Xc7s
	oQB0d+pz0F6ws962Gw1aJ/VewQO+fOvXg5ufDNEUG5/yadOuqpdcpUOa10PmbgUs
	o3pCAlJfAbVShV8snznUPUdwibtUDFqc3RkjDjxgo920JSpuHA3DPpfDe8uTbBJX
	lvfK9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhkyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:15:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3960dca5so49056385a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660534; x=1793265334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=;
        b=gyCUDJVGzTt1DZJsR/OWyvRBaNCp6hV32/AZ+DevdZx7B8yE2A06QaDeoT9kY0mUER
         m+r0qpN80hcpPSZNSdR5N7w71vAuPdrmEh5NiLxwMWTbu9Df3byfpqQIe/i4OlRUsl8o
         sFKBKVIyRjllbsiZXQ4R/Slim1STw1s9O3Xjg/mDGv3cTf0IjgLlnszjJbGuhsTdnGtA
         Pl7g412gZyQA5cMr8cr+IsEeRsFds8wKMbB4emwIsKCOkXomL14quRZenoOAJzewHGg7
         LhN2hLNUgnVQKhRqrrfckQxVqhzGPI+NdEneJJj8j6Gu6QQWRQDJDsV/k+qgVmRG7IGK
         s6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660534; x=1793265334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=;
        b=h/1XMhVhPLpt5xQJhnbN404mnH+nyhEXQup/Z5onlsyPSJAe+41d100quf+sFEmOok
         h275fTZWY45KkXkYK+kIsxwubbQgmxSRZK29IwwoHKwyPd6Rz6sxxPJTQ1JA2q0j74wP
         uQWfjYoiU6nvFBcPcGp3H1sOdo4HayvJ5CnpmDve2bzJB93BQcjvyCe4nLeFX/9RjCK7
         LImYtfZn7IoPM62XYhCx4Bl1j7W5qmtjC38r+6xteVF7KWbn7ljAffQ4OVami8CsooeW
         QOa18o0K+QvrNhOj0hqkD/x8kvqiSaxXYqhYQ7Tc/KETYN3Z6TdTiP0OTKlqQd+hleuo
         YxlA==
X-Forwarded-Encrypted: i=1; AKwUvByL6og6sV7Kf/m2QFCuNbtuI2bwhqWV+dbjZ2Uoj5BTeV8DKrC5jnEN2UXDPpIxTirhsu3v9K8oU08+@vger.kernel.org
X-Gm-Message-State: AFq9FYLiavlDQ29oTS6g+IdPqUp3+mL9jWt3+XOBMPOjHWmttFnr81MT
	MjJ12R9Coaw3noB5CE9EQQgmd4pSkFNIiGvnS0hrp/38sLnHGq2xz/va11f/5ZwkOAZ+/bUVrlL
	iUNUyjmZiBMU6gmL7xpAW5n6I0JLAr5bS5+JKfvJ2S5TEt4WFDfkaUy73jPEaWbXH
X-Gm-Gg: AYBFou0ePVkixV/8uRqgx2PnP2RyNdo0Oow7wjjK3NJr0Jji2o4pgc3I8TbTOb4P2H2
	Hb0YgrsjjE31KnbnG4FHHY8a5L/8YukgsY9Q8DImLuuzDvbCIm5nbYmMBLYCuE7cb8NpHReiYwd
	yayKDJ5z1UAvPlsedZQMydsTn6Ho8fvcE/YGGEiwqZRn2HGi3yF6LPVzmBL3ogs200ry9AlDxvF
	e9BA2Do+8Re665VMb0Rnd/qb5fh9Z3LidCvoTzVBCcPVI7lR4EJ0w4zV4U73hBtvzS26wQZbUdP
	ZB3/ZmBMHDDbDc9BIbIHjVXShcoQkwxMsV4PsrK05KC5wkjJ30oBgAtmrlxlkyCi6BGsXCjILqa
	N/c/VHrYdmfDTAPa4dr7fYw==
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr988228685a.5.1792660534423;
        Thu, 22 Oct 2026 02:15:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr988225985a.5.1792660533992;
        Thu, 22 Oct 2026 02:15:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a6182e8sm82796766b.81.2026.10.22.02.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:33 -0700 (PDT)
Message-ID: <560a1b2b-d7b5-4c7e-871c-f98d06cf088e@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:15:29 +0200
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
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: eliza: Add CQS SoM UFS variant
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
 <20260928-dts-qcom-eliza-add-ufs-variant-v3-4-9a2fdbf6baf2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-4-9a2fdbf6baf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX0cdmaEwOp2jt
 06ERfq51v4NL7GpjsSne82f2+/uwqjS3um/mFxSzSQdvrxM9ZCjDSzH7fXrQpt1Jmm/+45+IvMH
 QNUtwgkhwpitdyIgxQqVzSpn9bIBaCt80ZLtnFYMNrwJHP5e2d9PvtEko+YmjCKHeaimBL7b96L
 exU3ra7Sn9hU6YICO9YqpiSvZ2mnHayFajVfKvqdIQEUErzr+OiJCyvzGhCgPxHs0oZc0Ve2Cnl
 YSCxLhTabllLAcOJI9PWJ/DVOl7Gdx4IU6rfdZ3OFyrktdeAMtsHvp/ixc9UeyfEQ8R0GobDNQY
 qsZAELg19fTZX/kYhttBzFAqD8OzV+avBPTk6i7c3+Kod2T88wYDZZN7stWArXPMP1JxvejqPYW
 C9VPuZoFh4F08QkRwn4lv4bQP3doT6twP9g1PO6KrbMNTPBxyo45yt82RG0QDGo/uP/ngiRVUt3
 X0CM7GnAsH4Huj/eUTQ==
X-Proofpoint-GUID: MfV1GHivu4F1NMWx9gWlXgZzr_lIJPsB
X-Proofpoint-ORIG-GUID: MfV1GHivu4F1NMWx9gWlXgZzr_lIJPsB
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9d437 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w59uCl-My_tAlYnkv8MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXzIyFfItzNGBA
 lXioKpZHC+Viaw+sWY61PaIWMuhmFgUXLYTu3kNgLBSdnAPVJGx/TWgEEHw6OwtiDDhhq9D3Bc/
 PL4fC83muX/3Da+TnNGAwD/xjcQLdzE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 9/28/26 6:36 PM, Abel Vesa wrote:
> The UFS-equipped Eliza CQS SoM is not described by the existing eMMC
> variant. Its storage uses the UFS controller and PHY instead of SDHCI,
> and the vreg_l1d supply needs a 1.14-1.26 V constraint instead of 1.8 V.
> These differences are on the SoM; both variants use the same EVK carrier.
> 
> Describe the UFS controller, PHY supplies and reset GPIO in a dedicated
> SoM include, along with the variant-specific vreg_l1d voltage constraint.
> Include eliza-cqs-som.dtsi for the shared hardware so neither storage
> variant duplicates it or inherits the other's storage configuration.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
