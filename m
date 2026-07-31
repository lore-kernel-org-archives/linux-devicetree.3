Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D885B846A
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478494; cv=none; b=J3O3SspE+6A6F5skM4HiAf06Sj4u+dMSSbaBA7SmcOpzajkgIR+xNfSMridyji8VHAVPWSi33P7lBYTauttVpN4C2nejvgJ0mEoJ74gD3G/1VXtYKPjH1TlTgSH0nwhV7lYqPcLhJJXZbumDaD7oMeXgXzJsQdIX0H6mdWu70t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478494; c=relaxed/simple;
	bh=CH0nrzzERZiKDAaxkdwSWsyBt/iEhMwlQeoAjP5LHqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EnctwFgpH2INHn/Avr7Spp3B6owz2RQDTdprGfgqO4Gdp5h2JG3adOVY71SvHQcOHqVGtx48LmfTWAT/F8GVwKWEV2LY25MYavfmtQI/d94WsFUnKFGD78rnvuvZNELxodujr3hUIcv+MppKyXuSOWWAQJ0TKHfrM3OP4D7viPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uwfpl3sl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F46c2lGH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uwfpl3sl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F46c2lGH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V69LZp3161926
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L48ZRC/JcC83vrGc37PNdb
	dpkgF83Vs9H4pRoZkzLxA=; b=Uwfpl3slqrn6x1DQAx7fHG9YqxOF/d+pmKjNQN
	VIGm3o5/FzvZtsYMJQVK3eYYVk8LWeGLqD2LjtG7Eil+DaZ/KjyPIEyXXrkd22lW
	lqGsj8Df7NHk4dlsI9pIW+M+2/zTYHrcg0i37MBF5HB68wMJaLItwb/LlDB1UWRb
	o2Mevud5wdeiGeDGfCn396sDwt0cvLofTlHYqw+oV9bZ8166Fusm0wvmsSHWZkUr
	OGTMSe+js81iMC5gltoBY/htYHQEiyz+CCb2ZkjwR0o/jWYiP/gNxZUtovgRBJL8
	/sYRU14j8Pu7d81nDQuE7IhtyNs0I8bfCr2/oteWDUcnuwrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp6k80jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc5faecf01so11834485ad.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478491; x=1786083291; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L48ZRC/JcC83vrGc37PNdbdpkgF83Vs9H4pRoZkzLxA=;
        b=F46c2lGHjIuATlPFHbSjVwGqdUIv46w1g3yN3nQRF5nv96CIoMPqM1K1rI2AmRbtp+
         jkrn0Cnh63gPZGPftokngc2wNUM6BkhLdadmgiE+cgs+n/bUUGt0zDpxxYPeKrL83bK6
         6y/gEBeFk56WmkuusbFyK2xCW4XgWTUp4HAiv32IwDGPlh+NhvqBcs+B633JoxPDYxxi
         4Cm/Ehp8drkBq9LwWxhA/nmuf201hDPukvlrPey102D1IS9LgrY59E8VA1sZ/Qsq+Nfp
         8AB4MD6DGZn69Etq8M5HKDaTTt+y9XupWOj9XZ9BBocnP4nD8XBYg7sogz28FZ93LJ66
         DvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478491; x=1786083291;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L48ZRC/JcC83vrGc37PNdbdpkgF83Vs9H4pRoZkzLxA=;
        b=ReACUKYnfoaPq0yLdUILS/oEPpFNjv6Y1g4SVHKIGzXQeHH6JeUpFVu/p7TPTe85/l
         p5WT9owYgD+dy3BMNLfSRVcnF2xEtuGATy3NUVLyiJiK7WI2ECP25l2+//JijsZqGybF
         qXvunIBtrNgqiaVIZ0JRSFTGC192+gaEo6pPvP9UqLj96/bCAlfHg06t3D1lF8W2AK7N
         3ZmMwl0huxub0CGvtT3doNPg8/Tty98/H4vuRvQ4ts91t9N+V72YSxzkl23GNr6fe0Ba
         mNSkZjbOfL4NVupqKNK3U068xJffw18Iv34fiMDIWmXn5RqKpEcfP9lY6pdt9PNQ5gNQ
         Sj5w==
X-Forwarded-Encrypted: i=1; AHgh+RrGTdRZ74ygqCyCN0J0pGHNIcauRqU4PsOXfPXIxs1DCQa8vg7Im3v5csDuWVHsb8fnUPuYew2aFXUh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvv6+yiPNLiutmLoAVLPJuAdfv4Eg+BJLCC8CCY7+oZWy7VZ84
	Ae9fvK0OtMwspEBL6K9G4a1AC7bvAcdpRCNhwxdaoIL3gDejxHL8jFrboahNt2ka+2Po/LLENyq
	blsj7Ojj02qHbXEuSpmigCqHeK68e3r7su9rbF5SmLzRuyokkiPLceESCr5rscm3u
