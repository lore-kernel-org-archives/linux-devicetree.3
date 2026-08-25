Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306643D1AB9
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643140; cv=none; b=dTlFjKCqgdMVCBkMoXpJ7DphcdM/sndHialkGYgFuphzlL1FxeyDgxKXOooqXm/+JgXOexjmmv++9Z9UrMNXssya7TWWABXn5ZKXHJ6Brb43TX0yDwnpMQJZR633OCrkgVjRWoUXMkHZlvfAelPQyrCcQu3fXR4upmNI6tnJlLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643140; c=relaxed/simple;
	bh=dTwNpKk8N8kgncWrTTO7zvLEhq7TT8nqNK5NZ5b0yMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaNO+TM4un9bjCqkORa+vU2B7GomNnYyiNl/iGjzWE5ealxFFZcNkLA3LcNKn5OZiRo2znAtOxC8+chfJp6tfTrjw6nVedcOxCgFVb/FDsXC9g3p7BB/Yt1JFhx2n4RY470z1wMKKRzczmOK+gxsttWAzUR6xvKGfKRE0+bi7uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbUnAOpu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGfVn0sC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbUnAOpu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGfVn0sC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2kvo31220149
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NT2lFhbfPlZQGuRI26S9oAnW
	5Z61qlnQA6zo7TnKr/w=; b=CbUnAOpuGMRJ/gTRD2MY/Ft7/OQnaVze2Xki35eP
	jt4k0N5gxY/syFPkSjQGk/A3I3cCHGDjbvcGwn0V3SY4Vg3Q13riW1UPbE725WRf
	BospkoMboko6lK2u89QP1utZg4W1+ZvTjg2PlVCezxuym0D7ydEr7PpT0eRatXCo
	a62vqcid/BDabCQADEBTCS4Oh4kazAVerO9AAxhzSfph8r85Y3tzKQ7RQHASe8Av
	xH1SnzZPSm7uK5HMkIcQ2kHNCTm0Sd7ekSA3s6OEw8Rwn3j6bZL7qOhgSr6gMBDD
	UqzloKxBlvgKuLXwQFG64/niDgMdKiW/33uabRLcyNG0qw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqrwuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:32:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c8d271ac9so69244196d6.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787643137; x=1788247937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NT2lFhbfPlZQGuRI26S9oAnW5Z61qlnQA6zo7TnKr/w=;
        b=KGfVn0sCBwU8w0xwIFP0GtayGusoO49N7Eu0pEHWaOAuZesQRoWD8QokQL92fHbl1t
         enhQNUEpOqYGTqeNaWG38zCzjCXiEhA5ysKh5Pz42ZJh4mr8fRYyWC82hbUpa/S8A5ER
         HxN0RBeDcbQ0jBEqZb3v+MT7QRoTllE1aWH0q3OybUTx4dhkpc/L3GhzcxdAaPrI1BSf
         Yr081m7R7Otd8ln2m7EKvAQ7sTbV58H+OrftaFw0J+/zp3aHG1ZRw496iAHocSHWvm+/
         LYHs/ey6fy9aJJ4miVDL/QV07vLzdn6GKO0T/PiGUQtRAWt5qQDOcDo0BBb+nldvjJt9
         gE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643137; x=1788247937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NT2lFhbfPlZQGuRI26S9oAnW5Z61qlnQA6zo7TnKr/w=;
        b=kiBWe7gmwqTBDxiEgc/X8eQ12mAzrUQZ96KPfdwcQeX1D6W5/bsZdb5AL37k8JoHB/
         ZNbS5aVrmncN3ssP9XiP8GRXgruA9KzLJXzuDfK9M2AVAWD+SHUEPnDzyQAs+Qt1jz6n
         u5sry5TXSh4A/3ljK0uxmyZPJpBUFfFfQXuxmyP4smNZiGVyQoogGGdDyu9PwGxJR2IS
         zWo5z9lHs9WBwrg+RyIbUR1CWJobZZ8WM4k8PvOV1b7+3rwh+9xDynERxh6BlVQwVpea
         EJj383WX0QBhTLWarCnS17c5IS58Url0yIfBJ/93EPESVN9J26Fm3c5B/fFkrbv0P0vt
         QYlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/2uB/r65bq8z9dJf3ohxyJj6zlnQky2ZoGpVAo/+XbF16RUGy9hS2Qr0AmhXS+PIRaAQVu2FN6Tks@vger.kernel.org
X-Gm-Message-State: AFuF++n3zh/1pc2/d7BrrYRdaZEo8Gul62CYYoUce9j8xMA9H1K4zt73
	EdYRbnHVBTOddnziIOqsY3qw3MUy6ZsQQBQEuZxX2nWqEVhKR0YdpEEG4ltNcHC/Ims2p9BfhQy
	qBMnUozjZGKuM+C3EYa+UEmJuTu+XMyIMfk1Ni4F9BXo2vxQrCtn0W/M2eFRXvid/
