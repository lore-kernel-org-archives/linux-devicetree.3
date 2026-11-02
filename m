Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625274;
	b=1ddOepbTk+wj06FdGH/Uhdm65F7BPyz/5lQDUlhEBzTt4yr7+cFCB6mhshO6LWJ1YhDg
	 XnQlL2JH/WfPFxMz1rqWpESvqcdUFKLVs95dPAT/XxbwRAFNcxyNZuiDiOpxf5YMogLlq
	 Sng581i+b1wkYVsWOkxThv2oFDk+XiUPNnGer5KvNi5ERs789/wtCBrslgbEroWE5DJtr
	 QG07qd96IAJBIscFZVvbkztGzaLisrnG6LBbctZUYwef/J1RrvMxSlW9y0IJMBUw4MoYy
	 K7M3KqrmpYQHvUVLI71i7oCMsC3Q6FPO7xGZLWYc1WW2ROt8e/iTGvY+jzleJBnvrWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MqtLM2a2ytKYSIAtErO6FqAVi/KPJ3AWszNVgliwiz8=;
	b=DHQvk6GhQsvyog2i78bhxT1j7tOSGY9WXVwkEtLNdqGX08d1IPU0JnB5ZEiG8uOBoNA+
	 KFrNjW0eEKeJIBiFYJyc/qZkWBMK6/QTkVITagVWfQY2TsCb/Vr7p9TGtCtkiUgQhrVDF
	 3ez7Gm1ZCAzFnH64rhf4UZZoQYelS+tN6APT4KMH+EciWG9dFQ7AoEmuADa5s/0JlEFrk
	 EwdGs4mbRfD/U5e4YlJ+YvMMo0HhuzOZpf3Swsn0yAMt4SUwxAtdeJqve/yzfFqpV3zV5
	 9hu7UuKo6Qq7x2NlWc9REn19+f1DOXtLV+MOf8MZ7C3XaYzJGWMKDLXnksUu5zkp3og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MgzXnOOs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agnzEdPQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51B606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C51B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MgzXnOOs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agnzEdPQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAHFe364445
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqtLM2a2ytKYSIAtErO6FqAV
	i/KPJ3AWszNVgliwiz8=; b=MgzXnOOsvV4OwGyBIi1oroFTmcVswy2tnA84jEMK
	0vPTXjs3wezeQzuPwW7Tci/cpr6bBp4tV9ArEGb5BmzHWkTeZOfa+PelSfDhgXjU
	7uKMnCPMafq/aa9hgOM3Bi6d0IWg36toRiMTFg7Dau/XOrDT4vbwk9EJyRCris8C
	eKTQf0DrvFMkDuYKv5oWTnuei6xvjan+CUO/wTHTAu19B9YMDqBNGELVNKaxCSNY
	kB3Sg8ghJqYkrS4OCw1EodhpmGr1mS5iImh9cN1qiasKEu9V6IBcbpxqgCZ41O7U
	rEmAFHrQ/bgM0rbdg2aSvUb7WMx70YgpQhzsr1jMFJN29Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6reep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:14:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c15deb3794so587812137.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625272; x=1794230072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqtLM2a2ytKYSIAtErO6FqAVi/KPJ3AWszNVgliwiz8=;
        b=agnzEdPQvaDmVv86RMRQy10rqSWTRQmibhTTUUv29ER+mmLJnGcEDu8DZTMllJYllq
         FpjZWrBcvakp6eoLRbo1vyW5azB+2naiPXGX4yQesbL9Qpi6uEnea2e8yRBgzGt4h9iT
         8ghxZAwvFy3Ld3G51HVGbileMnrsfVI3yWjCGbao+aqBvSUMgJFhnV6qILah7t0bsONt
         JEB/k9ZUWuBhpaRfNWIHySapejvTLEznof8hm6UVmgLeKaXOnYWCi7EbLCBeOTOUXOuj
         vMW745X0LmNWixawdqcnNpJwBORaT7K6DwGYgGfUoIJ9aOx3gyV3kdAttdc7Jnr+bVAA
         uq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625272; x=1794230072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqtLM2a2ytKYSIAtErO6FqAVi/KPJ3AWszNVgliwiz8=;
        b=d+3mDy3jaLr0VE1plAfT7R83UVFIYqkHKkOCb43VtDFLJE6m/Y3hpK0RKmxrtQBvsK
         TsEvyWZHkESPaoc4/CNQH+p1mvpBhaoMc6AcvEg7zWSqn74hQUHWfSPeYSs1RNbb2a6F
         z1ZDfkmyAxIy6oF57oIxNm6xb4ZaaA/5MJ/homb8zxwAv2g0Vd5Lm0Piww/JsNQDnH3e
         /HF+1LjI+9Xs+5qeJeeoSrxffa/L9vBzqW62V8xi03kaoi7FIVlMYKQUZ0vbrE3nzMjT
         EpLcPjPSD/V0ObAKaYetQwHESQE97REXK6BpjR2kED+BnHmkTzINmtSEsjdqhVD3HzSk
         nZbw==
