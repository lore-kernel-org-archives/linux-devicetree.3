Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B143E3ED3C7
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875040; cv=none; b=kpZEqX4/ESDn7Q/7SM5412YhvtYa355XnEpyLy2y5B0le0DlnfO7ygUyEMmxQn60BIJzD0dG0F4wNBOvfs5HdqKIURMCpj1fFV7KqEkm4BErzjZdmhPJsGU58SjRcNKI1koFgZ5CBKCC0be+MISmc0tteQMg4hc0qiAhik1B5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875040; c=relaxed/simple;
	bh=S4MN5Lx+JgvX/76ZD0ZuUHOHxy2HF1SGKMrwcl1B3EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FITo45ipzzsk3NUi/lMdZcarxXZDdmtIdsElyFbrRjJdfWvw1dPOrCsDacAqFvNvvquyj+6iRblbvuDhTDRY1EXHF6XOIRKhYqX5OScZa9quaT/lFpXLZuz9ZnTQdoL06aWr1tgtUQEqj6A9rcNGqLdArtgQDBerTuNbotNbDC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIRy68N8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKMAtl7d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIRy68N8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKMAtl7d"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mXbY1176638
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bafDQcm3FyR
	GDTM1nVP96sfs88nvhyUJwVGPCaXqq+Q=; b=GIRy68N8sTizJne643nS3AkyXo5
	NubHC1AW2a5KdYXEoRUp1W/gXLn0v6tuSrNlFU4wXNWoxk2hrLaelEp7g9QYlf5d
	qEoxaKjt8EvRdMRgtW68Z0VeAkr9RNPb8/+ngFrtc8FFRwrnQVz8/842Al2XrtU6
	RFY7XdjgkI7flxoLBNpyzfjvEpSS+sX8wo6MZhmKStcEf8dPjapWlDZDdmEgaua/
	rniYeKiwGKmgZB9FrNTvmU5JIYsZ40X4iiqaUvYj/OP+Td1T6Gi2zT3mAay0NIub
	ZDtGvbKyBZg8YXuUQDUVBWgK6kuPjxd66fUUAlPVsrBhHZ1Lao6nC4LhoLA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edndnhwh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b458add85aso127071195ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875035; x=1780479835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bafDQcm3FyRGDTM1nVP96sfs88nvhyUJwVGPCaXqq+Q=;
        b=RKMAtl7dkGdIlfbMjan3moGFydqOoKmD/K9KCpn65H+Pko4I4qGCo5GCqtoGjlYWDx
         EIODkJYony/WUfILsgyUFzEIAWPBH4U8yQ93hYJFSrjtCCsDy94Enf5KYEI2f0ZDP2RW
         hYTvXNsdegtjVNXoMktAmapXPIFrhPKf2sjqyAA0vHccP8hqLJU6i4KiIpkJHrndh9gx
         iwFbsLnJ8BzLOtvESxiQOUce+gsfHfgr5DUsYgFKdmRawHOE4IgRL1Rzr/9Rod4PwWUz
         /YEss7YuIGwgkWDstjdTVliv9noGhSGVTs/W8rzaVoYq/bPQWoebRU0SwgNThSqVA7bc
         nf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875035; x=1780479835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bafDQcm3FyRGDTM1nVP96sfs88nvhyUJwVGPCaXqq+Q=;
        b=GBcg7B9/T7VbP+grbKOIs8VCj1PT2uq8tzk3pSWO0PiJJPJWykM35+cR+DXywVBZP5
         Mhvk55/Mm+Cv2THddtoglV8LIRg+L7zt9oeHUMTenSkBbhUvZ140VgwTKn6o0mkIFYLb
         SHf020gYtoM6z17DR4p1vYOoII+OLnlnOGGvkW69GS67lgRvMxyDhF8uNK0EDlM7aBFm
         h2CABKMU3qdwr7Y8rrDa4WeQEbV6acc9RP4v33nsWRmCYSyfbei2RlFx461ntXEe9dSM
         WvdDfjeopgjiKmNKy2yEDADxCOV8bScDOssdfmAlm8hxA5XJbkj655Bgou966nUzcyo5
         qFQg==
