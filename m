Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779797;
	b=JJBtunDorFewyntBVM9tYBt/WLRXwa0GDlzon8h2bZ0UgySNwonIDAD4+UZ7DDuY0mgt
	 j5G8NV5EsRorUi8yKN9UHtBHTn6IHCUX3a+oJvG+cxjWtJ9Tusu7D6zihMkhu1u97vL1g
	 nS4Q4V7N4jjeJDBjSyEyFjz1Vha2o1sUOnrVyeAvBiDwVrL00X2264A15ujZJ5K3V3tYQ
	 iDj3VoC2VJVnBVqgwwsc+lRX3mBnHdAwfKEn8l7jEza3GQpyFq/m+HrxzL9i5/RXZFFJi
	 HKet1/+UDUJno9ATrCLGxc9LykvEWPOeaxZ0HnlDrggfrlQ4nteoSkiyL2FMMqJDSKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W4hdi13GHlYzp+OY02oIK20xUZuO13ngbeGQEaJOjyI=;
	b=olvLBWihXDK6+StXqhtE7hvs37W+bPETS83gGen35O/W1IrMvFfKknnlsVMHSVBLzCJF
	 zZEykzEYGhv+W/WA43GiGnThCqDznANlqR8r5ON2yHfAxssUzxvTHC7T/5GPbBwLlXa2r
	 7LSQpbyk1gwLst3I6LykteglIgVvSD4skwoh0TP0PcSBJuwVxI1c6k1HY3IQE+Jny7GLt
	 YqzE5nJTkW70GZHcPKlNtwhnHzeiWFg0+0FfHoalOSPrtHE/gFgk6reAsELyCHo7KncW/
	 11aGr5ycxd+mjKLpA+fts1D/IDPr9ai/1GKYNXxqsbsMLkRb+ZPD+MBbZkNBGygqb7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTjHcMpd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HmxRrMnu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A674F606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A674F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTjHcMpd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HmxRrMnu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp6sK1376772
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W4hdi13GHlYzp+OY02oIK2
	0xUZuO13ngbeGQEaJOjyI=; b=XTjHcMpdxoIIrVdi4NLaPNZWUk99IG1NCqA4UB
	G7QXLw48O7SFXYBKJIZCdv6gL9dMAOKjml3XgPC3dDaRsKV7of8HzbxbGXvWhvLc
	y+DyqVZIGmYqRv3KEM8tqS6ns4kMucJz7jS6WXfzk3VI7SkLLuYvmdXx5Exnrwaj
	LanI5Bh29db7G6b7yo+FhqdNmXziHQmJ6OC6hTQpOd3+GDW06RdoyrF5vkO1q9k0
	0vAdjYw0eaDx2B3Rjs826QBv09pp7KG7eQFe/XZ17h8R4PYd3zL3vbOxQXJaZNjg
	s535o2LIUdCwVDfTJdWHEoD8NbWGCqCPOKtHnb6y0LhoMWhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3abmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d3232fso1098907485a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779795; x=1796384595; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W4hdi13GHlYzp+OY02oIK20xUZuO13ngbeGQEaJOjyI=;
        b=HmxRrMnuHX52CBbWjNEbAVkUqFy6qNAACWRF8VM8DbpP5wyf+2DHMIruGSqlPEjUHV
         rpRo2/02PmeYw25oDLqdW9RKhqBv771f2Kit3RnhUqbI10+uMq16uCnfWfwdQVFKl+J5
         HCnsSAokahXFQPhvomKm8qu3QnsrNFKeq4bXPmCYGOD9RngMBEhiHY54gJe5BiEGuBpe
         5Q0mdJ35UlRvmZxJB2zA/8uneHr6fuGXNvy9/ZH3llEznFvy63EbpbCDVTM7hgj9wxqR
         uUC6hrSjytu6xEKKLXmtcttRjpIFmcMERdKdGIfRBAAwYLSERxBljiFUK9t/u2KX5iqS
         Qf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779795; x=1796384595;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W4hdi13GHlYzp+OY02oIK20xUZuO13ngbeGQEaJOjyI=;
        b=pUJZO/ZJKdnYkJHmA97xnZmoTYAwV0h8RbsMytiOFsCj3uQaJhCAmjbGBOIB6dAvkN
         LrRxgPTlkvZKeHhRYBnoc1eozB3Wu6k9InQUKeZXbZsm+SMn0ztDBp3UtMByIFBq/zVY
         cF4C4h8eTQczcXwM0nkA5SR4xP130CkgBMWSSEASnapq0a/T+8FbplA6O6+kJb9Dd4Ff
         KcsxOIKjOUrQLpYApPbyhd7/+0sBHpp8JVKwCcqHoYFZj+u0LhaM9yqfsk1CKYasdfzd
         VagTnXjoaTeXzdXm4H+YHizxy7m5Qao8oC9AVKbXEIh2NUNrry6XHbGTCd837j3rmBXL
         0tvg==
