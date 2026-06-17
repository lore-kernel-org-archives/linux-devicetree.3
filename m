Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2384B8DF6
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781715891; cv=none; b=kXU9HEgfUvQq6hNck8tQeuMbAN9Ov3Tuw7kg1SfmYYTy5g/e/ivSRSHUTB69pDj9/KwtvnMcjxzB+olb+fl1L4kGehybLa+mLYaT24HsoCbrYIWIY7HuQkTPCP9couIVAA7vrfqXq5nyxR37xt7uzMhFytjmpqVCLK9A+B0pReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781715891; c=relaxed/simple;
	bh=6ZRmXpEHJbpqKN93OaRNsHjfn+lhlrd9jdCdeeQKlQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkLgokl+Cq2sWCWtjHHWaPzFGq8rAirTG2OJyOz04MhOGdaOIL3zu98hpMzAd3raFCDO7OeZ+TNAgBkqDXQSGaxOwNVcOLnlylKCV33ZkTpqQpuImHJRUIIry2kGNTW/sCSuOcfkvVATEY94xwtOfFBBhR1GOoIDoM5MvYUVtag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6fR/Mdh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=it9X8ows; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6fR/Mdh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="it9X8ows"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFohts2731411
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/zsHYT/VLV15pDa/l0a4Pcd2IDfua2uu8jZoLR/3PY=; b=G6fR/MdhCJGdaDmj
	+t5ajrUXwnbJ0Mksf1Cew0PgkbVR18xO9TY9siqMZbKIkP/WWa7QKLMmPBQaR3Yx
	ExX9sAj7mODOTTmD6wgZzEuG0M7uAu0mfHUkARFFo+7cybncOfrqVw8OBNgKBGTa
	tfNWR0tXXEHkAqnspuykg9qDua+0PPrBDN9xjKHBWN64+CkkjcxWPi8S+S+9HXV1
	+QuuSrjHnsidvFTseFC3fAtriZzW3OYC4ohIjb9A1fbPh7g46/+iTmK7QMkOXv1h
	NpjzrR15d+RR+moBhFykgOU99ZxxAymk8zn3H74CIeJ4TvNAdfw+1PmdNnNeaJct
	Z7XzuA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2c8mca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:04:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915737aaf0bso1043585a.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781715887; x=1782320687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/zsHYT/VLV15pDa/l0a4Pcd2IDfua2uu8jZoLR/3PY=;
        b=it9X8owsfab84sSf4vNCbtU6PxdfIADPMxacyDynpxcng07Mvum6qYrh1dvS0fzuBe
         VdXCGwO7OOUWslFbszOLUlHuSMCebuWiy+hB8IFpK7GY8wWfe5EOpg64LGkxRpstXdVB
         vYW8Bma2MBxErPn9/c9lwqHKe3nSxjhURySalXPrCVNfY/on4u63kKf2OKtIIymvyKrK
         v0pfRuW3RrX7uQUJkyJKdZeS1yGNjH9+SUhpTFHNfvV+fqfuNaTEC4osBylQv/KVVtft
         A+Gtol+mTkvET8VBrQGOeGmF9eRgGXk79catFlbbUWfH0Q61LpoV++wLIDj/ge1qtBCg
         05uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781715887; x=1782320687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/zsHYT/VLV15pDa/l0a4Pcd2IDfua2uu8jZoLR/3PY=;
        b=MyVtgHo83COR2XtVBxehEhW5EPF1zLs2JUQ4OJbzgNf0B9xcdHF4SPOy6gxzpsv/vg
         NyuG/O6SQBJ2aaZrenhShCeCJZYRJ2XHFzoFTV5zdnRD/fWyWyCow8tyMv70vIVxLexu
         nO+B8lE5zXgJrpUFM6Z2sVC7wuGAmJAiiYOHKfcLoEKC7k+Zbza8NlXd7K+FcidjTvay
         +H/RTSM1LDMzLGOMCramdCvIAOYPXJcmExfydB0p0+/ZzEK31dTuHvxNGepKqiqUJ8dh
         U1R05iE/gjRy2gZBVp2TfzmZHLWLsbWI3XEqui8xNgOJQlLb7id9dkzKkhWGYLrCgaWd
         artQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bYCYhZMYCONYvXhg0kRzz8CPpB4XyCEF/peV6d6G0YJtEp4ZLijG99kYyfe2JPV9OS6/27fH+l1kL@vger.kernel.org
