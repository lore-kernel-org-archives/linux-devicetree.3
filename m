Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECF2358363
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 03:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100654; cv=none; b=BHR3yI4hAHXGzJYfjMfX+1Ohqc5Fdr5fMZfuJ85q2tEvaH2EOT+4x89LFrRQdYacFCk83ZBf8SRkjwi4HT5S2SWdsxJdB7Li6b9QOvcK01QkRJq5wTdUYHs1yZ4Ld2nIbmQb+XZG8cA/WXjEA4VFiT2YtYe1X/dr/vASDfYZxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100654; c=relaxed/simple;
	bh=8kIa19Ekrpc7EhaxAZctHPg+VCTd3Xh4jwwlgIM66NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELiSocJqSXYCA6LQkP7w/R4LuT6rNEa0PZLbPZy8dLXdtE9z5B3sMG580hQ7ScfpT159dhXi25p3QcQvKrOiqRFALiEbHRwumCAOBQDuTxbJ0ECzQK4QynmXMER7AbbeVDleOVqPlcNxHsWYscuMZ4kctKbW3OlyHlNoJRqZW9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/LcCczC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzjZJ7SW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/LcCczC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzjZJ7SW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4RjU548295
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 03:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1pqEHhYwMMVIe2koTgQ1gR5h
	4w4HzkgIGLpFjCG7OJ8=; b=H/LcCczCOw4frN2ztYEk2U6S5jJBbBh6YmGq2xd2
	fyOdecXETV5YO5d47WUiNW8WDJN07ia1Vj3qDiGo7ipbfmIY5McG+OApQQuuAJZ1
	cNiTVju1borx0F8SerGcMsGJpIU2zWjP/OdlfLX5PcgMu4dOkSVxl8haOMc4pUR8
	TLxpfIJiwZy+hV5znwpzxqVKSRJaO2XjaOoubdxoeWQQH9m0InautLf2l/YbgTfT
	FtFKgsSbb8O+0cAQERACPJbl2CC6pdUpHl7RMv2AcOLg7dlhDQKgi1H8Z7o4u4mR
	VLyI+/QScLHoVGK3BoT4Hvb9kSRQwKf0Zkl0eEosmEKwNA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d94vvjq5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:30:51 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12a77b008deso2139196c88.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 20:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775100651; x=1775705451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1pqEHhYwMMVIe2koTgQ1gR5h4w4HzkgIGLpFjCG7OJ8=;
        b=PzjZJ7SW9PMMyM/5Vwj7pUOWnMdW+ljfiKDRtYI8vst3BhzPEOEOkpPoiSHmtgvID2
         p/6A7laiidiWP1ZsGtY4qAV+tv1BmrQIJmU5uiVrYjEWVsKJviNTn/DBx5BU6HuISVEI
         m08Z3h3AKuzx8WsGZTSv+2TE1xhdObfwheJwPri2cGLLOan3nWUX/5GGGvxnFAIHK9Pf
         JDGFTlTzB6eP3wUv4uP6XXK4bDxSL9OP7LWMWOcsgSVlwBhScwU5CCJFpusc0LhWYjMN
         JT8auQYxfbQIQVBeqw3tM8pFpwrD4w3uqttiye/mO4RsHaHsotZFtAjxfrdldXDbN6VJ
         8sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100651; x=1775705451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pqEHhYwMMVIe2koTgQ1gR5h4w4HzkgIGLpFjCG7OJ8=;
        b=hfgwYXWxx3vfp6EZdR7KzLDzvEgQbNeglRomsBBM2N5wGrrlpBJTsZ4MmqEmPPC6+X
         7u49D1GLC9Q/sKRbwoiM2YfpBp4zq0mQZwM1OuUZhaG2HpsRluaS4RJUPxaENg5FrdOo
         nyLe7auOMb4jc9VwSUe6VxLtk384HRZ9lqw5Cwa83wSa+NEh2AOxqWVMkM8xtJepKDXy
         z+ZieKMuZVZoCFljm8jB7dEfbLFWjjbYMqxzE2/MYTjNjMPcvVYaQByc7VD7+Yv1NnUT
         auN4LxDcfSlhP1mhws4a1cRlCjc78VT8iA6EZQ9fGR3rvBsKl/Sgx+pVdwVsbbpBfrp5
         Wqfw==
