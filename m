Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100674;
	b=LhzncgM+k+Nk6Yx9r/wiYdlA1+WqkBof7D32MOVElUmKEIQi4XZyq5TY+Kg6sXZE5JKq
	 O9M5KaJvPWIHbwzANc0VZq4o0x05a1gy6OZTgfWHyttf30B9GFBLaTiClhlIzFmWpvk5j
	 s66oJ+yXp7cNu496WlAVZJdTuxObZ99+xPBwmvzq25OZrJER/GUOwkaJ+OAKlzUNnsyKu
	 GkeO3QfvubFHdF2LYEXAXvbhKrzfEZOpSpkRRQlFidGD9ep1xi7XchWFzG42I4yU9ZWwa
	 UQ54FemMxafBOMDt5WGnQ9k50V4WQ6xyBQ3AtV2xbh2ZlVCrB2cYEeswWCZl5asADZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=++0iF9WZyX/JF7xCCfezhklFThYEjJZaC0MbC0RIVb0=;
	b=dVpAHFL9UpYyxUizhA4AhUzThpFuew6Fp1/q7cDVawHi7Oo7J/AbUJm4EcGmxaVC/27i
	 MmD+OCsgMFgT4SnYt7f08TgKpp2pZngcEaQoxd92dENKolMGL6Z0KsHHQtGIY0tsjACxq
	 CXS60YLZMdWQp+ZBJySOpvt9SoFTknoneckFGqUiGwxWbFi/Oc5CXvTZtWtR6ugyJvu9w
	 VHoqXyHVkBrM9FzFL4r8eHTlF1neWBURHoq70pt4ImDuFUNTxATm+amfRPUpD5AahJsMq
	 BGa+nzi395xZvtnpJtgGgx8x3h3VCiR5nlj21hIOuDhGJI95rKPGmQ+sSqX7eQbOMNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VT9U/+JI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2DRbbaf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98596606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98596606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VT9U/+JI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2DRbbaf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBk7O52609567
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=++0iF9WZyX/JF7xCCfezhk
	lFThYEjJZaC0MbC0RIVb0=; b=VT9U/+JIol1dJh/nIKYyMkvI1G9SrhOf9so3hV
	iS9p+LAoXOkxT54vyTlWZPyc0T6qB4Q9nrpXlHmRvbqBBQc3OwpS62bCoD0Q/HXA
	JhR5u9w3Wit53h6TV2RfR4welYpvpemtF3eJaX3rPY3CbPhBwM6zdQ7krAxpespO
	Zd/aW6ZbtUt8Pjvv/8ho/mHUhT4XaNZQd7qC6i6LXMCjHfHKB1Qpy3EDQagFYCRe
	8F9OOPDkUbbK1wLxQD+qI++OH1YSNM9Vh6g+M0ag52U8ZtTQOI9tUeIe6+pr4NDR
	a37pNEBCAUGXoYnGkNfDcvsQRQxtm1ESX7O4ewqF+6nLHLjQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcvwrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:04:32 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67a781c1069so3463612d50.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795100672; x=1795705472; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=++0iF9WZyX/JF7xCCfezhklFThYEjJZaC0MbC0RIVb0=;
        b=T2DRbbaf0UnIPSLUXt6eNGWqMX0EkAZOyr9ZZ4qDI4eoZNhc8y56q/yd2oAvSgzL5H
         q/d/9UpchSlEZOt/ZaIsNJaw0utyZtVa8Q0qGC6gu1Apoqca88rXJRVSVgDAQ7cFfkky
         5xQsO8cJSnHObu9ip4VhEuXrif1t2anTQ6zfIck0w25FdBlKK7lul4MeinwtfurL7Nl/
         OS2+nTACJkB4sOzAnWGZ5XcV2Sw/eerpXZTH4/mHc4lZ8xrljZiM7ygipDnvnZBut4lS
         9ox3NlHjs1eGDTzYr6qgzpOsNajGyFDpCR+APHd49ZqVQ8KmKSdqy+4gTKHsBm1FkBaK
         b0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100672; x=1795705472;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=++0iF9WZyX/JF7xCCfezhklFThYEjJZaC0MbC0RIVb0=;
        b=ZKD732+kvf7RNcl3mWCaQptduaCcEFN2trSOmm9GAuggFfUF6Er+XXAKOIYCnn/cJ3
         O7gfQW7bWO0cmIQxygJcwBuh4isyB+otA1MzuY3WWpkQyUHXfwEUQPQwVkhBiKe22+n6
         tn+jgmcWNLaKYMRZI3FenDfIfZyUVOS8dX/Upc/L+q2J5KwijZtPYd7/4pyTzM1l6oWY
         ZUBM6N2QkvF1+gzkKz63NTpWKQnuBxIZ5zG9wYSdPS12cLbzMFMKDR/UKjVFjrFqhhdp
         VsW2prGOz9//kySVhs6N3S1ru/CR7H8e7WnCtJhLAu8310d+lM0hDYoaiOWhPWp6Py8N
         +Uvw==
