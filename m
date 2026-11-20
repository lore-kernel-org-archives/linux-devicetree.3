Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169278;
	b=MxKzaBdBCX0XRaPTPQ/bk18ox0IrMtEjdnr8BXwFz0oljcTKLFWdM0zgoVxhBdltPFqQ
	 OnT0hDvjQvfoUwdidEAihp7exIbhlPVHIDsjezfwpyXt/gqcFCs2bMJzLttc9vAsQqUpN
	 LlMSAno42HY2vpsrcRUmMgeXcpGrKJKlhC8L2efFnELhYHnefbvvr9jRTDXJPcSUN/u1x
	 edXvYAWUeHmuIP7pEmTP90KTFqmqkmcXeEpSjbQAJvG0BNePorgSvRZoqtGNQbYBVi6Qg
	 rCTBfg8AXh02QXm+WwQ073ddrEX9Y22rlMb9hOBAmhGbiJenBIMCimeTcku7MjSjIXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
	b=T98hHg/7kVgB4ViJrQtLZyId6JoDNCxFQKG8J+DJvEtBiozJazWLre/1PjjRHP1tkPpl
	 HQVZ7AoHu0ZOLKJkQkYMje+FiG2USTspolzPfqGPZDaAs796mtyKlcNxrglHmeMbLdD+l
	 La37TSLSNWEWZAnzqvOvq6yCsr5sP7o7uLNR8qgtYe4iqkUOL2eJrUr/kfe021+cPzEF4
	 YokOu4QcEr4wn4HZ+8Ke4L84O9Y9cVEB300/JYWJ0Xw+KwsESGTMoawO3aUt/OiJTs99Z
	 +kWJ15rv5CdgW1Lz/mC7NR48GFpRmvTp4PZQwz6X0t3DHDQel83+nu2mEk1W7UdC8KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqHRQxxi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gR/nZ5lW";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10E1606A330
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D10E1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqHRQxxi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR/nZ5lW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eq4d1268332
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mG/rT4UghNUXT3K+3KmB2T5h
	Q5j4h+o5zz/Q6dODnAc=; b=MqHRQxxiczegEAQZBfwxNU22C/SoRCgiQ0fJlCqv
	/czQxgk9Dt6LpUggnt5Eok/C0MnS3wuU01IFVPJSnQUJ8fLmi9gy1cQBnNGLF0PE
	1exYOLwsDYM1VmVyAHfEoF5b/dCiXq5ULZPb7FrzG2sWwsJk4EC7+wCvAZPvj6Ij
	tkJrZSBk+4X3/JDGM4LDTyzF/PsK4Z1Dc17+AXr/sCi+VnQaLD2Nja+qpUnVkNsx
	DbOZZiPjmFXpUaDdB5AddWMI8UI1zOxNwiOcZB/zxq7Ccl0pO9xvoRyBKPtHLiQ3
	c2cdxHU/B3rpF2ArVOJMXHBA7+xNE3DExLwrbJ5Ta6XYsg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1svkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:07:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9213237a52eso15992816d6.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169275; x=1795774075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
        b=gR/nZ5lWSjrcMVuk7HciyFObAo/bq4uwaY0xR+5vFDlj88VX2vqb8CELmVMI+E6DbL
         M1yTLdwwCtisZ28m+jrobnLwAATeXa4g5nWL4a9ssDir5yhPmI/vEDU7VDlcBbH0CW9c
         2vXSpkqo8Vt3LZ11jSTOfIX5OB3TES8emh42t1B1ASUy4UU75tOQjlc1B9xAwrZnueJ6
         5EoKyFT1cmug5yW/TWFSu5v13z6mMz2hwahxAJSp08uxizNfXehGrgiaQv8hDqnG3CNt
         x3esoPtff44qxh79jt3AXMaeFfGTTL1ONZDWbCBsl3urtfer267CZ6qU+HbuNpPmR74X
         x0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169275; x=1795774075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
        b=ParicHuv81Hiidc41fKeP72jP1vCTzIUnkZoZvwPGmULlUTa8/5vx10GoDkPGs+A0H
         /JQsthHtmrQ81sxahhTMvRa0ScYjmkC/WyAT01QQ75neNDApTMGeKZ1z5tU/5c5gebuO
         xiYqIxLTHozXGH67CtOZf3ScFQ+5hT70XD23vKoOVJNHnXRZsGCb+x4/bxcz+SYn3AVV
         djn2zH/Y97lZVd7QpdEWd1wLradhhmtATcFon83Wyc12SKK/lRExTy/EZY/NMBL7FRmY
         Hhvpu8jDk900xQsW9lXDvqgtk1hcvajRZbXnFl6SlUKp90Rcde5C0xc6B2eUf2ZRl4IS
         L/7g==
