Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B87F3612F3
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638575; cv=none; b=a9WF8u5aDW2+bti32V53FUA9nVXbp4S/7CALQBiQPtQhpqnDhIeDUDLinNOPUk5K7JVtzk71Rf+IG7BNN0oyn2DSiNrKFmwm3GL9fnp7hxH/+6rmyQXltl6kLozZcumQM/b67i838uGBgeH8lRQsbSzVnXch5MSscOi088VcS+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638575; c=relaxed/simple;
	bh=eYiGtWqY/aeFFUoE6DN3f2/d86U+6lEN8ErqK+mx1DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tmTqzOWDFSKa2SlpaV3Rg8OblcB1VTE8Fl9AC3zleCvhb0sSTNCmlQUDVFUnzqBkBujcYh8N69ELcPCGNRKXAyU5afvrBQRSo4kl42/Bq8gMNfrohi9wXl2Dwnx9aSNYgiQeFAKAUpvpCtZA4dcEoxgt0DjbwXaTm4wMVnHg7KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZ7QnZBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fr2pv3zR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZ7QnZBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fr2pv3zR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63863SMF249516
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 08:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8Orj55AJRLp4aqTffkLv5tWJlv+Gke77k9Hqn7YCKU=; b=ZZ7QnZBs+EhrtxnZ
	u/pOUUB67by4qmXmld8erxSJFYajgYfrHJ/rZ+kLT42y0uOSbgkiMPnZm6//D271
	J00dp1C+uFOkrVVMkwvU7HxRQGTFL3gRGWmJhTiEhXUULlnUsL2edLTheOQqxZzZ
	Y0mNZobSehETpR4cCqeVGiMbHWZzIMS9v6TZLAz9Qz1HqdDWgpLf5LSXw5+3bIvV
	B1jaKukjKhCsCQ/SSYeM3LHQNPEVU8Mj6Jca639qFWzXc928wEw9Cqhn3OGjPkJ6
	EfChWnnhF+XuCACMKdVaYkkvA9GjRWzCn0HoquKqxmouEMS8q/gZ7s5r74Yb53ok
	gHy/Sg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x9a778-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 08:56:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89e9d327913so23752226d6.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775638572; x=1776243372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8Orj55AJRLp4aqTffkLv5tWJlv+Gke77k9Hqn7YCKU=;
        b=fr2pv3zRBS3IrcIIp589b+8WT4Lt7Lnvmop3BVUB9a1UkMaqAmTFmo+iuLUKKTQ4V3
         2emQw6fvVcj7z0xuN285K6fbLiPzngvePDi7lnUj/nn4evfDKEZimQX9ESOedzcg6SYt
         0YWRWsEcThA9TkGGawuKYO4WxYdTKGoyzBQQxMTpxGOAukeTOajEc5m/OBS/BYMk3XnI
         6dFIiS7MBEtA5On7Fnpnsh61L7aXKBgHtVBQSdA4ojGrfw8ArV740EAhCU4MONQKKMy9
         QzWx9oiPJN3dBXEb3dGDiNhc3blx2EICysaVUIU6am98P9Zgf34Uh2J/6n/enrWI2oXa
         U2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638572; x=1776243372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8Orj55AJRLp4aqTffkLv5tWJlv+Gke77k9Hqn7YCKU=;
        b=qwgUHhDpEiz/VMFL/DPQ+90Omvw5kPq9nx++ugR3kU/UDk0G1mrBS8QjfRc1mpYZOM
         n27T+vobKULLeafH0Ns2C0/PxT869jlweN/dQSLFL2nT7LgxpvhXS6+JFvNaEQNeWn+r
         Cl8G3ssL+gPbHJfYr4UTuNP0sgdAjgjuNnASMluFZmff+N6zZ7o2adGrcbxrOMZ2Yf+m
         QMPIEOSeHi3oDwpp6lotVE9XcrEI9TkRU5rD/AlkpTPKy09355Y4H/QaFkSpf3oKThV+
         iZ8eL6ujGEI+EO99Ii+K3Obk3xTtX975iBwLooFRXKPVj2sD71R/yUk7I3TyRyCF0TNJ
         EMoA==
