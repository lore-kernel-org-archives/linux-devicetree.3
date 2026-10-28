Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201958;
	b=ZHKDxUCWNUFugNplQ4TVW0DbCMEcpmxVc0TJOoTl1rIfDi0d4XxKcPnd3VLmIsXXFjtY
	 MBNg99JMRqYr+yJfGyTHnluG6Ur+ON43fPKYWCcqzzFPENfWcdjn7IiSTzTYEBwgtYU/k
	 XltZkaWtSS+97B/aRoWtAAyaLADTGkTKzJFs6bJClzBkd3EcFPSOxkpA7aCl7jfIY3lfM
	 QCSg5T7lzUnUHyqBouHxXrlCfXOukQTfc26Q7Lv4TmuVp3kZhqW1peM0FZ2nB0mrPD8tu
	 3wDKUSiZ5u6Lc+D6LKd5DxoOFqPY2gGV4+nufn647qNv1duFH3tfqD49YUj0KgjHq9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
	b=s8a8xJUWyTGnVygadHXW5ojzjy2ErKqjDTXw9UTYDGq6iV7cdvFafUSlh/zQHUpfoHgx
	 Wda76ZSiW+rDf4jRxImPrjfTjb4H6EWVWKt8HEct1AEpJfxy8QiXwHAQB1SbhmkB3bJZQ
	 W72XXi19rnIiA+H9xkrPn2KA2Jufb6IQQ/BD83JObrSFW8zW+WjPL2Pr3M/Ik/izJ5Tyx
	 xIQgnbeK9zYCMLOWpJ35oca+9FhL3mI7qVEIrDg9R65ZF7oIRCTtMvQ/xOKZsUeThENxH
	 2EH/2F/K36kSinpmhAsXvScwWcGMwlWRCzjEqGOGaHKQGSoZtvimV8oZ4jNYhVVOlcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4gG80mw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GcYKNR0e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F40606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F40606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4gG80mw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GcYKNR0e
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAZn51458807
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZeWqgO+2lHgeB2G3uZ2RGo9
	7UeDvnaxq8shefBQPMQ=; b=b4gG80mwz9eOkArK4wem2b/toBhwdMRvOpAazlgi
	QaGwu0u7Z+CSUeIm8cDdiaaaV6VPEWgJxDRpRzAyAmTESsDswyDXDYUdkgWFpKMN
	ol89qlux3BGZGJZaY7AvrxsST86HegLkTcj6z9xbhhevMKdSPQGIByzkP+jkBj0w
	jf1Ptq9UU6sm0/nXAuWg0egt7G9f1xDrnf64iWTmA8ikHndHH+5RZonOUPOuClp5
	k2/cbTn/BpNvlDOygac1DXQsbksoTqpXRWUSAAVJb3eilEOpaGQJdw29PQwUCt3E
	TDGLOPe3B6h9EpVUWVdOBoKUcya3aTTz1yUpU0PGDIKjXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttv86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:39:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536720195ebso24377191cf.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201956; x=1793806756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
        b=GcYKNR0er+TftOIi/SYWdWAcInKRBac6HiVcshS/Znzdo4ScVzc0PX5l5k1EUDZMkY
         YZrCWMQMnctc5F9LkcQ6KLVudrYYE42IwljfnBkPzL8w4+qgXQxxoE9kNJ79NeITZJoc
         +fDXwRs9/hz4ggHG2mHqIl/vDMZfpPMYa+aaj+E3SmQenC+9M0x+6OdZCnsWwoQndrKJ
         VrAhadh3JkxrLCpNiJGKT/Or+QWVSAgd/Pr/OD7g7Qgt+HI7ox37ayC+7tMhe4Lw90Mm
         fQQ0cJNiGXR/Siv8uqL63E7WNCXH7KlUuNdMa7lDtnD22IrqTraEUoDfHcx/2binu//D
         99gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201956; x=1793806756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
        b=cgPl743EmtvnMOJQPkTPpWQiVvCwJ2YNYiidF4pioGsq7q2YAlNvFU6g5WoalROn8o
         MHc5cS990KOocms1CRplvDmXR7aFmFlGlv/tRa86DK5qFGs6EGIt4wxgl2Oi53OyFaAh
         oI+aVSsYgjvanQXRRZ9WEylNVNjUPp6VXo3A8kzyhlbIn2cQAbpLTYVUzrb8GSugdj1Q
         pWMPq220NhseOMfahdpGCrMAhhEF7IjYAyo7MrcWlhFO+l141ajxyGUL8TgdTaAQfnE1
         FmS2i9IawVOql+WIyyeoWlaO1vL5+Lp8l7prMSADXVQDFAsdb7c5qFBPGwwUPqRGwNmW
         m/jA==
