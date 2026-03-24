Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5178D390CAF
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369585; cv=none; b=h9eivRaVnxCQEnBwEst0KQL28Ff1tQJsmd1VpLKNBZ82CSluSjFNQRB0VWHqfGsXlco3M5oWT/+zwuPxxfArDMLc+uhp+uWSymTjBHnH0eP0Sf25nod9yKy/8C7arGR8x91mqXmuHf3M8x7HBfEQp90K3+/u9eTgjbpn2y8N654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369585; c=relaxed/simple;
	bh=6VWhj5fP/Vln8s/FmQfbs+SkMo/on860/XGuUju5JZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJltY+OhpVeIYXIEy+L+1yzCcv/OYId+7wNWwF/vJrR/cXzsa686iKRD3a6GJxMEe1Pv9T1vTEJRD6fRqiyUIaM53QTrjQHOAeb1tpwLntDTx9rUj7IYJdHz8QqgqI9IS8rNxIloW2OsPIsxky5QIk9epZB/okfpIwHhMkDvtq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpROFtP2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKsz1BPk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpROFtP2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKsz1BPk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OEbkUR2488337
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qYMcGVL12sVLD6LswJRJjS62
	cG5yQyLOgBfgiqP9H9Y=; b=SpROFtP2onSZ6qFBxGVgW5Oh+EIZMBwNpmix5jLk
	eI767TcZ4HluH3fV1aXKidI3oG7+0q2M1PS9wztxaWRgHd4ZwHVcgQmvxW/rMm6E
	xrBF8V0qXMo7Ges7VlQ+eVF+0FhQxwvNzlCpgUIjDoX3L+EXp10d1IXecvKSAD+N
	BzEALPn2CqFZJdBs9zrYRKocUwgh/tU1vaZWAOOJ4leudpGV01kdw3q/LRbg4+rs
	YprmX4jaIkQfv/crcevpka6ukyADPBpgkqpeg3qR9N+/OwKIm9WZT6TS+7PaQzEt
	Wh+FnXEY5XRp2fPHyPpqC/2rpD8R6b6gJ4UUBPIyaIW06Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvrfdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:26:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso92572881cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369583; x=1774974383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYMcGVL12sVLD6LswJRJjS62cG5yQyLOgBfgiqP9H9Y=;
        b=gKsz1BPkWpZg0ecPOXbtASFG9cT/hNS3M9GdyhVGPgvmwFSvBU786bpfZ1JgaN5my0
         EbmRYuGlRbLTZ+BK3Sc8Vno29SJbrMD4D//88RN0Sl2wmSqzNst1sKnCmkqH1RCC7jaK
         Wa/+wMPQOoAner0Td+4LlY9/cFfxAnXVdXI21LgT+9Jzuy0gbGKiVNlNSjoORyWSZCUa
         aS+EhuBY3jKZB97PvAfckJMzTnJLXfYalstwe1QbNSp1o87vIgtMC9W+8vQwHX2M2YmH
         fUfHkFMDIVhcMle+Qjo4+7+Ds5eAlVG9XJe0tnhoMaiaoRYf/IwNNLYy6DMG2lgcshA9
         /xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369583; x=1774974383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYMcGVL12sVLD6LswJRJjS62cG5yQyLOgBfgiqP9H9Y=;
        b=l2ZpWLs76ougxbU3WmlVuUSDQUrEMzmP6FhDYmwll3jpwuGkI1UMPlzlR44HkaMQR1
         9D/TIiZCf9GFuXMpvh6WPC/t+i8H+FM0FI6mdkRyK8SMYJLLhw6QbuEA7QSZgqn8VQmT
         HdpOb0dFzbTlxngx9kuFltA/kX1GTi8Ml5a4SN+yBC/HVsJjVxANyRLi2QdnzSc8TuSw
         V+PQ/c+c28iAPelgGzb1bYOVgZUBli2XGL2HDhtXtUjrCqgxV9sx+SfAgWrYVDP/mbxO
         92WBhpfQosB2ZtKJdvjNytKEHQNGX37+REZ3r01diNhvr0XUAF4jApMZ02WP5beNiGpB
         i9pw==
