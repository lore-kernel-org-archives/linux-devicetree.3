Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77481440A19
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789819; cv=none; b=Fr/WFXc83XGLskZMzZPTB+9PILbqy8/CAq/vRuGulBfz0qm9yMBJPJR7HmUiyrIyzCNlMcOfCy7qfh4opxRfpB9mf4gepH/4j+vboL89ccwcI1dNP8BxE3fUW+Wrx3OmcFuuJiuzRqA9V1+kzLeJU17ufvTzths36OUNOmi/t7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789819; c=relaxed/simple;
	bh=8osHfmVM/x10707NVXOB5jMsFNtRSzg5BZHUvq1PGuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mjZrJKrFzIcA+TtUaZPbuvX1sW30YRfpPI8+kksI7WSi1eUOp/z7znps7/zzFrncwtWtdN1OWEwwmdcblSOEkHSacSmvydiUvCwrIoAB8NX4HlL1T2vVgcS4Nxet+Z2k/qPTiQYvIk2jrevgwihuUX+twG/g36bgR4Db1lylhr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKMEqIZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aK+5QciF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKMEqIZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aK+5QciF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55or3751193
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I0SdnE1JeLoOPl1Df+hp1q/Qe/3xcQQMjLrpIfPXNZM=; b=YKMEqIZmV5dvh6tj
	ork9SaU+Dz7HG2wRT6Ad4sqXHWseWdY9/mRoUmCGwVWfPNucioSV2ZfTqGFnKVS4
	Wv7RBkr6eRxNxmW1AmPix6dsG3Pa5VCVTXtCHB8n96jZaqxd+AJ0+mhW/SLGDP+W
	ii40mwc1FpOXBUqtApJDw+9E7A3vUPBcK8asy6Zie1wKHH95XDEc3JGiyIdLdxSa
	INV5fwFfxtbZ3M0Wx8CWf86YguiVcMDhmrIeCJxWnpaTY2/zAtvE2pEsHoB1HVpO
	JMlIgPVO4NSxnJVXqMUQK44etEoaBCGdkDQ9z08LDmvee8E4pnkl/et50CryUzzI
	YT5/mg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed7mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a0c25def6so1713636eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789817; x=1792394617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I0SdnE1JeLoOPl1Df+hp1q/Qe/3xcQQMjLrpIfPXNZM=;
        b=aK+5QciFBSX9846G0iU4l0+385WBd9caftbKc2Q6HEr6xAZPmcuyiWwC7eeFpkKXVi
         PrXZ41s0TGBSl5O7FTx4TbLtE8JQi/n9S/EJCbMsE+FhxiTvYuJFfircugp8v2J84ltd
         3/4jzbziQ1dBICvHnXAi8bLjAkwsQRwaeJfHYdWJLrPMdnd93+Sya10rHPD59vcHdCa7
         yP16qT+J3gf+6MCRNiyrfgVgI2QYPan0bu+74PzJynZa0reNEiZK8zE/X6CfnzR1OtqE
         2xtj83oy2OY6V3dJ5t3vmpO21ZbFFuTICy8IxOObsiv5b88X/LtGpB61kuBo7RG3B5Oo
         ikgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789817; x=1792394617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0SdnE1JeLoOPl1Df+hp1q/Qe/3xcQQMjLrpIfPXNZM=;
        b=XscjSxDUmbbaspujTLaHVyn4MiSo6Q05YSiP0vKa6HeHdnVlEQflrtJWX7ubBTIm1D
         oJyaP83udLOeRWrl8a0A9EOjcbX+qM463PO+dsoTdOgQk/bpRxrroMqCvckteuhYumF0
         PcPEYQ7TtARVZW7yKvevLcG9NNWxaQPQJwgdtGZb6wzG3WLAmDfd6+sm6mCioM3Gqh/3
         Z7aJTuzQShxrkF+LCYlsUQrWNVqWzi35rxNL4t1AdVDliKz8PLV/ECETGatmsUXojpou
         f5VfWHYPx/G2TbJJpKde6NqcMHTmJrwFQ3FUxZnNwhihbwlVmyIH7M17hupyAT6St68w
         w+sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzke/NIockRAx4K1TiOIuHcogVzspHEwzQZhWzrNSn/ZXlIy97gSVWtpfw/Q0uoKdypP4FXhGTVDkfE@vger.kernel.org
