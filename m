Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6BC40F726
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718534; cv=none; b=Al90I/n4sHfqLqj09DZVhxCYrZj19cS/0t3bY2NyrVNsB6PM/MyNH0eCFq1xilRLr50BXB4lhxbMGZB4f3bPhOsUS9Zum8uEByzFH9EvaZgaWHfRXCgKHd4+qG2F5GPhD3of6Lh/hM3AzzmiguPmQgIJzgE2z/C4NQYEQCe1FgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718534; c=relaxed/simple;
	bh=dGaK6ahq6YdjKsxo58VyUhgDorerNjunqKzDeEDWtIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWDDqMem4FLb0HIMV44ATpF4F1dhdSTIbWYFJPwbMQE9+KMlzkVK0uii6LmwiTjGJxg6eETydk84Hvaaedm1ndL1yvFUJ8ZwWJhGChKpVdh1XKLmTWoOBlVOsydd3lKcMHB9Y5wFAFtyrOC31A4J/umEKdj2BONAZZRXRe41fe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rc/hP7nz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThYXRo2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rc/hP7nz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThYXRo2b"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9DlGi049581
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x3LCiuuukQ+P3+NcqWiQ5cLn
	eYgsyqSEhRzkWM6AiCo=; b=Rc/hP7nzDHGc8MdN+SYJ6dAvQqF8lozqSu7mf1X4
	LXAj8EYfgl6dTDRdfymXRKo23n1WJId7YRvdhUYqrkBkiUtMp3AOQaZWfEbS0pj1
	/AvP+NVoxGufMDPQv7oTSrpmPkC42ASJDJDOmQuHF0sh2jEbkeAuahCHLwbVw+vo
	fiXDZlo41bH1DYSzCrOnxo+jNpeochzcBYe2COKm2PW5DLJWUFw3UA31US887LRd
	0i3W/C89s1r4NQrViMmWyUalPGri+zxOyVBcR9w3HZXASzNL7WUFhPptiNOHQ/r8
	4xB72/HZ6OSOaZELd/aARlBUy9O8SVpZLJeLQ4AhVKfWQA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju228evh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:08:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so17947196a12.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784718532; x=1785323332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3LCiuuukQ+P3+NcqWiQ5cLneYgsyqSEhRzkWM6AiCo=;
        b=ThYXRo2bVqdacdXZm4bm7EAKldn/6e4hrelUWyZz0Cm2WE0B+6Ztd20C4Y6H6XuSf9
         xsFGLfACPl6MDfRbGlulZ6FWEsTiFFp8TE4Z7ClXEKrvvwYbZLlFFHNK97ZA6kKDn6/u
         u9kp5suK8xS2d4KdNyhmy+mH83eiZU0YEms62ZrqAAd5kA/6xVEIVinZ9uzIX2+tRcSK
         tiAEVuwDtkOJuooX4jDq/4swjq2DIxvrtO+pZhl22IMZGSkEUkfv5LzDjpHCQUV91xX5
         WwWbRzlgx6PnAcyIY4qWA/fZgeMzY0kIragjBJnLEBDpn9FVeizzFVe9mtgi6Oji1E4r
         27LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718532; x=1785323332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3LCiuuukQ+P3+NcqWiQ5cLneYgsyqSEhRzkWM6AiCo=;
        b=bowiqP8/im5YvtELb7k++EXsr6tPb3YFeIDLNjyZFgWGc6AEu9Ivd46IdN3UbnpJmY
         CxjLIVtszZfj7Zv/Ix2OUR7hznjqFrLvQbCtl00PCwT5fhePa2Uvx2kQw9FmU3HwUPLs
         /8/a340umyUI+cCSKTC7mo37+2m/oPiPr9vnunAsXvXSHqb8XaNFa7qqdwIhKcZmrsfX
         qQ7YaglP1BvwQ1DdJiiqLdoep4+UQYsDNhS7NF33kXvPccPbONA1VjZY6CT684P9jrql
         Lf+b8Jw+H1iRT3unYPL1QlhVsziaBn6MVRwN5dCIcjOsGcSc+TIdrI5+pl7ehllWTYje
         F3qQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZYY4maKN8Ak1/N8pAEOpuVtp0xA6Gk7J5Jy0Um3WEvSEKc/zi9UFzMIFDeelZqYLeQsuQvOxaDR0E@vger.kernel.org
X-Gm-Message-State: AOJu0YxnCUcW3gsIe8jyGNnqS66jITsQlkJoN7KHmGF1dm80I2CeZXOb
	vfTrzcJn0QSDouWsJ2CEKEg1TvRE3v40KGtU2M/4y3nyEupuIRHACSwlx9oIHibaz50dQXEhxY8
	ePjTheAAz/ah8yziHPRfBd07pc28oYFMz6Cr4vd7GCKU20bUjtlHlVF3wj6KSBiCV
