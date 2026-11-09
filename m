Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214484;
	b=u2bPcTSrtgkaqDINXDIV6L91RBC0dSVoHXMVXATJw7eP0l6uGDUmIZEuTKCSFeqEnYAi
	 JS1NbUdZi11oLjPWEppy/34RBli+1AGLvdszTtQsfEQjaJzavB7VrzD0Liyk0+ZuvF4D7
	 BmGE1bVpzPeIIdGdVy09XoPMB5EWgVryPQkV7gsvjXJQADL55oY4own/D9kLncA1wLAoS
	 uIvdiLi9ewgD1XtNuO2/hm9/V+CsYMeFsa8BR+BMv+Rz0mNcTwwigT1TiTTeuHeg08zsn
	 CvtaaIlBqLnQsLgBTTIMtczVsV9DCCT+IXSFdU/37uN5o5HworGtb527nVsK4QYjsEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
	b=yDSluRZOrib1kun+cdrwHvoL158TtAn+VYgfilum58WU7YHs3EEoQv0EdexUNDdkArV2
	 ecAJNStyxBR+LQys8OJ5J07llcmRGcQ6a6t98kfxR0Iz798LGYVmUPWQ56JwcX/84ga4J
	 veG6Z4hFtF19RmlwNPmkMSc3Wwk/v0Ku6l0SUiCRAnpFzioc6YbbEVkHwpylDX0ipIgp1
	 EliaCmT6QdBABq9l3uEahX5aD0dPdPSH+xjTzodrblr/BAlqUBEluVrrZp/AX7mJrvFkv
	 f7VUlLTmEasuU7oUHaYmteZRcvRmsdhPNt0z0EmPS0Wg6BAJAT7+bw6SBkuY7va4u0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdOJy33Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DHFKflua;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642CD606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642CD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdOJy33Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DHFKflua
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AgAl066512
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQf4RM779oS0Lz1Z3sQeMmPM
	DiOPPiuMG27R11kbwhw=; b=DdOJy33Zj+gGloeoGU0YcrU/rBuBrM8MfaDICyyX
	n2WzCtTAZ42ZIxsnzjTL9PhWCB1PMX5vHqJsEznDaayNSyOUnCL9YjlbB9DvYa7+
	SmId5DTFW9F43yVDih/KUy1TGn1gfva7yl7hZwG+46G1dqKyPJQb/E6bUllMjx5y
	QJpeYTh4xafgu8EEZI9syRbPEB3DpR70tP+h32QV5uTXiY6wicVDiJXXCRKyb6KN
	AJ/Qo6ZwOchptXmAv3MEiyh1YB/KKEx7no9iTetUiO+Bw8fGEUhlDI71D0vQV+TO
	O/RuR4wTDSHabp17rCz+bXLSu0/3vSM9hdeAFRkwBm4p/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdkhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:54:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so165143385a.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214483; x=1794819283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
        b=DHFKflua/4A3jm3oNeCZb3tPdsTV8iJgKlA8hr2W9+5lwQ/hDZWni3GkVJm9CXjp0B
         kU+IUXejl0D1+aO0P5FDgIWHv+p8KPD8tRdcRUff6kawJBJClG0V0Utk1ceBiae+h/R/
         DMCPQgaNIEuRifJ8mp5ZVts9iaxL0Iujzhm7FRfKYdN+1HIuGjOa4/y1GX/xz5CNEUdf
         nWHCxk8ahBSi2IqbE2FBrGxiswba+ZJ58LLgVLbucGRGoSeJK1mqruPaeJLU7c+hXhDi
         kPYj7Y3AnnRHrXIzRg5ScNnVAU+b3a4OmYCPBwHxj/r7VYRP0sme0aHO//MjQvXLIY9Q
         nq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214483; x=1794819283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
        b=FCS13UWlQpblkSctSgCQwib6QRJL3DwdzLE/p5w2MnRShSIb7VCfre8D+I2W6ouEB1
         b4vhVUc2dpl0b68fCAPyDjeekG3AxTsKCaJFWKdDiE6ne9WFddl4iiwNMRFzGw3/545V
         P8sNS4C+EDKJeQbFt8pJCamQt8JbUkoi6TTZp/Xmp7VeLJ5cogha+bahqsqQLEEJ5jnH
         Czyo4qeC3O3AnlnEcnuu0SI5K/Ekyv4Y1WfBhM05y6kcJEPzCTJypmFuN0MvTqmr/ghT
         zVJcHwDYz/3qd3glI9VWlF7dKMPXN+Vg9ckKxEjFlD52f1+KaNeBpWYB7whzzqS///Pp
         zGEQ==