X-Gm-Gg: AR+sD12ejsTItkcI+0RjFTHvQ01J14CzJS7h5b6W2PcuD2Mo8o/GxQltTOHqB1CYPNn
	xDkmL0goHY2JZ3VGQezFaW4lVwZzeHW/5wsRC0aNQK8vQ4GIPNcQWd+fsaQfMt+UBf4Cgi/R3Wc
	1oLwnBRp+78Z+mvYEX0ZgBjOKCBqsj96AyG+J/DyC8l1PoiLnknGXsgKDCXOgcnOR0iMPH1fYPe
	tyba4h0rSLwPLdgbd2/gZLUHw+0chBiu/Y9gpcVoRDiWJy4AvodBoUxYGxpDs5wQt8z4tIqE1/P
	/TWNbIkTyX/HP0g2+elcje3dGiQn54t414xblo0p/nvgmCA5KMYfSy4m5QF66V+JSZOYXkQNLyj
	ZlsJVy9aK2oLjuswjyDWuqKFIQB45wm0hpjgTGKCRTGW7eHLjJ3vinS0907wc2/1z
X-Received: by 2002:a17:903:2443:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2d046dc5fb1mr8724855ad.20.1785478490712;
        Thu, 30 Jul 2026 23:14:50 -0700 (PDT)
X-Received: by 2002:a17:903:2443:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2d046dc5fb1mr8724615ad.20.1785478490292;
        Thu, 30 Jul 2026 23:14:50 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:49 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v4 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Thu, 30 Jul 2026 23:14:36 -0700
Message-Id: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEw9bGoC/3XMywrCMBCF4VcpWZuSTO+ufA9xMbnUBttGEy1K6
 bubFoRidTPwD5xvJF47oz3ZRyNxejDe2D5EuouIbLA/a2pUaAIMclbwjIqUXrDFTlgqnaJlXnF
 AlgihgITR1enaPBfweArdGH+37rX4A5+/H6r8pgZOGUXO8kpkCEVWHKz38e2BrbRdF4dDZnGAl
 QKwUSAoCagUlZIcZfVHSdZKsVGSoEAGJatRai31D2WapjfO/2E2PwEAAA==
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=2222;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=CH0nrzzERZiKDAaxkdwSWsyBt/iEhMwlQeoAjP5LHqE=;
 b=g1q5/1a0Qd5Q5sW1jW9w6fo5tlfl86NWmtpSmWiqm0XhjvEvvKneddmiXr9lzPv4qHRNUbwBd
 RttvEU0lQm4C99LZWWMaPsFd51ofeXDjYNi3Ptk9DKrTateooLjPToR
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=H/nrBeYi c=1 sm=1 tr=0 ts=6a6c3d5b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=lMHH7xqUNCQZAqxxBscA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: LSW0iaHh12LRQdd9g1J1kpA1O8YL4mMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX+hLom91ww9KR
 sOeaLvNTHPxVQCaf1CWhgL4W5jTva/q7NX+KqDW25pj8lFAH33qZGxbjQcFKh0V78kv5qnrNQzW
 RPyD8gd5+pqQbJ45NO20H0hw8iL9N/lCf/sabaw/BnI59cFiRtVVdHVUYbL9iLAGp8xsHoa4Hv5
 TtsPxiUSDuk+8Jm/nu+K5JfhAjklsoN0HkqlCHRVoQ3IWq5nTIlr28LnjY+HLuTMtzq5Wv7xfW+
 51EdpM+dr830K18nT4gg0+Xh8m4PEpBwsY9aC/MC3KtRQZd1CBqHLIOsakgm3sC17JLKwJs7Bqs
 kPuR3F3Vdr4idNpnUb3qzkNpmOnRt+SjKR6qfQ8eb2z2v7jcSCpaAX0mQCUq+Uw4b5f03q3Cdz7
 Pdk8RMcgiW1bPNYGfxwgcKMYeOMoORpEa4ivqC8P4i6zYccDP9OAAtF+XDktr/JS6KWkJ7p7Ckp
 k+8cewir54DcWDer9cg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX3928vtfVyD/u
 p0V2Xsv7Y2QaieqXs0SWBSCBJsfi5e7c+AwZj36lLdDkJ5tVKMOhaPaEfcTCgHIWBn66ucmKInv
 DW4DcfnDKifASLcXM/H72HIS9SXbK+U=
X-Proofpoint-ORIG-GUID: LSW0iaHh12LRQdd9g1J1kpA1O8YL4mMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310040

Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
removed,leaving only cluster 1 present.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees. It also adds the Kalambo
compatible to the UBWC configuration table and allowlists the Kalambo
CRD for QSEECOM to enable access to efivars.

---
Changes in v4:
- Split PDC range <108 619 22> into <108 619 1> and <111 622 19> to skip
  unconnected pins 109 and 110 on Kalambo. All other PDC ranges match Glymur.
- Rebased on next-20260729.
- Link to v3: https://patch.msgid.link/20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com

Changes in v3:
- Delete and redefine the whole cpu-map via the /cpus label.
- pdp0_mbox: one reg entry per line and use '0x0' instead of '0'.
- Rebased on next-20260726.
- Picked up R-b tags.
- Link to v2: https://patch.msgid.link/20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com

Changes in v2:
- Fix the cpu-map and SCMI perf domain for the single cluster.
- Give the SCP shared-memory window its own IMEM section.
- Rebased on next-20260721.
- Picked up R-b tags.
- Link to v1: https://patch.msgid.link/20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 ++
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            |   4 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts        |  21 +++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi           | 112 ++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |   1 +
 drivers/soc/qcom/ubwc_config.c                  |   1 +
 7 files changed, 143 insertions(+), 2 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

