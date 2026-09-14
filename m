Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DC53F485E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371390; cv=none; b=liUUpIzVslDSGQsh2hyspdjJ/p9I0tJCHr2dhzDgVAOOY2QsqAihSXKQeIopreN7WJOHy7uwpEPf5vFkuLopJvlQVgZ+LARN8XrcyjiGQtS24JxcElFU8mibyUpha5UBp82SP6q0SADSSCIky/q9h00gvkQ74hUblE1xSTX57S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371390; c=relaxed/simple;
	bh=B7MHtkv6/yD6oTv/xPRXmsrHOkvhWkionP1EqQHyp/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vnoc8mVATuL5+ZulDQ0lJtYjJnaJ15kgtTFVMa6RlRv/uP37bgy0zFQCUvqvbevua+vJEruLC5+baQ5Dlqv/2u1Oz00yrLH97CsoV5+w9pacQbolks4vALaG/RO5Q+qEsKydjS1GKiL4hTYP+CGT0QnB2i5tz7nOPXuSPBqo454=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2xu3dz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5tUVVIh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2xu3dz7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5tUVVIh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jSA5237673
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tFKWBAFx8JXV/7PZgw552re+
	8TzKSIPCxGywk3k8Ucs=; b=g2xu3dz7cebbLfMA6pxBnlkEhqSkknPIoV4MWKuV
	qvx9n8w6uG2HZuWn18X1ZH99EWGSXtYdW1aHLIDRkrqSox7r0kIEQY07Lwv/HnE2
	ziC6W8TAIJEBcgdLiUPtsXGU4MTES0DkdoJxg8UZwXibvsGyxGMmIlOzvOEMeiN6
	PPKyksspKEnDnVNr3CUmB++t6vNlVvHkXMYT3u8S8HBHVNacpmezS+ULfNMz2vHz
	8+egV6i0Hx7kJsPclgd7Q+N4/Op69xh+Us/dh8jswyzhE2WPHxD2mrsdJJDbBf4J
	pF84FTCAXRHKHt+MSd/o17S92Ah5u3frXTA9TnEsZw/HSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnk2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:36:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0b66ecd9so183159585a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371387; x=1789976187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tFKWBAFx8JXV/7PZgw552re+8TzKSIPCxGywk3k8Ucs=;
        b=L5tUVVIhghYPw0mHdV1EsMukOAhHihbiGCPGRjMfNGLV1sWvkjJA7xuE5ussIxq+AI
         UdO5hg1k5kQ7t7r6HW21WA6Li9f//Bn3PxA162B1Qn3JQfYHcaqGSYoZeZkr0OQ7Fqy4
         wcSxvBJRppUpjeGhYe/BHwkzt8QOSFupingvVZngJOXXaK7z8cbHC7k9NT2JM1aXE2c9
         tOnsOihZ8V86E9n9YDsIndA9foDzmsmaaxPi7bXIs/BvQa76jeSzSKD7brkazdqcQ4lw
         JfdmECByvCt+s8fgrH0zU5oIos1B09ssqG5bI6JFRE8UChNREiJ6xEoZoeehmyYPwCR7
         ldgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371387; x=1789976187;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFKWBAFx8JXV/7PZgw552re+8TzKSIPCxGywk3k8Ucs=;
        b=UvRZae5DNZ6E4M8T3c7ybKsG9l0fmqCdmQaGGHcgLQcL6eD9LCW3d2JFiWPy7drifA
         LHHHG8erf2vnDLje1dJv4AO8wGdWoi4Tgjyq/yv6iFPk8iY34dGe4MTkazivbI9fNPVl
         MrBY3GPOWuEVxGl1kaNFbw8SvG2UkqqVaN3sOcCEcF3PGFDeLtse5IJRdehK7yTQKf8L
         rPouDrDecslgUS5Mxl7tNNOUD79E+7AF+YlT1QhcgZVz3LRlA87lkN0ZtxlG32ugD0Gg
         BJrNZUsTf1Omfj5+sy5XDlk3rcI9NixMrx/7pqcagYUB9OG09FVVRSrWD5BZb2ZLTbii
         Oi5A==
