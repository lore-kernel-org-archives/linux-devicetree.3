Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8DA3CD8A8
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781586297; cv=none; b=tnuN5lJDiu1eeRdJjVrvC3TPSNxpu6FFpu7oaKimzN8lDO+YnNfJYEkf6qD3rpFleQozHb8hXnvllO/uDJPH17k4TWbew2VoIjrXCL5gYj2J32lrh1qBxh8xS8w4TWyBmHC2QNOWPPJl1Wm5bBZDayIsJ+S8JG8baarawD8bMlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781586297; c=relaxed/simple;
	bh=LQuNuZJAEeJCLkH8G7sgu4pN8/dcoJOBFIRKNpRwrvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUDWoByWzYPsRitiOHOmxmEgF6d83kQ5ZjeYCmXMewqTftixsw5S32dZnZBzWQgFUjh5/d61smhawSqch6MTbCOZ3wV3yiB3R0amM4ajY4qVxs7fZ4UCt9JSO295N18z5UvaeDa7oyI7h9gFW9SXEB5rpAzSV4k4PRf5SWWS+SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRGGlRJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Om/H3nto; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRGGlRJ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Om/H3nto"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G1xh9j2300121
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3TIHCrEl6XbNl5iEMBnoRWpD+jAZocs+/EtNELfI2Q=; b=VRGGlRJ4nSt+fwmD
	ZjMGyRaVupfMH85eYc6mUZkwyvVothpgLZiaxvVMYzz2pP5UI3WAtPM3ETJLVHyh
	u4qZRKmp41Tkw9awCWhZfZtyRCpq+wkLeRWP+O46Z0R9L1K9bMK3lmWYqiVemUy0
	L7qyBKamopKla34SE2mNAxr05MxSbAIkQI4IsgUkglOfK0dJA+nB6k6APhsbM2ee
	5nxqIaCkFlgZsvxqhrsbTHpoSu1A3aP0UUarT4Ic76UGzuRDhmHFvFLFfFvYm3kH
	r7gSbx75LsGz+SVAoB30+KEX25Bj2ysjW6Z88FqSMQmwUqT2kjy3sYsJO6VvbbDA
	cRsVnA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter24wg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:04:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32259e0eso49712955ad.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 22:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781586294; x=1782191094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3TIHCrEl6XbNl5iEMBnoRWpD+jAZocs+/EtNELfI2Q=;
        b=Om/H3ntoN1rHsHuj4C6kEoH90MOJCw3t7Kw1iDU0JEm+DaJLHjMP+yjfGtpMF3WlRA
         2Y2rj1YpZpGyILE32TVjJ8pyr3bim19+g6edNi2qzgo/JH0elVWqmHZG3RkqWI08efGb
         Zlh9RUbSeejUzei7FmcGgiZop6fbGN1AvAzAeFC8mvLJlHXh7lFN0pNs1OjlirHiDlw0
         0hVpGRifn/yrYHo4sU67tVSxpuf3ZjYieFsD3f98TxN4zvwf+R+rjGPTckEOAs2aduDt
         uUrghSWwXZRCDf9L4an741feewq3fn+0CC40J3Q44Xfkty1cPdBXwLQefNvT/fE7dHEi
         XOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781586294; x=1782191094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3TIHCrEl6XbNl5iEMBnoRWpD+jAZocs+/EtNELfI2Q=;
        b=NVgTEBJvXCkAPDwPyLCTTkL+ZAY7zckmuNFBBa0suyEWqopbb0cIjVLDpqnTmpKHh2
         +YugT9QSYtNGpIz/u2S6qSKIVWciCWdohGR2Oq2GhLQWPaktceGzoeHcK4myHHf3zke4
         tycrbsP+h3UyEPLSRbLLu92r2jSniE+xji4Wkwd/O0hidtEKhhMEuAvNqh33bRQ1Ftah
         o/nP5B5GsmAZ+5YGdlzO5Nl5rJh4p6m3CrHkxzjEfkFDDhkDPDzOQuh3Oeo63APKXM0p
         LfsHOG5D1i+N/JNHDWvGkVJdiAVyL+uVMUABZQ1AURITaxq8ZYXDVQLqpRCVWE6O2VAu
         8Z4A==
X-Forwarded-Encrypted: i=1; AFNElJ+Wu0zixjr6hAD6s4I4ClRRylnyKcpjXejWKdwKEg0Ox2/ge3nCeZ2uxt5mshNuAROyeqMOIO2qTnx+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2forSuPFBKtrEL0yfh22l8sgBN1903fNXoLzI7GgaeNIZU3qa
	WLRmsKExUmM6Elga9Q0Nv1l3rzzqORXob4C/6fWc0BaRKPjTN/jvuqWq/rzrJna4si86+hY54Fd
	VWQTlJwt0chEt+YziQ++uq7wB+1rWTJ9krYN44AvCtHkJsggK78KgRGRZNdR0bz5Z