X-Forwarded-Encrypted: i=1; AL+hErEkghShIDO9TLUT7nnvM+WDErzWfIpjfnzH9k//iF+rO8fA9laI0Uyafcg3cOzGbh90qE3aJdCeRzrC@vger.kernel.org
X-Gm-Message-State: APuU4Z+EdImorxNo4vrjCkzjMjwoQHR1+saXWcWDAtuDHHpfBZNHlraY
	JhMuco01TwWEyI+9Tt9VE2gt37I5+qVu7BK3AEYhc7Ttv1MjeVqrMyYXwwRmySEhdW5IPiQfXYq
	31gXqnKyHo7h6T9XVCVjXk6+NQ4nfxhbK3iWWveYebjy2c3vUjKZ+t4KX8K3k+KWe
X-Gm-Gg: AYBFou1JZYFdEYWZfjGZABqrviB88CKhRYUtUu1Bh8biijb8cciyoG1vQVyPDgoq9kl
	3tx1Rn0K24GpyR0s+5GWB2FWfCwM+Qx8wvXiIbqGVGylt++MIbDgaGBU5JF6vnhcjJYPper+7HK
	WmP0BDd/ZsPQgOfsOpojOEaaE1m1tMo0HOY8+B3YBqkhcXC9OL/iFu6Nz+YhhuX2FDbQcx/ngAo
	McKQbd0yg+owRjcXlK8fUy6XgmdYFEceZYcZXVaBxlEcx3nSfMsFFwWH+vUQt+7l7xX+W0nKf6H
	+CWd3yMkkrLg6LxtjUnzl6KmV3OMGXKfOUSEmMEshOrlrvRI6rJbFVbjjch9PoW2gxoOZEkEF8k
	nkBwa2C1TwiB0KUH7DlJw/xtwHjXOAZnwMuPNasPTDz9QspiDM09fVY6lwrC1vBI=
X-Received: by 2002:a05:620a:2a10:b0:93f:707f:28d2 with SMTP id af79cd13be357-947841e916bmr544579585a.26.1794214482612;
        Mon, 09 Nov 2026 00:54:42 -0800 (PST)
X-Received: by 2002:a05:620a:2a10:b0:93f:707f:28d2 with SMTP id af79cd13be357-947841e916bmr544555285a.26.1794214473764;
        Mon, 09 Nov 2026 00:54:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795038782sm146282185e9.3.2026.11.09.00.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:54:32 -0800 (PST)
Date: Mon, 9 Nov 2026 10:54:31 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
Message-ID: <x7eciplbxc744uqlbynakcr6ej2a3isj4j7vghgfocvvxldjqq@n3rrc537lgek>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
 <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
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
In-Reply-To: <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
X-Proofpoint-GUID: E5OOILYYB3AfuI7rT2N3bigI0w7H9RZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX+htZ/51Xv41w
 PL8jdS/cdznws5Jzmm0K1zVScl0r+VBgD/WG38kuR91AiTi+a4d/JyV46MZ1AUyWrPkWRNJtacw
 jq1jArIzW/rPEIlVURpD/MFFKhDIJRRc/FxALJTfb5miBNYLl5Aw1Mp5ZjBMWRcw9mKlCECrpCm
 okKnZRgV0K1KVC20IxfDwZmIyDAe+/iFmEYXsibhuKZGZAzpb9NLngIeTqSLRvSLd8Igasjzu1/
 YCI6pfN0nOvZa5e1Qb12MRMkRgHzKYjaXgXQMbVdG4FIgApQIBzKR5/MYhEHMX3IcYC3aCS9V4U
 sGhO5u9Zz9Y2yR+IgqKIn/A9hqqG/Zq+eaQ1AqElSguv8h99SV4hD2kdiUaxiZEhWGTqPAcZmgP
 lrynj2HaOMOcQoddYrXeCL1/aiunXFT93+p59fbs1+Ws+hzNxZJQu7tq3WeL1k25Mv4xNeYGRaP
 xNHiBy+l+b0uc+/3N9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX16QqUuB/uw69
 l16UfAEY6IrxY2azX5h9TL88+Mshc5oKhxK3UcvTF7T6X86/rNz3kJP09yhQ/s698p6peMzoASt
 xo5ibLhgeJ+eSeee05CZh7x7FDxtEd0=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af18a53 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bJUmpo4LbrwfO9ae5mQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: E5OOILYYB3AfuI7rT2N3bigI0w7H9RZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035

On 26-11-09 00:29:11, Stanislav Aleksandrov wrote:
> Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
> downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
> IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
> As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
> so these are LN_BB_CLK2-4.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
