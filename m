Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1161033A9C4
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776763687; cv=none; b=Y8/sg+lcuDFu8gGXC1MSWCv7ZogFNJoCCqGzYD66Tcvoqbqp0JkbWh7UYO9Ea8nKS3o6/O1GnIgFTVxKrrE/IW0HsHKV8k7/WoWp/dCRCN8CP7uMfptxADVKnbvsOyJHEG/6TRq/Tni3vl6TjyqZR485v7IHcoDR16KvMGdHYZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776763687; c=relaxed/simple;
	bh=ZNfISKpSCjCGscK8/Ib7YAmiEv+e/c+WMOCf3R0g/PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDJ/iO8MjX3YWV/LLuiiq3SCYBHEG/FjmOr8WEF7+ZZTKHnxsLpeKzGjfqkgXS5aE4IUGqLEagbI7vmZkNsErw0dIq6WZnt7KlQKE3kg4WeiUJhV5PBLVqI8r3VGBHhcn+kgRlYIPOVSprGypvU1PHmKcT7aH9WJQE+YIkN9bc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSqRt6Zx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4mQi31+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSqRt6Zx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4mQi31+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6eTdC3574256
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XG0WfbWW1KDOp5vpDhXYtbdAi1HkcHqFYHF/2b8RrvE=; b=JSqRt6Zx2TClGGPY
	pZEMExS6VcQRHcHEpVMr/j0SPz/WC8Xi9eciiwDm0NptLMro2QP9hPghccAbaeEB
	zEXir5DaIo5+ifXjHJexGJLSHcmYAQ3S1YLvce7BdYigOgDPtSBsNmGZO4JNGpO/
	Zd53XcYEdtuNerSMa10xiMW1BjjwLaRydqfVgkBhYr4wGUHzpn/IqxCprRSZBIlw
	DuXxXi2Xtsm/ZKzo5NGT7hXKS5/lQYyCTDwPvDELq4PDTi2K9aK2eN77FM+6Co6t
	ohQiTqvqlocMYHOhbPccrM0TgtJenAI2+Rucws+eBJQTLSapeCMHN8oJ+ugCe+xF
	ZBjVmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465gmtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:28:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso5445000a91.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776763685; x=1777368485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XG0WfbWW1KDOp5vpDhXYtbdAi1HkcHqFYHF/2b8RrvE=;
        b=L4mQi31+prlrTIEWlmHNbZ/1ivELseYWdY/oC/U4gCHyIfGAkNrgdLZtYEdbUzhBzF
         ZKRpiY+UoSgR2UVftLv7dWPtJcijdEcftPrMXQZycxk5uWED37mh4xZt1NkpXXJe+5Ll
         EN2zU3w0TryPpfC527dNnHq0M3SdA+0CtzQv3AzbsKBP+lRL5tKad9SC3x5W0OGf9Iv9
         14FaKZeq2pLhZjqO+xsE1VbmGOBOMm/n3x1RYz58CtyUFecf81VVuEA4X+9g/ZK/osvT
         1SWuRRF+GauDYBhk5GKNtbzOMQwfa7qz4/8hkSoszY14BZVpYfiOvINDtlkV0tv8HLuZ
         EoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763685; x=1777368485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XG0WfbWW1KDOp5vpDhXYtbdAi1HkcHqFYHF/2b8RrvE=;
        b=jzRLeN8JszezTu+EmPCUlaNUWPn4HfjjnHnhPm5UuNEvhBnRixqFs/IVeAYazIWehH
         eidLYovTm3LctKlg7BvxOOcp9HDsmLlQnBJJG6R1d5GrtwhhXSFfMyXd5704j+NVDhhH
         FGad3auQh925fNxLjYKfdWtO2kmZBOUXe1fKl+evygFyhgBLU7VPxkHWhnvBFUszdd1R
         Me+BZI2pbhaX5U0hiqQjb/19radrrZ+N87Bq4tJHE3qjYMJWTlzvib06moxTMHawcKKP
         xIhM4BzcbsThG9wC2RNFShNv/e3qixd2SOGOy4p1qiFSWVHVN/WtlNEINCL1bJQ0aNFh
         3NUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oUR6XLV56q24/Nvq0aKz2VQgFKjCIIaQzeIHMLbjkVbjqar12y/9ZlQ4v8numTgRx98ysEQ6nDr1E@vger.kernel.org
