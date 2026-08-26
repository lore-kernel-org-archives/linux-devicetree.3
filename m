Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46254311C1B
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787728004; cv=none; b=Zx5d6he4Lpgs8pPzDMRbrXPGBtxgagxpRxv+p+NU2MRPfN5gxkOLXvrg4pD+E+RVO5jThkN12A1QQujFQ+4sC9gDQjeHYsvsRWBnTflBgIQ6jCLzCYAilizZDTbgndMztkmLTh2KKuXO/CvjQ56271GCLu+5nqz248MetthebIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787728004; c=relaxed/simple;
	bh=dKa0bkhQNHGF3ECM0RaphHFXMQfLxiwcJfDby9lcfX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aRqf80/6hijy7OQdObyL6Jm0ZI+nE+P5GxkTQ8oFFabXviIpOzHnNckXFNb/gKi53jOFf4NrhakRmydLjDaS4aR9t3T6azjI8CFKzkmQ6Rf08ny+agKDbH3okPpl6BpUh6WgkyTV5larE/CuCSWP1NN3aNsnoVzJf93vfwL5FG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0kq42e3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vrk6lEBk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0kq42e3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vrk6lEBk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RcQd3794497
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iZ9pKopk4L7oAcIHq+UKI461gaq/BVhdXcIs0vKk0Q=; b=O0kq42e33eFECsEJ
	jE0ydvtG+Th2MWSkDcPqMU67VOc0M6OR8GqKh1Um9fAhVy1dSx78NVIrthun9MQw
	GcHGaaKWO9zUNBV+c3IftoVPQrayiCn71KX6rcas5otLhvzmtsnoQcPVHmEME1cE
	G5RrSa0tBgMHAWL3/TN1RBRjwdcHJaJbJ9r4LH2ZyGeaYLYu39COgQwXdSTrlzOl
	2Q6S91X6ONwaqS+Fpwj7MPQrBHxfe5EXRqEnKlehfe0vQebmqFQr5eN3WexBYW74
	a+v4PoVuCWbCqUVhLcWeRbQL+wjMSHFCghF6HB6jHRERvH7OCkHf0N19LB4qp2mC
	h8PLUQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx8fn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cc915d1d9so7434456d6.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727994; x=1788332794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iZ9pKopk4L7oAcIHq+UKI461gaq/BVhdXcIs0vKk0Q=;
        b=Vrk6lEBkj4tT3Gegk6kkJDrgvHb7R6JyHbSIlYE64Bahypd6iHsF2w9eioWyWTMymg
         DSstuT5m4W+UYCPwOIu+qi8B86c+4jRtnpk02jae0ZVVkz8pPYfJ6073pVZoE7epyX05
         t+O+oIqxp2ak8pIZtiZLo3XEW+EPARGbkAUNS35Abfq376rxFBnSdjVK7R7sNPM9nN5f
         1E668ovC9LXtCNhW+U0yMJlEMGjINtWkt2+2MyB1aV6dD/yHOnqAd9SpEvIMWpVpkglO
         QaV7nmCzOf4Q8vj8E6I/Jl+CJlryUxa7mQpQwZF1mdc0y2NLnUTOWKnAbtAlX7CEoLwn
         fBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727994; x=1788332794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iZ9pKopk4L7oAcIHq+UKI461gaq/BVhdXcIs0vKk0Q=;
        b=R2hCY3lWfaDikq+IlM5COheQ0fSWD6RGuFv/h6rV4KEl5CdqwkTqYjAaYjYYop6kKN
         t0B2DydLX4RRttNsyKq3S1Ge14hMcGw4JtacpRp98uGCuBHf5QZCjdj2YsATW1i7NZux
         +2sYAh8/SplBT2sLiHF7/3Ni0VB6IYcb3SBDGNU39LhM7xEZhy98+dHfXtcUfovB79c2
         kjHPDCvz/kEmZSaEwcK4MvQi1HI5avPUnAR5C1peIt59MowaBaUTg4MCodFPRnRHrXSV
         pH2BrkJ/K885o9j6Srvto97hLzQDP4m/JCr6F/1WOoGASjaIsJP/JpmHywihihBXt/bE
         eTkQ==
X-Gm-Message-State: AFuF++lTZ5CGrvynHtPjppKwatG8l3SbLCsRSjT05CqHeNQRF//f04kE
	GA8Vmd3luUaw1Sb0vUMwfU5nJGk109dbCtVlJHUyON1bN9sh+b4DlU0aeM6Bsox2Tghz/Cduaro
	JU8pnvzjolT/1Ju4RL61ssktAG97irZzFt8B3kEiGkAt1WFX42CnCI9jnb0y3JdGX
X-Gm-Gg: AR+sD11SOw0f9G1GBPIMMOUsrlavnRBJls56tdyl1M359N6NAi7O1eZpwCKEeTHUSpa
	GzN2kxkfpUjyr8bAU/hTUck1qXjpwwut2IxsEMvQqsc78QQ0HWIv1qb87lx3ElCTLyjX6Q5/uB8
	/uoZ7TTldFzSI+ri67rnfCOTwitFDZ9wN6rva68eVBBmL+zpd7Gk26XufMkz4Wri/dJ3xZtoimY
	Hj6xOgDMlMfkbSbNtaI811GKM+eqTBBZX8zS9mTDF+sDr20I/Wi1/SRkhFQmMa0pXDqUrSQhljR
	P3Apet+NZKezomFdwNf7nVXMLPjJnFI7uSk3S3YQFJ00Gcq3fwWZjmhZXePCFYnQRAYEjIZMULI
	VMKnH1y5XZ31CB2IC31Be/U8=
