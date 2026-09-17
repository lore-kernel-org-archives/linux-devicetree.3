Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EE2598BF6
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658135; cv=none; b=tppyZCRKRaN28VWYtPYQH6QDkgNx5/2fZE0IG208ZRxwxdU82FHKSHhBn827/flKjduSxI2zRPjblV4Mpiw7ZZltVBTa63GbdSSvuY9Hdi9xJe2rL+GPAkU103fnxViu2Qw1NrV8KBTpnzdWLjYtgxAshVrMW3L4uVsciX0jBCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658135; c=relaxed/simple;
	bh=HWTYcYmqxnMfOvc0toVfLAh9HcAZf26tjOq5sUKW7ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRVds35W/PVnfu00PXdVPA/8PxOxMyxeEh5xUsdu2d+gxQA7xpAbKiS9LYmqdlvkKr3+DT/yZSPXFy4KICQT556wsnqW5URBWCgZzf/+ocMQEplNsnkATIIBZRy6whod6s8r9hERv/ePNgEieEpNKc6khZaZFdBqHNEYtXKML34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO6Yq6Nm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhQxwfsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO6Yq6Nm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhQxwfsc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HECl5w2496784
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fiKuRho5vpq4oB0Iyg7qtY/3
	GWuotzNlqShh/ODLOOc=; b=KO6Yq6Nm8LNj7p9Z45l+BYAzzTU9HZT1iv+8OoKu
	5TbzurtBQG3TWS3mEiUffDGQzlgiOZZlfjUqxqqjKXPg9bbe23RD6esyFhYHObrb
	HngdSGVSqR5YD7r98kW8hwCzRMRZVP+8fshgxANRaXXXjvZE30onkzjul9FMZQeI
	aJu5PrX79l1+XCtnqewDgpMrAlaly/eNYquohJmNjKA0dja4740VAipbLQ9oZ0ZI
	Rm/m3UhsTGDgiWqt7KOZsoaPwYZeBtaM9CqEKmTjSGLIDAyuYJrZM7zdg2uaSIHm
	4mDxIg6iB+ZibwIB7LbQeqj5NTA0OLjQdHFcOCNfjwA/2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6g9wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:15:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5304f2b5946so17680581cf.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658115; x=1790262915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiKuRho5vpq4oB0Iyg7qtY/3GWuotzNlqShh/ODLOOc=;
        b=UhQxwfscjnPPuol7K1D3UDA3nftmsuAYpUUN/KlJhkKZsAPLsCahqNykviL+QvV5ti
         IDM/1l1FSyh0RnneFPtvd+Ww8Q8cDA/2vIgZ+/5smtAydgudfBkgmkMdclhxkKUeT6ZD
         mvdvrKbP7c2ykBbPeCE+yjoIHkaBd+RHRd4+bRiDDHf2BqUgfVY7uJh1s8IResozx29P
         hKek/eyoBrpeSbSQ0nYtTVo5mcCljhS5BkFUMSiYeWmrGf1bVrdn6qmz5nIao5gTMl/B
         J3Pm4lsKelFonR9/nA6DdtyMH75RaUus4g+G+00JaNfsGPHZ3v4vRTMBid3WUWWxgAc6
         zUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658115; x=1790262915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiKuRho5vpq4oB0Iyg7qtY/3GWuotzNlqShh/ODLOOc=;
        b=KdRoWw/UG/4NpqdQWhqpVGlDJKmxU+YyE73kF0fzTqYqdZzobmZKjarGLCtqwdu5+7
         3uDd7C3QqxP/8uj5lVBiwZ7EptnmDuO2jZR5VU7Kpaf3/dX7GIAlx5HXPe6r4dCqxfpM
         /dqVoj3AYBchdO64mFib5aftQK9NnfiTwRDzBc5kfb8thZW0/2vbqmBmf6e7GTm7lYec
         OB3d79vaFInfRt46Z/y5uWAMEX3x/coKZZHZM+D/jn5dKnljAgNEGDzYybjGeRHOMdPd
         ndGf2b5+rw0ZtUS45WeKgJJZgSSEum7rJ8i79JMF4aCMHrtQqs/ZY1tGEG/nAOBtB9As
         zuhw==
