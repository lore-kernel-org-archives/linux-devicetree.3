Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992DF352021
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895450; cv=none; b=uwcyp0A7wZpRo3g/OHFltQyQVMImou//SW3VGIMQnBJOu84Jm6Tb9Gf3WCAncO05bEBvMAXm8EzTNH7PtRRFhX68dJ6v+ci/K548ZZ0xiRwNBkSNzyIuLnl8fC5eCjtKc6Do1z/D2oLX+rXrjdE6Vtswrd4lilhqGQHeuDoFNDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895450; c=relaxed/simple;
	bh=5UnxAS1f2bto2hiFQ/buNCHdrvssL7LrvcSPElNNlIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KndRsxvLoEqjS9G1K5rkdBz6rsTKMxmZLLg+VOOlv0FbtK9lwmi3rlew+FyNd32NZsL8xjFK+Km+dBeGc5soMvKA+tBMgXzrY3eJDgHj0fSaP1gXM+NVXgq6aEX1tBo6pzbu9TMY6xBOvRdhI7EI2b9HEMi5ZHA8O7i+O0yOVYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0oZPvnB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fERNWleg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0oZPvnB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fERNWleg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GCsk2027013
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 05:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FxqlvcsonSm7ptmbEFKZdpmj
	PffTqZSRGJCyY3Agbf0=; b=R0oZPvnBLFWDjtoS1g7ceN99pmAF2unU+xWl0u+X
	u4mvAmw4TVpDCYTbd3vtR6WGFDp2oHnGZ41AZAwmfKEZmAdAPLStcflGjuvuqlcM
	33KBHp/baRa32FVHkn6ICdQNiAqpBr9w3L7MSszI44YTwK9b0C78CYxsmhTiqcYV
	9bw7klKM8kk9+/RP/ICo33lnoKYGun3poUefLR0SF49QZ3U+PMeQqvrQIRznwHYZ
	2pjoMCw9u2zKQFphYKXT2NDm7ZyWngln/+M0iwxJQFF04Nrq17TuJ/YmXRTzYfv8
	cKgjVsppr5Jx0Jp6XQXmFnr92NzSuYJ1ZQ/WzrfyHXNmog==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4x6ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:10:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304d0d0b28eso1459809eec.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780895447; x=1781500247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxqlvcsonSm7ptmbEFKZdpmjPffTqZSRGJCyY3Agbf0=;
        b=fERNWlegBDHCJI4v3FHoKwp3mEYjG5xdWVQCahSuejk+Oa24oPmqPi1W2DS3F7nYEW
         bAyhB7soQUOOWW6YAVVFBAqqIO00zMNlUN/aui9ASpYe7zL3MiH9mEcOVhgtTetvgUJR
         G80ljIN6qb3aCYWCq7en7rZY1koCvPR7tolggRRtX91xQ0ahgAl+j/nOSx3TOerTO1jl
         2qcHbzjjnfcfWSoSsXxQyiV5hnnbB6p+mNfutMkjPZqVTMRa53NJI/lebClmuUcRJtTQ
         dOOU2nB8FQTNWmMbSne8u7R6VqdeS8ZjctcI1tXSLFhPJ6O0IvCDbYXMd728Of4sOOIQ
         Pf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895447; x=1781500247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxqlvcsonSm7ptmbEFKZdpmjPffTqZSRGJCyY3Agbf0=;
        b=F7in+ek2zF0adciQP8awkIyze7c0x6xH67P4t5TfjlaL6cgDyBAMMc0njnjuxTr3fn
         i5SzTid0/yp2teRTIeZ+rUZdXh6V6vQWA9/z4RMsjkpFGlPHO5ryo3YZL9rv87hrewoj
         BaYgBBXjSHgDkrpfBau+rp022pWaxuoKW21rPaceAMFYpDA2767KSW0iOqgZsF3O+8vB
         3jIEeawSHRPWcWe+HR4u3D6F/2U+XG2pXY7HRdWYkYMMa9dLbzDvqR1YHzGaYsy89Gx7
         ge8eZuy5iILldTGKjbyDmaRVeWQkKCuaFE8oprEFqol4+RVRBGynufnwofUQ7XvzoCND
         +u8w==
X-Forwarded-Encrypted: i=1; AFNElJ/cXJiRdAVPJv0TgRG8aowTxVegp9xd2abVGzFGsY8gcwtchpqSi5/wkknSgoXNRzeJdePzO75zjS74@vger.kernel.org
X-Gm-Message-State: AOJu0YwMDAxs/exFQhio+GaDNiLz1kT3JK/HAKh6oJw/j77FxdZ5yGyP
	E17hz+I9FhIrJXHNkOLooXWObwQDbGUqgD8YixrxmVgBCumo201OBnXN+MJMGYvx1gg62k3jPoY
	E9wCZeooSJzLu/Rc4VDNdg6X0OQYeTG6IYZTbOEfQJjGqMe9CGM/e9mmPId9NibnV