X-Forwarded-Encrypted: i=1; AFNElJ9jnodzALCirpWMdMiyaRh4a5qMPgP52UJtV7rvSAvth3wFUToFNSc14wOuuTIz0iVoDFikLEI4j3KA@vger.kernel.org
X-Gm-Message-State: AOJu0YwgUrCT/Q9ibWbJYUpIwa0R7ADm8xmySI7lhIsAH9ZMgy41DfR8
	rNXI8gdbU3Z2FRu6cXGSWrmw1zW83wWE3UUCwpW5H2KAc9CkMgFOy/gC/K3ijZVlNzqc8KolA8B
	C6Pja9AA8VwXuy/zv7juXFPa4Ms1qOO/bKWVlV8kryxjjbudql+896vJN21wfQ0GO
X-Gm-Gg: Acq92OEtKcrtxjY0E0qU7do3KBsNXZYYu+QhX5u1aCjqriETCItc+9lRHXqlh1gxK2p
	RZJjDUdLYwAQQn5AviBzHj7iRNMgpzavBly7+dCipSK/gRr/HWoQ6dGvusFmP5AO+s1rRx99Nl0
	RZ5w6cFVO9exB3tuPeSOEi5qZXXnizLDQk4SVRooZjb+GXr8ZSmBeEJw3LDVxSPAePA27wLL7hR
	l6+mT7UVXGmy49UHgV8+ckebFx82/cYgO3Nb51Wtlmyq49TG4Cx5lvsLHv8bChLwjaglZUPpDzd
	wpUWnbYjxlWdy135BYDCcNyHPJY/fE7+Azq1Ct1kJPzww2PVMRsuTZw5QQnESp3EV/AzxzIBxOK
	p843Y+IkgJ5rtJ7IQcQQ1NqYIZdJ1jmWDIlgZMp7E9j51ZTkC
X-Received: by 2002:a17:902:e845:b0:2ba:4f37:d3a7 with SMTP id d9443c01a7336-2beb06a63c6mr257304315ad.27.1779875034440;
        Wed, 27 May 2026 02:43:54 -0700 (PDT)
X-Received: by 2002:a17:902:e845:b0:2ba:4f37:d3a7 with SMTP id d9443c01a7336-2beb06a63c6mr257303985ad.27.1779875033932;
        Wed, 27 May 2026 02:43:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:43:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 03/24] arm64: dts: qcom: sdm670: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:08 +0530
Message-ID: <20260527094333.2311731-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PpSjqQM3 c=1 sm=1 tr=0 ts=6a16bcdb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=E_KLwQBYGHgwXO2bnEEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: bz-pr8sTaQOKjIgVeN81dnEvFpMkqa-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX9bpyEBxNsxDJ
 I8isNzp1o3uvav0zfRH3IUNZrMIoDDxpt5X96EH8Or8Rjv1r6AS4HO4LCath+UtQJ8ago5YjSwW
 BsJqn58PWNbgFTueIyvTToSpnOsnor2lyUuXe+yFKKIRAyZKAjuYxe6b9fWgQMwo6eJBrTE2H8V
 RT48PeH2JsIoQ21SSt8Y8TTbC8OgcNyqz8qUj8Dho2sTkFxkrMNH7VOdu40zbcd/sLsWixqthM0
 sFqI3CdbOFUtveUikUdCybYTqsutjyXclKyry0jJ0LjB5v40xQ9anwwe4WnpJ4YIZOZgNPm7Lek
 WvrGUOBzSa/odXghBGCvuRWaxFtjyjPn4zTqOgFdXMwOTrXjCYpzQ/lCrC69dtBsBl5ZNEFdkcr
 aPh8GgmpJyu+pjFP2Abh/kvAEWzuVdL8Xp//x+aCn+yxlsODHcN3cHq8oALNZhYVh63qDBryHyA
 OntfhMsM9rkr0N7obgQ==
X-Proofpoint-GUID: bz-pr8sTaQOKjIgVeN81dnEvFpMkqa-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sdm670 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 30844b150c80..5c60ea36f04a 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1646,7 +1646,7 @@ usb_1_dwc3: usb@a600000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdm670-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>, <41 521 7>, <49 529 4>,
 					  <54 534 24>, <79 559 15>, <94 609 15>,
 					  <115 630 7>;
-- 
2.53.0

