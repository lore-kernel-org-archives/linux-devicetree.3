Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A63783B4
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908520; cv=none; b=Wr0we56A8IImSqNUaurbiDm0vW1eQ1dcJnQ6/+6ZY0h6wLy9Gu6lcUvcQNCOg8Y+9vqdd23HFdE7DNtiuDQ2IrIvaBkwP3fORHB26qYUsIjAuS6JR380TCAA/OdO5ybUFe5cPa8XUPXnTBkskzAt+B40QfydvxQUYv6MoiVRp8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908520; c=relaxed/simple;
	bh=vkx2guBaMzaA5PGQ2NLjd4JukbsB134nwJuWbFJQBY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWmQV6T9g4+J6aeLc/02EOk8krwYMqEIKrXpKbFXD5V4COdjcRk1LJaK3HyPpRhYWtAhWi/rs1NdyKoxuMkXnsHakP4nX6nkkbIWnDkbfRECWwtjlyRbQzPcQXq2TDbjl+MiemhTEZ5PAj7gv85pS52OJZVc83y6JZMaeMz+reY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ckshq5me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BczzbjHe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ckshq5me";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BczzbjHe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66h2i1940943
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mTq9qZkiHNAUCuhtPBLQ9No7
	1OhjJ39In02KZH8YzSY=; b=Ckshq5meY0rWOIvb9Roe7WYDfSaKDUungroIaNay
	PLjhl5bBc31Vl8JnoplOW5oxYtHDKyvGUuMeDOgvtb0Sl78ae7CA/dA/k2JeCgE5
	jv1wGU99pA/IsOrknecCkcwOb2THulUi8I5St76XmG+oW6cFKkzXyjpuCXVF6+FC
	GC7DHowpnmgGPpgTyrrxpvK8uAQBcK+UDMznH/GSwv5oEZXmgmJ+17OPD9/dHwXI
	8aBIpzKZDxYCUmyjw5fIrvo384rQc9SGILuI9svJGJlGt3vzCueuBcjJd69EXldK
	oNVrVxXu05wbtLLH/pYACw36c931+Wu6+I3uCO4zq137/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3hs11td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:15:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e934385db1so8553266d6.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787908516; x=1788513316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mTq9qZkiHNAUCuhtPBLQ9No71OhjJ39In02KZH8YzSY=;
        b=BczzbjHejRI+f3oDDcU46mNWOKek1xB97FzxmOCKKmOf1OQTqLnjET5t+7Xea7dNXu
         g8uxt/4c0BE+G6PghWdGTK5T8slpeWWrB5PEUJPu8DvueIgEVj4L2h5Dxmo2nDNIcHyz
         l1NpRN1WsMu69tXreUN0cn8H04ynvGiRMrh4mPWa8+nSkaHlBQbTo/VEJU+1UwaWVACw
         inQvF6tZUIaKUylvdhBVWlEWWPaVEtXHWdZkS5svOuxN8VEy3HPIeo/kg5n8rrXKZ/kz
         yLkjTpabrvEQDRay2HIMF/0Q31FCvW52H0PjTh0hlFEYjF5hAdzR9sG99zXrYPsjvrdg
         RtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908516; x=1788513316;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTq9qZkiHNAUCuhtPBLQ9No71OhjJ39In02KZH8YzSY=;
        b=SPinehHv+bzg94ycNtZvJFfDFuLebD0DZ3cpLpQtZ/YUebJmkPCkzSH4wnj9OE31y2
         VWJyujXyKxFYiTAxQNgHsvFvJOKdYF3lcW9sRD2ODpa83wU4Xj6fmBrBEUfXonVqzNJ+
         I6i3sTdm9rlpcqImta9j4dcbevvpnGtsPXJ0e3SU4RvQDtNaj1M5+Ob73VfU40wpRUqU
         v7zOvmafuO272eOV+d4GWaoLPT1x2oPzgMUV9LrUxWw5lxgVEciMSwmC4tjQ2rA7Mzb2
         M9TLfRTgnzgspnoAF3ZnSZNXuTYZmvLkOYoyZpUtAFUHT1MV1tElG1AIKtg92Q7UU6VA
         oIvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJnX+A8ZmkXUgyLkyjgP2ncr/U957jH/qNJsg0FEgA8G+bjhhlXj0Q86vBojRmVIv0Eers6IT7YOid@vger.kernel.org
