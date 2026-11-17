Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902774;
	b=tWMLF7qlUy6vVD8bjk+F3DrJ8oIU1P/tT70UQkyKlk9qnIM2XPKrwxWp5V2jrRDWNrii
	 ellhGYbgVgAux4MkJnHDhjTJUVMHIa5sY9SGPbKQnnOdWYwLVnosTwee3RZqXKl/IIzYf
	 d40TJ5S3zSkKKhxy+9REh31zLOorfSrKkMdlvmnIGCorgDCHOcl7odKhTulnHQCZ90562
	 DbLfzCP3wG0QItQScYJvBmcH+pJ47oA/SqAG7dHIcSj4JjmUC/ytcSghf21NPxmnE7atl
	 0jDW+EJidPiULl2fhEv5CJJcbPGAIFlKw3DfZMAWSoHhCvGpvGTIZMUqk71qX4TBlRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mVcOkG+Qth7GKhJ8Mk0hUwlGyNCJIJbF2gvOpjE4GUg=;
	b=hI/ptjMYSWj3EgqJkrZ0Yn6pJBvMKrK4fp2dMSCngIxgyw9nbln7R5TgOZypsTgCB9HT
	 4uMMh0low7NN4b/cJLZSYHu4lj37QdT06WcCKzyGykAZlswuoamiNSJDEcm/tmYo4Y2rP
	 Cc6dwz5RuoKl+CGbp9ezbXmMgQdKpdieQfmSWt+OPZGTjEiiHdVfLvsje84GhD+1IZEPP
	 dPOo4Hu+Bx57LfxviylVALlTXI38lc5hI6/Dap0Agd6MZO9gD6/R/s3YeRsv/VcW7siFZ
	 ezygot3736Wl5oE48C9zOIoTI8aqbwgZ1pRLkece/WoqHZ6xJBiHIOQFWSjEg/IDw2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oEMJRfOb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WlxBCLdY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED2606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30ED2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oEMJRfOb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WlxBCLdY
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2adLC844530
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mVcOkG+Qth7GKhJ8Mk0hUw
	lGyNCJIJbF2gvOpjE4GUg=; b=oEMJRfObhBzFn5m7B8CgyoEUV2Ym40fnfo83Kb
	Z+4MWbiicroFDuzvdQ5k1BoM2U5IV9FpRhr0v0QICDzdHFh3SkHkMP+zoA3Dwf47
	jVkk6VOUdP+QBa4CqIlVOoNHdZ2VxX9r6MGw+/BdII9uBtTmzzU0OsFkr3SZUIsi
	agyZ8lABLgy33Ah5Rrk47bEzzD4lkFfdqOfj0M02vzp4tgHVPljh+Dh4qiUtv2jR
	CbTNw+PCsqnJl0IMGvealZaSz0s+IyiuL2j0dtxe3NFPaavDwy7/bqXlnNMNEnJG
	1RXUuXVhMWM8529RbWI1QLwceFPZPZij3PoD5IkAy2ppKS5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h1fd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:06:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so4213861a91.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794902772; x=1795507572; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mVcOkG+Qth7GKhJ8Mk0hUwlGyNCJIJbF2gvOpjE4GUg=;
        b=WlxBCLdYpMJj6XpfXHbjeESup12LRA2XCBNs/551jmKsaHd7gNKHaYEAOR9Jdxc7ok
         hKIov0MQEzMxPSO8v0fOvYrX68JNNFuwLlPGTyE9m/CI6MhOl26Xq4V9NY6U+CQrGQmE
         7XJxhAYQp6s8ZDBEczCwyDN9pmL3fx3OAAFLJAq5FwdZVXRhFZyxVpAHx/KCF/zjhKzD
         23WZNiKpm6uaJoiijA5yWZoq3acqitdaR3Z4HGUSxrg/MgJ8+XgHBXnLz7NN9bJ9v2rB
         AMlsqpPF4a43sqMcPn8AbxvCRB+K2vFNU2tu8Qr5kPGskxkGAQ0BpCqXyuLX52lqEjFR
         j4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794902772; x=1795507572;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mVcOkG+Qth7GKhJ8Mk0hUwlGyNCJIJbF2gvOpjE4GUg=;
        b=xf/JUHgFHBFDMCu+yGpSi9jPokL1loTorBKKV+RywmdKLScjGlFRtjgribzlQkbLUz
         pwjEBCeNd9YgVTeceGfGH3cRWEliOAXqI7uiDtmptwt/h8d5mhhfaC7SR2qu4DuQ2922
         3flO8IvePxlOSrC/5AkrO9VWN6yNpNyE8V7EUi5rVbua+a3etq95FgsatwxbH/3xS0fP
         EcWLfpyOrc/Ga1oxB2YapKuoi+07Cfe0bs506R/DAAUfG/akHuRhfDLkhEUDK8e29Wdt
         U76YHPC3qdxLKjhFm+sKCORE4YG5OWNhOs6dmWZzjgxgyXUPtillwJSKBh6NMdUYY+3Q
         95Wg==
