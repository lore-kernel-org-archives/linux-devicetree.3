Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7254C3D75BC
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449054; cv=none; b=rk3s0sqxrNwsX2Ln5ZvUGRLNAhNTlmEOTeTUN+4Tum4d67BWuZYmlieDXRRoKuoc5V6rzxKuGTPJ/ThCwDiW1Rcb3438SO1kqrR6ptIldCOiDfYqQRd2n81hDxBtKSB6EX1RDvEm86yl1LinEzQBw5hrIunVaBJToNIYtWeT1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449054; c=relaxed/simple;
	bh=8XRz2m7ODag9sGecW0L756bQlx33AeahS9N5ej7iIXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wh7LAQE/VXIj87YEuJBAQssCP5Sk5thT9LC8nKpaDdRUuTB/BRQqSM1Pw/PtCYmcrU8q2ncZ1oK8YSwoZlQ+iXf9/qfIfVQBd98Z5D3cbiERoeEHF7M3ky49z/j7zo8BjYWIRr2T1+sKoJHz0MMPbKrVKTq2RcQGM8xremDIFIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZmwFFOJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VinwhakY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZmwFFOJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VinwhakY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L33S2068017
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 08:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qvQ92t2jkdC6exdh59r8e9
	i0QzBBAbnteMfEjRvpDbw=; b=oZmwFFOJM1c+fms2e2GOgneru1/GrgG2FTBbzV
	laqmu/MLc8pqzfWBEuQ3hEKNV1m32RvNV6mGLcLs5Mnaz8kJdKr9S2Liz5IVyg1Z
	uvqRmCwiI6Uud0tQGgQW7BxCw3qX2PNYgTU4VJcJDNIL7SQYJHP+z95bxusAYBsw
	9VB7pj7BSZ9/cJ8uOcYa6M/G74WC6jCQDyYLJ8xe6jTP44G4hOMSFdfZhBzc2Prd
	WDyR/9sHxA2SMoSwNFto34nAwPo1Eb8zPkWp4wsfJ3BqHWQ74s/z2T7bJyhKRASq
	AgeWOKpT4YzWRIftk9/5gIO0NBzRyOTwlSfyyBKZThm3sndA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hyp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:44:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-152d1363a29so9196078c88.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791449051; x=1792053851; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qvQ92t2jkdC6exdh59r8e9i0QzBBAbnteMfEjRvpDbw=;
        b=VinwhakYPXCgGhruwmQv2zOCoG9xPKUO1X1u6Y2fOmk8eTdaI6lbZoRYUensprXZ+K
         lXFqN+6lXzv6Acn4MhGLssNGI5sDvYMqVBm3x5ZJDNggFNy1q79M60JE5P0MZnmHDi8+
         SNAQiuY71q+hFRV76hxzlH8qFDGOjlh1kSZ6eZcAjM4EYbEPH4wSnpllOYJPUFU8uYkO
         AbjXJxnndeakSkbWPCQEgrCQI8w6bqFaqJZw1I09K0OJHqXT4N2niAOs1MIun976Hg9x
         830YCnJ+gc91EOwL9M2kWT8grNvfFLd5tcRcYA2yXZ3nWwDxVVVFiV3/1H5eg+hPqq8r
         5czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449051; x=1792053851;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qvQ92t2jkdC6exdh59r8e9i0QzBBAbnteMfEjRvpDbw=;
        b=ZLGm0EM2i4EPxg6qRM5fUzGRj/hF+dqzhgiZsUnoD9N3aEXmT8V8enVwJ6eaPXTPLh
         PDY2mKLgqsDGZVTYgSaun8zMFAd6KBR9XMAwCiodSL5LkLzZbQdGcxOUU4nvbTIgXnOn
         CMexnP6HHHfBxgso4KWQpAQXDsOZ3IKlfLaERMWFS13xHD3lQ8cUxlGLEoDt/MwpsciG
         KBYzBI4B1ZuEAy7papFEHPuoKE0pbW90hcwjYtI2Zn/6SNpIzbWx9w3MWw+hLnBmVNpV
         k26pH2rO1OqJIpc4aSbmk3cbgLEOvQHenvWBpZ4tWDX61ZusyPHwSYwPWTcN+RJKBUMt
         UVvw==
X-Forwarded-Encrypted: i=1; AKwUvBzD0auTGyS2Hn7Cm86tkC+c9GL74qlwH8/sSx32L1k2Q8ItGYuop9JeGLZCE5+p8bUA5hE+g2TklC5V@vger.kernel.org
X-Gm-Message-State: AFuF++nmplCcx5trBu+aSz3Rlyd8cStfCR8e0zkVTl1zc6qEXXOZUmdb
	w1gs37Tz4jMR0Cy80292eP6RMu3Pk/iHt5DYTFXhzyBPwCQrOSNrf1mbZbQzsGSMBMLmVVqV1/f
	xoTlhpvQkMSp+n32HIJNxfiK+9Y74EkcBJ3+aIRJnRjr8ozM6feWcFNNXi1/L9Ee6D1JHyd96
