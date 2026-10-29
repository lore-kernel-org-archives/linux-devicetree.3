Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264158;
	b=KRIjMmPGPj7kNGftzGK2rWMelYRB33wzY8a760UW28amfyryJM67T46ryD3gt8idbfjH
	 P//G0p15eNyznFij0nvcQccQhjznvv3rsTfzkfPn/DC4Og8NeGtLMvqTHURz4C8aZE+ex
	 DN6v7eziwv7ETRR639DIus8y68n6mQd1rB7YJaInPTJbLtPiG9IUjf9jrMN1hpfFPOnyE
	 10pEAbB3vYYJvT/Ne9VReo0KKy3SLU4scMj3XfO14LcexlQkSoT2nU85YVsVVfvNdJR1I
	 OP23SwStltQC24/W3qEE8NYPirT93tQs7liCzTeOm6zS7OA5QkxC5EDY9cmYb+qQc2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7JpHYPGvzX/GtA+Kzl1Herg1jZ1BKX3ryxPkV26eesw=;
	b=zlReL/aBzDOonIg7X06t1B+WvEf2xLOGWVNul19wvRei0UBhxJuVwj7W2126vm4K6ZYM
	 qL20H1DupujH+w4o2GKeeiVlNBXuETgU1bLxdXMEx5vngM9qAMR8iVY74XGlDYDbdlyAX
	 yLum1tnUDEnbYGQ7UhxcfE1kelZ6xWZoeMfICyiN4L/CQSuOXe9f6YnNr3gpKTMn1PsGE
	 QDycHXYGrN+a8Y2G1HHbBs+sD0/+cAE6uLJp7O4gzVIOA7biXEMThrI20DYjhrmbbaoF2
	 1J4ZADs6UldayMzNWjLQHdmsGzTz7F+JpLnZPTwEVxmM6fXTtrsJfzWcn8EzYV+vtqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfk2Opma;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jd9aXWLH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D65260A260F
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D65260A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfk2Opma;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jd9aXWLH
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HNtA3890022
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7JpHYPGvzX/GtA+Kzl1Herg1
	jZ1BKX3ryxPkV26eesw=; b=dfk2OpmaE6WBnQifpSSJARYMDBW0Nt0+3h/e73u1
	R9595DQoFkMhfFkOhfwAVSwJsgAo3jeo9B+x3MrtLPOyvPeD9ufa43qB30Vl7awj
	i5eMC0pZ0NgaWKH7EoLEY1WFZ2S4ci9Ouj3ZfVOnzrmMTXSiuH9tTP16n3OXm4x+
	ym3mNtSP7U7TNc48LPCO9+wH1S8PVjvQTvrmHtggpullVTHL6TFE0l781cj8QiC+
	PA/VjeWxikhauvEG8Cr8ex29L+oANrBH9ZRcWs5Nls8AG/dBm+wHPMXp3muCOvNv
	iJ6bQtzcbWvog+csYBlo1Ox/egYa5xi5ql0NE/jyuCf6Fg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2qps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:55:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9441113670dso171345685a.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264156; x=1793868956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7JpHYPGvzX/GtA+Kzl1Herg1jZ1BKX3ryxPkV26eesw=;
        b=jd9aXWLHF9DjDC4s+7DkvQV4vq5AD6aLZM0kuYJWRl6DogUIENEnz7Izd5RknarkTz
         cl7oXwVZAQc9GZLXtoY5l2gbUL/pApnyPvG/qDaKD9oZDDpu9Mzdq+nl5OhlsAzMHCXS
         akUeIFlkoV5RfpTbnmILJAMhMB4ES5J0HtHiq9f4fZlmaZ1aXk0PUY2/0/9vvMr+gLMW
         B4kGNvw58G2Hyu4I7QykWzVpoN1sggwwA75cmOIC4Es00LQs1GfYaGYqu7HYZHI2G8jI
         s+1aZz45W6Sg7yGP6ALrdBP/PKy+8v4j0Ffmx5PrcjH/+ndib7RTxKmbyUSXlbSkJ/2/
         0sKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264156; x=1793868956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JpHYPGvzX/GtA+Kzl1Herg1jZ1BKX3ryxPkV26eesw=;
        b=Xdu1HNDv8jh+wG4MWjGU36qqBWCW3fA3iPU+6Nh9gXiiZ+NDl987fVhEIyZoldIDGA
         rtcbXisdC2tFdtsGmIl49dfIG+RwigYhFr1+uNitpX/HgXTqvdsL1JxzpyFr78T0dqYP
         ia1YzU4028fiX6GZw1N+QKWNybEEq7PZBn29jPQ7EFUnlCS/yZZxlIcT6kq82DDtFWIW
         tQPlDh2dcsQ0Sxya6VfKnxFXbKZqMuEzOcv7KyYDPjJzd8LfhBiKk+42q3hlRbEVrwXn
         fgwU7iF6DJZ7O3rKKLiGy25fmBha87k9Un704ph1y27OgtlSO5e4HecLd+B47V9nN/NE
         c+fA==