X-Forwarded-Encrypted: i=1; AKwUvByqprzFfq09KTQc7RClZnrSJvtFFNu/XCb+21WMhR9bGU3NP7X+qVFiAXlr1c5/7Nz4xBfTxvtO74JN@vger.kernel.org
X-Gm-Message-State: APuU4Z9wIQwBBlXn2YTRYge2mpdX/oWnMDhdpcdK5/Xk6oW+Z4mjcs2M
	h6rO5XBny5syo6ldlSaO77XmQMnStmSJrf39QemF2fk3c25d7J2fBu9wSa/5WjgwCcDJvTVxdra
	KaGcYCZQtFirCTjGJztIiJmvRUS40+6ZD6VSJRlDos9fpC+/wYoNNP3mTiljQqBmt
X-Gm-Gg: AYBFou3RYbrx3NQp+U7tIp3i6bmBAwpa8o0fwp6sggiWq2zec+NxerF8yFcwnTYSk/X
	jFZF2/FGcT2zhL7crdU0Pn/tFn/qlndWZ1a1qZbcBtBInKEL38UwETPAxnFdwdbPBw7oYVXIw/V
	cUF0vIW9Dxgf+3OkAshbODTD6rRRjXRtXEq8CL+YUEZpf+4PeJVQznwoc4GzEYsCEikWc9xlQ4A
	XBWOVZDujJNlbsKFZjg1uHG5+9Bv4zzEtKZUIHy3ypXOxURs3gSaSpzwPYzWnvhHybINGIRCiJW
	XmOV8monhBFQZjbvK2N8W8+Mk5NJcNLvtUKfK2T3XZz+QmkXlxdP0CgkTFVtJ478OpNlFCc5YEy
	QmbKwKDyLNYXEeKXM1ViE021iKn2jb2KXwRmc/iz2Lrv5r6B36uGMTDb5/5PStv0=
X-Received: by 2002:a05:6102:6c4:b0:7cc:2946:7f69 with SMTP id ada2fe7eead31-7d072552c25mr3482928137.8.1793625272299;
        Mon, 02 Nov 2026 05:14:32 -0800 (PST)
X-Received: by 2002:a05:6102:6c4:b0:7cc:2946:7f69 with SMTP id ada2fe7eead31-7d072552c25mr3482923137.8.1793625271709;
        Mon, 02 Nov 2026 05:14:31 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm19577646f8f.25.2026.11.02.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:14:31 -0800 (PST)
Date: Mon, 2 Nov 2026 15:14:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v4 5/7] arm64: dts: qcom: nord-ride-embedded: Add
 WCN7850 Bluetooth support
Message-ID: <vao2jrq2ftiyj3sz3jkwoyu5ec4vrnvflfmpjuiwor5fwxuix5@7kgukgpijjcq>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
 <20261031142433.1212809-6-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261031142433.1212809-6-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX4RmbK7MVrjCN
 +cO778x82OBb7HuhNec3IyOARp5iFaLx4LIqLvuY5rTkYHqbIC5BOEfFG3/QOakCbXM3VneS9KO
 785DPCabcpEm2+AYUU9aWyUYXCxJhLzvZYjuAh1hOnNS5kwEkxpnNYqdEqoiN6lyWtks4W2+8Zk
 xXTC6fgKkTxN7AmZwTD28c3wkjYs6NYqEQiN3zZp1LzIq3fJBEGWd1Rq+PoyrwymbPg7dSphQRX
 /sa+DNGmyOqvz/sNnjZxj0szkhmRzDF/V7DuzuUTi1km2DnT8EbH+UAQx2A2Jx7AEIiYo44t825
 IBgUhNnPmXwQcjrFXJMXMpeM8/CRJm6I/5zHEEpLCq6YJV6EkZmWQ1xXwe2cNbugBE0Eka6ENQA
 M7T+K2FKZlmvz4tnOijQvq6L9qw2CD37Vil6NRlckv3VuYF6b6O6PDHVLMo4QXZFa6V8KpOqmsl
 80akJYH38oJGNA2tHFw==
X-Proofpoint-GUID: iiT2-Hsn_F95bCP7wT6nK-YbLcBrYtIf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX6jaK1bFF5X2A
 IIuBKN00WdwiM3C9KZ2zEeWRewSg3iwonMGrUrmekzzp5fbqb9P3vfeHhRvYGSwEYHAow71msmx
 opstqveF4I2ly+RJvBZWkwYQZT4VJxo=
X-Proofpoint-ORIG-GUID: iiT2-Hsn_F95bCP7wT6nK-YbLcBrYtIf
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae88cb9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=63jK1YcbmW3W_hZ9q7UA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052

On 26-10-31 22:24:31, Shawn Guo wrote:
> From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> 
> The WCN7850 module on the connectivity adapter card exposes its HCI
> interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.
> 
> Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
> describe the Bluetooth controller consuming the PMU outputs.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
