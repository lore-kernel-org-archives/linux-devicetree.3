Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE417340283
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480327; cv=none; b=lXioclmwL8ACLDx+3gsqLttFSSQUGKNgihOwSfRYHvV7OB7cd4q6+FGAEPPCBcSApdgnBJQNjUqAanoSQ4i8M/qz6q73smw3KU0fU60cz3sY9SzacwQqazmdrsfkUa9rwuUpBKHAleqFxQ49J02ok6K7+CxzMN6AuDz9i1TzsFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480327; c=relaxed/simple;
	bh=1LnTYHR/13HecSDvNXv+0kgEgMFq7j8Uc9/GGQCXpX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kyi1Of0fQUq8XyHqmdTnQc88oahXjRr3okodiXo1rJAwcTwLylVYAhFA94dbi32nvxGXXMyRyuwPxJzdJ/0GPcqLWq7TVInPwhvsznq9KS6k/V+JOppI+v5jPZT8H4GyxyKpc/wxoep6NVEDtI3+JS3pJEPe/0u70wmlwmqkZZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVuAiaOK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfWZCsis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVuAiaOK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfWZCsis"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V6gwom3140442
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+90YvACKrGhNGFC3jO9C3x
	PTwtrUvuxLMFSNd/WpkuE=; b=pVuAiaOKSBePZECwtyYvkW/TaPf9JcaaW5/PQ5
	euMs96kjZxAGdpGYXR7Yaakpj3n2nQNUdbbBTbLfuSTvmXObMfgzQwOM8ThxonJW
	ZB7ybpTOn0esPKIou6Sjfl23y3MdTFFMPFHGIHPmlQf8+OzxkLdJzqYmZFIX2Nso
	tLM3h+AX1L7BUYEyy1O0Vd6/aWZ4TNAWnobDZscLSpIYhPi9F1IdH5jChrt1x42W
	sg/lDTkkEAnVWtKVDL8w9Ij4tNLoJa6SuX8JxhVGwzRX0+dLxiFWi5vodvNTVijs
	I3g7nqsmoc6t4rVlCnasYVf0upFk6qL/nlNysKfBUS3ZqAzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frpp700a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:45:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b6bdcb4fso92991385a.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785480324; x=1786085124; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+90YvACKrGhNGFC3jO9C3xPTwtrUvuxLMFSNd/WpkuE=;
        b=TfWZCsisI/eYQmWvwDZ/vlLU77nfaZb50yA9hDOpaRcbfiB9fgGMJ206PREBYj9P00
         dsw6fokEvADXhaN4Jc0z/2IsNq3umnowY57u6TA2I/pPRirJmF0FeimS4kJ+MlUDA5NB
         0HwgbO8hvY1M9lIHjkFD5RL1ULFRG4ctuuv3FMM0H5T1vOZNJ4ecq7VZ2u97jtwwcpM8
         gL69yzfb53iq41l3vhmH5/DmpvxVynAuJ19+QUYA8X7XE1+Z3nzeAiZssuGCtORYDwd9
         5EMBJ4njvAsgxiHBKM+4v1BrQ3vl88BpRsz2/oP8hpT4g13p1Tk8LbtUc+zTpW3UYERs
         z+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480324; x=1786085124;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+90YvACKrGhNGFC3jO9C3xPTwtrUvuxLMFSNd/WpkuE=;
        b=Vvr1Xpbk7VHLbaDL4NbXIBDNrjVZfkEZBsi7Vfi9y/NcupI2wE8NbL0S6Ixm08/RUL
         UeE7k7krPuOEmMwcGPEn8kxh/sMy4hsfbirOufXYz6Pub/fwbQIfAaG70KK4XT8xvbQ7
         L1FIMZf+EWwN5qEHTE+pSfefstybNcjbrLYjSNXPHpqbpf2In38rLYx6IpyErwzfQwP/
         wfb4fEAxZbJjWpRqFsfDQ98goFYTJdREZP9O+qVQEUjnR02KW0Qd4Y4od3IuRuVeCNjY
         cnJy7RBDrW5zk6lL5XE+PCnFbWRqinIOwMyZZW5U7TFtEcP95qjvLKJlQPheFg/rH9OW
         /7Pw==
X-Forwarded-Encrypted: i=1; AHgh+RoJOyr9k2vcWkkC/4GQ+hxhevjUNM73oSk8c2P1YV7318+P8QwUguDy5VFXVNw60+MElPClg29TfvU7@vger.kernel.org
X-Gm-Message-State: AOJu0YwY5lOn1lX3yr89phNH380iLjLrWP4By0hytN2Clif7CDxSUqmy
	V3WKOo4E6zyllZ2er/Afmjn55yrPMpa2L0VHKCr9ld1CQPQsY8gGMDZCQnTNOvoiZGy5GDV5YZ1
	BZX9srttgSt4IPmNEuJ5+Qts4b43clNAy9AoJVLQffvlVQm+v36nhw3lBEqpXymmc
X-Gm-Gg: AR+sD12+WA7BMa5U+5ZdIPphvpcb+6OaIMtudoZxJ830pRqa6EfIOC06B2ZZSD9iTFZ
	Xl033hNFyNVbb6vnM8Btsc1+w4kxybhhptyiRsJYXVGGOcxZjaKQfEYxj6JRb0g4LJFMU3nA2tM
	WZd1s3rWLMgQ6CPUC3ss6nBThH2h/thIJA6YFW2lxTf8SXN7FyElrFDvu9gu+eYwcq7ggN3Xgww
	0GtImasIPxshqCFvNJPiqTi8V9BlY+5rV0HSOwVXR3CQyogngeKq6+Is6Ak4b7JgQiRg2714j8H
	Rj3RIFrIw6Di8bKnLnFhZvKJyvjS/3Ot8jXLNIN3ZyhiuxNJqWvQWBicNbMuBUGDVDq0J2zXFHC
	vL3t9iNQCgDGtwW8GfYF4S7l8mlF23rMJIuvIGhGld/cTdQH2rQZwGv9SvU09PsnXv8Vi
