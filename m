Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4BE3E3C65
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348688; cv=none; b=IQYw7SXnfVItlw3N9g+Ii7qnW16IeINR6ajVBj0CDIwnKUOQNRvj6+2raDkVfkBnhExL87anh9tVXKTK+240zAB31KTFCZ+VMwTCTXIB42oa4o9MmBapHac+NGuQFF9A6YMHuRQiAMrpdEuZyv6TEzeeKwRiXS50rGs+jscMQRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348688; c=relaxed/simple;
	bh=4nTSkJ8Z5UP9+k9ovEKnp9OOrytj8jQs5RhK5L4WIcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRZgTauoQTjDGh16nLKrOWy9fDD0CY9CtQzCRvhsBGSlrbCzckTw7eZSH38euUipUCaAn0ToQtJmpwkIzJY/YWLHCpLLzZ2v71JBcrKrlqRfmzThwLOHB3oiQDlYLJBqtpKHPWSLSDLCd57bJf8bBvfRimHN/tgn3PBmedCEm9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O21yC/i4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jhsj/DIq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O21yC/i4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jhsj/DIq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OA9eih890492
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJrGXDFrbMcwpgod7t4kbx8Wp/kOz6YdHGYxpUusIJo=; b=O21yC/i4zNbFbVtI
	xYRM2lP4HpI/UT+wyLt/2RV5Fa/rchBDfSWFTGNqg1AfP97Ef6y/RCZIw8CbCHHm
	cLXEVAaqFop3lnrR0h6IG+k7sTE0epUkp+c5BflAwlvn/rPDzJ5FkuL+vhK61GZc
	oGjJZZYCSDzcRrcuuof8TAqAbxo0gD5By3F4d7NkFvVyXJp9DA99JFNcLmP5hyzN
	8FxMj+I9h/NwjzXpQ9Fa5dc1pDUbxdD6v/TXXiyRBUeJMzhrk7RFVM7aRLdSrd4k
	WVMOseoFhyi3pSQ6YQRW2UeuKYCdXDSTjgOTuN6HK0ZlIt+8X4Ont8lRf+Eb15nZ
	F2tEag==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1x9dfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:38:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso4703055a91.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348681; x=1774953481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJrGXDFrbMcwpgod7t4kbx8Wp/kOz6YdHGYxpUusIJo=;
        b=Jhsj/DIqCYoqy4lZZ5+2DmTLyD+y3aU9zVJUq4b5Kn79mD0xxiw7/b4t0BL/pIAfz5
         /YlQXs/ynEYiX0LTwErb22Y+0RxhUdg77M5tJCQIrjGQRw8LFK8UQJ1Fp21P3cg3sLQr
         akAOOSl8CU+/hccTdfhSutMm9ogBgGX1+5UsBwos/41zLsl73qIPxc/egrGKEGZD492+
         4+ruXnQOX7/EeVNRxOEuR21r+tz0dXyBEkS2J3bQn9SdkWmJ6YieEh0+jRv9DvmE1+gr
         Bn5QcTLUivPRcU3Wq4wHovXNknAtupbpE1TFOhKfc9M0eMhkOyqiLsV8MTTGR80KmNGh
         AyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348681; x=1774953481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJrGXDFrbMcwpgod7t4kbx8Wp/kOz6YdHGYxpUusIJo=;
        b=a69k+cOIGaC3xUsy4juNnF3KLFw5fX7kPK0sC9JnRv6+meG1jU+msgK8wBOs/b686M
         U5hR17N3Qfzf4Q41/eYuOsHmlHyJHBu8CO2qKld1QJtM6I+HCj5PK7PxQMyEAeCjtyum
         l0vW/4R6+LOo8aE0gR91+6adtoeUF3bZbKCAQiCN05Wd/fRMylhGK6RkHo/O6Hu2CgZ9
         /PZ9J045zZPBF5cUbJn6UXwxMErKUsXaZYHFVIQK+xAmcm0dE1gIBcEfZxpoAysahO3J
         9rDDWT4DSLU9CNecqzKHq9pksbjmGZOqylBkDiBztRh5V9GeTtll9Ep/xUBiD9oTLibr
         IjEA==
