Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1CF3093CF
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 04:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782017453; cv=none; b=lkhmb2VsBFGcfE0byWnTv0C7ANMcubRaHtAjNvnJKZx91kZdn08lXqcz3UmGk47thUsKd1CA9r32uCLq0mVXrHiDgcq3XwAsOm6xJgUTJNBJAJVLeey8mFtnvjq9ReDK+GEJTvw7CpDTAViZHWX/E9URjqTX13WinLKbqWyqSdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782017453; c=relaxed/simple;
	bh=UHm+aCrYVqg+ykmML6um2m8aKd9s5ihirLFCH12XCSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LC6ybkENhUc4UE3awKhXIapy5qQnBDRtDHRB45FDWFXDvty40jpG1bHZe55nUUqG3jEPyEk61fxFtTBQ9zkfnfyrx/x4JuY3EoF2Ie/652ruLrYv9LAUd4GNLDejQxBnwF2L8jvVru4RISamPHk5TV1qR48zxdQBu0TT+F9Y7mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHzl6jEl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTVBSYyb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHzl6jEl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTVBSYyb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KMFsvU1733478
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 04:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpTf+kLXcdI2RBQwcOOy94y87euzuBCDOpPar+c8U1g=; b=IHzl6jElCZWXFAMU
	9T+fJU2PqJo8A34b37PFWHz8jA1WEg90I5WgggvPE8j8MdMSzu+y0CEYVEJGs2U4
	4jelAXukVb9fEwyzAmIZwcIlF8Yccs6X/2c0Y+Rt+loyucTU6cyUvUQV3PiviDSs
	re8zeC59tdhxGskuCFL9gKgBrgNMiPqwOJlvIZSdyOW+Y66BM5bg2apf+jYx9HaJ
	Se9EFhsOl3caohDX1vKgswFAXj2ogb0fEPp6Jah1PlJ1SN13uPDh1MZGsBA1fKyi
	E92oc7KOTWLYmKt2UA6guF+ZTr0N4vYQrPrx8p4LDtULwlOPNPYBAmKLs2tqc3uD
	UiYrtw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32t99e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 04:50:51 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-800292c6be0so43523907b3.1
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 21:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782017450; x=1782622250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpTf+kLXcdI2RBQwcOOy94y87euzuBCDOpPar+c8U1g=;
        b=NTVBSYybX6aHdjnvdkWTFnYkpkl0gdSJd7QFosn+G3jMztg7qw4EHkc7E7blr080ap
         J/e2SMOohhdOrOQB6zcyf1cjUKxA2jPrGmBgOnBReDTexaB2VWCRGaKO6S9sCEIHyRo2
         t5vJ0qjFTGaeftLAo0hz8fE+bvxcSszy2tPwYuR9F5IrOCs9jGrDCAwALsdamMs9LD3P
         LTBAddCrGU8uG2NDC2e+aFSKceeB9fTvWi+AArxgZOvGINi59D9Ps20bs2xx5h709xqb
         BIv+khwDe/FDvM/V1X+NFujhH5btq+NaqJp1K73PdZH3UmpR/9OviZ2DNxs7RR8LdTCb
         Lgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782017450; x=1782622250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jpTf+kLXcdI2RBQwcOOy94y87euzuBCDOpPar+c8U1g=;
        b=nLKDXGSv4/64E+IRbkFPHgwt7t4+IkswNIV4CM2oGxFBhzrfUXPNN1diTHBXwvKXAB
         A7Z/98FkvAWc6gR5MC6yoMgrTyf+XlJ2wrR3v9+arRuS3/txvMr/DPlyEQMFO0gv+jnf
         06RvkAKc7zRokyLg9Mi03j3lt5xAt2U0pIpX4/Y8tCUpbSpQHmUfe9zCjDHasBeCdGb3
         YfU/dTp3liRFAQsU8K19VgT++FCsOB8nzN62nSHdxdMfUgB0LWDYWP39swuXRtc5xTrf
         hv90uWSueClpF4M0hS35PuU5GuNycWY/Via5FFJ9e78eFc3FNlxndMCEUp+SlosEHxMe
         ipEw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8oiiAvYa59aY0F4oQAM4M8noKG5jrOHznUUK8FHzSflpgs4eZ6roX/xxYgOJ6gj7inlU8Wex2C/0Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxkSo3TJoyYKPkv2YjFNtvCK0nb8eqd+KBDyw1XISreMx+OZeyC
	9xDXmYH8IKjIv0COxuEsR1b1i7xrlqURZeOtXGmZ3o18PAG1dVv7pdrCTqfA7DSPfvCqxKoucyo
	8aDguT1aIuNMSxb7yNSX8C2ogPrANbFk9xM0Yxq+g6IVGeInDFjzmpu9R872tz2Gt
