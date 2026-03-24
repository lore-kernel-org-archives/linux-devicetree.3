Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C224D256C70
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373362; cv=none; b=Y1QS96Y+oXohMhcABIqsZVDM/M159TgNLbCvhSfdABNKxaQo427Co3ci3EbQNlEVsKrLahvRbDlHREnHAnQzZ08rnE8If3ZDHVtoVeSedSHskTq1dmtvdhejK8dLlKxtFqTrgg9ofzo4B1LxO0FIr1N9jeuxyXGVBsLyC/tUdmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373362; c=relaxed/simple;
	bh=33pziwi4jiwyo2aD6r+dgYzSAgPzR2G6201qgIaiz9U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cANbxY8pSngd+22vUewmwoQKFA872nZf7O4ZPRnsaOB4usgG3h60dbcDFxsTVZugCdPsqn+Nitx9paD9N+FnAURpBWVB+QSVHOJTDVUaK1nHDSq36+bg26s2gnSfuOZX2FAquFSzy8FBzj4g2sVV43+fGlMTr8zBvLnpwx05bpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hj+G82HV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BaTYAQr8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hj+G82HV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BaTYAQr8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OGArvQ3904165
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jxeKi/NMp18lwJKsUPomUd
	R+qJSGzqgYHm99XeU31Xk=; b=Hj+G82HV/yit5B3AMThvRsqR7dJdefT3g26vnB
	GsfKuCPmZKQ3vJe1ZAR7gA114WvOZ+Ntr9yt/TRchLUdmQUUufw/hXaLPl0x5M1G
	a7/YJoNDJv/rMfmDx551DmPn13UYCe+TdakwspOJzx+9neIxlRxFALjMuArxOFZs
	gKZSiPqRA+aFWPikU80/Udk6yFzjbqwoaD1AGHZK2BAElhQ8xS8HNTQBZVkIe9DA
	UcVaCr/r4efYzrFoCEX1E93GADAWBYMhiQPL8iDXO3BYzitwhi3big6lCRrAmmUA
	cn2VrJyMASgCsyAKrgJijys1XTshaJPofRASVbeE6+0+b05Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0k40p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:29:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so4006883eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774373359; x=1774978159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxeKi/NMp18lwJKsUPomUdR+qJSGzqgYHm99XeU31Xk=;
        b=BaTYAQr83MOxuIkpXqo4VRKLupWe2nXg1+FCh3cXJhvYHD/u1d66lSYHsSw1+zmKUl
         Fyz0BuHRN/hSWt/iwVaWWgQRInONM/1meABL9DdmaU3xKeOy1REBloTaCOPpe5SHqbjo
         0lFyGdeTuEV42sLDHgX7jUbtjKDfHbH9ME+UqwCehdNR88XZ9AQRS95OX0hYOgZWCsHo
         YuadxfZ+h6XWg+jk0UkPyayvpqcoEO7gzOfOHj7+525zrCTmS68bTFornmqPHnQNUj/Z
         HogcYefUC+wwNyogllqxyNuI0bLd+6T1BxN03btA8FBigEPE7A3SHCPyLTXWGkp4cD8y
         qJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774373359; x=1774978159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxeKi/NMp18lwJKsUPomUdR+qJSGzqgYHm99XeU31Xk=;
        b=eJ+QUOFrhq5ETjANbn/jJW6YfJNoI4ktUg8YJB1fVOaHRkGt3R3ECr+TXjONprVgDN
         EzHDTrVq8vd8/gd8g61aPBAbl3zjAnEEE4sTmNW35YLeZzVVKQ+6ZLv16BhbmQMokNE+
         aNROGAAeLLDXzoHbQ/zo7wG9gAnv0Lw7+uMTnHl2hPDz7FL/ot4Xeg28w6masUSdhIgo
         9+tGsJcJSnvosQXGqXV4fij8Lbw72Rv36G8q+7vaJGBopFafMOMOAqhJr6eluaIJgc0M
         TMJd+XHxmpKbGnCjlVYydiSAOKIeVhF0RA4le1FrmGVYdxwJe2p1CY6zDa+h72h90W74
         ckMw==
X-Gm-Message-State: AOJu0YzDm3GCD+0zkbQpesciX2Eq8ID/+fuEZOvqmS6wtoRcD39nur6f
	QYrgFm6YGBN0Rj4JxHoNnMV5bSU/0idgOvSXULvI23MS0akoa2tifAN91tBqVH0wVQf4n40cMs2
	p71a61XjBtEfaiSKkrFk/KCBa0li0kwwQjc4ChDwEKVpmShDyKBRASJLtSVxwXL9P
X-Gm-Gg: ATEYQzzraFBHW66VcFw76WJd+LbLk3nEpn4izYweLVm2PWyIGFzWXrIOVTxjdIcNoZ2
	7rPWjz91Hhf5KcnEXWOFY/U17c2VVL0EV0f8ldIyns7En3WPhsujvpqd0fSEends+VRxv+gYfqY
	ub02+Np3PMdy0RNjloaZNhS+R6CTQkJ8USpWFTvfg+hHa9Epsilh8HodfLBaQ19TBuRKPrJmi3J
	k8hw/Bok47yjxiW0fafMJwcJ6BfOXFPghv2Nlydd8xZKPslTcBY3ZfQnOOSNDXzHo0BlKbuOAw1
	IpWUpYofQ8nvy6psynjKpATWnMmm0P/1iUY+be4RjhopnlZE+i8BIyVOzXu4UXTOy/2Gl4nrhXy
	xyGFW/JJNO89TX/dhaSHj9IMgE8mhWuyFqB2vu499+pq1/505w+mdggofB7xuaVdf7i5oY4KVL0
	8=