X-Forwarded-Encrypted: i=1; AKwUvBzeC7fV0sZWkdwa3R0p0Oieajhw16k+f7FP3Ug8jAvGt9Tz4ai6NMs3JsfoLXmCrdFkgT7+doZS79iF@vger.kernel.org
X-Gm-Message-State: AFq9FYLlE5yxfPDTCKTXgD6lcaY6D6e0c7+E0PYaUGBas2zPDzzfeKKb
	+skaZjCFMJOoKadVBDfH4zv4lnEY5+rY3wIR71Sot+tYVms2NzJwBJ6noQwSV4decz+8pF+T1Yb
	QyOVQ/linh0HlikfRIoXKPx+ZAolnfAJ31BGteZZgQUUbIXDwHwXSnBlbthk4fCdMDs3oAGXR
X-Gm-Gg: AYBFou1aIiaoagVT6HcJJhSUCJ7OZrElIZd2fDxe4uNiN1hjI0ZCCu0OaTTZaiJpCWJ
	K87ez+Rfvg7nUasgzyroKoBEeP0UoS+Lf5hJz5Z5r5mchmRwXQulB7y8Vh2KlTvdnDfFyND282Z
	xv5dDgXCRfc2k05H9sODi07mVWeFE3h7Kdm4YFiUqjelKXcxtZyOSJIFVgwuhkBFU3fqy6DTIkB
	AXW3vEL3Qs8GZ/o5s1MtUEfnZ6Fo8t1TQV843xIxtnwTRIoMwCgprQrwNoJMjKMGDAAq82Vzu7T
	3xagtAk6hOKi4fPyQShcN8EKRuXjfVo2pA3znMZlpBup46AutJap9Mfa86GpljkDccH3AHIv6g3
	q7MTtwZxvC6yPtvqNKIkdMGRvrZI9TB5yFdtcmwbFMw4MsHJTPLIapCLuocKdLthPbA==
X-Received: by 2002:a05:622a:410e:b0:535:86ac:574 with SMTP id d75a77b69052e-53fcb9fb299mr41722051cf.16.1793201956229;
        Wed, 28 Oct 2026 08:39:16 -0700 (PDT)
X-Received: by 2002:a05:6122:e208:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5ec4ccfee2dmr1553631e0c.18.1793201562412;
        Wed, 28 Oct 2026 08:32:42 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm26641291f8f.37.2026.10.28.08.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:32:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:32:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
Message-ID: <iw26iktbkxacfgbt6btvh6nd7u7b3wvogh5c6sgdt47ve24qpi@wsc7vilt3bge>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-GUID: r8XAQu1v7TaOAKCkxXKT8rWfuDkJoOmO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfXyimBeK9GXemR
 6JKFOMPq35ZS2XxCOcEhSSPxK06PUP4Zyoi5C7h52+v4oqZAJdR9JJTn52awf09Fz/Uni8s/4B/
 8c5BAWrGnf8c67WOubkbSaJY48IrEMY=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae21724 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Y5GSmcL30hd6fLb0oHwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: r8XAQu1v7TaOAKCkxXKT8rWfuDkJoOmO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX066jn3bnbcLv
 elXkIJ4Ie0i/wgRz/SXeuwBw23AXvf0EXtvXcX/arQawjk23xsFcHMLrIi+JzA3HQCaMchhZcol
 t1pbkTDZJ+vv5lIuSnBQV8blV6PcrDS9TyM034ZeO4Gvq801/zMv7kboVttI6UuKGPWV9yd/gjO
 B6ctiHb0i3rSU2+B0GczANmwgs62pPdombFyUsIX7eC5zj3G7uz7BTRLUYsF8ctr9YoJszacD8R
 KAROmBzRvLWwQHz/cjLo+gPNHQf7kWs7eYiZF3h2mzqmS6O37cScRhDBsw+InAigHWkFRrWJQgz
 87UlwXlEs5kjk1UkKtUDV7nCzSZ3OmL00zFEm9aYyB9Oedtf+39ipkeUu2tBHAn6Lao17gIExTi
 Msq2afSYOnEYR7iyr/J6FvxMHscWGR8C5Hh46HvDP0ejOTvDrlD5//+EZq/Kou8QIylLnFOmxup
 ygyQelPyFVv3Emq+8AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-26 16:59:34, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