X-Gm-Message-State: AFuF++lDFD1CKcaAEYfYW10csvW5FXK3U28SqZSRNqAxMhlJ0QuXpiNG
	XiA8gWoYn0rkqadBjpuPUCGkDzKy4Y4gIoleatB2oJBJD5L55qn3LAak4gqlrqrhnQ2u7BsP8VH
	nMn0mW3z9DPa7iJy4+RA0M6qT8STXLMpCPnnnfcN0V8cMuMh+HX8Xgwki7jB4eNtf+abN8Xe1
X-Gm-Gg: AR+sD13yu0SBI2roLzTrvvfYQpea+rzFmAMklFFKLYUCn3jNp5CkB97WFdJrPRWQA1r
	e8Xnex8hTo6GYX6fw4Tx/RYPmr/Oze9+n2ZK4ylvbF2os8j1Tvvt/VmWvFdZmptKoZYvPRzWCm3
	SGPTyTKAWzduR5J3EF/uF/b6Vk2GN542Nuzw16JIxa+KjHqxmLwzQ8cMf+vG7PoUHQPq/knQNOT
	pyMrV2R2HhAnydwURzn+SHDP+1x20krBGf6oBjGnGqSHdWlBX7X8+7E2Wp7B2blFYrENFKwInLn
	owrlZsH2IWXPT3CB+Egm7gr9UH4LtXIOj4WZWbdHaU71twj7aUaffSjyOyGTZYoeyoSck1cnNGS
	uihSTQmNOKa7qxQ==
X-Received: by 2002:ac8:7f11:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52fb940f275mr60260171cf.16.1787908515977;
        Fri, 28 Aug 2026 02:15:15 -0700 (PDT)
X-Received: by 2002:ac8:7f11:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52fb940f275mr60259141cf.16.1787908515321;
        Fri, 28 Aug 2026 02:15:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b90f78244sm71091685e9.10.2026.08.28.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:15:13 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:15:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: hamoa: Drop unused #reset-cells
 from TCSR node
Message-ID: <oae6lszsj4ommijvol77a6vcfkbs6b5bhd63bhl4psqbuaze7u@ewetkfwppfoa>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
 <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a9151a4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oAhxQwU1FG-qALgQiYoA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX/v2nR1ABeduQ
 xd2IlZATHcsllLW2SvFkqNs7uTs/nk6Irc2+hv9xZaFPYqSbupdTD5wIj2sdQS2hs1krFq8CjHV
 O0SqI1LyBlOpAHbEszsvMGMdxk/t7JDa6KQyQHhfhZGwUBf91jetEp7Kdye44yMdiY8pqu6nvEU
 MQdE4f3SbGgcax5eWpzCDOealk4ZH4/jXsbTyXUcw6tF0+Dr4pV3PFNQjXqeMlUwyZHZ86l1A8G
 2jiIuqAHMAoj4rGXYkWIFRlj5gnbKUksoig3L8jZZAcjjSfefl0k7YVnUxq2K8+Hwn3htNXDL4n
 LJ982ggGYXQ83MvfOdU4D0/nTOCN5zM1UpKcRIFbsPZbZOj6gD2KL3XVN4lHV7KFQJvMuJsEYgC
 j9u86mMmbHmKcavP+wHbhnBDhDh5lfEalcAVc4sp/buAzA/xzlePPBrZ6zIKl/1fluatWPSHvDD
 gnAcah2ggZhqXora7Lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX/e73/KWWd4ap
 Ej+ifH3AxCwMgvd8kr/O1sxPdUsQYUSEKPzTf5gZ853grSqSPcm7wrGUpg+pRSSvqNEwqYOkXSR
 5bW6creuvrEgmNHCL/sR06cSo2ii48I=
X-Proofpoint-GUID: uGdnsRtap_5wzzHmfzQPc5MwRVN79stD
X-Proofpoint-ORIG-GUID: uGdnsRtap_5wzzHmfzQPc5MwRVN79stD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280077

On 26-08-27 23:00:35, Qiang Yu wrote:
> TCSR does not act as a reset provider on x1e80100: the driver never
> registered a reset controller for it, and no consumer references
> &tcsr as a reset. Drop the stale #reset-cells property to match the
> qcom,x1e80100-tcsr binding, which no longer declares it either.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Assuming this doesn't break ABI ...

LGTM, otherwise:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
