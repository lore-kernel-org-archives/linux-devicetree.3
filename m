Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1143CF034
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949443; cv=none; b=VhMeKC6zMFj3K51+guUxzS0f0QDF4dS0Dc4QgsfWw/GpH48+zrWJALn+y4P7NNDPaue4p3hEo7h0QuBnStbf7LI6JQpWWtXly3bFNye2CAMzlGWK6ZmR8NQMYdWp7vgGgqdyKY+DFGF8CvfCwR4SVjWr4RvvBHhoAERyi2+v2s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949443; c=relaxed/simple;
	bh=8M9y2N30To5Lr2+deWpaIvEJet4IUlwh5IdXUd7GB+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5eb9zywJOhGEJriuU3cb+VtOQD2VMX/YC++HvXN8pcfUMGc4ak+P4YjrsJKQZhZtBcl17TXcX1bs+BSxgCxu+kw5w/6vtf7lKIkETSoI86CvGs6povjYKTjCzr+N2RSkluVjzwQCQslsNdsKzeYXq4tvNpTQ47UHjzTj8eNee4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqJ+blb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftKnBqdU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqJ+blb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftKnBqdU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7OUIM2465252
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l6hIJt4vRVNIKdR1Ny7pJjCMEd9wk7RkRYpFUUYnL2I=; b=cqJ+blb3ibXuyvwb
	bnVhFyNPDY32amR96u8G41Thf73MTJky0wZkq8LM0g+bRxpjoGd7RS9QPvrHl0/E
	xXl8Tn44KZxUedGitkXlZ9uO/E/0DeMbcKRmdkv8Sp+Aa/CCycqgKDkYRThxoFZE
	7CI70ZrXZjyux25UAaklKENh7/tEyS6AzQ1zt+VcFpxva+LODCQ+BeSlEA+D2G6m
	HVpEI/2dk8wRYBErmBlNv4X/CE/jklK43YFBfYuFdUYy2TdU3Mp76/fTKjpPXbj9
	LPZGus2sbRKmOnl82pVnqswI8c73N1ExPP6v/8tTX0zvIwWqu4kjZLSgHgMZO+Kl
	fx9g2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut8j18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:30:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d1a5661ff1so57511385a.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949441; x=1775554241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6hIJt4vRVNIKdR1Ny7pJjCMEd9wk7RkRYpFUUYnL2I=;
        b=ftKnBqdUvxnFo4nOMPoc9GOqhPJPCn7XMI+JYvy53bcwSt+n2xI8H0tY/U3h7KeH5i
         0Xv5guPMzVq3Rfr4l8aQ67G4ZDpHEH5rDCGO+/rXfXzWxw/KMA8nH+lFJP9OKg1puMif
         SDVgIH2Yl+jGE/dtCWm/a+stAO2IBRNCULn6pQxz0J633oujFoVbuerHVGyZr+lYoQ04
         xOpnBqZQQ4DxmOYSluRJNqHdsiqBwpyFuW4dnyy48MFb5tuVcMbZh+WEegpMpEi1RuPa
         ssptQF0bILflWtkN3GhcruPaHyWpSmhe7uh0wqQei2tT9dmxWde925g+nQ6pe1HSZFyH
         Pb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949441; x=1775554241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6hIJt4vRVNIKdR1Ny7pJjCMEd9wk7RkRYpFUUYnL2I=;
        b=Mk0uMUZ5nQofZgbK2h8jWXctxIxwEseD0Z6wqMADKMWk692xtqAo+S7uOmmnkhAvd4
         QuNHBxbMHiJ7l896kb2aRVenq2rj3nlUlqpjCPVy0kQRgR2+BuyFiiyDiPg3nLbsWhyk
         +7/RJXoUMwAMz8+Ev/oyZkjQWMEJxJ4+jy24/6dUJjrGmI1b4SlyXX0OvcWe/cRaTdCo
         tPSfTS6Vx7D+qIXBLLcXFWxax9abyttz3+2QzWnANnONDSLCuQfCUul/fWraq1mhVIZc
         LOevdx+pT6T5gZbt5lIX4Fzw5tgknowgYvzY31zTj7EvDLcFYS0P3w26jIcAiUskq0Jq
         DYtg==