X-Forwarded-Encrypted: i=1; AJvYcCXBfsy/8/6X0a+EHTvvtysr41tlY+OXDx1GjHQfVt6PgWMfjrJbBo+VyU5cxE2SUelimG/mR/4vNo25@vger.kernel.org
X-Gm-Message-State: AOJu0YydcT2E70chlSv74RMyqw4fUKrql658vUbgf3TW+y3l4xlqGj/r
	KcmSi+DdwlDFDcmTwbrFbwe47/lBxmJqATUExxKjyitEpqTuJLfebivBs1yIBreeBPmgRghsWKy
	c8rVaa9JqrK/GPR7Z/qdx0w+YRhLT4oA69VTiPXUWwB5ZQgqzmYb8f/J2JfrNer0j
X-Gm-Gg: AeBDievCpTzGux6/csNcNDrJeX8VG3eMacgOB14M9id4xlxxPkUJ2UFcnOb9oa3T8u2
	QehX4q4nqlBUuqTrOmewcL48i45CXf5pL24wtQA4HZxGYodncwr+ZPns+EKHMipYQgsLkJYobid
	m+n6p4eR0+wYdgQwZyBCWarJ7X4wlMQC8NhaZKWLozxvHBeBtOWj3AZFZj8JOAK2uOaNOoLZE5y
	2vUjjHrbf37FTky0CahPh/a6gwzsP2Nz+c9iRb31Zn1b1qC2v3VXFDH7G3uMnRG02rM3ADyHvj3
	p47TClYAXNO7uN8bP4rD6HSPRo7B0EYijouV5Sj5wBEoyKYLr6tteAdnR2oIgd2plr8QOFTXmNC
	LFfIRxAfQQnO/POGlERCuy3JPEdjUOIZxSPrZFjNdnf2Zhrq3eUHytwx1zawVi/vZyoNG6+nSdK
	zK6is=
X-Received: by 2002:a05:622a:7292:b0:50d:8667:6829 with SMTP id d75a77b69052e-50d866769d0mr92871251cf.2.1775638572243;
        Wed, 08 Apr 2026 01:56:12 -0700 (PDT)
X-Received: by 2002:a05:622a:7292:b0:50d:8667:6829 with SMTP id d75a77b69052e-50d866769d0mr92871101cf.2.1775638571868;
        Wed, 08 Apr 2026 01:56:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm4860879a12.16.2026.04.08.01.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:56:11 -0700 (PDT)
Message-ID: <4de63324-2f66-48ca-be1d-e8f20e8727e0@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:56:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add default GIC address cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d6182d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bid7TPF93ZdvqAF1lPAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MCBTYWx0ZWRfX/t0XzMMvjEVc
 TThYeEVsvLe20BQ114nqP8EvisCpzmoD7zxLGDx2rx5OVk/EqjB3bOb9+AE60NQmnG9875ARbO5
 GVd2UT18e07qj8Z554xZPNMxAMhIKvJcWK+VlukXaxKkfm/bHjUMQxAdbEtTPKCgPqzy+zulN+h
 Y1mn+I8iINzW6otQ5cRGwq9aOe6qRi1fOaoJ27tEHF0I5LAIZDyU25m2zl73CQXmvBMCiFMiy9l
 YQ+BIlBZb4hZ5VqmjOqQu79XdL8aYwXdBXHP8wq6faxOj7E0wVSgCVBPoymhpY6SbUtlY8OrhvI
 Ij7eijYMJ5kvNqZqbY3pRrU719Sm1Yu8NUO4ZtN2qKCoatSl+sUrWfVdIu7I9lNBR6bXvryefxf
 dKY2M/c3drdqbXowW2MkiSOnJ1EwhZAG+ejA90y9sEEh4JcGmR38l3s9fQEepxr4l9Vt8+PK60X
 4P+50z5hZpDJx9MXGKQ==
X-Proofpoint-ORIG-GUID: xYDeYhtc1dY4KyBfAKySa8VZrjTR5xn8
X-Proofpoint-GUID: xYDeYhtc1dY4KyBfAKySa8VZrjTR5xn8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080080

On 4/7/26 10:15 PM, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node to silence W=1
> warning:
> 
>   monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map:
>     Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component 'parent unit address', which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0).
> 
> Fixes: 46a7c01e7e9d ("arm64: dts: qcom: qcs8300: enable pcie0")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Fix for v7.0-rcX.
> ---

An alternative change would be to describe the GIC_ITS

but for this warning fix:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
