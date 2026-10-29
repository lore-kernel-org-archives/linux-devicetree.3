Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263923;
	b=Od80Tcpj5x7P3htnp97arp05eDGfG+S9cL17Y8/+XAtup899WssVTUH+jyMOabbAh4W+
	 /q/ZXhsTC4z0obpF5/hi58vnfjORM0YooDGRXfECIXmyrh3iwwVKF3RWIH2NjLWyHLGCJ
	 jmS7dzb+fj9GbwkMlCGA7neEGzrskUTqy8XVdOK1FKg3KUnZitQboWeQnmccF+QdJxNid
	 Q5/g/wbnN5zqjjt6/TzgsteCKNjy8iXKoF4+T5P4tjMGb3Iuw/m3YBi3KLqqEcgM7Lp71
	 HOSHTu3kTg+5Zqv7IOlSdkeGFMqwJaHTge1p+OHQMXEoQcxchwZIaKDXFRcjAr73nFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4X4any+tpNBwR1eQM52jJjIuQZyhJ8gQ4zFYTx06K2Q=;
	b=PLgk1YsbS/67pLQQfyeGrDkStAUNrT6Av6eBNXK5IC5Oe4Yvv2bY3A5NA69AaJWl5nM5
	 HvYbPyyzhuPaFQJRQ+nzIZsgpvRtE2iPNC7smG/HStd+xrvJRn2MBeOho6u/fvZhpEwM3
	 ACBrDhszevqT0L0KIo9NIQHq2pVde6ffuHXq++EB/TdXfvJUioa/pwgDz51YQH8Mj/Lws
	 fInyv13XSUj07/z/fdRQrFC+cjVBdbxyFIMwf5AlF89fCsSB2kMeTD3DKb1mesCQWdNse
	 e1LaNKqvcuOgbh5PVO5K9GXUpE+qD6+ulXjloCSMgmGcvYlzx750Ho+txuPriHSinyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCPGIrKz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LstxmWn+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61B5606A322
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A61B5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCPGIrKz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LstxmWn+
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H3NG2974835
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4X4any+tpNBwR1eQM52jJjIu
	QZyhJ8gQ4zFYTx06K2Q=; b=TCPGIrKzjCSWP3h5PJlMJg5RBYB55gPdGRqJ+6rK
	JCzGa73VdvDYoNmf8/WtblZLsYUTjLU1uTpg8CT80KJAgCsGVuoG3iT1g35ZN+Au
	VcSYPBtXSRPpZp3Xf2BYsFeQNhQ66BXjAD4DDF9iJwTy65j/qKLnx6mmxd42zJzA
	L6usUXi7VLUmHRMj6HZ4J7rigQwKOORvcAT2vu2kwW+s82au8TY6yd1v4aKzeZb7
	QN23g+Du/zYQaJFMjuD84r2P20tzZjRdty8qB95hIoUif8sPtoMcsg6GLD2cIRPK
	g2B7H/48QlIhQwLSga2MElGZQicnIFNjJrBQjdb94taKGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpb0yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:52:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso113694185a.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263921; x=1793868721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4X4any+tpNBwR1eQM52jJjIuQZyhJ8gQ4zFYTx06K2Q=;
        b=LstxmWn+3iJSyqQtakDQ9UBEPK0rNZwr9PI4Run997dr45KdW5Jl7z5vXC0Z2vg1FX
         bRcm0CNf1/Y9nJYjYCIDOXTfuHcTB5BdzhQcGrI9XuWfPnHLQiNGvYaYYFBcmgC+TnmB
         olE/YuLnDPKOiQ9nBYbMxNg5OC9l+ZTvwKtDLMwAU0CZMLbRxKAGUwdm2CtlSXlKHTnr
         NFtlnQq4Tm+JLoMzae6OY4peHatlonJ0Sowa8ZtdKAkMuwr+QZGSqDvcCiqr1NlR0n30
         Tb9WRsBF14lc7cWD7XXOGssi2NIVdbT5etHf8bABjjT4JrgAMnvhs2LQU35ci3TguEd9
         ISTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263921; x=1793868721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X4any+tpNBwR1eQM52jJjIuQZyhJ8gQ4zFYTx06K2Q=;
        b=FpSWLIVXi/slpvCcNWqACMtPZ+/9CbO26//tbOHakcrwhfGe+IP6XHZChag4O7tNCN
         oZFiRQrISWweMjplyEYn8k/OqtIEtHbjTKoRnRO9XHXGS0tokQ/+yUukuP/NzkjRBWOU
         jg14IyytPLPxXEXaq3QsIyRjpCYCy2Xmiub85efzcz3JPMmwvB+hn6XaGBzrY+gH/ddy
         wyuK6twM2ASuFtBOdFYzQcjUePjqgENVFLPObxiip5Pm+xyglqBVZauiu4sZSch3iPst
         cZctpccM7B0N9tphPWYxrBfcFgQbK893KBI08Rk8ErLSQZ9/p/4BqNlPUmTQeBOPLu9R
         ECfw==
