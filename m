Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4293C5526
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966830; cv=none; b=GM2fSBRmXzySHjLfHMQ04YpZ9IT6IdHG3diUOZD0q+OE/tmyZaNQojv6A/TJsRdaiJb1eTKlF4DbYpDmG7aTOJGgWc2+E4dL3DCzOA4ahVy9eff1TmFOtlCT7sj+89zb+jux9AQJdsCbqIR1noh2Do/mwY7yezIT68GYX19kprM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966830; c=relaxed/simple;
	bh=VhTqfkkMQhd8FYkjcpswypDwlwspPTNc9xO7Y0w70kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T3/avZzUhkwWla5mOmV+7pLm/ZnX1J4t4Jl9w4V+k0BR6ZwVB7XOHrvYzbCaDMM4WaHVanpwYr3h8KixAejQHimwBW+inlBL75j1sc+VoneOJ4OXldWOLBwAGV7dyFcGekxpB08mg3ILUBY3nBvLsyCZzaBXGlufak66izQ71Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/nHU187; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RC0XtA8h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/nHU187";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RC0XtA8h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644M065F1960774
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 07:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udL9WX9i+qRibq7xQkeNL5ESzGcURWui+twSW5eyu3M=; b=T/nHU187QdnSSA4c
	X+R+qpj1xS0acD+WG5Wf2QusnXD2WZg6Yb1kqvmrjKb+z7w/dNdkr39KJ5Hn+1V8
	qSCsqav79SzA8V6vVSRJqQAq/egoNayWOcxF6GlTiqZnAfMf+VbHGqGeDdsC7c86
	q6r7iiD7g4jZBGYD4ULrKwL7CwF+gxwN2nsOY5cTYOC4or4FS1VYRCwfZwpBQFAD
	HX0gjL6rDCNnI31SDhf1pwwFVuIBkEkKHJB39lrVCR3k8ff3kmMEdkM5MtBV29lA
	ejkWh9s7/9KjLaiFGtEnrSL3BSmbf1xfQ54DOVybZt0Lzum62wbHFSePaDbXZd1f
	uWgexA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5du7yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:40:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b99eb06178so90616135ad.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777966828; x=1778571628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udL9WX9i+qRibq7xQkeNL5ESzGcURWui+twSW5eyu3M=;
        b=RC0XtA8hbwGKphqxavtIg9sQ1FUZG7QUrXt3WgpAP421kzTaxI1cBq2CNxculPHh66
         SBXQGQfbUQqhPwqBtMQT8r2JD9ZlpGMBYw/pZJ7T+vIufl3gXuG9DG/faWNCRMEgjbJ6
         nZYUTZQ7yY4Wyk0KTtHhsx/kkwmSyUsJ5fOMS/uy93rJA+hQ380XZU/SQn5JCZ9N3dR4
         KL7w548jksLqUpd329K/UOXUwm65JnXZVkiJfL13XmpfdpXWjQ2u0H9FNBRM6BTwtZPH
         oyRbc5Zm0ufshY0cK934/VhTfIXclS/dtQeWzdddav91TfL4fe3jPboczesFPD/v1Rsn
         JPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966828; x=1778571628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=udL9WX9i+qRibq7xQkeNL5ESzGcURWui+twSW5eyu3M=;
        b=jNBxgavcMOF+SFFEQaFUYkXe/qH93ciwhTyXlgtgzkOrB4tX/loKZgRP+T/wM7dyB5
         fSEQLAu+soPbW34o2G1/3Je8uCL0duJhwQWFpoYojsmTf3xgbss5D8TupGBqW+OETJtq
         Zd+oMOmUGRVPShy/meLiCUit47QgX3dqzqsr4Qppee0wVDaXGQuqQltuy18Yip4Vh1Kc
         jsv81UIJi+OKZRFel2sRMsua7KWevZZ+CRCZINgZtTsiJ1CIW0SeSgb5e5g8s1i+r9Iw
         fTFdMyaiJCMyV8+SybtmKtlJno1zGgeug5auB2mYQHv85V/5rAtyKLpOo8Cavt7R0cfZ
         +hNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Cn7Phr8jqiWHdgaVOhG923ZzPQg4snP35zTA/h9FUIiDaTZW6OSavme50zQsgxm+ym7yFjRFC3IUD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25NTbGyO9dDzF+kxJ5vSpnbO3dVdDrWzl8Dd+m3M+7/dGcAr6
	5gBM4dOBvZyCnRWNyP6qXy8dFM4M5KAA3YK3M/vA0/YczGnDMDCIyXGRSReslcTBuGztL7jBUWa
	F61tFqCeHnIPFPlwjVO6zxOG7PGWxr3iAnBDIJXVjvTC8Q64dxGVj2c9TKTqYBUyv
