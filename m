Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370823;
	b=A7tMDPwp85voOUgKZRf2eMbv/nqE2t1ERKciiJ4LLtp3WxoXcdcTQs9OZcFcMGNqG2nF
	 amnEsHmmN511fLNmSTupW/OnIQBDiq+swucNCRBi2U7GbOjQ3EzLgdBbjt3p2at223//M
	 VIgk1CN6oWrd1z9W6KjJjiQsdQPWXhU/3FOPhR959dNsHanALl3fhzvZmahpumykI3saA
	 UeiRcVeVOIsL7g5+RvREcIJt1uA8pqsXl2fD/V2d4b12pmIpOy53oVxX5/bjJZvJ3whxo
	 14XImpZGBQaWLQzpM9z4y0/MVEgZoOuCBX0MeD1bfglTRbOlEi00yfy1aYlieiice1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qiQPn6s1q5c7xcpZrlCDQ6qpZqACFmX9HhK9uA8qPdY=;
	b=MeG7f7SWmUh+DzUAG/WE0hK3R0Lg7K4wl8fpBc/9ZuiHQ38kwj4pNVsIqcl0V7MPCUL2
	 A+WQU5EDHmrLoVRJCbmDTZfViPe6ykhYUN6ueFPCYRGrM4k5IdE7L4svFJ01mONR2i8N8
	 QgKDgOFtvm3GD/2ChjUO0KJ/ukirAEpI99mYEjsEa1js7+C6zo3v/VhliuOWfFGnLPhJr
	 XnQLCozOXd33ZQMMC4vfoTd/LNTz6Mqah8R2Fman+wX90rUj0RVrtg0t4HrRznrdcdVK/
	 VvsdUd299Wo3S6Qq6L5qJL76VCE15W4+tNWKwGmvjFQXHuyAiRDYrt5dmQ3ZaC4T+2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ULCjX+Yp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFPf39c4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD27E606A320
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD27E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ULCjX+Yp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFPf39c4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB3XHMq1176731
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qiQPn6s1q5c7xcpZrlCDQ6
	qpZqACFmX9HhK9uA8qPdY=; b=ULCjX+YpT1XoRb4I/7NUSu+Br9zByaBZrGkR4l
	WORfsTnlT0Swx/97vH+YNKRXpTtyG0QbXZIHsHtq4rfaACT+xC1PFtx5JdShFb/c
	vgLhUc42hYGCNSN/ERDsETkDR+1OcdZuxY3/4z8bIs7Nrnp0mJ5lx4D0K628Qegl
	SrU1guiKUnDo74zZqfZFm8Clkj3vCYXDwxoIPvvHq8GMQvfK2VgUiQsyIljD5UQd
	QqViL4udGmIypfNKNL0ZPXg9fHkZSN9yCvZT+Apd7Y/S0aorpaNum/goDjO3SgXD
	vxjE8lVMxBmYHfLw9mrjfDU6D/f72tFJNuSG6/yokWiVVYhg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdg4yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:20:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1547600eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794370821; x=1794975621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiQPn6s1q5c7xcpZrlCDQ6qpZqACFmX9HhK9uA8qPdY=;
        b=OFPf39c48lDfmKpGlBSLqwFsQojrn1lFGzach4fnaKQgvjQnVzrpR6VjPtkAeVulqE
         WJnW/6SQLOF/6do6ZNUyh/hfaXI/G2g9lJy/f+maw7idcnNSeN4FCoewxq9OwcbWR7a0
         UL4v8h/+IYRbTbUN4UuQwK2MifEcf+wqj7bob83P1MEp2AsrQqvIlMcBgEUYhBMjBjcv
         gK46N4xsf3LIFC+fXb1foTozPo150XicDUBDNhWLRiBlcspK9TX98NyfWetsbONbY3ZY
         drlxIlxYMUrJ7wHu8uhRIm8Ar3vFRCRf4PyEnk3A1OPU3HmJiASwrTv/ywmOoxHP/kJR
         qddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370821; x=1794975621;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qiQPn6s1q5c7xcpZrlCDQ6qpZqACFmX9HhK9uA8qPdY=;
        b=GmRBlKMgXWQ37yUtdCsPhW0ikt7igHfWmcbOTqB1SJZk3qfgQPHaux8vrNhiSGYwxD
         bXzQ+NkoxC7uht9KYYJy1U1tNw3tCg98wKbYhii6mep3BazUVU20tq9XTmwQOZDlxJwx
         reIJRUZMVyRS+O6gDzujNw5gn19wKopZUr6hZPe5AP+xGbdLX23QicPCFk6oTm6H7HI6
         CN6A64GXsmATheHaS17eVeqYqzMMo9YrWxj5A1W0WA3D4JsxPA+SN+A2d5YAbY209y2U
         lW+hiV8jZXpo3WxHfZmKFkTENmdYEx8klJ6aCDuMFjA0NrG+BdGxLKpvvbS87eimO+2n
         p4bg==