X-Forwarded-Encrypted: i=1; AKwUvBwH0tFQPJnPRAaEItn5i6szF+oawMYt3N7ensOJZA3pi5Ib0bZnTw/vkN2TL36QKL++NWSb862GjgD7@vger.kernel.org
X-Gm-Message-State: AFq9FYK/2S02kJ6avbIPq8B2+G88puTZeRtM2Lq2ix3MP7JobrnOB+yv
	M4aUGUSsrr9xcAHa8zt/CILT40kBvMxz4rFjEvVxSGqU5NTCRionBwEsz3pdvMUfhnWxhMn9lbk
	3BEcjptyLBDO5QXbzHXyFWB7vR6vdMWBYzkaYqSG5nWPpv50oIpmDkPEfL1RRfl7D
X-Gm-Gg: AYBFou0057pPOIyV/BBsA3sRKYXdUxsp8wG5uWvhOkq8qfwXGvPFVAaTMdrpE//rpFU
	yYpZsl0WI6amHdKwFkh++X3rw1BTRDiYtRcNAtQeLpQhlj22h+r/8GO1pH7mj2+Sv+O3k6XGEEm
	td++g08ZRJo67QN0ZVE2kBMuCNei59avYoErIiWHu75QF/uAZyUHWuDvZBIM4a+HObREFNqbFqx
	Ze9xVvnikMsvl07EhTNWFIs83p2ZERSstJ5UZ1Xzluj6KiHpZoeBleW8oZXQm1FIMI6yL6hLWJn
	/OiieSItJaSYKh4fLj2rdOFixhlbGvSkW4PEQ/KG9Pw9MLGw4iSVCYW/0gQ3DNNQpT39vHtKQl6
	FdomYtWM7MZD/5YTrVp+uGyCyxLT6wmInUeWYDgWFmqIYL6Qdyni5mmgPzosiycrI
X-Received: by 2002:a05:620a:1b95:b0:93e:722b:1f79 with SMTP id af79cd13be357-94408ce05d8mr692530585a.53.1793263920625;
        Thu, 29 Oct 2026 01:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1b95:b0:93e:722b:1f79 with SMTP id af79cd13be357-94408ce05d8mr692527485a.53.1793263920071;
        Thu, 29 Oct 2026 01:52:00 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm32973063f8f.6.2026.10.29.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:51:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:51:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Consolidate Glymur CoB power grid
Message-ID: <wnfymou72wbsew2krp6ub4z3j5om47fz5aexoyiqllri75rqgp@dt6g2lyrarx2>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261028-topic-sip_cob-v1-2-80ab6704aca3@oss.qualcomm.com>
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
In-Reply-To: <20261028-topic-sip_cob-v1-2-80ab6704aca3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae30931 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WbsCytHUCBBKkCb54EYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: afGXxKHMXMVv2Xc-YZ5hHHAT1A9IKdZ0
X-Proofpoint-GUID: afGXxKHMXMVv2Xc-YZ5hHHAT1A9IKdZ0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX3/e5gcGUDFL9
 zB/u8fbQm8FFIhMRcs7tb+5HSV+ZQe4OQu8isrTvx79sJ4F1eZxzWjQPY7IgJdQTf8aIEFnoeYO
 HmwCGY5oq7bOH0VErzNSezuF9BNsfL4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX+0JWgP/vNgum
 pkRJB+LNItnqsJL5VVbAAsUEIQsoq3byKTqbR+Jm2Am2KovLVCOQWZgRSHnQDDDqo7tZE9XCj71
 pp56Hcq518nVzXVWWg2BCbEe0F88gA+dq4FB4JbcPWkcL/YRJKEPnGK6cE9clT8t05TVtvXWR9T
 R2Zl1+SZfy38BYGAURB2ZKCDPZjfLpvJnfHuJUqUWmpYajiNgg8EG22Q3oeosAl2/xIpbgQGiog
 zDHQTuioipe9Boet4u0Am+ilZWyneeTHNHRIqPKkD8GPpTooHUFaQmuJJMg32qajMAD+oZgDqw+
 nt34G4nENUQ3EoKmo41IPRxSmk9mCyUmHhVGd6w4P2qESecdatnavKjJzLwIzrrqax6koQQqk4D
 Zgtig8cAUDc4QNSE6QAqPUnEY1aR3pCMdBm/qAflN5Xa9ZJJyZw1B7R+URyRWOso078RUk1xU+L
 AyZS9qlqwIcTeTFSlPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

On 26-10-28 21:04:25, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The power grid is partly defined by connections to the on-SoC
> peripherals, which (due to various reasons, electrical and practical)
> are well-defined for each PMIC configuration. Factor out the common
> bits for Glymur CoB devices.
> 
> Because some DTs (mostly the CRD) disagreed about certain values, I
> made sure to look up the desired one for each of these common rails,
> they are now set as expected.
> 
> This enables one to take care of most required vreg settings with a
> single #include.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With the concerns from sashiko addressed, this looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
