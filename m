Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699732;
	b=i2wbVF63fZoaTy7Xeh8SsdTOXxug+kDsYnk6OMfcbWCwB6pWx/0wZdsG7LTJk8TUvB0s
	 XB+sGmLXQo08ppRk9C7HavBTeX9vUYqUIsJvxr1tqXjVJhMEpZ/mHhZHDKWpk2+1B9UeV
	 yPOKWq6Kn/fwQPRRxji9sWV6yxDfTUNFwFkw00VDshvBuMCNsbDRF1RaFZ9yPFvqP2eEV
	 TK7Nu3mizIHmi83xQ5H/ryLQGjHqDqz7bt6eu9/ODPOUb2aXe+H2L56dHueLtUjUy1xBP
	 NX9G1WUN0TALJNu+5WcsQO2XylhjqxLlKQWcVlXEL9E5HlU5H/VFbFZFsiylm/G8JXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
	b=OFY8zBryCmx8/kq+id0UF6cRv4agqEgXPpakTTv19hTbwX0mtkERArfgstGHb8uPbo4J
	 3Z67KKFASk2DAaABpMXUYO5RDjj7llEqyjKTbopPseZ8ORXhCApZ5jz4s/uH4ax5mWJwd
	 HWKa/96Gh4okaUAy+GGuVdbwaaQSrLXcU6vcOOAyzhrlMhTE6T6axGZOtssEnM2KoVOSu
	 XWoVg71OAdgUPephUt/rEr8yfX8Rlga1/cHr1KLkFfMKwqb4sHpm3+vyyaKRn6IpNCs9J
	 O6Btqh4SRv556faazkklNbLcDKxFtWtqUU2Zgk9kpIF9MFImR3ytIh+5RKVBHCqB+RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glhrtAHh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ty7n23cr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D32060A5BEA
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D32060A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glhrtAHh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ty7n23cr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352k8u2449000
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 09:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXjhq80fJFnA95T4d1bBkkRW
	6z+GaA4781tkMP0d2VA=; b=glhrtAHhzZLRW+IrXafw84382U0f16rTqbiYh4Vi
	7+Sf/7CsEBqESU6eeIHRCPw/ONkAz8mYPo4gx2DCW9rLkzxiYRROihFQlNpEMffc
	hUAYscpA/6kXrZ7stvW5lVYHR0sd0IUbt8WX8gaqyth3dB9IHiwy1Z0syKzU0IvN
	EmoICur/+6RJGX9LhsXhlDM8QT67Yuqkhaw7arPd/H1iQ5JltRZMgABJoos+hNJ8
	WGWW1ZqNP2iZHZND0eS5t+IYKVi70TIGkH9dulJcS+5wdwaaBmpi+y6+qB24A4C4
	/r3iNfBwUI3DEEh4jV1CWr4YmpNZGy8lnQ0ahSOiNb5TXQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cs422-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 09:55:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990c957f129so444745241.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699730; x=1794304530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
        b=Ty7n23cr7OYmfDt+wk+54hQv28oea+opR1DYhddK155zuu9PX/BylhjCEKxfDOIYjR
         g5Ia1gxe/vFsIDf3epARfppXirgRu686Jc+GG845sU4yW1WUA76qHw1sMKv4JfFvWZ50
         5S7gx4oNzEa/jaC98UJN45AgzY3yp3j0LOIJlpN/alTBOOBK9gf+ruqI27HVLzV3LxY9
         YZhoEQRDsZWwup5RTeBPelfvmI8fgCF0e5XfFmhL12zi52UUuiFZBSItEvAkY4f3Qt+U
         wVcwYwbrIDMdXVJvu72wslJfeMIDSnYoKdzh1rXTMWiIorld6WLS2xUPI/nI20h79+dQ
         HAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699730; x=1794304530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
        b=UTk2uGhKUcumWtNQdSHlX74yGoNXqwzt76GiYQw9cypD3L5swXpjOfE/oBarAQatUK
         ZMWwbtEtuW2H9wGCMiojPCIyzShXm6AiDP84v01JERRQSMRph4XixRVg9SuYtnxtpwlK
         p7hktpi9+pDWkOYNnmRtwf4Hng7O96lwqkCJJjQT3kN12ub3WzrbfwJwEciScmZ5J0/v
         o8wAuCP32UuNmEwzAfuo3uaJLTg1jdgNr7sd5UG/Vx61iuzxK8swjZKCIZ4Lu/z8HvnT
         TZ34VywK0pjIhe3scouc+bUwG7VZKK3/ifQGjs+3cwJWI/sMLOEloVenBTSyx4KyaSWy
         rnbA==
