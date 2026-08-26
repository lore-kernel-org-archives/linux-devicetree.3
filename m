Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7868E26ED3C
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751982; cv=none; b=Zg8mNzeBByg6enqBqqq2dtVn0mXzVnIzEBWJL4T9hDm/X5TjcOVSrsAh0d2f5pENUQKPsYIpDrxv08b9QfwyMAFRJQ1LKD7qlFRGfxeyvOpjIqTCelUlRYbl2LCBvMkbyQCuJ0gq2JXQ/t3W1djXry9TtsDQM84D9duLyom/Fpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751982; c=relaxed/simple;
	bh=q1/8tKnQ7WG/1O5wqs9Uj1fKmN6XOdjbcNUUWVfHMek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PiN85tmrK5YoQmkygs3xDrxaN9G6z10i0qG0vr7jh/nN+Z2VECiMuLpkJmMzmoGA0bR7o4DTbFCZDp95vBtkUZEnSyiXBs4QuscgkuT9rbO50WMceSTTG3twpkwHu27qR61nD1cUEEnqa9IloB6u7ppJZ79qjjofEnHt/K+AzMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3hshwei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmQxfAAe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3hshwei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmQxfAAe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBnMa3983337
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xryu42XUsfb3+Hia4BkFfpfTTvyqqe/ZdSGW8hsbJ3c=; b=o3hshweiH06amjID
	wjlhCdB+aKScpqg0qIpBfhQZWzGTTmSOOpx6vm9d5IItnr5VPeo3EkTDFycd/qub
	PlJTFwcJ9KpslrEHTDouS/T2/DWxFmsJtGh3gDaoevdVdjTXYCZIJj8zPuyJpqmg
	0Ian79ISQWIgGgYIHyCZC5sY8Eznx6rqXmsWlKPtUNhjzqv+3JpRZYRSIOaoII9d
	uZfqxMF48aDKHN9p6MRr/30iT+zb3jgLLA5TyAZY6ZRlN8PcA/JkgH4LAJVPGl4r
	qV4JaQ4Env0Gt9eH6xOmXJ+YByVevR+g6mH/o5VJQ2IEzGb1p2UkkEIRadPNg5Fl
	qAVYog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqry4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:46:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1638990a91.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751976; x=1788356776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xryu42XUsfb3+Hia4BkFfpfTTvyqqe/ZdSGW8hsbJ3c=;
        b=OmQxfAAeUXy6fpK0kWPXfmxld02eGmW8ukV5P4/gFJEQNIBtNh5aN0Q0rLB9N4wu2c
         oPf8hBxvOueyl2YyGOpmj71NoHEdOkFxlHaQVZV6AnHSTivyWDyAs/6muta4h4rWOAtI
         iqXCHGu+TmVlfNaUExD25oQbnMkYfndpZ310XCuS4T2p/ecV+gkKhR4XyPSjdqy1wEn8
         AFQpfJ7GXu5wC4Rx01/O1v7tJnMbdVFjRkF6g1FUnMTKZj43UgDpaO3kDrzs0547dyAu
         akJEJzSvK4hsCtbqjK0ZxMVsGMMQ1cPG6QNOiEyBCaA00xvIAwd0jVl6ojdKGTbGlBrv
         yVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751976; x=1788356776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xryu42XUsfb3+Hia4BkFfpfTTvyqqe/ZdSGW8hsbJ3c=;
        b=svIJKz8lw470zFxjHBJoERCXw0tkIJfa9bcvHLX149iU8I0m2jo0VgaqXOwwDywEfm
         pYI67EeqgdVbTQ3JvHP/+L8jdX4VSF75ZcPhshYDSY7kls5yabwQEXtwmigzSOhSmMlP
         65+S1Jmb1sPgKJjguBdBxbZV8ikvS6lvZRwCF7IPXpPkRUv1aSrAxhSwgU2qAdNbsCuh
         P0pII+4wUf79raYaJR+h0bX4jDPE/rkRCCpsUQpXNTUxWPORlpcTr6pYjDLTwGKC8sAh
         Skqr4fJjoYlM4giQFFoOVFkz1Epb8cK6FHtvWEacfiNpHaa7lgbdQ0xSpFIRCd9UUlB/
         GPdw==
