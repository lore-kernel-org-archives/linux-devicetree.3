Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B94438008
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800598; cv=none; b=pRJk3gxYw/SIF3jww8GnjoMNTXiweZE+kZhXFEwdOGj16TZtDW8FAEMYTHbRdkZ0hfM2fAQawhSu8zK19SQ5bJT3CTxYyIMZS0q+1Rmu/95YItk4fCThP5lVD+mMzAdd2toh++JG+pKt808ibkiXhoCEMLkL5Tf2a/x5r7w3xCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800598; c=relaxed/simple;
	bh=cWoSTkVSmyJnrOKQKsLg9vw1fd0nN3WorhnNxks62kM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfGt6uN7OOAtXY4hUn8vSJ49lwQ+pxNk2pOPrFXUUOwZGVYMB1IqeGGcdbZE5PHqeb/T6iXb9x69LL30KG8kCrrjB1IdOtWgDm6GoJsAsYijtkSwHDMTJEyWo2ae+qWau7OeS4fo07SLSh+ikw9r7pokPF6nU591Rj802aGMkLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNoEzb42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiAHQCMV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNoEzb42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiAHQCMV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qVww467133
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7hU0qU47NTMfGgCj38gIkAxbOzd9dVWMRHOirqotPo=; b=fNoEzb42D+7asSJX
	PBo513pyqbgKFrghRm20gfo9/RMBgnTBImoXpEuLJWloqYJWmVAcLKyvZSd81zWN
	qnx3UTRKGJ7cGlbFH3LHEA1+Eg8euaw+pBR5GTbYdiC0c6vuU/D8Tk0ExELnS7ca
	0aeXWcQyil0v15+p6SBxDe21Z+WPbXYBC6hwAAFDVi6HM834I6vy4uySvvZbyZJ3
	OxxozsuNrrHnM1dGs5A3heJ8HKXPvsOFwEjI2cZ31yd52h+PP9a7OojtYIpe7FSG
	EIIFCqiVVuxEbOtRkZ7q/S/bRloYK7frlVIQ18XuWhOsHZcJrdxhzyp0rfNarjnq
	SK75Qg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xuf6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:56:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce756aa72eso3445735ad.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800596; x=1785405396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7hU0qU47NTMfGgCj38gIkAxbOzd9dVWMRHOirqotPo=;
        b=GiAHQCMV/U2c/TMgt2sbKs3EG0JqjqfDGvcV4q/U/AWKDdcL3rGg+OarXDlrCEqoF7
         C2gUAN+7dFg+Sp+8hGCAuVSQVOLrnocIVC7qFRai16okDMqV/+cQ6woaOYAzjBqf1vQZ
         YdzeyQRN114HEX/dIfvXH84uh5FpgFES5Eg41cUbkZS6m1i8TurWt2CgeXPsFR2Q6pZ6
         ulX2RFhIKUERZx4kxWaCu+cvo9EYTEuUjqYrIzFrztAD3XpFl8ByiA05RIR6OJdZUAyv
         BdM16tMXwxt/ovd0vzGoa+slI3qC/AnkRN02abfbrM3LEz+43NZ57vfuKAtW9oBLfrK8
         LNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800596; x=1785405396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7hU0qU47NTMfGgCj38gIkAxbOzd9dVWMRHOirqotPo=;
        b=BTwdEoruWvvCNjKXhvtsrm0SznP2xhY7DIvnqwlk/4V0jHpXg0TXVOaMzSyRtNzQiU
         NXXkmmU3okZ8yWMg7crRbtd/JzcvsM2oX8JIeIcw6eJ9XLx4OPNQ393oWwT1HTFpHW+n
         6ItiHXTYDAUxQOix3gIepHTMZ3BytBFq0vIY9AwPEPvBPstuEd9t2cHfsYungt3gB4d7
         Mo6qMHW2jTt/bgpT39k81qeXgPVj0Fc01QGtgVJ55Q3l9E1VPdIhGjkkQH81rZXA6Hi0
         hOhqZFAPZ+1ZGvOITnMHDsTgxI5pwh/oZmgIakYKmirwxpBDOWjkUDoWXNEoRpMW6rFQ
         Qw6A==