X-Forwarded-Encrypted: i=1; AL+hErGYhrEiJpWcbOZwwYHPbiT3dRAFf8mMnXWMyM7rzVR6gAY/rUM7vtPmj4YwPosyfoKIy8SX7jImoL4j@vger.kernel.org
X-Gm-Message-State: APuU4Z+vf67RZASPbbH7sU8cnBsok3ie/9Ur6yk6bROHJauzpUx6i+8Q
	Y1VjcZG/JfPSzjeqamy3MmTNSVvS2fE78AojYefOR3gSiPa2TK1VBBTP2Ni7tjUe7J570PO5CWE
	nie6QkB6uJQ/5WW7A1WHDwv+Nkb6IyntHPFYIYKYJV9gBxaODNMQ5BU4T0C3pktCoF5LdO4mc
X-Gm-Gg: AYBFou0B8dfuchCKn+uP3iDG1VmbvvQJ7feJN0vT7eSfjcwubH3GOEjzhc2KNIGCEQh
	ktOUTUaCniwfx8UrUYYfa20vpfWGbqbcgGblW9EScjvgkN2NfSkP6FUq0IXdQ07sAb4OXIfArBa
	F3p3wZLpNM9y86yHn8elhcSkQGYOHvK0eYVUBFycI8ADMTWZpqznO1zOmcW/epPnHMMCOgO8/8A
	M2k/0foLegEBU2OOQvwMj6XfyiZBNblOEkRa32VkPwzBBJPMN4rXk0yHTIZtJUEWJRtfsanLrTr
	34/Iczqteh7ZM5yVauXsStwenzbl/gcdIzkEMyoQpq4rGgLnLE+Dniv+PiRO44/WAkwRy9bA8Z8
	gb1roaZlKyMJK4AdNihj0utLg+Qk4rw/tkJEDesmFQcAzI5jRUBPAjVDeTO0Op1qD/1KXSEcDwp
	ZaRSOT6eaubF3oKKBYePcn5ddtIf8ANfkT
X-Received: by 2002:a05:7301:b18:b0:36c:c483:7077 with SMTP id 5a478bee46e88-37686073d7cmr1891221eec.14.1794370821270;
        Tue, 10 Nov 2026 20:20:21 -0800 (PST)
X-Received: by 2002:a05:7301:b18:b0:36c:c483:7077 with SMTP id 5a478bee46e88-37686073d7cmr1891192eec.14.1794370820535;
        Tue, 10 Nov 2026 20:20:20 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm21690542eec.16.2026.11.10.20.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:20:20 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Date: Wed, 11 Nov 2026 12:19:38 +0800
Message-ID: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af3ed06 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cxXtml3fbL26w-N5-xgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 26eCsAGpPhKSIYLPfSworev_s6r23mb0
X-Proofpoint-GUID: 26eCsAGpPhKSIYLPfSworev_s6r23mb0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfXzzdafmMniSH6
 pKDl1I7KwpXUaJLN51tleeeXDL2k8Iswm6Anjp5Eq8rD5OGbfn0kfx10UP6G4utMnfeHyjmomAm
 x4WsDnndPmpLui75KXmiOCx6gka//K1j+G5Uh0CKzIJZ1q0CtK2HW7Fkrai0jZI6sc1+r+wd1Ye
 1nzsV+l/48imnWIigt3TeMWSM6RkSzrLbDn5h66IG61BTGUzcs675nVF8TUPDEQ6XQTXSUO4Otk
 hYaNuafkmBs4hyJXZLqvgbjGh/RFuBktafxZNPGNYs4lU4oOO4OU+qH0FGc4UFjEMZEFlapL0Co
 mMo445NGNFef4T6a+5U3x618LF0iR70QV/7XSkIdrB3ZHUGIN5sFfSfX+R+TNH4U52Ef2FM9Lrw
 appjaO2SAda0waqkj8bzAFco/CNtG1PwFINnfM2mjAIFEHqcVuv+aEod04xS7Cv+QY/uBk1y76I
 +MeTf2kDTF8qjR3jFyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX8Tp7PRNuNNGD
 lH1wxWGew3opXkHVUYQEjzgCGq0zKDrXtSbdqkl1tfWoGCqK4kafSkL2oEijv7F8Oo85kxXXs/v
 7hdWmDu2FSftxDHKWapFyRiDmCwvVsA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110017

This series adds the CoreSight trace topology for the Qualcomm Nord SoC.

Changes for v3:
- Rebase on next-20261110
- Drop RFC tag as dependencies are cleared
- Link to v2: https://lore.kernel.org/all/20261028075044.431228-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Tag the series with RFC due to dependencies
- Fixed the ddr2 TPDM labels: tpdm_ddr3_llcc_2/3 → tpdm_ddr2_llcc_2/3
- Renamed tpdm-nsp0-cdsp-llm-2 → tpdm-nsp0-cdsp-llm2 so it matches the nsp1–3 nodes
- Link to v1: https://lore.kernel.org/all/20260922100850.527109-1-shengchao.guo@oss.qualcomm.com/

Jie Gan (2):
  dt-bindings: arm: qcom,coresight-ctcu: add Nord
  arm64: dts: qcom: nord: add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |    1 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 3088 +++++++++++++++++
 2 files changed, 3089 insertions(+)

-- 
2.43.0