X-Forwarded-Encrypted: i=1; AL+hErHG5C17Qt4KFg76+jWWd2VETQ5yEmjOgyS5CUveqxXdoTSvPtxBTmmjAqtfvNyJKL0jMdm/9FznTUJA@vger.kernel.org
X-Gm-Message-State: APuU4Z/1BZzBzops85/MbrkUnMkHECVjDp1CHi+w3LjntPuZ+686zWxc
	ADvbRxsHjJNwOq5cuhhzqqFfWztDIz50bZ5vxAzVhml9J2zYy2EDEHs+ctQzxHeN68C1P1gkBi0
	+0aH77TWiPW0sJaxD5ylCWqueWHIvFyCiwbP1JdnY5v8IX2h+9drO9D+BzYWSfEfe
X-Gm-Gg: AZFdTZdcjeLPVpGgGxAjf6f7KHt3ExHy6rPtPR/gotGBZQaV3PUjzK4ZeGWbQpcuDyh
	84hncU0dKePpv00AKkK/BowoZBdwIrJL9lpZcHbnI9S7esEkHQ85FORJAP59cJcRrTwyR3n12eb
	UxwbN0pCK3qzHQu3XQywDbtMeDDDjcXeKRZjeD2VUBhQrK2p11fC1l6etwzTTYd0J+HpdSvFyGV
	M3imj1c488l/euokZAWAx2PtE9l06ZqjpAF4UgPKKpIEtjuzhkCLrcMzOK/S0tuG3x6Q1djrre+
	KU5S3mD5cqadAS7Hcszm5yqJC692agnkWEcFdMSrdaMAMRhp0LQxpeKVnBL0pEirG/Acae7wRxX
	+6fzmbC+Ld+zlFrLjCvjHpoMVPHXash/iACrgKFf8ILIeljGPN9ilQgPablaCl4kGlG6rxrexZK
	RPEoGfTEO7Z4oUepAZsladTnG5EvNtVB1dRKRMNufMXIJJbtt8BzMeVNkjT7LNKjg=
X-Received: by 2002:a05:620a:4488:b0:949:91c6:973e with SMTP id af79cd13be357-949bab66f99mr4293533285a.65.1795779795072;
        Fri, 27 Nov 2026 03:43:15 -0800 (PST)
X-Received: by 2002:a05:620a:4488:b0:949:91c6:973e with SMTP id af79cd13be357-949bab66f99mr4293526585a.65.1795779794594;
        Fri, 27 Nov 2026 03:43:14 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm716120385e9.8.2026.11.27.03.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] pmdomain: qcom: rpmhpd: add RPMh power domains for
 Seca
Date: Fri, 27 Nov 2026 12:43:08 +0100
Message-Id: <20261127-seca-pm-domains-v1-0-013c28eafc5f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMxsCWsC/x3MMQqAMAxA0atIZgO2xSJeRRxKk2oGqzQggvTuF
 sc3/P+CchFWmLsXCt+icuYG03cQ95A3RqFmsIP1xliPyjHgdSCdR5CsyMm5yUUisiO06iqc5Pm
 Py1rrB+p1kglhAAAA