X-Forwarded-Encrypted: i=1; AJvYcCVGpzcbN4RapsdzpHFLc6qUwbF3/l4yfqwxdoaeozxbzO4Gx53XxWXYh6jkAxe0ow3Bg+zNQEf43wPR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1MTM6uXATPCrjIE6YylHafICU5qNVBlWEDKWw9cnkYxthB+3
	TBGrQ90a98UZyEjjrTiD/AG6+E4e1bls6I3NiO04DHn5oh51QbUdg8TVhr6gqoxsQJNWnIE0tWW
	Ax+CYaSOj61qDVTIHMI/9lUxqaJcjaLdK/N23rA5otQiXfCzgNzfV1YTxAHgF42Ml
X-Gm-Gg: ATEYQzxlY4Njjewf66oBQwlrbS6ck/BqKmOXhj89jkzHlvk/X/I+TEPVAFmgl9n1n+8
	yf2qmNjPZPek+N2T2y5EsnaNtKWUg/YP0UR7ksRt+g5N+tVLfbj1x2O+8K4K8uSvrMEzukCIHeK
	xDd9V9To1IXzppWfXPOd8FlqJely6bEjWPfSYVHHk5SAGCKtKHIyHQLYvsNQ3xa6pRpKx/SzQhd
	DA+p/Tg8SkOX3NT4qIu+WUT51n18pZa+Azj3uMZxnIfED4C+IZb3yRSoYrUJXD41dnifec7V576
	ndYtLakps1iZxmc5linxbffHd24ehDaPgmUxtog98AtgmVzmiy4sx0LBod0JmyplJCzLDkHjjDn
	rh4D+lUpRmvFXKr2raigem4zT2RkAhoY3LKmOhxAj43RyAtHhKjJhknPXMjH6CwMm
X-Received: by 2002:a05:7022:458c:b0:128:d5f1:d594 with SMTP id a92af1059eb24-12bee639048mr1107275c88.10.1775100650601;
        Wed, 01 Apr 2026 20:30:50 -0700 (PDT)
X-Received: by 2002:a05:7022:458c:b0:128:d5f1:d594 with SMTP id a92af1059eb24-12bee639048mr1107249c88.10.1775100649937;
        Wed, 01 Apr 2026 20:30:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd651aasm1200374c88.4.2026.04.01.20.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:30:49 -0700 (PDT)
Date: Thu, 2 Apr 2026 11:30:44 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
Message-ID: <ac3i5MIlEQ6y9SNp@QCOM-aGQu4IUr3Y>
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyOSBTYWx0ZWRfX1I9zt0fM0H40
 h+libh0vqQf7a2BihFBh7cxDBEJjW1mmf9Wt2GGqG8HOp4mVYlSbvWQzJuuj4nOZ9vz6nBl3+OC
 2Do0toedmg6Fcgcrme1edbduY5o0ev+LCdptXwU2LeVJlWmuqaS8+CFw+X0R32q9xXC090N/cIg
 J4yss3OSxwNXbNgLTLN3WjnI0OyDHGq4TzXazophg8ElUAckx2z/TqyqxCeI0ixZDkPMvU7uMnS
 Ec+JZ/wkQP8dOv/OA4YOHUoBUNUeo2uSHJg9wYCUtZt5rJCHDyLeLMTkyLNdl/VH9F7gRJyp9YR
 vGthlZf+YVQoj8Tu1dPUyySmCbkvZIPcmsgpWbu421iwfJSq8SwBJJzxDmL77JKBS0dZUdzjeUM
 TM9FG3mkmDrdIQsBJf+SZQqKcyjpj18EvltqH9ORzEElnyix1erSNDVhF3tFsEORWWleK7977Bp
 fLrWo39qs9QgI0+b6qA==
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69cde2eb cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=abC_UhDIVLrPloPe-V4A:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: BHnyjMxTbeHyE-vdPM7QoOllmmThEbB-
X-Proofpoint-GUID: BHnyjMxTbeHyE-vdPM7QoOllmmThEbB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020029

On Thu, Mar 26, 2026 at 07:21:01AM -0700, Gopikrishna Garmidi wrote:
> The display, peripherals (touchpad/touchscreen/keypad), usb and their
> dependent device nodes are common to both Glymur and Mahua CRDs,
> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
> reuse.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

You may want to have glymur-crd on the subject prefix to tell the scope
of the change.

Shawn
