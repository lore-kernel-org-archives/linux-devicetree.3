Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE272361675
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640381; cv=none; b=rh7QJ4FsQdG10q3nagr2Bsu/u8YagBn8+bJmxt39QrCGEQ4fEZbByVsgzANxIBXRE4rfAlJE9ZzYLE1+3ygSuFrKVLq6WmLRJMnW9jFaITO+J6ZzV88Y5DiwYpQadV0NyntHpPWZUSjNa6ijfHShxSpNI5YMx0iusb/nccykMpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640381; c=relaxed/simple;
	bh=+X5Vmc5JQh07q6Nov31GXwJFBkmhmIGmaMb3u0N2KGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4grvqQRPoJpVKY7+mljhi8Gy/z3ACgcwPUiA/12PBlTuUf/h3d+vD6JSpoUInrIWE14itOBagsP2BpQ72J3guSkvShqCRu3x+0vAXi5tMcFIR4VBIq3+ihdpfR0jNAk+xGfbNR9c5wTWNS5PLRfBNbUxkPlIhCkQD1A+gGwSbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPFanQGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ct5uJhW7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPFanQGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ct5uJhW7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMFJ01923159
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eJJD8hnyEYrImPuPfwJ++h+X
	ZhimrrBdPblV42zR0As=; b=KPFanQGq2EoiONtGdS0uRkOdBhPCVfEyF/CPrMn6
	bsp/K1gMRhYuA+YnALA6ZtYc2Z1qyfzpPV5gXI2SLCIOtYiLNTVSMfLYRP2hzruA
	cq6bhWkqOSAMLX2n2Darj1kAqWy9k5oJA9rFh0tLPHrQIggxzcWJ9oEKo7EYBbTl
	Sf4+CrDKFXUpamg6vYY+u7MMVsI+4cHwkBw/cXOubY74WCTFY/895oWDpKgBGjMi
	b4HKfMyz7fJI32Qa29b8SBMEkXHRbOYI0MzA6FAnQdhtMJGGDkj7mRUobAt77+21
	ucD3+TcPvLlFM6QUt/krABHjNNvkRNOqFXjXlZ7jBGAcKg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68610g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:26:18 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-977107fc2edso3672502241.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640378; x=1785245178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJJD8hnyEYrImPuPfwJ++h+XZhimrrBdPblV42zR0As=;
        b=Ct5uJhW76i+WuRMyfH8fPkdXlnekVVcoNofcvzErijF95+tel1mQWgcbnak1U5MljG
         ubfCCMDxYgnfHUjL6a4pV5vaytqBZJuzPGfq/pBVYvrSnKyj4YFsEMX9UZwC/9dJqVtu
         MxatbJUcqhJllXpXiutQytg6oKWFH15HVowqwzol5Q86X6KD01gR+Y6IJTECsMmUsQ9B
         z0JbvP3rW+f/YxU43rTjwAoZpezI9Ok8SQStf6+mhryf44TzGqN8GdZPIBQrGPkdR6Gi
         2PIojfr/JPwo1nhCfGDUwH1bsfjPIfOD4UdAkayK/ptEkeckp6bRkk1ue47DJ+ObOdfA
         9EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640378; x=1785245178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJJD8hnyEYrImPuPfwJ++h+XZhimrrBdPblV42zR0As=;
        b=pJKp0xy5QsS/LF8IG+rD/NRZrHioGybVq256AWomNORwFI+HHIZJh0Uce4UlmQwUGJ
         PyLqyC58fnLdzlKbgWR0VviU0Pp2z89vSyft+qmOrheh3RCvlqhNW0V8JdpGhY96Hwll
         pW/FMnOnXs5pg9upflpKey2pV95t2PpWfeDJ9UcxTF9hUAjqANPQK5L5cY5Fbgv6DS+y
         CfT572Y4XT0dilZ3r0qFW7UAi3IMrMcWutsMzNx0tMvohySWgzeqYHGroXwcAi7Bodwa
         1/XoKTX6Kou4Krf6AJsheV7oiqz8/JB6ppwtEurMZ+u60piV/UYmBkUdIoDhRcaxBM7A
         OGAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEWCEhXuL+7dJNf5mHhefl/zxo1h+iuaUimBiqrbwz7VDSEK5C5VaDTRAPUBm8Tw9SJknvg/KFWiMr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4qvXq9QxwY4VsYfPYhytMpNnYA2+30EEOAMVVd+8V5NaOXuJM
	mdtK7xh2Okc/JuCe2TE6r8ruA8NUz/essK6XxIs8wqkSqma7/FK81P9IEmMJYEq3CP/ut9lZhyE
	9unMrtaFBMBNH/WA5WapVoiNTTDoYolQAs0v/+pXcD/NMNdZIdM8LX+KpSVc56pQc
