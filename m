Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD2937DE9B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135408; cv=none; b=n0cZXtXoc9+7Rz+27B9KC1pfjrrzbnKxwpQcui8tvZnZwv5ppq8A+eir+m0S/68/gmKH8la5jbnTeRtAmlJrtU7fkTGWdIltJXki4U/Fz3VUAfPmkyKLWfU8m0Mi2KG7xkue6Zt/wOF0Hwccfa2mZr58ts5lpPKR5jrrzO1MK1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135408; c=relaxed/simple;
	bh=FZmIlkAWgTpgkUA1qcbrkRBviVIe1smoUU/dkQCsdnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gr9MfKaHFGZCSi5lUlrXBj/79UWk7EKbf/oT+bz/PYXI+m66cKZ8Ae/F6lVCQzT+cvSOHgojtmMCYulytORtwcEMuZv76RQ9RvBIJP21QoB0Y72PL7vjYVraxCzt1j1PnY14+95WKTV7pyfngN0nQUoTFh5dNJvUW6tIFa+ArxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JV5Y7uiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwfJFtdL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JV5Y7uiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwfJFtdL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G4GKbD3462710
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KT6ssDxp33327j2BUAr04T
	8mMEKAUqPY+ZrsmKoNZsk=; b=JV5Y7uiRUBPr5aHUP6dzQ++RRgpPc1PHHZlrOP
	PHoIZ/6jrmvY53r8K/3Ic4Ll5TXgPusIW+xyVjBZBZgRI7jr0IpMadzYhiXRrH4W
	eg85jwJiCjyUfEnRHrff6LPuCttihqG5RwTJS6syRvcVyr+32sqyBi3lgu3c42hw
	gePtFddFO9aIq7yjE0rbmUgoHRveUU94rjB+S6tUnutKP2xmB2E2cY4kxn63l4eJ
	INGLqojIjEYBcv6UmIJw0tiUJ5kbDO1zx/Kj6aOJLnnPuhvBVuqp3sWg68UXGRR3
	x0Gf94OHMK943fBJTNgTcslyV86iZvCu+l6MMS1hC/vEQT1w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6bpsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:23:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so699862eec.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792135399; x=1792740199; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KT6ssDxp33327j2BUAr04T8mMEKAUqPY+ZrsmKoNZsk=;
        b=UwfJFtdLGXo/WDW5vqKCilbXWaKSA49sWnRwiyU08V/PX4KXzKYtmXwBhzNEL32LhI
         RYkugr7V487/qXvI9EZYej+/cCYK42lGAmv1v+uzkZISwivLhTmpzQWqoPg1Iyn0qyee
         hTol0u5U4O2ZtXoH89+MDMkKUmB/gHyd+8MK3QZCP8LKKmvvXwZb6NxM8F+kCOc4ZFVy
         KqTIQxFIcmCUe1f/Sc/14/eAsNY2tAtfwhtsXa17HbKKeEHewrraRqo8Q+qcx5H3NhUc
         C+XVg+ZJwoXzqWWNpGgrYqq49C3Q5BlSduqd64qiLghxdnk5UTXxQXXi3Mb5LGbcWocM
         0+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135399; x=1792740199;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KT6ssDxp33327j2BUAr04T8mMEKAUqPY+ZrsmKoNZsk=;
        b=ELORzjedMQJp5y6zSHqZBsOdpJioIE8ZpgoN5BMZPHhLO74/SXnCWCccZRIC5IMSyW
         Uu+xBI7TTJs2ZbbA7f+cGheHxUO9amRTmmjU51pi+1tplVKU4/eyR3dXz4ivZjLkwEA2
         MDTujJ+8ao4Yy5H44J+VkuIReML6YpvKze49Bxvvz2MAypL9W6H0skM2d9oNbfZ/gitT
         PmMu6OMVUqQZlD3VzF+VzKe51p83cm6eUULmo+Pf279ZEITzsJehR0U7pixAJ2PSyyAC
         4muhAODWA8mby4ocGOMSrsX3G/Uo/WL+3Gc7B3wI7gApI8MXuyGN2qemevzQptdSQWjD
         /SUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzIPG7hPvgv8WMjryqN9MHnG0Nx4LEbJdfA3zm19K+dSXY78TWCBWoXxjYmJ24GquVbuUUY4QXTL6n@vger.kernel.org
X-Gm-Message-State: AFq9FYJKJWZhcYtT/1eIeP/XzmCIErC9KHPHURxSQ0Dm0J+8bozkPlHl
	lG/4qpeYs+XR/j0vImUSmDtdke1/t0z91jBXGjBItdSXxZmHvYLuT9dQzIki3cYVhJ7wyU01g9Q
	wAw9L1JQoS67mi5+3acGVAFNoWjFm7CFP4AYwKXtAbJQOPCpaQPnk8lqm+Z/T7kAF/OAmVq+R
