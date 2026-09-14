Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFBB4746DD
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394079; cv=none; b=IiDSAWczwzcMw7jLU1bW/UUuowYKh2nXZbjwyqmbNjAZ6F8UMrC/ngRI2jgR24E9nrSN4YjIxcquGCYTyFwzwEQBYuQ2CXID9jxSFSwLpsb21Y+BkeJyyef4NAXgP+C4XKikPyrZBVf8OCvb6vGFa6uTo8lmZcRRoULPi233J/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394079; c=relaxed/simple;
	bh=FO6B7ZAaXGZLfF5gxpyIHscYj6HA8lcMSG3+bwdUkO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYhEKQ2RK2nilX12HkuX0qMDa7F7q/5Xy34S5O3tezg2jTXpZfOcikNlVRbvRX+LAfERrg+8v0ECK7QzbgUkbae+USMIT0PbCNI6COTVj9V4jKEaEIWgGH/o3bWqlFUuDwLKgCsgOg9qIkhgTP3sCo16zaSJlwyiZXnJ4Zl7duM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOZhbNET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CkxZ3Mxh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOZhbNET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CkxZ3Mxh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0TBl3588125
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tof0ENhBw4ELkanr9NwB/h2C
	JnA1o7lWbEmswvGyBHU=; b=YOZhbNET4jdplSRTsO5/v2ZvDkRcb6X+TmtY55TO
	vq2F1u16kAiron6NM+K47sZWVHFcM6ik4OiZpw11bph8Hpubk80KCw1rpVzM6X/t
	3ePdOIW+YthBMQo+fWg1QxgnzkLHvUlCFOYifY2/rF/jnBaHXuWwOB97pWBTjDsA
	2SrTN/OjIaJ/1rS7UOfTlPKujGDvFLIECn7KbxdaX+vXbLw1aSAus3IUK4crgMhV
	d1TTg0xOy1kR7KJ+7JbD9s+RLLcr1XyNd4bjbpmcq1CEyForAjhF7NGEXY315bHp
	NMHNRhLlp9g6w4yjBa6iX7NiYM0HfTUnm9QNfvPqcWiFEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8x6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:54:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so691180385a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394076; x=1789998876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tof0ENhBw4ELkanr9NwB/h2CJnA1o7lWbEmswvGyBHU=;
        b=CkxZ3Mxh3o53L94NYdcawb2aLB4U/X9Vv0+lTgfhntsRRviA7e4DhgqtqHH/rhTiQ4
         l6JXQLf7M9SjGnkksFg7qGyBa5B07AIs1Yd+/YnlNE+mATKfX8zyPBm323ao3q3h0v7R
         MMXj3ow3dy45mrhG5+Y/IAT3nYEyYvcGHw3F68Cuofn4PoVIIStE76EnvuS9uB1QC+i8
         lkfqRbvWs1TYwFt2AWQhgyHxhpy/fS1eSOExji/B4t00nu+ei2oF2PYByPKZhJFy4YPG
         Cq8deZF1NbVzsRe9NL4yOwmJUr0EuQKGx7eM5drd4b8qpbfdUk6mB1sw9npWKNnWvv03
         FM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394076; x=1789998876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tof0ENhBw4ELkanr9NwB/h2CJnA1o7lWbEmswvGyBHU=;
        b=L7AlL+umH97JA3kNFbdUN6JkBMDg1xjIDfvfkSx45+xnvztdYCy5MGY5g/zKBZyPT3
         z724JA+9rgEPbFaId3h31l59FZTV6U0p1kGop+bA61Engh5uQE7DTzek2DhNncYmBgla
         v5dJmna41n7nYExK3ff1E2qw8qI/s/64z9ebIO1VPC3e+5qjJnjIZa8Ln1de5U/3ljDb
         o7o+lR4Fu92CNIZWBAXJz4KXFjWozMbsj5LQQ/V2Zb0ePo5qP4FNUv36/kct+I4PY3Cr
         NvdlFcoTwjSm26CgyoJE6JhCP5o+5CAYaoAA/9IqryAKWm+qOUo1KENYpz5nyn9WofPR
         jkEA==
X-Forwarded-Encrypted: i=1; AKwUvBzASDaN8o7DCO2/TLU4P6hGw3HkBFrmQH78HW+8NaeFEsDc5i9SjinyTG9AKBW8weZBhRadJLygom3z@vger.kernel.org
X-Gm-Message-State: AFuF++ncxIqMJwLjC/mvTw4e8Vxh04FpdT8akSrB0yKX6ou/KGqe4rh1
	0NXr1CQ6q6HxOdayKmY9SKMuYrvPzZ+Osz0GGilrdpLQUC/z53fWqcr96/0pwlWHFqc5snTdjum
	M98bo6MMKkLeN7zVALni/ERtF/t/vmks47MQvWaJDxsenX5k45+GCNOKxkGnDetdd