X-Received: by 2002:a05:622a:1f16:b0:51c:ace:de6a with SMTP id d75a77b69052e-52e4230e4b2mr46715381cf.18.1787727994140;
        Wed, 26 Aug 2026 00:06:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1f16:b0:51c:ace:de6a with SMTP id d75a77b69052e-52e4230e4b2mr46714881cf.18.1787727993491;
        Wed, 26 Aug 2026 00:06:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:06:03 +0200
Subject: [PATCH v4 10/10] MAINTAINERS: dt-bindings: Include dt-check-style
 in DT binding entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v4-10-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dKa0bkhQNHGF3ECM0RaphHFXMQfLxiwcJfDby9lcfX4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBhjTAFGa+82WPqytj3/s9gJnvpLpQff87Ed
 b+gLJ7NvJKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QYQAKCRDBN2bmhouD
 16G/EACTfW7rzaruhsV6mJNWw7rp3sm0yF1+ODrx0N2HEnahV5ghhLZ/FhGJ/7GKmSoHiqBu+jn
 X1VZJlnbgO8NH8qlYVXC+4B7rJ0n1U7KVoioPM7eR1fsbbCv3pfHfa9YE820SVzc2w6JS1oX2QU
 XnSwAU+78IqMkLNl7HFOdFm4h9mF73ZzhjqpQkgspe/DMfDiTNJc1oX8D5gPZ+dWJh2P9gHuhbV
 IguilxKXS17eSO81vWqGVCOINGw4Uo9H1u34YTeLriIVM0yknqL2ItORCP+v3Vccs7sts+/E6zn
 2npydVeNPc+WS07BR8N17nfBjQDA012krDfQ2oEGedHh1adWWPutPzRwht7wfMoo7DrSW5SKOoj
 ll7Lt9gNP7S1X/3PeaBZbxCG/JN+9XlEvRjy/ru9Vh9h75bKU/UcgilJ23Dzl3Bh4RQTgdmYhj8
 zOC2FkN6gW++0n4vOr8U/+OZS+/4jVQAgRsjbSMbON3sZbNx2UtH67vsnxJsc0Oogqonh4v0vX1
 dOkV/JItC29XSWskpvJepPSiZG67/BOv0bumgiKhyh/TgDnsbv3fP9nozCcdKdFMih8l2TqnLmj
 CeMjnMMCONFj643iqIxIxCJcro4EE85NWbJ3n+Jz6ZSzfT12Ur1+52/gSNNAoNvX8qs4P0YhsVD
 qvazow20QKsVz2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8e907b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hdCJvu6vi-O6ykQZt0QA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 17CNP7dJMIRDXG04w84pSMxpERbKXjiF
X-Proofpoint-ORIG-GUID: 17CNP7dJMIRDXG04w84pSMxpERbKXjiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX8dcFro6j4CjG
 bMmd5+PWejKge5Vq+cNrXYuJkeqqCY47THtkQGdu2XoeC4vi2d9jmcPBu/sDkxrc5dLLZjpXHC1
 bLdE09N9ELobRPOOW0Cos3kdAu5unsFUbozr6cOfOCJWyxeEM2k9TBZ/mYtFWU9H6iUsrhkP3Da
 2WI6uGJm4933EtB4IvbpeUkbEzDOyZG+6wMuQxpZflXCVSkQC2jUvmUn0WFQgMSSic26H4xdlLO
 FcfFuzo2fgIGFMFd6MfDw34RM9doY5L/nK0fAKHfWdI4c4+vN3Y4XIZdbjaC0UMyHr8MJFEfUqO
 w/TQWI8JCTKiUrGcXaysxtx9oDY/UffSGWZkOqhg34wiCP5nJ3Z2J8Klb/JuKhQ4qE7Bq+Za4k+
 GaD5xQZfCdU/u1lMxXWs5dG2AniotoEq7Jpfe7bJKzgWRwOW5fLgMOME5IEVS8KIItfrByRO/Su
 7254Ic6iRFzo13Yd0VA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfXz2seQtcTpqwC
 0txTRkERbg3o6g+9fJQVIn2/2WcklvyJPRDPZL7r1ztNbD0MEsDmi/KkpKD1RpsrhXpaWEhpwMK
 YZNxwVtwHXVTa/CQCNC+NgVKjYYwuh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260058

The dt-check-style tool is in interest of Devicetree bindings
maintainers, not only the driver OF-core (where it is covered through
"F: scripts/dtc/"), because it covers the DTS and the bindings.  Add it
to the DT bindings maintainers entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe10d29b7657..59ec34fc9682 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20488,6 +20488,8 @@ F:	Documentation/devicetree/
 F:	Documentation/process/maintainer-devicetree.rst
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
+F:	scripts/dtc/dt-check-style
+F:	scripts/dtc/dt-style-selftest/
 
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>

-- 
2.53.0

