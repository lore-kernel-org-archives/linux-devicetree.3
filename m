Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A590485508
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988328; cv=none; b=CJll7+8rXJdT60+GPw1jZ4NM17l5VcQEhIgByj1RrW6uuSmm53ZsGEUuhq8b5nFixccwWYzlQEvTyq95fWhly6u+w+wmAlXIorZA7+WTc2+OLxQqJW+rEdp1lKOL/Kt6xYO8ESvLQE9H7IEmtrXAoIRKfOyzDKrNZwoBBg8zLf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988328; c=relaxed/simple;
	bh=y7UXgCIKfxY9NVUCZAGjKAqUsicIwGreJw6al5/G0rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgBzaIE+P67NbQgAjzHELzD7RnO64/26Ekdo5OpL1XiCFqlMVJvJ9XgB3jmxGgqKyIZ2I8BR9qZCpLwNo1AA34LGB5AC+JXt/SRwXgN0YiJc/g23aqxk3img9IXvNbm8F5VMwUP4g85ijyIjF4ZJafa6p0jBkrPxd2F5wvyVsCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLdsjBnT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hrd6Z5RI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLdsjBnT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hrd6Z5RI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdsSt287261
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kF96zxkV0QHMeHE5whjFT+XnK0dBzEGK3CuuftD2fA4=; b=gLdsjBnT8JEozPlp
	ARRjPFtotDc+i10OPbTg9Bq6dnZsZXaBsv1UCCh9II/uFDb+LcgDT6KzoswXhi3C
	QYVvDTuAcZnc3zi0MS/NIIWFglD30V2/CoNYIW9+NCSFVoJxDNBVBL6X1+eRqsmT
	2aS/JS+qbHgzQIhDsW14uDM8oPcosCKyZy+yc3BOJVaBLoo/24MNSyV5i8O8l8m7
	UgR0jOU5tINmshi1fmOyNOQEWjkln3ZVlFyL+J1LYfJENGApfKIq+eWPExZzDxZO
	XBJ3L+nIetYThBlcxNQdnq/pnWUpTgJEluaeIpJWvIUlSvcOZfiKHRrN667SIack
	jgr9tQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj0q3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:58:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-855315ccb64so2804191b3a.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 03:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988323; x=1790593123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kF96zxkV0QHMeHE5whjFT+XnK0dBzEGK3CuuftD2fA4=;
        b=Hrd6Z5RIQTLd1vZu6/TYggFtXJ9HiQhygXsDAGSTnbQQPrwJHatndXkS/+8/nO1Da8
         gD+W5CEMlIl0gXR+JSDLKy1hDF792azxkmu8pIeJUvGXQr+cp38Tg2PXOCPLcLCX8+ir
         PjrKmfIaAtiXqJtAdHrBX6WN9C6Ben3tC3AYdwAmGhB42ikqFYDoc7NL+OYpxqQUkcDK
         u4cLOdFqWpONrnG6hpmSj/phINuZNigQqqt6st2Z+m6KpVJ+ZUWOTvmZMng6l5jyVdAK
         vzn8GyLkMUdVJjAbjC1GzrBBC5J29BRI/JL1lBmMPCtKrY4DbcHTm8b85JK05Ngaqpfx
         Nkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988323; x=1790593123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kF96zxkV0QHMeHE5whjFT+XnK0dBzEGK3CuuftD2fA4=;
        b=iRL94keSaRgZf7MKyY/VcF1Hjskbsla4B532dMUJuFLZJdgFAbIESb4SNyL0m6CysG
         BEK0Hx9XJSJvDjL4iSop/hif6WGnTUqZqZ+lX7fPAvnIMOndgPQ3P8vie307FFpGTMf3
         Duph6q1fCylGoZHWc0KTWx/VRhOuURzzOXx7xDZsDYD+nBIDPZCNNVrpb+WwmJqHa6Ny
         mxetYzZuyMaUuRKCB0YkYa7tKwv0x0dTCi4gun06rQuAshBRdV0+wxV6H13JN/AjY/EG
         1XnuGxXRJif5l84glnbRfmWfQdh2aPqBHejgR//6IU3LwTNCE+dAjTRb7doV0UgI/lGC
         LRmw==
X-Forwarded-Encrypted: i=1; AKwUvBwJV9RVABU70LWQV6Lb0DY/QCK7Y+mDh3eq9fZMFCCSVg2Fh8UFYYoilMtdiQQ/PD/WXuUx69yDtknI@vger.kernel.org
X-Gm-Message-State: AFuF++k5jtPcO15eTjPJpad7copAkj+CgV5OK4ioOTcYtn8fr+/Dvjwg
	qsa4SakPqlzyoGc3zo4f4F3JkHOXafWB6o7sMyX9TeiVFAR3GJeN92NuGW638zcJXcUqn8/BysR
	PvCHiGUehPM0ztpUGRBYuXvQFS83v6tNc4rREX42/ChHGpUc6zuOmwj7h3meeniFV