X-Gm-Gg: AYBFou3QnkgZJRv9B3wpBNYunncgLpr3ZwTKudb4O4YgLfkkpQAm++5weM5nMewDXAb
	DqH+2ZrIzbyRvcA+3n5IDJPpnasI7P/YWU4IsYr3sTwzduskkij9L+M85LAidYx3xxDf6k883Vp
	qDYkiB5uqv07sDASbzOWBVp872Htsc8spMpnOkAlD5Jmg6+0Hb3Nl+DqsiGFy4v2fjb+JhkWwmt
	q4zKO3wf8rtS/sWP+y5nP1cwNGNsYcwA6EEe0a4HB/SyH8xM/I20r7KiAGOa8KHuMAmMCccGNKM
	QgIssKVHhTiQxAoVq56LrCHRcMUuK6+y8cYPtAQqF4eT2T12jh9Ti5+TanRS65ljCwjuRw5vdlD
	3fX2qsSDpVuCDaF4=
X-Received: by 2002:a05:620a:2702:b0:93a:abf:8163 with SMTP id af79cd13be357-93a29a05868mr415532185a.36.1789394076029;
        Mon, 14 Sep 2026 06:54:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2702:b0:93a:abf:8163 with SMTP id af79cd13be357-93a29a05868mr415523685a.36.1789394075329;
        Mon, 14 Sep 2026 06:54:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm304604975e9.8.2026.09.14.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:54:34 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:54:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: nord: Add PCIe PHY and controller
 nodes
Message-ID: <zpf7ndcqomayydr5axoim7rf6brenhs7nkexw32gkyo5cuamxi@g2hxdgle2h5p>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-2-shengchao.guo@oss.qualcomm.com>
 <aqeigXZC7w4CmMl6@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqeigXZC7w4CmMl6@QCOM-aGQu4IUr3Y>
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7fc9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UMe-PY-mz3fTUZ27lzsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XDks99JFZn-mE4HtAdVjO1kYJ2uyhG-0
X-Proofpoint-ORIG-GUID: XDks99JFZn-mE4HtAdVjO1kYJ2uyhG-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX/sQqmqLIWrUN
 rY4KYjBG5Do8g7rz+92tmFrsTSV2a6hg7xv56JWHhEOA2HbCyFRHFMtYBSVEeoIFpEePW09OGxi
 +YZWKXGoVd6h6qgShT5bV0rWlYXO44g083AJcNXEP2/Erekg1U7OQXLs3VqNSQgM2hMXmyM69+R
 YMNSY5he0XKrXeLILhv2KZ39oygMV1ftCRtWzOLIOH4HD4AhavOurhm9YozxsXAfgyb2vUIfxcW
 PiQ8evUWI/v9H8Wmf8cE7agsFEI9CQ4BfrOTfaEf10ZGqSmaWfDWUefYbMYBb74b6oIgTdR7vuq
 a9wCpAFTUV5SSo5XIHwIXEG0ssYuVUKGH0wN79QnPqMX9z1vBGwjKNKkuqLzlhAPJBWQZ1cLqmO
 1e/IqEowmCfHGpEPKJdJXmlw+M/9vCRRYJQisIE+Mn92SqDZeaQ+4yCs9IPserV0v9t+zSzGK2x
 YcHWPTMsMjJg0Nuf2/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX3EfSfD5t0VvG
 v8qXDbfTS4gcqr1C2Z3SHoLnwHrzMp9ln5tI/MSXZ6dEU3+OKr+5Zof5RzSFsyj6B9sAuQWRNQC
 E2O5jt0+mnf9Ja0kLvhOrxM8fEI0DLM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140199

On 26-09-14 15:30:09, Shawn Guo wrote:
> On Mon, Sep 14, 2026 at 03:19:40PM +0800, Shawn Guo wrote:
> > From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > 
> > Nord has four PCIe controllers backed by a single quadfurcated Gen5
> > QMP PHY with four ports (A/B/C/D) and a common PCIe SMMU.  The ports
> > can be ganged into x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2 topologies; the
> > topology in effect is selected by firmware through the TCSR link-config
> > mode register, which the PHY driver reads at probe time.  Describe the
> > x8+x4+x2+x2 topology, i.e. all four controllers usable, as that is the
> > configuration the boards ship with.
> > 
> > Add the controller and SMMU nodes to nord.dtsi, and the PHY node along
> > with the per-controller clocks, resets, GDSCs, interconnects, OPP tables
> > and TLMM pin states to nord-embedded.dtsi.  The four PCIe pipe clocks
> > also become available now, so hook them up as GCC parents in place of
> > the <0> placeholders.
> > 
> > The controllers and the PHY are left disabled here and enabled per
> > board.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

With your own comment addressed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
