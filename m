Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501097;
	b=rkVJzSs8EpDs5+BrofT5bmmjvwiVpxaR6tI8McfQnXjLPPiiQE7IG3XAJxj9vKKdpsoR
	 NFBHeHCVEOKxhb0/D0TGCLdpq1kuNarZF5lUADIh4FVvAXj6f4ivG3QZif8lT24Ye3OjP
	 cDcl+JQy+1eZzsBXNE61CsM0a6fQDL3wwFnxvI428QlBx3kmE46MjHI6wHaP7t5Sk+DMG
	 nC8OWPhIp1pjq2gbWdZ8ADV8SEFUac8FLDSdsyNMSwLTrQWs2+vupoSN0M8+vDJ/MhWzA
	 bEC4iyxwZ00PZXA1cvJspzX6i7TBZ5uehPfOMKZ51zkQydYl4qfseSL0+ffLgIRQniQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
	b=zJI7P0TgWivswMyFaC9PpB49JcufS2O5khkGuIxIJY/im0dTpcA0igxAdm4CaLc/+ljs
	 oreYuYeVX3YvUaKrvDsYgkOEUNL+4RShGdMBom8aQ0DDld8STQkch51nnGub1dJdRfPdX
	 LW8R0JNkwJjuorLehfLNtnu1PmMfrRQx9Dc4fzREqXWjY76IXbkBy35WD2pRMoC57I2GE
	 sS3/2UKQT+wn8Dxu4Re9b7+wkjmIQUnFyXhbIdH/y6vXauFiAoHq/9an61f+phx2eCtjR
	 dzGayHEB7SURuAgPbW2n4iswJzAkUAfuTCa3Xfmxyna//6n81W+dEK/VXmOsaQyMg+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jha6VRrv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsVI5W0T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8AA606A321
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D8AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jha6VRrv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsVI5W0T
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxZU6927001
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qKQN33wg42pkpBLtGqBWtg9b
	yfzk6Ew0t8Bo7SdAs/A=; b=jha6VRrvWrZisQB7f0L7jZ5SFBRBsqegbN8CBx+V
	h/P3cCLvR3weXlnvMaCgUBTxQr7Or7S2b3UHTBwPrPt/c/6KEVkNflV84OPmrSAE
	V0/31Qkf3DHjNpvfds6+HliqFgEjx9I0NpqBtE6Tn//3MKW5hNQx8QWz6WRaAvgS
	iSnsHCargdNaQRxgkSp2gUkDT/1jbdJfGBrJDrMN0jXYKESD+4JBkBXZPIwOMNRV
	CKRJaO6rDXTKaG4Jf6iarhhAn6a9ybMKhkA6AF+iEHN3/A8p9SjFTQNXByoxmb9X
	2Y1CFQ41CZq+z0j2L1JZbdnOKlIEB4QWRlrCYonolhoC5A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5paj36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:58:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bebff9fcaso90269136d6.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501096; x=1793105896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
        b=CsVI5W0TpqyHHqRK3rmDr5QV3Cy5xOyBmfOlbX5RgVrBWr0HjSgyRX3Gp08x0bYWMU
         N8aXlq8TYzBvS0clP8u4DqKON2UorPUz8w895b8WKdlQPOQ4oS5aRCrRMVYOLI8xBGBT
         LIv4sQ2C7lNmfZHzjdYIIdkk4OzyBdPzfL9jLajkE+Ah0DpihTxHcHmaVYanYeJIxf1c
         jf3YCDcJZvoW5nUPke2R7Sb6wNPU9ca+aHaGQm8XqMt4TgAyEOaC1VcVeuw/k4ya/fwj
         aNfFXysySxa+YVRW4cbGQ/w6q7T5nRnoUIdktd8i9RnxB8qXo+43Qp4cwCerpY4sAFFU
         ojWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501096; x=1793105896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
        b=fHOosB/rWZktO3dFrnXcI8KumAo+vVdMIbyaEX8Itj6cbaiGDmsWNBHypXpoEXrotf
         VRUMSKyWlimoesmXpQJOG4u9YK9mfT80iF58hJbibnN/MIa3i4aOURlUwseBHjoTWDi8
         4qYOGpMT2rkm02+nswHnu7GbagKvJULci6atp6B3ESF9WZnuGAmtO5TmoYLYQy0rsuUl
         mnWfDP6iIQHFC7kgtlgEym/Q8Z1fjs8HRwBHF7+dn6YY5mKss6OS2SVSGfUPkG1Ud5PJ
         GIASujEEjOKEoy3YC+ymET52RMq5ojg6cOr5YFdFN6RIXtrh2UVQTmjUXUNkl9tfmMHw
         tuVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD4+ormbChDwFWdJTE/a+DHLYqU6swiuy2TvINqRlxqAU6pKrpsEFl+FraJ/oSmDsaURNMKgp1nHmc@vger.kernel.org