X-Forwarded-Encrypted: i=1; AJvYcCVZzSIkEDgOYsM+wzCGgEjmdOU0eUGefII9SQK694tyKk678tPJPoVEod65TCheyvtIJRwO22sZNHrc@vger.kernel.org
X-Gm-Message-State: AOJu0YzcFFR67NDX15NR+VG4tw74aSCStd1qWb4/QyzqbsJwWeXh5FmT
	M1DHhF21trLP/sON34wELRQB1rveHuxBguw00R4h7xyPxXcam94Re9iGCZx79aBeCWv2+6/FImX
	KhtInxt6AntqmF+w6tz82OIyDFVJH5Wr9XpkvcnYSj6UbOKSYc+DHJNCYwLIUMQfv
X-Gm-Gg: ATEYQzwN/yQ6wffjXHBq2rn4RKZWkaJgZws4fp4U1bsFG2tU9GuSgxAscIB9braHWWW
	D3LpRate+fnHYjRU83pCwHYEV6S2ubmxb9ZuCqgCKLBVKAFzIV0JbDiPWMnsHDHwGIWmzaWd0fK
	xxT7UgCxcLFxaCF4nq+PKX00nlsB9XbaDFATq8ILNdfkIdhizKm3GSFewcFWyicW3JKyodQh+YR
	R6aBVEf6TJpegTfhL6AGk6WugVa+WZJGysYfDpohvpicd8UvpIcplis5/PdFUUkFFk7g6NZFO5U
	5L5qG/Ih891bTC9lxP9LzwhgFUzLOv2JBQfk08yzmsCRF1wCxzKyzXtSaB4HX9LcAiYr5yiZUIA
	twjVdMiP1I6rsAs5NvbeyRI+0afy9hY37QJ7C7CnrAv/lHBXjnBzOIpbzSdDDpo+CvXFm6WC2u8
	4W8G4=
X-Received: by 2002:a05:620a:4491:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8d01c7e3733mr1459685085a.7.1774949441162;
        Tue, 31 Mar 2026 02:30:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8d01c7e3733mr1459682985a.7.1774949440675;
        Tue, 31 Mar 2026 02:30:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72963f48sm3445325a12.7.2026.03.31.02.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:30:39 -0700 (PDT)
Message-ID: <0055915e-4ac0-442a-adff-a2c854cce474@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:30:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LHqls5uzFe3QFc9y5Aw7jwtfGL7VxaL3
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cb9441 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VI5jTiJbDvfuYzbrj9AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LHqls5uzFe3QFc9y5Aw7jwtfGL7VxaL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5MSBTYWx0ZWRfX3piby2XvdaJz
 cpNauhbeGjTU5GbISufKdI+16ZLYKkb1h2IxtvHdHdLH6sQuS9DLOmHO57RTF8ea5PnEH1QXbbN
 uLw4s3ZBqfxH3VeEe2NfJm9WSJOh2ZKGg+1S2cAFxHOGwl45CSFk2CgCsao6fsw7DkDnHTLQo1h
 lauEaHpTYENZAO55XEkrTN1jYxxgt8W8feCl4A3DxzH7Bvtx7eT/X2io4RLSNTVEgt2OjjRJGii
 VdxlvQm55/nG3wCJITt/r0qg+NU9TjZZA8ZFHPci4uqKQl9IyCCb4q/eurMKF9RTdX/nyPfQCzS
 NwKtxMg1Bv3ITYJxTMKYa3gRRkbECTmRygW0f9b0a9dqUb8Tz9Uski0mLj2jm/gZssqhmJVF+Wc
 jKJVW45bW1OODPdlKVLeO4mDIGsbS4E2Q6Rv3NVmkdNXLCZAxJFyzG22OwhviGdXT90Y9+QAGJg
 ch6gHCdCq7p38n8b1jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310091

On 3/31/26 2:34 AM, Vivek Aknurwar wrote:
> Add RPMH clocks present in Hawi the SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
