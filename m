Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3723FF1DC
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677476; cv=none; b=H66eWHbL7f3FRqWbDJz814kFJ8bGGP+BlzlaO9B5/j3ZXFQ0JCxiyGtPBtb3Wwp0a84AKntzsROcczSxdOTV7Z+y++YaHUMisczmrGFYRGkiyV3voXiDOnpL0OzrmDEIGnipFJqUtLaQcsaSXQRkZwZ+YlTl/rGOtSHpRatucuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677476; c=relaxed/simple;
	bh=8JpUJth9XTvH2/KUENAtj9vpf8EiqqScCzN/6TvG46E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESv47kVPojCC5HZ1YVnP8c2MTgnS7yi5a4vdg8QzOzumWunA/G7hXsTyNx57rUfiCG5xNXPIr4kVnfYVlC4vQPWvxgrB+1klPTcbzPjSLWyhwYJFmbF+gj6VGfvs+1RVJs9T1h5SPQOCt09DV/76CKqYCefG+3FrTZJBkPFCN2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drQdye0z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbJgLcS7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drQdye0z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbJgLcS7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dWY8235407
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/+fhSSKhqNyPBIhKtJ3rdCectIRZdOdeDVvpYe5lcc=; b=drQdye0zyYR6/ADK
	eR60QZa7r+h5eWK8gLYEiTp+Om71n1v+Pq0B1n+psFTOnW336SERmkLoUkmukSqM
	stLkpzbs70Kv1wJ8ENJDyvS4IroFhm5204VewBqk1VH+roQwVH6pqsKTx1MTIJlk
	UYZHQVxH7BG8/6b9dOm/dMnRCkkNKs1O66lUiexHBuVodg6AIpKWxRGf8LKMGd76
	gUTKQFOQNmoVz/qiQbw1WolkOJUllEW9VWGeR3gXzPqMn2T9Df7hGWw63Se1URA6
	ecXpjcSqU4SN/QUe6gZqfsu3EU8aie32TihzR29lTYYTpg7JU9mHHV+x4X+EGr2Y
	l8APDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3kwsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so7222511cf.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677470; x=1784282270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/+fhSSKhqNyPBIhKtJ3rdCectIRZdOdeDVvpYe5lcc=;
        b=WbJgLcS7eW+jP/21gcjR/0ZsyFQ1z+4OSqaUq34tt6yiT656lQcFE1ZSaxDfk+0WUW
         BVTGS0kxpVDzStHCMuOu7+LxxmfORyDGsaAd8OuPN1W515eNQR5i/PDGBLqkuZblvNFj
         ZG0tVlgPXFTttJ4KNcTiv/k/e/sM8S+1xfI+wq8OeRyfZL5vAf8Ek5/Iq53P0FSxAbNL
         m+IIFr47svXKFGR29iPtqIADjNJM7j5syHXAWXn7qXqP3TGoFXoVWVmus11P+31J6c/Z
         bWbbf+AXXpKo6pC/BTewxzmUc5yrD/AvDFBZybw9GCr7j3Iwo7uACf4/G/F0TlHjXDZT
         i1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677470; x=1784282270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/+fhSSKhqNyPBIhKtJ3rdCectIRZdOdeDVvpYe5lcc=;
        b=le0WA6WK7Rh+zd6vpfC0UnTUq7hUznjVrhWOUim76Y8Z1APvoYMg2LYHhFJtNdGvIB
         UlVh4tbNo1gkIizF1RSEWHaZzuO/3KNRFhsUEMRCMASt1eBn6gMGznwObqYQrdfXVBcw
         HnRUGAw7YAJRgt273xQ07N6U4yfCGqD790dWjA4SOiqrqKjsjSKzYEhtFIWv883gjfoz
         FZtWt+GoVcRSztY4/grfhCFm9we6QD2MasGAp7dD55TlYBHNI6I9MFvkeqk7dby/8Z3D
         T31fm0UD9RgiBliRgdVCFTcvYFoOBW/n4WgFlabwEuXA0zsKkuWAZ5X8oYeQpdCspW+2
         E8ZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9rmvYDdcHRLd5IaxGyaAW+GKJB+nlaWPML/C9HfEqHmgmSBR6UGx0/j6aZ0CEPLkdJhjG/empJVNW@vger.kernel.org
X-Gm-Message-State: AOJu0YypsehESUPIIy8x6JjtO5egM4fVj7IhiMhXeIqPXYZmAfTzahHi
	W7hoRYxmOZdVnrCSzhF/1O72bdIbHj0W+DTJzBD1lluv8lj/WgEuEK0IhPUM2qbUZo6EVtCXm7W
	9nCAT10/wK+d03ji8/vasGuhZtj9tH43nOig4Hrn83KVrF7gStXTBIF0TxB3alOpP
