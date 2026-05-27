Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84903F23D0
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875117; cv=none; b=btiiz+I95HQRxb2IMk1v/jQyTgSicWrgzOaZrHx9F9JzVOdW+db/nKYQuW9YvvwS9FpwPgobQKFmrsDOXQSouNTMMqEx6YaISfJmJmItyDhnQAdo7paJp8DbGJfwYS0U5ldUjJBXWO4ETrlUmth4DD/RHf3G8Kj2fnTx2xxE2pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875117; c=relaxed/simple;
	bh=OROsnhPNTOborFjuY73HT43dNiZE4n5sr8wW6GzvJdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2bnKafZTdd2uPHfy0hSAzg/da/D9ULwhvaBpcjk41Ya/upQmbJorNHgV646bRHdmEE057ouCWyov85lOC8FSAeczT3GjHKlzRvtDZSbE0n19zdO3oU7NOURGhrBbVNlL52XHiJgh056BCXdKL2ZoMYfs9zT3pA2zwLy+Hl21to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ic5CbiQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmiIiM+i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ic5CbiQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmiIiM+i"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mRqu2282515
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VUofCzJNTQV
	8qRBR4ci23lFkcf90NmgcqONAWYitlLY=; b=Ic5CbiQJTB/lqKrS7vqxsFbQf4k
	0b+Yt6aSXBDWsLPL4n/5RAuuwR0FQLNxdZ57F8lX3o5Zajz7M6B7qKASmngHKWwr
	kvjYQ/vrOjL/VELwG+s2ZICSNYuGX1BMFKKbtZrt+CXwgtLpi46ccaOs277rFXrz
	AWkISILO0yDOrBn5qxowqGzljxkulLeBu3D+icWstDO+jlMmtDafm3G1g7DjEpzQ
	ymNxldn6W0/GNdUajg1LQuustiyqQ8grtGi8oB0nR09xZVtTCJDlCYdpgKU65oem
	uNNRGaSgRGtcBEXnpvAXkYFSVMwa+IJuUnINeQtiQN7DeZWxzfqpsDn9dKA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcrv30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc977e6aedso124210815ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875114; x=1780479914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUofCzJNTQV8qRBR4ci23lFkcf90NmgcqONAWYitlLY=;
        b=AmiIiM+iwwFJuKEepnkjkhjUUNZ3Oxx0gFJq3NzbIgUnMhRAKrEjfgOxhWlSmBJHO6
         rDWQp0yvsH1QC/PnqOYyrevYXM8iVvl8KgMcGRLjJpL2faDbyiagv61R6vBN4edS+wky
         Rnu1+O3HucsPZYGrcnUlATBxZu5acOw3T/Kgq6bn9bY7YGGZ01q9EpR7U/8Cc9tACnAv
         0VBjpUknIaOpkn3b7y9vY+BbhtgyvcYX59o+YzcLnmppLrug10Y2gzNzRLfR73Nh39Fk
         j+uKuvC26sHVRFVtGmUz/OfOu9mXWZqEJ+MIFH0t/Vb1TWKp/Qbt8ATN6qXypqeB7+LG
         wg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875114; x=1780479914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VUofCzJNTQV8qRBR4ci23lFkcf90NmgcqONAWYitlLY=;
        b=W6gbiSyaqTfXraLpT3jxKpenoIrCsvdWszG8CXkjZrXHgCNhmgPWHFjKUtJpPosiJI
         jec3oe70w4n+dpRD0F4CjlLGEYxtBdOu49cAKMU8Qe1fBhKBlHMFi1QJ5qPiCs3unxa4
         zpEuR65VYLYDQ+TKT6mBuGhX+XDrA2xMB0NC+Xz7tzbB1JsXncxJw7GtiWMNYoyrbEYI
         zvqNQjfj3rSSo1zI1tmVWbE2T5TLaDpJNbGnplCumBvef3Swa8s9lSzCN5ySlOMlEWni
         YjWz+HIhJfiOfxS0VQm+w4b3z7YRNr4qWtVh34jYo1yUfZgKMIvbBytMSKgy6zXKRKGs
         EAuA==