X-Gm-Gg: AYBFou08H3UmCOh2YnqmG9dFOXJ3AL5sq/puaoqRz7CeEf9yPF19+H+JkwVJvBmSXvQ
	FZ+R+0E+0Iw4ZZBsdmuembMBtqsQj7e+lMzFHKU4LmMsunhOgDZD+dT6WjN4mG1tKyzsGfLlQke
	YUWz6OYHKaB91G4/DQWWq7J1fF6F59JkDcHRzug8pr57nB8p3NmgXiSTZN9NatPr/7xJMY1V7BO
	zZDFu8a8pd9m32rEiaPa9qYqIE6lI60V5zPBayDQVJ7gJupGvLym+NnntD1s2OaCDlA7kP//rf+
	Dt9iHM8Z8yLBiwaZpXwHpbQdbGoZuDafbt6FZMZSG7Rb5colxcS/oQMPEuQzQHJ7eWJMhEimIDS
	pa2V9jfPdmNXjwjXFRnpV8yYAVqaTd+DrO0045WEMR3Luapz5senr1U/IO4V+WRXCRIDPVxO9oa
	F9UwpMVWFtOHMX3BtO1oXpEsNYVmFgem/AIw==
X-Received: by 2002:a05:7301:5406:b0:355:29c0:9cac with SMTP id 5a478bee46e88-3602dcda842mr3011803eec.10.1792135399145;
        Fri, 16 Oct 2026 00:23:19 -0700 (PDT)
X-Received: by 2002:a05:7301:5406:b0:355:29c0:9cac with SMTP id 5a478bee46e88-3602dcda842mr3011759eec.10.1792135398414;
        Fri, 16 Oct 2026 00:23:18 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm4024260eec.22.2026.10.16.00.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:23:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:53:04 +0530
Subject: [PATCH] spi: dt-bindings: spi-qpic-snand: Add IPQ9650 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ipq9650_spi_nand-v1-1-d341a76559b1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANfQ0WoC/yXMQQqDMBBA0avIrA1kJI3Yq4iEqKOOizRmbBHEu
 5u2y7f4/wShxCTwLE5I9GHhV8jAsoBh8WEmxWM2VLqyqNEqjltjH9pJZBd8GNWE3iBRb2rTQM5
 ioomP37Lt/pZ3v9Kwfz9wXTcD5kGedAAAAA==
X-Change-ID: 20261016-ipq9650_spi_nand-f1a41eeb4749
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 84wwYbPL_5N-oDbBVJWL1HInHOJNPfFF
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad1d0e8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8iOvvssTOYIHNyThGLsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 84wwYbPL_5N-oDbBVJWL1HInHOJNPfFF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyOSBTYWx0ZWRfX45zfls/YiUBs
 ByEfX0lpxYV1FqGSY15/gjLvrwvtrT9rMFN2Dtgn8knuJQ/tcI6E7MZUXCRfprrhkw8LEeCd/43
 w2lNIShk2QbvZ0uNbbqFLaWp6/9QRUOGtHT0YUIqqzjx6QiZHfdUyslNYOdbGdxqd0gvRygGGgZ
 wQ40Sh5Gm9VYmtvrYI3frjF4XpNQCDrthA3eoD0M2BO6ei7e56nZhvarv0KxADpohueY4LrgxL0
 AwZ/Q8PDX8mLRjwV9j2BMuHMrPES0XCK2gWNhBqhWUMwthsPaAriafgs3HrKYBCzn1gMcfzjwBL
 NnNdT4UTt7pz4mBGQRp1vm9JwVKN+fuIG5HgQw4+cmWjohJGoPbp8VhnuQ0akWMRL2rAU5LReX7
 SMKlyCU1uLv825PU0ohH6gOuAfTBxkLpefO0lJoIPsqf++dZZaqtZ5UJDm9YT8VrLDLvTtUi2tW
 MJ2qANeDYXtEYJOdLew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyOSBTYWx0ZWRfXxuroJGPF3j/u
 nGMVJDK58rLnQGLgmYmgaj9kp4dDsQiUkL7td6MiMD9+sbPC2BZ/9iwStTzrAvrnosxTLEr1u82
 VDjgC2sRonkUGJlCzSKT+/sGF9tSsYM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160029

The QPIC SPI-NAND flash controller found on IPQ9650 is identical to the
one present on IPQ9574. Add the IPQ9650 compatible and use IPQ9574 as
the fallback.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
index 829da22537d4..071e5333721c 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,ipq5210-snand
               - qcom,ipq5332-snand
               - qcom,ipq5424-snand
+              - qcom,ipq9650-snand
           - const: qcom,ipq9574-snand
       - const: qcom,ipq9574-snand
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-ipq9650_spi_nand-f1a41eeb4749

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

