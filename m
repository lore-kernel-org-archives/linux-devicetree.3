Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B493ADB8D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080342; cv=none; b=nxW9IyBVhj1DhhZRK+4dzkoBTPU3cPuFv6C3uSZ7r4AjUaynV0x2vJ6ZMA3YueXJ90o+wjRO5WzLT+tHRUYtPqqQbI73/ekp4GvE1u2JW75NkpKiuXQ1ZCim2VgIJjyZiDGTkmYTPRx7XOE0cec4Ennv94/8FLOnLh2NAfB0ivM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080342; c=relaxed/simple;
	bh=ZMZ0haLnYHGr9lz2l/xLLeBW3Xp7jlOSPcKxb6XrxfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UhZvsvHzFUVv/s5bO9iAnPU1Bw7HUbZ3cSQ4SNYXD/49MhToKK2zGFWYcZjS4+g87nSnydalN/cRmwH5OUP7QNIHbFOc/3b/4VyzM1CGqhSjlp3SGviNQRT1/IGDkcUizuwY47/v74vaE+DWY5Ktii/3TlX+CmoKP8fExFXsgYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cFcIreQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqvqFGXy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cFcIreQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqvqFGXy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iCLq531347
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NSAT2gPPzQ2leMvOvufErSPbINc5MoKAW/mk4EovYA=; b=cFcIreQTSpc15f9r
	Fh1rWdYgxQO2o+PloPdWhJWVugh6IMzLTOqzRSpOYrzRyuvPEvJhqbcYqQvH10eJ
	wIA8YszVjKD7c+5hrkz6uMtXOJIb8b0cC/AWsHNZrxYrR2XSXhWFb5rEVEL7knO8
	kGGchkimKyBRR1yjtNI2OOGNwdXbdZRV6vkIbQfpIZ/iaOSK0y88s9bS4aUZYqvR
	dgtgcZ/UPFtSp8On9atM1p+iy8rSb/lYR5M/SUts6g10SejZYFID6qLmRinSV5Kq
	Wp8bQnuLsU/5Z0cGlXLndj4fu+PV3wcBVi6nGsdt0hRkU8ybhaHfM2ndl5dyxNnQ
	Hf9xOA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2hgab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:32:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccd77414afso87243206d6.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080339; x=1781685139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NSAT2gPPzQ2leMvOvufErSPbINc5MoKAW/mk4EovYA=;
        b=jqvqFGXyZaD89yTaeSeQlA9wtXON9loqzPj42A5zwm2vAXBD5hqZ/i9GdTOWHpHsXv
         IPMO73iH6+bwDPeRH+YaWpK0OZKfj7HY/bp42tbQC0XZOUlXU5sVEKooaj+KRg2WRveJ
         TnxaJ1h3JwZ2EtQiuVGY6H13EsXkXNfGbiJp7vkuJyM5tkkuuKHZTNYW+e933ABxk34S
         GbP/HfALxdmOGv7EtDVwf/zLGt/WS7iDYYGGt1CP9U+Fb49FjSOBE5evER1Z7uZgjDje
         5Fs8X8gS3KJ5r6vrdVi6IVyVL8/PRqgFAWny9GOdhSivvcPxmaDBFy+7EDj/puOPF8/0
         t33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080339; x=1781685139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NSAT2gPPzQ2leMvOvufErSPbINc5MoKAW/mk4EovYA=;
        b=P2CJZ3WMt60+UzQAg7yqDQOG1+eg86hhyP0LwFvnKfVyRJdIWfcK+l4f7BVjkEGECi
         At3BE4+B2DfleszQxiLPmecIhUyyFNR5nuwE8KZWYrDq0TSMhbFpOnQb7KNWda/BuVIX
         2XQF7NVKJazgxfHD0hQQOquGfG7ZxrQahIf6f7EifEGP0IDQKmdGK4SYG45pD6BvN47p
         cJdyFMufcrGb4JeqLDcZzoziZhjK8Y3SyTE/2cVpkQ2pNaNiXR0Gwzf3HQWXBUX7QGuN
         70z8r0fxMvOx4bS8n+LfsUtINATtRmIaYfIVt/pbbJwx0COL7EWBYzpnZshn4J8t4H9w
         WIAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+m0dERbj01mXyVFuHHZTi+cLzJ2RueUBHM7JPBNSFoNUJF5nrWGeN/mkT3vceTVrW9hcfwRZoSpP6b@vger.kernel.org