X-Forwarded-Encrypted: i=1; AL+hErGR4PpVzIEzzufy3eAASpzn+DjpEeE2qCB3YrnesqKHMuD1foGbkf4GSd79C2W2x7i5Y2K1nM3mIGTW@vger.kernel.org
X-Gm-Message-State: APuU4Z9S6qTQth+kMGIUgkA+OLUuiKZBPmTewvSVUwpkn9G8/GqtbSP2
	qq9p+UMrdH8+CRu6GLJgs3+4wsvKNQ4XffiQ/J3R+s62pd9fP/D20nYYFJ/kgFN2DoQ9I9L/aeF
	zTtNY7SkMoC7S/onEfDpMj0VL0Ohg2HNNajK85mOpfP13KluxsrV0lGzZR7Yv8PmQ
X-Gm-Gg: AZFdTZcurvgTPMO3+qw22hRe0VGEGsFV9OXhzU1M8V1W/BKPn6zXI7NzduCDkwa1mF2
	jvaLxknmEehMvOJdQ0EH0GridobRFJ6jZpHJkSU3tE3zd61omIXTYpz2+27kWKNRjKMGoXMSHiS
	UuhHt3x6E/2iGt6De31pdYWcEPZMabnGoagMG/WzllFY6l8XsoriKLrOl9ukUfF/ph9GjfSTDBT
	nd0m1aO+mNPMJc+Swo9RBNYdspAe2fcgXSo/e8l8J5KRPt6mOQdbayac7mdX1CI0w2Y7r33++cj
	BVK8P+e/zFIBUNRynseZnBMfMaR74WHjUym+6ZtYfxW8jramrRAaIyUDmr+Kl0v0l70lBYbuAnP
	QlZ/NDirkr4yB/XdI18bGipbVmmRoOEw0EEDBNjT9ZSC+rpu3Fa2SJcO+f8FunsdBFs0lUwxoO5
	n6+QDg
X-Received: by 2002:a05:690e:1094:20b0:67d:bbf9:11f9 with SMTP id 956f58d0204a3-67dd3f5a9damr1872156d50.41.1795100671616;
        Thu, 19 Nov 2026 07:04:31 -0800 (PST)
X-Received: by 2002:a05:690e:1094:20b0:67d:bbf9:11f9 with SMTP id 956f58d0204a3-67dd3f5a9damr1872096d50.41.1795100671087;
        Thu, 19 Nov 2026 07:04:31 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm79790d50.22.2026.11.19.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:04:30 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: qcom: camss: Fix Glymur CSIPHY topology
