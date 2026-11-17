Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924598;
	b=bUypFqXK8pFMRCQhFMafiAEuOZFkhunUfHFEl3/uyafZyAn8vs5ZwTl8UM0MEJMaHFx2
	 Vj99wmib8YFxRZNwMfxgdlX9YtM/yCAr2tn305zXNfzndMvDaTTc913jmESte4PTRZ6BC
	 yK9jHBGPBeWvrbrv6irK4iD/b5LXznrSfU+iSmBiAtCDrULpHDmtjPuANG8pz/vA491xT
	 hxXcbYMsbxiocP28Ru1apHFbl+omjotb0WVcXTxaw/keRjQA0pbFF7/gJyQj3S+sS4X3k
	 15VWzUjBDzSvzUd61k0XuhSausBumzEKJMBo8C4Avt0fPfrxdpgLWrVmPhj3oM8Oq+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=if+Q2iufyNdZSoNqm8U2ycVdXqkw9sljJMepLaLmTxQ=;
	b=yho6VJtiGFg1fJdrF8nQWpw+t9idH//h4rD0IBUwGHf6Zj7NlWtyy/3Cp4DtlqcpTqC8
	 w19iyJNNCmj6KdDloxQj1gavwnO2cqwpeQAR7oaDWyITiwVkTBjFrUcGgOVz+kphQZhpB
	 Y3IRdXemYvJwedKkrYlhj2iB9isS3E+PBbeQjlHwu5UO/KFrPOc8+tzZulrSSOBxW+SZU
	 UIkKuQrx0dP5zhjCWBG9IkF8GUdcMnYZXbE4fQOBgUJvFxazsV8ruijoggsI4aU5V1jiz
	 XmVAWC752u2EUifrwIfqb4CeU6maxedGvNNrGe0kIpfvDVK+IRGIzyzQn87midmAVjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aZTZmH/g";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N+Ik/OZE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6039606A329
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6039606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZTZmH/g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+Ik/OZE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1MhR541699
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=if+Q2iufyNdZSoNqm8U2yc
	VdXqkw9sljJMepLaLmTxQ=; b=aZTZmH/gtGpTFuLwt0vOa+5UdMpeAg4N627XOO
	aYUMFp8a8XpavTRN487hwbVIExzpES+M+pmkDfUcWmh7V19c9mS5cyoWlbYZKug4
	/wPRHny4t/Y/H2naH46k1PMa57yj5DJbLUKns3ggU0tfWq6369KImn3kr7aRi05v
	0+U6i4w055SSH93NXUzU4ZJwelTX3GibLQ/xGNenlGRSWUYc5iGpdGRb1e1V5WXr
	AyK7vSFAzGVnpoQAdsRLl28WbLP7653IDKTSXQrTOQUSPy2osIGg2LAiudM3wqWF
	5DgK5YOaiSiCZLbm5VpQEk0JAbxYpo6wI5ZpCOnnar7OiOgA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd1skc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:09:56 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8628955a085so6094646a34.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794924596; x=1795529396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=if+Q2iufyNdZSoNqm8U2ycVdXqkw9sljJMepLaLmTxQ=;
        b=N+Ik/OZEdvOniVrOcFxNyWdfAZptcK8uS5OXhyr8tz1Xnl7qvNH7AIBP71Ay2oSuOz
         37mNrtcEfdekkFIJA7SU/IIxksDS1JWkQAu4rdfi8V+OG95Rhctn3t6OsBJtSkN1W48R
         YMfLia7vYBTvle7RmxQjDvKYRJyuRjTUKtQP5T5rU+bYYN44Y6R62VtR9MVVvGG/K5LF
         LnXEFBHCr4lqOXgjxqHoNX9uPPucbm0WyDC5ofRA3YLG71CkcNZPL/lRqVeZvi+6rgkf
         LduZc+LBEpjRewkmxGz7jYgcl464qhfkwaPoOfKjjRhTsb7xN44XLBGF2R+uH7vfmgth
         foFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924596; x=1795529396;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=if+Q2iufyNdZSoNqm8U2ycVdXqkw9sljJMepLaLmTxQ=;
        b=D+qP+vOb/gAnaKvVrUixw+E+okU7VUQeA50VFqBd5dfqFyPbyEcPfeZdsSMAwhx1HC
         sxsrfBMMB0A6GfmUt6DsoXT5EoB6FFMZDoxUlq3j78DmtdWSLFLWacTQX7hj8J6rk3Wt
         cd+iiZ8oZl0yiYt07TK6MqMmPeVy1PaoLJ7Ms+sn91KwcXUCbJFQ/BuLNzzqGJSVXPdG
         GlC32pHSQU9HPJDTaIn5KHGRdYQuqZSAf0pa9O9OFpCH4zwd0CsCVv+htcufIkAGG41t
         dOcELtB4kyBrDBJcUUJmKFqDoSxiSmnVIKy8+m+U5bKNE93gL0wh1mCIpB44NtxtTaEP
         naeA==
X-Forwarded-Encrypted: i=1; AL+hErH9HMXSdO3VwhDrvk/KKFSw62xMyDtTRes3qLKPy70YbFS0WFIFm18cs9i7Mv+myUGt4eL/YrTNkeo3@vger.kernel.org
X-Gm-Message-State: APuU4Z8lxOgGSBpaixokQwCZkc4V+Ksu3DOAAEvN3rPaaDlCp5aCeRWM
	pptUIbYPrFncAi8VJtMTJEcVoafu8hxZ9gdXjGC2xpdo2HPcYwFf7CpEi5HHofrRryHZj4NGMOv
	g6zeM3ziYUkJaPYiMyLTzkDPuV5nykm2mwMwZo/D/xGCt23O4C+XH/8SwBYEL8OW7