X-Gm-Gg: AYBFou2Sm37AoCVaYZ/eUpUCgxNrvT0pkI8FCiTkjZTYC8maEsoeOyvoMAlOxZ2v13f
	IFMRuWoggbeuGwz6uZGO/fBYEQBHc3q9sMNu3wbg3mdGB5Va4EyS1ibw86GuWVWZr8EKj1hdIjt
	FfIbptWSs38pPzLrjLEIzXIPBNqrBmnEH560VfzIFqqx5bT9V3gp/f1/R7fW//leqMTsTcP9wF0
	vdn77IoJ9Bcw4Fb+mZ8LOeRy3BGg5+ufNOYSh2l42fQ2vddHHarE6EDSkI+SS+OV7y+zCaAVTXA
	jWfbDRw2J3QGaqjTK5uPR/5KSeEqyDPaP2G6djK8puWT6rtnUdxBL6q1sKGM/464FwmG/UpPa1q
	Ibi0Zy1E/lv/NEoP8PJxfDwudlsW6TX/wN/VhST8zCMbyz8qvxwq+Fuqh2VNlHQ1v0bt0KHjAvH
	ANphfzscgJdHFXcnLE4dewQ3HrXBWGOw==
X-Received: by 2002:a05:701b:454a:20b0:145:f4:13ff with SMTP id a92af1059eb24-16209f0a817mr5723177c88.43.1791449051317;
        Thu, 08 Oct 2026 01:44:11 -0700 (PDT)
X-Received: by 2002:a05:701b:454a:20b0:145:f4:13ff with SMTP id a92af1059eb24-16209f0a817mr5723153c88.43.1791449050659;
        Thu, 08 Oct 2026 01:44:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm5216348eec.30.2026.10.08.01.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:44:10 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:14:00 +0530
Subject: [PATCH] dt-bindings: pwm: add IPQ5210 binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-pwm-v1-1-0b8776398632@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM9Xx2oC/zXMQQ6DIBCF4auQWTsJWNOqVzEuBMY6C1CBtibGu
 0tqXP4vL98OkQJThFbsEOjLkWefQxUCzDT4NyHb3FDK8qmkfOHyc2is1bV+qErZBvJzCTTy9le
 6/upA6ydj6RpBD5HQzM5xaoWnLeENQn8cJ9Yz5JCGAAAA
X-Change-ID: 20261007-pwm-cddb8b3141d9
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac757dc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YhYfuao1U0lJTJAE8lkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNCBTYWx0ZWRfX0JVJ+GWGtA5j
 P8fWf54gAg8ua9hHgRW7z340NRJXw8Cfwb64GYmqFBFf7EO+bj8BwXwQYyRbNOddpDfWKOgAW4X
 Pm1o1AbUNjZ5NatwQc3m8aifpznOh5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNCBTYWx0ZWRfX0tGRvgqhsM2C
 m0J6uaQlJ07PgyT/PNrRarcTiRSKQBeF1BqrRtSG6g8KcBv2HB646hinlH+P0VcX8tVefmUTB23
 CeZIhwD3+can1tXUHH+nejEtQP8WhNBbxzmdYrSnpPE84KDJ4Aen+7H0bh3hl5p9Z/gQZEIZViQ
 bbumFrQzPqC718id33NXEWyJsPqeO5dH7H+kl/O042u/1gsGSN7RgYvHtI/TBFLehn4pEsJCSiH
 tlHoO1H8XBVlTYe+NxJZhGB1H/xCi9IbSw6uNnY7EKPWiZ4gy3QhLPSA9WfCNVBDiuGaIU22T/L
 qP8U/gxMZ2tJCQKJYgxHK4jFED5OqVQbTf3eLCrnPCEQRVwKGX750steU90170eME9aEUYUk0I4
 uSyql9ZwdoQnzlGIoUIgJ1Xw/+C8ySEEr/Edeu+f/CVtUqec6hftGfzuWTy4/xsPjclOncV4xYl
 fNIFrDACt7BGKCmY82w==
X-Proofpoint-ORIG-GUID: 9jVzUKfLPbGwDDUpyVnZwtrbWyWLrRHK
X-Proofpoint-GUID: 9jVzUKfLPbGwDDUpyVnZwtrbWyWLrRHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080034

Add DT binding for the PWM block in Qualcomm IPQ5210 SoC with
qcom,ipq6018-pwm as the fallback.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml b/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml
index f9f1f652e752..c6b9004dd30e 100644
--- a/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-pwm
+              - qcom,ipq5210-pwm
               - qcom,ipq5332-pwm
               - qcom,ipq9574-pwm
           - const: qcom,ipq6018-pwm

---
base-commit: cf4a8255a424f691f95dfa378e88336f33aa8ae4
change-id: 20261007-pwm-cddb8b3141d9

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