X-Gm-Gg: AR+sD10bMViEr8VK7q9rLbl50yYlfsyF6YVw+YovfuhJiBc3M/VnBiDizcgh4D6kX8i
	N1iQcCM5B1F3l8zc62xBEVRsEDj38sg5fm5mgFV2Rui5OVyViaPHza66Lqnrtns77E95LOAjC4h
	A7pPlto415XsdCe2zibhXONPba+nQ83NI5YYgJGuJ/wB/BxT80ANDuET+Hh9NFPyr1P5UZHaKCs
	8sPvdbUrn6BcHMov4CgF8+vBiZS9FPeU3pC8iDFt3WhWoa7ONLFTDVs9jpVytRYao0VEXrgL3bl
	s1u69t0XyKX4dAB1NLbHHFB2FmoED6uW2rsPqsVYZUbPmCPIEjt7I6XWyw+lghZNc+wOLX9B/8t
	5mKik2cVJeqmFqg==
X-Received: by 2002:a05:622a:1492:b0:52e:8ef:5960 with SMTP id d75a77b69052e-52e09cd9537mr233725521cf.33.1787643137295;
        Tue, 25 Aug 2026 00:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1492:b0:52e:8ef:5960 with SMTP id d75a77b69052e-52e09cd9537mr233725191cf.33.1787643136883;
        Tue, 25 Aug 2026 00:32:16 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296a46sm1771952566b.21.2026.08.25.00.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:32:15 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:32:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 00/47] clk: qcom: Tie CX power domains to GCCs
Message-ID: <mpydtxq5qvohmwsujzll7ilxi64vareizsvb7x5suydycwobhb@cjyu5uavd6ch>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <aoxxR2j6s3r22q7K@vaman>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoxxR2j6s3r22q7K@vaman>
X-Proofpoint-GUID: Eh2vZY5K6rpRW3KLIh8BUiboA_oFlULp
X-Proofpoint-ORIG-GUID: Eh2vZY5K6rpRW3KLIh8BUiboA_oFlULp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2MyBTYWx0ZWRfX/8ER5FhRb1U0
 XGeGoqz2qrXGNVPojWErci+/xnkH7j7aN3bqm937Y5d80e+rqn/slXapscK5/EKZN5q9RBBWoLz
 CJ2g33NoIhZJuW4JPzi8ODSYQMpzoTcXU/RfGNyqul6P9Y+vdwNpcz+4FRygzXXnsvrHRQ+kaBD
 GUHCM1iUeiPVHp/s9ch/qykRjI6SwfWvMEXh7lEhMKRM1m6Wgt7bvlOCq93sfbx0v93ZvtcdGom
 cX4xKpTNhUlgGAZEh/sqDucP0aEZVqdViIrN8mpELoqixBNMPnAPuRJGtbVgazFuSLoqwiwUv1Q
 4l0t2FvtkHdyUcAw0wE6/X+XJYbqpFv3aTTXGTFZvU9lu0a6bupoviD/dBgo/ImrWZs/aYF/gKo
 wZnekid7MfP3V779F4DgXWn73h/OUoh/Wg849RyiP6c7cg9zwsJtNh/Xbar53klvndvhlKvnFAV
 s4apXSEclCfsVKnivNA==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d4502 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=fUZsHnY_xkB4NMSKZDEA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2MyBTYWx0ZWRfX1N19SECoVRs9
 H0qEOmFEgF7V7DmpbXECxCEr9GkSMPNyboymbRgM6d4LGfKJh3qOQEGYrmv7QXpBDtgvWYPxYGa
 s0oaEabBqMXRSJmEX3QD6+UQH4VEJ+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250063

On 26-08-24 21:58:55, Vinod Koul wrote:
> On 24-08-26, 14:53, Abel Vesa wrote:
> > Tie the CX power domain to GCC clock controllers for SDM670, SDM845,
> > SM8150, SM8250, SM8350, SM8450, SM8550, SM8650, SM8750, SM6350,
> > SM4450, QDU1000, QCS8300, SDX75, SAR2130P, SC7180, SC7280, SA8775P,
> > X1E80100, Eliza, Kaanapali, and QCS615.
> 
> > 
> > ---
> > Abel Vesa (47):
> >       dt-bindings: clock: qcom: gcc-sdm845: Add CX power domain
> ...
> >       arm64: dts: qcom: kaanapali: Add GCC CX power domain
> >       arm64: dts: qcom: monaco: Add GCC CX power domain
> >       arm64: dts: qcom: qdu1000: Add GCC CX power domain
> >       arm64: dts: qcom: sar2130p: Add GCC CX power domain
> >       arm64: dts: qcom: sdm670: Add GCC CX power domain
> >       arm64: dts: qcom: sdx75: Add GCC CX power domain
> >       arm64: dts: qcom: sm4450: Add GCC CX power domain
> >       arm64: dts: qcom: sm6350: Add GCC CX power domain
> >       arm64: dts: qcom: sm8150: Add GCC CX power domain
> >       arm64: dts: qcom: sm8250: Add GCC CX power domain
> >       arm64: dts: qcom: sm8350: Add GCC CX power domain
> >       arm64: dts: qcom: sm8450: Add GCC CX power domain
> >       arm64: dts: qcom: sm8550: Add GCC CX power domain
> >       arm64: dts: qcom: sm8650: Add GCC CX power domain
> >       arm64: dts: qcom: sm8750: Add GCC CX power domain
> >       arm64: dts: qcom: talos: Add GCC CX power domain
> 
> Don't see 845 dts updated?

The sdm845 already has the CX attached to GCC, it's just the driver
that needs to change, to enable the runtime PM.

I'll fix the cover letter as well to be consistent.

Thanks for reviewing.

Abel
