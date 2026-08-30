Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD853033E1
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123744; cv=none; b=sjNpjHAB+kT4/zr8HF9hsMvGqaaqmPB34orICa4S7SfLUz+C/YU6lvEge9+fERAruG6/k0qNagXElR+qljD8hcHlUSzlPyrOTeeV3EgdEvMepEXTPDEEIxlAMlijqFoeixYLhMSptvP1U63PW1Hvrj/lnIdgVXCne0d3t7BYRk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123744; c=relaxed/simple;
	bh=7Sr0ab+dYWRjz4wIuuEKEDIV1V7YdcmwF6NgxLoEDEo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MjkvFTHy1IX9U0uc5rlAqF0PIQQk25GKg/EprwZXTOZBk04M9HQqicicWoUsl1L15EjMLVZD+1vTNL3KTUY1f0Sd7GLD7rH+784jOIhlhHw1wI0iBM4acWFPXTEL+5EgEyi8c6WYasNOQ+JCn2rEOdLdi9x37JNjt/5+fx7zWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eM7a4VQC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTLcd5te; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eM7a4VQC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTLcd5te"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJJOvj2048704
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=41H4AO1w4fuWk8KtkwtY56
	OZpRZ5mQkVwIFNwn3sVqY=; b=eM7a4VQC4MTEIDe6riIvBhPdi5wfQZJcjCr2UR
	/sTvjl144at3Rv8q6oeyyXTEny+dJ45s5ton4IBXtjjncWuqUnGWR/ibR1edL2IV
	e1HjTH2Dj9gr8yFDn2QNYqDU9ELSibJ7JL8zuE1cGl4bf99iJlb4g+NR85c9Pg89
	cVPC+UB9mh68fJ9QxISA+jXiAN+84BJrTSjms0Gce5WJYh29y362dHSvf7K1rMyL
	0aLr4Y3FatgIGbLZMEE+oGuWWfLnDuPd6xvAkiCiotVO2xMvHCN2gNkyfi+r6ZvN
	+DRb4Lqe1ZXYBM6xsg0Rf/sw7BbemS7jkfqawdkBIrDk+Rmw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfkq15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so4807137a12.3
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788123741; x=1788728541; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=41H4AO1w4fuWk8KtkwtY56OZpRZ5mQkVwIFNwn3sVqY=;
        b=jTLcd5teaoWwMFhTAZM+VujMU7R8xq2HWAo4wOE4C/EpCVM78UImM0a8cEiXdjAvb8
         zW9jbgbY4z8HvzHD7OEP3ijIj5kAx9uMcB0Ly533v+VVySLH82iQgIt5L424ZtJ1F26g
         Y2n/FatdpcmOUYRFvHNbZJCtBmv4Ty3j8VNOOCJFWW162R7V2rc5dIbGawbxH0XA3foU
         dUv5Hemh3U2g/Oe+Z0656zdbqyiJiDgAhbP2tel1A7CvQ3NyklVRwDy9Ni1RkZGZUwox
         UitVhj5nHodChnsJbHh8cx4P2vKNQAfFB11E20yP5wRfqJ3yvv1K1wmRrrpm0/4tLdRF
         oWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123741; x=1788728541;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=41H4AO1w4fuWk8KtkwtY56OZpRZ5mQkVwIFNwn3sVqY=;
        b=r3bPS+QZWR6GS6U8Sueptqh4rAdRfHymG00D+ni7R+FmBXV6CDf4HbDZhYlFy/42gF
         Vzow4Lu6K25BarwsCZ6gRSjVvMnUXd06Nm3LuNo28KQT3Uo8YIUqVKo8RhJtJDT2YL39
         x1IEj8kWYWHeqfUqwDvekSfk40xt59ryEiR+MKcfwp4vLSP+kYSjJv2Lm2K3/6cUeh1V
         ZEEhr2CuThYRq4VALkbAn8i4D0suyGTLBmJKfrNiOn4PNLF7dwhQibC/dsOz1FbL9TEY
         cvgiKE0PHB6iooiD0P3H5I5DyB5zEr0gzj+HE63luOw98R3p2jOFUtpdlNvX3sgvaZ1h
         c46Q==
X-Forwarded-Encrypted: i=1; AHgh+RrWNPIgWjlUYlZ00wFxRDQGO//rJrqFmfftF7r/+jUd1/DIVB1lvoOZygGQrXvkxr/YKqqdseCTVJJ7@vger.kernel.org
X-Gm-Message-State: AFuF++mfS0l3KCzRCxBI7AoC8zEmUFLTx5IVfjlXw6V+wmmtiPXRNyvb
	VyAprOjlZeyhyvryYfhQ0e/bw81OIv5xc/7YjTD8JaCUTALvNAZOxP5AlqOX29N5NWXq570TKKa
	ZZYzrg5jqxOsR8UQa9CuKskqxt97/Dm8k5CeqdvO1tQrEixFVKDmo2DQvjKBUHPy8
