Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873536;
	b=e0iXJqBTcBsGeokQ4C7IpLaTnjZ6cEuC1sqo1i6wU+QbJo1JCCD7g7V3McsbeOPpn+6E
	 ATFuiyEL/UgtBz746YMra3p6kYn3FG/3n12pNqRJ+8QxxrsPhTDIPFZkKaJd7PhL5WaFe
	 8KSFUwLYjBNYgvemsb5QdfYbSQBzcJ9PWlGPfVeV3oeQyH1ILy97mDnh4P+c9CfblrrC4
	 qhZIZtx+yOi1GqWhrHn6r7WziNz3GMvuzAT+LWXPYTnGxl3CRbyBpzv9Lk2V1F/my4wGh
	 pCn2ZWs/bCHtgAqPMlNNYY/yxzVEClA6+nCEzafIHagmgv1d3d0jfUREib4l6AgZIAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0GrnMJRzACYCklZlFDtoRd4bXmLKZhxYbzdI1CXifVA=;
	b=WzbCUYXcs14tEOS5l/Z0NtaW1xWzcZudHs09IIpiCQZF3f016JdFCWIweAkhDHuoZkIO
	 0RYV1SJNJpkxrmAAiIxxVBFBbQWWEAWC7sT4X+DcfBtJO3Sa8Dp2wUQqHywknGzSb1Ueh
	 mXmQ91Q84cdqgPfVZkqtMx0+jAZjnqEL/bqUHwXRgTebrDlrYC+uCf8S5BT3E6siiT7+H
	 Ok7qmJ4Zj3duMzf5Dk8s2oxEy5CHJw1bEysD61w0qENmPBTLZ7SsWKG+D3pWQgNbDC1Nc
	 JJ4mQGAy5vyJTkBDgcamf3+cThwywWtAeaSKtpqITGu2zeTvA5hefdesEsKVBtGSaDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7iCT2kR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C0M9xijl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547DD606A31D
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547DD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7iCT2kR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C0M9xijl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OITvRq1261071
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0GrnMJRzACYCklZlFDtoRd4b
	XmLKZhxYbzdI1CXifVA=; b=F7iCT2kRM5ZF41/tHo0p+tbPbqg47B+3st2B/dlB
	CW6wFZQh+eFbke4/gZNevc0uusY5ql7Mgc+7vWSjvREeMAAcYQZz84G1wyahOJGK
	d0ojNS88rrVix8E2fvwnCw/HGGfgO9k36dxXTcYjIJuzEC6NQrEtqmio3EUhT691
	OZ2RTXfZsQ4MXWRGNLxhj4Wll/OLKRvljg4yO5pAjck6C6eiYvlqvPOWQwVVJWtk
	3KfTi/UxB9zX5AeY0sUXI14r+mY7whAulNHdJRmuYKqPyEq8l/VMfDilDO9OfXpm
	XrFnvsvvdCeCjeBJJz/sTH4GTzbWXDxmykTdS8Vl+R83vQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27sq5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:25:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so404140685a.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873535; x=1793478335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GrnMJRzACYCklZlFDtoRd4bXmLKZhxYbzdI1CXifVA=;
        b=C0M9xijllgc2qVz3rfmMzxMe/Qcsem6GTo7ZNFO43Vv3BtauTwIOHNixUaVfHSx64S
         jskgx8EDi2UtTaeCFzzE+uW0efbAJJPj3FBiFsevallW6zBEk1PTYwqMh2kd/C/dis2T
         FSzdFO/TewiJpjLr19pFk3sIIQUOTN7ryYTFDdz3poI3LmoWWskAWtaqLM8aRk8e18QK
         bi2eZnjZEuiwxYeoWyEBMEDAi/f8lx1h1EIGRg7Wf8K44AVFd4vv3wxaALGV09rqox/f
         5EB+h2D7O4f5+2f8olyGbatDpGHsQn2FeFBVZ+ja+1/s+CQf8douST2gHe1Ie0pKND9d
         ORRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873535; x=1793478335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GrnMJRzACYCklZlFDtoRd4bXmLKZhxYbzdI1CXifVA=;
        b=SLOYKjSORCeYNR64hwMIiWuSakPT9MiPHJ2jR2bAgL9AYs+xjUPCwOVFGcS05N1gD9
         boB+RdajNPoBgWG+UZO7BRFQPZmNSM449AdcA4hOOLO1mxsEqFJpdc+QLh3+qCI9AuxM
         g7924hMgkPMBlyvwr5+6HKmOu6o98IltTs2RC69uHCwdHSgKA+3NdZjY/QGZ32Ur34Yk
         1fG+UWdWUmXAVm6ZwOnmLFB1TNkJXI9y64C9JvooX/5j/uHw4F2PRHxbrJdgBjn97dD9
         Nj7DDPZNu37vdOiW2/juNeg2nCHxFiEEPJ6/wcOeBx+Xhy8wBigveBGANIMUyQdp2IpG
         FhlA==
