Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4A372076
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418059; cv=none; b=LdHnmj/lV60doVAyJYt6YLXwOevo6im3ejtSBF/Sv4o5v9vvQQkKQa07dalGBqnPzI7B3Uv/xMTofJteeF+Dxry5TW9dSqeIpnjh7US0oOCI/+tXpjrr6D0Qb3yMS9VNuWqDKN8K09ZtWocvDOsTY+9KDhJjtIMB8Y9NzwlXtEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418059; c=relaxed/simple;
	bh=J64TBZqTk1QXlBUQoeGP2nX3l5e5H4REshFs+0vJDvk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U513TBsUsLoanTAVb8agC3qWcmR9EmQPKXcjVXi1QTeAnrNG2p8TIMCJGf0GJIVu9ihXTPdenoygzggLVwy6KRYdY5TgDIU7Bc8+qob6e8IuJuFsiOup351ItQ8rPImAYPc8AOD0tkHy+o05nfhTpVORXA3BAAQuaDQuepatL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX/bXGNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIcfSQ5i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX/bXGNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIcfSQ5i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652BxNR41316907
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 16:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I4bu085v3oEV0BzO6mwiS3
	He0mHSwQVVghQ9SvGPq88=; b=GX/bXGNBfjy5uP+eYfdyZosjrAqUXCMkhQHF4L
	Pn21Oj09s/qcxVROk3E13fljcmUMpd05dCcRIVKihC6pNZVx4VS4tZdpNz3TW+5J
	tPB01ngnFna4gx94IQkGxNrji/vM9MDBzotqRXFShqzP7sztwsbDgybUqTCjcQqM
	E/NY4VllfbSXjkTbggVWAoPiK1+I4e+eLOb19RW5syQHS19uXDhTeFvf2xxU6h+B
	BQ+FrCRUwf0EbY2dTQDEMIZDyppB9coMj+VY5PpfipNsYC9JZrRhCYMormdKuJfu
	AnNPxH/n/V4BBomU90eUEPPdQUooEqH/bhRs79GlXADdhJdA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vtpdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 16:34:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f3e4728so1791763b3a.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780418051; x=1781022851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I4bu085v3oEV0BzO6mwiS3He0mHSwQVVghQ9SvGPq88=;
        b=fIcfSQ5i8whEXcwPAbx20kdyMvlbL4jF3UH5aEpTfSfTEaFGIqODu7b5KT7EgTlOn0
         tCZ54uIAQBs0Q3YqweQ/2l4bY4HA574Q+OzDOWbj4tF411XOH7Hu5zj9V6ya8lm2ejJj
         +1DBS3hancsbwMlAOlpQtdLPGhEOqtheVjaq8yDuqJMyogINBEEDP8I62NNzPor/VKzg
         QGo6fk5PkpvT7z+4G2JY5o7IuuZF5F7x507SKzz3oF9U8tUvzmUSgtauve2d/A72UFL+
         +Smt3M/NiiS4Nqos2jXqfecVINL8QoH4f9j220R2LvSqawd1z3Io7C1LhNtqyPuwKb4v
         4Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418051; x=1781022851;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4bu085v3oEV0BzO6mwiS3He0mHSwQVVghQ9SvGPq88=;
        b=j3XmRqovuPPhQyX3mgQw2NoiNRIj2Z24aMRHMxZGobpJpH1DMAHZ1H7mk+B/xSFSeS
         rkdrdg3KMOJqBn6Q1V29GcTZs6uld1Lx8YIMlUTDNYfBBcyIuqFma1/mp/cTCtVZ6j9v
         WMCDM7nR+NyMpZgn2aAJn3naFltrdLyYVOrdhUW2bTwM+L496NnmPEs6C5Dr9Ql/GBEF
         pPKS7py0so5smvZawfGtS7bw9AW8ehbVr6C7tSpshCjpgC1IEjNKmqh22X08VPD2d7FT
         13ZejiQX7l2+xWb8nwK8uousulSfk+eZM9cOeq0uAPg+/lK2NXuzNoVhI4BDIJLKXlDd
         hr7A==
X-Forwarded-Encrypted: i=1; AFNElJ/MWQ68H9KfQLB8tE3qEYVI+hbL6kHOGMvpeujPJXMojrbxPU97M8nj0kSe8fQ+PS4Glfd2so7OFTUs@vger.kernel.org
X-Gm-Message-State: AOJu0YySA0IU/WuAkpp6fcfSkgq2JH27zOBZZD/JCFy0r4c6R+7Waraq
	RAU9sXEZWnZw5+zgSIPbhwknqQ0t87YvoYXnc/iC+2wfzgsOWIpSaDfKTGm91ZBGgWJFAXT5qs5
	fb1esOPPYhzKltEdQWP6ucdCDGGAhBt037JoiRjAWKYd/1yqSjmqXyZd1JJ9zfOge