X-Forwarded-Encrypted: i=1; AHgh+RqETJGIajUrRiPUErFFTf+pY2azP4mUqr2K5Txuccml63Zn1HRVNtDljfU1rUJ9xXHgWO9R4LY/fnyh@vger.kernel.org
X-Gm-Message-State: AFuF++ndQWUtFhVVVVRgDN85iCPAqgOGuJTv7YPezV8JpD0fodwB6z6c
	ZIXMoj8yQPKbfUVy3sU9r9zG9RlyChKhwnb8Vf8hy054KAm9ZwDyTfnLZXaI0qYUeCZ1hIkD+Pb
	78OkFB37/ufmjdVGnUd9LUGK9PRbZ09Areovm+UgUnJU3/xdg1YoQXKKoPm+cis8M
X-Gm-Gg: AR+sD12hJW7VPR4p4cPr3WWQRKqS0tNpowsJPsRrYo/mXpA2umB/F3F6Pqpg+uP1CbF
	uy1ikEpIqIcg0F6A6mc70KzqXN2TlXAVotLI90IAbYZCoki6SGC28ycDkwGWjym+dlwO+EoMDn5
	tBgoxQwI5jsGyJDHHg+DBA17YGNS2D60e5OoP9HnOkYVQsZGgiutQzp28LKKVA5RKypxrSomyxG
	9gaANZtXj673qtGRc63U4vRWGrs4E6KA2hHuA7rtw7gfbiwCO/lnO7YPcKX8s/PaFgfhOV8uAvN
	hB13HEhHoeGPFoGlqJ3xUzIRJiqm7szyROSpznSItEE3TrKXw5FTPYp/G0yKCXlgezGUVqCq1DZ
	MwTszXOi+KBlFrJbXT1Gqkp6S3YtLViUt4g==
X-Received: by 2002:a17:90b:48c1:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-3966d49469fmr14164998a91.16.1787751975615;
        Wed, 26 Aug 2026 06:46:15 -0700 (PDT)
X-Received: by 2002:a17:90b:48c1:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-3966d49469fmr14164660a91.16.1787751974220;
        Wed, 26 Aug 2026 06:46:14 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8179696a91.8.2026.08.26.06.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:46:13 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:45 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: kaanapali: Add CDSP FastRPC extended
 context bank
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-extended-mapping-v1-3-d046c1cb9a9f@oss.qualcomm.com>
References: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
In-Reply-To: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787751952; l=4712;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=q1/8tKnQ7WG/1O5wqs9Uj1fKmN6XOdjbcNUUWVfHMek=;
 b=bZieD1bufpZ1PXCwTy0U0DPG4i8ay90Xfz9dELIhPIGvz0yfjJ6YgGIJkm9q8YZh3ix5XTpYf
 kO+a4wPyt2nBtKmG0IUaBOculJfHlqjzyCrfhDErKAw+82NdD2qyx/M
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNCBTYWx0ZWRfX7gkVAS2USqek
 G/QNJYvV4y76RxueqnJXIZ0vwnl5lBF1TvaJO664cJKaW0Mv8K/haY3dKokeno20NcLI9B8ZEPK
 Vh7BJba9dQOEkWRNhgAaMa4YWePVAY4=
X-Proofpoint-ORIG-GUID: BE7Rv5uiISDumyPs6ewTr6FVffX0cMCz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNCBTYWx0ZWRfXxUXjat7v8y91
 SddR9fj7aiRNN2MKNFOqDUOD+ysOChzWUVKrvHKqSsL+udr0TFnoVw1ZNnYx6NLffbAtBAfNMCX
 iaFbpXtc2o4FarHKah6kup8vPoiVy55UNlcBkEXOmJCah4CweLT0kN5kQmMbQjYUGKYVZHHGMu2
 iZFpLoOliJ1uXNXLq9+p5PmLqyEfDnItFDpfua1v0+XU2Z7d67INivH/pp34/bIVgcL493z2Tu4
 Pf0ZBwfmlZ3HqKZVZxYcbefXZTs2X8J0qMAIqWrdFN/9234PFud5xGxb5QTDn3it2tt7mr2xXSE
 RsIWjQIxkwTkAIGy3lFYXTzmSUAabbu7Xz+QGTtD75IXB9lDiyCqjf8kajqOKjBPmXedfbZLSvP
 Ot5sf6xBmE0Wl/5M/dG7cmdbnkkp8FrRa5UOZx0uVVdi2HR8ISerTIR13nkCE2afee00VPxGkph
 iEP3RgvdlDewV8YBj+g==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8eee28 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QQLvu54LoOUFz5X0MaUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: BE7Rv5uiISDumyPs6ewTr6FVffX0cMCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260114