X-Gm-Message-State: AOJu0YxCi9KtwRfonCtJmEZ+r1upOy62egVr1heifNhf0XrQ+Vo6e5Id
	5sUePcegi8wif8b6RK3zAg7OTvYlGZGOAqz7aYkbM1eRL2oTX2D3bdIQqniVCzsgnIsmDlFFDUc
	NhYyEYCeZx1FMbsW5X4evA0NAk8wRKPKhvBwtngqqAB/hRqB4u77hnpmo3d0IYwjX
X-Gm-Gg: Acq92OF9fQg0pFaRPD/earI6PEWPQ4dYYA9bl+t+/NHRHt4M5i33Q1BNbWLqUGlXos3
	EwLLq2gitfjmQmRvFv4NejOf62TKr0cjF44oPsc/ZnwRuOSD62B7tJR0OpeFCTOovK5ypx5zuhb
	tA89aLIwHBdjw2UV8f9ZgOiNd+YtTGNXwP5w2bbfz47kNyNr9Syhkd0NqXuTj+ESsLqE0l5m5Kj
	TlP5RhKgdeo6nPHQ5Eco9BZvPd+Tkh8O8UvWIP/DVpdg5Dv+nedqg/CX0vetkxLU+PzzKkEuODa
	FsC6jw/xkLtMynCH2ZkYWOcHTqsbw2Wok/91xpRB2fdZYMMYBZILg9YMumsdSxvg7tKtn5g5bYq
	BwmOSyp+7B+pbb7UHXokG6R3UvhvlvgekRDo=
X-Received: by 2002:a05:620a:7117:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-91dbb842a92mr373351985a.4.1781715886994;
        Wed, 17 Jun 2026 10:04:46 -0700 (PDT)
X-Received: by 2002:a05:620a:7117:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-91dbb842a92mr373347485a.4.1781715886373;
        Wed, 17 Jun 2026 10:04:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8341840sm840779566b.43.2026.06.17.10.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 10:04:45 -0700 (PDT)
Message-ID: <a1e0d80d-736d-4fd9-a765-26f86e0961ea@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 19:04:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm: qcom: Document Hawi SoC and its
 reference boards
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE2NCBTYWx0ZWRfX7YeLzwvel6L2
 6+pIVHvYY/be5lF8EJ6DDiES9bQxw2Stogkb1ak7lSfAT3LlvCpKj8NcNm/9tqHas+iALi4q5Hw
 UDx+X5VDG/su9pDy4YcS2Bh4rKyGynz4GoQMFmg9tFNM2yT+7lZHveuXlBwvv7U0VLCDZzmJUeF
 F2++skxHJB3wUtA3dtN4qHQDZwPVKYyLTXWGxkWo8sceml8+01xRLr2i38KuZDOGuia3yEj95rh
 nA6neo2RY2uY/cLZQ5vVEmraT33CiUzURO3mRKy/A8ttgaSXor4PUwdM8ZZO582idtr7rs97h5B
 Il8UXcikfd+7B4gSWvogm7qsTjJoR7Z2ZKUpNVXJRFErkpHwbID1ELlaqxU++SPhtI3CZVNtjfY
 HfyvgoXNUGFpBSZ8ckbsa25xFUZout3Khog2vB8QyshlCnuk198f1SrNHtIOLFga/BSDruoLoJX
 PrUkVrL2MM6eMwbxLJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE2NCBTYWx0ZWRfXzRU7b6SnApT0
 D1MIVQvl8hFzPnYjPeN3dDkrRcqvOVh7rziyG535ZhdzgO3vfgOG8TPEEeZ+R8Mso1Qtoyspl1C
 uaBz1+LJZTE7FWsadDjA8uVQp4LZ+Ig=
X-Proofpoint-GUID: FUbkR34F4Y6FvlZ__ZH9rfq_gXX5Qxwp
X-Proofpoint-ORIG-GUID: FUbkR34F4Y6FvlZ__ZH9rfq_gXX5Qxwp
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a32d3b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T-fziwSqmcXJobsc9NIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170164

On 6/17/26 5:16 PM, Mukesh Ojha wrote:
> Add Hawi SoC and its reference boards to the Qualcomm binding.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2: https://lore.kernel.org/lkml/20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com/
>  -  Fixed the position of the Documentation.
>  -  Corrected the commit text.
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 50cc18a6ec5e..e229c0097e6f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -303,6 +303,11 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
>  
> +      - items:
> +          - enum:
> +              - qcom,hawi-mtp
> +          - const: qcom,hawi

Someone did us a dirty and put all the router socs out of alphabetical order
(ipq after msm)

I'll fix that up later to not bother you more

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
