Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB55411A03
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572496; cv=none; b=O83I6x4vVhSo039TdQ6YRVWdfmfp6kwFGD1QutwIvWiD+mlAT8ElFa34o480skMj/Hjv0FmuTdKlxP2AumGBsnVW72cR81MMksfQjc18H9Bwd2uasXyZmi4suFZfTXy3hDYwKuUsfY+WAYKJAeKo315ueBb9dBaZNIzY9UTCOeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572496; c=relaxed/simple;
	bh=y6QpceeMy20RSRv9ZOcvbOYBvvo7BA6v+32UQ2/dwew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHjswDMx+iX/xYAnAFRwNCQKNJXMdTXfHFZ4Ak2PmMZo4N/Tgv7HP3RROHJbPjORLIAdh1L8+DrNScciyPgbwPzkAFz3tnYL+uAfJxE2BsW3bh0AdsEoC+yQxE5TLh+HDQReCu9Dx3xl2azpMt42IIOx3QY0kchVwDWW0Z68u8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfA6HKIZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQzOt6Pf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfA6HKIZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQzOt6Pf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMeMd3195023
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tlzfj1770514qfRZ7PsF7X4hGfiBwLLLf+aJgywLa4=; b=BfA6HKIZigADd61u
	X0X3EyJ0bEKv2GbaQPKAKeBhiqSHdOTbRMmjb6x1bFLkInikEcluw34hGuOSQ6Wp
	PrGZAtLLi8bZCmruYXbJfWCsgCERaedL5GY7v9UJOS3LILpUH39UthIP+EjF+oAo
	4F6KXo4LaSYN37y1uQBE1UouRG0vH3WPgUZry8svl69HKCpgfjiHQxgfIwrKkDMs
	Jq/NV3+d/pTy6x+rPYDpHZaVaEBrAhc3pndBr0RgaA3J+Iy4GX9ldxt8x3Xh2rE4
	1ADRiWPOc3a+Qfmu+Z05f2aTKlrhn2O0yl9cwQwMmp4BAlPxkIZu1gWTexekydd3
	m3K2xw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs2rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:54:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so72929661cf.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572493; x=1788177293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tlzfj1770514qfRZ7PsF7X4hGfiBwLLLf+aJgywLa4=;
        b=DQzOt6Pf9K5M7cwNmJLhLmfRHf65xNsmAxmHj7ABVehxO9LVF4qAfhYxwh/sLCVO1F
         PK07Qn2W5emQnnBl6Frl2VD6xrwJRutdprc2xcxKyysr0eiAgNm45SzF9DmiePoRUFCR
         Ieem70P78N139kQsHENs1O1uMCNANBEQRZTwGe3wt+n2A1orjnxjBibHv1s/I8JdYU3M
         JKBOTfLar/ECIec5BAezWPWRo3fmC57l6Ezd4OV3uWmuw9adNddjveCDJw4csQZK83G6
         bMNJByNyvSOAdXVlGT69cZ/sBq4c/+JXFAbSHIjcjvpMHle2h1SOGMiV76A7eA8bDP/w
         6n4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572493; x=1788177293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tlzfj1770514qfRZ7PsF7X4hGfiBwLLLf+aJgywLa4=;
        b=ra4PfSK8KaS9rrKVFT+nsK49cg8pe7IVk+lLEmBclxIJqb+ILzsVtFPqKgVe4RH49L
         F4LhBIA/U/l3c9Ik5doWjVw5Z0Q16rvoYA70ZnunHKHkoijpOLUrCFhqWkgq+vPQEp/U
         r829O2IrNSeEE13GacaLq0hJAW2yxo9qj0hpbu/rzmrAtvCZ9OPbHxJ9HjcBKMYmvmuX
         VxrNz1LDKQMcxH8buJUkbQ3u/9H320DglRQmkp5XbVUGW82mz++zBv5JhdCl4Y0QZNFE
         Z/J2qhvPILBfsAZTys5AH2zC9KQ1Z+gT/oao6R+4cTZcwB1qXakwD/l6JceWxTa1UOZT
         3PAA==
X-Forwarded-Encrypted: i=1; AHgh+RrkHBYcxJjyawTEif84vUw1M0QXx9hjZMLugKYwidqkbnfdk6YZ1x7PH4kpjAKhZ3bPdpuQWvnTVf0R@vger.kernel.org
X-Gm-Message-State: AFuF++lXmLUJSVbp1jQrVlggF/nPQJn3yv/KybiYqBUYzOdH+yuRBCwD
	XbI249WPpSB5O4w+AjRcERnFwqLf0/B6FvojvWbp81WWX+G8EW+BDB+Q5m1oP9uWJPgATLHaoUF
	//Rf6IJTe/8Wk9NaUfg2g+ZPg+MIUZD1x7eDwhMWC3MNLKhi7/SDZDMWpp6dS+8Qq