X-Gm-Gg: AfdE7ckn4lZcWdDlTBSolm6egJ1gnVahW40pF5xtoZE37snoWfPucpN4onzb14yVRI3
	87d9kBZIzbsIOb3tgC4rlW7Eh0ObD391G7Yj5EWQFNqJNKKnTOwAX+x/aQxczEQZnpypfLcpLNt
	y3BY9fBBbFNLMtUa54HByOadfmazwrh1HEXUBtIg22cwnjesLpdPb+grx/yf3eOEr32dWASi7t5
	kuS4EfLMajRnuaSVlldgGKrPDffSB49CyJ5OAsHPi9q6Hvi2uVQ61a/arGiALeSWPLJd2TkSqed
	4RXbW2vbxIa1Yk5JdiEHCxdvl02buXZ/6xrIvN2Pv7BbSFoEq8HgG+k8+BGjTnSbGVuDWpqkWKW
	CdU5PvRJybjkiHfWyDPFt6HnmfLYltw0sj5IKpcdPH9yXWAoQrbVS0hqRAvxcZBh7pACFISNRFi
	kF9fvJjUDuceNEe6548lhcLz7d2dWDKdmWZdLhml0lGnjx+eg7MLjmU1BvLXGpbLKSvs0aCF0YI
	blWyggVSNmyVHIqkfYe
X-Received: by 2002:ac8:5a84:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-51c8b3b4c44mr119708741cf.41.1783677470076;
        Fri, 10 Jul 2026 02:57:50 -0700 (PDT)
X-Received: by 2002:ac8:5a84:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-51c8b3b4c44mr119708391cf.41.1783677469579;
        Fri, 10 Jul 2026 02:57:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:36 +0200
Subject: [PATCH v3 10/11] power: sequencing: pcie-m2: Add QCA2066
 (QCNFA765) BT serdev ID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-10-46253587af64@oss.qualcomm.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
In-Reply-To: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfXyfGVTIR+pW5p
 LJ6OS2DXIMLvJqg4kYew3Hufm/FiQMu0+kAUJjf8pUWZSodOHX0nW5c7Dtbpc1ukfq+6VTStf55
 JOcW4uedWlwbGPHG1j59svQSVB/2CuWTsxPrYHoXRKifFcdYY0edrhQD8Js/sboK4OiGT3t0+IO
 bZZ39ycEkPxQtqAS2VxG+jF1YjT6erDrEigBVJJMeqKTf/ODXMT3KAOq9Sco/rgAB2cfR8RzNu1
 82XmTVgAWbn7NOT3QK1cdP/5DYG6h+PVhPopUG2WTcw4EFlcbtEHrtlLBYCHccwxUX6gGGNPiUU
 o4UN3Ig/UibV8Bw6Ih6RhgijIbeR/2Dk2udDv3Z+uMu1dHJbJKzoCMB64dVRdw3d/IZH4+50QJi
 s13w7mqJ79/qu0A+ooOLORv9J5d3pQ+oj/8cg08qxjm88hCFl9zK7UpMmEYVkecwuqjDvgL16Aj
 JpkGYECcgDRn51Tr8tQ==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a50c21f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hhiJJhbhXc7jC-Wm4KYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX5TlmLx4CulgX
 SWSO1t9dAz/oLSXaRzPNcTeGDnWrhBgt+IeIlPqhQwN2vXiaZdKzJ0jDp9ARWBpaVY6nL/yjjRi
 UZ/5EQjCUaHEPteA+7nu5C3inLMIS1A=
X-Proofpoint-GUID: T7IoNSl_EcTqjK2UCBTGcsahk0MgISBd
X-Proofpoint-ORIG-GUID: T7IoNSl_EcTqjK2UCBTGcsahk0MgISBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097

Add PCI IDs for Qualcomm QCA2066/QCNFA765 to the M.2 serdev ID table,
mapping it to the qcom,qca2066-bt compatible string.

The Subsystem Vendor ID (SVID) 0x0108 distinguishes the QCA2066 from
the WCN6855.

This allows the pwrseq-pcie-m2 driver to automatically create the
Bluetooth serdev device when a QCA2066-based M.2 card is enumerated.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 4bcd5078609da1be966ab30c73cffae5e578934f..5004e70ebbfc370823098ff6df7b79336c1e6063 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -216,6 +216,8 @@ static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_PHILIPS, 0x3003),
 	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1103, PCI_VENDOR_ID_QCOM, 0x0108),
+	  .driver_data = (kernel_ulong_t)"qcom,qca2066-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),

-- 
2.34.1

