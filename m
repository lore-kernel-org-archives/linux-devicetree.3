Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1074F507
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121890; cv=none; b=UlqwTuh3hkiD/actMIq4WcMdhopdLcDBQj5M+086++bw6UdNKc81t8+lLVIRdqHq16czE1h7sREZV23pPqpgfCTdJ3WwBCNLRazzw7mKtoeLTo7Xxy3D2VAUIHh0kXaCPFbdtlxodztgmZq0eSU0FKPeA0fkIWm1kWlXxAI+Jl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121890; c=relaxed/simple;
	bh=hZ1gaZaGTIxUscu8Ntbw8Y8njqN5nK3w6Yrkl7huu4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JflLI/ygd7kuPnh3mPSXtu8oECI3LhWE+P1sCu2+0eNlqSywfaVkAbQdgrzvbNZG7JCk5V4Mjw6Mn4NwLW4qasoQMP2GJfYhRi6FewInrOQlSczpjbh+RTxkzQXzkSBZAcvRXnIlZYeqDxU8h0hVyAnxkPlEA3MhjbfMivoEqCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhMkegOz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADFfYSPD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhMkegOz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADFfYSPD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6r1L178647
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAYr3b3w44P7O8c36VI5MejWSyRbtezegraxb/F7orc=; b=UhMkegOzOI5bhW5R
	1yYQdYMcv8rUEtfh+Am80pt/4D5PqifybEkyffSzZc3zfx+QZRtIFASzYa4m+0jn
	gBFiIpIlD/GBs5i08+NR4a3zv16iRywD7ondKFMkL5M15F0tBvDSiz8cD/Icv2Mc
	yWAST4vsetuIjEetnk1Bhm5c9fhM1KEJ/OkxfgU/Cm/L0kIUdNSvpE35gqAz88dK
	POxC2OXtPyaPVGgjnZJ4IYkmuGDM5c22aUFNuAj6mA65Yt+q8WyM5d1LIeZkM9mi
	z+EnXcZ08bVGFn23835lT20xKR00/GO8Dbqtdo+wfDqkwIHRBHCp35+H5Xm45U/Y
	9KBhWw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec2p56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:04:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313d1015161so715355eec.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 17:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790121883; x=1790726683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAYr3b3w44P7O8c36VI5MejWSyRbtezegraxb/F7orc=;
        b=ADFfYSPDfHmJYgE9KZ0Vz13qDBMSWIuvBBRBWA4DXdYQ23VR9VkX8MsP9kLIqOV1My
         OyWG6bH5xh96gfI2TYTqaNZP8MkNjSm11VkNG0or9+57CguiTqu/wnNFKWlyTkQOisLU
         zrW9DczGACltSy6mLRcqsz2i/Ng0ptfGSIktcGYI4ySVrRDyG/CikqYImqs1D+UhL51+
         JyQNbIbJkU/hhSPChKlk7An2FqNvMCrdXyUAU7DwjutDH97ZMC0Ez7FNDH6FCtxfL2Nv
         EvPBds2T4WmJFYBpnlISnxz54UPJ5jpAVz80S3malkgMW2jbkRE5h+Wft657oH0/Dj/R
         lzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121883; x=1790726683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAYr3b3w44P7O8c36VI5MejWSyRbtezegraxb/F7orc=;
        b=IbqGcWyeI2a0RJF3J2yawSeZOBbobcjFxrEuzCiryX1JITRxWg++ptdYxhwGuj6xBB
         b6QkCG1DKOqoLPMNvbMCRUSdH6mVyPye6YubyAoabeGHg7pOk2yEHsGa1AbkQwNIVXqC
         P6tsLwphJRxYNkcOHKyqnFlldeChKPkERKx9bn/MX2VZ0pJ4lXX0yufomXCBQMwN8OeB
         RrgL+3EjM3MyZ5yKjbF5hOWdGfXPAHriMQQNv1FRZO2O7YALBjTBCdyzmhqd89epNSiQ
         2G9oS4HO7b4a3w9MYdu+DkIe3jMePsW033IqWg/WENN6toLF/RfE3A9TNQU0V94sTIVi
         1juA==
X-Forwarded-Encrypted: i=1; AKwUvBybEqJKV444m7wG602FRMtofeQB18Wzd91zQ4YnwDEy1YZ5hfl86Uh4m3qomYjdSFuMwUAtjK2cPON3@vger.kernel.org
X-Gm-Message-State: AFuF++m+qT17OiWfIGMrcbCkEtUnnWQvuflqSpmU3WR0EdVhiVyxFVVL
	cL2CgXuUZO7NS+q6Q69U5/4xZn7SVzr3dDNxlWZB3V8z6ku6k5+x1fUmUEzUg4vsKKu6pMZPhA9
	qNAsUb9ZfAzuHKEy1lXJn27Pj7XoEDInb69ea99dyXqKLT+Aj9EyLgZnTY9ufUsZr