X-Forwarded-Encrypted: i=1; AL+hErEAFN2KYqxMNKel3ZljwuA8l5pI9VVpEGimX852JP4BpE1mvzFrBDefrHVy4uU3zPAA/9BtPtt8G4WX@vger.kernel.org
X-Gm-Message-State: APuU4Z+GwYQXIT2RarNbs/DqBXIlFH7p46Ky1egrJOEiRliTDSoLy+Zk
	maBbe01gYcNuU6ZuZIYsqpH2wmUZ43C5NhHNz5EuQymB2jzsd9VFXBEhfAhOJY0jwhSUXUl3Z9q
	r2gNcu7YDLS6JhUHSzG8BveqmLQ6NutN/DnglNJmmDVwSznHIY2VRsKpTO4gBD+S2
X-Gm-Gg: AYBFou26QoxmU8qI1zpPvM40NUtKDigYjqLjilFOeEdhviEQBIXaa0XvTjG1B3bpaY2
	9fJPcO/uUkk7aL4JfLDwNzVLj4jG+cuU10A36JJOTC0mZVgPbbUM98ng2hAR9mKVUp4aVk8KbBu
	dbE1OLbVrdZXXLwQ1rG/hwfQOQQb9Vl3D7hlk0DmxSYiXPAtnurgcUMtErnvGxXTM1ae54FJFJw
	T9vlWEYpRyq/xkGMb/d/QG7FlPJZ/U8QKjfUOdosOhAd/pDG7ZsVND97bwSWw5DP/NxbHeiyWig
	OV9TU09k72wPV+TNz39ox/3udx8C3/+fOOhs7fetBnuOCTGorFpDn5IR9geSMzH4jPU/lHRlHK7
	g7QsrQdifxxxO1YtVDuz3VarxWg4alXS35ZYEKGFoVJENqsQIDTS03QIqoWmB2kNw
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr449682485a.26.1795169275002;
        Fri, 20 Nov 2026 02:07:55 -0800 (PST)
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr449678985a.26.1795169274365;
        Fri, 20 Nov 2026 02:07:54 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm4306233f8f.25.2026.11.20.02.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:07:53 -0800 (PST)
Date: Fri, 20 Nov 2026 12:07:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
Message-ID: <6r52ghmfpdspeeh5ucxbcbcoir2fti4j2pyptdomgwouudpo7e@qsspx4h6hjmc>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
 <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
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
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b001bfd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-HzP2oy_C0ZWqF548KoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: qWsBLmmxxtQAgFLbbUEZCAwfrQ_9uXDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX8JytKs8b/Vhx
 RXABkH1emvsju8eee55StwY7raGGHR+IojUL67qGmhmFTq053+3IcuT1Kt4SIItxbrx91xvju0+
 rMUuEpizg7eR0gGNu5nEx0jIhm0d/IbJetVJkYNxF7fHD4ahyI9R4eaIUtXDrm0js75v6xO2oFc
 mDHTLi1T2lM3AZRo+Qo7W8bp5TySLz53vNp1pP/wU7yUqhOhQ89xH6an0GNcLsZhEsYe1rB8l1w
 5ibtC4PyBrZUCvour6Op+54bdo0uD6HT0VBKJfopN/BlhL8svzzPFE1exeIilUKfdnLtVrtjfmP
 3NxSZVq3bgoECWOD6d9/XfCzU57cOC3RVnz0NComQKFKblraY0zuv8FAjhg/Iq/5UG3RFZITofW
 1zZ+MQiTpU2v0GZv4FrqS9431yaWmeqOLkpTtkFmUM7Zr+cj3KXhW4yG1qXASFkQTOcuRywShbM
 ou7+8vSJISzLJgL1ZuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX1g+v8ayoPQJo
 7k6csmDjk4LETSZoe7iLKwO6vi3zeMwSesWxhxFCrD4rrddqZC6KKzbeU/5/pKBQN3QviVMdY/T
 GSXLSw+MoozQ7VeVZ1B0QIYd9ZAwurc=
X-Proofpoint-ORIG-GUID: qWsBLmmxxtQAgFLbbUEZCAwfrQ_9uXDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200040

On 26-11-19 22:34:21, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