X-Gm-Gg: AR+sD11SSSSaS+QyTKz8B/4uzghrEwKFLvRbLFQP5sBy24R+CWn1iDrALJTxSZZ96lm
	yR1mVQw0FCHZ81jIj2/ymx/nnuQ4xM20lPq41euEAAvV/NhADwHa7FHCkHB8K5H2+ka9vy+iWS0
	ontcLimvobxZW7dyFcuGXOVoR/AaMwz9zJS7oYbThXoq15DPkrsbD7WvlSKpv9yfh8HlMsx3NCH
	Q45Q/VY3glTjcKaxCmkZaS3RRpVuSvGAGO5E2QgyOFP5MhtcKzanCpQzjoX9i/4eAzH8Y+5jzsb
	ED1NrlmpYCtCfpND2BKvElmCFGPikjdBeTKa1WWS35npxNhyjJF/kuon2yoDk2xbmD6So2GsCe6
	nwjVwZBUI
X-Received: by 2002:ac8:5f52:0:b0:517:875a:d634 with SMTP id d75a77b69052e-52e09bad973mr181298961cf.2.1787572492880;
        Mon, 24 Aug 2026 04:54:52 -0700 (PDT)
X-Received: by 2002:ac8:5f52:0:b0:517:875a:d634 with SMTP id d75a77b69052e-52e09bad973mr181298541cf.2.1787572492402;
        Mon, 24 Aug 2026 04:54:52 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:54:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:49 +0300
Subject: [PATCH v3 02/47] dt-bindings: clock: qcom: gcc-sm8150: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-2-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6QpceeMy20RSRv9ZOcvbOYBvvo7BA6v+32UQ2/dwew=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDXDCZvB3WmRiQrRST4Ur/RX3eR2iMrwoCeL
 7E4bCMRBdmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww1wAKCRAbX0TJAJUV
 Vig5D/9XwdcIAttugzVAi+uuiArRBS5eLIHNqN6yS3pP4IclR5cxtrmE2B+Gk9mZp9jp5+8AB6t
 28/U7iorOo+yYsrHUNEdhKyT6zyIywckNMhYH2RASve6+zUqEfwckcsStyT3aDlavRSCJwpgdU6
 kxx4MCe7jcQURwGkaEXLnYQ4q9syjuFywL7T9+xOKZK6+4TfvL3qDD/1MfELi6VNKxtgRMeicF/
 0UbF1VoKl/HKvyzROM5BMNR4J4ocgoeFLTnEPj849jsw6ciuKTAkvWa1Ik+Y6fP6y+HBQ1LsoUo
 bhVaVz8h2gZoxHHo4B6fi5fGoCuq/Ezvh9+dt6hyw1Kvznbm/Y6ALfTU0Yh4HJwDeWIX1naCalQ
 l/YuZDl7IK0w1Rd7NmU79O2w9lEb1xU0mETIl8u6SviGC+42azcUi+or1Txy0whQ8pyiF0fi70+
 AyjXEtdoKrpAUBUdvZxX2vekMaJnvAQaVBGQPNHJi1H8mROguypY8oXsRhWZ+QSVJY85/i89Kim
 1Hv2erpjy2USvGyZk/NCIIoQZVJKZA0vHB0/jI2aoYbaN7kgRkzyyf7nvpyE3/REKLeXxiMVHnQ
 yBh4TcyY286P/ekfwqJGNTP4pjpu0q1jz3AlbDJe0GxbrUI74C4bFZAUPNlR8BPLKTK21WSIjm9
 eZ3TZJnoN6AFkDA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX3/sbRC8KYcbe
 taWsRgwT530daR9AR4C7haZ2WOxIW3PZTxoPkiZdsBmv8HCW3S8j8F6LNgq0ynB+9PwiI3HJHjC
 fa3yK4IOMGWqyna3NRLYgw1lzuyhVFA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXzZRprokabjST
 wegYR6+e060KB2rnh7cgVFRAhImsQCpUsMR6JFIL4L17+3K7xyNVFI+WaGZHmBSBl4BW+XJruQx
 PuTwRpChGnmgT2wwbvNB7bOacFUA5uekLKuf1mjH8atBlSLjWuebHjdoV9JWAeBqW5Mvs803ZPA
 lq3fvPVWgsquJizg37i6OYSVtiUoCmihoYyBnKco7CUTTsaZeD4YJq+n90n7uBn5S3xqZbMWdw8
 UGyRnth2sdUGrxtgHLkNz8EvyAp3Wj2G52OYxAEDq33pmBuIKXp/1fPGn+yzvWZtoWj8nG9xwJE
 GSuokMOMMKLGQUFU1GNdkLGJYHLfX1guP1HDnH9eDLxXoyqbEcO81ccGula6PMJePDPeauOkNAD
 ziy/WZdjSBJMHAoeRacTXlQsFDvvSvZ399/9YBfhiyNSOEv9SbqWYQzFFMsuiVmq4maKczzkvpq
 qsjJxpcCulhVYkgBwkA==
X-Proofpoint-ORIG-GUID: af9paOPsKk1QNPd4EEWCKkui0POwV7pr
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c310d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Tb5SGVRYdzFDwN5jjesA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: af9paOPsKk1QNPd4EEWCKkui0POwV7pr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Describe the CX power-domain dependency for SM8150 GCC and require it in
the binding.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
index 5f3f69fe9ddb..dcdbcda2c212 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
@@ -30,10 +30,16 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -44,12 +50,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8150";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd SM8150_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