X-Gm-Gg: Acq92OHXzrAEnKu4wfchE8GPqGBqw5USgnNhOgUR1mMjYAhcFsmtCyLsy1+XUKZMGOw
	o9rCvskzbiGbX7ULKNFenTddTYkepaYXbacPsBFjz89rlcLMIe41Pxce/NPd2OVP2V8NH7VA7hQ
	iyf/57qhtmmgDVySt7I5Or/WXb4lV96ZX0EQ0aZdtwGzEb+lMmTuRYQz7oHQN24J5hyG9wFxGPQ
	koNlAUi/rMWhAeV0LIC05InrKR7K4zDwh3Im2jiYltq7EX4+HiscNPDiU5nPEuMBROtcWU9nt4F
	Y4/VOthCl03f4no3xRyZaPCMJWfmAntJW6ZYm8FTtpJHSq42aprJaBKKaoT1V3kz2j3G0etUMD3
	aeRB9CHxHJejSDumcdGUNtUElnkgOg+rP1/lzq2+MtXXJJUuMRzb8+FyGLd2dba3hn9QSYO7GRb
	EF+C0=
X-Received: by 2002:a05:7300:4311:b0:304:d32e:65f5 with SMTP id 5a478bee46e88-3077b7d84c8mr7306356eec.26.1780895447503;
        Sun, 07 Jun 2026 22:10:47 -0700 (PDT)
X-Received: by 2002:a05:7300:4311:b0:304:d32e:65f5 with SMTP id 5a478bee46e88-3077b7d84c8mr7306326eec.26.1780895446986;
        Sun, 07 Jun 2026 22:10:46 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df48671sm16240828eec.24.2026.06.07.22.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:10:46 -0700 (PDT)
Date: Sun, 7 Jun 2026 22:10:44 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding and add mahua
Message-ID: <aiZO1LE2wktznWG8@hu-qianyu-lv.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
 <20260602-tcsr_qref_0527-v5-1-8ea174a59d7e@oss.qualcomm.com>
 <20260605-married-elephant-of-aurora-44daf4@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-married-elephant-of-aurora-44daf4@quoll>
X-Proofpoint-ORIG-GUID: 1R-IA_Eew0EtbF5KVl7ZjEru1gwgJM4j
X-Proofpoint-GUID: 1R-IA_Eew0EtbF5KVl7ZjEru1gwgJM4j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NCBTYWx0ZWRfX1ikRmlHBr3li
 TFDrWUcAS7mUxZ2z/cr75B6jtcaI11J5aK3DZpUyfUyx0LxsqMwJKqwyIx40mMRv9iaqFsWI+zo
 55VJVXLPUGL2yTJt7v/Hn1441GoK6vYO9lg18/xYTQ2P15XvIVrSGgINNfOHFsPUF0Lzkc2Hbas
 1QX70FTI7F5WjxiHjdX/YMaHvlVwbbr+RDnW9hKbB8YTkfQ8Oxory2a9xSVWCRzD5ed5l9NbQQZ
 Xj+IjchMLtUdDNCO8EtF9lahuZnoiUGbj8epPSwqKNa21WmgEwklnCoWwEdVzESWtKjWaQwIPZw
 JJN8Bq1rP/qQQkiFHqAoBVKnsEgBXDdnaZbsb03rdzVZsarDjkcTJPr+7D5OP6SLy0HG3Z6scib
 c+H0v+eJ/V8A5BGul88aylD3Pzx+lfisP4ROPqThlo9sqACrs2/YMOBakSH7Jk8vRkzYNUWaVCt
 5K+iYf+UCamdX/UZgHw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a264ed8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=k8043wpKZZKsePy-DxoA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080044

On Fri, Jun 05, 2026 at 12:21:34PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jun 02, 2026 at 01:02:17AM -0700, Qiang Yu wrote:
> > The QREF block supplies reference clocks to PCIe PHYs and requires
> > dedicated LDO supplies to operate. The digital control interface for
> > QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
> > QREF has no dedicated DT node of its own, these supply properties are
> > placed in the TCSR node which acts as the control interface for QREF.
> > 
> > Add a dedicated binding file for qcom,glymur-tcsr and qcom,mahua-tcsr and
> > document the supply properties. Both SoCs share the same QREF TX/RPT/RX
> 
> I would prefer if adding new compatible - mahua - would be in a separate
> commit. Moving Glymur while adding missing supplies is actually one
> logical change. Mahua is a second one.
>

Okay, will split into two patches in next version. 

- Qiang Yu
> > component naming, but differ in topology:
> > 
> > Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
> > has a single QREF block fed by REFGEN3 only.
> > 
> > Mark the relevant supplies as required per compatible using allOf/if/then
> > conditionals.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 +++++++++++++++++++++
> >  .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
> >  2 files changed, 146 insertions(+), 2 deletions(-)
> 
> Everything else looks fine.
> 
> Best regards,
> Krzysztof
> 