X-Gm-Gg: AR+sD10Roa85MHLZO82rB7NNKukVrUFuz1vIg+VonRKTfWorDnEWboV6Yu4Q0ld1rDS
	PrBNIknxbwVHdmXgi1GwAk7UCktxXDWtAjDGA3hk8zRTTy033k1P6NR4BHM6g775n40s2XpTEH3
	qCVUSbft7aUuRTSBY/6Xk6gpa8Cm4550sAZtVuJmNBMrv5qieyX4KeLGbIqfccsplAI4Mdim5Aa
	83+ki6Q5beblRwb87/+cnrz2PLXPVc+2wULzPwHniAvJJxy9x4+EoNSBbGaV4Ik4d/FBwpVB+It
	o+R2tuM4bLEXI2NKUkLpUwVypcT8RvL4y58V5DJE3lq2vGH9CL0VtT4WjGXewZ6NOFsQhx5Be+x
	JhHaz4Tck9C0De1pIZEvuKp59hto2f43Wx2RWQEJI4A==
X-Received: by 2002:a05:6a21:e58c:b0:3d3:adad:f172 with SMTP id adf61e73a8af0-3d3adae1e5fmr21711284637.20.1788123740836;
        Sun, 30 Aug 2026 14:02:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:e58c:b0:3d3:adad:f172 with SMTP id adf61e73a8af0-3d3adae1e5fmr21711197637.20.1788123740376;
        Sun, 30 Aug 2026 14:02:20 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm10980013eec.2.2026.08.30.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:02:19 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: hamoa-crd: Introduce
 thermistor-based CPU throttling
Date: Sun, 30 Aug 2026 21:02:01 +0000
Message-Id: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5EQBBA4atIrVVSmCCuIhaNal0SP+lCTMTdp
 4flt3jvAmUvrFBFF3g+RGWZA5I4gs6ZeWCUPhhSSnMqM0JnpsWgfhU3x35C235sSbbPi4IgVKt
 nK+dzrJvXurcjd9t/A/f9A0RxsdNzAAAA
X-Change-ID: 20260830-hamoa-sys-therm-fb4f80fd6770
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788123739; l=1475;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=7Sr0ab+dYWRjz4wIuuEKEDIV1V7YdcmwF6NgxLoEDEo=;
 b=93gurQhxaITPLQXZs7Jj17EaLzsGUflX3cX4ZGl/cZ2KHeAruFtCRrSSJOsKztjwM/F96i2TZ
 LRESroHgdTGCH8G8h/+VMw1g/yWpf7TeF3hiV37t7JKEfZpc2gGpXo/
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX8ZWD1sKRYqUN
 /QtdgigF3Cbdoooq2mvWCh7OIudvwAnskw5qC15uVR/rMwDpwA8bVgPHc0Xmmodhcr9YFU2+loi
 9Mp/yi8zkxrSUSnC55yvVtEuzMpqPmZNYRcUPuoyuqg8L2BuTX2TcmgAW7Qk2dXuumlhCQ8woOJ
 HpknqY2cKZdzL+vHw0Vx/54E1txmcu8vQV0kI4tLtkf+h0Rl8tJcbp+9GjTLD6GVNu/lusu6jhT
 79BZhGRNgjodtrvizPN7Lg6qrz4k5lGPQ/IXUpkv9cfDR7KR0+dBxatNAg4HEViMwTEEsVaPq3o
 34U/3hCrtxKkWn9F1Pz8zLpiQodo+Ei15Vz108ai75XuvR6kWwm7DJx1nLIC+jfTRVmlWyzttMG
 1Tg2aVCUNMwOPQh/Fs1Vgn//namupoVac19x0iQ1G0RzTW4+HcnPkfoHIuynWEZOhoFIEquNdbj
 Q3O/wOAcDlK5eBYvhYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX0oijZEKjN162
 8yKDvr7WeNmCjYOaoMZj0C6elhDMFy3mrp3s2y5GA7R/RnzKEPuzCQIj+Fbh1zEo0JSV0WsWzrg
 7Jklqgs+OQcHoNkI6yvrStKHp7v98t0=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a949a5d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8yBAbjwBbfdicugfQZEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 6hRuxpzMXV9q5jkqxHE7e_wWiIr0c34M
X-Proofpoint-ORIG-GUID: 6hRuxpzMXV9q5jkqxHE7e_wWiIr0c34M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300184

The Hamoa CRD has multiple thermistors throughout the board to allow
measuring the temperature across different parts of the system. In line
with other platforms these are wired to the PMIC ADC and thermal monitor
blocks.

While "limits" hardware management provides rapid throttling of the
CPU cores, software needs to throttle the system e.g. during prolonged
CPU usage. Wire up the 7 thermistors found in the CRD as thermal zones
and throttle the CPU based on the "keyboard hotspot" thermistor.

The same mechanism is used on other Hamoa-based boards, but the
thermistor configuration and mapping is board-specific. As such, these
settings goes into the CRD dts. It's plausible that it could be shared
with the Purwa CRD, but this hasn't been confirmed.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc thermal sensor provider
      arm64: dts: qcom: hamoa-crd: Add thermal control
      arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor

 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi |   1 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 116 ++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig              |   2 +
 3 files changed, 119 insertions(+)
---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260830-hamoa-sys-therm-fb4f80fd6770

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