X-Gm-Gg: AYBFou08BsdaXuSZGwOyDmHcgZisrH16++BnJvLZD+1m+NnBCEIIRL+fkcNSqMha4hb
	cjgwwiHZ6F/oZ8t+O1HfOIhDAJzXmTMSom4iJGgDBZxrrU64VxNsF/0ufxSx/zgi+lEXg/GKBaM
	nQ5eQxkiGFgEeuV55IU9IzRVBKY3olF5iWFcgekoNPVxmagCIlp2CtFlEzyj+rJC5yU3HmgmRCZ
	8TP2hORS5CVJlDICp2YjyO5Pr/b0K+7JNlMlPnqQqqLtIcoV4j1WKs8I5KUzCcGolVv1sIBu88w
	9QwPiGVm7yJgABLhAgrqx1NFozdURqzX4GXvO0VNuXvOrcH4/pShT6NWtckDd0C/ysBWtmkyZzd
	M9X/zPma1NY1fra5bNjoY1LsIHmP2jVF21A==
X-Received: by 2002:a05:6a20:7349:b0:3dd:a195:fa0f with SMTP id adf61e73a8af0-3dda195fd49mr10891304637.52.1789988322645;
        Mon, 21 Sep 2026 03:58:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:7349:b0:3dd:a195:fa0f with SMTP id adf61e73a8af0-3dda195fd49mr10891272637.52.1789988322187;
        Mon, 21 Sep 2026 03:58:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm23544128eec.30.2026.09.21.03.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:58:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:28:13 +0530
Subject: [PATCH 2/6] dt-bindings: PCI: qcom-ep: Add QCS8300 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-monaco_ep-v1-2-63c5282fb0db@oss.qualcomm.com>
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789988304; l=1181;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=y7UXgCIKfxY9NVUCZAGjKAqUsicIwGreJw6al5/G0rc=;
 b=p3AYYDk6246yZdu0F0RMdyRce/9hqFxR/O7xU1jhZb6da6nFAmFgT5jmXnQzv3KRyzVQsTQtH
 4BivyinDTthAoQxrZZSB9wiFpIVlMH4CvtXuZM96SJgjjb+BTZEp8DJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX6ra9dQRXTKIi
 XN9xYLgWViVQ4o6aEXO1VnH8I9M7SqErO+1J2PZvOXN+wln3qTsFdNLBIMqJg25HmkTisb9Veyg
 vPDCnKvvgprbqj99umUGjiYbsFfQpnk=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab10de3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: StmYWRy59TBXGKDvWHuAccSDSoFlwhay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX+A9++kAr47pF
 SMxOamNRefU44bmc3zLUGRNyOfmmhuHw1b9UCCw49RIfVWbhLYjw1MGyn9RXNpQWD5RK6HJjokh
 7S1BxPzKpSWHkvL0i4FMgCmWCQCtEhZRVFn5Z1bekzePGMZVywFSB1+uhK2rQBp+2jRKrXghxy1
 FFhKbBdkSlIyPdD6oXJjvvSZeE+6DGe9b8SOQ1xekaGKZ14tsRjqb7JcUY9RCVhMimgPMXOKTtm
 UW/nXx4JtiVurCGBHweg8BmiiXorAx3cZ8kqS+MP35o9K0kHHaSVlOgAvJxulxjyJRdZ3y95EZY
 z8DXWcIgLNJLXDWLFJrLjP/4otZwEhOmUrGJGxwU9E37hv9kUs0TdVqks4+6MXv0cl4bnGCZWSr
 KLpEXunVugldxyoJBr21vz2P/EavGlTGmLCozDsit9lfMJ8/A+7++gx8QFOjt/dAHT3ZJF2j3LS
 mIc2uKsRegj3/Bt7OTg==
X-Proofpoint-ORIG-GUID: StmYWRy59TBXGKDvWHuAccSDSoFlwhay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210157

The QCS8300 PCIe Endpoint controller is compatible with the SA8775P
PCIe Endpoint controller and uses the same programming model. Document
the QCS8300 compatible string and its fallback to the SA8775P
compatible.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bed9a40b186b..7f9a0bc958d1 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -13,10 +13,15 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,qcs8300-pcie-ep
           - qcom,sa8775p-pcie-ep
           - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
           - qcom,sm8450-pcie-ep
+      - items:
+          - enum:
+              - qcom,qcs8300-pcie-ep
+          - const: qcom,sa8775p-pcie-ep
       - items:
           - const: qcom,sdx65-pcie-ep
           - const: qcom,sdx55-pcie-ep

-- 
2.34.1