X-Forwarded-Encrypted: i=1; AJvYcCXoA9okFu9he/zgi8WjD9hK8bjGSd+1MwgAE3a0tuU/j6AtYcs+I+zQHdtpKp9ZDErXxcRIUTUDOqoE@vger.kernel.org
X-Gm-Message-State: AOJu0YynF1Sf+DMXlMzPSStLyqKlrbO6ve7WNJlnxLgiCTgthYkIPp9/
	FaWGb/RSQqETpV1wwnACwFxa4bTlxiXH79lqYAs1CfCp6uW+qGSUvsCLUH06xIZ3O+HCrtIFF4e
	OG/MYCCUeT+93xmcs7B0KaSiklJC2MB5glK4lJOSSHzO4OPP6N9fgbCgKK76BhXH+
X-Gm-Gg: ATEYQzzEP/YyVy0YMrD/dNg6s/SEamdso0xVT1AtwB3Buo+07YepSzvjJWqx6AAriSQ
	O4b6Dol8aZvKmzbuD4R2Ubas0gPrLyp61MAiDYjgDHipHFzm6bYUlmzSq2Aid2Ha88H5/6jiY9H
	Ymv8jB33a+lSCZBJE/ANWjPDUa/xkr9V8Z3+ecKW0g20ALbiCKDSIjbGP1yf950H7sDslFW35J9
	Kuy85owBPcsksmxpk6BKd8XvpaJkwWr8v5MFcq/3xE+cu3cdPJox08P4joDxDG8IdUZpnHK4kRR
	EkcGhpALKrE8BcqXZ7H62hkc5SgN5AE459woDFdHQmB2bhDf7ri5Ioiaxrona+SuQ9drgs9PhHi
	zBG2BXtXejdxeAMN1OUvoaenpZJ1M3Go/cg==
X-Received: by 2002:a05:622a:2285:b0:509:3141:312c with SMTP id d75a77b69052e-50b81b0f234mr18061cf.40.1774369582476;
        Tue, 24 Mar 2026 09:26:22 -0700 (PDT)
X-Received: by 2002:a05:622a:2285:b0:509:3141:312c with SMTP id d75a77b69052e-50b81b0f234mr17591cf.40.1774369581870;
        Tue, 24 Mar 2026 09:26:21 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bdaf8sm44763958f8f.13.2026.03.24.09.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:26:20 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:26:17 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Message-ID: <rtlki432tho35wzq6t252na52eaz4tqtembz7goqhble73aogt@wusxa6s3xjh3>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX0oy98uo9M4Bb
 d6P3rw2zRStaTs1NC5PT+rXIyvIO09rhgK584+yxJ7fiwkZ5RfbyxZ7W/J6mRXuoj0meVA8Xu/8
 xhxCogO1WihYYwa9bTUdfKob3g/m7t5GFQ2OIOxMgB9VwUtjvm1233xF+GnxyR57AEb1TjZRpJe
 /IlpjOBKjsmBw/1NCRsrxfELzWVkO/ddS4DVgfyid7vzihMI2d98PHG3b0/azSi7wtlckWZ0ZWZ
 3zLT9SOkqHp85bB34rxElTo/5vCBo8yOitLK7UF6U9gqfRu0/0EAXFi8b5LaGje5/XL9tt5gQ+v
 gV83TmKsVvhCeIaJ9NnxQ9TKglD0A+SBdUql8cFnDFmx5+1MuottYd2MjrMcjb3teBvSOq/926T
 KXZWLKGPqkgB3ixbQTAghvt1sGzstGZk5sxs14VRkbX2snM30NGUqbpMHTjxOq1BdzoNKZFQIV4
 1AauwZmrhTte3P6q6aA==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c2bb2f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TM4ErUj_GH9VF2dpSNYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DzDdeo3tYrTRpeTGqCFYPKuxspjdYW_L
X-Proofpoint-GUID: DzDdeo3tYrTRpeTGqCFYPKuxspjdYW_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128

On 26-03-23 00:15:31, Qiang Yu wrote:
> The third PCIe controller on Glymur SoC supports 8-lane operation via
> bifurcation of two PHYs (each requires separate power domian, resets and
> aux clk).
> 
> Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
> clock ("phy_b_aux") required for 8-lane operation. Introduce new
> glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