X-Forwarded-Encrypted: i=1; AKwUvBzEe02cqGayr1Axhi19VsG/kb+4qAQLdVk2NDQn4c43zxClflKCiQBYvYgdDZPArmXbZQr1jLYp35F/@vger.kernel.org
X-Gm-Message-State: AFq9FYKUEcKYxKy04fwpJj9bzHNR8YMJIE3PVEYurRYmlUZ1w9y85e/G
	CchOmvlZsZfFYZnAHzYWcmf3bqOwjvkYaiP2tkL/+lPk9pyseDtqFsB9FvzG9/rdY4vtQPc2Ior
	BhTaD0hKb29noa3mwnIi0tryfsngQ0dRYhFF+hx7XYEZkcKe9+pu/gE7AEWrL/U57
X-Gm-Gg: AYBFou0XzCTQo6zfiKV55Xg2oTNhDAVJylskJ+eR9PnkDiiD8gFXvWTty9TXig4g7Mw
	ukANZPpqrogWSV6W2GO0XTnFotxgTAVUj8ChfD7WOKA4A8yuAHCVSRapS8n8BilfnCbo6ymbjWa
	4eJ59tbhmabuYo5Aqtg9q5pBVHCU5nNObGZJsKLvgGFz6tBVpZ1EhkVkH9DlJjcDGwh+XXj+41l
	3ArA/xLOSHnHhS8NBbF8jvF6cjd9fPKZql5s5o6GQ7S70tvfxTiqMamsPDPgKUodo+A6kYDmXAc
	rNLMfoPceosjBfCDqiX7b+huqoi0sAUR1vh1OmJVBMeg8I30tJVSF1qTUwUP1Z3LBvTYDAP6MrD
	hGSpCQsghbSQKhjzFBNzsRFgTg8ZyUnb380CpAHrsNIpXA0Gk879knwaAlxkGUXf/
X-Received: by 2002:a05:620a:6483:b0:93b:fde4:4923 with SMTP id af79cd13be357-94408dd228dmr691149085a.63.1793264156288;
        Thu, 29 Oct 2026 01:55:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6483:b0:93b:fde4:4923 with SMTP id af79cd13be357-94408dd228dmr691146685a.63.1793264155698;
        Thu, 29 Oct 2026 01:55:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm36081184f8f.48.2026.10.29.01.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:55:55 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:55:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/3] arm64: dts: qcom: nord-rrd: Enable eDP0/1
 display output
Message-ID: <dqra6dq22a5xnv3eg4eneyubgeb6cabzlw3jjxg3bw6qrhleqq@ish2ptiwe7qa>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
 <20261029034728.633495-4-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261029034728.633495-4-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae30a1d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wx-G1DhjD7h3rq9mWzQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fg82VqDPoeL89v_aufPSTcl7lUX8Z37y
X-Proofpoint-ORIG-GUID: fg82VqDPoeL89v_aufPSTcl7lUX8Z37y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXwIP/LaT+HdhD
 Tf3WFYRSBAZ7tP9jpSCt1z7qXIip8hhD6cZJqGs8XmA1TbN8gjjrhpD8MzjXh56RYi0i5tMmEnN
 f0qGy+01wq/Q/C66vkdpDA8SHAFixqvt65qg5pp52VCVTaJdi/VzEG5XrchGNCX5IIK/KXJ05c1
 GpjKiFQaGTea5iGX4owi0NqbxjXCGWyJ455KMKBjSSwV0tSrETvCmOgerSxBczTM983evoB5Ch8
 XLIGpW9oK1eSdKc3htTX3BfLiOegzQs9TYyLbd4dzY0NqZZOrXvsnRiVuKc1OgDOwfXF3/q9HdL
 AOnu+AjGA06WsTEbjwmB/uS0WR7NyIseTW3Pa/bigOZ9QC3CCbncNKqiKBnuk4OFbpOubykw46d
 OqbInrGAKWBfF2T4HQtorzZJvkd5FvZ6YNdjaIzGPzMnN/s2ntIU+qy5lfZmn5AWpcHLBVo2LtC
 UJKvPDsl+NKDQYb7DaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXynGdzv9lNHuW
 VFuOLgwZBfU4wt5a8lXzDCDhBpH5BAykvy5x65aTYiKZVMUvUtCy+JaEN12VV4N5/n/tghdrp+v
 w0Qqh9zpbc91R2EAsT8vbJyq7857cmw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 11:47:28, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
> board and describe the eDP0/1 connector, its 4 data lanes and supported
> link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