X-Received: by 2002:a05:7301:1e8f:b0:2b7:24ad:5c54 with SMTP id 5a478bee46e88-2c15d27fd6emr115319eec.9.1774373358507;
        Tue, 24 Mar 2026 10:29:18 -0700 (PDT)
X-Received: by 2002:a05:7301:1e8f:b0:2b7:24ad:5c54 with SMTP id 5a478bee46e88-2c15d27fd6emr115300eec.9.1774373357969;
        Tue, 24 Mar 2026 10:29:17 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm21275664eec.5.2026.03.24.10.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:29:17 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] dt-bindings: connector: Add role‑switch provider phandle
Date: Tue, 24 Mar 2026 10:29:15 -0700
Message-Id: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wlx9oXqerPIIUa7yBFEVBBNNwFc-9fDr
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c2c9ef cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=suRUVlQjLIQ7l_8mqXEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: wlx9oXqerPIIUa7yBFEVBBNNwFc-9fDr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEzNSBTYWx0ZWRfXyV0MTIUhlZOf
 Quc22KK3lBOJViYYkSEke07f3Os+f2INeBzBuZh6cOTBDll8TVh6cFhVlybN3Bs58bRVxSintIz
 cmAaL+MSgee9Jf+QXzLA3RftLzyqpZVDgpWAJ0F9K+zurE5pDjtLN/rDIMHQ94IMbJrPQi/7qLj
 SEQKzcL+eMlhuW99cQLZyYSZdbpypzHDU3EVbrR8eboqqiZKMRtsdTZ87WEGsF7N3e+tHHOM4/1
 +6VzXZ48c0ITCc2QB/glLQ/zDes27Ydtz72y8jm/0mAD29cJXqzE/zlexei1ZRLIL8DT1PKzAlj
 C4zaUSUPxYlw5ObLQkeX74I8OIuNlQkyJTVEl83wH+qdbMLoP+jF1nwWPnGzZ3yVrsnWYOFqI/S
 eBBsXksCJrjxDSVyC1SbAEQIPneaWJeNbQ39lL0CbZF3WMmRvBEHtao85ZXRQEHkjSeACaVtl70
 ARwj86PiHU52CkMOz1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240135

Hi all,

This patch proposes a generic Devicetree mechanism for a USB connector to
reference the USB role‑switch provider when there is an intermediate,
block between the connector and the controller in the OF graph.

Problem
=======
OF‑graph links are strictly point‑to‑point via remote-endpoint, so a
consumer can only discover its immediate neighbor in the graph. When an
intermediate node sits between the USB connector and the controller, the
connector cannot identify the controller (the role‑switch provider) from
the graph alone.

Example (illustrative only)
===========================
On some Qualcomm SoCs, an Embedded USB Debug (EUD) block sits
electrically between USB‑C connectors and DWC3 controllers. EUD models
HS wiring only .

Below is a simplified diagram of the hardware paths:


				EUD Block
			   +------------------------------+  
			   |                              |
[Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
			   |                              |  
[Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
			   |                              |
			   |      +------------------+    |
			   |      |  EUD Debug Hub   |    |
			   |      +------------------+    |
			   +------------------------------+

And the corresponding OF‑graph mapping

# Node: EUD (intermediate; graph-only for HS) (extending [1] to dual port)
EUD (eud@...)
└── ports
    ├─ port@0 (reg = <0>)
    │   └─ endpoint  ── remote-endpoint ──>  USBCtrl-0
    │
    ├─ port@1 (reg = <1>)
    │   └─ endpoint  ── remote-endpoint ──>  Conn-0
    │
    ├─ port@2 (reg = <2>)
    │   └─ endpoint  ── remote-endpoint ──>  USBCtrl-1
    │
    └─ port@3 (reg = <3>)
        └─ endpoint  ── remote-endpoint ──>  Conn-1


# Node: Connector 0
Conn-0: usb-connector
└── port
    └─ port@0: endpoint  --> remote-endpoint -->  EUD:port@1

# Node: USB Controller 0
USBCtrl-0: usb@...  (e.g., DWC3-0)
└── port
    └─ port@0: endpoint  --> remote-endpoint -->  EUD:port@0

# Node: Connector 1
Conn-1: usb-connector
└── port
    └─ port@0: endpoint  --> remote-endpoint -->  EUD:port@3

# Node: USB Controller 1
USBCtrl-1: usb@...  (e.g., DWC3)
└── port
    └─ port@0: endpoint  --> remote-endpoint -->  EUD:port@2


From the OF‑graph structure alone, Conn‑0 cannot determine that
USBCtrl‑0 (and not USBCtrl‑1) is the correct role‑switch provider.

Proposal
========
Add an optional consumer→provider phandle on the connector:

    usb-role-switch = <&controller>;

The provider remains the controller node, which already declares the
boolean 'usb-role-switch;' and registers the role‑switch device.

Thanks,
Elson Serrao

---
Changes in v2:
 - Removed RFC tag following discussion and feedback.
 - Link to v1: https://lore.kernel.org/all/20260223191042.825136-1-elson.serrao@oss.qualcomm.com/
---

Elson Serrao (1):
  dt-bindings: connector: Add role‑switch provider phandle

 .../devicetree/bindings/connector/usb-connector.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.34.1