X-Forwarded-Encrypted: i=1; AHgh+RpiMVbfAM/HuSXT7djN5hmvp31f8+QsO2k5o6Thei6mgzhojnbIP3E3rlVhCt9BGqwBwNqpEzDpI88n@vger.kernel.org
X-Gm-Message-State: AOJu0YyM7gZeIjOg4YVOS76HZ9C/5Bm1aV9aGz9M6ZBW0brQNIWEP/85
	+e9prTPa0I48glTTXqx1aI942wUekKlFZ8SkMuRX8+FZB2e7xllkW0Tfq3qomp3uSssYklvjKS7
	yp0jFvvp5XQBAMTfbLYuRJA4K7SO4+QW6ldR34gTEJMBNEk78kqKvfJ6zLRH5nuuP
X-Gm-Gg: AR+sD12ZlYl/T41oDCK1faAby8SKnUsrkw75wF7FSDb1JzkFiWFy6mBBDRXDX8pW1oK
	fTNptzK4fTrDZSmaA96hTgugFZrXUXMGvfUlWk3Aad+AsZMLBMMI7ArTIBbP5Zq1T1qqpFGptdY
	eMHb0IP/FCiNf+X/cUvBmlYqDaMHPKpX/rsCMjnKhY6iWX+mKu+DThFg76yHOWnO1HlpLR2PEJI
	0NaQSiZK1uuJr4DGhd387k54DUF7M23mcIu0Ji6CB5vcpejO/w4XTrjtCMbWB3UUhpyDpULW4/E
	BaZLjEnRLgln1D8OnBzvfozsbe0p9S7a8PQtWe7tAYjb6d3WhALd+K2L7hOW4T2KRvPeqNzo6NY
	zULRYikjtiPIQvA4KmwUpVObrkoN3D8KZi/8+6TtTN+crg6NFlPQ=
X-Received: by 2002:a17:902:d98f:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2cfa670a5aamr21915425ad.0.1784800595820;
        Thu, 23 Jul 2026 02:56:35 -0700 (PDT)
X-Received: by 2002:a17:902:d98f:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2cfa670a5aamr21915245ad.0.1784800595427;
        Thu, 23 Jul 2026 02:56:35 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa2cd0sm30392755ad.4.2026.07.23.02.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:56:35 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:26:20 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: hamoa: Add compatible to the PCIe
 Root Port
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hamoa-m2-dts-v2-v2-2-82254ac101fb@oss.qualcomm.com>
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 0f_OVO6MqGnnM4O-DUI84UklDw7n_sR-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX/rv0l2UA4N2I
 qZglUw8Ax27xmfcE+T+m2GjKOaS+YA5Iv3/YR9TGsygyoYfEUI5Yjj3QrUtzFulVgAmJSbd37yY
 VDmoqenD3Pdgm8rr4wlVaKcbO1FHWMA=
X-Proofpoint-GUID: 0f_OVO6MqGnnM4O-DUI84UklDw7n_sR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX0zhpjCg6j0aT
 b4+vYvVI0CvJJx2IaIwwc2ExE7BFG49LODK2r7+HVUiOCrJNf3fKmsMr3vIhtIv8btsYfWHiUIe
 L7EAUxuM90eXKRSBEu5ggD9G1HDmZ0RfIDYx1QFVorvXmUf42+4DArGdRdGXK1Oea3bKn7tuO2e
 nDY1OK8SvX4RCM0+G9pjgwHMXHOsWZ/LScEb2PFruTm4MJlHDZGfgZbwrepE+qCEI5Lk1QsrP7v
 ABQ4vjPctmUcil3iQOxX7veVYav3yp2sXga+fn8+isChKJ6kUg+C6b2vUSoAKL/irctgmsuCrte
 Wv3UzSOocL1Y4v637Oap/1Ha4RCb1zhCvKJo9QvDCfjVJEGky8N1TB0se7deZjaWz8M7kx6w0nh
 eTNbSfbKedfs3bPUKjAWawuVTSpKOOI/cT0vvBMWGl/Kfv/DHvqz2JADPb4Y20r8TXG/ycvFoFz
 Ut+kcNkYktZwIWC3mGQ==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61e554 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=unBuS9T_dDH4f9JXRc8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

Add 'compatible = "pciclass,0604"' to the pcie4_port0 node in hamoa.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device, which is required for M.2 connector graph endpoint
association.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 833810470c85..dc680554cd34 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3777,6 +3777,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			pcie4_port0: pcie@0 {
 				device_type = "pci";
+				compatible = "pciclass,0604";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 

-- 
2.34.1