X-Gm-Gg: Acq92OFY9LRKdxRG6d7tcEmfNoU+z7EHTIDnw4XmO/5PYpb4/PUyCS3v+yhNv+SjQTf
	duB29XeF6e0GZEM7TpaXUm545kUnCxv/I4SM3p9V2FysI555KwfS9YIR+fGyKPHs4DD8JdK0wAY
	brxL0EjuD6DcuytQOsZonmSMhAqhVcxlboOuRnQhzDPU0c/XaffPJqEyBcj9wslrhNvoauZBeUb
	Bhb5Ugsvgoz4KSIHWsedZt80FJJhNdWNJT6HRwI3qDCaIak1oAljJHjAfi0zx+PfmCsDTlS3kmD
	iJPKfzsbADC/vZnpQEOAmm+q7h+Dcda68zKwymIMXYQm3f6xJ+nMHxt02YaMSlPCYv027mPoBiJ
	cNYfQwqTqWm0TXcBc8wL57YZBDHF0Csckx0kT0naPhwJdxNQsiyNtUlqP/DtMblzq7VVFL9K/bI
	r4/OKlBJR7rDSrJNz2kToNJVyqR05ThKTicjD8F1d8LdJ8g5+dKJk=
X-Received: by 2002:a17:903:2304:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c41050b417mr186916375ad.3.1781586293726;
        Mon, 15 Jun 2026 22:04:53 -0700 (PDT)
X-Received: by 2002:a17:903:2304:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c41050b417mr186916085ad.3.1781586293324;
        Mon, 15 Jun 2026 22:04:53 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm128957335ad.14.2026.06.15.22.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 22:04:52 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 10:34:41 +0530
Subject: [PATCH v4 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-pcie-phy-v4-1-504677c3d727@oss.qualcomm.com>
References: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
In-Reply-To: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA0NyBTYWx0ZWRfX60PMwumIZWBu
 2I2BtA1yWVleCmLg+BGF1fSKykD2xE9tLPFinV2xaTHjeNZ0bKoXCSE45fgSr3S1OhOdiqN/xmh
 gUIHt3RZ6FbwfraKy5svq2ftQ0d73v4=
X-Proofpoint-GUID: LNTJFciTEnNvQ-KDgmLZAdZtpGZeInTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA0NyBTYWx0ZWRfX56AyIgrb7WEY
 dHbpB/RYJZeU2O85piyuY5Wvn/mkrlQEjEObwdiXeBJW0Dbar8BQ0DxwrVsJ9ySTE4y8IuChFmE
 /WvzQdOs5WVXEK4ZK0IuA7fXVp6vG0BLTHP+a6aVbhOM8dnIWhUFSJd9LS2Udse/GAZwfODzZiF
 UtRXQhY0MiM7H9pgq5grPBaUJb/NtM2CyK3h8Uaf9Iwr2xBSB+3fRml6BsuXkf3tl5OuVPLBPbr
 ZfjEdhHCZSba0UNJ1h1SG4QZ/xGxa1roMdhb1b5ZmCS22uqoHn5O44Xk0SyBQHEQNwIw498clyo
 bt7++mRqdVdv4V1paiwWRZjuw4jRwEjZ45dLxd6k8jaxyxamFdqw+SfObgR+OkRrKbZbY1/WWLH
 oBT3aP8tK01z5RBgWXZWlnM+7s2+YnB0nFcoQWOhT9AElzEoCL8S6SMYbt5cZuOwA1sQqDPkZ34
 Sf0MkHrApJQFAQtE9iw==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a30d976 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: LNTJFciTEnNvQ-KDgmLZAdZtpGZeInTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160047

The ipq5210 has one dual lane and one single lane PCIe phy.

The dual lane phy is similar to the dual lane phy present in ipq9574. Hence
qcom,ipq5210-qmp-gen3x2-pcie-phy is documented with ipq9574's dual lane phy
as fallback compatible.

The single lane phy (qcom,ipq5210-qmp-gen3x1-pcie-phy) is documented as
specific compatible as it uses a combination of its own initialization
tables and some of the existing tables.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..fc155ad5fa6d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,ipq5210-qmp-gen3x1-pcie-phy
           - qcom,ipq6018-qmp-pcie-phy
           - qcom,ipq8074-qmp-gen3-pcie-phy
           - qcom,ipq8074-qmp-pcie-phy
@@ -28,6 +29,7 @@ properties:
           - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x2-pcie-phy
               - qcom,ipq5424-qmp-gen3x2-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x2-pcie-phy
 

-- 
2.34.1