X-Gm-Gg: AfdE7cmIrMqz89dc+TBVVjtUuuzuz4FKxmu5mGahEqQuQvllhEgTTeTXOZFl3FUco8t
	+GanGTuvRvnkzzf4Ky/Mcq6DP0b7vO6+qrEpQNULCQb7vnM2unv6AdInzBIzzcXSwhtfm5W8fRv
	TfLD+QBxRPyg1ROwuqfuMLrOmdNMDdod2K2ElIqm9YnPfAfWqpWOKdPPM6s7tnLLLWFr1LjVmpm
	S6G7xg2drTBBTBqC65DkxsUG+ccaBEJHo1wXzJ/nPgsaKwvij5YJ0Z1rwvqeBLulfKj5WW+t/+N
	rUWMxSIbRRau9ftSrfG4PPxOaunVFQ1+ZrpswItHUUpgj4s0i3icI48z+o6WweRU94d037yFlap
	TtOg9tm8od/NQi9DQ8Gs9wQcuR8Q3Ay0KsTO3KDJv6l1QBuwxwHqAgR4ATpP9F7lCPWGr9pumq3
	jTvpqR2Zt/ZXIa2drmKIJk0FTpEgKzt0O7JlQTpEh2zAsux87YvCWKDDc=
X-Received: by 2002:a05:690c:6ac4:b0:7f0:4c1e:8b83 with SMTP id 00721157ae682-80132a4ec42mr94792787b3.36.1782017450412;
        Sat, 20 Jun 2026 21:50:50 -0700 (PDT)
X-Received: by 2002:a05:690c:6ac4:b0:7f0:4c1e:8b83 with SMTP id 00721157ae682-80132a4ec42mr94792697b3.36.1782017449934;
        Sat, 20 Jun 2026 21:50:49 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:855e:5925:800e:2644])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8026089574fsm17226837b3.44.2026.06.20.21.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 21:50:47 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sat, 20 Jun 2026 21:50:41 -0700
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-glymur-send-v1-1-fc4a2cfd107c@oss.qualcomm.com>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
In-Reply-To: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: GeCp0sGA7YIAuXReBF94V89Kxwf78-qw
X-Proofpoint-ORIG-GUID: GeCp0sGA7YIAuXReBF94V89Kxwf78-qw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX0BqMP/l/pmxw
 i/Y3qb/uN1GtYAURrWEV+O2wNyrc7ViVOb5JnjAtv6SiOTmphuPB5EsqcInEjemEtn2eaINdCHE
 oj0u4p3MaRnJJ1MzpEVZcDs/VmG8I84=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a376dab cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX9HK1VfiH4/rC
 rxBjh18YehSM6Ea0YXxfuxLu4/var8D0yGyuJ9A8cK7zUBrRCJ3JpUBCjgq/HPi9EVdrcNtk1cy
 4rOonFIUxCYi9Kma8grAssiq9zv4qJ7N5tQIrOEfLLqxzaaZaRdxwrc68C8w6HB6jDs3IUWplWR
 xN9FKG9v86dKfbiDeCp52KeqO4aBHa+dgdJBBgiZAfn4QXqH33vyxg4NGQ3Tbx7HLTNUt4ndfc3
 3gRvHkylFTtypcn7+nUW/LiuooUAF4novWwpH3FhW2iRir/PX+aejkyNwf4KaqZOyDjBkZGgoeu
 W2w7RSI2fm6DTgDUfMNkAuSCIBhrK+YRW+pj9OoZMAdsThqQT1ahRr254MADlsUJnGKSIbAhg2e
 sSngQuHrxCd/+uR52z3OJCyEg10RdQFGIwAtOcHE0ZoUG6vcIWVf6rN5YtIGveXCaJOy4bxUHkQ
 x4T8hcNPzvLbcm04iUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210044

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible, falling back to
the existing "qcom,glymur" SoC compatible.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..934f62407b86 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ properties:
 
       - items:
           - enum:
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1