X-Gm-Message-State: AOJu0YxFVkLO+RCc4DaAb7nRUfW5ZFhC9EHUCVay0IYXCcmUJajdApmj
	9HLibfPCQ7gFbOwGEWq/oThluRC9tkU0rfggGlnf7r60p7tNqJbgjjfGqEGCJtCXCvXP6P6icBo
	hyLdF4tdqdAWGrYdgORnW0B+nduclcq6nym83S3re+iM2Mexea/3waCI1jJo3Qi7WxyWO/8t5MY
	Y=
X-Gm-Gg: Acq92OGNWb67ysTT0rHE2Dn1uhHxKODWKevkVJtObh2Ln+ONZb+QaPbqRXUGLwaVhRl
	cxS3+HWBDztJuW6vsFc66ANRLjc5SItQjPAc18rSnFy9Js1Asir5DXGD4KiQwhOYmmOR2kGc43x
	Z+N8AUGtF5FSplGHOp7udPMZ/nswapM/M789v43Hb3kOPEUcfzw6mYLr8j2mBqO1A5XU4sdLvVa
	sr16Kt3pV72Y/EFW8LJynwEILBPKx7kbVC/YaFfA8KaGXzR4JnmL+5dyvMz0N6r7Osoh+t80pI3
	urr37lE/U6wmDBv38QeDDGkvO37Cn+oZOlpx8gdVqOUFwrMHXQFR1XSEjl7AzGtLnyDLLeLLUjm
	nmoHpEBribGp51jClauxaiggyv8+QZoLyg4usE6Yktsu1XyJ+TcAY6dq+9IfcHNBkugHz0ZgyMA
	UJZkSMhOYN4UWmpUT4EkSJB0t8ySmkwpQ8PykoQBwcRm9OUrds+U9knagdvI4SgGpcmbP1wDIOo
	q81YAKZ1sFL
X-Received: by 2002:a05:622a:2d4:b0:517:e192:f896 with SMTP id d75a77b69052e-517e192f9d3mr23136581cf.25.1781080338733;
        Wed, 10 Jun 2026 01:32:18 -0700 (PDT)
X-Received: by 2002:a05:622a:2d4:b0:517:e192:f896 with SMTP id d75a77b69052e-517e192f9d3mr23136011cf.25.1781080338186;
        Wed, 10 Jun 2026 01:32:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9516218a12.15.2026.06.10.01.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:32:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:32:13 +0200
Subject: [PATCH 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-monza-ina232-v1-1-925b0d12771b@oss.qualcomm.com>
References: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
In-Reply-To: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a292113 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QcpCrrypq3z5zaV8IXQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfXyOKp5eYQJ8f0
 rzUP5htg2TijFEoCpN9N9nGBgCTaRbJGbfucIPXU2Z5oqkSfbhfz9mg+47mbok5xkD0O5XVlqn5
 1bLLGVw+5p7IwPlpyYh6miyMQWkQRcARj9AqilJTZzHFK4EGfJCaUQZlZFyd00QS22rgs+LnPYe
 /VZknp4sXJcyoFzdicch3Dz0njj4vaYLyL/0qGem/dcPHsw7xX3J+qNLQTvwE+MBBB+OGue05tO
 xLFJKbIqw/EhKgWUOFKGOj2FxYUqwADOlkLkkJx30Y7S+jFVQAgT4iii6cA94JqV4KWsiq+xuMN
 yon3LoQTnWGTHtma6/WgGSlf1WQ0l2eTqCWxQ2xkUGzEvU8x8QVHxZzCHO8yfRwaCaVhTss6ET7
 /74A9G8MboqHrMIjyph8457wC8GQBoD+CE4I2Pb2sqEAvtrTyFga9zgajNgAf2j5Jj/2AU+Msib
 Gc15Gw/LdhPv31Ois0Q==
X-Proofpoint-ORIG-GUID: gi6pO6VAKxraabibuw6UkHS94K5ShE9v
X-Proofpoint-GUID: gi6pO6VAKxraabibuw6UkHS94K5ShE9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor from Texas Instruments sharing
the same register map as the other INA2xx.

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 009d78b308596ca795bebdd160431bd718b127e0..a30888c9156b977671b3c48937d4ba972406ae91 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -28,6 +28,7 @@ properties:
       - ti,ina228
       - ti,ina230
       - ti,ina231
+      - ti,ina232
       - ti,ina233
       - ti,ina234
       - ti,ina237

-- 
2.34.1

