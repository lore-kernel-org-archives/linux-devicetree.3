Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92829B781
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880196; cv=none; b=W43mOjMIQLaSDoQIFwSUWI/JtEmmjC/9v/b9o/bzaVdiZyXn8Eh1TrfQjuk+MBtQVPy5EPMLNNbHWmPPzrCwYRB4/iYT7zQExBxMjfYf3XbkSOZd9/7teWD1EvxuAf3aP32l4ISba5SdKcTzB3ztDldIZqDvwYZql0JN9tL3oBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880196; c=relaxed/simple;
	bh=J91BfsumvDXFAUs707QVXicHQZ8nrbG+8+sMJoroL9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3sQETOV2HhieeqMIisIMxfnH8prwb1WRaIeVq1iG5n31+y6p29ujdMIsH+5FhZp6DijVaw6zZOMgpYKK9FkpMH1r4fHf3jRRHaDz7OHo5oVqFvPtF9RdJPloPnw515Jg9RnBnOIr/AERKdJr+BD8e/39tg9P97LfK5U+AxCHsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MA+uDjAR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHTBgKyF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MA+uDjAR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHTBgKyF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lHK82137610
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6Ze6Zm6Q8SsurdP9VNHjS9PuB5+1VUQ2wzJR61gZbU=; b=MA+uDjAReaqsoj97
	BribVfVQvu+hKfXXT3fzH6NL771tb/DtbUpayqgjqxjNbUv+lvvst+pfreq4XQfB
	9i/oBg+GXpDXKjKWVhKV3jAOOw0LPb4Oy4GLa72bd5ZuLWWkZ/Ez3kYRYPkBfXoC
	qga9+r0858gvS5U6d4QmDb1I3RhV+tK8N7MknZy4aJ+KwQtHt/evVZDqrIabKrSU
	I9xtDisO249HL8FvW/Qq9PWboiEKtvxNcsBR/c0eUV1F881voElggTlm5nF73tAQ
	pLMfYjzj4oWiZGERH0FPlbzfJALgF1ZeqMPdkxhyDKV8HdB12DdggVd7Y2iWDEeT
	nAinEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1asyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:03:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edae07a7so714985a.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784880188; x=1785484988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6Ze6Zm6Q8SsurdP9VNHjS9PuB5+1VUQ2wzJR61gZbU=;
        b=NHTBgKyFXpgqqEf2uKd61+I/zJDS8szArC55c4hWZbc7ixudRVpzy3I/Qot9Ry05CD
         k9D/ddpOgI7SYRVl3lmRXr/PAx9BpfI4f4aB4JnbX9UI/Z6k1DJqDXnUVy55qd6404Xi
         03AGwO4Iszg47pc6m2Gnr3+Zohx7+37DPf034SrRri7+JS5CFgc5q654LBn3aZHytUHO
         BRzO7cNDFEy1ym2c7YXQN3lXrMQXhDzyIr14qViKn00uYBDb621Amfy9i8eYwF9O4bd+
         GEUdiReMDAWZl4YOmf7R3kqfGhtiVYh9Tcc9+8pPXYF+SzSd6AfdWyX53lEId5A/PujF
         QXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880188; x=1785484988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6Ze6Zm6Q8SsurdP9VNHjS9PuB5+1VUQ2wzJR61gZbU=;
        b=lZQq+XMJFQYedrgp+xW9OtJDuAJZzyoyJrE56tri32klFKtJNngQ1UwhfpKYsatS+Z
         w8OndEo9AnxyTBBCWKeS3RNF4Wa4RfW36pQ5Jp5LafDmZ7nFmRZN+qMkodBdovLG/idM
         giWRwHiMjzlJS+fgo7mp3F5E1T8sJayQCeatRqfdIyiS7z4EHWAIiDNwvZmSjNSIBkkP
         Yf4MI6pDxTWQH0cAi23f1Sd2vl5VCLMB6gT4Z3pmsKFtSmGGbOZpL+eqPpxhizCYXrgM
         nbm+JxLTdtWSrcSP+xDBuzW96kMvCgAWMtdStPo3f/HYvHKaR+3DzljbUswBcIDAZ1yX
         qdPg==
