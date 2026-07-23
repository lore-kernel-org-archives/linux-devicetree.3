Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241D48C8D2
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808937; cv=none; b=nf6LLCD6XbAQo7g6q/PWozz+2uSwa8sb5BDRDCH5celJy2kINj0Thzhp8fu4p0bD8FnLyr0WrqPGVeu/JVOJ5VBoB2/4I2lwDTeFsfOp4M0px3slC7/9fxdRL3Sf5Aklj+d2aWOoKLLh27Gr/T6gsIE02BSBpxFwnihX2ZagozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808937; c=relaxed/simple;
	bh=/z8npaoA6YiCb+grXm3QRXMvFdaWGWBDcYP3MmgE/n0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iAjNsQxiZjtIWBjiagodSohxTqL8f06XIln2j1IImHpcXoTuPQbQYvVGhFi37OUYzeP2tZRcMgejomA3N4ya0+KzKveScRnmnbUf448v7XSIhldjnOFKE9wPCjQQCpFmgdZszzQsuZjsof6BcWx0awXr00AcMZpjozNsmosjR1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0K1gG4U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsumpF8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0K1gG4U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsumpF8C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qbsn3668067
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+d6SdiBzSWqYtulPu39oG2ohASpxLlXWSLy
	0Wn3Fz/o=; b=g0K1gG4U0jtcmkP/RD3QMb8lKtm6Echjw6QWjJuzrF/KEmM+I0m
	vRj97PM3p2/NfFJ+OQZkFcZCNi6en9Hc0qYArd5JM9SgD4d2CxFJzv4yj8JslF6/
	nKU0u/p1H9sf7hkTve6aXocZGgNUxxKAfV9itTklVIpBsJqSZ/hVsA8EXMcStOEu
	Gtuz/bkH5ytFWpBfPLmZQyMFUESMUQR7h2eKZLIWTdy5Wc7mxAZGmehTK2wfGkYG
	klW688N21PnPHNm2lHdqJ1PQXB14BYJjUXGyIizpaB5X66uki3SFHe9dQEAgH4OG
	vDab8SSHrWiw00oTI13q3TgpvV/MeHa6vsw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc34s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:15:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8488ac68185so1771766b3a.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784808931; x=1785413731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+d6SdiBzSWqYtulPu39oG2ohASpxLlXWSLy0Wn3Fz/o=;
        b=VsumpF8CAQfAnpBqCxVOfFme+B0DlFT8LON/yfNWls+t6snohSyhl0KCok/VRdfjSN
         PaxNme051zKf114OnAkJQwtnRqWr0VbiwR54yZECzitTUg1EM9md3bL7+++xkjqqFPNa
         yKXQFmSY4QuawVSnZvTYyygD1ggEWwQ3phLS4iHj8cU3ccBEbRC4zGj+See+QtV/MKzH
         oCSpi4KqoAhuki/kATbVBOulxOpTci1PP22qOjJW6AWesnR/bHaKAfEl3H00b2fF+dJI
         uB1XPWVMRsGYtI3ahlfrZpJX90fr+PxOrpLL67TfaUsNzfP9iPV/o6CCpKhfuoLRG/iA
         C/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808931; x=1785413731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+d6SdiBzSWqYtulPu39oG2ohASpxLlXWSLy0Wn3Fz/o=;
        b=gWSQZ8p1QOK3Sb+h6iU5YMx8ZkfcWUwm/MQ9ui1XrBXiH7wbuQHeCqfMMizk/sc+0l
         3chYhOPfeos8bdOdSoD03Zomp2KBnntltc/KEeCNiuJAsq/b5KGtOsC9LzE/o4C4kH2Q
         4uO7/ctIXs3/KPn5JnGRZc7tcB4b0KWh60NiXkQYqr2zMn2WZRVpCApg+Rxe9leCQ4EM
         V28LiiMgM76aC/lN0S+qoPmTtJcs/x1N3Cei0/Y99zyu3qH+sCQwUVZZ+9wFpkZbXcDt
         BLXX1oqAA2DWufaW0dhPzq7lOCat/KQb9Dz3scjetj8rUW3pwNjdC5EFOos4+XKjG3p6
         b7IA==
X-Forwarded-Encrypted: i=1; AHgh+RqCUCdqj/JUUmbjexGTALyBJVcg/ZOUK+by5jlGakeyR7CDsWoSGBbpDML2wHGf1WLxpvJE4GMbQoNG@vger.kernel.org
X-Gm-Message-State: AOJu0YwYmHfDK+K95GtJCKzA+Eh0rxwLW/9QVK1weJkpQO/a0u+Tg5G7
	Fk/FBYoe6u7Ssu2wnChpj0BUndC3Xkwr7eE1Eh8VN5mwcqr8GVKS3XMwco+zBSFls48olV/nguw
	1J6FY3lrBl0tlu+hbd7yuF6LYkCHC9hmuyHbHB7Uf7JpSTU/oyv3DxNUxZZjVSHLJ