X-Gm-Gg: AeBDieuwb9GLiJUHrfD+M3K9tzwPzmI3yRsG5mQEkF5qqujCWT/IvKEupssRcy7ZhuE
	4geNvWTeyEr22JgAEjtrdYRMXMg7Ii9invCzRYIIccB73SaHL7aQLTi7r+R+OBwzSLDbPy1IYwN
	TtLwVtw82Un318CXfLh97sbsUSY+b5tSq3hgrOaHA+SHKNx8/LLbJKiBPrj1L9abFJydcVs4kue
	Pnq+hq5lGTn/jisv+8jLhKTqudBA8hbpAnbuKrAMiig6oOBj9eToKb9GYhq/Ye0Nk1Mg+ERIBZo
	js2SJfQP5FB3/6H0IOcgo60yVywgOFYOJEDvn/CjMyejl7sjnexIdEbpJVEu+28zkalljTtqjgh
	0lUd7K0r2HlI/A1vIvu19k15nafHDqzNR1kXZ/Xpy0fPm+ux47025dVBCrg==
X-Received: by 2002:a17:902:da4b:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2ba5388a2d9mr17357675ad.34.1777966828244;
        Tue, 05 May 2026 00:40:28 -0700 (PDT)
X-Received: by 2002:a17:902:da4b:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2ba5388a2d9mr17357185ad.34.1777966827742;
        Tue, 05 May 2026 00:40:27 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadb1esm132663405ad.20.2026.05.05.00.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:40:27 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 05 May 2026 13:10:04 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: glymur: Add crypto engine and BAM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur_crypto_enablement-v2-2-bf115aeb1459@oss.qualcomm.com>
References: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
In-Reply-To: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777966811; l=1767;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=VhTqfkkMQhd8FYkjcpswypDwlwspPTNc9xO7Y0w70kg=;
 b=jnk18UAmmalZ9GblsatNuBsexUjsLEXa1XZaF/a96LR2qQg7mXsno6jRcWH9d2vYEq6RdxLnS
 o68I6l4QrOrBvNQ8cAaZM7l8mYVKsaGF6ZBqOh8foSQCsqZiy43SnCU
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2OSBTYWx0ZWRfX+a8p9ZK55D7W
 OyakX09384IZosTMhEuslK+Ot/0LKtFFELaGZrJ3cOcJqiJ/Z+RAkMIQLi29ecMQNmsGJM+y3gq
 o7dPXKXLvMSXSeAqbGpzvfm6gGJPL17WlIS5nQRgU8V3M434Z6g+21+Rriqd8ZqCKCjS9fDXzqN
 REcOhPcOP20Ox6aHgPVF2e1IxYD4b7Aoa1jptZjWRw71Z5hXTAcP2rvMIQY62CA30nFWKzb5x2Q
 oUuMxsGUCFyEyqB+hDo69l1u9DQPLP/m2Ta0cXZ+oAo8qUL8fIURbG8CFbyP2+pzJd/+aMVs967
 PiTUT1q2t3vk3urBudB7m2PhCW9OvPzVI0Rqjv/5pSPZ4Y0D/VE3r/KamPAT5x4Z1olTlOKlCyh
 xBz4oY3MO1N6xPbDWoKKBZZJqH+nIRR6Ob6UCR+0LOlCYpgVTAGjM9Jn9+ftqqNM35VwJ6jYv90
 l94n1iYp8jDe1ahGXog==
X-Proofpoint-GUID: njA4n6cPptTeQhxaNWaofn6K-57RkBY-
X-Proofpoint-ORIG-GUID: njA4n6cPptTeQhxaNWaofn6K-57RkBY-
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f99eec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FLCKqCdKcypBhwN286YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050069

On almost all Qualcomm platforms, including Glymur, there is a Crypto
engine IP block to which the CPU can off-load cryptographic computations
for achieving acceleration.
The engine is also DMA capable due to the presence of an associated Bus
Access Manager (BAM) module.

Describe the Crypto engine and its BAM.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..349da9966d52 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0x80 0x0>,
+				 <&apps_smmu 0x81 0x0>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <20>;
+			qcom,num-ees = <4>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,glymur-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx",
+				    "tx";
+			iommus = <&apps_smmu 0x80 0x0>,
+				 <&apps_smmu 0x81 0x0>;
+			interconnects = <&aggre1_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1

