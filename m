Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176600;
	b=y0gNrxSzdyYpfUDtM5UQykdg8sTeR1rA0lzoEy0HWltZhY00a0XyQLmjQ2hfCGzmm3gD
	 D76c01z6HL6ZWVNvBlxDQE+2XG9wLggtfLwXoxRZhPnoV1r+fbmJoNM8y9DTik/SitMkG
	 GFyAb2Na1rPA2xGgMHAAzVcWjzfRJHrg86jfpS08Hs2FmH15F8aw8rBXo7VKskdwygOPw
	 CCVIajf4Wwtty2FP6BAzSqml6uOCwJNsa7g0wjLoOw+DGIMhOOS84xc6VaEwzSxF4C0kj
	 56soc4jfaImPhGM1mbUIIuEBiWobhZYwVhMWtrPja3q+ysn8EKIrMHvlx/gPRv1T6Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176600;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NgFZenonLIOYrddnj7GBaw7dtDGJBTol3GdISdWN9zA=;
	b=rqtK3CLDWeL5nNS0RVXfur1JNMizWCoSvoUPfX+iV16ZZTYBrtogFGrci93E+OLpDTS5
	 X8JGgTTVpXR58aO5BIV6edupkj7t809xg4ZbzccGD+sHNhuzA1ST2Y/Hp/2rF9nBaVn/x
	 TM1xHjbG6uZAp6vPt6ZkeUHwsI7lUBsE7ORYiEqifzpC3Qm5/Ep2Fk9tqH5WcREZOIdWa
	 1fWqgEa1SyAhvW2tqRz7AqvSb2LG/uSbXjgVXpSOopq5Id/jpqg2rbddp/KGmy1ai9fe1
	 dx+DB+tkR+YpGaiHjj9u39hbSTc4CbAj9H770NGa0nmg21czjlbmbrM68+0XaT62lVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqHLWQpi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPrSDN0x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F428606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F428606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqHLWQpi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPrSDN0x
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0qY1060622
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NgFZenonLIOYrddnj7GBaw7d
	tDGJBTol3GdISdWN9zA=; b=UqHLWQpi1vKez1h/j4dKBd+k37dj9G2exi2kPZNR
	VGUaCftrWXxEer91rCfRSiJ+94Xnq6Qh7hdGQ8tIqDLpgmkcjB5NiAPU8AOY3eSN
	HJDcfDQhq8GE24Ao2/MKETS/+qQy0SQWXX2IqmCmk8HAXUculPOeX5u3yHJSOp2p
	xH4W2D/0oLjxNS/4HvX8Z1MynpO/FhomeVd05WS5c0b6MzsQ/wRO88wbkmjfErQ+
	/YTrL69kBb4hcZUPfeKNmjn5xiA/zm8PVLVazLIpDQW9rBYI1AyAIyfVZXtQqg6p
	MHfvuAV9vbZ6FwbdpnhcJ8drdzdBVBg7zGZc4oju3VDpWw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykj2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:09:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so151003185a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795176598; x=1795781398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NgFZenonLIOYrddnj7GBaw7dtDGJBTol3GdISdWN9zA=;
        b=JPrSDN0xE574o4MVMz74XqzX8BBzW94o0pcSq5sns6DvwJiVfhVybkatQum5RPgITR
         UmLzChvWYGI09dcBFHK2n2J2ZY8YfUFaDY4b9mFU6dDsDatCJsy/TzeG4T5BDUrPuk9k
         eaWPBEVzNwZb92OfTuBC17lzJU71yLGlbe0Ftpwj8kmJym3nRJ3LZO80M//jC5cpYA63
         x9c2n30X3uI+JBuBFuS77ybyYaYghK7EhLntijjZ8dr+qpuUIiiQKFxOwXlXhTDtTczf
         JlKhJRH2MukAJ7t/k0L/jpff/8MPZZq1zgktoOPRwsiFvBlZKAt6xhPpkLnYYgAJD6jt
         H5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176598; x=1795781398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgFZenonLIOYrddnj7GBaw7dtDGJBTol3GdISdWN9zA=;
        b=FakN66P/i5TA22lDAePUoaYalhh8bK7VTvO9Ss7OWfXqagFzXyuRCooEpgBD8msbJh
         /mhAX4rNVsmsz4yhmSEPEXYmC2KM9xOUEsIKfUMnmGLm5epDAzITQskoapL4ftdFLauj
         n2fFxjj7iU8EqyxAbjq36crpV/lUHuTcEaK4tKZbCia44diG/FdUU2pv47EpQ6LNdAb1
         NdU6fpv8uQYlZyA3W3cnxU6n7Zed7d4TwcAwUVTFVRBtVuyZABiY02lZgElFkTh/LYn9
         bz0UDRomADgGlVooGTtwRafBIx1w+RubmiHyhsjuKdidNk8A2CV+Dd7o/WXnxaSr6Oc1
         2maA==
