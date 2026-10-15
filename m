Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7463C872C
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031897; cv=none; b=AzNmd5WqXBl15p4v5t9m123rhRPgnBkB0eKxnb6Am8sP4CPQddSGDX9WL8b9fqUjv+5+YQ+ycE+QkJZoZGPe/orIeTzZhTZnWo+XnS4D9O42CZZlxvKBADjOz4I2yx+ZXxI2EUqlXviJyRhw9mdyeVVs9EydNWOL1vWrhUat5LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031897; c=relaxed/simple;
	bh=lKYzb7YYdmJaKslKIzocK1cc57OjHmqCM5YXFY6yF/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uyo0Fl45YstDxZOuONWAAp0Foyd7l5aJD8E1Fui490yuh51LiJGad0llvO2AsTiGHGa7BzlA2wNpSiwuZ/N2vE6sdqLlplW59Nw+/TnMZEkHr0NmIlpV9smIktrY7ivN7G6wKvRBwYDQVzTCkVRrO1nOTnejGASkLlzMFziQMTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E39yf8UH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcSzohUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E39yf8UH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcSzohUq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENJKul1682636
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i48kfPQPbtV
	IbL4fpRm0x8FXEQSrQZurIlrOJEcsoRM=; b=E39yf8UHe/JtQ6fLxHa1LxT8502
	ab28QhLHoRCoezctIp1Ii4Rmq9IzO683T3aEWubLW6XWkM8yfordwfBBeaZZmFik
	BnmURSgujuN3C8/HMhIDtamnRyZ5hz3qo9hiYhQ2KItThRLq2t7uNTWYuV5mebso
	liqVqH6YVQHXKSxytq74hdQm7vARC7Y9cfr1dLbXXt2n0MRRtxA2Sge0KdfCANto
	sVIy1oWxYtDg03RqeyNIdf3+LvsCRDJ8U2tFZ68/ZL7P0JIdUC9MzmxQTTlRFk7P
	6Ssa40LYxeqOp8zCXosXhFv++lzuEbJaTD91OcEYC/u0J3eSQRMdERllH7Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb028cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:38:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so9387511eec.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 19:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031892; x=1792636692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i48kfPQPbtVIbL4fpRm0x8FXEQSrQZurIlrOJEcsoRM=;
        b=BcSzohUq1YP8dcp8+gKsKOb3PoEaaSdT7+pJdJ+uW2VMb9VxsqkUaE1+sl182Lbqy4
         X5dxWWuSdrYjN7geW8yUeA3g4PDNQ98ORnT+HMAWHl4S1D3qkYsb1TyROCzQpyTZfNnf
         F4tgcklbnzepMsMZW3+AOzOrgkQuxvTGHEN5Xs8AzAwxyiUqCyjmdSAUjgtkIymDDEJa
         5gRJNihkUGI+vcOp8nXXqIrjPMnwlxiELizFbuxWpfkjuGUvTRma5aYD3xeWucm+uDGY
         rRXUkXfSCZVqVx1Mt/dOwg2H8hjgNR6WffzMPv07j8jn2qBYaprdUXpP7X2biEV9cQTQ
         HkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031892; x=1792636692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i48kfPQPbtVIbL4fpRm0x8FXEQSrQZurIlrOJEcsoRM=;
        b=KI9b5+oyncTyw1nWMUUnzyqcb3ngCegpcRYH93ELUvTUHliIgj0UmH942VlA0r/6C2
         yiwK94d34yWVUQU4zLLqnuOhAQZzMQF8t/7kuvv3Sz7+a+RKHcppGg6b4sYYQfuCaenx
         uXwEmtreNG9k6p6Hd+Q1hebE7S2yMowUBBBk927/cdR2hrgYCqIoAKLWwEMO0yX+0Aii
         DRgEh0ErkVuLDOpGN3/icEkwTNOy/nV0SSJOSs4JFcUQs/9dgCuSu0AgyHKs39KuCgJ9
         +CGbPBxDvo4CIShvh80vc4QTqPS+YPCc3XvHskyzmYPvWnVtl97ffEb63eoGyVJjWYaO
         IOSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAe0dHs+YlTEf1TJ70zdFFSqmVKZ8JJ1fPXHZC3lgX64qCLWJG5pMwLJtzDa6I0EFZlvVvAW0x/gIk@vger.kernel.org