X-Gm-Gg: AR+sD11Mrg2C6YlWwihUxZ3WuGJW6AuDSfK4hGZ6dqiVhrBjcLfQotC6Fg3D014epzx
	AgTkgFrupM4vfcyoDrSgk5+y9bU2EEhig1+QK/6pzCDweV95POivfkMj1WjgNq3K7JOcTu9As+n
	+MzsQ+8R/80Gx+mYLNaZL4dNAdWrcZM5mDsWu0ych7e7kd8BKGiDV0AZtHpf8/KNKzjM97Oh77/
	5UKmGDxO8CotEsjxcIE0T3gewr9Yye4uhJpKIElca2S+zhNgmqGjoxYL1c6IxeVEwjvJRqSBokT
	hoHaw0MmX1/DANr0Fk1Ra1z9Zf9cgiyh5znbIQ6d7DuZtfz31cEp4s3gIgV+zp0oh36EZO6kbDm
	Qm3q1ttlSsw6agxpErCAEzJTYq1yNPQ==
X-Received: by 2002:a05:6a00:1913:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84e2b7e5dcfmr3345423b3a.3.1784808930500;
        Thu, 23 Jul 2026 05:15:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1913:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84e2b7e5dcfmr3345342b3a.3.1784808929740;
        Thu, 23 Jul 2026 05:15:29 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm2687005a12.26.2026.07.23.05.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:15:29 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v3 0/2] arm64: dts: qcom: eliza: Add audio support
Date: Thu, 23 Jul 2026 17:45:14 +0530
Message-Id: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GeFptGe98pXJxR-6PTh4hKnhSatilCt6
X-Proofpoint-GUID: GeFptGe98pXJxR-6PTh4hKnhSatilCt6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMCBTYWx0ZWRfX+kDsttdCo1nT
 etMVjen4mk0JlDmRmJ1RJcXATRMAcCOgb5YrFT+7N2qV91PUE+d71fqQ2TTz/gTn6RiXjvTlo6s
 ja8JoSxdoqcazR7cwlM8PkhivZZAUA4=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a6205e3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xOjjz3j2L1Nf2p3RO_AA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMCBTYWx0ZWRfX/J88ky3cdzbW
 g9Nc0p7wtveP93acHML2dp9uhigaKTFaDif8wXh2Esr7dg8iqiviIcFoRUtj4TwpagADAAt4ozB
 EuqIqBk4AWgbaQ6T68ZtwTpspb6frTZnRlQ7MMliGKX4HU3ww20Ia5FoIYMJgh36ezuYhVcXNiR
 iAj9HElTN1cp6G2BQcTXXiBjbP3Od5gq4GyTGrRXAkdjERHlV288ZZS670/AlsMN195nDNJCx9i
 4o3llVJH+3Jth4nDAyB9SzX3VO2tAn414oY6v8ImqMV5lWXFei6CtejEEJywq5o74a3e5xRSOMO
 yPjtQVQcFdKjnAiI0EpP61GL+C6YQY+9llvkmt/BWdLh8K6I5MsNrqOgiAdiTl6MJQ3dyfOQlAW
 mPgW3WoXHWWnBtw0eHk3CbMgbs9ahaJ7cNOJm5MaJJux1Rq6H7OlbDH31dN3zQ7SWwUnLmEOxKM
 cagc2KU1AP+sLhJv0FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230120

Add audio support for the Qualcomm Eliza SoC and CQS EVK board.

Patch 1 adds SoC-level LPASS WSA macro, VA macro, SoundWire controller
and LPASS LPI pin controller nodes to eliza.dtsi, along with DMIC and
WSA SoundWire pinctrl states. The macro and SoundWire nodes are kept
disabled so board DTS files can selectively enable and configure them.

Patch 2 enables the sound card on the Eliza CQS EVK platform, including
the WSA8845 external speaker path and DMIC capture via VA macro, along
with the required LPASS macro and SoundWire configurations.

Build Dependency:
This series depends on the following patch which must be applied first,
as it introduces the q6prmcc clock controller node referenced by the
LPASS macro nodes added here:
arm64: dts: qcom: eliza: Describe the ADSP GPR node
https://lore.kernel.org/all/20260716-dts-qcom-eliza-add-gpr-v2-1-9646c57fa513@oss.qualcomm.com/ - Reviewed

Changes in v3 (suggested by Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>):
- Added missing blank line before lpass_lpiaon_noc node in eliza.dtsi
- Fixed codec/cpu sub-node ordering in va-dai-link and wsa-dai-link
- Reordered &label references alphabetically in eliza-cqs-evk.dts
- Removed regulator-boot-on from dmic_eldo fixed regulator
- Removed output-low from spkr_1_sd_n_active and spkr_2_sd_n_active TLMM pinconf states
- Link to v2: https://lore.kernel.org/all/20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com/

Changes in v2:
- Fix node ordering in eliza.dtsi, lpass_wsamacro and swr0 nodes must
  come before lpass_lpiaon_noc to maintain ascending address order
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Replace gpio-hog with gpio property in regulator-fixed node so the
  regulator core controls PM7550 GPIO8 directly
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Move status = "okay" to last property in all override nodes
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Link to v1: https://lore.kernel.org/all/20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
  arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with
    WSA8845 and DMIC

 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 147 ++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi        | 193 +++++++++++++++++++++
 2 files changed, 340 insertions(+)


base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
prerequisite-patch-id: 84282f8a368672c3f0f8944c442c71713cfd7390
-- 
2.34.1

