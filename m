Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480346A5F4
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247894; cv=none; b=Ery0BAZWq0bxJKsI56T1beUlM1Sl4zQ1NF3fKYiUlg0NfgSxP78fhESsNFKZ9DArxOkYBqX5qXXtXSQgbLl7msPIiy/N7U7ftOTHG6uFM1CbD/eb6qVvn2Z26O7e29FnAXzD9Y4jKO1peiuxftoElMrXEQVtlbIp+0AQ4rMD3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247894; c=relaxed/simple;
	bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JcBmeVyCjVCy4I7fv/M8EX6LdJDkVER6pLY8Cp6igm6+zwRBv4u3Tw9AoKgOE1uZmzf7Y/r2mlVIh51K/Gr+PSNYOe5zL7j2d0BqZdQVu4Du0mT0XAYjM1lmV+z+zGCAeBxg079JGFPGgsw0PmI0wo78hdsjQorALZcQ2Ipclco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9fEybIt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y553jR/l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9fEybIt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y553jR/l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179PJr2321959
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=; b=C9fEybItt1aLSL7D
	gPa5E5Rwn++JCN5nyo0Bt2u9tJANQp8969+knanaURYIPcKnx3aCxPC0MhxAqQoK
	yyHOt97UtL6ugaLxBTMl0CyBeUnjapsFhJ3CG3cA8oGgpJcDsFa2A2ykgGs3Z0KO
	tWfUNOjKvXn5mjK60weB4qtshe1XgS77OetIjxTUhtq/SKlDZvP8wRnOUJNY9mlm
	vhF/i4LpOtCAcayMHG8ey8BesqXtfqzqbEV1BhEwI/gn36PyTSD+PQq3ywS8CO9P
	7XnBGw/m/aXSzMC07zgrKNfC/k3Y3rULnVt1BzXF+Ctb7LQb/99oV95QALa5er3D
	5ZgTPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchapcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:31:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93771aa0379so1194627985a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247891; x=1788852691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=Y553jR/l7Bphc53psUYJlpgAdADS7NerdtfFO+X5AH3W0eglRknloWFkm3eHjtEHVl
         aOacBBYhb19u7bb/5gmGNVKh0gx8NG6lvhtpNLcrV1yAK7F/XMylGjq9xkcFvnpeW5Hz
         gV/391mrwvTDYHlTuq+Y81tUIPkAKL4608+33+Rkurj/MqlaABNz9lBDtTA6rQZ5YIkN
         V3XxWOqDCjL4DvJPGU1dNPgJWxwqC1mPc2dgn4mua8Iy9Mzg0ZNwLCYocOEq2kv5UjfN
         B0uGlhGg1scrMskvaHqmCO6u8SqaU2PW/wxuf2zvAPDpRwis2vmzy9n6J9YD4ALkSBvF
         ILOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247891; x=1788852691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=fJ0hRJgy8WBHxv5joQayUpOYgPaWJNesf/9mFUm2F9yBwf6f1p2lqMtG587mgs1kdk
         VrNXvM/5sd89cH3H05jJXmbDyk9E0Ha7/MhWZI+NYymdDEYJ+VEzBBzd21WM7Ehe+nHH
         ZxoJUQrOsCe6caYI+O75kOpfPi4CC53aTtDJtGtoTnO/ry/7nFR5ynH4L6AXSi5F8ydN
         VdlG2H0IJbTpyTEL2/AODrFXVSlDXTNebVpYbCTBhqxwBF+9jFnLzGXDOy4+Kl9AXc81
         256MIMZBLwzy1UxHaySrLW6h3WvpdVbTtGsM05GbC+zizU66TfBrZ9VBU7LsO1kM6Mak
         7JOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtSlFwTd5u9y/95CPZkXpUYFCg6+l0/OiWAKRpkWu2ob7cQX+fPaAVc/8FGlEKtMgD5Kp33e8KjdXb@vger.kernel.org
X-Gm-Message-State: AFuF++nYd3PsRW41lpb/1RM9dwFwUS/wZpqSaKMJNNxEp58bpWlow8xA
	UDn7SX55jTZ7iJ/7b1QlLzrENyd+mGWPo4yHeegtsmMK2WxBwhB/YMNmdRgN4Y7WhT60FjciFta
	SWl3u4JKFGXMV9IHLm3CCTEzqKLXzB6xA9zoWi0RFx0KAL5yDQ5XpukZ1+hjAAebu