X-Forwarded-Encrypted: i=1; AJvYcCUOwj7aFaCFhp7qv2EeZJwhmUjx2nu8SRu9OMj5QG59V1I9TZB2p548aSIbA/zlFeMmOwuM0J5e00ES@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkCm2BmMOLieRc/RS/fZ51abztAGgLUyKKz3l66tqiiNtYWNo
	Ymkh6bgxDafrhT/SvZyR3ZsvSOvchUajsbRJyzll7piB+kWL680ICxMI7k/LGlkuj+gJoaLj/iI
	ZtdMKnO2wXNhFESQC7j5XKxJT18syyZofwYEYYYaORoLlld0/70/vh9mLt5EFLzdk
X-Gm-Gg: ATEYQzxVik3NLeaYCmiT+AyDTFWuRNvbZ/juPbfURKSzZmi7tE/jymNApE0R2ETXfYm
	Y+3NljJpWNFePD7n6ZSFUZFEsJz81f58L44On+Zv3MwPelNNJCBqjvK0ywsD3xVe0MySlU7+gZo
	0vD6jqXcWoBBVqw2vaKRKeJ6y2paPsPZJMzyi1Ril8HqVIAuEG8ThQBUQFVsH002GxVw4vNh3yb
	ZhRS3etg5grQaPbnm12JnJh6j98hy0gUH1klfvQ2U9pCiIdE7uilAbWANTypkD+qgEBKJ6VfvD/
	CTGkU2U8dp5nKcyyl2quhBVFiK3EkfT7/GQb9wdN0r6qk2NjoHcExkAvK1AZv/TLt8sLIDwjOBi
	gFbUGfdzT/E1HGGXM4G1Kun9TMDHtWbExShR5BNZdSvpXK9XOWQax
X-Received: by 2002:a17:90b:3943:b0:35b:a760:1a54 with SMTP id 98e67ed59e1d1-35bd2cdae76mr12688971a91.18.1774348681442;
        Tue, 24 Mar 2026 03:38:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3943:b0:35b:a760:1a54 with SMTP id 98e67ed59e1d1-35bd2cdae76mr12688928a91.18.1774348680916;
        Tue, 24 Mar 2026 03:38:00 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124a87sm2468107a91.3.2026.03.24.03.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:38:00 -0700 (PDT)
Message-ID: <546967f9-05f7-49ae-bfa9-204533715eb3@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:07:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] arm64: dts: qcom: kodiak: Add power-domain and
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
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-7-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-7-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfXyojUaDu0/BDG
 0TMxzk0SOlnzMuY09ZqD3+BKB3CyGxAm8H8yS1xmxza/MTAOahYHO07e2JU0McdiLYVViM5qJ54
 ya20H0clNLESB4j/IjRNmxEimpp1h2txt+BGEIZ1aR9R785FIE4Lum62p+bTN5azblzeSBv8kNY
 x44E3E80jEujsQF23QIcbLNpyzjUiSUvNpcxt4u2FMyT3YxHPZKH3/41MejWeQ8RgW3Sw2y99x2
 LmmSIs9zjtyNAjuG/9dA+dQ61vnK/fsz9P5+6cpFAEipzNx4Yz5gSPPJlGIE6iuu+ASjLaXCGya
 MndUT/T/FWHVKa5kCRaBGXaIayI7U7g4Mya8/PfasDZHT2NO1a8jucmT+VIPPcXoVheIjk3zQhe
 2EwKYacZROZQg1NxEwhSqiKZ5ef2SvfVqw3KTplvznIjvFmgxDl2enG14L8c77LwH/n0e2bTty0
 A8rCsIqG95wQ1+8Zx2w==
X-Proofpoint-ORIG-GUID: 5u99x7rwFTVtef8vym04KGfQH7Zh051z
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c2698a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 5u99x7rwFTVtef8vym04KGfQH7Zh051z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240084


On 3/23/2026 2:48 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> kodiak.
> 
> Fixes: dfd5ee7b34bb7 ("arm64: dts: qcom: sc7280: Add inline crypto engine")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Tested on qcm6490-idp and ice ufs probe works fine.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

