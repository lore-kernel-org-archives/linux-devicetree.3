Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618805;
	b=Ml87dz8tZoI1Cr79O1dcoOtlJZxwVrSnHzwHZA1kgONx1H+BE4DquRfdcpGHp1SWHtC4
	 ni9L1sko3U54tNynMirh/83x4igKzQ664M96zh7Ms0WT/dI5zhHSoMk43rYCLMm6f1AAb
	 iwu8Yp43ByPKzmxd7dFMtxSBSkEYAuZzyp2UnX+6LqJbic9bwcWPk9W95IyNkw/Y+cf27
	 3bczMyfr0y5/Flc0aE2lpVH9bjknYyrM6KBj3XS+0h/8q8boqXC7Zp33Rn3Q6L+2O19ph
	 wrGkT43rYrLaaFoaqk+x0fSXmGIRe++yVhQ8aHHqdF44/pPgyLWlc7lDs8If/MftJqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=;
	b=g70LAYyPNqdYOsHYiZJEpfLK/t5KYVF2mC5lIAU4uJIs1UJb6d7WpoNM2EI/aCQrevTK
	 KmKjK26JX7hlp5vJQXoYIjUMxPDELqnFg7I4IuJzrLd7Lj9SkOqSiwfZiD+Mef7ctRATA
	 mENJDctykl2oP5JzYMi5srSbspbxpS4Btj1bAee801Fs/Ni5r4E+SxsxCIskdf5pgfPdG
	 Pr8xsJlmzOzoTk8FsLkP+NEQGJMLXvoqw6ZSTWVZ2lrmlyPff8NsPYAS7BqT9Vf6BY6Ow
	 31q8HEt0CKgNGuFPomh5VRxcHrUqY02mRd4fd181pqt3h046sqYFbK6rEVARuqzlIgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CY7JYz4b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TpX2Usp3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E96606A33F
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E96606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CY7JYz4b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TpX2Usp3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMc6iZ3759883
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=; b=CY7JYz4bBwcC7CKk
	4lP+QE1DtXSgTu/2oE89e6SrIMXJY/UzMyuuD3AT9QM9wnaUWUzmSJr7HbWTFcmZ
	BiTN/BOwSHO4L8RA+SjKZf6TQr0JOGj6hx2cZS+C9aFqnU0dOmcSwFr30Lilkddp
	fUUVatB8q2GswZInZx8dzUL3TqzPiNEUwjM+h0CAG5rwglR0Em5Njlvp4+8mYnD5
	pddU5RsO8aX1z9lnpDhnaCtYxWRGH+kBQgCwAj9RX9Vs2neVxcHZ/hBV9VT9WBfX
	GMaB6cxxd1oaQOZNiaEJHbhvaCCLSHCsc813D50DMfvgolAvGe+UjiYNpCE5+wSr
	Rnowlw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662sqc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so1342084c88.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618802; x=1795223602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=;
        b=TpX2Usp3gNY6oebVbcqEYaohAacT4YtlLHQ/hILiQE9/T/MFcZiQujg4aR/eM1bKOM
         ZMae2tw+YIYYk2e8QAUeO7IJPaNY132guZOzmvMjic/I55FkSxDx1I9c270i/7Qiv4IG
         OttUdeOaEv6qWTronKDHob2hB7Ny09pndGPihKbi9EgCngDfmNpTPjlUYBDMCYsyKYV4
         fpflsC7pUzXeHDdD2mbrOPaC1aUA6mc4vghS52KUIlyrmhXJde1jZBpRBVdUrKuqtsRG
         ZTpCR8siPYR7amlDXQeqHVaZQJNTZgkmBjcaO5HD5MaGNZE3u+p0rA0QqWDLQhst9h1K
         9zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618802; x=1795223602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=;
        b=Y70A3O4trEy+g7xQgnhqSrd6P90hSXhjQvh9prADRVXiqWytx5Z1CBa7u8U8KU4AX0
         h92q4zRPmf8PdgH3aStTnawPjgdRhTZWJMxCfnfJc/MB10Q3HqWc/otJDjrQNvP9pOE7
         TlPW1G7iCCyhMOT2B1gYdXtBZVIVMBhqQiU41bqf49Y+Xl/REzFPI4FSj5GUj5IzcE/Q
         DDvyt7xgjmdWSrOmFv7vTYqhnLvvK7ZnC33j8qdkUy1UFmdiRSY4pF4zQlfKhOAK/Rll
         u25QRXZBqKeb0a0vt2LNy0LHTL3BlKxWc7Ragm99976sYJadPMgzXY1BWnF7d87yPuZG
         hHMg==
X-Forwarded-Encrypted: i=1; AL+hErG18M3ucdXq1ltLOUCppLy40Yg8d+WKCZZ4s2krNEB+zEBnR7BQPFzixouW1ZeS8sE0pMf3KxlA+WMp@vger.kernel.org
X-Gm-Message-State: APuU4Z8ud0a36WVK3ERF833X6AVwPTelynex7DqbuZEGtMjnOl48cbwS
	9ptZc2OJW8sKhI9R8TUFXgCd9VkOfEQxJE9BNJzpjp6uzJW0C7+uxE2dwlZMegHZ2F42nMLfAm/
	zj6ojdhqSpIWqrhu440s1RjiWF/ou8gCeNw+YgQoUJqdWHEF9Qf+0kYXdscP541rf
