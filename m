Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A0A43DA5C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382678; cv=none; b=lif3LD1dzNNauzzmxKVEFwXc0mMs2IXHTeawXDK/tH+iMyca4wb5LzA/qhAcTdBeUjBB0rY84l50rIULRLCTPhFhD7FDJzWVkWwXfkkq91z/T5UFLoo79UP5IYmIO80/l9uPjfjKBZL092wI4AwN9vZUIb43qHmV/g4mFVKE374=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382678; c=relaxed/simple;
	bh=EM5ubO1aixQb+FUZWi1Wp/YH8k8mBG61YahscZCrD1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQlVinrt1Q24wHL83bI0T2wd/dKH4yolyY2MvUWebfpkGfSK6nVVXrvSGoAcgrL5rIF+bsE9HS/uvAENqlRFlQB5kr8TyURIQSaEr/AnxBU4t3GMmUg0G00QHMNb3CWxfqDDaS+WhMsGu1CNTcirksxK1ztnLFGvvYRRsuI5lXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqyy4xTY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYNyx07i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqyy4xTY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYNyx07i"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9npF51086603
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmRbbTFhta754R5/nqUbl89Ko2/yhTJcGsYbJIvf918=; b=dqyy4xTYt7/StkEq
	cuyn+618/x7cTTo39noc2AaVAAmX/iD8ye0YpgRE6RbtvcmgdwkA7VBeUUwSYTK1
	F0DeCWPuvJY1Y5Stpl1coMdOcPByMlgi6EDshrbOeYoWgwQ8a9mq9BDyPFMRnUqE
	asrNgOCueDyroZy4rfoCSKMCaxYoAMGSrtowV/T5erTuBzIlAqfVzPQywG1NrSh2
	1qSiywfO8OYInpRR5knspl5/1+GVF6h0N1QIaEabTOn68QnJ/KISDjG4vaOMc4Nx
	B4efhev3rzXfs3/JhmgGhOnL4pXg0YF0F4PeFP4kBRHIb0G7LmBgnWEQaRSOhWBr
	TM517w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0a1p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:44:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so54947385a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382673; x=1789987473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmRbbTFhta754R5/nqUbl89Ko2/yhTJcGsYbJIvf918=;
        b=KYNyx07ipdhVhqHEWiqR8CLQgdPKLwv+oEuDwk6nYbWh0BsTm5DqpHi4YH21rZCzSf
         c2MEBLH0C/quS/Qml+/uT9iZmj0EPZmPkl7kgDfPpzg26ilh5oXaISDLTGEit9h+6O0t
         EqWUYbeDZveKDacMDLccGlSRVHB7o4jfZW5M0JGqBbn0qpGagTl1Un8F5tCy2LUSnyvA
         l34Tm0GbEJUrheERO5zt+CiiJDxSuluPMb6oC018NwuNjrgLsVJjV5UnrfxeBL1F76Dh
         6tGV6gLdN8V4zm2i+ECTch4Zy8T+TBZpd1Dh5iSk00320IF0Sn/Rc6Y7Fj7z69m2K1sM
         zF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382673; x=1789987473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmRbbTFhta754R5/nqUbl89Ko2/yhTJcGsYbJIvf918=;
        b=fo/4EAefr9cUoJ97s24d4xUZi5HWtAnfKOS9sH8YAQCaZWIQjbiW5jlklHTN6HS3GK
         DRsA0s6LfbgCVeE9Mwza3SWjFg2JxcA3Jb7g8TKk/6uMwGgKB63mNHTFsXY5qCkys5f9
         J2Moe47fczRfoW42/oFouYlGa0n6/l40JLwGL6OynfZPYaKO3MnYccTuT2pyMJF4jaeL
         v9F/UIjDqgVjWNl4PPyT/xSLCHs+AvlCjmP5hMH+fJHRuwNdWr4jPUR8g/ZXcJW6PPEp
         FzhJoz8WiVBi9dZCuFqCRo20m9PstK3CnDvMokl2oiPL92Ij/iHQOKCurNxx1aCF0qwb
         ri2w==