X-Forwarded-Encrypted: i=1; AFNElJ8XEh34Fe2lcHijsIxAr0HfweKO1xVUHdY46L59YIl33n3BW70oUiHgD5uzFqvXoMapkFj90xcis4aM@vger.kernel.org
X-Gm-Message-State: AOJu0YwCRNoWGi1Db1vMvlbLdVeWq/yoAGFO3zqsxcEqZ6BecqRVaHoQ
	lh3rfbclJ9Sek+lwwdYrHRbHGN2on0PQztvIIJEsHAEmtjvQUOcTIZakNWmW4qglvsE2pT9HJRO
	x0oOvS6tYWfmRjrvOsHGe3XsC0IsdOn3GPBvAJ90Oad91/vpX/Er5JPdt5t6vpN4X
X-Gm-Gg: Acq92OE6Wls3VKbDLeo5lwYLTnq+UzxLFNg5KQNhFOxtUTHroXxDDucWFIfdlH1H5KE
	qpKZWYA1a1tmZZARMoCVMFYpihw3FH1o8sZi11yT26XC6N3gnlUCpJMc016jM11Wz5JqSBJ3Etb
	3VXPqaM/wklJJ7uZrecdzuE6EETvZIQXoVFOfKCf80M7732dNi5gVa3FvosEz9mqlq9CNuUvQpL
	wq50Hfmf+BVGYMA2if1ZdVIjpOwczDOlFzxqIymXvJiHWfq9Q73EoKmQmrkC47Apx3snne+6vtp
	mM9SgOf2w4m2cdRzT/B6I83My7sGkTvFzWaSXd/twCiqhzdsP915twckZZsBaipe3tHLz0vMHov
	bIzszvYuUuUW4M5w3KWsq+XmiO/fk3mzFkbmnHVDN1hXZ1+lNVG2p0XT2k1E=
X-Received: by 2002:a17:903:252:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2beb058d650mr256230965ad.12.1779875114462;
        Wed, 27 May 2026 02:45:14 -0700 (PDT)
X-Received: by 2002:a17:903:252:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2beb058d650mr256230585ad.12.1779875113931;
        Wed, 27 May 2026 02:45:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:45:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 23/24] arm64: dts: qcom: qdu1000: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:28 +0530
Message-ID: <20260527094333.2311731-24-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: b5kkzzQ7kP48Ow1-MjnRTJxKgMizyp2n
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16bd2b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ewtuPFv0Yv8HAGY_YloA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfXxHra8waHMy2w
 5php4sOnuUz6Xd534w8e6MuGBsGeGMK6MfLC1CthuevIxlKMekudjsr4UhZqKGMcMoWZUIECD4g
 BzZmUxtJbzT/UFSzZipF05hx1l0B1PP8yy5k8YMwwFDcTnYiKSGXPiCpaSNyA3Psqp4AtSVq8Cy
 4vv1P2PM+7dRKhXRe92G9Cxod2KXqj7HxPp+M6AwJcIdQy0ejpT/10NBgmjZa73hvtPh8nYdH1K
 gBmVe/z8fzUT5A1PzxabK/4rLhwgAZmgBkt/3O/+apnuQ9IMecSQRQXHJHnBd3p/PrGrNBLJmW5
 NK8A7qHODU5icOTtryK1sp3kJ98f9Va9nJFF4HyBQWNPRomdmzDtvICx4WaL0tTvyr9ZThuUI3U
 Scp5T6hH85MgdFEKSiDBHi8Vlmhd3y2avABAn3DwU07OKQKDEGqtunae4bqpxXCRTaeWey+XUjB
 ysHZUw1XyoSdcpqdmEA==
X-Proofpoint-ORIG-GUID: b5kkzzQ7kP48Ow1-MjnRTJxKgMizyp2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on qdu1000 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 952d4270d118..26cc86d12f72 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1054,7 +1054,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qdu1000-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0xb220000 0x0 0x10000>, <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 12>, <14 494 24>, <40 520 54>,
 					  <94 609 31>, <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0