X-Gm-Gg: AR+sD10KJNRUbTn5vPqezLzvCuBvlw9RQHpsX9yEyCjtHchVl9Cj9Frk+BFQl4hLV9C
	0Dzq3keA/UpoOQdY5yeFAt/lyw9pIRo3ljNW8hMKVmMpO7qvIxau534bRKL6xWZLWiT8wrhbjoj
	FRumSrSboFy5Ffqar0vf1YaEzUxjrZc/6cdS3bl/jDQmocVyEf41vSykFKcmyTlVO8TxfFi2YIB
	O7qnPSQMEiqz4GnAUiMQoK11JpdE5U20AwoQCwQYv19Y3hHOmft+f3BQhIQgN4PnwTqiZTAt5sW
	5RrlGo4AN6IKUdzwssCWaMWAOnAmEUNlNVlKgtJiHrvHjG0tnxCqpBfP0vjiakWhuGfmGrPdidZ
	mB0rROVBci4kFDZd9DbGVj9TmWsSd87VD1bwXmGvjEGpT+3uc2oYK4ePZfPyvfurL3V9gZmo9vs
	cT+Sa+xdSpBOg+SvYSbfWBrFR0fplDqg==
X-Received: by 2002:a17:903:3bcf:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cf34a80342mr261919085ad.45.1784718532010;
        Wed, 22 Jul 2026 04:08:52 -0700 (PDT)
X-Received: by 2002:a17:903:3bcf:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cf34a80342mr261918435ad.45.1784718531430;
        Wed, 22 Jul 2026 04:08:51 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a67esm9225691eec.2.2026.07.22.04.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:08:51 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:38:44 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5210: Enable USB and PCIe on
 RDP504
Message-ID: <amCkvD7YUV5IN/ys@hu-varada-blr.qualcomm.com>
References: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
 <20260715-08-dts-v2-2-b060b68e0256@oss.qualcomm.com>
 <56522c76-389b-486b-ac64-ded7745f512f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56522c76-389b-486b-ac64-ded7745f512f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60a4c4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=oMAPo0KStigxr9RxYcgA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: y3rT9DXxLIXpWtM992WEw7iGl9iCZ2L1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwOCBTYWx0ZWRfX3S4RZ3pxK6lm
 SbQJaw2RGd2m8Alk3dJusv1TXTHsSTvzN8XcAp4Csm5xBjTJC16hFgQhrF9JaeNtFfbyI7VO+Tw
 MM8bMOrqXu1hKajjUB0+lWd2FRjHhrE=
X-Proofpoint-ORIG-GUID: y3rT9DXxLIXpWtM992WEw7iGl9iCZ2L1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwOCBTYWx0ZWRfX6ZTXve5H/zT0
 VfdqYiVoqlkO5/oCbiwrPDmDXYUY4L0w/vX8u65s7AB+1q5OjHOhsKKgXXYKiodqx0fTATgtSVq
 5cMked3sY4BL6f/B6Tl9Y4ypcyTAXqgiKwpJmVfMStmFoQl+oLY1UGBSAi0bvEcHRBUoxNi5Fd8
 osNRMe/+1WggsrmZerMavi4BfTPSH3FgzXwNqadcsyzeWM5LOdxb+rq8AOuuzz6RfflPpXPbuAP
 f/BCJC0SqCXM1lLFJZHOcpIMwsMrfW3Kafv47TrBhlzFDoVsAk08Lz+pY+FWKGzGiCdNFTV0ozP
 OiyfcEv2uxOXSFNpVWeV3ggncVFk+GNood8rfkhoddgH2kBPkdvP3bSSXRcaxjHmNMCev2QeXpJ
 2L9FDAkzZMwSp0WcrhUd9WisU/WjxguU9QYMaYpuhckmv9oASFV8hpodWFFazdl2rPL4m59qIcz
 /5A3r9A8VcLuBulR12w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220108

On Tue, Jul 21, 2026 at 05:36:23PM +0200, Konrad Dybcio wrote:
> On 7/15/26 9:11 AM, Varadarajan Narayanan wrote:
> > RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> > share the GPIOs. The board has to be reworked to change from EMMC
> > to NAND variant. Hence add the NAND node but do not enable it.
>
> Does that warrant adding a DT for both variants, both inheriting a
> common .dtsi and making the necessary amends?

Ok.

> > Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>
> Are they controllable? Are they provided by some PMIC?

No. Not provided by PMIC. IPQ5210 doesn't have any software controllable PMIC.

> [...]
>
> > +&pcie0 {
> > +	pinctrl-0 = <&pcie0_default_state>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
>
> Please keep a \n before 'status', uniformly, file-wide

Ok.

> Also 'pcie0' goes before 'pcie0_foo'

Ok.

Thanks
Varada