X-Forwarded-Encrypted: i=1; AKwUvBzYL9TjsUo+dt5yeX76uIt6IX0oWXSN+0+TFFazjlG1dRzVb/RO1d1l6eaEIncJmBaQLQ22W8Xb8HL0@vger.kernel.org
X-Gm-Message-State: AFq9FYIU17qpU71b7TVNCXchIrdgLI8UoZUgv6qNgKuc4yVZMzUmjcF1
	bN3MPlhTDxTz8Y+v7LgSHQ75X43NNRzOA85WRLCYVztz7u4HLt68+iXCTHHRQSzTAUI69S18g18
	Wp4SmvtLmQ5KfYrTy1jTqd0tgDQQV0oB4CRMNnyeewQ1HcHqJHON9+Et1nrYWPS4d
X-Gm-Gg: AYBFou3QINBYc4Ul3i7dFhRxoPIrLhOLeNAf9pj1Wmitwxch/5zToAgmu5tXuCf5fzF
	xj0T5bQ1gYWQUDvzDfQ+cPDj145apPnr5Kbg1OUD3hsI/epWeI4+t85WcaV0VNk2RYyCh1wH3EW
	Dbxs5Yhv46tZOjQFiGUBcp2QzLqxoODyW1qd9CsWkfSO7gqhTZc5R08dr4we6SGNGJOKdclJ4DV
	FbJBvutAkDK9EAUG82wRv1EHKOyNl5trklaIIXyOiF6JDbc4Iznm85goDoMneOuRIomVBWAREog
	G+JwT7fgAKjlZtRYEi3CdbpuOqhcyzgHT3EmVsd0TY37NoVn6hI6lPuNSBIqMEhIob+QKH5UB80
	rsJt34hTxFpzZcEQM
X-Received: by 2002:a05:620a:271d:b0:93e:c35b:2332 with SMTP id af79cd13be357-940ef9504b7mr366122685a.73.1792873534245;
        Sat, 24 Oct 2026 13:25:34 -0700 (PDT)
X-Received: by 2002:a05:620a:271d:b0:93e:c35b:2332 with SMTP id af79cd13be357-940ef9504b7mr366121485a.73.1792873533656;
        Sat, 24 Oct 2026 13:25:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm50361415e9.3.2026.10.24.13.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:25:33 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:25:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8550-qrd: add DisplayPort audio
 playback support
Message-ID: <m4nlly2xic2gdicw633adqd5zwouw7qprvaobc5ilvzttaxpqu@dzx3shnwidkk>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6add143f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0uKr9UbQX2q-ajesKQ5KfDCW4pGqv40w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX83qpg4SIkk15
 wzbVmi+Ut5Ohmx6Xkt1i3EWML0i9QgMRG34Fg/WTgeJBI5sEwv4phiBNv3cFX4GbEZbMBkVAI3q
 NpsvU0olxi5KSldL6K+6cN5bjIHl0QY=
X-Proofpoint-GUID: 0uKr9UbQX2q-ajesKQ5KfDCW4pGqv40w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX+1x/6A4IxuKC
 GtYkv1oYq05mog1tm2dLafjhP4N3BmEd6tNNVrY8V1bnMmclqOgID3mWyzYAIfCuSfQ8U7rKwFF
 QAgqLHDs3qsCMCd0GHsImi8s2zWxkmRTrrWjl+cbZasaZbgBteO6Dlbuxp7CKyhFSoqjTEaBRJw
 yJPZGKSOOBbD7xzmLU4RtdaBfoVMGBTWfQSv6IHUGVMK5p6hkbYYOxb/kMQ3GBtXET3XNOs2xi3
 VKMYmmClbZiFJtR5po35XEXg7fAOuJqN60IWFA8139KiDBlJxzMjlR09izM2BRyFTEsvCenryWu
 tDK+D8oih6zelxV3kTfKmMgc7Mgm65LUR4MGm7vb2uWanP9+9Bq1ncbXubqm1Lg5ZPeNLGf/Ugd
 IGHWI9NDs3xu3dnqZXYUEbDtnJblQ6JvDg6N4V+zQDfBIc3YrxCI3kiVOp+NWaw2EpmCEnjdwm0
 v4sFlXvaGnVPPuzEv3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240081

On 26-10-22 11:36:23, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