Date: Thu, 19 Nov 2026 20:34:21 +0530
Message-Id: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPUP/2oC/23OwQ6CMAwG4FchOztCx2Dgyfcwxoyx6RIBXWGRE
 N7dMS7GeGnyN+3XLgS1sxrJMVmI096iHfoQ8kNC1F32N01tGzJhGSsBMkZvj7mb3FXJDpGCMlV
 uuORcGBJWnk4b+47c+bJnp19TUMe9SRqJmqqh6+x4TMq2qFgrKiPbmmzzd4vj4Ob4jYe48P+wB
 5pRo5oSaqNEDvVpQExfk3xsdhpK9Dz7MiD/MVgwGmhEWWS1Epz/MdZ1/QCKKnSxIwEAAA==
X-Change-ID: 20261102-glymur_camss-1cf83f4a447f
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795100665; l=1632;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=INChXq1vpYh0albQLEYJFLkXE2g1hDB7cFuP/mfs4PU=;
 b=twsJFl8WfgRmeqZAMp3KIlEyDduOCWgSQgEzksZkjU5/0bZAmfAPiopIEiooMjgaRFJ93RZZf
 lZ3Qy1gL9rSBiAUXaLbPeheBFxquGn2eoyPKRqjmEtV9VSyXzMto2Ia
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6aff1000 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffzozp4-zBr36aKF_PUA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: 7mxIh5Qs0s2ojCMs2PiqStZRbIe8zzMm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX/Pa0fiQCwb4+
 QVnADmVCENPdv5o3ASCoA4ySGIqWdU/aUW+ddJF3qzmgKSVDyjtFH054oYdbc7CUNXJ1v3+Y4ln
 GB3GuuyWNbqJ3a8Rvii8gKdxbqjUdp7HdW5KSgOdrdQyREPameiDlNXbPjoan25DbGyFJM9nXZu
 VNJwebySb1lUhPypB2qlJ3FY3/iTHxRj/oXpFCG715xOsPXeM27UniEqDBa8BAn+sinn/FA1zEO
 v2kSkKiuNmULbiAbbPpx25TriFgf6PtiX+gDFaIQxxhaNrsJhuHVB7+bpjrsSncJdNpb+lZGpYe
 CKihQ144nM+gxfJ8k6RGaU/hJBU6rLV+HbNntJx0g/SXhzE/J1h9tuanqFqcFYrMELlAsr9E0oP
 KTqE2FCljsfS7hqHgmyRe6rCBffi83KAOMrV8GX+S+Kq620bxAbzAs6ki/cYG4njvUv7bjeO1xL
 UdG6JjIkNKJFL4pLoOQ==
X-Proofpoint-GUID: 7mxIh5Qs0s2ojCMs2PiqStZRbIe8zzMm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX8TFhyrWR7d0N
 A/7+WaUddksNEQlU8B6lOQ38z6/Arg5A4lW2UcsSzNbxvBOTmEkIGvz0obJ9kMxPdNzciOgetpC
 SEztlMs5LMUOmbPMC+dkaZ1Lmu7ARYk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190059

Glymur reuses the X1E80100 CAMSS block resources, but has only three
CSI2 PHYs instead of four.

Update the binding to describe three logical CAMSS input ports, and add
Glymur-specific CSIPHY resources for the PHYs present on Glymur while
continuing to reuse the common X1E80100 CAMSS resources.

The Glymur DTS is still under review, so this updates the schema and
example before the old port@3 example is used.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v3:
- Clarify the binding ABI change and why the old port@3 ABI worked - Krzysztof
- Explain in commit dropping port@3 does not affect in-tree users because
  Glymur DTS support is still under review - Loic
- Link to v2: https://lore.kernel.org/r/20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com

Changes in v2:
- Rebase on next-20261112
- Use logical CAMSS ports 0-2 in the Glymur binding example - Krzysztof
- Add Glymur-specific CSIPHY resources for the three available PHYs.
- Link to v1: https://lore.kernel.org/r/20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com

---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Use linear CSI ports
      media: qcom: camss: Add Glymur-specific resources

 .../bindings/media/qcom,glymur-camss.yaml          |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 42 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

