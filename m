Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420768;
	b=Pyh2WWyhr8IvqQ+VqOmDdfFwOSM2wB7tPYuWpMW7IUPvHp6Z0+CbKwqpazDeMB8pI+gY
	 8viL/2Wrl8Uz/t6Im43q2MBLrdSwplFenYbAcrsiBE3A126zOUMowXRSieBk/k1Po0AmV
	 1Nzgk8oINkiJNhUIbKg8974MbOdMUPelhsRR4Kif0nyqoR5JC0Q/DVuHhLVzurq7GHLxK
	 kN4u3zLBwlc9ejhz1RvJi+ip6sfOJxkSGPLUllqT24ZreUp8Y+GiqJIoZkM53TYlJzJKg
	 brWuguYjK8WsCSbwHl2HOqxOHrI2MrMvFD96J1qpyAkqpNjtEspiU7W4ytuDdOKPDug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TpPJpMAeykiKgpS6Mi0eAQJ5tovbRl/3UVD0DVrSzfI=;
	b=jypPNuqAGA3WZrdDcB0Du3LRC2gJjA3V5TpjFh0Idrcw8EW0ovlRlfHf3n/McFUbTdmH
	 uWXD5ryUwIxc1J27BSl6xGM0pjUSZfWk/YIptFnoT438rm+ash+pVRfnrxda/hQtOcK1w
	 53XtTVNKe8WPp4DJHzSrtCRs5yEKcFto5WlytW1z0GjCTofuhTeLy4AOz5viGUUZukLK6
	 aET9wKuBzVkMzMU5Rh49h7v5dQWhzgvyCZGaptQNDxs4/UMJfbzIee0xtDCM2/H4BzMhA
	 12iTWpEM/ZJ6IMLo9egcSuT/VRo4Yh6USY0oA1wJb2y3CHmzYV1UxRDOGK2c0aFRrNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ARLkfSdQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wus2ig0h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932A5606C143
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 932A5606C143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ARLkfSdQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wus2ig0h
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtcJh1014278
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TpPJpMAeykiKgpS6Mi0eAQJ5
	tovbRl/3UVD0DVrSzfI=; b=ARLkfSdQVS2TC9m6CkNI798Zv9qBSMWtcTE2iZn5
	SDFjKpoOZxE5RE9jg18lKnNpM+YjZu4VFePK18NW5XOYAaFQzMjuB07KVSELqchO
	gRYClwlEK7Vhsk75GfiG7XOvQpbNp/ZM4BVCzO9OV2RWST+oOilqAEGh5omut/jM
	rQ7FIOc1238CCxui37iRvEm1QPePj9ZbMc+qCUXNOExHpSelMuQ7m7ApuTGBo60y
	TdCUmuBjUsrvXZhaUjTvB6dgPgzQ4OchwCPtEi0baTEkWSUmhr+ECWdkoE9Ge0DL
	aPkUXsIH0myPC1b2z9T1K6rQKptfUvgPBM3im/p0rb8Hqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjt19q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:12:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so118063785a.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420766; x=1795025566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TpPJpMAeykiKgpS6Mi0eAQJ5tovbRl/3UVD0DVrSzfI=;
        b=Wus2ig0htXxL2ImJ+M0Qqn9vdzbSiHk6XK5+srYC66DcjjSszkqpaAk17+HWKo+0KH
         T6gHFkHkMjRszsMCPfNSZuKD4e5UG6Lq+3smsfU1nJ353wTMg9EjUw+sXnRw/x7VPfyj
         f27Bv9RABd4VSY73d/mPTyTaYaC+J3xBUaNJCpkCrFnYBHlq2UN3iAFGadRTcN/0khmD
         1/LzAiXewuy7cgI9MBlKx741i61j7oE/PU+kj4MXuM+VvjaNIaJV+USQ1u5u7qji5a1F
         RDPuKPz/iST5H6/N0gBRHq62kjlIeTS56DDm7sMqypErKsPEAfHxZIhS4hiG7hfr2Msi
         VPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420766; x=1795025566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpPJpMAeykiKgpS6Mi0eAQJ5tovbRl/3UVD0DVrSzfI=;
        b=W8maH3A8YBAi40gQPv96vKTSgIOtEcMqtnAV0HsDYwnz4LncT+UuQtnX5TVBKVHb2F
         NNSgW+ntyJ3mGvHgn6YNYyy3pBjlmVypHiqu17JAN7H827OkFanzXzN2aCORc8gzIs1N
         BckY9qctIxvq4cHnq+Eqtiez9nbxTmDx8S8GS6NZenDwlHwxwLt/OeLP8hZ8QcTOLnBl
         6MMCT7/joGFcgePV7jUcpkuS7BMVajyA7iU+BPXgkz+G6teKeDl0FyfFYyPgufZWzbhA
         lvVcrdbPW3gdB+WeHbhFibeck4h7pRHlD6mV/L+rzfHrQml2QiDCvzSmCFWwmCchkaxZ
         g2cQ==
