Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE62742E01F
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380189; cv=none; b=ImxN/NOs2NLL65Afn8xu+oy2BBKobn9BmkF98XUoXLGMhjI12vcO8w5ACE8BpJd9QvYQBR+J1HHJnqSsbqoKd1aT8lQgERHFL7IXOzzXpBZhz/0fM6pHlXUxcwhSAjFqlcE0eouKvT2/oV/JPzAp+BuGq3CsFciG4nuvpGXjqD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380189; c=relaxed/simple;
	bh=QhYxX+hsAoh+IytWxE2GOVHTh+c7B4jw3R4+HSXbbAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ylav1CA3tpVlX7G2EHj5G1sKN+KqsI8IWCzEFubMa85sTsEbQFKbe3o3NW3qfpLK0XdCNq8FC+eq+cH9QkifHIEz2BvRX3U5YiP2WDFQbSzZKCJZMQuf31F2Ruk9Y3wvH5ptf8nYyBTqdYW9i7P92Pqx3wFNo/OrOQ1v/srD+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EK6vnmMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2fgnxl5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EK6vnmMF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2fgnxl5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAhQ5j818926
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9bXkVOl5qRuRv39RpxiZQpZ5CLj/sf/FMrv2RxS5Is=; b=EK6vnmMFksH8J8s4
	LNIUaY4sNNYT7d3A7uzttMcfKhYv4iIXLaXBD1gTLEJE7+KnQgfTQkxIXFq/PdNU
	61ZbHMi1dzlP5FCRdRCVGh/BBpGfSkC87XqIOZpHafZHyCCeBlkV0EJs7vaKHkvR
	LlYBGSbd3f42wdNTsxigbivooKmN3S6+CmgP4/zzWtSJkf7LBpOCmKujwjuvy3IO
	ZwjW0wnZSFOne0nedHEQvjjGuoCEzkJOuG3Jw8YdioF29TL+jciuP2B5iecbZFJr
	YMrd+SVIKjhmOe/fzS2OB8Ki0TY3BKJhNQ3EPmwN6BUWQLqRjWTWjQftpFSwMS0a
	WoJFyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtud20d78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:42:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb04e1b499so113364185a.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777380179; x=1777984979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9bXkVOl5qRuRv39RpxiZQpZ5CLj/sf/FMrv2RxS5Is=;
        b=E2fgnxl5TpK6BFQ8S/6Kw1x8b/uc5jVXU9nSBTkgk+kCmQqoJ1+AxRd6nn6KPVYQGe
         IjDT7K889G2XtNnOIerIm8srYpYFdeZii1fDMVkHWs+7BEcDwPVA3DC8d3u/PDtJ2mL/
         qJqsEEMtDDYPWADZzPRIOzIHi+2jUfTucjMWiX2cgUmJRu9DHdI2jThMFVxAtYPyoEsK
         fTQBoQaMivCly/Cb4N4TT96Dc08GN3UDDQXXjsz31UplMtfwg9DpMRogVjSRSDsO5H/K
         37aRTQcKVSe9goHsuFBmATdfGx/63o2R3VKc7R7oHN1tNJ5lBUzI+5UQl+YWiFJLbvAt
         +LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380179; x=1777984979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9bXkVOl5qRuRv39RpxiZQpZ5CLj/sf/FMrv2RxS5Is=;
        b=UjrUOq6FK0d+ynNXadJ11BkyKiWFSgGfzIvkhFgVrJrFqqgU8rvCZfMBnS04pUfJ9A
         Gg9/bfz29qto8HVHgvfG+7hX7DddZ3BpnOL4SzROvn24dPMUs81Am7lkD0nUSa1S5pXM
         jZZSlPmfqS0WJiYgG2iJdWvURb9XZWBeNvtFhBar3y1Ucb/zK2DxfqwsMFvP2ov2GJ/5
         lvTw2RwGxYEz3FZUEmDyQpk4Vezd1OVWPgB5IrG8PI9hkGgyUuTm5MdADEsSa5xjoyfr
         nQBSWhmxmD0TsqE5gacRZUpcN4rYDrj3qEhuFbqYKbCsqNEC+yJY8O3/aUKTkS6G4flw
         ZhRw==