X-Gm-Message-State: AFq9FYKJk/LgcD9a+FB/xzMAeQWhHcGfKBqNQsbGgM2OMRzzByUVwAfO
	g0Yyw4l1qr9BCw7haNd5DlXPSiY70+pq4Qxy0cFKQUx1VbkQY1W+CuvfLCftm0T1nM4VVdJctLs
	xVogqAqQfIBDsfPI5zkrl0XTqzeuGw+tM2NEINkUjKIgIOK2WWCkU+I9/22OsRZ7+
X-Gm-Gg: AYBFou0yPg6/XbF2r9GNMeOid9vdFxF3bnnaRyzbD8n0SPh0HEaCoc0/dr7WaMV64FD
	nKU8ShfCqbboxjgPDnRkAWOhD1/u1jxBOCsxdnkwPpF6LY3HJfIEbe4j7S2+GhJwoL9bEl8KM71
	2OBKMeJpOfkAaVDbnMLd7x7jeBMIOGrB7ig5Wn4RfQtu7Jqk3XrcDz6CkiJAWbMhb+JPO8vMKgA
	cuqwHtWbwRUQlUknYfoJZZCVUT9lwRktR8JrKcRZ23NzibTl/vxAi1EXK/mvEsBk6UWfr3NO4as
	nKIHOjmd+mhyXAuEGrvMVspj9In6zvao+TxAJG4PZyFhT0rvCFJ2a3FC2lRnXmmL1qd0dlKbgXu
	LbC3SzwPhOIP8D3Bx
X-Received: by 2002:a05:620a:372a:b0:93c:b721:b108 with SMTP id af79cd13be357-93f29b80a35mr1761766985a.3.1792501095518;
        Tue, 20 Oct 2026 05:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:372a:b0:93c:b721:b108 with SMTP id af79cd13be357-93f29b80a35mr1761764085a.3.1792501094964;
        Tue, 20 Oct 2026 05:58:14 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d81035csm6353477f8f.15.2026.10.20.05.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:58:14 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:58:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
Message-ID: <npllqmvej6ua43g3vfr6yx2kh54iidd7x2gng66ltdujwi23at@fswwuqxc6l3r>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
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
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
X-Proofpoint-GUID: q2IFOAD-B6Pcq5gMrfjZiJU-Myl0CBLE
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad76568 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qThvZ3sH-gZQT-B3TrIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX++z+PaShkVEO
 3cE5+4fG8Z9jv58+0++JdLKnczOvos40c+w+Mg9MwazpHK42HejaBGkbQbJO3W/YxXBrgTNoyNn
 TOp4XYDDI0MXBOdfkGWHR/PH4XUH1/BtQtYJt7XULhpP4ns5qg62cLameHc5OPclYPdrH/j42+0
 5JpivDrzA4mX9gPvmNqTu5hIqlXPYFGrgG2wjWO/rHNQh20fjy1Bmm3XP1P9n9QSVH0IQwNFVL2
 H7VoyUqEx9Pgd8Doi5EGoxE+9HpxJmHjB6Sj8sTWkPnOthrPKWWtRiNgA1htIwHftvKQZzKNkS8
 YcsK+oWWh0qKMvARo3hWs43bQ0wJsHSYTI33qusr4DZ1ERCqUPFNsfPwX7ENgn1nw3KuXljXgh2
 nMc7PezdAyrB9z6b4gmUuvBJFcOPN+SPg03H2zwG76co1+X9Raeah9verN7MMT4MpbTUmM1D/kP
 LSL8jTyRDhiSQXBN3ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX1i/oeqBbRmYY
 sRDBwfEyxiEw3CFU1ORJ/c52yKsOTXeflRZgonyWJ9yw8pckHJCBBsjz4auN2Eg6GTtNODNEXrJ
 ZzN0rqrw7HyBDLVIb1HPpYMINC1gwT4=
X-Proofpoint-ORIG-GUID: q2IFOAD-B6Pcq5gMrfjZiJU-Myl0CBLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-15 15:25:17, Sneh Mankad wrote:
> Add idle states for the  CPUs as well as the whole cluster. This enables

stray space between "the" and "CPUs"

> deeper-than-WFI cpuidle.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

The rest looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
