Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236E3749FA
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785924; cv=none; b=DLfoIpX9ejPICWW4h965DrrGYPTMTkppBL2cUJgmq0CJkJNQTQawY6pvzatWHPm1nNZekqPSIUt1BpLtAc+mO35CqdJP/h6nMwkjRpPyirjFH1i95nqQpToTUb+BA1wtDjNZFXiLVqD2TM7E4YLTWaGNdghzCLQoEypv94h9KBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785924; c=relaxed/simple;
	bh=UZl+Xr/7G6C6mX/J5Wg0PTR2nBgIyNFzkYd/5iOizZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGyPEj5hhjib9RGFBaxtf3Q7ehrzOOQ8kwEBYYyNOQFa3OetdPnY0xj7YDxqjoS6gvLM1NIefYKDGMSwvLuMOSdYTR9A3Qf0Tts2hk2VGKdOm/1r1O2o+hDX2Zk9pKOEXwxoAEnRKz48cK6YR+y1qV/p4LjmGjq9FcufQ8hPXBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=km2ZpVjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQgmjNd5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="km2ZpVjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQgmjNd5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55gA32355009
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cgb8T5QqviyhnWSfdQbwhiN4MZriAxcNyxesKYm0+8k=; b=km2ZpVjFDHQ0L4cw
	DfLvoh5NrIYbIeSIh6ffT9wiVxvM+ZefgSSLIVEum0VgcsFoxzA9l8iCXj7VMZpq
	+jXBtVoDV5dovSVVYYhfOsVeD7MZwhvMliWBzHSn8rnwFaLhJio+ZyqVAFhITZe8
	kEnvUbl/CDDIEfLRu2hFYfjNd74T1DtW5h5mZl6AtgYGufIJmwMzhwObkLk3kI9X
	J+M6FwNO5CyyqFTpN2t/Hpl4GPlv1lgcCIN4s/WFSsiN+ShcWuz1LrE5h7Xs8eiw
	NUotnC+bKXsRh/yQrfIUzE6cCVs6flIozQcIt6JuD538KIKVdq6VCHjVtDSGS9fi
	8DRtoA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7casd6ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0e92d64a1so1267520a12.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785922; x=1792390722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cgb8T5QqviyhnWSfdQbwhiN4MZriAxcNyxesKYm0+8k=;
        b=gQgmjNd5YHcOyw8VIDqOXRxlcyUXe/0R46uQaBVitRQYBejA30ptcjqxquDQQemee/
         sgWBrAcFGpMPHagsZ4ksF2jq9597MhEiNXyKSsMNjPq5VtgZ6BZ5RTbgVrOsxsLdMskU
         ztw6nZgX5hoFPy6k9K3RvWGbdwVMJlvXIbwEAisQiigXhfEPWwsSYMeOhTs9IBOz+C68
         OCWhPOTvBJwiN+lhCj2WJJveyWsd+EDwn6jmeH9fX9Rp5Wp8j1xNg6rtRWqPBM91ODdG
         tdQcbm+cplA3KUlIozoJvooAy+Lx+dKQaqe5J3qoGrKnlY3sin9V2eBDo/XnwQjsnxYe
         KNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785922; x=1792390722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cgb8T5QqviyhnWSfdQbwhiN4MZriAxcNyxesKYm0+8k=;
        b=ogdjpP2bsHfPhc4QCHyDrHa8O0ENdhWUayE75KBn+h+OdlXOo9JCKhrgq8EuQPL9a3
         Sx/ke5V1IuXd2Ed+K4QIqsneKlTZNCccXFc1yf5pSzFFHMTinRTezweLyRQcMFtBzME2
         Cqq+v++oRC13E+umLrxeVKn3LpnKAFeN4jJnBB/xbgtTryxFph1IQtVwGHm2aR0ZxZ2o
         Jg1R/GcaI20GMWIchnVn/Od0wQUwG3BmQRMXFZrduVu2ufp5ISQJd4xMQzc+Db8Uhwut
         rBkBDHzkS9GFWb6RILiMSKu7vTgs+PWmEwHquxMuL8bHqeB6xf8fAIAnAxtLVwppuXae
         kLxA==