X-Forwarded-Encrypted: i=1; AL+hErHesC9GBBv97MB8SQnodLI0S/GnYs+7VdNm6K+2EtPR1/TeplrGe3v1bgy8Q87Z54LJdDaleCBGI4f3@vger.kernel.org
X-Gm-Message-State: APuU4Z/wA3cqInI56qqaNOnR4hkDvJHM5zCcE8y/mnhmvdcFFXI4HM0d
	0w7Mhz1NMN08Dj+FVMeAnRtZbrimSwzSb2LQdTcidmuJwTzGRlyG/7lJ/+vYi8tJiZ0bhitX0HY
	vi13LG2PAewXQ2bTavvSM3iippj34USI161nSWNvc5/7Ybp3Wf1MXxA0cn0LorECc
X-Gm-Gg: AYBFou2b67QC6Y4bul+P8poUiA7GDoJtutUrVF+XDeUcy+D165ukzJnS2Nlt0FZzvUO
	H4+qkxMrxd+HqQSdFDYSk+l3wnw52kF8wnTwOvmtgKZKVMY2k8PWt+dltSXhO0fIobk5yVtvf1B
	lerDY4DmNIufv2fqrsjg4R539nkv/0UkF2kRrJIyN/UMBAz7n0HxD48CfkVKRe3DiEYQtX3NGnQ
	ExKh7D0oMp2AjDchTY+jGDmI72mGrZZo4cA6LQF+Ncc/BIM7mdH1qjeQDa62SJ0hmca6zdBusC+
	VHWf2pFPRftPmVkJrGN4K6jKVoj6CYxqHRAPcHFu7qonvlAQ0qnGr3SWgkDZLrcgZNl8YToj6Uz
	J06yktJQn1T6K2ftxL196Si9jrmjFXvN+s2SQoJc7qBAihyWkCEvY9RsSH3djtIGjj86sXtCLxD
	N3djcC7lYsZeMT21iI0ZUR9E1JbF1e+h9ZjU9Hc6ZyESrU2o/eRuRspMny8uYGAw==
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr487870785a.59.1794420765701;
        Wed, 11 Nov 2026 10:12:45 -0800 (PST)
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr487864685a.59.1794420765248;
        Wed, 11 Nov 2026 10:12:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae115a2e05sm6544391fa.19.2026.11.11.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:12:44 -0800 (PST)
Date: Wed, 11 Nov 2026 20:12:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] dt-bindings: display/msm: Require DSI graph endpoint
Message-ID: <wtwyi4b4s2mynolj7pqk465cugahmtklhodmg7yehdmvubusbx@p6dhg7iwon2h>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-3-0f3106f817b4@oss.qualcomm.com>
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
In-Reply-To: <20261110-display-msm-of-graph-v1-3-0f3106f817b4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX5+RV9zBlY6sX
 9sxzKXTDx88fKzmlnewxUImfDrQ0vh0RGlKpfoi2lQgv1YbcqmVFew/v4ddQvDa3xWVFGAizLGj
 cB1EaGSULui1MotZz/roJ1KNm++RERhE1VicBLWjvMf+vs9Y6CjLryt/tLRh6cmtNgAiqD8P0Iu
 98YoVoRMElNaRpqB8l+xbrztWtVzSic2Fr2osJiipBW/QXk+d6nDBStJB5gVaAxKrY7JDL3ObQ7
 NE38BJBwOqdm53e45E/kSQNWm/nvmwIxPLThpPk/QoWZi6aXbk2/97N6mNMU3gqX8LJurBkjrQs
 wJhjulanDizjLNSr4j889vEFZw+Ph3EzuVuqeujiDNvKuK72BTjKddSDyUHJs2hlATdyHlvLWbY
 bCN5uyJfvMOCbAW0BUhnV7taRsf59eoaXxK8YaZSHZkavXejrour77/11dmvmTL4Ns61+KV8h4q
 DVGFx8d1ARpN7dATXQQ==
X-Proofpoint-ORIG-GUID: PC0Bh-BA_RzNSLc3K2OE1_InraXVavxa
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af4b01e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=T4xdjuEbw3p0ivj6QRwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: PC0Bh-BA_RzNSLc3K2OE1_InraXVavxa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfXw9CKmgeVg1L0
 93Ac+WokiLUOJ/Pdgd/9i93zixKSuUof+WmKfh8rATgwpU46qtD048Nk/Bmky2fJmRl4QN/RT3i
 GptEifZGi44XvEW6eVIjBurI7aU9UvI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Tue, Nov 10, 2026 at 01:57:44PM +0100, Krzysztof Kozlowski wrote:
> Technically, DSI controllers do not need OF graphs with endpoint to the
> panel and could rely directly on their child node (when panel is the
> child of DSI).
> 
> However Linux Qualcomm MSM DRM DSI driver never implemented such
> approach and it requires a valid graph endpoint pointing to the panel.
> If it is missing, the drivers will silently accept such DTS in
> dsi_host_parse_dt(), but later fail on dsi_host_attach() because number
> of lanes is not initialized.  The number of lanes is initialized to safe
> default only when there is a valid endpoint which is missing data-lanes.
> 
> Extend the bindings to validate existing DTS to match expected ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
>  .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
>  .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
>  .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
>  .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
>  25 files changed, 48 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Note to myself: per Rob's request this should be applied only after the
DTS changes.

-- 
With best wishes
Dmitry