X-Received: by 2002:a05:620a:240a:20b0:92f:196:2092 with SMTP id af79cd13be357-934967c3d31mr77076485a.29.1785480323971;
        Thu, 30 Jul 2026 23:45:23 -0700 (PDT)
X-Received: by 2002:a05:620a:240a:20b0:92f:196:2092 with SMTP id af79cd13be357-934967c3d31mr77075485a.29.1785480323646;
        Thu, 30 Jul 2026 23:45:23 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-934971773ffsm46107685a.29.2026.07.30.23.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:45:23 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v5 0/4] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
Date: Fri, 31 Jul 2026 14:44:53 +0800
Message-Id: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGVEbGoC/3XNwW7CMAwG4FdBORPkuAkpO/EeaAc7NRAJCGsg2
 lT13ZdyaaWNi6Xf8vd7UFn6KFl9rAbVS4k5plsNbr1S4Uy3k+jY1awQcAtb0+p0gkKGtXPMxyY
 QM4iq1/dejvH71XT4rPkc8yP1P6/iYqbt345iNOiuI2+Y2wZgt085b76edAnpet3UoaaqgjP3g
 DPHygG8sRYDEdIb3iz54nszfZdWrLXOkcU33C447mZuK5fgxUvXekb+h4/j+Avw2uUpYgEAAA=
 =
X-Change-ID: 20260618-og0va1b-55bbf3cabb0e
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785480319; l=2312;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=1LnTYHR/13HecSDvNXv+0kgEgMFq7j8Uc9/GGQCXpX8=;
 b=eKpMWWCxIcVluNWRdBBUhaWupTlPAJH0cODcAYjXIqGwcytKpcpG1dtabkkdhVC7Jbp+/wNjG
 iq7YjXWt8wTAzn4754F8FRPJWgBpVo9btL8P6zRllS5w/WFLI91AJyD
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX3S1ymR5XFAmj
 M/Y/bLxS/GDXcwbe0nx0DhgPTXzHQEANY/Hq1agcr5nMPcn9oAlltGNSW2aiCCmociCSFsBq44p
 8eFerIJ4do0sU2GEJV0efC+wfKTUTnS/AxfWXxRsWlU4iGNthSbYl5bv0412NgzduXpO13dFGLv
 sRew61c8xxj3lYjE1bpA50cB/FM/GT/HohIIB3jwSeHOZKg1dVDI11chgNyKIWjRAPQ+pREL3Un
 hjdXLJnLdhw5jXhkTqAvBEy7qec8OfDrIVcWz9oUNsXTOu+lkOe5FGrv+UEjroa8+NaflRrgbva
 Qs2TUtptWHlxC0Pm+slVW3sjhKXJoLHlVzLvGlWHTTHZ9dGpwstRTVWubtHs/B1VhomjmFX4jD4
 9x1Cv9Lpej1erlknSnbazdowhlJSYedMaFPfDHPdC5sKENRE5QwK8vKznZqANElywePIJubYglG
 MGALa5WTUDnnyjCsmnw==
X-Proofpoint-ORIG-GUID: 54Az0iHZQySSYnqMjDWx3R-1R5dvCE5K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX/okGC8/GRl8+
 tgiAS5lChUF9cMY6gpgKm0d3/ROLlZ0n+4kC2BtN2IkmNSh1OpypiO7iJdmt3BgjA+ps5rBcEIa
 yJ8IVyiuXXXrldkr4FfCFj1zwaiQs3c=
X-Proofpoint-GUID: 54Az0iHZQySSYnqMjDWx3R-1R5dvCE5K
X-Authority-Analysis: v=2.4 cv=AsXeGu9P c=1 sm=1 tr=0 ts=6a6c4484 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QHcE8raJy8psccEy0TIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310045

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified(include tpg) on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v5:
- Use div_u64() for pixel rate calculation to avoid 64-bit division
helpers on 32-bit architectures. -- sashiko-bot, kernel test robot
- Link to v4: https://lore.kernel.org/r/20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com

Changes in v4:
- Rename the OG0VA1B and OG0VE1B test pattern menu entries to make them 
more accurate. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com

Changes in v3:
- Generalise the binding title and description for both sensors. -- Vladimir
- Keep the cached pre_isp read so the OG0VE1B test pattern still works,
select it via a per-sensor callback. -- Bryan, Vladimir
- Rename the "sensor" field to "data", drop bpp (derive from code) and
add og0ve1b_pixel_rate(). -- Vladimir
- Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
og0va1b_data first. -- Vladimir
- Expose all four OG0VA1B test patterns instead of one.
- Link to v2: https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com

Changes in v2:
- Integrate OG0VA1B into the existing og0ve1b driver and binding
instead. -- Vladimir
- Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com

---
Wenmeng Liu (4):
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Use monochrome-appropriate test pattern name
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
 drivers/media/i2c/og0ve1b.c                        | 378 ++++++++++++++++++---
 2 files changed, 346 insertions(+), 47 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