X-Forwarded-Encrypted: i=1; AKwUvBydKFC+3I9J352G4upCvb0VQdW+xgVWqyOc2qOvWw0ez4O2ZjNvVb0U+EbsdU3Nyh9PuzcyAKrvrfwE@vger.kernel.org
X-Gm-Message-State: AFq9FYJPWfuKuYg+3hGkd1ppm4EOiuhJh8ikZ6NRv7H22OzXuKzthXqY
	Dzu1j4AfxQ4TsMRmfgIjyNoA0QwgaoKCuhI0/tEQZuFYyM/DAkgM5hjtmaYrD3y0w01wYNy1pSh
	UPKQNVWrF+Jhcqj8vKzGmbNSluwGrlTsb/i91kvz1dxM/4Ciavrd+MqhYUdUpi6ZO
X-Gm-Gg: AYBFou0E7lVpKG760RH2wCGhLMeGDabHXSeporLn91lI98qu+zxHBr3R/KcZsqUR0zT
	RUAUoPMIpRe59J3DYEdXDdIOD6v/qpmKVzDzhmijUOp4P/viq8GSPIMhT4b6ZCiDxiTO+CKjlsg
	7gHmcl8Zut29Q6IufL+SRr+0erNU0oph9LDVFSRhOVMRtZ1FeyNl1jvRHOrXW60NndgJZZJRTpF
	ApmfrmOSUtMoD5N0dFEIN+PVeUKeWxTaXlPL+nsHq85NpNghi9ZNAhLYPlCUQVJMmgMnNK/oqK3
	YaDLb1ICuhq9ppiteYi+BR7cfHLIsx8kH63Z1kqnprdCA9wmfK9gKoby3sfyYyP1TlUteirD6nr
	iXOxkwseKs4N8abUYvMin
X-Received: by 2002:a05:6a20:a10e:b0:3e1:37c9:5ca2 with SMTP id adf61e73a8af0-3e164f2cb92mr5318330637.19.1791785922124;
        Sun, 11 Oct 2026 23:18:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10e:b0:3e1:37c9:5ca2 with SMTP id adf61e73a8af0-3e164f2cb92mr5318315637.19.1791785921560;
        Sun, 11 Oct 2026 23:18:41 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm3770481a12.5.2026.10.11.23.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:18:41 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 11:46:29 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: talos: Add EL2 overlay for
 talos-lyra-evk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-talos-lyra-evk-v2-v2-4-dcc9316ebb59@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX+2bjkuLmq0i7
 XaCA8WWTT1WzG/s2xOkzgP7aj0dYKS9MnxpybQ3ZE4PEq0uwWj1k4a3t4k8zaPIxV2Elik3YA0H
 UrLeH8TjrSbaHtXv2uCHtG9YGUF45Y4=
X-Proofpoint-ORIG-GUID: mrc8goqdVySoc-K0MA_s_ZxkxO9o9RIy
X-Proofpoint-GUID: mrc8goqdVySoc-K0MA_s_ZxkxO9o9RIy
X-Authority-Analysis: v=2.4 cv=eMWGH3p1 c=1 sm=1 tr=0 ts=6acc7bc2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lQNMhAPqQ3RV06eoAtYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX/5g7+bdSr/pc
 rVL7olQrkGq4Qrxa+MSdQ+cGN7XLFIwpr4ooGAf4/S/1asX+y+SfLWN5ZuFz5I3rrJCau6an4aR
 /wRih4QXtgE8z2Q8oEtK1ZHgHhvXhUnCpz3Y8OUUjaBwIJcFJRMAD5aDqitJBDjQw32bbCZ0AZP
 k7G9gKnOxr97NkELNn2o6l4EMYfCNwNRDb3HoUZenkOOf4z2s5XGBsRwDeVanF9qD/a4hyvY1x2
 OwWB6RYRyIWjNTwmtztIPACdQYwPjZV5rOqOKP+xkJaJWcB1Jc/KDJybsXBfCUXDVBmp2pZaFj+
 IbBO3kP2KIyoBO9MZFTr6MUFKyS1XRKL0/cAgdE+RdfDGMbiZKHoK5gY2t4rX4JCYDcdLk2BI+t
 USV2AKXy5jY7E1lYPP77r0JLPoRi/zTvLOKOOcR/0cRSyzQIiZqRE7atSL1UAabbJmZM3OLnEQk
 7tjHyplJCQ7hNizrlyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1011 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120024

Add support for building an EL2 combined DTB for the talos-lyra-evk
in the Qualcomm DTS Makefile.

The new talos-lyra-evk-el2.dtb is generated by combining the base
talos-lyra-evk.dtb with the talos-el2.dtbo overlay, enabling EL2-specific
configurations required by the platform.

Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 2f25575e6efe..4f8ca3112fed 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -458,6 +458,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
 
+talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
+
 talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-el2.dtb

-- 
2.43.0