X-Forwarded-Encrypted: i=1; AKwUvBxEt7IUQn/ZUSNlGNI09cVxeiMJ+k9u9RtqugHkodP0arsd6lzuNcTIDCOUHkYG/navl6edgUK7Zt9S@vger.kernel.org
X-Gm-Message-State: AFuF++k6NovuygnxZy/0RsaRZcEzeL0zHT6k+k4huHA1WM5LH5TDcGII
	IHV6OuK8HbfGEqVBxcOECiK8+4fzRURhtCDbUFlQcVZeF+/mWpWwSUXQ6yffItdMbZ4KU9UD9eq
	jLkaKJ+htKvNaPSbo27pWNlEwJT8b4XMe21NF0fegrYI9PCUTHJqd+CKBXk3hj41u
X-Gm-Gg: AYBFou1cTMkBOEs/aa+ej80LAOsFUZNZZ4vRasYXYWHa/Pd11PpSzJHhqG3CNWZ8d22
	GQmWzgCik1JIHY+AaC8GLEeZKaSVZNt1RbrDdlACRoCfeIZYz+30Effl90FSvAPrJEeh6cEpiKs
	yx+JXQTiJ7eqfJkIqbOgVKuh3SegXXXhXGtN51awXwLTNdb3keUzQhK23xCtTklUcZNM6VgilL/
	K7dHQCgMRnx8IbaeWX6baS9Si0StK9cG000Uvf0YGrIGOwpx1GrvojDlzEQqNKLgfUQaOV55RgV
	Eki8aaiPs49SQR0dIwJD4C2lbNzbOyTBUBSHhu9uzQqNkDCGk6Of5KwZ7mpy76AaKxV7Eyo/liJ
	aYAlqII9c4vRO8pYYkBn3Vw==
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr211106985a.6.1789382673249;
        Mon, 14 Sep 2026 03:44:33 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr211102985a.6.1789382672631;
        Mon, 14 Sep 2026 03:44:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9ba8f3ab9sm3782485a12.15.2026.09.14.03.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:44:31 -0700 (PDT)
Message-ID: <0503b151-dc60-479d-8e31-4c2d75f4d639@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:44:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers
 and PHY
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX3Koev0+tT3sN
 t8OLJzctp1IOfKH6W6oJ0BinGitL91J1woiaXS2gFhYBF2TVcVB8W5B6ydANzz3Jt8f1xnrEbnF
 0ulW65QOk2RCLlkqi39SLc4vEvHq38w=
X-Proofpoint-GUID: LLJ-Z0Gd1H7Xvuhpls5kRYZUxVkvVTR3
X-Proofpoint-ORIG-GUID: LLJ-Z0Gd1H7Xvuhpls5kRYZUxVkvVTR3
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7d012 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=MrLAvLjqEOgBX2ddU8YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX+qoowgZa9Y+Q
 ctfSVVrKruqJl0gCRwekiGbrfMARlQtzIMvOfRN3ed9kRJdLQeDXziD4mRd3Q2H9Vp7QZpTNOTb
 g+QxLwTSu+zdO42PnKdDCfMvFlHTbi+wfiOyQ9gocYODhgGnolT9YHiem54AyC13cWC+saXM5ZJ
 26s/R5CPkWPa2o+6l1pXrpnkBbBMZ2VGDCVXccZNC/bNtIvAG5vtCNf6Wq9kzY7RpZYpyXL0mE4
 1lLDm0xBjqyaX/aZ5D4Z58djggY2+DyajiRJY3GCvPo65p7lr/9j6FwrLJdS2WgEGC9vxkQgzRr
 fOeLsnHVQQ+/vsHOIKcbgi12fCJ0KeKbZoFZEg0dPjLrSec9XBJtCoulYC8xiGylMdUVvfgs8rx
 T5cahL9WenuY5TkIUscZX79g9P5p/IDKRhfNDXdbY7AVNrrt3kOKkIORbleaP0sHHbB3fFpfraz
 +faxO7GP1iEweWeHgxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

On 9/14/26 9:19 AM, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> The Nord Robotics Reference Design board routes all four PCIe links, so
> enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
> rails, and describe the PERST# and WAKE# lines of each root port.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