X-Gm-Gg: AYBFou0SHT1WedEiSPCq/nIzyMHwTGM+U3AbJMwm9CCPZ7x3S+WZxM6MjQS5SfQEO3z
	9Dpio9J5OHv9GYAGOt+aFmw3g0aDDe8g/3R51htwbxBwyGwvuCe0eWNATw/GrrXGImilOCO59jU
	d0e8siVFSkDud0V6ix88cnp6R4xpCtVzUfNCcPDM+xEkUYr2u7KclgYpO8aITYXMzl5YC8K+Nsi
	6a4b7PKRif1y2JQwxQaVD1HW3XIEvfQwfHqg6rD2yai5L7lLFaz/yULSYcPBjuAzdRM5AVduVxA
	k+Pe0NLv4+X6grCAn3aNxKquZVRN+bgOCbxJyAM41Tu8PkTh8yGdaO27BlW0lYijkrppFVuh81R
	l9hTO1z8PRyQDmh4o0yKGSZLG8duakG18JyxCo9bN0kpAXskTbcGjBw+8rAZREc6fVB3+RNk0jj
	QOgA==
X-Received: by 2002:a05:6830:2704:b0:85f:49ec:c96b with SMTP id 46e09a7af769-862898682e9mr13341464a34.16.1794924595800;
        Tue, 17 Nov 2026 06:09:55 -0800 (PST)
X-Received: by 2002:a05:6830:2704:b0:85f:49ec:c96b with SMTP id 46e09a7af769-862898682e9mr13341423a34.16.1794924595370;
        Tue, 17 Nov 2026 06:09:55 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862d68aac75sm3233775a34.23.2026.11.17.06.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:09:54 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] usb: typec: ucsi_ccg: Add CC orientation-gpios
 support
Date: Tue, 17 Nov 2026 19:39:46 +0530
Message-Id: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACtg/GoC/4WNQQqDMBBFryKzbiSJqNBV71FcpJNRB6qpSZQW8
 e6deoEu/sAbeP/vkCgyJbgWO0TaOHGYBeylABzdPJBiLwxW28YY06oVEyvEQaKCqHN2WRyFviJ
 rDfmmqkHsV6Se32fzvRMeOeUQP+fQZn7f/52bUVo53T90bbHt0d+WzOWyuieGaSrlQHccxxe5m
 cy2xQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc6034 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OciRnzNh6Tf4It2_ZlUA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX8MWDVLzt7H6h
 +s0Pv4d0hH5h8AZ6i8UditetUDBeuenh6XpzQDVg6MlY1GpMnXJ2YkM9gMdb6WFfzHQ7AFhZDK1
 x7BR+Q6oW1SZJFD95sGKxcIz7GJWdhE=
X-Proofpoint-GUID: mntbEGleLNv4AvJE5P2OxA3wDPBBdDJ1
X-Proofpoint-ORIG-GUID: mntbEGleLNv4AvJE5P2OxA3wDPBBdDJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfXwchQgKmo/RlY
 U4esHsK5gO2lzrPgAT2XYZS/xdT+sriLbp82uJ1etgL/A34tvdG85Y4Nhc4MR08pqPSVbtvjF1q
 0d90BCyQ5QcvmdsYLdL42Tz4FqrYb+mfGwbJyjHW2IswDFZNBrdTxGbvEw+Pjyw91Z83cG6qoog
 hbqj0RAh+ic5nLRngDiK5CtgDQnknOcoWfygMqUB9jLEQoppsx1YpKgG+IZIRzZFvXDbOtAL1AN
 TVq57ygqm6sTJ1N6pOiZvZ+y8Ud/cGozQGqoYhFIs/VAfzAIqT5B2FNfydCsCo341tfqcVwcwG5
 MjP3B44pQaGRecILCy4JqhtmX5DZqahDnbRWBKyQmfRmJGQvFpcU7nja0xSi9W6VmeMwJdnpnzZ
 fqjA/O5XfylGZmKVc+uQ7/pycyRBYcZmiWotzjw/lsaO7e+/DCEbwcy24KM/0imTXsGN6nnkQuG
 P/icLS9bHXovHKggpew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170056

The CCGx Type-C PD controller has no HPI register exposing CC
polarity, so UCSI status alone cannot tell the typec class which way
a connector is plugged in. This series adds an optional
orientation-gpios property so boards that wire a board-level
CC-orientation sense line to the connector can still report
orientation through typec_set_orientation().

Patch 1 documents the new orientation-gpios property on
cypress,cypd4226.yaml, ordered by connector number (an entry may be
left as <0> for connectors with no sense line).

Patch 2 wires it up in ucsi_ccg: acquire an optional GPIO per
connector in probe(), indexed by the connector's reg property, and
use it from new update_connector/connector_status UCSI ops to set
typec_cap.orientation_aware and drive typec_set_orientation().

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
Changes in v2:
- Correct sender/author identity to akash.kumar@oss.qualcomm.com
  (no functional changes)
- Link to v1: https://lore.kernel.org/r/20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com

---
Akash Kumar (2):
      dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
      usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../devicetree/bindings/usb/cypress,cypd4226.yaml  | 10 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c                  | 76 +++++++++++++++++++++-
 2 files changed, 85 insertions(+), 1 deletion(-)
---
base-commit: 2c46a57079874df3a60770278f08404f5d0f782d
change-id: 20261117-ucsi-ccg-cc-orientation-cd3e221ed635

Best regards,
-- 
Akash Kumar <akakum@qti.qualcomm.com>