X-Gm-Message-State: AFq9FYJggl14f09hBPP0Xau+o6Qwl/jXuiKt1riqelCFHSSZbMwg4A5Q
	ewQQhbKmrgBoBvkI8RNfDXk4hVy/cG89khDVeu2HnMG8BlxMt7u+uonECdRIHbiEurR0/R4jzA0
	Vvos7WkJG4tfqe7TyjadiQN5z1BdMxW6gW1+ROcZZUWgGEba8b9s/X2KBsPLjrItp
X-Gm-Gg: AYBFou1AhQXbjPMndcjxyeC48YfCeg8ck56Ge1orfzO+iyiBo40IZSG44Qu6du97+E5
	oLEcCeLqUqpLDRqIsyjeluGbWbjOskRJNS+IhyuDgl65PCnCUl/QVqy+2jA4RMsoFAoNbGHL3Wr
	YXEGclE6gl2TBOlhaav/41FER65IreCfX+ZhxQCwTT09FtnfH8oJG8ElC02bzwu8I96sps1DNWn
	dce3XV5YS3pq51g3tfgMGCxP1lSGBRjQlHwSwSxOAYnlgK6hArRFsthcjn/QlN8zzXnq2OiytoN
	w8kyTdoMAG+ccTf9VVIVciX6fwokOAqG8/sOLaMTrnID1QGZcpLYEPgZYOZPOLEymLgLcfy3NNm
	UZKlQStSSID6rZOGgRagJE28iNQTF4bB307OLXweL8fR8JlybRCxEWNX2Z5k=
X-Received: by 2002:a05:7022:b043:20b0:168:3243:c90c with SMTP id a92af1059eb24-17b74544aa7mr8547920c88.15.1792031892058;
        Wed, 14 Oct 2026 19:38:12 -0700 (PDT)
X-Received: by 2002:a05:7022:b043:20b0:168:3243:c90c with SMTP id a92af1059eb24-17b74544aa7mr8547884c88.15.1792031891436;
        Wed, 14 Oct 2026 19:38:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:38:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware and reserved-memory
Date: Thu, 15 Oct 2026 10:37:08 +0800
Message-ID: <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad03c94 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UXWPQYcWdAbVtZk0ZdwA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX0AG1s9S1mGrf
 xP+huTqBcFYTjiGC9fSPJK1FZ82Jl6hvUFxPl8eCLSGI5dOgFIhPU0z0dzb2VcR/9dWrkc+zIjx
 7BfGBu4SaChdMUz6M4jk6bJmKWkuHeU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfXx++hh9Z4Y4o9
 k0D549a8OHnaEAcixg8WQPe511mq1wa9nYXXMxVKNfuiUbJmw6rH/IDPexhdGXi93g+1EkNbxP1
 +wTDZGUyPF7h8mBh451vUK47X0jNhB3dL4l1B2UHLFO7jqKnPWyrprjWmKiJxoIG+4vesJJ70IH
 uFuksJzrTf2LG6uh/LfzWKlZgM/Yowldqp2U972PoNVcrG0z+8FE4LufhMqEWTKkHXY62Qh6w96
 LvA4QumfHctKLf4Ss71LCWEnPbRorl9AAsnNIzVZDekdw6Gbkpsiay0CHfqt9FIpzrkGwU9wMmr
 Acy+gjoRsyB5HynxA4SGIzNrPJFEDgiosMih0LwwchLzvo364EQ7cIt8Bo0/5JpD/U6imVBN9XT
 dZmBOpoI2Fr+aZdihYT0Zq5Q3kUJx0Vg7Dyb6uFvaY0ctRvjDBAtE5S/+G1qvtfwud5o+eUmI4l
 9mAI8rXuwXXG5h/TyIQ==
X-Proofpoint-ORIG-GUID: BgOPOi_rjs3yApt2vmOQnf0xuGGMeN29
X-Proofpoint-GUID: BgOPOi_rjs3yApt2vmOQnf0xuGGMeN29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150010

Add label for firmware and reserved-memory node to make it easier for user
to override the default configuration.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 821c86409c5d..c71b1a48c383 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -276,7 +276,7 @@ eud_in: endpoint {
 		};
 	};
 
-	firmware {
+	firmware: firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
@@ -365,7 +365,7 @@ system_pd: power-domain-system {
 		};
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-- 
2.43.0