X-Gm-Gg: AYBFou1KtxVfZOJSoIz0N8CyjIldtLCwoUEvX3vyeQi4PzJNtyFyXXpwSVZ9FR+kxgQ
	xJd5H9RJCj+Kis2GZlB84ZkC+24lzoWcYKE9HSCsKlGHa/RIzEVImjTOVpo9G8nPlG9qLEoMS5S
	5cpMnqlw+hgdRtzf8Y3HJCnEeZsKDqfEuCo8oV9qcb5KBcuzCwplwRonTPhSKjvQuvy8MuINhNP
	9lBhbWtfMweZ5OH2Mx+++F4/N7aIfSpwm1elERdxNuQWcj4hSRgadtsjxBF/VMMrQrjvLF1dABM
	IlvccJr9xNhRqGcRik9XJPvEVFN2eRWXprX8MBRjAbkk1Nl33EWg7YGXtudYfCxtZT2UIsHddYr
	3bXtFBuPPrjimFQZRxAzhd4bGdBTJ
X-Received: by 2002:a05:7300:7b27:b0:33b:eec0:eefc with SMTP id 5a478bee46e88-33e8e88ea29mr796330eec.40.1790121883222;
        Tue, 22 Sep 2026 17:04:43 -0700 (PDT)
X-Received: by 2002:a05:7300:7b27:b0:33b:eec0:eefc with SMTP id 5a478bee46e88-33e8e88ea29mr796303eec.40.1790121882596;
        Tue, 22 Sep 2026 17:04:42 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fd955sm1688347eec.1.2026.09.22.17.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:04:42 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 05:34:17 +0530
Subject: [PATCH 1/3] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add
 Nord compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
In-Reply-To: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790121872; l=945;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=hZ1gaZaGTIxUscu8Ntbw8Y8njqN5nK3w6Yrkl7huu4Y=;
 b=FX2Kn+jl+X5pwVuFZCTvtskk5LbsNnyDitlqPOfmvcKw071Q8Ya70PFZqvP7PD453SxPhliuR
 1lDB+jVAN+mBWEmdH6JsQF3+wHs1/nyugj7yYV/oThE2eaL69ep/Gh0
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfXyxoErCcVUw8a
 f7PS2wXsG5GVhz0nptROuAmx7+9+iuWdwIkWALI0kEKbmB7Fm48wOnsS1YTIwKHfR73RGBthtM5
 5+ed+tZN4h8aY8EpRJYBKizysOYYAKoM4hIm9n1zSgTr7vUGQM2jZm071owNwMxQsM1+m0LZw60
 Pw/z6s1kdbHV8P3f+9N69CoVDMoxg3Kr0ICnqyYuk/+09+sg7xPvtc0srsMP4k6Oi0PsJd9TGXD
 cjyJZtIo9TaPxFFqCo5oDMn77efFSmghQ54D5W70fFYTC2X18R6g5fGK7dWvurwwffCwsusDLre
 mvYOEndT3vwJPK7cVUdvgj7+RHQo6MPnd4dJG4EEwQ9bUj4MlqpIjl6mkhRyWgsjeZQG7/z6xFA
 ZCUPqFyMypgOnzxOyxHTarPif0GyNaemARsKA4RhzOmD+62bb01hX30mmthwUlg9i7MuM/d1t9x
 uSS54hpHP5IVaN3mlOQ==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab3179b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=w8Vq9JXYIO6u7lRZDJsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: qL_P8XSNDLVfDLzNm25SzFPyTLjz5EgY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfX+xzT5LhvyzHH
 tN/Qdtupw9ufOwOZXg1mcPefhV6E3n6B2l5Gp58sEt1OzXyoX7/Qs27AMLUyrUlOWVMyXG/lxZ3
 +632mFO2UbdLfN3mDrX7Lm4pH52V2LA=
X-Proofpoint-ORIG-GUID: qL_P8XSNDLVfDLzNm25SzFPyTLjz5EgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230000

Add the qcom,nord-dwmac-sgmii-phy compatible to the Qualcomm DWMAC
SGMII PHY binding.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
index e573abcb937df914ced25ec87add7955bbba7b87..f2df9983d9536654e838bae4e1e23b832cdaea3c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,qcs8300-dwmac-sgmii-phy
           - const: qcom,sa8775p-dwmac-sgmii-phy
       - const: qcom,sa8775p-dwmac-sgmii-phy
+      - const: qcom,nord-dwmac-sgmii-phy
 
   reg:
     items:

-- 
2.34.1