X-Gm-Gg: AR+sD127p936A/+vzo4MVTjS2SaMs57C3aHaUDGtmuQBBZzkG1SAiCWymM65N0ick9Z
	pOcc5UjrNVnzL6eDvQwv0TG/bqzCpvE9A7gqx7f9PX0cKXCYSBeVqBnT2upwfUXkkg984K8/BC4
	BUP46VkApra5Zsof+VZgsccS98cddr1HP+dAkBtVutr887y4Yhy8nDuRIfRiCNhh3YV8XR1Wmn1
	oC3l0xsqVxGDq00WxgtFYoY2fc5s5KevJLdrZAvldj3b59PZYZBtRbILxLHugx9pBV0bhYadOVQ
	tpP7w+l6oMhKDZ3H9vfYN8UKf0cBdSIGzsqZSK6hm4wS0DTnnJg7oZTp1V9jokY9gUDfXfFyHZP
	WYmPJhD4M1+fl1UgKdClrvFcgkwd7d+DUfuE1BX7qv38gih/RXjnKC7QA1x4abWv11L4d
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr689366085a.8.1788247890741;
        Tue, 01 Sep 2026 00:31:30 -0700 (PDT)
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr689361685a.8.1788247890180;
        Tue, 01 Sep 2026 00:31:30 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm946766785a.40.2026.09.01.00.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:31:29 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:31:04 +0800
Subject: [PATCH RESEND v5 1/4] dt-bindings: media: i2c: og0ve1b: Add
 OmniVision OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v5-1-b0400a9bac01@oss.qualcomm.com>
References: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788247879; l=2177;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
 b=vCml7d1QeXb6g7Kayy7R89q1qf9zYTdDvGknRrpcZLeOWfjVdbZAPUtWr+XH3uAfb7WG+ZXnU
 EOi3zT1tkCyBHVbizUO85dmCEt1vAyIKGoO/NuC4bZgC5x3wGus+UGR
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: xMvvkPuL7uHwxhPH4g3g13E0I2gUS9Eu
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a967f53 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=M65GHGH_L51Dv4RaLaoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xMvvkPuL7uHwxhPH4g3g13E0I2gUS9Eu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX/KPCs0S7N6Xw
 7BIVfjq4/FkDojrbA+wtHQQXzFQojoQbWaomXhonv2kdukC3dBu1WS0O8jkwalvWFLy1g1lJELd
 Q2XkiptJ1xU3+NEiXrT0XgPEUz/CGHE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX+8yMTt8bQ+FI
 YFCL+5O4UAN6ucu6zK7aEgspiWFsFvfKQqKT0iodI+JtfXT/73Ia3L5uOpgU+5iFpKUgjTQgLxp
 Zu1eB1x1+KdDKa74rxIsdB58YGobPZLw2QLIF84wtLb/xp3ENCBWZA6wI1spMfKhF1HBH/afknO
 9luFKTHWudfeM5dEPJyBaOTnfOlIp2ufOCscpoHEMnbjAm2QX9BrUp5/YwVD1j/b2VDa7QOXYTx
 hO8ROYB8QfpoMgh1LKBcyN8bsuTicQWjvlSOZRvcxFE7CIURb/5iv+xOWug5sYO5Mnc58GTbcwB
 ZgEuN7YpfTWTtZD4Vj9NvqAC2lbQLQo1/UaUkistPtEZU6p5n4XKRf6z2OWKR17FISv25hVymtO
 m3Rb33I3q7FjTzIQh7WKGKZV0x52H9HAJ185bn3dLihbwp1wVUUqyKrx1BDHGMNwlLmkGGYMGiO
 RoUN7KnfHtWNQMaWr/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the already supported OG0VE1B. It shares the same SCCB control
interface, power supplies and MIPI D-PHY description, but differs in
its chip ID, register programming and output format.

Generalise the binding title and description to cover both sensors.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/ovti,og0ve1b.yaml       | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
index bd2f1ae23e6547032361924a6953000bab1129df..b6fa9645c7c6cb3fa907478684d02b01d916fea1 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
@@ -4,14 +4,13 @@
 $id: http://devicetree.org/schemas/media/i2c/ovti,og0ve1b.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: OmniVision OG0VE1B Image Sensor
+title: OmniVision OG0VA1B and OG0VE1B Image Sensors
 
 description:
-  OmniVision OG0VE1B image sensor is a low power consuming monochrome
-  image sensor. The sensor is controlled over a serial camera control
-  bus protocol (SCCB), the widest supported image size is 640x480 at
-  120 frames per second rate, data output format is 8/10-bit RAW
-  transferred over one-lane MIPI D-PHY at up to 800 Mbps.
+  OmniVision OG0VA1B and OG0VE1B are low power consuming monochrome image
+  sensors. The sensors are controlled over a serial camera control bus
+  protocol (SCCB), the widest supported image size is 640x480, data output
+  format is 8/10-bit RAW transferred over one-lane MIPI D-PHY.
 
 maintainers:
   - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
@@ -21,7 +20,9 @@ allOf:
 
 properties:
   compatible:
-    const: ovti,og0ve1b
+    enum:
+      - ovti,og0va1b
+      - ovti,og0ve1b
 
   reg:
     maxItems: 1

-- 
2.34.1