X-Forwarded-Encrypted: i=1; AFNElJ9dLNyGGTU7KnAnQofgi1JDcgsQPiZwOKAkTWuEtQFGm9ZtQBwEs5zhSV+0CeqssAV/ecJi8rXv9jN1@vger.kernel.org
X-Gm-Message-State: AOJu0YzWwNpo0n2sSVLZj92RWlsJi0FNx3rLAjl/TPseMD+WcbC0U/QU
	LHxAurx0vH8bqNtSI8a677Fy11U+9lG46CTViTfNwtyRVSfWGmDZMVHX868hyC6wJjKw1+9sWZn
	/gVse/lGVPkyz2Hs9PpntbbSZw9hhiNLdpi/TbFyIKt62ijRdC6cQFBb4yo/b4W1Hz7s4Yfio
X-Gm-Gg: AeBDiet6oCr9kpjJ4lqT7kg3Yj86B/g3BlicTJBdGpofY8FHpGHk6OuZnk58+Igrhn/
	KZvZR+OFif27EYwU8MvsPh7ghpTMNj56qfZDz9ZgEX/6CX6EcgzPXtqxhJqPr7Q1ugZl/717Qx9
	0Gp76Q56tHzQGaAl4Y8dZFAoqnFXmOWbz9doGaMXZNlf/aQFAlmYchJZGa2MMDLLdAGrVLJdk/R
	ksZenwypqnP79S3i4U1t+c0A+hukhxRkQvx5P+z3ldyKAWwNciukW0d5U8u/ptCrI+HbZ/kPrNB
	MD48nOsVJLSbM2rC70XBhAcEWQuKjNMbGXSiBr4vGKzl8Hm4esoTblwFpcMuvUPt9/0Mt7B664K
	SmR+AzIgBc+v6kPqbCTsr2ZcsTIHXpS6FHVg/IcJ6USnN0YdzClJQVoHrVRuU/QIrUu7ZVm+SvV
	rNq9CAStuHhKkWhw==
X-Received: by 2002:a05:620a:29d2:b0:8e8:dc40:90b5 with SMTP id af79cd13be357-8f7b49cb658mr290567785a.3.1777380179150;
        Tue, 28 Apr 2026 05:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:8e8:dc40:90b5 with SMTP id af79cd13be357-8f7b49cb658mr290565185a.3.1777380178724;
        Tue, 28 Apr 2026 05:42:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67638ccsm766233a12.0.2026.04.28.05.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:42:57 -0700 (PDT)
Message-ID: <4b52a34b-7c4f-4a42-992e-1afb317f8a11@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:42:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable LID sensor
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260428-glymur-dts-add-lid-sensor-v1-1-470cc168e70a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-dts-add-lid-sensor-v1-1-470cc168e70a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a/0AM0SF c=1 sm=1 tr=0 ts=69f0ab53 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=T3cQ91Bvcxg1os4lQNMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: BKpBg2BijJKwRDz4t59o9UFKx9ZuhvID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNyBTYWx0ZWRfX/eRvhlOouS7f
 gs2Ypik42ujCqpRdZBPcdlUojHZXMQ/JoZHYwsLQQJG96IpOCbaWkgCwaCBdQyK/m766QqkZCOI
 i7eIsu8slFbbM3QIohyMw7Eo5BCZPLmcwuauKiccWKhMa/GpmRbH+v3ybaO4voxchrvmgnEbvOE
 RwjA4rE+K+7da16yD8wQKkFXgUFvhFC4BfuR00xfeh7/YsOkmDnhZPoCbnksHKyPOR16tLVxQyE
 8l0LKY5M/cx6yHPIYJwiOGJhKk3PkruY5kcKUnaoGMMPhcNVwSwBG44XzZsETYEQ3cMLkH0oADP
 LeACbAyHN/AmroBlwEAzaMLruPapHPSYQSUuIW+aKCwKbQF9ZkEJR9W47ISEQcNtr4Dq5Fxgcfi
 NDjRMnCm/nSS7QbxTK0Ar5tHKFOG/MjrNXl6sbO4ijawO8ZEzqv5HKmGoyHMHBVtUOmKOK1i5ub
 gEOuRAWUhkxUgnQXYgw==
X-Proofpoint-GUID: BKpBg2BijJKwRDz4t59o9UFKx9ZuhvID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280117

On 4/28/26 2:32 PM, Abel Vesa wrote:
> The Glymur CRD has a Hall-effect sensor used for detecting when the
> lid is opened or closed. Describe it as an SW_LID gpio-key switch.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
