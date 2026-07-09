Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331D33EB0FD
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584887; cv=none; b=TmGwjFylwB+Yo18N0beqYaGprXZZEKep1jRTcJI10+MmTuGCLpt2/VUmC84MOJVrQ1gdj6JfYFZn2fmUgfpfIRekXQ7eLAZehdBi6YslcFyZn6qWzyG7UCMG/yHa8Rz7k98bho38WHiE2JxuvMEXt9yyE/ICV7K31oHtENFy/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584887; c=relaxed/simple;
	bh=zvciAFc7zGmenBektFaPTFt1v3hjHI30sgPTkSx/+dw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PJxXJUnnMW+89BLLv4mH4pwCW9uJdmHz+LWhvR5xjQbmJZ2KoL1vkUVoNU+VDzwYbchl4JJ4G2jb/eRC/DFljSa3bX7Tilo8GdVisAg8p90IPkh3LuQMHXqS3l2skeCiFn2s9ksCoicb9JloXrZ60sUTKQyimR0CALtjz2s+6EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UV/Q4jCu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4+itO4C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UV/Q4jCu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4+itO4C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GAE932035
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z368sD9KFTlPEyAbPdMh2t
	NJuAxC6h2ddGcPFGa9uM4=; b=UV/Q4jCuxkrsDSyTyZ11z2PKsIf7Zv1r+Wy5V9
	S1ASVMSVQd26OdvPTa4DKfg+nbEo3GStXsy6V/sKraedGmoSX6DEBfylfT25AYnS
	zBUzHfGDnsSWvHAVI+lx4+WYkLeeiEL445iggyYKljZsyWavOJeSQzc2+hDb+mul
	ldDgKQ4sZwBggS2Xf8Y3gFMgWnIW2wAYqbiFzuYnD6JT4ZLmT3wg5QhZA0H51BBa
	1xLg5FxbNlJeKTAfxnGXnf42u31wvChnDb0bE3s6nDGDooKieu2IJc5rziow0XEA
	DuaPr5oCkrWRMSCvQv95wEFe/tB2LaHhFXBqz5kXjmIkQw2Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsb4us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:14:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso2563979a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584881; x=1784189681; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z368sD9KFTlPEyAbPdMh2tNJuAxC6h2ddGcPFGa9uM4=;
        b=N4+itO4CHSAOf+I+lM3uVuh+K0/gu9/oOzYinmqTNN3mIEAG4aa2wN3Bzy4cgHDVa3
         6YRNFQXa1hhhqg4AQHJ1tjQwTK/TqYbDig7vZsVm8wFRKRBv4EbOPaF90zvMQZNTVcVR
         1ZH3n65VQb22UBdaUMlDZ3ERntDMBwVPOXbqzwbfWhph5R5wgm3q0rzRNzSmZOlekleu
         YlHGlRsViShSddqBfEFu8AWk0t/ZIJeZUq+0ZbNM5PfWkhcgeQARgjnrvEqyGkgGDMNg
         Ut26hNYCWqmiJThe1v7UztekvXc5FebBJEcFTi3bKgVpmmbkBNAe/w3EPTlerCrk02U8
         HRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584881; x=1784189681;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z368sD9KFTlPEyAbPdMh2tNJuAxC6h2ddGcPFGa9uM4=;
        b=Rgx+6y21/EsfI40nKg238Gwb369K9cItPMjzisSLz/ugi3Rq+bMpymnVJ2ldkASUHL
         +vwSOwInju++oT4s0xt3JJupdJ0hZCTfULl+9HPETTacsci9ALIksBSNAUoV6KXTXJfH
         uI8IqVVpHuD2MN3ea68g6/xJI3kzUFTQYpzmpxDNm7gDjWJafRWv/x7IKGUjWX/jEEQJ
         xANFelUtQJmVueDNcf1gBg4wlbOcCRK+j8XfhyeKB9XR1MqrWIwHCpjnE/2fe2PunCF9
         bpqPqdXPqkEAL2HL2sqQTI/G8Ct1H0fhtUZT7VueeUMMpHpZmm0bz+qv0EvySzAe67ds
         /ojA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2+NR53b4s0aeuNtH++IKB9u9dJ87wul/zr066zB3A5Hys08YynEAuMavbz6x8pyq3vHBMrxKoPf34@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+AAr7j9rTWTnrOUQD5KZxn9sGoNeG/Fd29oO1nUqe92ldYpr
	VmSE9wMOkgGzBhN5f1hi5T6EcGkW2b0tl+JiDSp77mlrSug7kQ473P3LI3tf0pLfFhYwQK0m+cb
	i3SiHpNiA2oQSfTzFmxyg1yQIl2N8n/O8EPj4LUEjfqhUwF1pI2lmGEFEZhPJtvNy
