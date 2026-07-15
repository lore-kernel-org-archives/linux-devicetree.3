Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DA2389472
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101365; cv=none; b=BrXk8D105kxAqUHln7EJvkkzerJLSv0CM+EnYNIkY19pcEOGIoZydnBr3BRf9g+QXjdtMW4Y+iKi+Y8O35tNGuH+xh2AaUZ7VR5UGaYjZcg1htSORfwHCikkUGsfvMuuUqowvuioxkw1LlfvyYjMZQaW5SHzcekJayNkQl5I1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101365; c=relaxed/simple;
	bh=9oH+Vjr1g1U59AVkJn5l7M12ohmJl2e6vcFjAWLVw/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bGnUKWIhyF/uDOIfgmmsSfFzPJe6H3N5b1CYz6H1vF5fSNB9kLGGr4Gc/XQQafo4rHIrrBL6WkVf41Z4kNnOU7kdd7WFeIc8b2R6y3EmTYlk0Ehx9IqTUoEPGxE1/n4+t9IiD7iWwbDcDQzk23BG8PSFAGTbMnee/eBm32ELto4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IELsDjao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjKcm9iw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IELsDjao";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjKcm9iw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F6hXf02796462
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XRJYKP2BClcZKgSVOR9a78
	XzTsM1xElWRlbCfoWXGk0=; b=IELsDjao8l6hth97ASykS/XpQE1wCnsIBzndJv
	q7pBTVAQ7EgWnPRc7dqBoO8G8IpHWYWqG+LtNwJmsxL/WWAIo4KqNazo6ai6Wc4j
	JPEpM/dT/v6XaLnArqZTyN0n7PETJJ3oqJy836A5F8SlZDjug8TMmLhPmU0MXk2/
	ERwgsx8+ry/eZfTdxYfQ5IbiBUmzZ32Tw6T+JH/JkdcL3q5Wnfqx8CYDlX/gT6A7
	GZL65bo9l1OPd/CehjbQnbBbK3PSwUszNS/HblhABdZUXXTmCD8TEcVeeeiNmYS/
	W/N4LjxaqiB9XHhEO1FaRZtc5jv7imB/HGTH/jJwSSgLMSMw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h878j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1754969a12.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101363; x=1784706163; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XRJYKP2BClcZKgSVOR9a78XzTsM1xElWRlbCfoWXGk0=;
        b=EjKcm9iwKhj02pDV6aC/AwT8I0ibuhr0IoYiU0BRwoTKKYd3IZxCjRwg8d7otDLJyk
         lih8u+sokFzw8cInEKuev9SGKEAsSsiwjvvJg4faBB8MVSDy23LEmeAm4/S4feRLO2P+
         WufBRnLR+E6tPdqOnUwItaHjE40HEw/d56eXMIvEGUxbp5afi4dxaidj5rw6+FLeSM0F
         5kn+Hbgsvo3zuLrW8D2dhe0W2gKKNfIpXcMm21Us/zaXPJu/zeTAlKIWxZTrEyNYN7UB
         VPKi2QvF2ga6r7kpLPojQF7O952JLBGT5JfaxhCMtmN8WpWI3FEsj1Dx8pNIAxo4mrHg
         OK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101363; x=1784706163;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XRJYKP2BClcZKgSVOR9a78XzTsM1xElWRlbCfoWXGk0=;
        b=m6Yhfhp661an+Luamys9HRJSzh1UVE8A4EIT74qzVCPi4yDX/mKJxfOdqo9whvKq0l
         LLl9/xag025pQ032BvGGjJYIDh5+KhpkwORRrPFtmwd/SEZLci62bGPbvypENm2/mKxK
         tBAryYkzHU3NkcJYwL6HaHvFteTpdQH+Cy5lDM51R80CgU76OLyUlNtiz2xLNybE/0r/
         eWkL79ZjAqoGYvM8DyvJbm6atBqj8Z3GAtsyGBA31WaKvFDwdVXJ9yw3a3AOjbFNsIna
         TJmQeD3hlIlSGQQOJvRrC8FQ3lurcT1MUqEdbUhvbEGDIpRcaLJBHuH7DXt+pGfGqEz6
         zRnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCNTBUKUXQootoqk4EvMrx0nqjg/7n7EnrluKpUNnVvq8r+kELaxP8GYWYqI0MoSQBJ56d/PgSBRkw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/fg+tSluHv4BJSwgLyJiYbyhL+11izua7iolISipbdBvWUKy
	j/70KY0UpDwU+5AIxuVSCa8X57CfTlZIlkyoBptX7I0LuJcNhVjFJGuu9Kjt/sMtHLshDNdm3td
	yIFvtT1u6YgqH9RA/OYBS0Dwxvd1+VWDrkxwdbpnv0zov0038TDEXerpnRQ+6ihnX