X-Forwarded-Encrypted: i=1; AKwUvBzNKDh5gLYFPO1Wown2YUCEE9FzHQZ8+bzQoTY2vE2PYo/BokXwI6XFMxaW+TTgnmrh3IqbO6ZEd28J@vger.kernel.org
X-Gm-Message-State: AFuF++n14Z1Dwo5YRk5j4KvyE//0PMZZpln+2tslc0fAWnicLdE9nCAb
	BoMfj4el+VVezadub12LpwOOshZDKbkpPfpP22bxzr7+M6rW8ckTmOVtYNSQ1swTCn2ZMME5J++
	6rkEy/NkrYVdjxPC39iNpoHc77XIy/QSZ0q67xjsI1+oqygBJSVXELWwL4I1naqMI
X-Gm-Gg: AYBFou1Wbv0u7Qc2qqJtVXK/VqU1OdSW/fWx5i1/ywI1rZD6OWJ4RfKAltonjNWddpj
	rXEy1aUSQ2LBfRMFIAQqideiOlV2bFI8tzHQHaLa73E1xV1o060Vz+eqCHIiPJeAi8JW6ukb8Ym
	c2e0qg7FuKskPwTrR4N0+RiLlhj/GwIijg9B7bgRE050VlYkDZE5f8VqVjqDR2WjoldbJnueM2t
	/PM/ky+ZurzSFWYuJlGlXgPFZoeUiVkqouZulBWY7QsK6PcuTWX6O1wosmpb51+jnTPoCvYFPjC
	5Q4/AFCMgpK2eEBEfnelEkaWhvTU2FVM/78Y1sPPj/wT8CwqpKTrUICFogDX3FOakuGvCRrsakj
	7/io6uCRW+71gjw==
X-Received: by 2002:ac8:5f50:0:b0:532:9adc:63ae with SMTP id d75a77b69052e-5329adc72b0mr11447431cf.63.1789658114753;
        Thu, 17 Sep 2026 08:15:14 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:532:9adc:63ae with SMTP id d75a77b69052e-5329adc72b0mr11446811cf.63.1789658114163;
        Thu, 17 Sep 2026 08:15:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2563ccsm102251575e9.13.2026.09.17.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:13 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:15:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sm8650: Move PCIe phy and
 GPIOs to root port node
Message-ID: <si5cdl4yynao6fdx4mtaiccoryryxtdqgy6v2og4zln5q5e4ew@hkmsdncacbtk>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXwlsEvJ08l374
 nCLwmOQBsZvhXLS1pJaicPcrNNxRVoiBa9oUtb3c0L78weSPZHvj3k7zh2Khl/ZY1Z2i7gHKL1B
 QC/7VrdxLwO1VOdGY1YZms/ieId8AzirR+AT1K8e5cGQQgdq89bxwR5aMafRM44rQjeLPCrDJd9
 U3sWcgL62NtglE5sDCgfu2dgF19mCeZo3TyNyoaycmt8z4hrxBJu4UrSLTSY2L+vM1EvGqrAlg4
 gaTBB7rxGP8dvcD7ImYHWrwgqN0oWVraBD1I+n0Mk7s+h1vVnzobMJReiIwM6C7mkarpM3xsDkY
 IutE1fOJ/6/dijfX55bzf9Ryu10fEGT6bJuAg6+ld0vFykj3lvmMDBkOHy76frwZgLhkVSSyiib
 W5LLxGbIu6VYUAs+ArfkteDVorATB5LugoOScahPHXigTn3yK8pT1V/6g+Mfk2CpdLDD0DLhIZH
 kLGVSq5DAbdcrQCnk6g==
X-Proofpoint-GUID: 00FmGsFLwKdqF8AbkqOwB5vBHPbBXNdw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX+Zk/R/qtE3q+
 gB6ZccFB3+pA023c4dfS7V88IZx0b1j8n+b1dcLMvxmc8zE5ycBsoHh5Kh2dwogA3hrPfHcZA43
 1WgI+aEIcQDwBF7G4ROLJ2EiZpKQDpY=
X-Proofpoint-ORIG-GUID: 00FmGsFLwKdqF8AbkqOwB5vBHPbBXNdw
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac0403 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:26, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and pcie1_port0, allowing board-level
> overrides. Move perst-gpios/wake-gpios from the controller overrides
> to the respective port nodes in the board files, renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
