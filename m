Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77BE3C108F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740286; cv=none; b=K2JKokk9eHukUN54IYp9rLhAFAYzv8ABFju9xdk6nZnRlAXK5BG8mn/8ly1083Lo6MXObIE/RAIHjpP8J+uVRkRIjvrRPV0f8+D4R7FyZPcxXGhmoUmutq0tk9gz7q0XYU6PwTGtLvQjrGCwJtVoTpr9AiF2iOgl6kg5guzw3LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740286; c=relaxed/simple;
	bh=2OYBYuITn3psg6Z1HtkzObrYTcYJqG6jhXiaM9WxoEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P0I+jUYlOg91shN5Robvn9rRilsIxDxw6VvrDJ+8maayTJCfHuUfQfY3ueOv3/sGmrHhpE2iSolHIFmkmUgqW/o/TOKOs5qMPTAOtOxSzV0A9YJV/s81xkwV/JGWJ0RWSlIZJegIBiTf9xx8neVGETw1GT8vtJZjqqn7nsSRX5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOt/TWOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARptbYhB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOt/TWOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARptbYhB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH46n972527
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1G5/5gYVXEXCPKHHHcZdLaqGYg9k7UTUSZA
	0KKz4mo0=; b=VOt/TWOfyobZ56aTJLApPpTPwkJ5qjPBQRsCRDuCZDx7SgsXdc7
	/ke8ZTUPJ/xdv0cYF9Jhw3zrwbT1k3Nz+RlhI0wVG7TRDyWWMqtCCuohJw20+iCW
	z77kJtx0TYXtNpiahz3HX1LWu50czvXggxwla6eRkSEfmXJ74tI30hYg+BgQoIF/
	wvVluIQsUxmeKQBjsEax7iC/H3sutYNFhLM2n0IyLvDoVdmojYdLYhR47mEOmd+D
	j+Uq1FGvG78S9Mc2MtD4VQsShb09aoumshlWuh1ftP2Yc90d0wzCYugIuYUQ25G8
	tu+1Qukht53SuhoLRLSeXq7KmHKpiTwrIXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghkv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:31:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d827597fbso7591601cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740283; x=1788345083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1G5/5gYVXEXCPKHHHcZdLaqGYg9k7UTUSZA0KKz4mo0=;
        b=ARptbYhBiZU7B7PnEXPplm1poMqw3a7UlsPdDN6rmjEg1hagSEz30niXP2P1Wu1wpi
         mZTn9XldiHb0l4JTkRwHSrP8iVTmjUS9rsKe9+BMGmSoU0+uczF2R0GbT8xXRM1Li7aw
         Rorlil5mZW44jmdKyj7ZIpTziYrG8bCKi1R4oEJvJsz2+fZ3CSiBoB0l7BNf4DNr5GEd
         kkkpuiUxm4MNHUcQIgMmaQPYC1i5MQ6aYFahPRCXXb0zSeglxlhnEYlTB/O9/fVBhRIt
         SbCe+8uC/xn5UtN/eHwZTp2ipOxks+NsY+ICvkxpYqQVRju9rj0vf4QGLUh2RbsNkxXG
         9ZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740283; x=1788345083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1G5/5gYVXEXCPKHHHcZdLaqGYg9k7UTUSZA0KKz4mo0=;
        b=Hnj96qgQ5NoZ4XLpkigeTUvGEvfp9wTfZGVK2QpY+We61eDCGYT1OTeZZxK4IKHgKR
         eB8KEeikB036Ui5RctErduswekWKlE7bMV0otPfYM77CdTAI8jOqYveSsGgVMbGB6/ia
         xjYy8rKgtvshZGz1XTqon6v7qcQ+izvn1MI/mRj8idLdnIH+bNuJNAIwbUAUsIsGyKF9
         eTNhpTl9aL7iGHiyPB4115JLyDQJi1hV0Ca2mJjp/zjmbPu8pt7mxohJysJBSgI+atgT
         j03nb1dAgcIDcwISctymhTCs1shU7iyy0kDSnw4nE8MNQ6hSQYe+tRvyt3IMIEiQk1OY
         UR7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpaE58nRdHJNfn56fTE6I1vHFE3NPSrIsc8PQ2sA1rgIrZL8xlJoLF7JkaMmW011WWNhDTkiuF5nEDs@vger.kernel.org
X-Gm-Message-State: AFuF++nmQ5RIxBXj5ByQMsztVF5J5xS6t6ixzQMPGhKDoMq02vjwuDu1
	M+fyRSaNrQ3QvS93+ieHUz4Uvhz4gamViTPC0dQ9G//WLTYRze4JI4YoPVqE0yvejUBMZ9W27uO
	Mhr+NG1mkzKXktKw4Tr/7Yihwr74DLmwqj2v5chFS4xDaKRVM4bRRinYtit+1bprs