X-Forwarded-Encrypted: i=1; AL+hErFcWmY+sc3KbSqf6d7FG+egqVtgpemSEWU2VVyCCJDf1YXanTMYx+elL+OlDYS1G75nVpX/XdOnAPI6@vger.kernel.org
X-Gm-Message-State: APuU4Z858lvtfx+HRBxiHvUR1e7DKmBRpg26HP1t3TfY7yLjGW9LUiyI
	OtvZztl4h3lJVGF8lfEBtpi6BSla82+yxDSCLt5XZtS5a/ksM5T8VmHP6VF69AQWhrvfD8Rzugz
	T8vHFwccVULPRTdGNFVAQIKvRowmttKgSmGgZt5NBw1VK0sFL4b9ibgxlMUNKBcS5
X-Gm-Gg: AYBFou02VgoHsH+3T7glX3sfbMWWU1K68lrMgP2TbRNzNyv3Gjtfh/emxM+0Ox3jRP4
	5FD/11kEGMb0zavWd1LvwYJUWSlFr4VW0Ol50b1ODAC1JO5dOeSWvOetRra3byQw5bi+aeMHP6U
	TvxOzh6eQfsGqmwfQ+v2xBgGD0aR7ehEeqb9SpukKFPBqWol35wR1vw/9RSENMj2xO5qM0Gt8yI
	hv2agrJFUKOCeGEzjuiZF7JwowaUyzkO0Q6jWQxWB52El2k0uPD3/IXJbUJH3mro8xvapePCLsa
	uho4UuMYTkj8TeJI49BM5IaqkQPcujpKd9OfzH5Txgvb96ELkeDCd9r9f7C4M1j+RcIBEZ2wSBr
	UBdNmaNNwLHjBxEMi6r2wiI7Xc9CjgRpZFEyHxmS5p69BpjE6a264ISLkRbR+YviF
X-Received: by 2002:a05:620a:199e:b0:947:82db:2f9d with SMTP id af79cd13be357-949ba7e18fdmr433989885a.2.1795176597614;
        Fri, 20 Nov 2026 04:09:57 -0800 (PST)
X-Received: by 2002:a05:620a:199e:b0:947:82db:2f9d with SMTP id af79cd13be357-949ba7e18fdmr433983685a.2.1795176596918;
        Fri, 20 Nov 2026 04:09:56 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm5645885f8f.4.2026.11.20.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:09:56 -0800 (PST)
Date: Fri, 20 Nov 2026 14:09:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
Message-ID: <pjcdhrc7b3gs3ll5ml3d3ohnuivtc4rcotnhnx32rydc7htmfm@y37lvdnugj35>
References: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
 <20261120-shikra_qce_fix-v4-2-5249e31394ce@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra_qce_fix-v4-2-5249e31394ce@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0OCBTYWx0ZWRfX/9uiEsTP+88h
 5Y/TxPmyaORvQ78t/P69Uo32pXQ2XW8YYN2KS/ypYYoXGSaTd/G6NR9CM7e8/3ikp44Vwn1ECGa
 B2uOrPDVjoQwASri16MyKN+AkAzGl/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0OCBTYWx0ZWRfXyhjm4+aEfi8Z
 lTappN4EvQDywppSWUJMx+HYlXgUe8MG8HBFLdCa24SSTYXKCkpPRX6cgSb9zNd0pJxGcY/w0V3
 11gGUZoYSjA7Z0nAA7nnRNr5GpIyWm6tiM5umYvLMp6NCfJpVH4LEYq0bSRPtJ2npOZ6wpOIud4
 ukYYc02JMsglnw1GU0x/xTvihlk4D2X1ODpLFEVTkPXFadPckEbXoym+CLqAAzw1XEw9Yfly8Qb
 oTlwUv8Hvnq0PkmF9ZLYs+3VUDxNA33v6ibVCEPd/NJ9qjKpV/xhpNGGs5nHO9ws0P1jmULi1I4
 YLR8kB42pw2KUPJNS7bPOE8eLM1FE/JzYLMWN3NgHvtNObLX+rU4iYXfbd8cWZ9LdpVnBu2XDaE
 pf6bAqzkLaNqpi+ll+HLrs8g5QtcZlV1A2LEQK0FIvK3fTmMDfQO0JejMvfx4Yf3Nwr5IzHuDpH
 LZSF52MddkI1tyAHxnw==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b003896 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=l6_oCbVy_dZ6_alwpPcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Shm6m4u5omNbyV7Nwxk1M9g6rSaDg7fS
X-Proofpoint-GUID: Shm6m4u5omNbyV7Nwxk1M9g6rSaDg7fS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200048

On 26-11-20 16:59:53, Kuldeep Singh wrote:
> Shikra QCE requires an explicit core clock, which is missing from the
> current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
> and specify core clock to match updated binding description.
> 
> Cryptobam is controlled remotely and its clocks are therefore managed by
> remote crypto subsystem.
> 
> Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