X-Gm-Gg: AYBFou2nSubbYovAigfGNTZiAemPb0YnGSP5iRdAzyC3IAPy6K9QNi7Kmt8H5n7Ehun
	wsa3bzfPLoJ3ndcTbhcodfhxC5pRHvjVw3gTT4vf1opeLt2Kxplbh0gLsTzUNiKxk+FcEQysXLk
	4j5XPDDfq2rpK1BI0t79Tc+o10zsD0ucs+qKcm/0LiTFTT1ACcODpuzjPPLyUHm125RdD/GQc9N
	fRQlLoINa8iD/ZHjIbDC2KCVR3T1H8I0QIrsJGk092xX63aFWRtrxYhkm8Y+Vxm8tF/U2AvPRDe
	cCMVIE7AqGf52fxPs3GIzw+pnCmFUDPNyPNJtHjqKUN5RZb82dF6aTmSVtooTx0lbu+zM+BiyAe
	SMs2Gg9K+RXJJcD8ktH/6hr81dvL5NVTT1hwJNWxdCaWEaou+xYqyFMMDX4+W9envayo+y/MPa7
	ylGdrsqx9L
X-Received: by 2002:a05:7022:1e0d:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b503068228mr3231045c88.6.1794618802260;
        Fri, 13 Nov 2026 17:13:22 -0800 (PST)
X-Received: by 2002:a05:7022:1e0d:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b503068228mr3231019c88.6.1794618801698;
        Fri, 13 Nov 2026 17:13:21 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:21 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:03 +0530
Subject: [PATCH v3 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 qcs8300 16 GT/s PHY
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-monaco_ep-v3-1-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=1515;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=bU8CCkmWS7rC2poZZ53djxBqRGU6cUp1YOnSmcwnl0c=;
 b=zMfsxTErxY8hECwKm/R99bDrh33rFO98c02vXxvjBrvEcS0wCoMcqiVEOgmOdFGkJv9hG3guR
 H5qzlkBd4oCBl573JqURKYdapEMgFG5Y0lETKX9JhU2KrJXGhQz7T19
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 0_ApJT7in2-DEiSQyppw8yfFwAvnqnc3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX92LHNKjh2tnV
 fk9CzRHE2uZi2qsxX0dhgIxlsASIHvopHao4Fw4iJmYsclrPm1RsGnt7H0LUxiMyuxOEJzvtVdi
 gFfNzX+7he9ws+hFRYP6u4CQTWTTN9uUi3xAmwMnLOQb9YSyOodeEK2IACxWFUnKlSP5WegaPJg
 G4xm0R+uz/9CosjnE/y7N+ZTOXvGzbsGcv1A1z8S8wFY5ALA0c4CyE5KAtOf/LsaVOKh5dYObPB
 1OpMEw8/0MgdTuBBIeLp/kroA6WuPsFFnmVLTixD5/yz+tQ5S8ZeRcdXsZADtirQFemXqydDNxO
 /7U6qYHsUiBC8V2pmHDXJHOOMyAVMDnRFX3/AQXSm80q9dzUJ5WiNU+WrlGz1oHnBFMlacSfmlY
 thE7+hlH5t3XP192yd9PftuKFUJhcdWqDcedcHePRb9zW+zQLuFudzShj5IVS0kwiuL/nfg9G+P
 crroElZZbhMlpaR9d7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX8mw3zvwUm+Mb
 wCebyuwvyr8XkYrP6Ibk8oV9XCZ+Xw6RXs2J3jMYOyZkr/9TACmNL8wVo+LQTa59t8TSbBFEDuR
 rB7ETZ5mSrwDPxbMDM4wxxtilayeuG8=
X-Proofpoint-GUID: 0_ApJT7in2-DEiSQyppw8yfFwAvnqnc3
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af7b5b3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LyAK_bMyhA_l01y8gmIA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

The QCS8300 16 GT/s x4 QMP PCIe PHY was previously described using only
the qcom,sa8775p-qmp-gen4x4-pcie-phy compatible, since no QCS8300-specific
compatible existed for this PHY. This was a mistake, as it left the PHY
undocumented as QCS8300 hardware and indistinguishable from SA8775P in
the binding.

Correct this by documenting a dedicated
"qcom,qcs8300-qmp-gen4x4-pcie-phy" compatible, with
"qcom,sa8775p-qmp-gen4x4-pcie-phy" listed as its fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index c0a3e1f160ad..8d0924fa928d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -24,6 +24,10 @@ properties:
           - enum:
               - qcom,maili-qmp-gen4x1-pcie-phy
           - const: qcom,hawi-qmp-gen4x1-pcie-phy
+      - items:
+          - enum:
+              - qcom,qcs8300-qmp-gen4x4-pcie-phy
+          - const: qcom,sa8775p-qmp-gen4x4-pcie-phy
       - enum:
           - qcom,eliza-qmp-gen3x1-pcie-phy
           - qcom,eliza-qmp-gen3x2-pcie-phy

-- 
2.34.1