X-Forwarded-Encrypted: i=1; AKwUvBywgePCvVBASrjPVB5PLlGzKIu2cUPVOjobxo1t1ria+UHP29/+GTjvQcMxdSvmI+SBUzBSxgNeOoUA@vger.kernel.org
X-Gm-Message-State: APuU4Z8qtHfKfEJtLzd1HBLZHFhDjBZsz2LKG24Nknm1gvDlm+RsHryp
	WcZH4DCap9j1+t0j8YgNXkMmSRh4SJMm6eLG7u6clHV0nFP/v52S/tRA/5No+uUlyqzb6MzUZtZ
	MW4kkgVljZI5t2XnoTDHfanmuSvJ8WQKNwR0hIuj3+YpZFLP0Ci1t3V5YLvDpA5MJ
X-Gm-Gg: AYBFou2V1ilXeszla8Ul3AMCEGH0O7ZquISVY5MOfC3PoBUb0/IU1kTB/t5Z+n/Jhmg
	t0qwDGZPz4pxUwBeJ9EIpble03WNCx1DhmI4KZEL4Nvqk/e9lM7b9xr8kmyLWmE6hFPhLnNBQ7U
	DC1OASlRKQzaWY7BaEXB1cECq0CPEenAzdRVV1r1purGY8Zhv1gMIgMnPV9JbcLBYoBXR3wf9nQ
	yi8tetSukL4Zvpcepj75Bi5x7CTmAL1uWe++prDq/aM8xqlVZL1duS/yYzsQZBE5E0KUzWbMrWH
	LHRVmWrFhtL61TZyBZrYlbPUvwuL1i0COQ1uoSYKcu5pTc4V4RQjVJwvn896sTd+z0rOyN7N8pQ
	o4qMFKe2VE72C/IlCFHetZSoK0pCiotXX67gZk57EhUqxqkLOxBUzjlnpZvrNVq8=
X-Received: by 2002:a05:6102:4b0d:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7d0542ccbc4mr4873288137.28.1793699729869;
        Tue, 03 Nov 2026 01:55:29 -0800 (PST)
X-Received: by 2002:a05:6102:4b0d:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7d0542ccbc4mr4873269137.28.1793699729142;
        Tue, 03 Nov 2026 01:55:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm23166849f8f.56.2026.11.03.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:55:28 -0800 (PST)
Date: Tue, 3 Nov 2026 11:55:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
Message-ID: <k3pobjkp4kzshfftvszrzc2jfdezsd7hauzzbhi72gfmyisyji@a67eggd7tvxk>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9af92 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aa2JovKfeZIn8VmDcRQA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 6V0aYEL_bNR8r3Yw1KikbzYUDaQKp8m9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXwOrE1OVUz00G
 3RKaOYuFJJa08FdSymDaF6AHQlBUaYuXpREgmigH/IKCHU8MhS65Q1pmIqzLaFBxynsOuh7e2qB
 zGQ+VNhA6IkvJiuG5uVjzk04OCq7jwTsFmBJnieo/yseA5YttAgKd21vAKdikitSwG7+FGXvRE0
 eJ4/0fLx2mDZCZhhXW3gQ5ihaoANQKxivQRrzyWmL6ZWdGrXtgRBPnQMio1t9zy7icO24giex4G
 cO3U/Q4zJ+5UKFetsGTKxHYGvMG2Wrpg/NWTj3XphrW49MQ2g8yETE+ozFLc4inBvlQgiHlDoi3
 etwjKtJ6MjYhN98DnEnHolSPp/kQfwoLdaYBUpmpCKbhlP6PQCNo8hTZpGx+Z1ljSLRXto2jYPb
 89wElWLGmpIFtJbQU+RoU11dfCJbLF4i1/Se05WPzY2Se48oUCTNAdAlDWwvw4IHYDXRvRIa94+
 okBhu5ZKSmxPzV0QWKw==
X-Proofpoint-GUID: 6V0aYEL_bNR8r3Yw1KikbzYUDaQKp8m9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX1o4LMYiM8xNK
 N6XU+Lnq1CLf27nO3XO8oaiafXRnuVlBEZFZlSRPJRn5yeSaWS+21rrG/BysHtyclotK+02nYz2
 h9Gm95XYv4URJv8RGZyCoKCIWPR1aA8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On 26-10-27 23:38:26, Taniya Das wrote:
> zonda_pll_adjust_l_val() obtains the integer quotient of the requested
> rate and parent rate in quotient, but writes the requested rate to L_VAL
> when the fractional alpha value requires rounding.  This programs a
> nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
> parent requires L = 63, but programs L = 1200000001.
> 
> Use quotient when calculating the rounded L value.
> 
> A GPT-assisted review reported this issue.
> 
> Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> Cc: stable@vger.kernel.org
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