X-Gm-Gg: AfdE7cnSh0EPFScvv5VBxnZnfBcmjmhjIy6xVztCkKwXJfA/bWOhhA2F1eZCpHDaWSC
	btEz1uzg/Aughi3hN+M4bb5G+5VBFEAH/TtjsC0nOvtKSgiynPLZEM61fiQWO6PdnuNOPl4K3rS
	CdWFayZUBQlLP1HtOVsvMWZPgmkyoz89WFOAupOXmF/gcG13csF5nBP/ZCWL/HT9IzOb13v8A21
	u3+14ITD+/9YhrNVJtMtLx4F9fMLhtwIx+YZvgUoZUG4pHyvqwJIRXBEEWtk/VON7m/xg0YhvH0
	IDVzYtjR/H6rPTFDN8YzyATROhKjDYwEaUAW46cgc4RuQzeyjyYX4iLPVKnVZZb1dmm/CsPdmrF
	SP88d9iWFLeonfhTwFYwF5dHQJH7T7A==
X-Received: by 2002:a05:6a20:6a25:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3c11063c389mr18411410637.22.1784101362877;
        Wed, 15 Jul 2026 00:42:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a25:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3c11063c389mr18411387637.22.1784101362380;
        Wed, 15 Jul 2026 00:42:42 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm10921751a12.2.2026.07.15.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:42:41 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra platforms
Date: Wed, 15 Jul 2026 13:12:20 +0530
Message-Id: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANw5V2oC/33OwW7CMAwG4FdBORPkNm1Sdtp7TBNKE2cNUFLit
 gKhvvtShgSHjoul37I/+8YIo0diH6sbizh68uGUQrFeMdPo0w9yb1NmOeQSZCY4Nf4Q9U5bs6O
 h60LsOYDayhKwVtKwtNhFdP5yR7++/zIN9R5NP0uPiYjnIV3rn2ONpz7E6/2VMZu7b6+OGQdeK
 luiNMoVyn4Gos150EcT2naTCpvVMX9KCraLUp6kylotKqdqJ/6TxIuUwaIkkmStqQpwRoOGBWm
 apl8h112FdgEAAA==
X-Change-ID: 20260613-shikra_adc_support-0079650eb76c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784101358; l=2403;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=9oH+Vjr1g1U59AVkJn5l7M12ohmJl2e6vcFjAWLVw/A=;
 b=QzLvuvD9GgQG+dj9BeW/MTl4QA1BDPA2oNGyiDpQxlsDeAlqAluw5NsPVolsSX+Ha8PxFLSSR
 dJz5PBGPnahCswTrtazUFUBzYtyksy80Id+5ICe8TCQq16BY/6QkG2L
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX9BrDHuvvfaM2
 SVi1ZNukk9TsSJKVy/CGMRrwWzU7bwqn11GtoQXRHOZQf0sPLnggax/bZLbwqUVzSFkWKtVcAmx
 0zL1WWqYfnTU324jPdbsXRwwh1XzMwg=
X-Proofpoint-ORIG-GUID: MmWbVQmkwCh4Fv9XPOcuoubWl2qrhcIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX45RnaZw12o/s
 RxakJy73eFzQ5TUeubyPf3uTGrhyRoQ/UeTek3/Ca0wTWZAgK4UrdIQlW0iE6QD9iX2eRlG+UTJ
 pVw2TYHxmc7mAw+nk4zsEcR1Ope277tiQrUIsyLBtaQNbtdSFb0e8189+bXuSCsjc7CQERfAno+
 GlXm1Y6YgRXkHrl2vxDMypm5x6ux5KifKJQSQQ6vTs5CS+Loe5CMfDhLJfswIkasGSPTPXHQpkE
 JujblhWWOvPRdip6fKXMNFwJC22PcE6+z7BJAeju42OJwoFhPY4XfMcEOAnhb4xy5NppGmehtE+
 4ZTfZRe7utVtXCVf2rVT6bAbb959KvxQ5jGm2BYI5A6046uH4pV/7YvfG/ocySaOfcIYqMS9vCd
 5BqS3v4HQNa2g+P8gVXWcJtIfY5MGfj3dIVE+6B9vta8ZbsPxiT3jB2Rf4NwRAhLTMzzBrh5UiS
 2FYc3emazsBz74Ug78A==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a5739f3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ehwq6YvRiQ2Q07RnrmwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: MmWbVQmkwCh4Fv9XPOcuoubWl2qrhcIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150072

This series adds the following:
- VADC and temp-alarm devices for PM4125 and temp-alarm device for PM8005
  which are used for thermal mitigation on Shikra CQ2390M SoM platform
- ADC thermistor channels and thermal configurations for same on Shikra CQ2390M SoM
- ADC thermistor channels and their thermal configurations on Shikra IQ2390S SoM

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v4:
- Collected Reviewed-by tags.
- Updated the pm8005-thermal trips to hot and critical.
- Link to v3: https://patch.msgid.link/20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com

Changes in v3:
- Dropping the polling-delay = <0> property from all thermal-zones as suggested by Konrad.
- Link to v2: https://patch.msgid.link/20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com

Changes in v2:
- Move thermal zones to their respective PMIC files (PM4125, PM8005) as suggested by Dmitry Baryshkov
- Rename generic-adc-thermal bridge nodes to therm-bridge suffix (msm-therm-bridge, pa-therm-bridge,
  quiet-therm-bridge) as suggested by Dmitry Baryshkov
- Update commit messages accordingly
- Link to v1: https://patch.msgid.link/20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Jishnu Prakash (4):
      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

 arch/arm64/boot/dts/qcom/pm4125.dtsi         | 104 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8005.dtsi         |  35 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++
 4 files changed, 372 insertions(+)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260613-shikra_adc_support-0079650eb76c

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