X-Gm-Gg: AR+sD12w7+aj5bIG9Q+P9Ey6L6wr14aOIJ9TDEUZT8Tr3L52yEbvg5GG08TvZWrcQn0
	hUzP1J399W2vYjOHad7PxBXuWdAk6pLBaybQyIz4TxpQjuFITCd1qr+9sidIN5kZR/Wgncrpw1R
	/MSy+sNnrm9jVIRsVRC6VkgyC37KunMh/4+0dEQY1GgElMP9AsEL1FKAOxcvJQhTj35Xxel8rzr
	zVKOmDaQaUBfedc4HHuLpfOPkXNwYugQTYkA6UsgOXyZMteLRRkRpWoFYZRZ3JvBC1lLC6cWifF
	om0K/CwKs/4RFYlP6uP4YsaFyZi4je0ZDWmUblObfTZ3ztLaxI53cXuC8VrU4VE6HQEXRvq5JtA
	vvFb5ZoidEMyyweI=
X-Received: by 2002:a05:622a:1194:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-52e423221cbmr49163941cf.24.1787740282712;
        Wed, 26 Aug 2026 03:31:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1194:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-52e423221cbmr49163321cf.24.1787740282195;
        Wed, 26 Aug 2026 03:31:22 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac46sm468967166b.29.2026.08.26.03.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:31:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: i2c: xlnx,xps-iic-2.00.a: Drop bouncing mocean-labs.com
Date: Wed, 26 Aug 2026 12:30:43 +0200
Message-ID: <20260826103042.147735-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=2OYBYuITn3psg6Z1HtkzObrYTcYJqG6jhXiaM9WxoEE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsBS70xtCJ33tyNoF8tp1JvgWm9eIpjfeILnp
 NS8EYq0S9aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7AUgAKCRDBN2bmhouD
 1+O5EACSTM2gnMIwQuOlA0YIdHhC5/Z+dk6m2aO1ApbctozEXP9FbIgmhVfdd2ekGf2+wYnzzI+
 D5lrYd3yf41lg7C+fAugiwx6ogmMgtt9niUXMaJq38OZgpmc/cW8bNK9Ppg3PTFRLa1JWauAOhT
 IZQaZDibVkaOyiGdUFI0cpwEm/n9BX2+5d37Z87JAkLa+OtUzWYEshw2NX86BRyP7wrcEuIOKCP
 WCQf9s14tzGaC2PVYcfpU5QqxHc9xVzJGISaGCX31fjMTDeKR9woimFPAVsT5dfLHJ3FJg5HTWk
 /Pp4rfRjDwtSfcVsOO1cPldW7PAayZZEqmzUp9mam/qMVnYzJ8H84bCNUSBCNJJZ8JRPcUficaQ
 QJpzUCvnFpehthymqfblKLwZjebNZhkyxBDr/uHMCuFgQi7i15hXZh0Z2HhZESgNz7+nhbgxai+
 YfRmCEwwVdomGTEh7KEKgawd3oNmiFoBY9KUDlXyBXDzQLkQ5zlt+F7Nl8lLfmFw5Sb6RS9EVQn
 RP1DkRnvv6IBP9r3abpaJJ/rcjpSKOqE69Ok+F+dDDb0fae8WQmmyYsFAZm59R+RkaEFZSmQa8u
 Iex/9Uy95SDFvxY7KgKbfqucJq9th1iov9jK/eDJVw/uZdi/My7BR2wuTWy7RBzAVBKt2/4hT8L OnC7XGeV7BisYpA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yxSatPn04bF8qlGIOEU4ptaa07k6wbbo
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ec07b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17 a=ByJN7JjbAAAA:8
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=3T8SOkedFoCXeTbM18YA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=ruIbMKh5GUt7Tw4v482g:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX1cfbW/v7Iaxv
 QxZeM1s7bccMU1QoU4SFIhSvXMCxKSv5+kdGKCi8MoWXMz2cnKalXL+kFdsGs3cvqV201yJTRs7
 HQdlFuFSKmwbs2LG1pSS/ay4dUBeKiA=
X-Proofpoint-ORIG-GUID: yxSatPn04bF8qlGIOEU4ptaa07k6wbbo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX4PamvjqIsyma
 hb9Ir4mE/o+M+o9ejQQ14+aR0k5rcZv6VAj+n+lmVH4Afp/4cgQUZCuakiM8F1Do+GYOBd4B99w
 E2uyWlV81wxlQ5u0clAOIhorF4/DC+Jylhq46HyMI6Ch2L15Dy92bLZ+JpjvQXzCjkyikJZddBk
 s3FHtBSF4F6asSHOYHLlLLeOETElSPMIzvf1OoEywf3SGlQMN/k3A2Xh7xFC+FbsY4Ocxe/qXen
 Mg2Iy2Jy7OrwpO7C4wcVvrmoPsAZAOUcxXbySPdX7urTQsKmEeqZj3kSrqCUQ0lUcbxCl/WChxR
 FozQV+cLZYtF3qrN6T6FBK+C0dJOf4zbybAdNtzXpBgDQi7LE4j4yI0jXYlVzeZcv7rOTl8xDPt
 mT8HxQuiTxdmju4H5FdRZVLVE1dcZccfBO3XPyeTSR8Gpjv/EhhQP+2CmrM5arF2xrzn8w4eyHV
 AlQ1mAUu6Ion0bjOv0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260087

Address info@mocean-labs.com bounces permanently (reason: 550 Host
unknown), so switch the maintainer to Michal Simek.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index edd561d9733a..57caebe7af35 100644
--- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx IIC controller
 
 maintainers:
-  - info@mocean-labs.com
+  - Michal Simek <michal.simek@amd.com>
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
-- 
2.53.0