X-Gm-Gg: AfdE7cnzmE3Inq/BZxvke/4sxMgEaLEIwTvLLv32ll6G69PWBNnSUEqlOe0oM8BDJAh
	HTNWFvCea9n9zibq3CklSfXO2DZ2sqwzdg4O9N+yVWLKxFjDM5qCzZJgJ9Tx4yMkH0zugdsbFZE
	nxXugKxXgJa856nqeAVxGSxkRAbvpcE2LBke9wWCILV9kLss8iFsdvPbFN88zYbLrgC1limREnL
	Wgv04aajnubJdMoG7SNzxoSf5B/+U/Gyud9fxp9pIM5re3ttD31peMMl4rpxukE9Bm9qJ4hqkGk
	05e1nnrIx5/utguCuieV6wVIuCwl33tYlClNeP72rszkYEKA6AqgH5hI9/7MDThbJCUy7xKBilB
	64mAyA7VWVtwLRHpkduVroiG8R/Rj7AcklHdi3Gy+IWjwVGL+YmXRLWyRHzygIA==
X-Received: by 2002:a05:6a21:4d8e:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c0bca47d59mr7274035637.31.1783584880998;
        Thu, 09 Jul 2026 01:14:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8e:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c0bca47d59mr7274004637.31.1783584880558;
        Thu, 09 Jul 2026 01:14:40 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162d3csm3392290a12.18.2026.07.09.01.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:14:40 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: kaanapali: Add SoCCP
Date: Thu, 09 Jul 2026 01:14:22 -0700
Message-Id: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9YT2oC/1WNwQ6CMBBEf4Xs2SWlJBU8+R+GQ1kWadQWu0g0h
 H+34MnLJC+ZebOAcHQscMoWiDw7ccEn0IcMaLD+yui6xKCVNuqoarz5ESUQjdhNaKnrq564Kpg
 gTcbIvXvvukuTuLXC2EbradgkSVBttcHJFOJnP52Lrfzzl9r8++cCFVqjSFsuDdftOYjkz5e9U
 3g88hTQrOv6BfTvYkvGAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783584879; l=1109;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=zvciAFc7zGmenBektFaPTFt1v3hjHI30sgPTkSx/+dw=;
 b=pTcbPDudSGizHITiTMJdngN1fNrfCnjXt+aCJ9yv9ttjDUes//u8P2z1XOme/ZRj2ofwFcpo8
 D7MyH2Km1tOBx+nFU82lB6s5MvQbzIKqQ/2Hxhn7cdnuqvEtQA0wYSK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX5/6gGxyMrn2l
 qrV/qECRofxhHA6WSsiv+g9p6EPauZfYlTk55VS2iOIXL4TtCnvlPNkBSTjNEfoqjHVVtvAF37r
 X+nELvg/Y/vowDnA6j+2TDvixRGE2fg=
X-Proofpoint-GUID: Po6Sv1rGirgD0o-OwVkGWCYnGsaZwWPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX0+kti+Sirrob
 fHbZu2Wkc4ihnPOh010UN95CuQ+lVQkADwTWuQoA6YeoH+JLlGgkGyfo6glraUwSoNsvnspUNKF
 KQD5f17SAfDNdrFyorUbLyo10VeIYm8QDSb05VheYQuzWX8MuCL+5ZoRzuVvz0RRsVKJ92YNyMH
 SFpH2i7xAmtAVj1IjmGYjDJahHTR6tuEASQqfaJyhfb5RvuQZAgF+z5x4A71VsDb14IWR3lV0Or
 2tEGlcc65I3VpSzIv4Y9jsA89a/HTGE4QEpBl8QeeZ6xnh38c1NqXkfG+idkC6vni+qv/PrQ1aE
 glCQiD8mszNU33kcSsprrcnIMhNkuFMta2S6p/Pfg+dMBy4lwSAQO/m6mvNjGMy/S9zUcBV4cwz
 Jxb0RT4affEertt4oix5PFm4LuN6jOKCxiGNSpaTJb0yqA+IKRLA2HIIpcbqwhef5x0s6gUtwio
 vx0Aui9HJP6fCbIowXg==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f5871 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d-gixd6huE7ca5b8DIIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Po6Sv1rGirgD0o-OwVkGWCYnGsaZwWPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090077

Add device tree support for SoCCP on Kaanapali platform. The SoC Control
Processor (SoCCP) is small RISC-V MCU that controls USB Type-C, battery
charging and various other functions on Qualcomm SoCs. On Kaanapali,
SoCCP is brought up by bootloader by default.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- update commit msg and remove status "okay"
- update node name
- Link to v1: https://lore.kernel.org/r/20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com

---
Jingyi Wang (3):
      arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
      arm64: dts: qcom: kaanapali-mtp: Add SoCCP node

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  5 +++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |  5 +++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 70 ++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-knp-soccp-dt-acdf8fce81ec

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