X-Gm-Gg: AR+sD13M+E+3j9RU/RRpN/K49LTzAb1QXZyKvgOs4vXjzDbu8A1IyegfZDG9Oys0AIS
	G+olWUAurwxKuRTt/bokGIPxcLz1B6FXsrB5XY5UKADq9SoTWoUWFVaWaVvsWTJ+roXJRyIVCm9
	7rqCyqgigjwnNIyUVvHlmER8lDVLRc5zvVVx8yQAAgeNBRAx1WDLFNpEBAfNaHwlTBEynAFja51
	hAQjzktgJNb8d2eGXwMVfJFfc+X9jKlLpddO7eibSwOhH9SikX0Hx7JlUDF+CGfMpPF6ySMqM10
	/h8k5gjI4NdZm5IxJPFjnsY6RY6w97ynKhfNjlppyX1Xz1ksA/MWNYXZMcl6GOefh2eYyiO/R/B
	nlDlY4vwPU5cakxCmlPPipbgoSzOm/hgoijyD9pwv5WQcWnS8JWRvpsdJ/KWCMaNEAL4DjejLaf
	axB4tf8NVXx2+R4Q==
X-Received: by 2002:a05:6102:6446:b0:738:5e0:b40c with SMTP id ada2fe7eead31-747537027b6mr5471211137.24.1784640377818;
        Tue, 21 Jul 2026 06:26:17 -0700 (PDT)
X-Received: by 2002:a05:6102:6446:b0:738:5e0:b40c with SMTP id ada2fe7eead31-747537027b6mr5471199137.24.1784640377444;
        Tue, 21 Jul 2026 06:26:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb4e5d3f2sm18587211fa.13.2026.07.21.06.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:26:16 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:26:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Message-ID: <llb6unswthnp3awriyvwb5ehyjammdibce4nekeghursyj5tdw@lmcmpa7bviza>
References: <20260721-topic-sm8650-ayaneo-pocket-s2-display-dt-v4-1-68e5fa9056ad@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-topic-sm8650-ayaneo-pocket-s2-display-dt-v4-1-68e5fa9056ad@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfX6qu2/k7atgGy
 PLRXrFszI9IL+AW7DQZ1sgBMn2MhF5P2NjUa/ULjujfhMEUquwoPj4OiJAKcyVR7GsEYMiRNoo6
 TLrRdJmcanRtxxn432cVmHzbj8dDEp0=
X-Proofpoint-ORIG-GUID: beWrFutErRPQVFDvzYGOehNgfN-hWMKE
X-Proofpoint-GUID: beWrFutErRPQVFDvzYGOehNgfN-hWMKE
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f737a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=rsTs0e5u974QGqZC5H8A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=cvBusfyB2V15izCimMoJ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfXwOyX5Akc7y6r
 QgZYPiAl2lXfmQ9rMpo0K0Z8joz4uPYpVANq+poqBuAjOcX/V8VM/RLRsfNnqaibD+/vqDqa5vI
 zN5ecar2ILm60K0frHcR7EhKcYxhWbR+UKTEZLC8ptaFMVg/53PorsD02/KCPBilv34Qp6CsSuZ
 K8XH4q1v20lvIoQU7EODgMUZDpJB7b/cFJmUb8IEOW2xTj0Z4hAGln/YqHnPhwyBCRf8HwoaKzD
 0AaxFYg/6GhfX0dme0oT8aJNyyafG7QHikcdAf8Bvl0uNz2r+YQqsnDtoEeIyf+M1BaUjAL5PWh
 /KUgzzjLw9eH62pD3VeUFTysmvJJtXzo7aR7OS5J9YUe++Zc8qQwvnq5XYrPbLZd30L0j9ybQBH
 pnUTo6MzfvCyFRgxurwposxK4MsJxNqruc7Sc9Nht7Vvk4z+hOMH829N0khv+xmF/DnD5HHtpcM
 l09NAsq9/FApOlk9JOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210142

On Tue, Jul 21, 2026 at 02:10:55PM +0200, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Depends on follwing bindings, all applied into linux-next:
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v7-1-16edddda9951@linaro.org/
> - https://lore.kernel.org/all/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org/
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org/
> ---
> Changes in v4:
> - Reordered regulator & mdss nodes
> - Moved zap shared firmware into separate node
> - Link to v3: https://patch.msgid.link/20260702-topic-sm8650-ayaneo-pocket-s2-display-dt-v3-1-e6de68d33f9b@linaro.org
> 
> Changes in v3:
> - renamed backlight label and node as "backlight"
> - reordered pinctrl properties
> - added regulator-boot-on to display regulators
> - Link to v2: https://patch.msgid.link/20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org
> 
> Changes in v2:
> - Update for bindings changes
> - Remove empty line
> - Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
> ---
>  .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 244 +++++++++++++++++++++
>  1 file changed, 244 insertions(+)
> 
> @@ -1411,6 +1602,20 @@ fan_int: fan-int-state {
>  		bias-pull-up;
>  	};
>  
> +	mdp_vsync_active: mdp-vsync-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync_suspend: mdp-vsync-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

Should these be referenced by the panel too? Or by the DSI controller?

> +
>  	upd720201_avdd33: upd720201-avdd33-state {
>  		pins = "gpio123";
>  		function = "gpio";

-- 
With best wishes
Dmitry