X-Change-ID: 20261126-seca-pm-domains-ef3383cddd25
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=793;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=x26m/gbEgJMZg/btKIREp/6kDbwNz18lHPMCLbWMwn4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWzQTsjdObDAZJskW+9KrR5Dy6V94wXeP68G5
 NXrsJe2kUaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawls0AAKCRAFnS7L/zaE
 w4MqD/wOCta7pD4t6ZjiiZiD4CE7C7EfvK+kYJhqQseI2ximKm9v6yN15dYNnjyqVr0YmVF3Dxf
 Gz51BEhYaSRyXOV0N6YXO0QXvMz1jF2BG/iBKrLQEsA0p3fRXvfPMrvdmiW1Q+n39ZWpQfGTZ1K
 oTNjsQ0pRpUED2+L1ighQ3b2f1yg7H71Tw4xaxeYbV46XmAMUGS6qWNTPFynFJAY0bdsE62a/6b
 t1LHSF+UZBLRS79uRqNKtkFipIdAwigCyQJ4tnycqrRXgKfpB+NDS+HNcuYrHcfZ1OJqYx/E//J
 5EzUYXg8OctzhzmRPgxq1TbcpNDQhSjooVZKcrkQQzLAEkQ1Gbhhz1Hyce7IlCC0KcglFZYp3tA
 qgjlQW9bQALzKUxI7BuHhU+md3teHkJBNzPNap4RfPX9o1bMsQVFHIS78f/AgtlX5RvNxfvnLdc
 exjKLEgCDC5rxPGaJATCypwpOgfib/HftnJYVu+v09gxXMKdfWv0Nv9exm4YD25ZKaMHessK3J1
 WUOso8fxWA+vAlq2KaWZITeMLRbLheGI3JEAimQRimgBJJlr6Bq2W+FUyTNlPMjhUsq9Vzcp33z
 +JSAG35f+GJRxvnks2h1l/5B7C/ivqbtEdeUibvvRFlRwZnBHm1WTkfTw1EZn3cG8oeTRew1u5M
 c0R+ApXOpmd+d3A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b096cd4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EmnG9ksW2TcYSj2vAuMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: lHCWjDRjMS0cDDzVNC481d4rIAcx_Zed
X-Proofpoint-ORIG-GUID: lHCWjDRjMS0cDDzVNC481d4rIAcx_Zed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX16C5gUF//9UK
 Lo7dBRigiMK4AJAWkhAWqvPQKKBzh18U8YdJcZOjWLpmoJU7VLDtU4mvOCZcAr9ugntyCTB2Zbr
 JP4OYhQLsoQ5L8jKulSDpo8kiNZ6JJ/r68CJMr6tJ6dlFdNbtbhiMoST36M3x9mKpUdBoqGp2rR
 fBnAE6+8+MAhistB94KrKlyXr0t6lin51J/NwZfwOHFBXBkAW23yqvxmwAiCwfgwJT838FbOhMU
 iOSgOyxFD1TXD8gZ5zFA0m7PaniisRMr+XdgKaZtZT5qfCLSd1K9IVkS6cmh4Gn5xUmk2PM0uU4
 dQvKd8FG8YnwfaLtKGRh6bveyOqPbpgX+4LKA1DkPztFrcNrdEe7YpYonTNMCzTXOqNMmpqgeX9
 Iq9P+pjfabXdhnEbpzg52OSJvxRoI+Nh1Jsk0pzm3vjbsDlHRxmsmzl8vpY7ODRnJ8livbmD0lo
 YRpDA3zav5Ru/TIvvdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX2EYdIQTmsdcz
 /qmqzufPiUDC2NcqrVsd7jBC1gbPYwmE7jB8jXEs/HBxGYMkX3x19JqYchGuUCoswrjErPSCZCv
 +3iAAEvBADEmNByAH42S/MD/GS42/2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Qualcomm Seca is an automotive SoC with 12 Oryon CPU cores that's a
slightly less powerful cousin of the Nord SoC.

Document the RPMh power domains for this platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      dt-bindings: power: qcom,rpmpd: document the RPMh power domains for Seca
      pmdomain: qcom: rpmhpd: add RPMh power domains for Seca

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                     | 24 ++++++++++++++++++++++
 2 files changed, 25 insertions(+)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261126-seca-pm-domains-ef3383cddd25

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