X-Forwarded-Encrypted: i=1; AL+hErGTqjeFPWE+DQxtvIh0ZkDfPUf6vpVM7I5NOF0n7KwlZjKtdDnwDePnRbkUxvkIHdhf2piypRj7N3ZJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+r02duVNXRe69j2/+sCTbtBgf7Xjk8mnhziqKP3Xn9v5ZQgvDJ
	HLkPCaSNN76BoSvXnOuVGZaLtt9iE1KInh6JRrmmr36hidjTNroRedwfF9iLENNhRb7mKxYxfgI
	AtORMKKQLIxtrJdEK3I+wJP9MBut6lvOCLhwYnByKIGU5LX8/K6l45kUSeWbvqhm5
X-Gm-Gg: AZFdTZcxVZY8dijqJFsDTRqA3L1fNWknOpWiQBvBtHN6SGNlPAaZcDCTvZCz5cLU3KW
	yal2fll9Y+EA2MlhLOR+SMYuVBDQnMucBOZgdwXg43byViqCOqFIgCsbF5T/IL86PxqdhwF45Wo
	VNI7U0ti8VdVadqgiY5QM8FXe+66kgAQ02ket6dEEEPdq8Y+bxq6GRlw3xElkIUJumh/SwjUUIp
	CJ019iYP0wSH9li8wqgeBv2u+vOjKRBTnLIt+NBCIUr/0Udnji1z+6ow2tVAMzYIE9CkMbaHBC5
	XKPCmo+X9RUmuO1mjAhKYLqxI5ERFVJCMytjd+91XCIc3CgXBwRV3FCQGZi/kqJ2EfPXB1rXx0B
	hRweWrmhLzjn/yzt0TA3djP8fMCcNqe/egvIf20aiTbN6J7NOKopbUGdDLTGpjZbptdp1ZD4r9q
	COymAN4CYQZw==
X-Received: by 2002:a17:90b:570d:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b1b0a20ad3mr10000460a91.33.1794902771856;
        Tue, 17 Nov 2026 00:06:11 -0800 (PST)
X-Received: by 2002:a17:90b:570d:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b1b0a20ad3mr10000429a91.33.1794902771289;
        Tue, 17 Nov 2026 00:06:11 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abebf1aesm3031852a91.16.2026.11.17.00.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:06:10 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:35:50 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
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
Message-Id: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN0K/GoC/x3MTQqAIBBA4avErBtIjaKuEi3CxpqFGiP0Q3j3p
 OW3eO+FRMKUYKxeEDo5cQwFqq7A7kvYCHktBt3oTinVoxwePfkoD4YY8LJoB7N0zhlqjYbSHUK
 O7/85zTl/qYx0uWMAAAA=
X-Change-ID: 20261117-rpm-memory-non-wc-c93a6ff3e432
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794902765; l=1582;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=oPm/ybBtfQ0EkhLd6zSb0mHDUs8lvynG+BDZgwNHoSo=;
 b=L6gmiS0TTAbcTtsRWb406F5mGFzc6uGyeUsPkD5sNmr4Yg8lHFIib0zAyzEUEOWEl1bQWu43H
 5ZvxEQEit2EAyDaU0a+RUpMnFFAFt1qbJal7PLpQhdyihv1C9W4NFVY
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-GUID: P_WYVp9cCohq_4T7iVfX9z_9Nu9kEFk0
X-Proofpoint-ORIG-GUID: P_WYVp9cCohq_4T7iVfX9z_9Nu9kEFk0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX7MRuxy6DNgtb
 q19/Rt7cFCw0I9tg3cw3UUlFfphJ8qwvIXbSLR9jdX3CQ+FGyNO10V+o8E6X82OekO1H41cXkIr
 Oom/0Z9/5MZtDK1pkhVenGuouDOFp9fVERVXVSn/Xa39HV75htvolDGURLkeU3r/x7EcSRwxQgA
 egaH/qcUz70UHZcN9yQfhVkn+9dYAlKCx5EVqkL8dsVeaQUCfyMkkIJysoPThU+OisKlp1w3DU5
 k5sx3Oe3ySaFlvQi/dWaLGO2SvN2biLl3Pc3n8LkPaMTSowb+EYp78kXUV04tvn1tJKliJ/QLPz
 xgD313ONtE0CmMFNvYDNgSTvGZtlGAI7vuHhzKWB1T/xq9cj+KxOUZk6O9tSNzs5Y2+rIGkjX0j
 UUKzSFVLBTtrqICRVgljBdpQAF157NN6a4ubDXNaCpw0cgf5UHkg5myZwj6Tc6B66cXtiLd03wl
 2WXPYkXcXju97FR0LHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfXyrrI/ppNluPq
 JBjEE35R6P2K/6Jq1zgw7LHQTaAksScMapdFj9HugtNv1KNxhte0d4xrqe2qeRZpq1LLgHrYiBK
 MsqKhK0NAKsARwCzU1UappNmhtNH6tU=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc0af5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mNKF3LC1gVCpUj1y5nwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170032

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. It is expected to be mapped as Device
memory.

The "mmio-sram" compatible makes the SRAM driver map the region as
write-combined (Normal Non-cacheable) memory instead, which allows
speculative reads into the protected parts and results in XPU
violations.

Add no-memory-wc so the region is mapped as Device memory.

Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
("arm64: tegra: Mark BPMP channels as no-memory-wc"):
https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
 
+			no-memory-wc;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x045f0000 0x7000>;

---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