Add a fastrpc_far_region reserved-memory node and link compute-cb@13 to
it via memory-region so the driver detects it as the extended mapping
bank. Bump #address-cells and #size-cells to <2> on the fastrpc ancestor
nodes and update all compute-cb reg values to the 4-cell format to
accommodate the 64-bit iommu-addresses values.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 35 +++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..0f258eb2a7a9 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -451,6 +451,10 @@ rmtfs_mem: rmtfs@d7c00000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		fastrpc_far_region: fastrpc_far_region {
+			iommu-addresses = <&fastrpc_far_cb 0x0 0x0 0x4 0x0>;
+		};
 	};
 
 	smp2p-adsp {
@@ -6011,6 +6015,8 @@ remoteproc_cdsp: remoteproc@26300000 {
 			qcom,qmp = <&aoss_qmp>;
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
+			#address-cells = <2>;
+			#size-cells = <2>;
 
 			status = "disabled";
 
@@ -6022,17 +6028,19 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
 				qcom,remote-pid = <5>;
 				label = "cdsp";
+				#address-cells = <2>;
+				#size-cells = <2>;
 
 				fastrpc {
 					compatible = "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
-					#address-cells = <1>;
-					#size-cells = <0>;
+					#address-cells = <2>;
+					#size-cells = <2>;
 
 					compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
+						reg = <0x0 0x1 0x0 0x0>;
 						iommus = <&apps_smmu 0x19c1 0x0>,
 							 <&apps_smmu 0x1961 0x0>,
 							 <&apps_smmu 0x0c21 0x0>,
@@ -6042,7 +6050,7 @@ compute-cb@1 {
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
+						reg = <0x0 0x2 0x0 0x0>;
 						iommus = <&apps_smmu 0x1962 0x0>,
 							 <&apps_smmu 0x0c02 0x20>,
 							 <&apps_smmu 0x0c42 0x0>,
@@ -6052,7 +6060,7 @@ compute-cb@2 {
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
+						reg = <0x0 0x3 0x0 0x0>;
 						iommus = <&apps_smmu 0x1963 0x0>,
 							 <&apps_smmu 0x0c23 0x0>,
 							 <&apps_smmu 0x0c03 0x40>,
@@ -6062,7 +6070,7 @@ compute-cb@3 {
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
+						reg = <0x0 0x4 0x0 0x0>;
 						iommus = <&apps_smmu 0x1964 0x0>,
 							 <&apps_smmu 0x0c44 0x0>,
 							 <&apps_smmu 0x0c04 0x20>,
@@ -6072,7 +6080,7 @@ compute-cb@4 {
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
+						reg = <0x0 0x5 0x0 0x0>;
 						iommus = <&apps_smmu 0x1965 0x0>,
 							 <&apps_smmu 0x0c45 0x0>,
 							 <&apps_smmu 0x0c05 0x20>,
@@ -6082,7 +6090,7 @@ compute-cb@5 {
 
 					compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
+						reg = <0x0 0x6 0x0 0x0>;
 						iommus = <&apps_smmu 0x1966 0x0>,
 							 <&apps_smmu 0x0c06 0x20>,
 							 <&apps_smmu 0x0c46 0x0>,
@@ -6092,7 +6100,7 @@ compute-cb@6 {
 
 					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
+						reg = <0x0 0x7 0x0 0x0>;
 						iommus = <&apps_smmu 0x1967 0x0>,
 							 <&apps_smmu 0x0c27 0x0>,
 							 <&apps_smmu 0x0c07 0x40>,
@@ -6102,7 +6110,7 @@ compute-cb@7 {
 
 					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <8>;
+						reg = <0x0 0x8 0x0 0x0>;
 						iommus = <&apps_smmu 0x1968 0x0>,
 							 <&apps_smmu 0x0c08 0x20>,
 							 <&apps_smmu 0x0c48 0x0>,
@@ -6112,7 +6120,7 @@ compute-cb@8 {
 
 					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <0x0 0xc 0x0 0x0>;
 						iommus = <&apps_smmu 0x196c 0x0>,
 							 <&apps_smmu 0x0c2c 0x00>,
 							 <&apps_smmu 0x0c0c 0x40>,
@@ -6120,14 +6128,15 @@ compute-cb@12 {
 						dma-coherent;
 					};
 
-					compute-cb@13 {
+					fastrpc_far_cb: compute-cb@13 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <13>;
+						reg = <0x0 0xd 0x0 0x0>;
 						iommus = <&apps_smmu 0x196d 0x0>,
 							 <&apps_smmu 0x0c0d 0x40>,
 							 <&apps_smmu 0x0c2e 0x0>,
 							 <&apps_smmu 0x0c2d 0x0>,
 							 <&apps_smmu 0x19cd 0x0>;
+						memory-region = <&fastrpc_far_region>;
 						dma-coherent;
 					};
 				};

-- 
2.34.1