X-Gm-Message-State: AOJu0YxD1ZuNVAEoDeSc9rfYbe+yGRi5ADGn2ABCejAu+RN9/yz89O9b
	g9VPv60vZeVCwZxokyJu7P5i3OG8zYPsCH7/hzB45n6K4I11r+aManogsw9SsJcS/AkBTGJyx/+
	woJHqOG/4JvmSHmuEpDblf3oMvv88EB6Bf4IpSAfj190DKLX/NNCOBINgEzyZhbhl
X-Gm-Gg: AeBDieuGsDjtyoKs2HibjNAX7859YbC62XPDpoP5AkAKN83lzMqd3m2J5CRaP1syvef
	coj8akkY6EikV9nuLzqd92Sa97W6HORLCWsKwSenAtq2TDYr57yrJ3MeA6Pfpdd/cjQqVBLIXF8
	TBdlExOLAm/5gV2QeHheXzzDH+UW5ekfxwfcUMo46WcKf6/BXa3JPG3HsYNM2pXGq1IEyb907ST
	hOMz2m/WbTB8V7SVwux9QeI/P+Hak6EmOzkO6dK+jddlWBpr6n1GRfhfBBTBuE1VxvVEDaixkLW
	tsDPr2mIgMu0srlpIBsLr2sHAh+yorNeB5XCyuQw7Alfib9VG/jRxd00oC6v4Zj3C2GFhJI20vX
	84q630Zh6RqbxNA0tFTTEXCJqY6qVcLt7EBlMjyT4a6aN+mhEBfkLxa9KoLdsRs8=
X-Received: by 2002:a17:90b:394e:b0:359:d54:846f with SMTP id 98e67ed59e1d1-361403f10f9mr16859868a91.7.1776763684511;
        Tue, 21 Apr 2026 02:28:04 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:359:d54:846f with SMTP id 98e67ed59e1d1-361403f10f9mr16859847a91.7.1776763684031;
        Tue, 21 Apr 2026 02:28:04 -0700 (PDT)
Received: from [10.218.21.127] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614198f775sm15294860a91.16.2026.04.21.02.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:28:03 -0700 (PDT)
Message-ID: <743ae20d-1894-4566-992f-db8dccebee9f@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:57:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] arm64: dts: qcom: milos: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-12-5ccf5d7e2846@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-12-5ccf5d7e2846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5MSBTYWx0ZWRfXzxPLGQhAGCd2
 5Vf+nPhGl7Lk0SwuFT/SzZNIMSVsX9HOeF55K2hujvVbw8h39cUteTtDZD8CWG4KxtYGsf/2eY3
 4Y7p8Qjc4q6X7v4CBfs3uVa9tJO/nRfTqnEIaxLHbjrNAjWeJhicfYlGSGBn2+FJIl5uL52QTMU
 3dCpGibyX5USembPQsBnEcwaJse13WHr2sOCaPPO9PIPOptjqtK2RhsZoLmfRZsq5j2dRsMzuxo
 k1t9opoQJ0rY1gfLrWYJwEk1/gVO4YRXe9SYsBEkh6vB1zYcRoOGKErwPcLMMvkYU+ZAJPGVrmn
 9L7Z+eMiWF5MBT5AN8LWZqqPh3gWu2655F8eqNyhwPlG5fTpnmdugrECZghI5M8n9sg55Pn4fra
 tl9E1whXLD6ryCeMsygJ3yNCEGK9V/p7K8PqrfiO/45wRBHnAp1U3RAOO3I7MY8RCCPRQ8O6gIE
 Hbz4x6LbqUMX4fXPbmA==
X-Proofpoint-ORIG-GUID: wzaA14NgCZHF_wenQid7h1lWhiyStvsA
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e74325 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: wzaA14NgCZHF_wenQid7h1lWhiyStvsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210091

On 16-04-2026 17:29, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for milos.
> 
> Fixes: 04bb37433330e ("arm64: dts: qcom: milos: Add UFS nodes")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