X-Forwarded-Encrypted: i=1; AHgh+RrTAT9ypN/S9mRa1QUjSeWSNb3CldNik0DCCCk4k6pcfHqbuZxmscekU1f8IUgPYjyiwf0K1KNmZMoW@vger.kernel.org
X-Gm-Message-State: AOJu0YwYA9wH7o/SdGcBfPgwKXYfoHadqVNlpYiCLdj2MsAUX0PcYEOq
	X31g2evFjB0lISna+zCSX8PXvYcJ/CAuVRHwr42WV6z3sQd2un1zWHQULCijUjEFPDEIKf3uNrC
	Aux9UuTJ8t0ILbfLKPRHIHvh+qhvZFZEr75yOyuOfvnBu3Nf/ncDuTHn66+rtfYIw
X-Gm-Gg: AR+sD13G+Bim6TB4qHMbc0p9ZnMjxFl24oJNPh+C9bY5ZTAzMEs7HrHgIosf+drWUsH
	Udgjd+qprMTNtZUvYSIkwe82FPhC9OmH2Lhm9TLDRjUaL+wi0SBLB8yfdIpXzSuPImmmhdxNMxT
	ojcPzjXaCJVqdHIJxBJG09E2vDNXcI6o8A+jMvP8nBsAiZkzCy2o56Rr0CSHv/5dw3K9qk6Li/s
	S3qDiTVIhDch+eDyQGFxqmOTXYOub7cycOINDhzSogfgDe01VASus0KQ/JbswS3y+afXuM0tndY
	m5ntyZlXNqMrla+NVLShkAhxhi1bkfdiGGtVkxQKtCFoH8StWuh1Z7VUeeSgEZYOU3heUTe2JBS
	EQvuF2MP+UK1uK89HRG09ZAZ6
X-Received: by 2002:a05:620a:4105:b0:930:afae:129f with SMTP id af79cd13be357-9315e342b01mr256656985a.8.1784880188310;
        Fri, 24 Jul 2026 01:03:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4105:b0:930:afae:129f with SMTP id af79cd13be357-9315e342b01mr256651585a.8.1784880187671;
        Fri, 24 Jul 2026 01:03:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af244asm317674466b.27.2026.07.24.01.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:03:06 -0700 (PDT)
Message-ID: <3a2e5d7c-8881-4b83-99d1-b8984178a089@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:03:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-4-90b878ae0d4e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-audiocorecc-v3-4-90b878ae0d4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GB_F0mtFcZSBaF720K5UvX8SP5-D8ge0
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a631c3d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tlOuMNSg9W14aln77gIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3MiBTYWx0ZWRfXzRwrgCSusrvy
 xMQu8YOkhFSxHCmUKs+YcKfHYiUAcC2RprLVE6YU+gnRq6FXhUhGyCdWLztRbHeDz9e6zLMVob8
 A1dXFKmq/07MeqhCotWXNkK/9+Qb0VFB6asyzVBWvQk0HSIvIcxupZLhE6ddV4ZK58G5Y//ngxI
 JrvdBftDMnGzK0edVEsqhAd5SqnCfEoXYcWAmMLii/PLO4oLI/usxP4hG8ns0ROJi7N/Jm/mMzy
 1OQ+PR5s58yTfqnb/kgdItdtHEwXqnodJksKU1m+J52xu423jGu6UyrrvbDiyJrQ9cx0bwCvq4N
 sJqZmrV7kLk2Nljna+T4kSwZxYZuMGauKiuxgto65sxHrBtpxRYRpbpDbEVPptyPIqrGpXb1TSr
 RtHmq50sxwa0OnhLo8UjuKi8W35fGqaRlQzeun55VS2GfSc1k2Mz0CTMZh49yX3xxGpdoWraTb+
 Rg+44FZpRpfnEsIK7wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3MiBTYWx0ZWRfX7l18FAmxNiDY
 HTOEcjAoVJPIrjUggOmlusZS8WRhChg37vyRJ1D1pJAHkkXVmeRp9M9bg2L6dZePEx0mPzMTc3o
 o+fa7ADIJZOISX2e2mTfhqRugek7r2Y=
X-Proofpoint-GUID: GB_F0mtFcZSBaF720K5UvX8SP5-D8ge0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240072

On 7/23/26 5:45 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