X-Gm-Gg: Acq92OE+1AT5XghYgmXr2VHQcj9yKXnbNNvNfGVCnUbQmfHntT2w4CaWkEzCTzmvkBU
	nlT6YLKYycLhxepATwwHpMnyNJ/p2vDF9xaV5VaV31yLfyFcQF7VftZEJEZnSTWlVrSqbqq5gfE
	Wz8o9qA8rnTu3VW5jt6SCr8J+kY9qZ+lrnm+AmR18iu999k+5nWA6/t88yGpsvipY36BICEfBwt
	/NR2jTuocHvdzeAyOIzfWuykIDcUBUNQcY7esbmNdyaJB4bWqtHy26KUIwCdC7tygN58so/IdJE
	7ZED5Mxif+Ku8kbTqZgGodZXUS1B0U+kmMXYFg4oyecg36JcF00ilA70DjSz/jegJj88g8U3q4T
	Oaat893MMOzUqlAxIUmieOhxuTETju/lhYWDdCJX4bgRhGO6hkNWCxiOTrLsNeLb6FNvijHGBS+
	Zpb1n/42LtT6JPErcEqrfbLqvVvGLWmXEzrYdLI9glBmMB+Dtp35czH2Zttwqhpw4U+Dw=
X-Received: by 2002:a05:6a00:338b:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-84282ea4f08mr341650b3a.18.1780418050805;
        Tue, 02 Jun 2026 09:34:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:338b:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-84282ea4f08mr341622b3a.18.1780418050318;
        Tue, 02 Jun 2026 09:34:10 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm292181b3a.7.2026.06.02.09.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:34:09 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Move PHYs and PERST# properties to PCIe RP node
Date: Tue, 02 Jun 2026 22:04:03 +0530
Message-Id: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPsFH2oC/yXMQQqDMBBA0avIrBtIY43gVUoJJh11CjVhJoog3
 t3YLt/i/x0EmVCgq3ZgXEkozgX3WwVh6ucRFb2LwWhjtdVGfeOKLiFLdjk6TsrW/jH0vm59aKB
 kiXGg7bd8vv6WxX8w5OsDx3ECtuDxbXQAAAA=
X-Change-ID: 20260602-move_perst_to_rp-63b4fab37bc5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: eLeQhfWAE6bZVJHGADAYsPD9B5sgLiyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MCBTYWx0ZWRfX0vRejtSiWV0w
 6ibClX0gmvZRG3k/YCGIGk27mOhchM5C9ZBNQfDkGp5pvEo9a/n5biIbhSh/n2YbYuXBRcxJpcz
 vQANnBni+yR5F9Z3RjOauOkDMoe4XKoJ+R4oAzoikFPi5y0OTRUEG8PbimbCILT4Mw3NzWL6VeJ
 XYdrtte9mwHZpjUgMl5jPGECDg4N9fjqbfmk1RBgDHNPeaX2RXwC1533EOc0RlTuhPsp1yMcY42
 JwnIwWweO9dT+RFbnl1etQH9HJv3smJWhW9bvWUtRd4rJpwf3qDQvuMSa8BHjdSig/OQj0FuYxO
 t2iKv2kh11FnpIJWU0PtIKZ1PQp4+z3Z877vfajqBabiceK08cLmb4GEuSWt9MnkG7LJSb1zBC7
 AiQCNDmG0ATUXkUMoYyeaRztTkS25K+cTtxdluYhlHmSbnmkbK//8/kXtkrVG92nDCVDD41saKR
 MA9JYjQQKOwL5u1Q/MA==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1f0603 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZjL6ptMYfJ62ds8jHLQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: eLeQhfWAE6bZVJHGADAYsPD9B5sgLiyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020160

Follow the new binding by placing the PHYs and PERST# (now RESET#)
under the Root Port node instead of the Root Complex node. Although
IPQ5332 and IPQ5424 are intended to follow the new binding style, they
still define these properties under the RC node.

Move these properties to the RP node to avoid mixed configurations.
Also, drop the phy-names property which is deprecated in the new style.

Other IPQ targets still follow the complete old binding style (no mixed
configuraions). Convert them to the new binding in a subsequent release,
which will also allow me with enough time to arrange the devices for the
sanity checks.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      arm64: dts: qcom: ipq5332: Move PHYs and PERST# to Root Port node
      arm64: dts: qcom: ipq5424: Move PHYs and PERST# to Root Port node

 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 12 ++++--------
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++----
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 20 ++++++++------------
 4 files changed, 30 insertions(+), 30 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-move_perst_to_rp-63b4fab37bc5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