X-Forwarded-Encrypted: i=1; AKwUvBxBkCCW9A7WQ5ivQfut1w79V8ZuFiPf4dRA2BE2oLVb0KrJu8PS3GfYF+52E4nsUncCuxsiaqcEVCGz@vger.kernel.org
X-Gm-Message-State: AFuF++kQyoaNSdAsNlCRydOoAJLz9lFPFdvUhCvsoCdy3Hwg3MyuJUH5
	MWe26pX9WI5bnJ1mtrYmrvhMnmNMpcOPOocFAxFnJW2TDar8zbYAS51By726TE8qxp97MnOfxb8
	x03MSnwGgUppMfpxxLx/+cdbUBfaRJnZjqQ0X6PQV8ND7ogaJpcd02r/GZLHPhwOh
X-Gm-Gg: AYBFou1h7tYE9d/DSzcN8sNoT5GAC5Ty7byH5XgN0okYJ2jz+XVIjh7Fu4A2mDUVXs7
	pOy142tuvwg3ubf58GviSHKEzUtQfvY1Uwj64X3muXJTSCHKpopFofjnnAWjoKynTNpp+65URzr
	05iSXXOVfT+jl0+gUVgohbWPmFrh6OOaWhqkE5J1xkCH5INjH5sTyL/23ZULQChaMYEvPAzJEsG
	rR31z9/gY6rBIfRFX+LnUtzlZshdafWxNcsKNGT9349FucmehTwBeIDjeH2LBoTICOSsdxSAuWF
	PPoZZJdeOLLEBAFdoR2bltrJz94Q5cyiUsPGfsuXYc1kzbwsviUd9ougGZFbhSGOzlF2O0C+nQ3
	Ru/qgNgkLNhVLHA==
X-Received: by 2002:a05:620a:6f01:b0:939:a45b:76ee with SMTP id af79cd13be357-93a2985d12bmr206228185a.23.1789371382255;
        Mon, 14 Sep 2026 00:36:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:939:a45b:76ee with SMTP id af79cd13be357-93a2985d12bmr206225085a.23.1789371381764;
        Mon, 14 Sep 2026 00:36:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71adc2ecsm168052815e9.4.2026.09.14.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:36:20 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:36:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 05/31] arm64: dts: qcom: glymur: Add domain idle state
 names
Message-ID: <fxziap2amutjmlvqpsne3k3iwwszh64z335nymbpmh2o5vbw6o@oa32rit7odgw>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: d0YDKzOKIqtrIUYIkMM6NZm2Hbh1n9HG
X-Proofpoint-ORIG-GUID: d0YDKzOKIqtrIUYIkMM6NZm2Hbh1n9HG
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7a3fb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXxCiEPZb/m7vq
 hds8HLTANXo2QXzXfYJJ2JRiWBeD5+oORJMjJJIQVkTGtukVNZ1WOMEh6C2RuMPIgfXrRYUXEhH
 32LG86gsz99SeUu+6bOIxwNkXjpxq2o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX1+vMJlKRRYq4
 5Y448tCHI941UT/y2OWeSj5KzIRpxx1v9hBUmcCYhQHvGNZPEJke5wgF+43ywHaanbmrQDQjqYb
 NbW95MVDUuclescWUITTXPr9E77uVu+YiMu7Ex3nRsNpmUNhhQi12MchJlaQaBZ4kGDw0/sNCy2
 Nmp68NVMISOAEReynyB68LnxDoE9cZCjjw8Tqmm7IbRITkm5ITL2aFKsEgxi2NVdUyUltDeVW57
 ZsQ3Mu464Blx2NqxoKochyxIXpW6a/EYfUBImU4Exm8H4WAOELNNnJBdKpZf7weNeaRvE4pZpYA
 XiC1ZwOOd5QAoQdYG0YC7cjydag9fNajy8qnpw4eFgWgx2XobL9vX7F0YZOyRkqtb0dGlIpfNgV
 JjcNxyN1FWI8v/+P2L7a+E0O+MsQT6iXM2DB+qucZideSpVbIV5FX6P/egtMfUtyIXj/+/8VsWc
 PD5eWq8/vIsCG4VZ+IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:37, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