X-Gm-Message-State: AFq9FYJjOjGPQ7gYNiMdT6oacYxZ5jciQ1lJKJPiJuMKbFpYDeItT2or
	CGkMymUBbpwutyW42tbNalM+WX+68eD0OF3+uA5K3Detit+z+TUWnmaZ0Bee7dXVs4/XlI8royV
	eqrM+AsDhvoiWayQgndCkU24LM96wieQ9lhT0pP4iZw41ZBukdiIPeF+5U9sv30HK
X-Gm-Gg: AYBFou36EMm9Oxi72GOHI7myVCcOEqQRPXoVORA79d55SHC9HPlCpCaSGjIfc7y84Nh
	lIdvO4LxslOcKBHjliTePOX8nPCSmfjJmx0wWVVMHPQofhXLazD7ObiKpULw6H0pf/SV4ncthqN
	07J2Fqi0KxyHuxm+NvdcLnpNGZSGEfz5U5TJ4DrB1VKkh4N7Xg4Wc9qjgB0M19lk8AtnALRYik5
	XYZAyyEd1JjLtqxR0JLQVofSK0IxT8QpJxqoMrf30VnfLDMbivaq6Is7k3iQ6m+0C17mL5vxYR7
	s7zhDz60/niPzfqHnvSKTFpqgKzqXQkOJDYc0NoQoKsu4r00CPwD0pgL5GqtjFbTH201TAK0lXL
	gsCoHPcAxrPKcq4ACaNi5k1LPaFqbLSLx9UBxDQnR2tw4Zjg8ikzNLert4ISbvcBpO/fK4Zf0Od
	5ANpdOHhKZGuBY7Frvqj8Yqnn76Axp
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr11555454c88.18.1791789817050;
        Mon, 12 Oct 2026 00:23:37 -0700 (PDT)
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr11555429c88.18.1791789816486;
        Mon, 12 Oct 2026 00:23:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:36 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:07 +0530
Subject: [PATCH v7 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-7-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX8fPYMvb9j7x5
 mXOghihAbZj6mbdzS3MjzL1oPbR6FaqABpBHnw9XPxg10/4rucbp4kX9TTPWce2e/WTWZu4sNPs
 mI+EK3dGXDqWxYVsMqhCCWzKQsSbfsH+6EsU8r0edCbog83PGlJ1Fj2KWiOVuWdOAk/2K5J2kCd
 08Vd8vEN6PhBZ1s6H2wqo/8MV7B2vwjkjxD10hm9FgeXFn3VYcIIsi2AYYUeTSrvSRMv+HK7bil
 oWScGu3mLhP1lIaxx4euvEujFa434ZFhpB+o6yEv1zkFLUlXMIkPkxPGbAh7iDo3NKVYv/mlJEY
 hJCFJzt7BDJH5mWOAtTJC+4aWTdpRUE+Ngh9JptYWdOIYGAQiWQX2EYhCbUf/bz7D90HzFlRMoC
 5odT1cRsF8gYhVS4Uvdeyd3fTUBOiUej4bd0AYN6f70DeVk0xqko93mvKCdo8ewTaiupOxxnRrV
 7KsSvWqgTVY2hbOmCiA==
X-Proofpoint-ORIG-GUID: uUe8IVgTVeO_c3_ztF0AOngWnIaZaJuF
X-Proofpoint-GUID: uUe8IVgTVeO_c3_ztF0AOngWnIaZaJuF
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8af9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HaTVWnLGvC5sb4-HCggA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX4o/8WoyM2gAG
 c+JlGuZRJn/QRzcEXBltv2hi9keAhgL6+lNKJv5/ha4Y3XQmk5LcNr0Y8QsD2T9gj934Y0ibP+x
 b3YSj4+MQz+oFxp3pzSKrP2pffldpGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Enable the support for download mode to collect the crashdumps if
system crashes, to debug crashes extensively.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index c14b42c22616..910196a23ca7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -108,6 +108,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -392,6 +393,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5210", "syscon";
+			reg = <0x0 0x01937000 0x0 0x2b000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

